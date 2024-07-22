Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74C9C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 21:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dmv3b+M5pdP6+h0yvykWQ/hdzYyqvzjRPmuOKyLAkA=; b=EUgV1bCfpoisRX
	J/rk+7emnz7/E3MHW+CFhKRn53B/06g9ETABN+l0yooBrbJCGbKoMR08eZ5+WE7+rqFSA+6HEoD4F
	yCx8UxnGQoxQKSWAgQ0wip3l2dsJeFb+QbDQ6ebaZ6AI+k3HOhepzq7T+nZMgUq8wwGeN8/YtyjQv
	qI9oguW8LcAA2bnlgMXR7O3wyY3IWOFzlFAMJZ48/if4Ha10V9fmD52BYdHS4LKfFDCaGsoCI1Nys
	ZsNLcHt2QZEJpAkWfnLDCPSJQkUlVKQw/efVj5jdxMt7qSFgc9NSFuMKtt1fseP4Lfxi8+T4qhoBi
	8PscAW0FGdS1hcnA1FUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW13W-0000000AfrC-1lef;
	Mon, 22 Jul 2024 21:58:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW13D-0000000AfZU-0SXA
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 21:58:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1fd66cddd07so1005535ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 14:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721685514; x=1722290314; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=DhkzxWBsmCoxxO4S8qQ8sP60h94JD74Luo6sg7z9yD9l+fwOemoo8yGrniiQwUgDs0
         ecCbOnNS+dyhtA99xpd3NJfRv8mFDHXdApuMix2wXt88KpTrztHgpK9IjU/KfxmilymC
         RunhgRH/2uTlNJgx5dJW7dzXIXn1uAXIaq5YlXWXPYEsp3xADhY8gCmOG88VI/dCQjeD
         XqFH9UJI2oEPDHxCVt3Nu8N6STEez8EEycRoVCQDZVV8s7F7n+Qjql7yJZ6yd+ELMfvj
         KuakGID/wGqUuy+6RGPIBWhCk8aRlQj/DSxRnr8ZhJpq9z5sfjsXVt5NJpyAtbVC802x
         Cd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721685514; x=1722290314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=fE2aC7ENrRxSXOw44c3i1GnY9RWqBYICIFCLL3JvjdQC82GTe/SGUAYE31m3k/qx/V
         9/5ifHtFQ1rcpP62Axd12Otpw7RxI1qbzTLMrK2AkJvRbjLIz/wZ68Zo51ZPHZ88qfPB
         BpZXAhD/ouU2EcKmbDUB4YER8xJFtTr88BV0Ob85taii6aDEZzTN0TZyiLQMz7yVM7uU
         exOpQ1iOCPoI8IH+kXuv6nCHiZyvZ/0LuRus37eMsu4JyZDIjueG9s9eJQMeuVZBVMb4
         lS5cV0ElmBVzkzhQJz9AApwBJwyPAJW6/AUwcKvnW+IgbjN0g4OX0A51mrwwdHTQ9TE6
         A/cg==
X-Gm-Message-State: AOJu0YysLC+Zt5TkRKckCpckdXYyAMoWxmEnDtLvsR2csW2Q5kQFYNOP
	l0YuF1OmXM3r7rc0UtQvGCOSeqTIX5NMQmFJBE5kCSkOCExFBZq3Jd1NpIthctg=
X-Google-Smtp-Source: AGHT+IFmou8rSkO/pXeWqn5Y08peXHpQQZJpzoyKzV+g8WtXw8VSsTRAbxkcuTo+xUK5I20cnMuzOQ==
X-Received: by 2002:a17:902:ec83:b0:1fc:2e38:d3de with SMTP id d9443c01a7336-1fdb5eb14a7mr13001095ad.7.1721685514562;
        Mon, 22 Jul 2024 14:58:34 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f44f0d4sm59997775ad.219.2024.07.22.14.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:58:33 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 22 Jul 2024 14:58:15 -0700
Subject: [PATCH v6 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240722-xtheadvector-v6-11-c9af0130fa00@rivosinc.com>
References: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
In-Reply-To: <20240722-xtheadvector-v6-0-c9af0130fa00@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721685488; l=1260;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
 b=RiMnA1+g5SPgw4LGch5qdpL5lwgJZjDhU+TTicDgiDFxBQRLn7rxsOmNZM3sDkGgoWCnfcU5S
 OXvLmirQIGQCTiByNpwWBWeN+HWIBf63huJ7QRj0Q5MhE6xaF+q7Esq
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_145835_218304_62F01B46 
X-CRM114-Status: UNSURE (   9.01  )
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
index 02eb4d98b7de..b48a06ef80e0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -264,3 +264,13 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long which
   represent the highest userspace virtual address usable.
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
