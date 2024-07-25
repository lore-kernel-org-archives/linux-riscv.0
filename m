Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B342DC3DA70
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 04:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMvfiyZmK03K841JEn54kVYf2nXjvG7mWZMBAHqspVQ=; b=QoxlxG5WVO7Us4
	nvTL5gkFwBf9w/03bYh8dAYjV3AEZKa9f23fpJ14VcUGbY2XjhNfAm5XV1dglFgZ6ZyiAAhlPDf0h
	N9SjSpVS5EDtbYjk8JsgETAOZcVtxGT6RQirZsWbPuwP9RQLpMnbl+n9Q9Mef0iRzd76KcJWfRMRg
	vo0IUR+OXwistV9/ChkQxzdLJOi9bSbsaThfsCX3F98uNsZ+1iAezd/mOQh6wjd8gsXxd4Ds7/dd3
	CWe0xZfjXUMFq4k7COydqbN/l1hHi7N95jU6iU2xftHkU3ZitX6dOmPa/EmZVGLbfNlbHArzjVyiH
	5nsHQ7DedUX+scJ5npzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuZ-0000000HIZz-1w6N;
	Thu, 25 Jul 2024 04:17:03 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuN-0000000HIPh-0p1W
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 04:16:55 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1fa9ecfb321so3341215ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 21:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881010; x=1722485810; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=hQnyWVNygs4ccYTMUuG0HddBxQ45twHE9ebB6HAVCCgpCgwsyEKpzyVmSiLajuMyML
         b5zyyaQ+5jIzk1+QHQ2ZMTrkw36J2rnDox+Wl5VIcfcOFC1kWrmgyhpz58ZLFc0o/7X4
         TWtCRElN6ocnc7UhunY5rzN7OkhQ1ZSqWhJb02XC9DtlPAA5QYlPZyiK+U0t3tYGqCWp
         5q67s+KfcX8Eg2/gwQAXux77v8al9986fCf7BwXKOKi/96n3sNXjJBgyKRuCYEQED2BF
         o2UO1puXSGz9P8bovyNgmd9rfv0uBg09YVyoksZH1H0gyV4EXGCQtgI6EQdHrHGsu+QF
         fzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881010; x=1722485810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7liFIbqG3XLVQtLXjuEuZ9H5FIup228+UAuRj2s502A=;
        b=gOye7Mo8q3wRgNVw/AoJXpd1ODtpKm+ZVqA7jOFuqjO3O7EY5YL/LCGnGnEssfKwZI
         GlsM7B3SaQnT2KmxNGl1VP9WvCrkx/KY8QuzP+xSaJqVsBL54tLvBrQ7OoEb57+Ahj86
         30U2Q5F4ghjLmh1O/HXAFvga++C7clcnBtFSunp4h1pnqxgDFraaPZy8AtAKB+lv9I3p
         6j/jtVJ2XOk6dNMnM9bWlCuyDYFCm8FwGK9uMff8oI6R4aE9yy346/DpRw9WsLXq2kwl
         6ASuauf/tRET/YJb++maz3BlXSaeek5IuMuQKnGHktff6Qy/tFBRC3KpbZsbSHR8T4GR
         98Aw==
X-Gm-Message-State: AOJu0Ywb+eYE5dj93pNEyK8IbMHQfiTYA8LW3qUQ12XnbkGOTsKw3uc8
	D0DquDxJPoTnDJaY95i2vnzs24ZQMfowLKpwc+O8OogLCDyaW9RY7fCGj3B7JLw=
X-Google-Smtp-Source: AGHT+IG9p5ieQtAxVwtwRrKMsQ3tH0oS7hdi8tXU1NiTxKTEptmOQ6kEQXaoXkVzZB80bKpXwXAfnQ==
X-Received: by 2002:a17:902:c407:b0:1fa:fc6a:858a with SMTP id d9443c01a7336-1fed384285emr18528395ad.15.1721881009991;
        Wed, 24 Jul 2024 21:16:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:24 -0700
Subject: [PATCH v8 07/13] riscv: csr: Add CSR encodings for
 CSR_VXRM/CSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v8-7-cf043168e137@rivosinc.com>
References: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880993; l=1045;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/awdvkpT37Pcv9l+R6WHhK0Ytr8TrWH5wurC23dujZY=;
 b=mF9QzvOtJ0E+YvogarHlMEGaWmhoxEtzqz8fpE1XE4GA1FOcmeiBqgyml12mHdPeg4HK29G9Q
 k3wj39Bgwa2AfUMTGV1y098m1KBZgSQ0bod6LyBScyOjBMjAsLalkez
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_211651_325173_E01A0332 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3eeb07d73065..c0a60c4ed911 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,9 +300,14 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
-#define VCSR_VXRM_MASK			3
-#define VCSR_VXRM_SHIFT			1
-#define VCSR_VXSAT_MASK			1
+/* xtheadvector symbolic CSR names */
+#define CSR_VXSAT		0x9
+#define CSR_VXRM		0xa
+
+/* xtheadvector CSR masks */
+#define CSR_VXRM_MASK		3
+#define CSR_VXRM_SHIFT		1
+#define CSR_VXSAT_MASK		1
 
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
