Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60084CCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dVI0kAMZku3Vyb3lE/d27K3Lt7dJtq8YPTMkyS3tf98=; b=K+6geHOeUdzsC6
	d9kZHhejr6QLlRErWTr57skLNuevA7MXuoo3KlPUcCK5/iiEBPyWFAerWJ3Hi036X4YKvga7IW5Ji
	e5BoRuDvBUU2AmcwqAO7Y8hByDzzNmDvLLGyg94aBDrl02radLwjqHvXgKT4+7NRGFUmk6XIEdMfK
	CXFPK7pL81dDsjfI8f6QGQYwd+TdlmtGdHF0OS53ffE3M2AW1otJLKqAXhlnmMVf4W27xjFO1irjz
	bw0IPoO4iX55YCQv+a3RpYq4TvvLNXSis6YQgu+KpMZuy0spnrpBBbR1iXFjD6sqf0RuPU27szq7a
	mzexTbTReUeV/fzDb7Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqdQ-00000007PDV-3AQ9;
	Tue, 11 Nov 2025 15:50:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIqdO-00000007PCw-1waN
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 15:50:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2957850c63bso10358345ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Nov 2025 07:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762876218; x=1763481018; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwxwWH0h/k86KA6Lqbt4Xcny5Xif9KRZerM8f0+lE/Q=;
        b=bgwDAgvT8/cXGltATRizyPl7PhmspjMGApvWspG5r4HeKhls0pC6FcTjLvbcFIhrgf
         CxiSAcZkJ535pe/xbCIkthp/owB7RIwrxtRWSTJK6PhPy4FdZ252Jib2Bk2xrnuhtHxt
         Nig67rsGjSevQH5G/xi8chCqVZw8Pbx9nqZURgIGT9+ksRrrH33g6ozxE4pHSBSo44mr
         AFnYVqYfzwmU6TSbzCWk8NCc+uUZf1L0ggKq3NRIiDH/ZVXmlv9u7NlayBKBqma+AZC1
         RArgWzBQ20VJUG9syrMzKYp0qkK+ShCR/kQar8pFVdQVfSvxfgIojHNEfuPZ1vzdGreR
         COBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876218; x=1763481018;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwxwWH0h/k86KA6Lqbt4Xcny5Xif9KRZerM8f0+lE/Q=;
        b=s6bJCzna9n+a8AOSdljSpPpkFzUfHpJUZ4Dt8RJ+sditgSHJ5qN07R/JyIcUemu6jv
         4GLRquL5N2wBAaoFHdnvXVTNONbSVBSBIOGvZgwo6g7TDd786igCoExLh+GbDxe6IEsV
         g67y/zurw29kdge48Aa1yAsq3cHjD+nJOCCLp3QHSa8iyA3yR/JrBl7/Rkk1jNIyUKv2
         4uxZ+qbD5P7F41gQyHYKzUewmipW01Ktx5agOgZGxepxHWfuXHbKGWHZW0ykY1XzCYWn
         oqaXNji5IsKHzjaQ2umvzbox1Cov4dP0zTGlMMDL2CQyX5fEq0E1QSV2ozYTVNhshzSB
         dgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtxIW250cXzEKoIRsnKINSUcwefeBDO6NnyA4J/queUGRPiusRV0Fp+o83eyPL83fWKzydJ9mBCWwFPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx737+ukwK+eWryi33HuBSKc7EPPwuKuvFkKO6HP+ejHYHsUtra
	DKresDykMyd5WSyTvV/2aUI9FDqgu9v0WDka01p3Ee+jaDSS466J9562
X-Gm-Gg: ASbGncs7bmJiOlV4WF+vbT8NHaZOsAF1h2AYGkzGW6F0eHYaUq1abCjMszsMJ4TqIFG
	fAY0YUFPpE82JwuMDQgGlniT37tRUqY16gEsjqCD4RUJloxpns2wEhSkS4iBRzZXwAeHM+9cLRV
	FDlPITglc7ZZbjZzlr3IW2ntNJ5o8yZGctxzSTfF8x2ZHk8CT8zKmSQ8vkklQ01LzVOkbS820Iu
	Btl/qobaAXZLiBsUgCrs9hyXGHlTRIZ0+yhRE7DVsYERBxCIoQAhnzjBawmehHDClWvQhcd5b3z
	NRTtqlwyF/jviGQwSvpxQLzfY3V9omBnIa4HqfD6HkFY6CEWga08KDwIlfAOrCuNRnTxv38w3BK
	kWuiftN4Hy01CWAOmJSjeOhNM3v/aeJ2FqXNRPB735HpEZBFvylX5VED6Fy6jYcbwap+3cnwiEh
	/6DA==
X-Google-Smtp-Source: AGHT+IFUeZ86WNREaY3JnN9DeD2rSCTPmqw3Crt4HqqKMYEinhAe5X1WLVaqt8s1Jagy5zo/mu0g8Q==
X-Received: by 2002:a17:902:fc4f:b0:295:55f:8ebb with SMTP id d9443c01a7336-298408213e4mr48838695ad.21.1762876217391;
        Tue, 11 Nov 2025 07:50:17 -0800 (PST)
Received: from localhost ([111.55.24.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbdb09fsm1087615ad.17.2025.11.11.07.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:50:17 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Date: Tue, 11 Nov 2025 23:50:09 +0800
Subject: [PATCH v2] clk: spacemit: fix comment typo
MIME-Version: 1.0
Message-Id: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
X-B4-Tracking: v=1; b=H4sIADBbE2kC/22NQQqDMBBFryKz7pQkatGuvEdxoeOoA9VIYkNFv
 HtTobuuhvf5/80Onp2wh3uyg+MgXuwcwVwSoLGZB0bpIoNRJtfKFNhm2MsbiV44xbtui0WVFqT
 LnlNFGcTl4jh2TuujjjyKX63bzidBf9Ofr/zrCxo1UtN1bZoXim9ZNUyNPK9kJ6iP4/gAIVCcB
 rYAAAA=
X-Change-ID: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762876212; l=1164;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=DHlxEl4Cm3VRdwsbOA/YSIyQycDreMiqXswBc5rWTMo=;
 b=y7lORg16U5lsvcS9/DoSo7mwT5fo22eEVpj3gCoSuWbYgbLul4lhSwzA8UAzZmSxgvPPJorn1
 KMkTZ/dZIi5AGLNsXQ9FoACulckMazmMA6jsBicgtNXnh6nT7N+o4BK
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_075018_534989_08515679 
X-CRM114-Status: GOOD (  10.48  )
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

Fix incorrect comment to match the filename.

Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Hi Stephen,

Could you please take a look at this patch for inclusion?

Thanks!
---
Changes in v2:
- Simplify commit message.
- Link to v1: https://lore.kernel.org/r/20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com
---
 drivers/clk/spacemit/ccu_mix.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 54d40cd39b27..c406508e3504 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_gate_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_ops;
 extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
-#endif /* _CCU_DIV_H_ */
+#endif /* _CCU_MIX_H_ */

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
