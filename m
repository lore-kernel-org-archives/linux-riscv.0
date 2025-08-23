Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7F2CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 20:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6oe0cyeoYv7CsJrSvdg0xOtXQ8lLyPgVay+oJ0NkoI=; b=t1LilfJc5oMnQZ
	+FTT133G5HEtuMK3CNXQ0YQzSqcr6iibvuysK9fWLbsF19TFd/qS5QGWaCLOuH18S5HmdCZwvXVp0
	4/my9O8ex2r4sd4ubu4E67rFqNEJcS2IWc+1n9Q7maEksQaTj+WOC+h0RwK0dJBeqi780S00JDGjb
	zPjtG4g+wnQPbZSbPtcxHFRErmL7T050H3qk/W1vNuXByjmpVUw7weoqINv4Tc823D5/IFgot32oh
	GStOwCSwja0BWGRBL5p65p/o2QUlgjifvpWA8UloSlJ8PqXUK/EP95Xy85LkR+DWrqk9WkmJzdao+
	1D6x0JupobuuBX5RQh4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upv3R-00000005HTo-2trl;
	Sat, 23 Aug 2025 20:41:37 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upv3O-00000005HTU-2lTi
	for linux-riscv@lists.infradead.org;
	Sat, 23 Aug 2025 20:41:36 +0000
Received: from [192.168.2.54] (unknown [98.97.26.216])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 4DDFBB4E0012;
	Sat, 23 Aug 2025 22:41:30 +0200 (CEST)
Message-ID: <a30e894b-cd23-46d7-9621-2fe039123466@freeshell.de>
Date: Sat, 23 Aug 2025 13:41:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: memory-controllers: add StarFive
 JH7110 SoC DMC
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>,
 Minda Chen <minda.chen@starfivetech.com>
References: <20250823100159.203925-1-e@freeshell.de>
 <20250823100159.203925-2-e@freeshell.de>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250823100159.203925-2-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_134134_845770_24834109 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 8/23/25 08:20, Krzysztof Kozlowski wrote:
> On 23/08/2025 10:58, E Shattow wrote:
>> Describe JH7110 SoC DDR external memory interface.
>>
>> Signed-off-by: E Shattow <e@freeshell.de>
>
> Don't send the same patch multiple times. To which one people should
> respond?
>
> Best regards,
> Krzysztof

Respond to v3 RESEND (this thread), or I may collect responses from
either thread they are the same content. I'd missed a linux-riscv list
CC line on a patch and that confused patchwork, and then I missed
'RESEND' in subject for the re-send series after the cover letter.
Patchwork sees the RESEND series now, and sorry for the added noise. -E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
