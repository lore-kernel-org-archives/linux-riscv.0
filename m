Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BE8CAC592
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHPed2PJKwTdVIZFTRJoNywbuOJRbcvhfzDHc4RdPrA=; b=kF7J7OBcsW75Z9
	mgBQ/s9E4a4kL1F4N1oxWnh1MdzvJup85uX066eagtBYKh3eL0D+aMN6abkXTJyKC6rcL2881hgK/
	CRul6SvZASfLEhx+awnPVxypr7P07CcosZknwTRXn4D8u5BkWWT/WAJVmXD5BSc2Arhw1LxvGmynF
	e1n/xkeuHHj3yhuBW82e3NciSpxtshObMnsJZVEl1aMo7lMe179DFNoWHXNJF8rgOm1ijiyhBTXOq
	VOZwcd5jtBFGV2xHvINdyiLjUAJuPg8cuNA/I5PZFBK12GzNIW3yFtkAEE9kPKmFoxNQagsrVWUNS
	njb+9Xfm8PD+IW9DYYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgy-000000025Uf-1n12;
	Fri, 19 Sep 2025 07:38:04 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgv-000000025SD-1Hmh
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:38:02 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7761b83fd01so1829906b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267480; x=1758872280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLsLBJWdfVYa2JlLG/bj2PxPL4kYEdygRJ5GLCZsFlo=;
        b=IpK0QpYpJ7/Slv2ibs+HBR3aPyINrhQalh/E2TxyerqzfD8eyXEiq/AYacMEBhDNoZ
         ZgEL2j6yMCTGg+gtH4S+970HfyhXXO58hUHc9+y+jCRbq1Z0OTGrDO94S2kWrIHuVlX2
         2qIOm4prhd0DpVdLK15h7YuNtYbEP23oNTRUWjjk5lAYxZH6tTG+GIS0+INrPRWSTzge
         f9yzLunLNWGaquiKxv4QW5k21cu/DdziR7NQHj+9OoSCdl27qAbY9T2hHlYHyGVsrkf1
         yt4PECEt3WzuJSz+RwbwvaAOBsw1+VaDDTJJg5XfWL/F32BO9j9yAh76khie3Qnhh/60
         BXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267480; x=1758872280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLsLBJWdfVYa2JlLG/bj2PxPL4kYEdygRJ5GLCZsFlo=;
        b=l2UJoHl8v7yblaBQpHyrBeZWYs64BTMeALTR6dFulkLgRVOJh7oneU+xqbCaUFmD61
         Ey4qEQDkqQcns0PVr3GGFKXE8wP9ahELukyHqKICRQt27pjgL6lvrRmixJjvI78TSZWa
         VNqyCpyOG5hBZZUtX3UeZ/IyAHTRBNpAPMatTNGde28rVyl7TSnehgRdwXIT+vg18FqO
         gGz1DLo3ZkMqttT/d0uW0EtSVtfSTOID8rJi9k3DQIa/OZRIh6eIIgtsg5N27oALfZlr
         ZO518B2heeWzn9XEGt/JBQoIE7vpgZDIn4Nb89aZsJZ+n33KrdBd9kEfrZTPaPyqMZhm
         brgA==
X-Forwarded-Encrypted: i=1; AJvYcCXnXk8bAU24yv6zxKSj1iB7O8C11LczJPDyfiNeo+Wp/494LNuzwD9MiwLEnXs59uhMGnbAIW+TdO1XHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrpOMeFuV/A2/hkG3qiTMNNVPFvf6lujVOnTGqbHe0P60HHRp4
	lQnS9GMsm4JsqYZvztaj92qnUpCqTCM7gKTGFbiw2WwxazT2aKbUTfVM4SA+STfFpqs=
X-Gm-Gg: ASbGncuHe6/gHJ6uMBZeE4fZ7IzlMTKOOdhYk3sby29qqiNJTdBrkhVyBvlPKDxSL/c
	s7wjcjrGYXEnE8Jx995geWrYM6dHJ6FxoyrK/JBnD/LCMISje0m9a1yGDJOoCSbT2vXwzZt/p92
	I/+nIl0HWwbIKwjUT704CTOBq8qR0Z/LmLi5XsrWjt/35oAhT6UlU2+dCGeqUVsbGdfFSlHlZal
	FGZCnLS73RspNPUJi6X9MW6mbByxrrXNUbcMohLydIhtNE8JHqP1qucCsXh9XKZr8MTghxNoYZm
	6rX3YTYLxGh0uRPnUsbbfJ8JdDrvjnhTVxArvuB1xh7/NcwkAUkwCI0Ojgy7oGDSRVhqdKbtdXP
	+OZ+ES7oaGqd5/faDdCLfw5nHFf9zrI3882Zmao/MGrKHvTz9Oxm3C2njNSCcVLSFfbROMgaqX7
	5BHwK7eh7nm7m0biygsI72CykfTT3AFSiB4PYJV0Dexg==
X-Google-Smtp-Source: AGHT+IEf5W21ek4SN0ll5sE3XkSqbMBzmLR+7/wUne5d4f1g+TFSnmeY9PodKHF4WkSxZeu62+QPKQ==
X-Received: by 2002:a05:6a21:3288:b0:264:94:3f5f with SMTP id adf61e73a8af0-2925c55263bmr3821388637.15.1758267480440;
        Fri, 19 Sep 2025 00:38:00 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:00 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 3/8] riscv: hwprobe: Export Zalasr extension
Date: Fri, 19 Sep 2025 15:37:09 +0800
Message-ID: <20250919073714.83063-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003801_342969_38517BF1 
X-CRM114-Status: GOOD (  11.26  )
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

Export the Zalasr extension to userspace using hwprobe.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2aa9be272d5de..067a3595fb9d5 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -249,6 +249,9 @@ The following keys are defined:
        defined in the in the RISC-V ISA manual starting from commit e87412e621f1
        ("integrate Zaamo and Zalrsc text (#1304)").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZALASR`: The Zalasr extension is supported as
+       frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
   * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
        defined in the in the RISC-V ISA manual starting from commit e87412e621f1
        ("integrate Zaamo and Zalrsc text (#1304)").
@@ -360,4 +363,4 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
\ No newline at end of file
+	Instruction Extensions Specification.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index aaf6ad9704993..d3a65f8ff7da4 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZALASR	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2beb..0529e692b1173 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -99,6 +99,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZAAMO);
 		EXT_KEY(ZABHA);
 		EXT_KEY(ZACAS);
+		EXT_KEY(ZALASR);
 		EXT_KEY(ZALRSC);
 		EXT_KEY(ZAWRS);
 		EXT_KEY(ZBA);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
