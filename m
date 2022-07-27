Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CB4C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Vk5uO+pVfMY1iYj+lnr489FpSLsGQrdgfbaWjDMLPU=; b=c4sUzoPhw9JaJr
	WxNgXN38AY8ZBiPuHRz4gqZH8WYJapmT1Ql+g/qzAYFseR/7yeq7ClF+pPd/6oSCGjknmGwiOG1oh
	om8PZNSg8O0KuJK7bK5RnIhKTiwlB2UufAtZtzJD9EIfiIsJ5SBQGDv7FtpPJI+Fj/m4CM6ggUPdt
	W/vQ4WgfI0wbdnYjbMn+J0QHC9vVmou5KZwE+sL9TW1taHY8krAs8pOv3iNTuDkVrlXag7yujTpm8
	WqUyTO7UBhb5pSMz8Vg+VxItqCUpVteUxDt6jDZn/MZ4SdnRDj32Vvch2w8sJirBXRj5D9ls1hAMQ
	zlQk0VVyMQ8/iH+MA6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcGj-00B3ly-U7; Wed, 27 Jul 2022 08:19:50 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcGg-00B3jl-W4
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:19:48 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31d85f82f0bso167174447b3.7
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZtxVw1pYdcDvsQm6N6G29PT1JL73CCGF7G8sUX9Kfs4=;
        b=hdCF6Ux5sj/Ui9SA+QZZFWkaz5tpU9oPnqTZMgUl6hVM9GTYkAyiJgwUmQ7xJXqrVC
         CGZbCqmB4ZibJocXFQycUeXVNgG1DFaAbWs/GzGX+MPkm+55MRRkil1MkC1NVT/1FA0k
         5Zf8kb4Y+7E1Yx9UzwIILGRYSEFn0kSSkdVICU5GuYN/eNeIin9QlQnUl9GtcOcrxSPE
         99bveCKYmLsicmzrX5ZkgdCDNAgI0MUmQ8RNirZ6nDSYQ5klEI5rE5YDtmgraxBULcs/
         XxKpMGAaNf1VXcyVPXKR9eS8HKBWBnwbqvlxVUUPhE+msVyY7V6rWgcb+IHQesqz+H2B
         7F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZtxVw1pYdcDvsQm6N6G29PT1JL73CCGF7G8sUX9Kfs4=;
        b=QDZTiTTfqsLnwPgCcGI6g4tH7CNzCsK3rrXNWLLh93D4T1OJAUPX6spR5MCNP0y1XH
         kK1uAvaQPEgi6tH4C4KRg/kRPUTcsA/c45fo/C2FKuGaJ4rvDKwEXUnR/iX1LqOK4PRz
         ajRz85Jsi7Bnpoga5VYkA1qNauovaWpmavEGL51d2G+npePlG0dkiD777gUp9yswtU/a
         iuwl6XPQEg6qRBl4nYh2yeRo4AfsC3dohAHQviR4RlEGF1Jut2gW9qvixXJyjqKe1PJq
         OoXvE0ISFJNMPgV14VfJ5cBva58GFaOGVYYrRF7CR0FX8olgTUTsxezBo7MAlsMMeNmh
         4/5A==
X-Gm-Message-State: AJIora/R4vT8i+XLs6LnThP+bsaALi2wva3Jp8L4cVN1e9M1a3NQEFc+
	kltyVETm5YXzxGQ0XTU4Kgo+s8QjpFWcWSeSR04=
X-Google-Smtp-Source: AGRyM1secQcLWHxnDAk0KB/hY+50q7KhRWosdCbuNLjT5ScRK3t60youklhj3RRe3N6FfG9loM0EXWhiCzu80vbJ9/Y=
X-Received: by 2002:a0d:f0c7:0:b0:31e:e814:e7d6 with SMTP id
 z190-20020a0df0c7000000b0031ee814e7d6mr14519304ywe.340.1658909986075; Wed, 27
 Jul 2022 01:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <08083c49-68a3-6b0d-4a12-d9c9f7994281@microchip.com>
In-Reply-To: <08083c49-68a3-6b0d-4a12-d9c9f7994281@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Jul 2022 09:19:18 +0100
Message-ID: <CA+V-a8vx0XLVsZxr-HcQZVqWjQ3tW9ZgbOU0GTKtEf=VcDWRqg@mail.gmail.com>
Subject: Re: [PATCH 5/6] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC kconfig option
To: Conor.Dooley@microchip.com
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, 
	anup@brainfault.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_011947_056654_3CF9A23F 
X-CRM114-Status: GOOD (  22.37  )
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

On Tue, Jul 26, 2022 at 7:49 PM <Conor.Dooley@microchip.com> wrote:
>
> On 26/07/2022 19:06, Lad Prabhakar wrote:
> > Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
> > (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
> > of the Renesas drivers depend on this config option.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/riscv/Kconfig.socs | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 69774bb362d6..91b7f38b77a8 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >
> >  endif # SOC_CANAAN
> >
> > +config ARCH_RENESAS
>
> Hmm, I guess since it is very late in the day for v5.20 and there
> appear to be some issues with the SOC_ symbol breaking the dts build
> anyway, this is likely to be v5.21 content anyway...
>
I was targeting this for v5.21 ;)

> ...but I would be wary of adding ARCH_ symbols from ARM archs prior
> to figuring out what we actually want symbols in Kconfig.socs to
> actually  at LPC or w/e. Palmer?
>
> > +     bool
> > +     select GPIOLIB
> > +     select PINCTRL
> > +     select SOC_BUS
> > +
> > +config SOC_RENESAS_RZFIVE
>
> I would like to see this added to the default defconfig so that
> it has dtbs_check coverage by default.
>
Agreed, I will include it in the next version.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
