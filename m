Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C574C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 20:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BrTJ1MFkoH0X1EE6wYnS9aO9pnLBoPfwEJUvfiNsRc=; b=Vjd0tmutLB6m0v
	HpU4mOpE5JbhBNYRTsvwo799Vy2MLF9pkl8iZrGkA2Wc1g0/IuailiChjFaAWwr0g4A4u9sVoXUl8
	t89bBIJLbW4Y6Y3Nf4z26PPrR+yoiHZ+1khjhsYMWuD8kTACP7tbnrIWdj6WOGVZu/OM97R4TifVx
	1ht92h3QXkJR4EX50Cs+h7wkImZhs/30iv+dkMt/mNzHQ1moJQ5jDti4dvWdQd+LapvpCSkD1GX+7
	zE9w68NLa7EPerysom5W3QH4VfVMgGG2oYXeCQg4hb6x0XcYZRYyva8AwXkXQTmm8LBxRtHtsPAtY
	B4zE1+oSg8xh8J+2z/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAbCl-00000009m3Z-2tVT;
	Fri, 24 May 2024 20:07:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAbCi-00000009m2W-05Ly
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 20:07:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C78AA1BF203;
	Fri, 24 May 2024 20:07:40 +0000 (UTC)
Message-ID: <8b741144-8a3c-4a4c-bb3f-dfab4aa8e576@ghiti.fr>
Date: Fri, 24 May 2024 22:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Don't use hugepage mappings for vmemmap if it's
 not supported
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240508173116.2866192-1-namcao@linutronix.de>
 <43829e94-98ae-46a4-a3e6-dbabbe94d7c1@ghiti.fr>
 <20240508184641.WP8ok_Hg@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240508184641.WP8ok_Hg@linutronix.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_130752_229174_2BE93187 
X-CRM114-Status: GOOD (  13.40  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Nam,

On 08/05/2024 20:46, Nam Cao wrote:
> On Wed, May 08, 2024 at 08:22:43PM +0200, Alexandre Ghiti wrote:
>> Hi Nam,
> Hi Alex,
>
>>> Commit ff172d4818ad ("riscv: Use hugepage mappings for vmemmap") broke XIP
>>> kernel, because huge pages are not supported on XIP kernel.
>> I don't understand why XIP kernels can't support huge vmalloc mappings,
> Me neither.
>
>> so I
>> think the right fix would be to enable such mappings on XIP. WDYT?
> I agree that is the ideal solution. But I don't want to send any new
> feature to the stable trees (stable folks may even reject such patch).
> So I intend that to be in another patch.


I have been thinking about that, and I actually think that the real fix 
is enabling huge vmalloc mappings for XIP as it was an oversight/mistake 
in the first place. On 64-bit kernels, there are no reasons we can't use 
PMD mappings for vmalloc. So I'd rather not go with this fix.

Thanks,

Alex


>
> Best regards,
> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
