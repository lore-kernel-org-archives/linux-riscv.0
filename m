Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB5BC30658
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 03:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZ50SYwGxP9Nc0QBtxW6GVM7X14Pjnfs3MM/R8ty3HU=; b=lNNIR+UcvAoYr9
	70Fa+tBRHdLZkKsBnTrjchYFN81iV3ErQhzTHK4z8YfTstCJVQReGe/sCSDTTubZ8RBusI2a618+Y
	ENmoJIk98Qn8R8dGGLnj/1I5ragYCNukGEzF4r+9Rfn+iXn6vySikYGeQQEuFMc6puBpDfai1iHEM
	MN8BxMz3/zO0xxYP19eY9MBdN7+mHnioeNG1CTfYv65oHKj3p4rgbwX7SAjBPMSauvBuSVaM3aHe2
	h6ILXZ0JcJVevKzlMSY5yprFn2Qw16TZy9FqM3bga1m4stjB+COtWSH1KaMgm8IzWP5Qu+S9+bg1e
	0cHRygmBtSoYYkSDgV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOULF-00000005QuC-0d89;
	Tue, 02 Jul 2024 03:38:05 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOULC-00000005Qsy-0yV7
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 03:38:03 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3d55f1e52bcso2155519b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 20:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719891481; x=1720496281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf2nftHse7mnih+L4oXIzzh1aSKno0toJKgKYAsFq00=;
        b=AWksI2ijsB5u31YFfcSVQLi+yH7XwbJ8I9U2ZSaKP7Hd34GZwRuIV2SzZy8I/bI5j7
         6U/oGDYUJwSXMRkwxX00MJ6xxU2yjpaEs/iTdsDhe44Okwn3su7HSZfFRo/OHzQ8iS/1
         oxR2f9Uo3rekK/GRzGdepoZRECZ22TXHXfZbL/58OMYcXmxquqA57SPanvrou+beZl4g
         1QBjofiK84048kYEm33TpQT/aB+xsXFaOAP2NHZPPZT7svNuDCn+f9JWuAE4cHm3vDeG
         FDD8a0qd2JKbyf6mWjDG6ucNRLETbG8RF1ANvkHjy7d1okkXxyBU2XIvKF8J6ucojAye
         FeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719891481; x=1720496281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mf2nftHse7mnih+L4oXIzzh1aSKno0toJKgKYAsFq00=;
        b=XDTYGPDdJunxkfw0D4v/WrxrprvsXoJvKdfedrACLwAfJEATMG1Auw2Lto6j5YP8i6
         8OmakzbpLiR4WNPxFHd2ZBGq7RazsNMANbK7ic7pdeJf4lVier+pJFN8Cp9/KDMF5m3M
         qXw+Nw3b5vs8rn3GfHygVVM9njrOFbVcWgjoEDZ7C5wiIjksaOOCUhFl1rwD3qBsnwa/
         J/HUe2Rx9w1yPhm5tmeLVw3npg/v+zhtOtrko+A7gBwOeWzjOnOZlfqju2QZtKimBywn
         YZZLcuCdxRyd+4F0sj/DQUKdtiJmnBAQpbT6jyLN7NpSvw/QtlwheIXZEJQwBzzf4lf2
         Cn2w==
X-Forwarded-Encrypted: i=1; AJvYcCWBzMXe3Qz824uYc3KMQhG/glcZy7s7J4EJPw5pPHT09xtfLIhJdJnGF8ztLdbnBBE3hpKt3779pbCbUdCIc605d5YkT1GIfH+fI1cXzmdl
X-Gm-Message-State: AOJu0Ywri9t4fkTZo3u9A7LuCsC9DipwcjE+nb2PUw0BmLN3+aDvez6Y
	NKoTaS5NLVA8zkXCuG5vTk5+Y4AdrQjILz3NuiUKf+mtKd3IquSlm/RQxkBzHVY=
X-Google-Smtp-Source: AGHT+IETmkEcCkefLWA5V6ulLJS/8Y5AlXyYZMDR65nnKP80OvJYV1oR8Ah21icBDky6rOj33cY8Sw==
X-Received: by 2002:a05:6808:4494:b0:3d6:326d:c0df with SMTP id 5614622812f47-3d6b32e43d4mr13487852b6e.22.1719891481072;
        Mon, 01 Jul 2024 20:38:01 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708045aac85sm7537263b3a.174.2024.07.01.20.37.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 01 Jul 2024 20:38:00 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	sunilvl@ventanamicro.com,
	jesse@rivosinc.com,
	jrtc27@jrtc27.com,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	costa.shul@redhat.com,
	andy.chiu@sifive.com,
	samitolvanen@google.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v4] RISC-V: Provide the frequency of time CSR via hwprobe
Date: Tue,  2 Jul 2024 11:37:31 +0800
Message-Id: <20240702033731.71955-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240702033731.71955-1-cuiyunhui@bytedance.com>
References: <20240702033731.71955-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_203802_299084_6DC093DD 
X-CRM114-Status: GOOD (  14.06  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The RISC-V architecture makes a real time counter CSR (via RDTIME
instruction) available for applications in U-mode but there is no
architected mechanism for an application to discover the frequency
the counter is running at. Some applications (e.g., DPDK) use the
time counter for basic performance analysis as well as fine grained
time-keeping.

Add support to the hwprobe system call to export the time CSR
frequency to code running in U-mode.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Punit Agrawal <punit.agrawal@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 2 ++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 25d783be2878..e99008fc4501 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -257,3 +257,5 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 920fc6a586c9..8094b45fe16f 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -79,6 +79,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 3d1aa13a0bb2..45f32a60b9c3 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -8,6 +8,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/delay.h>
 #include <asm/sbi.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
@@ -232,6 +233,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
+		pair->value = riscv_timebase;
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
