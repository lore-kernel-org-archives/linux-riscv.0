Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295EEC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 18:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maujPg0zlKVWSsRcPeo7YcNBEGlxsBNF45u/jWOEIpg=; b=QUXt5ed5875q2x
	E9MOiiANgb6rkKeYvU5Z/RfVnm81a8j6wdHj+Swaxdw3RksZPeiIXT2nCTZT1zTYF8NZ9ItTAFZOv
	taJ9C54Va8FMkTWPvK5XduKq15Hg7GCDtBhW600mb9yM47X/bWL78y6tc8mzaorP2CIvb6/7W/act
	dCKavn/cmbzVhTK90S77N3/04lD9h2etpyurUi9v23RekITs86n70asJevXQlHDp8M2gycXbNBoxS
	3VqnNCnvDZ/V3snBbqguYPY+sCo7DzINyF3by2iYlLrDN1YvwZf4aQ48BZthMQYF71ctSFSQabQPM
	XORGy7NtNYg/y9CroxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oydHi-0017Qs-9T; Fri, 25 Nov 2022 18:18:46 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oydHf-0017P5-7a
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 18:18:44 +0000
Received: by mail-ej1-x635.google.com with SMTP id vv4so12039337ejc.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 10:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PSTqWNHag3SUpc3s1sUcZFF6UQb8ezMgBBQvOC4p8IA=;
        b=BNqJGG6NUjVhaqHfPKxqWeQdHWINkXBo1nQ04UVvLY7ant299F/ym4pPSe0oto7cR0
         4XACZTwuMBzmtAZyCY6sxv/nnenKRB6tktqbVwmnCYCAv2KAr9usuv9yxgul+XU8W+jY
         n7scp0g+GaBXDcZaUp1QIgaFdCpTGUplZsDN+pVUXYKlgllGDQq9wCiOMZadKvvSIZUt
         A9IyezL6Fkmhs9/TJ0KV0SP6PuToVC/zVficpOVAZE7Y7ZZxfJHUEIrOFwmTGs2rNbSN
         jMfI1b7El163bpzxHhHaf5IT6Oty6dtmep7YPLQO7I1sqsIHBK8Y6DzhbxhjMPg3xcyN
         5OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSTqWNHag3SUpc3s1sUcZFF6UQb8ezMgBBQvOC4p8IA=;
        b=q0+EPQMcoxUvokCk1rvv2FyZu7/5mRcuwXoBeEbTDt7UrqUHxJVLYNOW/VkU/snBG3
         QkXtHqCWwccgS2f+jrMZ1FnPVa/ZCLuBeUDBX0/bAEYHhpZ9oxU5C1LvZGkZKuxrVWb+
         VKBa3i5MVe16V5XSdKtk3gvtoEbgV7fGcmiSggKG7onulJZjoMVzSynq8NTxI7fw84Z0
         0AVpSbRYm14njSHTQ1rugxnQPqm3ELitWBpm+WufgRGFwG6c9jZFt+HmZ7zCR3jKV/wT
         MjkVio0Mi1G5qz5nNo+9O2HCjG/PlShSC2ZlqYJ2mZfSksgt8qNN73xE0JcjPZSQSXlo
         j5Lw==
X-Gm-Message-State: ANoB5pkaI3+2ZZuxzoreRbvJji/GXS3CtPi8EsPbesGiMnlsISd8wuO9
	qf61jmeMlx7Rj1LQDK+dYPfvjs0Yy2jCkx0Lbxw=
X-Google-Smtp-Source: AA0mqf4/BJoTyjk07S/TT+v6WloICUBFRly4YcWuDlROWrOzgv+5CNKPR50fastJHx25Y7QVIpQuaLjvBbIvs45GkVo=
X-Received: by 2002:a17:907:7650:b0:781:e568:294f with SMTP id
 kj16-20020a170907765000b00781e568294fmr19286209ejc.447.1669400319844; Fri, 25
 Nov 2022 10:18:39 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <70d1bfde-f57f-1741-08d3-23e362793595@linaro.org> <CA+V-a8s2awLp=YvbhA1Ohe500Oh1easLUcG9V4_FWov7Pf2i6g@mail.gmail.com>
 <9b0f8312-2caa-b9f3-edf3-1b720532f559@linaro.org>
In-Reply-To: <9b0f8312-2caa-b9f3-edf3-1b720532f559@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Nov 2022 18:18:13 +0000
Message-ID: <CA+V-a8vCUR15WFKiyZ=AgsdKovrnCngnQ_dBTx6PkDYde2=p+Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_101843_292560_E60F5653 
X-CRM114-Status: GOOD (  18.43  )
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

Hi Krzysztof,

On Fri, Nov 25, 2022 at 12:12 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 25/11/2022 11:34, Lad, Prabhakar wrote:
> >>> +/* Device, Non-bufferable */
> >>> +#define AX45MP_PMACFG_MTYP_DEV_NON_BUF                       (0 << 2)
> >>> +/* Device, bufferable */
> >>> +#define AX45MP_PMACFG_MTYP_DEV_BUF                   (1 << 2)
> >>> +/* Memory, Non-cacheable, Non-bufferable */
> >>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_NON_BUF     (2 << 2)
> >>> +/* Memory, Non-cacheable, Bufferable */
> >>> +#define AX45MP_PMACFG_MTYP_MEM_NON_CACHE_BUF         (3 << 2)
> >>
> >> What are all these? They don't look like flags, because 3 = 1 | 2...
> >> they don't look like constants, because we do not use shifts in
> >> constants. Are these some register values? I also do not see the header
> >> being used in the code, so why having a bindings header if it is not
> >> used (DTS is not usage...)?
> >>
> > These are register bit values for the MTYP[5:2] field. The DTS example
> > in the binding doc (above) uses these macros. I haven't included the
> > DTS/I patches with this patchset yet do think I should?
>
> Then why storing it as bindings? Bindings headers describe the interface
> implemented by drivers and used by DTS, but this is not implemented by
> drivers.
>
I got your point. I'll make use of the header in the driver for the
next version and fix your previously pointed comments.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
