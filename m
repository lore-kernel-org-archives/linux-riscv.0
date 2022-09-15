Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABEDC32771
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 22:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZt1ZXrZA7dvSipLyFQ0zmOgbcoI+AAhOYgfJAt+s8U=; b=16ph5J4+Y/DcQv
	J2imLzjxAYRAxEY69NzJUQV37gSmR/ExJ/YRhmK1QVqzo7coNbtfUQqourFGANyKjFE4Trgys9d/3
	AS13NkSMHsj4UsS3cadT2cZBKGvb+PmYXgjhACp3t2TuTyFwYdbqXVkTsBmNux5+e5lddiHsR/epE
	5iOCcUKpvOLhqNB37W8aoFGMlTZH+sHibO/XKv32WJlFDRM2vRXvTWYrE7pk3rEAWKxAM4sM0sS3i
	BJyM60rtaXPzYjs3OGTG28Fjig93AT54n08Jaw6e77Px4Ju4hImWNDjKllUhR1HSKkRXKczkqyLGz
	95vx7Y85SaDVgr9NQSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxKA-0017ik-HZ; Thu, 15 Sep 2022 22:27:10 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYxK7-0017eM-OX
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 22:27:09 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-3321c2a8d4cso238488377b3.5
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 15:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NlxdPlGDclSVG1dP8Ered5Aj96QYeQaYTMEQCcdsZZE=;
        b=ZHooVNorr46gDUSPq+/8edA6CX+1L8cGMDsChOOIi+v5mWr+mXwPOJysExYYJyNIAj
         WDD6IGqhajlPhJzUNhUPqKUIh0e1HQrdguD0ExiX+mSjAfqXvjGawh/ReIqeMpi5uDu0
         LfbRrMJNU/yU1CnAtTZKV0TQDb6rI1jGSxrUTDBEtx9hXvmeaDuiOM/lDI/5Rr9G+i8L
         85rTrdHDFti1kMCT8+q3KblPSnapUTLL+RQ9OiBdJD04JAWp+xcGB3YaMsHwtUYybb/1
         7JnYZUDFho4xwf0xHe6kV4C3Cp+sb3uHf8a+SX1xK43K+yDmW4lIJarFW0Tq6bqoAs0a
         HRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NlxdPlGDclSVG1dP8Ered5Aj96QYeQaYTMEQCcdsZZE=;
        b=GJWqBDNx+AsuxslAVd0Jxr5AUppCPfIDSpcSG6uOQ3TVcvwxvZIe1tb6ji9bHC4jhp
         Zc497OkN4WIhUTiDrpxA15GSrlAmrpaRyGJND96/KZSy5tPBCe9x9sKQJJvEWYSFu5ON
         jC8cxO7bX/psVL8L0P+nwWJaVkH2q7nh0NQW3ao+wxav/V+sMcPsNDRsQSDtsX/Z4S2i
         8x7qsESnA4u2O8y3JSc9PZIsh7Lx+sjmiXGU9Jwj+qi9jEbSc9IrR5qXO+YAKUnjb2/i
         6EmKZfVv6BPdQXYjF+x7tushCYL/mFZaf1oOT3wgyuqkkPNqEEgIKd2xRvG4eoYEydKN
         2Kcg==
X-Gm-Message-State: ACrzQf0PFFhEkLnp9VIdIxokr0uWQ6hI5Q+WLUxZztjR8INmLyx9k326
	NmrxbPaZAMu6o8tuZrE8NvszsiAyURqC8P024h4=
X-Google-Smtp-Source: AMsMyM4Yp7PBzBgpfRaS3bO7iKYy5Jlc/0xzHj4cPfpCIpsQ9PGNNJjX8oCqARs+4zAsE6SlnC/8A+XAHEdYFUNOoiE=
X-Received: by 2002:a81:4ac6:0:b0:344:ef13:7c8b with SMTP id
 x189-20020a814ac6000000b00344ef137c8bmr1905559ywa.24.1663280825519; Thu, 15
 Sep 2022 15:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <3693a3a1-5a2a-4cc5-fb55-f6ad9a4b3f72@microchip.com>
In-Reply-To: <3693a3a1-5a2a-4cc5-fb55-f6ad9a4b3f72@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Sep 2022 23:26:37 +0100
Message-ID: <CA+V-a8u87tqhC69qGD2zq_gT9jc_cSWd+NRn_u0bPTdmmk+j4A@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] riscv: boot: dts: r9a07g043: Add placeholder nodes
To: Conor.Dooley@microchip.com
Cc: geert+renesas@glider.be, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de, 
	atishp@rivosinc.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_152707_844987_74601270 
X-CRM114-Status: GOOD (  13.73  )
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

Hi Conor,

Thank you for the review.

On Thu, Sep 15, 2022 at 10:36 PM <Conor.Dooley@microchip.com> wrote:
>
> On 15/09/2022 19:15, Prabhakar wrote:
> > riscv: boot: dts: r9a07g043: Add placeholder nodes
>
> nit: s/boot//
>
Will fix that.

> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add empty placeholder nodes to RZ/Five (R9A07G043) SoC DTSI.
>
> Can you explain why do you need placeholder nodes for this and
> cannot just directly include the other dtsis?
>
Since the RZ/G2UL SoC is ARM64 where it has a GIC and on RZ/Five SoC
we have PLIC for interrupts. Also the interrupt numbering for RZ/Five
SoC differs from RZ/G2UL SoC hence we are not directly using the
RZ/G2UL SoC DTSI [0].

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/r9a07g043.dtsi?h=v6.0-rc5

For the RZ/Five SMARC EVK I am re-using the below files [1] (SoM) and
[2] (Carrier board) as the RZ/Five SMARC EVK is pin compatible.  Since
I am re-using these when trying to compile the RZ/Five DTB I get
compilation errors since the nodes dont exist (and there is no way
currently we can delete the node reference when the actual node itself
isn't present) hence these place holders.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi?h=v6.0-rc5
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi?h=v6.0-rc5

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
