Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A2EC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 04:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOmgjOyZJOU+T0jLjjCySI7rEwc7GxZEs37+rluGLbU=; b=o2z+mUObKmB6tk
	wc3HcaCPi6QRqj+KahBtWu3KCR3XDYq/8ur9cUgkdKzXqpaZ35KIOLxNMielNX3HUnfTaHsOeT2Ns
	C7m0yu6pMW1HoiiFjD8XXN+sx1of4Kn9gLlduFKBK8Ryblm7uvwuvgptwPXWfXdFxRQrK8zv6N/Bd
	aQljcZN1ircBojKfXNaiktaZ75WTV0l9dOzAhANyaMFyR94vRxUSNM4OInkHO2qwPy8kifCvjVg+A
	ZAS3ZUevbMbroSrJvdRzOZNb7uMwcOcKXR7NJAlZ7wh7JPiXDFTkRap2Us0A5OIBy3yIPFqV0L5nd
	PayLoW9hxl8yI2ItNOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpv0-0000000HIzB-1BqS;
	Thu, 25 Jul 2024 04:17:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWpuV-0000000HIWR-17zD
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 04:17:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fc52394c92so4438525ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jul 2024 21:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721881018; x=1722485818; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bl7FL30OkVSR9KKfP1MOd63cO3FMcJiJeLcU+QuQ6oo=;
        b=CJU1yJQM/MxWmXFJKvEAU9hETmk5WIpKmzZn4vG2i43x8R2g6G2+h5FiOIzEv0zKah
         mlUTmTnVtoNIZB71GDcDMxHr68owDS3EuAGcBy/LjDnpU1KzWEkOnILqmHMAlJrMw8Ss
         E0PcunfojphpfGF2EHXV+TQ7mfgmssixfyXDV2Ng+6AlS5myVyMkmfQDQbRoinN1kqcs
         Pr1NGk4hWx2HKJGVidzp6m0k+l+Pch65iVQKIdd6cajUzLtiTpGsrWPAHR006zJQ5Ggg
         UB6YEmm2FPHZCg8UrD/FkPtIKzD25vVlRhP8u6lTOtHTKO+EpgPuzKSK8UnHVbirqAGP
         KTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721881018; x=1722485818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl7FL30OkVSR9KKfP1MOd63cO3FMcJiJeLcU+QuQ6oo=;
        b=aE7/Kgg6ZP4ZvLoia56qIkAA/7kRxWovxdJH1ixOkXcBm/NtYqe/fg2N0tLRCHkqrL
         5PFbk7/VzDresqeeWaqsLD6P8tZJn0TLngHyjCIRn02jqIvLrk3FtYKfUKdVJu4Oz/sJ
         FnrIyvezHYXzRnHqoKmy3HH6lLBVScFbD6rJEtPvcMuSVLfO/jSdVD+D60hFsjV8dBGX
         C/X2q6LryhHtxQaapU2lYDj/USqQVQBrX8zNuBmOltsxjl3W/3LZ3m2I2etzSKnWsiMv
         JNqGvi5dTZ+EQJMhZnES0Sk5WU3O/z22e74y4oNAl2/6Yt+K2h1xRAdxpdAsqV6XeIGp
         HjWA==
X-Gm-Message-State: AOJu0YwKA77gJ6r3n0xff/ksEcN+K5PWiScjcmReTY2x1lpIPWlrzcKu
	FufpgrbSUWqW9/Van5fZ5/PjF7TKrCw2XFXXbruR3EXD7Uk9Mu71vabhaK0jlZM=
X-Google-Smtp-Source: AGHT+IGGnhgHDodsPCgQ6UyXFR+prkSvsgzOdtXT7tu1lWgXPK4jw88wpfPl+wuDLx5rpq/31UNUdA==
X-Received: by 2002:a17:902:e805:b0:1fd:a360:4469 with SMTP id d9443c01a7336-1fed3aed2e1mr21298935ad.42.1721881018228;
        Wed, 24 Jul 2024 21:16:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:57 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:28 -0700
Subject: [PATCH v8 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240724-xtheadvector-v8-11-cf043168e137@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880993; l=1263;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Wa14YWZIk9RhYyAbwAtIiX/m5fmL0frMClERaLHL5Mk=;
 b=xmbIZ1B4cKSUyD6sGNqgHqYRqihFCSgHjuco29gSzAmFOdqSolVqvaBL7jhiMzh4SdnMM0w+Y
 VMvahORP1Z1BInVyihNSSOAAqXvaXNpQANQN+QKsO1VjB47OhXOYLy5
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_211659_438049_37F2A9D1 
X-CRM114-Status: UNSURE (   8.85  )
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

Document support for thead vendor extensions using the key
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0 and xtheadvector extension using
the key RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 3db60a0911df..400753d166ee 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -266,3 +266,13 @@ The following keys are defined:
   represent the highest userspace virtual address usable.
 
 * :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0`: A bitmask containing the
+  thead vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * T-HEAD
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
+        extension is supported in the T-Head ISA extensions spec starting from
+	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
