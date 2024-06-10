Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7F4C27C4F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 22:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqa29ioM35s+IodLVgQOJA4vH7uxNMbOF41cX06Jpkg=; b=BaLsiNrvzFlhhk
	JK44/QldZsSFZMLbWwVpQoiUOYNdyr6We+HK/apKMsLfUSxZWZZsUpm3fmHVBRTMoTqxIxHKrS4zO
	4BjZ6xcoiD+JFgpBBFm20rG+NtJiPk3eqeUnHIhSWfLjmyETzOcUfI5Nk2GrDCcQ1X3qRr+HappCI
	aTocmqfrNgCAx6GUQbblfKYjjj7vOa06X7jB/JyspnfjsnWtERtWAKld/aJ2oOtwcfHx3BnIsVXJu
	cu9LrbeGZIFAptha5tQGQfkCyKsgvfBVMleMef/CfwSybk3Qd6+Auqpy4rysEiTSnyJC5oiBGQnqH
	HwD/0JzKYrYdFkY7BctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwv-00000006jjE-2GDf;
	Mon, 10 Jun 2024 22:57:13 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGnwk-00000006jaW-3eiG
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 22:57:06 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7041053c0fdso2385625b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 15:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718060221; x=1718665021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HBSOfNpcERRo+IfFfSUzbZmQ8OANKCSab29OA8NgQg=;
        b=estJc2lE+ASDpw8LqDYLqIby9jyM6wkdS0xU3piftuz8EoLAJl40T40cbdtHQrCiII
         8tUuhz09cMfAg8mH8WerbLLb5G5PL1FZgbiqtSr+DKe+iMojfxQKAkTRBWoQICmEGNIw
         MQMN1mD5IK7ZGNXwgdTLqiTRpqdXoU35BRAnOaFGIIPNGItf9PR1Jjxk2aEJG3DfnuUa
         wZz21yUYjPCQ3nZxYF0Qv7RZZzAHsqStGXVOHVXj+b9p/NXOUWc1nDcxiFSibA6Xfwxu
         S5ueL2UtS+nCNp9VGxtkIlqOSfa14bX4D8bBmcdvIPN66crk7c1Jx8EVTbfYlH2tJc/K
         XkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060221; x=1718665021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HBSOfNpcERRo+IfFfSUzbZmQ8OANKCSab29OA8NgQg=;
        b=pYsaWul8YSAUYdYSY7drDUIVrn22VOTHi120slFieuyYeg4ujCyBd9SOqcB8zc83/c
         xrHhWO/XUmJRdXVkN2So7wPodNJxKamLBg4iRQAJzefsXi6qhrz5A5y08vc2hdr5Kpu6
         sAXUgpgYIkWbWf5sUTdCqGmEGsEKcHUphN3GBwZDcQN5iex+DyUSM+uGw7GLOnGUgAgD
         XZzNUxqza3tDsAeIaBwJNNR9J9WzelYA0EzHLdBiCdFlwAJtxA7KlkFUI/lCUM3FAAXN
         u0wcRHyhnmCexv7b4pJoOd4lc7NR3Qmal1GClNnrpElZBYTui9qhCIJFoK3RHFRK8Aad
         /ONg==
X-Gm-Message-State: AOJu0YxNhj07l64ERCP1OT6zyhhI1x1LNd6+WjdMQlvAvNPp5Kc9n5DU
	qfdU64ATUCqWaDAqa/jvJuWOrqpRLhFT/pJLsncePs/4Hdetnj8jPU5gWJMngdg8Excmq+wn2xm
	/
X-Google-Smtp-Source: AGHT+IGIZbpFLMHE/lJ5GbefKME8Gn68phzhUe0FaeJN8+1dFczSl0GMa6MPZKO47tw63mwCQaqOEg==
X-Received: by 2002:a05:6a21:9991:b0:1b4:772d:2885 with SMTP id adf61e73a8af0-1b4772d29d3mr9114268637.3.1718060221031;
        Mon, 10 Jun 2024 15:57:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b597072sm18355865ad.99.2024.06.10.15.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:56:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 10 Jun 2024 15:56:44 -0700
Subject: [PATCH v2 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240610-xtheadvector-v2-7-97a48613ad64@rivosinc.com>
References: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
In-Reply-To: <20240610-xtheadvector-v2-0-97a48613ad64@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718060203; l=706;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=YRbwjAEMooOC1Wqfne0YGBAOlvdWm2exzND7IqGSDDM=;
 b=BM5m5V/nQRNhZjvOPuMabe0KTvggdAN05fZDbXe+2vVdatDi9tChErTOUmlzrP1AEH9N7fbby
 PcLGUrn7jT5APulSOlHctEyjRk1D0HhX5Gm8tzJtZGG2+4QDc9oh7fv
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_155703_226803_A6A0EA5A 
X-CRM114-Status: UNSURE (   9.02  )
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

The VXRM vector csr for xtheadvector has an encoding of 0xa and VXSAT
has an encoding of 0x9.

Co-developed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 18e178d83401..9086639a3dde 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -220,6 +220,8 @@
 #define VCSR_VXRM_MASK			3
 #define VCSR_VXRM_SHIFT			1
 #define VCSR_VXSAT_MASK			1
+#define VCSR_VXSAT			0x9
+#define VCSR_VXRM			0xa
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
