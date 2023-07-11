Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D7DEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 22:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VHyS9++cm8NeuE0HdaVS2/zDXB5QICgYYxUahbJwHKg=; b=pu030iWMDuxGXY
	86VUg4yCRuQbY/QFqd0QK4cxeJ13QreyvNrJEuSZ/aUSTG1ZASZYl43kvDHT8GZScQMeVu30rJMZT
	hfOkRwtkB4btWPAhsPFebATH4wJFE3OUbKZ6CQ6NdfxJNOvS9SWbvWy86acGil5bNvHcjQcZRy3KE
	Jc3NVKgVjHiL5nPrN8/+1cfeCao1nfadoWSc2ieYp2nSDyP2Uz3q41K7rYFigf715nt0XeZmbzuNt
	xtn1I7konvmEVAZh1z+nQaBi72T+zgRQRBknNmJp1LaCGGgfLb2iQU8Y5KiujGf5f85e/Spy+vhKU
	uY4oahqIVPGEotFdnCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJM2N-00G0IZ-2L;
	Tue, 11 Jul 2023 22:40:51 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJM2J-00G0Hq-2a
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 22:40:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b89cfb4571so46935305ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 15:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689115243; x=1691707243;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=ME4y8+N+bVmZOY1nBigOYA7PVdXBow3YybuXWA186u4=;
        b=dVdE1Ira7OcISottEQc5ztEVYlzd6g8HN/ZNB7mWRtGwMT3gufKDAvSCSoaF33hLYD
         vgUMnOc49E57sCPZUZq+lj/9O1kv3uE3le2YmvU+uyIgMpKlmPJIX2WC0ir7xyDqzvdL
         Q8/JPo3M6y5OutjYmEnww0pogOkCQVHzt44bcunVtMY0lrTI3b+Kgl8cJw19X64UTD2O
         FaYxztlQHmhJ51GeFhdZ1Aub4w7wlbJKcE8GBCOFkkthYJzLtHxDc8lEWBickBr/Dymi
         WTsoIxuggmoy0nAcuksqiyTOM2qGJGSs9STKFb4GrT8jXDuo4Vvg6qTmchEdgbkGqv1n
         fOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689115243; x=1691707243;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ME4y8+N+bVmZOY1nBigOYA7PVdXBow3YybuXWA186u4=;
        b=dYUP6HPx0b0TPf229p9bcIN65HIj5gzxdPJtfem5gF0pkraJdBWmopNbGeXz6FLaIx
         Op0yJJ19XljxB6DeM8vWQ/UDvN6PbnMoEPRhesKLaBEBxgHzrOopSLADQu/XViG3VDhT
         L6xBgIaE4SL59/WjTucvZ9B5ii6igAvs9nGqRG0Api/lsuLLclPWWJDxjPTqz5+KsTRZ
         ByvJ8zIzwI7YSGqDPYtvCHWMb4U0aN3YxeLGRlTZ0eYD6vZhVlzu6D+sTqbcT7rLVidj
         cf2N8sBEuYDEhtSU0C9xLbAwk04wWthh72Y4qiayVy8P77XyDF6SjQdMiuFD3z/sOrkJ
         tH0A==
X-Gm-Message-State: ABy/qLZk16kMVhYjREvl0K3RqPaRQlTm2UEXKZBrcY+gdNYtT0LemeU4
	asXIyBmuFYE/HwIUZhGRwg2Bcwx9X/SUym41BTg=
X-Google-Smtp-Source: APBJJlGDf2GQVN2utK3W3YEN2JCiUn8jhKxSk2hZKHeI2KQmufhOqF32/NEwdRDwBe9RWe7xkZQ9wg==
X-Received: by 2002:a17:902:e80d:b0:1b8:b459:f47a with SMTP id u13-20020a170902e80d00b001b8b459f47amr21022194plg.34.1689115243557;
        Tue, 11 Jul 2023 15:40:43 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id ji19-20020a170903325300b001b7cbc5871csm2477369plb.53.2023.07.11.15.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 15:40:43 -0700 (PDT)
Subject: [PATCH] RISC-V: Don't trust V from the riscv,isa DT property
Date: Tue, 11 Jul 2023 15:33:17 -0700
Message-Id: <20230711223316.7961-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>,
  Sunil V L <sunilvl@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_154048_029184_0B15F983 
X-CRM114-Status: GOOD (  21.03  )
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

The last merge window contained both V support and the deprecation of
the riscv,isa DT property, with the V implementation reading riscv,isa
to determine the presence of the V extension.  At the time that was the
only way to do it, but there's a lot of ambiguity around V in ISA
strings.

Rather than trying to sort that out, let's just not introduce the
ambiguity in the first place and retroactively make the deprecation
apply to V.  This all happened in the same merge window anyway, so this
way we don't end up introducing a new ambiguous interface we need to
maintain compatibility with forever (despite it having been deprecated
in the same release).

ACPI still trusts ISA strings, so we'll leave that alone.

Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
This came up as part of some discussions about the T-Head vector
support.  I haven't actually tested this, but Conor and I were talking
about options and it was easier to just implement it than describe it.
It's kind of clunky to only parse that one property, but we're already
in a grey area WRT having the DT bindings that we don't parse so maybe
that's not so bad?

The other option would be to turn off V when we detect we're on a T-Head
system as part of the errata handling.  That's similar to what we do for
misaligned accesses, but that's a hack that we're getting rid of.  It'd
be less of a hack for V, but given that we've found T-Head systems
aliasing the arch/impl IDs already we might be digging ourselves a
bigger hole here.
---
 arch/riscv/kernel/cpufeature.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..8e970f55285e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -116,7 +116,19 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
-	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
+
+	/*
+	 * "V" in ISA strings is a ambiguous in practice: it should
+	 * mean just the standard V-1.0 but vendors aren't well
+	 * behaved.  So only allow V in ISA strings that come from ACPI, as
+	 * we've yet to build up enough histroy in ACPI land to stop trusting
+	 * ISA strings.
+	 *
+	 * DT-based systems must provide the explicit V property, which is well
+	 * defined.  That is parsed below.
+	 */
+	if (!acpi_disabled)
+		isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
@@ -131,6 +143,8 @@ void __init riscv_fill_hwcap(void)
 	for_each_possible_cpu(cpu) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 		unsigned long this_hwcap = 0;
+		struct property *p;
+		const char *ext;
 
 		if (acpi_disabled) {
 			node = of_cpu_device_node_get(cpu);
@@ -334,6 +348,15 @@ void __init riscv_fill_hwcap(void)
 			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
 		}
 
+		/*
+		 * Check just the V property on DT-based systems, as we don't
+		 * trust the ISA string in DT land.
+		 */
+		if (acpi_disabled)
+			of_property_for_each_string(node, "riscv,isa-extensions", p, ext)
+				if (strcmp(ext, "v") == 0)
+					this_hwcap |= COMPAT_HWCAP_ISA_V;
+
 		/*
 		 * All "okay" hart should have same isa. Set HWCAP based on
 		 * common capabilities of every "okay" hart, in case they don't
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
