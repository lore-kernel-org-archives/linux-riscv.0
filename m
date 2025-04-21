Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78591C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bzg7CO8pRn2sWzPk91B5NlffjERspcFJKn4miZeuz98=; b=ZqBtE8hq9jyBkP
	YHrEBJbbBoDuuV++YmVa1JY55tjAh5CYYRng4ohPvOXZIPat0FR9Iivrc7yT9wziRcGIUGPziryOL
	1OfKaZom/1j377m1vh9wIwJe0xczGrr+EiEvxrszrOEvun01W/CGVg38WkUJdUVsn+uGj+rpn0D97
	/u8Fc6YPlGfjGL2Yj1XnXeUikuMUjmRf/YT3AsXwHD7wIAx1GJS27iCD6u35TdW90d5mWcUMRb2Is
	fsfzILLLBSn04QCEG59ZkR3FArKqPwZ7ZIp4z6KwRqpyoZ31DZHX/7guB2gBUOSeNwiIZY/2c0hn6
	2zL9l+wJqK7EK0OaEgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rvF-00000004QUH-2JV1;
	Mon, 21 Apr 2025 14:14:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rvC-00000004QTo-2gQ1
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 14:14:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so41582885e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 07:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745244892; x=1745849692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iId3OO4iPPoDitEFGGflVRfgetsV2ygJtDXi0T0AxTY=;
        b=Z+BWnyPpcPvxNm6cbHj1+iX/qH90v8Opskhvxs2wjjAeGUdnbvYNEw8RDq/2lOrzN0
         4Ey88zGvIu8mOZq2ycW4hUVEVE4RKeX1Zk8Lhyh4HjsOOzneHH+9+1mZ/l5P0WDVNhQn
         bQtP0JbeFYb2e7PHGu8mL0zZQYhK+rISFejQHZXyoXW88XOZLm4GbxctIVsLyxBDyZWi
         Feyvwgdlt4sqFjwv7maT4aMV9njxHk7a6R+1Y2Aj0AyxWA5k7qz78z7G39SuUFJ8QUj7
         FTF6T2JPTBeTnav9YPrmcFShz4yJqvxdpAojG1jJlw8aIGFZsbE81ATMSLvzh6CV0qrD
         j/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745244892; x=1745849692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iId3OO4iPPoDitEFGGflVRfgetsV2ygJtDXi0T0AxTY=;
        b=fydsXG5UVAK/ykZOyjdg4BIEE6Rsjbk6jV714YnlTL3DIPhRuflS3ztkub/iEb0WiD
         V+tZrc008a6kZ6AbJRZk5T0Sb49WtMJBjobf7ooT5UM9Ljl9sk+rPWz/egDvVA3K58Id
         Wkq3DyY6/JWYjUy0PaeutO5CygOOr17UcMC30LMTLnxaGpJ5eZq4wnxEFfqYvyi+DHVY
         2ynq2Tx14FPOQ/Wcf5bptYKqE9Pbiiq7zt65tYHMqxEXQ6g/Ujy6T4Y1oxzfI3hs0xnt
         u8BtcRbZh+LcUG5QC3f6wlg/rMTeM5AwCSRdMvJwrhGrlG0a+yfApb/yPKjRoNb2AGM8
         LKnA==
X-Forwarded-Encrypted: i=1; AJvYcCUynU0HghgAlNPA01/6PyJZ7THXVZ0acwRrh7i/xzPf3Ph/EV7eeSUwhvblE1l2KXpiZNOOcShq/vFg8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmEFJhSMfYGQHJnmiJ3XEFpM6/Rk8MqwBWCzQrmi7GcfK1x/Fi
	WYHIBTsyKw6Zu8+OzyKgOsVRQ/bmVwVIbtwkWPakNtIgOK9NyJGkP9/FEjXAXAM=
X-Gm-Gg: ASbGnculHc0JAcOo6ErGFUCmqyTlWrvEJ6OmvgcgSxGP3O6A2lMuLJPdzv/WZagxHTE
	vXVI8+4WxV6g453J0tTiZ7y44TBZYkL4CxvavQeth2C/60GJlRh4cTPcraCu3NFmqVzD5e+WgKF
	Pd010CZRXZ5ipm+9bBiU69ELiIUnyvFYiQdyuh6Bt+HJQoBm1rI9+/mr3vN6fK7ei/CIT+f/QAE
	BTSNaGYpj18yySodblonA8TZB+8CFe027B8ZcMmIuwf8LDxh3zDYbnq7+gmvJfEm7+czTCBjXti
	CFzNOXc/3Xb6vWmaR7Q6eYPFKkEjDVqc1luCydYv0WsTvCXP393V4HzpVJvpDNfi/Ygqktesq1K
	ybauNbQss
X-Google-Smtp-Source: AGHT+IG7GDN4v2GYmvAvZdURoHs4uth6LMLhvKJsf8zWUpG9THKVhntnk/wGfEVNyfGlNchCxTCbDw==
X-Received: by 2002:a05:600c:4ecc:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-4406ac17729mr92801105e9.29.1745244892524;
        Mon, 21 Apr 2025 07:14:52 -0700 (PDT)
Received: from localhost.localdomain (176-147-145-44.abo.bbox.fr. [176.147.145.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4403605892fsm116767405e9.2.2025.04.21.07.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:14:51 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: hwprobe: export Zabha extension
Date: Mon, 21 Apr 2025 16:14:13 +0200
Message-Id: <20250421141413.394444-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_071454_944635_870CBC7C 
X-CRM114-Status: GOOD (  10.50  )
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

Export Zabha through the hwprobe syscall.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index f60bf5991755..a4998ad2dfe0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -271,6 +271,10 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
        ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZABHA`: The Zabha extension is supported as
+       ratified in commit 49f49c842ff9 ("Update to Rafified state") of
+       riscv-zabha.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3c2fce939673..fca15f2bf6f3 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -81,6 +81,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 55)
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
+#define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..ed3123396a96 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -96,6 +96,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		 * presence in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(ZAAMO);
+		EXT_KEY(ZABHA);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZALRSC);
 		EXT_KEY(ZAWRS);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
