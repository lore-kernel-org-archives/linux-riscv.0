Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AE3C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 05:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNs9rrKtsehTQLIToODsWiQKsTqRvqTzZdKCeRhPz8Y=; b=OPQZsrswQzgHL2
	75IG+ml6ufc8Jdjkv59EqZMKeY0n7f1ve0Mrgh76H2PpPz0SL7ro4PPq+VGwfhIp1h9wxqTiQ36gL
	5IlMT5COAlqHhCSF5iJtR6bqmYEK08pBW9ei1dXvTxzB7L6So3bn39otUYb0TH8+ZzXy7+nqyLI6f
	kj6zoF3E4S/1LPtG2KdOBCoejtRrgyqHKv16L7MMK1zXKsZJ3gNXTAN+Xi3mDEbrOCHwrvBPp9dsD
	fSKtXv8oL0/cCEEbDg7dsi1HG6L1MDZ7bi9y2BnfaW6UUKoln53fSCzWktDwREh2mYjDtsKqaeXJr
	PGE8kkqXjWkEFteZZ2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMo-0000000F9Mf-05WZ;
	Fri, 18 Apr 2025 05:34:22 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5eMk-0000000F9Kg-317I
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 05:34:19 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7376dd56eccso1606722b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 22:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954458; x=1745559258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S7MyiF2v0D0T6HQzf2B/6wNFEauO5Mud7nBe7aMlvo=;
        b=W9ge3n0DnScTZLFOZ8GrPUTEQERuLgns4cTk7o9+4QVgCIlAcN9pw5dItbCLq4Sat8
         zTNzKSUwO4PDt+Jt+FXw0aQp2kc7N1V5lCuT0274DH8ALKx7n0Vq1eM+y3JfYR9dlv9c
         SaA7YUEJjrrXoPkOux+8T4bKrJbBeDuGSrWxvmS+W0ont7fzBAtqiQXRl6MWvVwu/KAp
         TM16qNtD1mFjYHPnkfAorS/H6oRef4htLn1p85yk8PZQGReNshp8j70kQra/b1D65Onh
         XVbO2YYFlAvLuesczYkFHBw93K0raXuGhXA6zB0YKEGsMGq5ruv4mbC6NpEBn712qpI+
         9Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954458; x=1745559258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S7MyiF2v0D0T6HQzf2B/6wNFEauO5Mud7nBe7aMlvo=;
        b=hbdk5Hx4v2ITAemHImfp7UvtacCg32GgaLHb0K5QuuL4RPFB+B0IrBd5MTOSke4aW5
         6QtKfmokdbTUjPy1XPD/Tmu6xdLVnX2ktaCED2iPh3BK4XwsSBWxcxsr1QB5YZQNBRT2
         d/cPrvMWIzG75pMghKKpkgRwzNYE/PgfPjrTAW3a3/SgQAkRGWlZGF+emZUAjvc+HRDR
         4Z0E+Xp/qEa/WoVHsG2SCzDiyztZV3TSYwj9426k/CfTpeVusuyXYJ1KMi6R6ZWbLqX5
         cyvyk9mJiQvBKsbL9dCZVnOLagZc8prVPmWJOhcaaFEwCkBUMLDAjqJevVXmofMw58dZ
         5IOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGFBRH2FvBF15wBQ73HITcawl6NNmXscQr+LeO8zHRoR9IZfLzfWtBU46oEPNalSpmitarQDIUembG7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMJSs8AKur8GG0eU9kz3xAutP5WX3hPr4gOoy1bOM5YV3NCvw/
	CWz0tfNYTgchgHMmxxbWNzMQrNOmaWtNinn+rF4P+V/nlgQL6jYPYKCacB9A780=
X-Gm-Gg: ASbGncsTeTkYwzfirqIrdXEFQYeDCy0PBB2Roj1fN9NYKUJuq6t+51g6NqFPfb5Oy5r
	6eknUf9Abo6oj1OlkQtvWBUUPhu0xDhdEwxn9wtt3/hZo3P9p4sSk2sw8wjFRQg20wT6jFxziaY
	lBHir+FknPi8LVt+4kiwVZFI9HRonDiiKiPp+KIS83sVapMwPCAEEU8YXztfbLHjgRiNc1fvehr
	/kE651el+9zGyWV1H3yvvnr/XEYadk/p3Gxm3Fxsc02HK02a21om0xZMwysdiXH53psIpv4ZjHy
	xqPV9UUBRJ/CAr7ygmHBUGjy0SqSEEttN2notiU88SExeuhpuTBkbnYcbur25swhB/uTKvSo5ok
	C
X-Google-Smtp-Source: AGHT+IFzBMKUz83vOCswwis98Y2gJZDeCmgG70swUr/qCZuSWaYO74i1Y9Ohxb7CG+IkshNDInqiMg==
X-Received: by 2002:a05:6a00:e14:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73dc14a56dbmr1687999b3a.10.1744954457781;
        Thu, 17 Apr 2025 22:34:17 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:16 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 03/12] riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
Date: Fri, 18 Apr 2025 13:32:30 +0800
Message-Id: <20250418053239.4351-4-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_223418_755227_65A2FAED 
X-CRM114-Status: GOOD (  11.34  )
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

Document the support for sifive vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0 and two vendor extensions for SiFive
Int8 Matrix Multiplication Instructions using
RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD and
RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 14 ++++++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 53607d962653..16085b2ee64e 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -335,3 +335,17 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbom block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0`: A bitmask containing the
+  sifive vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * SIFIVE
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD`: The Xsfqmaccdod vendor
+        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+	Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
+        extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
+	Instruction Extensions Specification.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1f690fea0e03..1c6977305776 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 12
+#define RISCV_HWPROBE_MAX_KEY 13
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3c2fce939673..9c70101f021b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -104,6 +104,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED	4
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	11
 #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
