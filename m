Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B41C27C6E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fv9eKxOZfbD87CdAi4OhoJnVWbHw5UCHCEwpwYvDE0s=; b=3A34crGAFWmtGt
	KAkqeW61KDDEzOX+fFFMeMuz+T/SdLjabs+B+81V0jI/WXYMoLlTac2nBfzTlQ09fHQgjEYTeWIqa
	QOwLItE+R4ypwqiaMqJn4ZKRTFlPeE+Exe56tnCxYBP727hdYZVw9wfhnok4yP3sEyPcWwj8mEsfX
	3gOHwH+DaGkWB8INBvA5QL0TuxFtQ+WMk3QB0jPljtrIB3ZH3lJmRg2rvGot8Indu2bgub7y3Vu7n
	r9X9AxnYCsdB3wFzjId2TpIzVLtVgFEriTbQsH/vHZd4npfooxzICnJ95vIYGyjQmtmWZRtztlla2
	4L0Efw8RD17qxM9AI/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWut-00000003mcn-0B5h;
	Mon, 10 Jun 2024 04:45:59 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWuj-00000003mU9-2EAY
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:45:52 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1f4a5344ec7so29188435ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994748; x=1718599548; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P240Gh/m4dWtpIWWlN8DjDnG2wL4gQcnQEBhQHOtafc=;
        b=bWBJj7Yf+FLE12sL6WksnWloUL5ycNUKPLbzv+VwTAOy6VEYMIUxhDBz3Oo73FvVuU
         zKl67PNkL6QSWouc78way/qaSuKiJyhpHsrVvrHysJpDNtPGY4BOE5qLMfv82oSqsqdF
         w1UtYcbkMRc+JWRdSmbmINrB/eccvMrfPuhVtB6T1iYAeLF0jyNWQoMIMQ2e9h4SYB6z
         9zLuJOuX4q03DsLi/N3chWte8bJSD9HEOa6RcjwQjpfF/wwf8XdB/fcEjslWcMNNT6lC
         1DH54M9Wuu33iY8xuAfEZHE/hSg0cSRQaekxfft9yOaueOqe5cX+XuFYbdyznmg+zjoe
         cVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994748; x=1718599548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P240Gh/m4dWtpIWWlN8DjDnG2wL4gQcnQEBhQHOtafc=;
        b=ZEDP3xp58hc3rxlvPWgZCHWS85UU1KSrE2H9I5VFPKMrzWQodlzkHZ5BDVsNzbOHZj
         rMaZamUUuboqPgL3rZ7eenN6Q9LRWRr0lAFmcTxutF2l1LAa4mCSk3tPMDeqhM1Fe/fM
         XJLqpL2hxRnNMJmz28HW8aeYtKFK1zhevcmVyoqEq8jqNx3s0LRtXsIXPA4YS7x6gY6L
         dENsrUG66oEiCZFNmRxPinK8ZwzCXgo6xvvtwXoP+eCV3YAVWnRuLcnW2pJQE/FTM2O6
         5q5POu2sRPtwbw+swxHSvFLv4hgscR7Kfj2/1qJegc+J5+7doCk4D1XXDdIyIPGPu3+t
         lQXg==
X-Gm-Message-State: AOJu0YwOnQLavU/Y9F0hpSiMkm85Cvbm3u2T58rlLjxU/+wes+omlPtw
	ksoL4TjcGt84hxJlCfl3VqgVHS01C2e9RKYVLPn4qKZG50M2IdBeb3ohZG2tRS0=
X-Google-Smtp-Source: AGHT+IHHYkPAFs7Wybfe87tVbgyhX6m7aNDjY0QvnrXxzXLixuWmYwWBPXRWWuSdJ8YBrBa1EGWvsA==
X-Received: by 2002:a17:902:db11:b0:1f3:7da:b0f5 with SMTP id d9443c01a7336-1f6d019efbfmr128910115ad.22.1717994747846;
        Sun, 09 Jun 2024 21:45:47 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76ce8asm73124095ad.77.2024.06.09.21.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:45:47 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sun, 09 Jun 2024 21:45:11 -0700
Subject: [PATCH 06/13] RISC-V: define the elements of the VCSR vector CSR
MIME-Version: 1.0
Message-Id: <20240609-xtheadvector-v1-6-3fe591d7f109@rivosinc.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
In-Reply-To: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994732; l=954;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=rl/YEju2Da4Y30TCSeGgcBJQ4jtog67tmUBEGN9KrFw=;
 b=P25QoGbkxEpsQPOS3fSEe2wHlcp/4ddwgnPBsbhgltAUD65AsllR2lgWJ6YD0KH6hvNU90zge
 uLCtEb1QxJACMtDDLFk1aJU3wAfZckqIcjUQQVTLYFFInUydCNoG4cP
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_214549_929774_DB1F7FC0 
X-CRM114-Status: UNSURE (   8.70  )
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
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 25966995da04..18e178d83401 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -216,6 +216,11 @@
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
 
+/* VCSR flags */
+#define VCSR_VXRM_MASK			3
+#define VCSR_VXRM_SHIFT			1
+#define VCSR_VXSAT_MASK			1
+
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00
 #define CSR_TIME		0xc01

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
