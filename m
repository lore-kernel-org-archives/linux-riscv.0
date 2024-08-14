Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDBAC3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGZCeSWq0Mcv/vQTYmhKe54m6ZOxidtPl480BdyZsNQ=; b=Ks6LmoNb9eeHXr
	YoM/bcSQF4KaT6tKFFnlW6YHizaAfLGt2tHPJ/4LsFj+ZRihXkZ/vIBbXQiaWjGgTHczXmqVfWuuN
	fE36lGwnE3xDHDvyxg6JLwo7gVwi4vm6TWqfQYpnKfCWNlfY9UL3KXRcEkM/8wPkaagEb4vRyMBPn
	56AfADUg0tP/jOWlY2pjo8r17uw+PgtjBaAcT/62W05NmkPwVmKxZc89qdLLAHpBqRfSG06Plg+Mh
	b/BPe0ktVWjtr3sXqAsTXopZ0nYnF/bNf7tfxjYUIeeK0TUjEp3AOBCkNss/3WeBZAMfsgAANne1x
	qzXChOsqFi4Ojf4OEl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99n-00000006CjX-0Sqx;
	Wed, 14 Aug 2024 08:14:59 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99h-00000006Cep-0ng0
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:14:54 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-201d5af11a4so6030145ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623292; x=1724228092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fidSIArz80o0wKmWpcFbdk3lLWLuSUf3Uv0hxlg4FbY=;
        b=SSIdOz1fIIIMtEW4LQbpFStsjAU5mwqSpmCxC7jfx9MQF0s6aF1KiKuPZfbZzWtjkj
         Cycz1tmvWekcKgqYk5SMORkIhJVpB2+UFfYcF/xWOiYR+0GrCf2sgt9POr4bKhv9ASzy
         dNFPSdl4iVn7rMFodJJ/67fX85VFK4zn1fyO1m/GzGj21SUVKln2uML3w9hTrUpiGik4
         wAlk/fC7BjWKS+3J0gTLXBoLVOevMGZxYOXvrtRGUGMQKPwxg4PCLwvOeIow+ygzgoAW
         HtfcxvtzyFHPlq7+KH9cVfSd16OYKWoqnMOzVvIngBmQJP1tbvWUNmSGAc0srgDAGQJA
         anIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623292; x=1724228092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fidSIArz80o0wKmWpcFbdk3lLWLuSUf3Uv0hxlg4FbY=;
        b=pil+4c21+QqQPSq0KtDL0YkeKlMajzmeu6E7dUACd8YJT7wjckRpLM4hMbL3EM+Vi9
         Nsx2fVDkKJmaaPqLq+sxXX5L6hFsLuMescdvI1AbbAFI2dvvNCsUlEPaGeJtee+ixdvy
         0R3ZzH3aBLtYUS/tI6Im7/UNVmo6XTzJV0zUnXQOY5Dda0iamvBsaqXauH6rZmq6RxCg
         yMcnxOoM35wC7cc/7UTU6v/fmgFHAq6ZIBbnkURFoFv8VdYOcV/PkFOxrjVJXGkiuVJV
         rAUbsajeb1CZ23O09/3MsrIv6uOwv8JOT3s/iEWlXgDO8Da5LjUzAkFFgG8BCevxRpRj
         o/Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUjwEpRupuP6AhPO+Hz62fmUjZ1LYL13YXPwf6WwhRCu39kxsIYmWXpi2zJlcPe0T2xcpvL8kt/0B8AMtxm+V774IEDw9rGbiOYYJo59WLD
X-Gm-Message-State: AOJu0YwRvBNLfkVLj5RKQkjE+b44yKVdpzu9albbNJjwEVbFTUthHNQS
	roZnAeUpzhoiB73dQXFSdi66KDALZui7Ou0aMKwsEoXD6kNRUMYbFLlT3YY98uI=
X-Google-Smtp-Source: AGHT+IE8UNnN8LORA79EaMC36UpDVBceh0b55OXrqwIIrmTy2qwD1a63dvxtqWFfyCcizXrljF0Gew==
X-Received: by 2002:a17:902:ea12:b0:1fc:a869:7fb7 with SMTP id d9443c01a7336-201d64c5c41mr29498095ad.54.1723623292590;
        Wed, 14 Aug 2024 01:14:52 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd147ec4sm24868335ad.85.2024.08.14.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:14:52 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 08/10] riscv: hwprobe: Export the Supm ISA extension
Date: Wed, 14 Aug 2024 01:13:35 -0700
Message-ID: <20240814081437.956855-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081437.956855-1-samuel.holland@sifive.com>
References: <20240814081437.956855-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011453_294292_AD76EF80 
X-CRM114-Status: GOOD (  13.17  )
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

Supm is a virtual ISA extension defined in the RISC-V Pointer Masking
specification, which indicates that pointer masking is available in
U-mode. It can be provided by either Smnpm or Ssnpm, depending on which
mode the kernel runs in. Userspace should not care about this
distinction, so export Supm instead of either underlying extension.

Hide the extension if the kernel was compiled without support for the
pointer masking prctl() interface.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 3db60a0911df..a6d725b9d138 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -239,6 +239,9 @@ The following keys are defined:
        ratified in commit 98918c844281 ("Merge pull request #1217 from
        riscv/zawrs") of riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
+       defined in version 1.0.0-rc2 of the RISC-V Pointer Masking manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index b706c8e47b02..6fdaefa62e14 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -72,6 +72,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
+#define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 8d1b5c35d2a7..b6497dc0e7f1 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -150,6 +150,9 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZFH);
 			EXT_KEY(ZFHMIN);
 		}
+
+		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
+			EXT_KEY(SUPM);
 #undef EXT_KEY
 	}
 
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
