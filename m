Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273CAC3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 03:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OpyAIpiYaFXhVZTxeFqDSMpNObbd+tCPFLQmjDdI14=; b=XobdrsJu4Wx9Iz
	+t5D4ghD4Kbdihevc5bDPtQ71izwZwCa1jQUO6Nr/vbH8XTnKJ8dWrhSMYUX4M40kd7DbuJHjWkER
	+5OSLhGG+cH2odRJUBAgav1jIYXbIen/DN3KhwP8YXmBZ+4D8uGXbMB5BcX3gAugkabW5oc8iu+rc
	nEXKXXcDIhPaUBYjRqntb1f/p2w1qRgVzNsT54k8aAePKtUoMp6VCzB1tk7jURbo5AvRISgJ56J2v
	RkUXUKCFm2ES516Bm7entFfzy7JKHPeM5naEMESqkB+tsUCzHAtPIv1gc5NVBX4CpuahecqNOkO/f
	cUtQCbT0vXGm5rUNHW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOc-00000002K6n-3Yre;
	Fri, 16 May 2025 03:06:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFlOZ-00000002K2c-3uIz
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 03:06:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22fa47d6578so15163535ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 20:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364757; x=1747969557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=j0eFmHGCnCc4K08lrb1tgMZwfMrvpoUmr1Dy7TTit7LzCsPVkbL7GKXzHOEXlBwCfk
         GsWrwBJuVdzWzZEsbACPihAGbDOsUHpBReeYWIkpJpVjIjd9YRFpv/vrEDk4wNVH97UI
         d30RXfjUbcXekBSFiV0BY+t11RYRHvyWvShzxnyaeK2vPKJuMF7QrZoscB3qHt9oTHkG
         iDzXD39dg/p6MbPT+0IDt8eM78dEQQ7jZk5Zu+3KfiXF4l/ISlrCoZzR9rCHglf1X8eZ
         eX169KyinQvzUjV/wsvWcjd6r5Z/bOladb/peif/yHwVLUqMV6tHZR3rEXXHQo1a2mqy
         H6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364757; x=1747969557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=DwPuoXVDgM5VTvk3fFR8EHgZVzHZusOT4lnd58AHnk/iMX7xLp487dn3J9n90JJAeC
         489FDgsTHx40qNZGyoIV+hl3+FYf6s8QmSDlfTs+LzvxWtll0tdHTXZ9X2VznRd5Guoo
         TdJLFDEhUoN733hm6z5gOXLu5lc8dBvffdgjA3aawz0RrZb1oihHu6QJiYdNCJzJjy9J
         TgmKp1Fp5ogYanhPphxRiwg5jWUK2hUXqO9newyovt8oztwW5kynRyoE8wy2bWky7c6k
         XiKLc+SI/DxYnT1YFOF8ePcFPHHPId1FqbeOhRIr8bQZtpLraUAYfkvLmJPeDuDtO/0n
         VQLA==
X-Forwarded-Encrypted: i=1; AJvYcCUnjDwfS20y4zsOV605Q12QHfpl+Efb7Ki24kyFdYRpjeen8c2FCTFqhRtU80GuvvwASZTdc4/mFZkLEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDVw9TL54EAXXV6oN65AhkiY32mTFTQSAEgYgE1/ouRSQ6o3ef
	gb6fxhbAOrWGEmwxSGcnHSdOnpl1GrrNhuLY0s1cZp2ESQf/sF5cXtA+bDA5hSrNGNk=
X-Gm-Gg: ASbGncvZpPBOcx0E4KIdwP65l33L5Ks/BvrhCr5wF/yR6D65Vty1GMEUoSLj/hv9Ivl
	Y23d2oCKUt9BCgvrJ1xOg06FKlv4rThdXmfnVP9nQ1A7772krBZOpGHwNLHmIO/p4a8b4D8Rj6O
	Yjbbo15FDi9jOaLzCRCRuXwYlhMM4FYBT+sogLY4dya8SdXtieMcW7JCftlqswwwaasJyx0pvqE
	u8Kz16x89JHPNtZRVcTFcXLNoEH69T+VaO954leyY4Sk/Cu6rAiU4icw8APVu36TffxGWenCaNr
	B+RiJWyQQ7B+yCYjEvf9lb4dXLamIbc/HQbdr+sKfmFdP2LcN/FI13OifMbheoDjsNHpg8AvU5Q
	T9/B2ALDBSEI=
X-Google-Smtp-Source: AGHT+IFJbPUK4tMDRuGc+co241YfBHz7E/gRc2tzvQ+RafzudJUC0EH4MsxgVnUHPIA3yanX+bcZ3A==
X-Received: by 2002:a17:903:2306:b0:223:5124:a16e with SMTP id d9443c01a7336-231d438a1c6mr23919555ad.5.1747364757539;
        Thu, 15 May 2025 20:05:57 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:56 -0700 (PDT)
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
Subject: [PATCH v2 07/12] riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 16 May 2025 11:03:05 +0800
Message-Id: <20250516030310.16950-8-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_200600_141266_DA1C4B59 
X-CRM114-Status: UNSURE (   7.10  )
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

Document the support for SiFive vendor extensions for
FP32-to-int8 Ranged Clip Instructions using
RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 16085b2ee64e..e15405e12239 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -349,3 +349,7 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
 	Instruction Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
+        vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
+	Clip Instructions Extensions Specification.
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
