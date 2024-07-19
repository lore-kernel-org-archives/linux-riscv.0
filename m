Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D197C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dmv3b+M5pdP6+h0yvykWQ/hdzYyqvzjRPmuOKyLAkA=; b=Ux5TwSayYolK6L
	mEXgUq3s955cK3k87aXukQtlUvYEKX6H3P6gSTvFXNjc9GW9CMefSuL/wus53QLrGPWMa9v5c6MMS
	NTaFLCLo9xIWu8tPQS7iloMoQqic67D/H0yl316rNi/Q4oGwlxR4MdKOzj5F2bVuIDwyhFTXDFhRW
	U6ooXEt+YBA8Vo3HHML4p3SotTKFWWxph8TOI47zYL8/Kzid6sadZuEe9tZU0mdXPAvjppOVLSSTB
	6IrLGEsXutq8OsttBjobwkDbZWR6w9F4u5Jioy8BLBH4WBssbuBfU4n9e7y5JfmKlstQ2yqC0pwYS
	MmKM+AKgu2tjrMDoRLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKY-00000003EuL-0tRJ;
	Fri, 19 Jul 2024 16:19:38 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqKM-00000003EjL-09Ca
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:19:28 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-6e7e23b42c3so1370988a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405965; x=1722010765; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=gaHbLSpcheheKl05zxgvkWqmvM5e5dvaFwts7chfk9PB3bxcta8yZWhk/SDvkL7imM
         MwsD7iDug8c13lXU0EO6lQi85dYNASTyfRLZIgIEhcOtXmohUQ6gZ+y8aT/qXoXaJPuB
         Om6Zx/eJ9HYl8jL7uQd7pN8d4+pOqWy5Wo+IUvBASZ8TdatfCiQrYGl8vq83p0uZgQ7r
         Cl3t4gd9MH9hZ0AbkQqhUnl+L3ILDbkyzRa1VVe58xVlHL7KDEr7rkbF/u9wtjwlZbtX
         43XUoMc2OyeodsHQr7N0xNLMu5ul1/Yocm/HRHRDhgreNJXmh8T3gl3gTiafs+j9E311
         dIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405965; x=1722010765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFlUlKNClOcGHl95zNXTKC1SKxBdILei2erBqjtymyU=;
        b=DG9oRxfMrij5VMNsiqqZCftm6LjxEC+axINfK+RIgxpTAGjml37sg6uQIeZKUhPRhJ
         9S0Wh3tE8RhvE79V04eodbiepoz7IU2+B4G4AVhaatPwOuC1Baod5tZoxRWzhMVCdwai
         8s/xNX8zoOWtSfoBX9UlN4tNolOczT5NN/H3OZ2DGhmTJ3xD8cSYjHDs/3J1j6qhKSj4
         0bydXRVRziegI/TRIYacGLvd0rdPt+kjSkLIydL3Sg7SoAfUzgPXFO6w+nDKda0cxGFU
         4SZ6Lcn+KMZ6JB5t4tp3162zyBAMxGLw25Iuq14naM0llTAFuUTvCZx67ZUvD5P0DDk1
         H5Lw==
X-Gm-Message-State: AOJu0YwZgHpR+WkQ6ebYD6y4SpflNShHP1T3uGPmoCav14PhmykHJhbs
	8tHDUfACsGZwBDYjRGkVgjZRaoZNh1fKmiNjhYLNkovjBdSIbMXCfXCpnj1FgS0=
X-Google-Smtp-Source: AGHT+IG+HB2jI/StGSr1RNoXn3VLStcFpRF57Fl88HYhdj4U0L5ilYL3NbTS5IfVnDvuqFD3dzZ+cg==
X-Received: by 2002:a05:6a21:99a0:b0:1c4:17e1:14df with SMTP id adf61e73a8af0-1c417e116f0mr3471831637.48.1721405965448;
        Fri, 19 Jul 2024 09:19:25 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:24 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:19:06 -0700
Subject: [PATCH v5 11/13] riscv: hwprobe: Document thead vendor extensions
 and xtheadvector extension
MIME-Version: 1.0
Message-Id: <20240719-xtheadvector-v5-11-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1260;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=2W48pS8YjVGGuKgFcdTY4JQ+czvhIHjQutLR0sMQn0M=;
 b=b83pN5cReLz65nLlW1uCxPTq92FYXBW2GeKe7Fpuvsl6LxGyKXlFlAxAXBwI4XgnBGKqCgHTD
 rGs33ThNbkIBx9DcZJKtD9WQGIoUh6HL3J3yb5Xn9Bv0sGlcUfNgfXU
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091926_194470_B5FABA5D 
X-CRM114-Status: UNSURE (   8.95  )
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
