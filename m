Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544A7C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t0MOh/64XHZy0b94fCZgan8thNanfYfpUywrerFojOs=; b=D30lzFeXSb4YO7
	3jxTh385YC0QBWfpQhnexopbQ6LXNU/DRO9OSXHnlidtF7RBPHGvv95mITe49PyByHTjRlhuxCW/K
	G/YI5AXFPp76meiMn1XWheVQxAg5Xa52QGZxh7HS0fcaF9Y4wHJm22+/447Ox6mEVQicWkFG0Wu3c
	qk2xk4YVLCD1dVifku9rO+J4UoMGunNCdkcsmb2dr+ZFTdapq7I001aTylOmBacFE2x3a2Dq6YyD8
	lACVmjh7XsjecT3ZCX/L/qy8pG3bI3OLZfysF6PQAasRRwP0itRNi62ukCL3V8k0bgNZ8uC+Vgvn9
	JMdjTalJ1H6anHeZSxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYMr-000jw6-1T; Mon, 14 Nov 2022 12:15:13 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYMo-000juY-Bl
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 12:15:11 +0000
Received: by mail-ej1-x62b.google.com with SMTP id i10so19155027ejg.6
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 04:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wL7V7GrQjCt6c9Uec6kaTC78jJaZ1Xv6exvob5mIPRQ=;
        b=HQ4d9zbrYmNIhWxfTBqb/ghylrpjKxxDg/CZqqa3LFxSOKESC/D9EjZfeVQjiqyraA
         uitwiq/Ypy4wClOvovLNSXbe/RtRRSaZQn9cdsgqkbWyQoMvlN62CGc2dISLwlSU3TYG
         +jV9nxCF+43p3H+woFGRVGRsmKTQIMpVulOqKkZ1kNu5BoCuPQRRdWe//Y9lP4PiNu3h
         kiHXSCmNtPQZ1SfJI3z49RU1ag1GkqhjLaQ9b2pggXbcRtzSWExKtm1IfzVaK3FKvTIR
         k/CJOg7HFrd4Tg0tQJANRE5nO1wkOnPlIUUWecl+msutlDs1zyUHq5I/2bLOetfZbXWe
         RYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wL7V7GrQjCt6c9Uec6kaTC78jJaZ1Xv6exvob5mIPRQ=;
        b=rRuU3xxaKWAydkm8wOxNOGSgerF6Ek0rpToZkxNByuWIFaKxwTAQmuACb/9wb1ujow
         R+nhPj+8UXLTEMtAmDUXZs9zXlXc4HtzJ0VptbBAAoGEM2ZaBzt6QToh0G4/S/p9nQVt
         QEbQ3DoWDNCF3oOwGmU4naNKYrXD8qadjpPrTHnFlgRZqMp4bny40nbDO+IDyTqQyMS1
         AE+XPpRFFbz4xXxo+T9ShuKZAZQK5t7wRbab2DiP0TKS3mciTtp/azL4RpC/xOJ5j2nR
         goPnABNwEE8ghkVpkZ338eWL8K/4PSr16x1YirOmakdmPstbjW0++x8MkEtL3UNWxTR4
         hEfQ==
X-Gm-Message-State: ANoB5pliDi1tLAnANZ9GXifS3lRaYW586E2aKcUtH3bj0NhLvj8dHbfy
	N9TIs/xcujQIicQobXZYU1E/og==
X-Google-Smtp-Source: AA0mqf5tTlQvOPt7oLEBU5yqyZ0oojjkhVloSuPhdi425az0KiH28OymTIu862MHPkYZxDV8f8S7Tw==
X-Received: by 2002:a17:906:e283:b0:78d:addf:67c3 with SMTP id gg3-20020a170906e28300b0078daddf67c3mr9770890ejb.253.1668428108874;
        Mon, 14 Nov 2022 04:15:08 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p27-20020a17090635db00b0072af4af2f46sm4088035ejb.74.2022.11.14.04.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 04:15:08 -0800 (PST)
Date: Mon, 14 Nov 2022 13:15:06 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Message-ID: <20221114121506.odv2vgc4whjrfwf4@kamzik>
References: <20221110164924.529386-1-heiko@sntech.de>
 <CAJM55Z8PBGWr6ej1GSfks8nCvK0q=sF8qDK6f8w=+Nh1mr4sSg@mail.gmail.com>
 <20221114113553.3dxrumhk72jouzek@kamzik>
 <2234530.yKVeVyVuyW@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2234530.yKVeVyVuyW@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_041510_429312_171C3AC2 
X-CRM114-Status: GOOD (  22.61  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 14, 2022 at 12:38:39PM +0100, Heiko St=FCbner wrote:
> Am Montag, 14. November 2022, 12:35:53 CET schrieb Andrew Jones:
> > On Mon, Nov 14, 2022 at 11:57:29AM +0100, Emil Renner Berthing wrote:
> > > On Thu, 10 Nov 2022 at 17:50, Heiko Stuebner <heiko@sntech.de> wrote:
> > ...
> > > > @@ -316,8 +384,15 @@ void __init_or_module riscv_cpufeature_patch_f=
unc(struct alt_entry *begin,
> > > >                 }
> > > >
> > > >                 tmp =3D (1U << alt->errata_id);
> > > > -               if (cpu_req_feature & tmp)
> > > > -                       patch_text_nosync(alt->old_ptr, alt->alt_pt=
r, alt->alt_len);
> > > > +               if (cpu_req_feature & tmp) {
> > > > +                       /* do the basic patching */
> > > > +                       patch_text_nosync(alt->old_ptr, alt->alt_pt=
r,
> > > > +                                         alt->alt_len);
> > > > +
> > > > +                       riscv_alternative_fix_auipc_jalr(alt->old_p=
tr,
> > > > +                                                        alt->alt_l=
en,
> > > > +                                                        alt->old_p=
tr - alt->alt_ptr);
> > > =

> > > Here you're casting a void pointer to an instruction to an unsigned
> > > int pointer, but since we enable compressed instructions this may
> > > result in an unaligned pointer. Using this pointer will work, but may
> > > be slow. Eg. fault to m-mode to be patched up. We already do that in
> > > other places in the arch/riscv, but I'd prefer not to add new
> > > instances of this.
> > =

> > Alternative instruction sequences (old and new) have compression disabl=
ed.
> =

> That was my first thought as well, but I think Emil was talking more abou=
t the
> placement of the alternative block inside the running kernel.
> =

> i.e. I guess the starting point of an alternative sequence could also be =
unaligned.

Oh, I see.

> =

> Though I don't _yet_ see how an improvement could look like.

I think we can patch the alternative macros to add alignment. Something
like

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/inclu=
de/asm/alternative-macros.h
index ec2f3f1b836f..3c330a9066f7 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -20,6 +20,7 @@
        ALT_ENTRY 886b, 888f, \vendor_id, \errata_id, 889f - 888f
        .popsection
        .subsection 1
+       .balign 4
 888 :
        .option push
        .option norvc
@@ -34,6 +35,7 @@
 .endm

 .macro __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
+       .balign 4
 886 :
        .option push
        .option norvc
@@ -49,6 +51,7 @@

 .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enabl=
e_1, \
                                  new_c_2, vendor_id_2, errata_id_2, enable=
_2
+       .balign 4
 886 :
        .option push
        .option norvc
@@ -87,6 +90,7 @@
        ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errat=
a_id), "889f - 888f") \
        ".popsection\n"                                                 \
        ".subsection 1\n"                                               \
+       ".balign 4\n"                                                   \
        "888 :\n"                                                       \
        ".option push\n"                                                \
        ".option norvc\n"                                               \
@@ -100,6 +104,7 @@
        ".endif\n"

 #define __ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, enable)  \
+       ".balign 4\n"                                                   \
        "886 :\n"                                                       \
        ".option push\n"                                                \
        ".option norvc\n"                                               \
@@ -116,6 +121,7 @@
                                        enable_1,                       \
                                   new_c_2, vendor_id_2, errata_id_2,   \
                                        enable_2)                       \
+       ".balign 4\n"                                                   \
        "886 :\n"                                                       \
        ".option push\n"                                                \
        ".option norvc\n"                                               \


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
