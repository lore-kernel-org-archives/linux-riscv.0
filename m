Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F166C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 06:18:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AA9C60FF2
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 06:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AA9C60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nksqxF8GS6zBf97pvN+KUGOMP7hkQ8PwcpSSoF7hcu4=; b=MSu7tmEbxQ6xpr
	A4jfnhDWGVnBoewIuuq7G6IZnyVfKg8Vj4B8k0rdsDKNNMH4EEPrlTDqlNJRnasYCqdmmxNLwgNEZ
	43NK83KNg6FtHiAaubWr/yppu77KKduBEdA2SUHKh8DE/zCmORd/TPxYjoUwBxi1Vaaqnlx91R4Tm
	SPSn5I/BoHqlbQz3Y+lh3LcUjUZMD4HLb0NvYeeKL3Tj9tsmfLfpAbZYCQGZjvZ9G3Ev9qq4AHHG1
	05HGBbsmVqq3/Cv57NKw4jj7I3iZGdU8mcqePfdCNwBOVFklxNEebDaC5YkDLpVmgvOdYm8ptoAAJ
	aqKfHoSZJAuHSbQXsN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mau3f-001g5Y-2A; Thu, 14 Oct 2021 06:17:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mau3c-001g5A-Kk
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 06:17:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17CE160EE9
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634192256;
 bh=9oRf2ywKUYIx9o4P7Z9GQDY/5yvvnyq8Qo14mUHKz6o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U8wjJoIKV5Hx3aW6Q6rZnn35Yrjt/wE6irpvl5z5PZSmYEfRYGANoemBq4D81hXsY
 UFuEZCYi2sQyM3ZkpoSXxSPoJwRG5HCFctBFG+2bZ6c9WntS4FWwnbQCYWP6y0yD/0
 i7F0rJeKF3Xku0aN3iFMjzDfp9+v3ZX1/NR0V04TCPT2MqP4u8xOH6bG4izJIZyHzU
 MBw/3gpOjDMeK+vX+PlgL1zR496NCZ8G7lAHzYvE9mXB2TJx10J9EO9mtIk5JG8jgz
 gHyrRLV6nvlL3NXZWmMY359+hlRSTnCrkmXsEsSmAxo8VMHFpdbgRVhgMQZ43QtF5g
 aoTSrelBZ8TGQ==
Received: by mail-ua1-f50.google.com with SMTP id r17so9177867uaf.8
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 23:17:36 -0700 (PDT)
X-Gm-Message-State: AOAM5336JrkGfLR26Jzli4VRrL64hNM7QW9bFPFvRyfSAWqF7k+0lAUx
 xfoysccxTu6h39HkHr5vwP5W/fcWB/g7IA6RXFE=
X-Google-Smtp-Source: ABdhPJy6HcIxxoCBhV2jnJFZEl6tEFCL7dsdKK3UdQZLgOOtj3+j/A82aXHYoUu1VLFxDyTnn++CBhliEQ++2d2v460=
X-Received: by 2002:a05:6102:32cd:: with SMTP id
 o13mr4702722vss.50.1634192255197; 
 Wed, 13 Oct 2021 23:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211013012149.2834212-1-guoren@kernel.org>
 <4245323.jvX0RauA9x@diego>
 <CAAhSdy29WAXfBz6Ag-kAjNo_uhJO+AuC0e-UyWhwhaCmrw7pjw@mail.gmail.com>
 <4027415.QZv1u5a1DM@diego>
 <CAJF2gTTDZ0QjY9JL=U61=ubWrGWVOe2VBbW6hgzsHqsePgN0Ww@mail.gmail.com>
 <693a609c-4278-84ab-8a9b-448936bb13d0@sholland.org>
In-Reply-To: <693a609c-4278-84ab-8a9b-448936bb13d0@sholland.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 14 Oct 2021 14:17:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTpxq_mdVtKZo6DG0CJcawJbZaWnHGokDDgm0WewWi3XA@mail.gmail.com>
Message-ID: <CAJF2gTTpxq_mdVtKZo6DG0CJcawJbZaWnHGokDDgm0WewWi3XA@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
To: Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>,
 Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_231736_721811_452E8B9A 
X-CRM114-Status: GOOD (  12.92  )
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

On Thu, Oct 14, 2021 at 12:21 PM Samuel Holland <samuel@sholland.org> wrote:
>
> On 10/13/21 7:49 AM, Guo Ren wrote:
> >>>>>>>>        - const: sifive,plic-1.0.0
> >>>>>>>
> >>>>>>> The PLIC DT node requires two compatible string:
> >>>>>>> <implementation_compat>, <spec_compat>
> >>>>>>>
> >>>>>>> The C9xx PLIC is not RISC-V PLIC so, the DT node should
> >>>>>>> be: "thead,c900-plic", "thead,c9xx-plic"
> >>>>>>>
> >>>>>>> You need to change "- const: sifive,plic-1.0.0" to
> >>>>>>> - enum:
> >>>>>>>     - sifive,plic-1.0.0
> >>>>>>>     - thead,c9xx-plic
> >>
> >> isn't XuanTie the series containing the c906 and c910?
> > XuanTie contain two CPU series:
> > riscv: c906, c910
> > csky: c807, c810, c860
> >
> >> So maybe
> >>         thead,xuantie-plic
> >> for the spec compatible.
> >>
> >> So doing in full
> >>         compatible = "thead,c906-plic", "thead,xuantie-plic"
> > How about:
> > compatible = "allwinner,d1-plic", "thead,c900-plic"
>
> To follow the <family>-<soc>-<device> pattern of existing Allwinner
> compatibles, the first string should be "allwinner,sun20i-d1-plic".
Thx, Got it.
> Otherwise, this looks to me like the right thing to do.
>
> Regards,
> Samuel



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
