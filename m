Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF9CC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 05:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJg6XHBjO5z82nAxUFSt3lgv/35imd3NGP07Jn9V+Fo=; b=MNkVKt3yjeYYsz
	UDZVWj462HrfoXDuFtr56uKVUaA+LGGr+XoDoVUG8UkNioPa34lSJguy0SWch/qBxPGPGdPrgz3FZ
	F1K6n2xkoJDTpl9WuAP3prDItA57XZTk/08JZEwO+HiQP5z8cuzrboiW2DEVhf2v9lZa8OiJjAfAm
	ae8jDv1xy5+xFe1WTkB8kIk7nioW5e7GOZEZaks0/+DjYa6NWHQSakcGtUj1P6DedKVXJOBSpRF07
	x2CJc//oL1QquQE76LA4ZLOqBxdoZbaW5cczHr4LeWFeR2auZImZbN17me0Z3HQYLub8ply19pqxk
	qb2CqFhPic9Xxakh1wSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszR-000000097hr-0jCr;
	Wed, 03 Jul 2024 05:57:13 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszN-000000097eb-3LFa
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 05:57:11 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-48f96299046so1859777137.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 22:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986228; x=1720591028; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=iRW6iFrqxwPP/4pRh9wIgRBLlX/rhHk7sp/tRxESeWglo6cw2L28zUZ1bD3ZYa1XEm
         3b9Y2QYUJhFJrEbELIxPhiFONkqSHpqtGDOwm/mlcuqMUF4+9OdvLQiLei+KGlbSnVKc
         wJJwEThwrwyFchS25gsch2BgW5Dr7n328xDBAzABw+lFjY8U5EWNDcvIkIFjTPV64vZT
         59aNa8tqi+gYo3GV9dsqk6Ymmp7bKly4dBAxGhq2HgPmHC2BhGI0fk8Ru99nfQHSw61+
         wXqY1peIUlDxST0QLmo1SpjkB25VEGnoOs3aCymiqH705fr0VjD3CFTF4rJ2KBFRKvsL
         m2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986228; x=1720591028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=425S2jEpk/4yk63j4Ow9jwZmOCFjeEcHZbKGmEqnWN8=;
        b=JP612722oDBHTDUI9Ou+EtKu9YzlbAf3FpMhayxCKE6YWMvtWCo9DnOJAEsfyVQKV4
         6qT4o800Fa9Put5+1/wUa7gOzCQwc3/rdd2qXjCdKoRFSiqFmknvwG5Y3/c4B++Q4pV6
         SIi31r5ClHCXm5XVCgyutkKqvNd8OrjNrIOA+s4DzdP5DqYz87VUMuZVK/DaObFDNO9k
         dZYLNAvZbHG+8Ycu+lXX8ytdVsB4w1PR6ppHn3L8svOFGelVPwdI+ZfZM0Gz60NaT3WN
         ACp6sW7M++yv4ntkgEIrlROk/hGADP7rxjdA2SoMHLmawZLUN5nHMFz+kiiFjzUaKINe
         V8aQ==
X-Gm-Message-State: AOJu0YzZ0vbw5XtseWFB3gLoMKK1esipSPr75j/2bhHA2Zz8nKq3akoi
	0QzlBEPAsXUnxjHMofsX5UHMCxSHw4Q8XkVULgYipLB4WhScT5oKdN/AWapIxC8=
X-Google-Smtp-Source: AGHT+IG88slojnrcpUylTggNpN9VQexHVaXRtFlyPKNtjShl9oJwn4L30O8Mo2E41agg/TiMHNr5YQ==
X-Received: by 2002:a05:6102:19d8:b0:48f:95f5:507b with SMTP id ada2fe7eead31-48faf152008mr12485438137.31.1719986227984;
        Tue, 02 Jul 2024 22:57:07 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:57:07 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:26 -0700
Subject: [PATCH v4 06/13] RISC-V: define the elements of the VCSR vector
 CSR
MIME-Version: 1.0
Message-Id: <20240702-xtheadvector-v4-6-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=930;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0jkC45FH0LUvSVfvCEJuCBZ027fqPbAipPAnc4zFoN4=;
 b=6Q+Z3FOZMBsstZLmmdhAH3prUYL6lUJSpkZmRi1OCw/CqyP477CvmFjgXyaBRVaw08PBHr89t
 09L71Bw1E29CVgH5H7DhHsiOvvQT73JXK39wJHe5PiVuX48TVJ9yNEa
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_225709_908534_4119A170 
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

From: Heiko Stuebner <heiko@sntech.de>

The VCSR CSR contains two elements VXRM[2:1] and VXSAT[0].

Define constants for those to access the elements in a readable way.

Acked-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..3eeb07d73065 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -300,6 +300,10 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
