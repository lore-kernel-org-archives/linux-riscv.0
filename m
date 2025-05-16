Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB26DC2D0CD
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNs9rrKtsehTQLIToODsWiQKsTqRvqTzZdKCeRhPz8Y=; b=a6l7KVFv7a8ymm
	DkhjQF6iPJ3wS11yUsUxyLg9MtAz+K0aEOoT7g9NuSDUPq2iRtiku+lVsIWl1wLk2JHpYVA7WsE3i
	uDdiXORoiyHGrLX1dWDT8PtVdy004fmSihyH5KtSvxgKC/3qeZDGRstnpiqK2U7+qnadmGKlW4HhJ
	9MI8+ctDH9CrRCaoIJY5shYTdYNuCwuhQ+ktshUDpvbHAIphPLZNJTtyJvNYgTo3+V9Ir0/n4NM8x
	Ll5cWeYcszGaU7HRKJu1AJMgtHhHyVElh+bAIlBN8vv4FtX4KYsZnnTMD5x3qv6SWHUJjrmKuzmgE
	ZnoVSvePt5z8LqWvi9tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOO-00000002Jxd-3zHd;
	Fri, 16 May 2025 03:05:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOM-00000002JwF-10Z5
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:05:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22e033a3a07so17310895ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364745; x=1747969545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S7MyiF2v0D0T6HQzf2B/6wNFEauO5Mud7nBe7aMlvo=;
        b=M7YTBLe6h0CDmqyBLC8+G1Gu6vsqUanErxrHqkbonQW8eg/h+tNmJNge/LvDjk9jHe
         oOovfPIOGvc2HjVtwCdqvk4qbMNPPWN9yzCa6IUaxqXN23eu507jtEWr4wHUycrdzDUR
         6KdcUYwdS4uBlvep0glqiTVXlf9uWRPq2ssh2YnZPuyOAy38RtwLFp8cI6XpZW9MyrT9
         f5VlKnHBJ7b/2yIUh8y++jFCjrDeqXwjI9dIupYqOEMczvS9f6yruXolJCezk3KIN88K
         J/JK/kksycchldKk40gQyI4xD8xRf/KA6uRh5811JgsZIW9XP9ZQM0myYFIly52p/9gd
         7fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364745; x=1747969545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S7MyiF2v0D0T6HQzf2B/6wNFEauO5Mud7nBe7aMlvo=;
        b=ErCV2ZDq1trl8NA/VzhOkczjHhZx3arOwvIem4SrFtP4nuMKoW7+yIg+VcXpvhdTIX
         BB4vYKka02zRCRFaCiCaxPu1o5p2Flyt533cugWraFyZQhVp+BFHfAeQP0ufTpsWuiOB
         fXwJTHe2A7d3+4xP7SvS9uDRfgCX3doAOOi/okkfjw/fbzscsSfyztVWm9xp3xmKE213
         S1q7Z7vHaIQRFyVLRB85nLS/p//opotgXpyx4W4x//vUFAQtvfFJPnv9IpmqJw+R7bj1
         Xr7au+ghb+MHMJF58G8FYtuclPYY+2fnNwbTG2kydSKXm5jQRjq2ncgiYS47/15VDmxm
         Gq8w==
X-Forwarded-Encrypted: i=1; AJvYcCXZi1xY2MrNaYZBkRZrWld2OlHXr/wAQjLOrntIOOWWDTJXk4Lsbu4uzE8TPsymGN13F3sWUY6cwxEqhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfn+5TdGRuXMBf19JVoY04bH9MSZGaLlHGBpsxihufopzt6gA6
	JOdz+Nx/XW8dPRSTfC8VC5+O22Ycj2udFlLYUAkUu+9/VUsNF1MlmAXfkij9JvuGoA8=
X-Gm-Gg: ASbGncs9ybi2cUQHuQmtZ9wE6foj7QDiMZWI5xxBI4YWpub/TpBe39yLDA1byjgjLCo
	xgF3d01OM1oaHoTlbzNtfWaN9BepU6Cp4GydG94sn4Hsab8Hsu6CzjqP7VCb8TVxyOJNRMGmHkA
	epjuDAPhHmSmga2s8MGR1mYXFPtEYlVtQDAqbW4t01cjmPKu2kBlxOa1FOMgTWK0vKxK2IdgEzK
	VhwYnbvxfuDS8OKn5H0C++QwKnHU/OYBx8e8lqk5DZ10UBE2FKN/xgg8x0Db3Bk0IF3sKtNbujQ
	T3+SZVoW0ZDtw47v0JzemeNC1R9tEscqYhaoyY+QrfNnOJM3oRe3nu7xlVNoSoORIDPQWyC+B5a
	uAYszkUGbpYQ=
X-Google-Smtp-Source: AGHT+IGpLyKhdiQHbli57kVjo2ODSM/nuovDrJ88iNtBt5/DVi4ZJQUA/A+wNoA+ASM4Bu56mwj2dQ==
X-Received: by 2002:a17:902:d4c9:b0:223:3396:15e8 with SMTP id d9443c01a7336-231d4516a66mr24944235ad.22.1747364745377;
        Thu, 15 May 2025 20:05:45 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:44 -0700 (PDT)
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
Subject: [PATCH v2 03/12] riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
Date: Fri, 16 May 2025 11:03:01 +0800
Message-Id: <20250516030310.16950-4-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200546_284287_5A95AB56 
X-CRM114-Status: GOOD (  11.89  )
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
