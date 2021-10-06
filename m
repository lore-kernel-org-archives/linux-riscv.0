Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A62AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DE0610E5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67DE0610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WO1zifvmh6OM+49wlZTrdXuDbR6/57VvBo4NyV6BJnM=; b=jAK6Z4DcaZjHCc
	ccEB1jYSk0dBoW1gNEuUmVB8CyC8hbVLeOae8QFqGtGy6LuB5Xymqxct1CF3QH8qgKSAdQKwmK0gx
	lOlYUvSMbAIk7b0YVqKa/sgmsXwmFUO7B+Ay4I/BSBGZslsFhL2M7Qxt35d6oMGvTipSDuD/wD/ex
	ULQwz3KeWZ9Cs7WBrjvUV8NIZJAtBvKoGTtb42GfE0Nshx/zLdLzJcnQW+9RPDaUPi7DmmszVsz81
	S37Dsp5hSMiUsBJI3rL8pLOJuh8TyeYpqL6t0q+rI9WBs/qvzn2LT8hdNmbfCK+FbMDsG1C/rt/r8
	yqCOj5oflA+UA7OIcTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA1l-00F2Os-KJ; Wed, 06 Oct 2021 16:44:21 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA17-00F23D-Bl; Wed, 06 Oct 2021 16:43:42 +0000
Received: by mail-oo1-f52.google.com with SMTP id
 i26-20020a4ad09a000000b002a9d58c24f5so1049663oor.0; 
 Wed, 06 Oct 2021 09:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH5lm9ZJrN75WHjiktQyDKNUxUp68MdS3scEafa+VH8=;
 b=LU/0ylMuGTDVgMYHq3J2ttDlMClYzvwg2u/7ZLo084jG6EjuCZSjVY7nuY3U/dXGv+
 ABVN25MchenACWmiS6s9J7eSQhdjsl5RDmXH+lOlVrLWQOssY0cPHDMr57U9KAAoHxu0
 vqmDzcwSHEXTK8PFsLTzNYKkYPY+OCQ7x9K0+Xq+wc/KBMk4USEcWlTRpRuWQY+U/nGF
 ESx2OR420TIWnVU1E6Al6JfqJAnsi1kchae8CRcJQYBJv9VLxkr52toj2ZRterCulT9J
 +2xdaKjF+elv+JMLPSs05h6wfapvJVeCSkW29oBNIlc07wB6Kz1Wgcm2KJgdLh5OcWDI
 OFkw==
X-Gm-Message-State: AOAM530OCbF42BZPlqFoswWPeIH9t0uji4rdlZZCMydfmT3sQSwZTzOO
 tr5bfeWLCoqG/gbNZXPWeQ==
X-Google-Smtp-Source: ABdhPJwDQxYuha7mztXncei2FBwje0uHQ2qAvAT0rAc8M1CEq47s46mQjlS2vX0JBLAJhljiutK9EA==
X-Received: by 2002:a4a:d108:: with SMTP id k8mr19009146oor.47.1633538619135; 
 Wed, 06 Oct 2021 09:43:39 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:38 -0700 (PDT)
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
Subject: [PATCH 02/12] ARM: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:22 -0500
Message-Id: <20211006164332.1981454-3-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094341_424713_16BDEF6F 
X-CRM114-Status: GOOD (  15.34  )
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

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/kernel/devtree.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index 28311dd0fee6..02839d8b6202 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -84,33 +84,15 @@ void __init arm_dt_init_cpu_maps(void)
 		return;
 
 	for_each_of_cpu_node(cpu) {
-		const __be32 *cell;
-		int prop_bytes;
-		u32 hwid;
+		u32 hwid = of_get_cpu_hwid(cpu, 0);
 
 		pr_debug(" * %pOF...\n", cpu);
-		/*
-		 * A device tree containing CPU nodes with missing "reg"
-		 * properties is considered invalid to build the
-		 * cpu_logical_map.
-		 */
-		cell = of_get_property(cpu, "reg", &prop_bytes);
-		if (!cell || prop_bytes < sizeof(*cell)) {
-			pr_debug(" * %pOF missing reg property\n", cpu);
-			of_node_put(cpu);
-			return;
-		}
 
 		/*
 		 * Bits n:24 must be set to 0 in the DT since the reg property
 		 * defines the MPIDR[23:0].
 		 */
-		do {
-			hwid = be32_to_cpu(*cell++);
-			prop_bytes -= sizeof(*cell);
-		} while (!hwid && prop_bytes > 0);
-
-		if (prop_bytes || (hwid & ~MPIDR_HWID_BITMASK)) {
+		if (hwid & ~MPIDR_HWID_BITMASK) {
 			of_node_put(cpu);
 			return;
 		}
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
