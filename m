Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1962CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2FBA61183
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2FBA61183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIoO1RfSTz5ckgaa3pczU9Hp5eGdFTzrQVhYfvNbcg8=; b=tia7IuxDMh9AjV
	r2oWNhoeVkgDTG/rRtkcbvuKZWq1l/ehhfffFT87WacMcb9e9hUaMT4d1yB1dsnwiW4UgDMe6FrQE
	FsxW/lDz5RGoEOeOCDrBvH1yYDLZtr3rHysNrZfLMBh2Z2WnxswdYQSM4DkAwbib4kTJBYjSIFJ5A
	MMEhA+3r3mXfeRRfogaZa5++GrY+aaR2HcZNvn8AjMLpjNo+Hec1VRdNcph8X7NZij65JXdG3Takm
	6JpAgPEcwVBZFsZo5BH1OnwxjXZnUTMBgxb1+txynWHK8QFpQWeplzzkhZHlKs53RvBoQbE0vM5AF
	9XAvW/NpmugOiE1kXGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA2T-00F2nO-R6; Wed, 06 Oct 2021 16:45:05 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA1A-00F25N-Bw; Wed, 06 Oct 2021 16:43:45 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so3940791otj.2; 
 Wed, 06 Oct 2021 09:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nz2VNzL+ydy4chpa3d7bE/r1R6JeAbCb1Q1l6nn9BO4=;
 b=ohnCMqSr0fdIf2iLQzrnxIw5CKF6dwDa2cnuO6FrX4XtM7Dx1cwSO8/agjFTDfBOCC
 2I1CpjhgPfBFKCfCuvZmVR3GHCyXwLP2qjglOhHF1B+lV9+HwYJdLs5yblWoTbAnRvVQ
 gQQlp2wWwZLrMlN6E+hVp13ttTs1lXQ81k0q1dKlMLXTJcdrF22zgsT92lr3H4BX2u1K
 gTvh3Hm+HJ++9wGcUfP/TnM1Ur66mBAQeHOLqpICYq4px8A5Ld9TeavS99oWBpQCreW7
 L42bXDF6nu6Lx0sKjNigBgOpmIExArA4xrFVDaj+e7Bowcz8oDW5cjhbtUdHXTlfts/j
 7zMQ==
X-Gm-Message-State: AOAM533BjNotIzkXCue2LEJ+yYUL3mKjhCqAj3pz8GPlvc2kHFi4MPK+
 P7wp8JjyH+NwkgA1Zcg3WA==
X-Google-Smtp-Source: ABdhPJzkVUe2NQ95hrntc6XfGtsZUf11mFfAeFqW0+ilFUDkOjdRegXB0ef4DYKZYBjYmsjM+kfXAg==
X-Received: by 2002:a9d:6ac7:: with SMTP id m7mr20566678otq.49.1633538622946; 
 Wed, 06 Oct 2021 09:43:42 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:42 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 04/12] arm64: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:24 -0500
Message-Id: <20211006164332.1981454-5-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094344_426335_EBA5775A 
X-CRM114-Status: GOOD (  15.32  )
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

Replace the open coded parsing of CPU nodes' 'reg' property with
of_get_cpu_hwid().

This change drops an error message for missing 'reg' property, but that
should not be necessary as the DT tools will ensure 'reg' is present.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/kernel/smp.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 6f6ff072acbd..c5cebc406d24 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -466,33 +466,6 @@ void __init smp_prepare_boot_cpu(void)
 	kasan_init_hw_tags();
 }
 
-static u64 __init of_get_cpu_mpidr(struct device_node *dn)
-{
-	const __be32 *cell;
-	u64 hwid;
-
-	/*
-	 * A cpu node with missing "reg" property is
-	 * considered invalid to build a cpu_logical_map
-	 * entry.
-	 */
-	cell = of_get_property(dn, "reg", NULL);
-	if (!cell) {
-		pr_err("%pOF: missing reg property\n", dn);
-		return INVALID_HWID;
-	}
-
-	hwid = of_read_number(cell, of_n_addr_cells(dn));
-	/*
-	 * Non affinity bits must be set to 0 in the DT
-	 */
-	if (hwid & ~MPIDR_HWID_BITMASK) {
-		pr_err("%pOF: invalid reg property\n", dn);
-		return INVALID_HWID;
-	}
-	return hwid;
-}
-
 /*
  * Duplicate MPIDRs are a recipe for disaster. Scan all initialized
  * entries and check for duplicates. If any is found just ignore the
@@ -656,9 +629,9 @@ static void __init of_parse_and_init_cpus(void)
 	struct device_node *dn;
 
 	for_each_of_cpu_node(dn) {
-		u64 hwid = of_get_cpu_mpidr(dn);
+		u64 hwid = of_get_cpu_hwid(dn, 0);
 
-		if (hwid == INVALID_HWID)
+		if (hwid & ~MPIDR_HWID_BITMASK)
 			goto next;
 
 		if (is_mpidr_duplicate(cpu_count, hwid)) {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
