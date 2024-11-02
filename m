Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3279E6F098
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 00:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oveFcgakkXAYnyGV/wex3Qfc2ZSVlC6X1oCXOUYMMAM=; b=sL8QsOf+X4ItjK
	lexJmL0GETm2HXPt9gO8sgcxcwVdjEclAUiaPsK1Ykg0Nk9/LOqUrKEqSmGSEQVzYAcz1+wU1/hym
	nOeBaBf1NgLSN1VeiYIIYmgRDa1cP8emtV51Z2Qkz+gEI96IDSZCM1ybTc+6FiQ/CXO0Rs1tzO7s1
	Asmgq1QBji5kpyC3wlESS9kRM0E3qCcUKkO0/QRuC2ImgbxwgmwAP811bQymv9SP/ZhZF97n04mnF
	rMZyVCV0CcWVJr/XO51w01WytmpHu4eN6x1CsGa7dZIjA8R6rrzV1EXO0WPs/O8GddWE6mnAe6sLh
	11Nl8ctAqNvunZpsy+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hK-00000008a3A-12BN;
	Sat, 02 Nov 2024 00:08:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t71hG-00000008ZzU-0sF4
	for linux-riscv@lists.infradead.org;
	Sat, 02 Nov 2024 00:08:55 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e3d523a24dso1998610a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 17:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730506133; x=1731110933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6f0bfv/UG/JqamBlr6Ml5vEqFTtFdcwNeUu8mlrjgUs=;
        b=TIIkhkA8gQKOCKOzdF3vs5gAtcBzlkzSeyXaNXISyco0ZsKAbll+4Ik1bPG8oP98Ns
         kBqziNrlxuMiv0W0OWcZXMU4p9s7B+PSJitbW7D0p8Lh4JLPTLKm3nSrx2/zYCXOI+KL
         QP//wYoa2gyPcGLoyCnpt6Uf7ou8rZ9RktD8p1xHmFZM3PixUOGA/Vu2l1tcLa0Bfzv/
         MlB80o9uAUxq9ltl6GrHCEc8VmYylvTS8jehYp9fPW5HBODN+P17C/vRaRpA9s3W/ZkB
         vqHYM0zR7itGkzCN/MnlUe4DC3wzdszaC3u9WIqmV4OjQnGYs5hBggAyDmYXzhZfPnaV
         cXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730506133; x=1731110933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6f0bfv/UG/JqamBlr6Ml5vEqFTtFdcwNeUu8mlrjgUs=;
        b=f0HF8gWIefppD+oB1+VvT1h1agsue8g03SeK2y/EzXSIuEBaltfgbPrCMCQ183k71U
         qkmItU7/PPyyHIcc71S1zNvFtdu2MsDvP4kDb/WL5rMu1/wD3p01iqNwGQ+JR1Y7+vJb
         8rBZ5nDAXu0Ky28G0AqWs75xWM4/0SPL4T3i6M2TY6TJkaEyd2ia/L8KPRDdT8mSoLvV
         fLHF4V7FbdMbHBiPOgJ/CHdcYo6gCIiCPGxKTDvXMD5jzDJpR+T0kRodhFcvnOndvrjX
         TlzCfLn+Irt1ZQNpNlhyUnGKRrqfkV0ZnVBOfHuF99aOFKl62/lEUNKerihsXjoPIxrX
         XAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO0AI4Zyb4OMqRJTT9odhzk+xecNW5zFB/sUAk+vHKxC84HK00CyYczYGFVmOhqnMtPt6E5Qv3eE2/OA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKblWb47Tz/twdWxBu1ZUFbK22BJtDPNzqyGFLUFimmylHz0so
	IjKLgcsbKae5e03HzsDBzSrFVNpjrmFV1DRFq+X2+RKLD2RCyxqkvjHukl4p0y0=
X-Google-Smtp-Source: AGHT+IFzEa5gdEJWrmZ3qEErWiVz4Nclj5KffdLeaW0o88JxBl0OqASLc7B/YtrAYBvQuvsBiZVowQ==
X-Received: by 2002:a17:90a:7c03:b0:2e2:e6fa:cfef with SMTP id 98e67ed59e1d1-2e8f11bad3emr24772724a91.25.1730506133062;
        Fri, 01 Nov 2024 17:08:53 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fc00856sm5505749a91.54.2024.11.01.17.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 17:08:52 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 05/11] riscv: ptdump: Only show N and MT bits when enabled in the kernel
Date: Fri,  1 Nov 2024 17:07:59 -0700
Message-ID: <20241102000843.1301099-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241102000843.1301099-1-samuel.holland@sifive.com>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_170854_269064_137A0A76 
X-CRM114-Status: GOOD (  13.65  )
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

When the Svnapot or Svpbmt extension is not implemented, the
corresponding page table bits are reserved, and must be zero. There is
no need to show them in the ptdump output.

When the Kconfig option for an extension is disabled, we assume it is
not implemented. In that case, the kernel may provide a fallback
definition for the fields, like how _PAGE_MTMASK is defined on riscv32.
Using those fallback definitions in ptdump would produce incorrect
results. To avoid this, hide the fields from the ptdump output.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/mm/ptdump.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 9d5f657a251b..58a7322e9a82 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -135,11 +135,13 @@ struct prot_bits {
 
 static const struct prot_bits pte_bits[] = {
 	{
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_RISCV_ISA_SVNAPOT
 		.mask = _PAGE_NAPOT,
 		.set = "N",
 		.clear = ".",
 	}, {
+#endif
+#ifdef CONFIG_RISCV_ISA_SVPBMT
 		.mask = _PAGE_MTMASK_SVPBMT,
 		.set = "MT(%s)",
 		.clear = "  ..  ",
@@ -215,7 +217,7 @@ static void dump_prot(struct pg_state *st)
 		if (val) {
 			if (pte_bits[i].mask == _PAGE_SOFT)
 				sprintf(s, pte_bits[i].set, val >> 8);
-#ifdef CONFIG_64BIT
+#ifdef CONFIG_RISCV_ISA_SVPBMT
 			else if (pte_bits[i].mask == _PAGE_MTMASK_SVPBMT) {
 				if (val == _PAGE_NOCACHE_SVPBMT)
 					sprintf(s, pte_bits[i].set, "NC");
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
