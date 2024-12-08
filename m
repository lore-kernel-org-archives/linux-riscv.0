Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4712E77173
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Dec 2024 18:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQk9601fV0UJ45hPSpKw5BPdqgOwOiHCyLyP3c6jP54=; b=e27B9vcvfcVUYt
	UmRvqAUJ0qV62uXI8kLabusjboAS07DlCeZ7EwK04+6y1Z1ZPCOoj4VvIpsRJoseKOOZxL//sF7na
	NCc30ZtATJDqbTxKtAL4bglt+Sl4irTVVOLXht8Dy0VpUmrAtaLY96A2JjOoOkhYYG4YogQeFVpmG
	E3AJZvj/RCt7I9yilxcL07Gr6z8GqQ+Znpr4bhMcbuIjdvjcevTazYaNaIr23Y/ZFs16wKmdQWL2H
	7ldWH9Qvg0NSLyF7ueRhuHgm9/lC0s8d3LCzm2hEvq74HM+orbjxFXjB1NWK/mQjVGd9clNQirYWg
	AyF2DZlJBsprem35C/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKLrI-00000005gHr-389c;
	Sun, 08 Dec 2024 18:18:20 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKLrF-00000005gHP-0ADk
	for linux-riscv@lists.infradead.org;
	Sun, 08 Dec 2024 18:18:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2E3220004;
	Sun,  8 Dec 2024 18:18:09 +0000 (UTC)
Message-ID: <8b4a7f3d-0c3c-472f-914f-7e3971697d7c@ghiti.fr>
Date: Sun, 8 Dec 2024 19:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Albert Ou from riscv
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241205-remove_albert-v1-1-17eb850f1540@rivosinc.com>
 <Z1PihReuTF3Gx5K6@archie.me>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Z1PihReuTF3Gx5K6@archie.me>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_101817_255549_B5F3E38D 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Bagas,

On 07/12/2024 06:52, Bagas Sanjaya wrote:
> On Thu, Dec 05, 2024 at 02:46:19PM -0800, Charlie Jenkins wrote:
>> Albert is not an active maintainer and his inbox rejects all emails.
>> Remove him from the maintainer's list to put an end to everybody who
>> interacts with the riscv linux mailing list from getting spammed with
>> rejection emails.
> I didn't get bounce message on my spam folder when sending to Albert,
> though.
>
> BTW, have you contact him off-band, confirming that he no longer wants
> to maintain?


I have been working on the riscv kernel for more than 6 years and I have 
never seen Albert posting on the mailing list or sending a patch.

I don't mean to be disrespectful but it's not his choice anymore, being 
a maintainer is a full time job and we need that.

Thanks,

Alex


>
> Thanks.
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
