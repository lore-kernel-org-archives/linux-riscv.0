Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7A5C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 18:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3srLQYxm/AXyIbyRJwFfUXTnBJpUxI0gXkiHBON/otI=; b=oOfooDGzVIqLe0
	nx1l3OHtDMZwR1JMuBYGz526G4UGz2Kc0GlGcH5Ic7TKQqPqmKoC2HU1U20QJCz5OHpvnRjK9wHPL
	0pv925IoGLmytVaZcFohXAYm0Y/axgw3AuEpXho4bz+lhEMg668vMTAnRBribtL8AUdT4DxplNZU0
	Zy+c8+pw+U7o/Jbz3EsHY+qh5BI+/dmTWw6dHtY2SWj8s4V3RdaxzkSDd/War8YOiua5hm3nQt4s1
	AwESNKTj8fWII4jtmCYPCahG2vWwEXvBbBpY9Rin86CqPvXwmme9ugQN9neQwQxiJv4E4lmmzHeE2
	djXntlrI7Ho38MrX5KSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIwDY-00BsDQ-CS; Fri, 20 Jan 2023 18:34:24 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIwDV-00BsCT-VC
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 18:34:23 +0000
Received: by mail-ej1-x62d.google.com with SMTP id qx13so16059903ejb.13
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 10:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RljWWlDfABhrEExkV/60EmyExt7xXza/TGukw4p5JZs=;
        b=FTHGSi1WvFMy1rA6AZ8wEFQrDoZre6RooIXOKzedbSVgy7mxXhq+uA/bV9oFmacU0j
         Np13RlyiBDiPdmfU5jyKRQJg/1vQGRw7Abq72wiO7U9eJKoj8VZ0C0mIa61TCIOpff2R
         X9Oua8PgZON+e+uC0iV+tBNWP7+zNUQpfkJz2rH99bczimIK1C6Ep7NoDSRYAmcm2Boq
         JHFGV3HmOHsXTFmYA0op6nNkrJxXzabNg7gTW8dKFNewyaqIAM5sIzHSOeVEcYWoBWoY
         1O2apAqD1hKIbqw1MagBd/WQnhGsbqANBrQVx48R9XU/8PNo3XnL6gosiA3oB9cB2SjI
         ejSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RljWWlDfABhrEExkV/60EmyExt7xXza/TGukw4p5JZs=;
        b=7/BUcA2YIVfeoUGHIxQvT87yxyI5D51o/HcVaKg49S02jSPGd6LwfgDmZ9H1ToW/1U
         uRKg4rt3nGc9owqyY86JwGquq3CwF53cbVXYw65gdAMBY95lDo8O/XKGsCVfBdY8JwVF
         9Y8bO573nlQi9zcBGdQKilCz4ruMDRQNjgQALojsWN3ZxpniiRpAoO7qAR9XWRwLMHNs
         BAHn5tSimpdcGuewkiCMJKYTcik517+WCLS9KuhYMNnR8GKVdtFRXDfOTiKnpSOnJotY
         aCMNqrbxQOUxozlPKvOzQf8Ryw1lMOAotXGAtKg8Yud+UfYnXIDOv5t9Ha47CGCoq+/M
         TyPA==
X-Gm-Message-State: AFqh2kp807gnQwMdn3YpkzkUUcJv1dCA0ht6sCsftnYW1QHbr847MbzP
	EPvjcxd6SYlSgglWXI5Cijzxiw==
X-Google-Smtp-Source: AMrXdXvwslxY4uvoA0qUluckvcPb+qhCLBxDiD/c1tTFYRRK1l+x1UltVxzbQDCuwWYlcliIL0Iasg==
X-Received: by 2002:a17:906:b317:b0:86e:5124:20b0 with SMTP id n23-20020a170906b31700b0086e512420b0mr17833931ejz.64.1674239659723;
        Fri, 20 Jan 2023 10:34:19 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id 22-20020a170906311600b0082535e2da13sm18256917ejx.6.2023.01.20.10.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:34:19 -0800 (PST)
Date: Fri, 20 Jan 2023 19:34:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v4 09/13] riscv: switch to relative alternative entries
Message-ID: <20230120183418.ngdppppvwzysqtcr@orel>
References: <20230115154953.831-1-jszhang@kernel.org>
 <20230115154953.831-10-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230115154953.831-10-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_103422_059356_B937626A 
X-CRM114-Status: GOOD (  13.62  )
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

On Sun, Jan 15, 2023 at 11:49:49PM +0800, Jisheng Zhang wrote:
...
>  #define ALT_ENTRY(oldptr, newptr, vendor_id, errata_id, newlen)		\
> -	RISCV_PTR " " oldptr "\n"					\
> -	RISCV_PTR " " newptr "\n"					\
> -	REG_ASM " " vendor_id "\n"					\
> -	REG_ASM " " newlen "\n"						\
> -	".word " errata_id "\n"
> +	".4byte	((" oldptr ") - .) \n"					\
> +	".4byte	((" newptr ") - .) \n"					\
> +	".2byte	" vendor_id "\n"					\
> +	".2byte " newlen "\n"						\
> +	".4byte	" errata_id "\n"
>

Hi Jisheng,

This patch breaks loading the KVM module for me. I got "kvm: Unknown
relocation type 34". My guess is that these 2 byte fields are inspiring
the compiler to emit 16-bit relocation types. The patch below fixes
things for me. If you agree with fixing it this way, rather than
changing something in alternatives, like not using 2 byte fields,
then please pick the below patch up in your series.

Thanks,
drew

From 4d203697aa745a0cd3a9217d547a9fb7fa2a87c7 Mon Sep 17 00:00:00 2001
From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 20 Jan 2023 19:05:44 +0100
Subject: [PATCH] riscv: module: Add ADD16 and SUB16 rela types
Content-type: text/plain

To prepare for 16-bit relocation types to be emitted in alternatives
add support for ADD16 and SUB16.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/module.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 76f4b9c2ec5b..7c651d55fcbd 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -268,6 +268,13 @@ static int apply_r_riscv_align_rela(struct module *me, u32 *location,
 	return -EINVAL;
 }
 
+static int apply_r_riscv_add16_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*(u16 *)location += (u16)v;
+	return 0;
+}
+
 static int apply_r_riscv_add32_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
@@ -282,6 +289,13 @@ static int apply_r_riscv_add64_rela(struct module *me, u32 *location,
 	return 0;
 }
 
+static int apply_r_riscv_sub16_rela(struct module *me, u32 *location,
+				    Elf_Addr v)
+{
+	*(u16 *)location -= (u16)v;
+	return 0;
+}
+
 static int apply_r_riscv_sub32_rela(struct module *me, u32 *location,
 				    Elf_Addr v)
 {
@@ -315,8 +329,10 @@ static int (*reloc_handlers_rela[]) (struct module *me, u32 *location,
 	[R_RISCV_CALL]			= apply_r_riscv_call_rela,
 	[R_RISCV_RELAX]			= apply_r_riscv_relax_rela,
 	[R_RISCV_ALIGN]			= apply_r_riscv_align_rela,
+	[R_RISCV_ADD16]			= apply_r_riscv_add16_rela,
 	[R_RISCV_ADD32]			= apply_r_riscv_add32_rela,
 	[R_RISCV_ADD64]			= apply_r_riscv_add64_rela,
+	[R_RISCV_SUB16]			= apply_r_riscv_sub16_rela,
 	[R_RISCV_SUB32]			= apply_r_riscv_sub32_rela,
 	[R_RISCV_SUB64]			= apply_r_riscv_sub64_rela,
 };
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
