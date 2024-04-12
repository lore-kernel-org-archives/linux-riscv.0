Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BBCC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCU0OL7v4ylUucar+BLRW1YwqpTFNlEVVkhli7nnAfE=; b=Hxb0d+f7tiIlVk
	7DBwng4fteZhwTYKo6yBqlPEZfROBVahKJewAQddQsJxJ4Y/3G/5v0NQ+R5pVIuEGXilKCMHGAQ4H
	TgLmLnnu1eCSBFh8d5Ns7QDMGGOEbuRHm9HlmnDNc8NsQH5P4tJ1y7VfHEUuMzj/hIrRlkVqUzsqV
	7TMG1nZH9UJKHeW9mSACKNi5SnPftIzTEsbf/VBY8InCDPvjDnuj24sQVJRGV2VVywE+EK+v80ETm
	6kzjBA8BAkyy/Yuw7wVhBz75w65dQPbz6aNIZdfLYghHEjknFPve/z8bCEzDaTFAeV3YEhoTdrLPf
	NoA3dCfF5FTJY5Ugta2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8Ip-0000000FCIX-41dg;
	Fri, 12 Apr 2024 04:14:15 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8Gb-0000000FAKl-1bYV
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:12:03 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6ea1189de94so377172a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895111; x=1713499911; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/cX7KqBpjbvwnfweF/+d0sA0CANzzmggwTxwJIRs2g=;
        b=azezolF+TSADVbMabRhdDLYBKIW4EG4sLKVfq5fbTB8bb2ldqkYrT9riH9pkpH64qe
         bx4v3E+0uq7AF3+R0WOa/ttvOyfBOaVwDx8yAtGDEFtAVnuc34DoNxg2LFcNE9nCrCR7
         r7Ok/rps7quyVT1tCJjV2lOMh0ThgMe0tD4rDS33/nHnbw4Ppk85qyrNnPDakxhMyps7
         FQvFvtZclAcSrhOjQW5fjfoiP4sS7p5WmM0T5k81KYceowlvGMz17jy1rZNU4KHZimeg
         aj9CtsDiNPO5InHXsrkDzFWlR5a0zjsPXNf2BTHTZ5unZjNb/LgGAWX2KpK++zygj7TP
         7OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895111; x=1713499911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/cX7KqBpjbvwnfweF/+d0sA0CANzzmggwTxwJIRs2g=;
        b=QBrn/N6kqsADniTkFn29eCJRvoOA/kKWIwhaGaivinheI1h+7D38ZUSZfFvDsCKahS
         q9BvSnhMPXtxE3jbiamWhZJFtS1fW1M5CRmvuaWjqarfBCy4c3B54iWATSbi5omXTznR
         b6Pr5J4D4BRsu/Atv/+2wT2NvZOy6BhR6ETz3f7MlytzXcne0K10jOWtvV6q9PTstXv+
         IXSds2gNzNjWNRMefWjdD2046xiH6xb+CnmrOmpeOAcbC7fwATWa7bnqFLsNyGGOEOKT
         B/iOFqmF5BhzxfxSPW6V4+iREGjIW9XibAuuZXul10opPDkx6/C9AGcDLN6aLpViWtNc
         Ngzg==
X-Gm-Message-State: AOJu0Yz0+hmQuUpGX0OFgOzrF0DOm6BDUO208EV8mJhu80lr7xkzS63s
	fXaxhtvGbRfAyPFc30jEJGoRLAckXk1A2JSbknOE72aWEiBP/9t+OSg+gdaE+FQ=
X-Google-Smtp-Source: AGHT+IG7xfdr9GM09kld+gpoTRj53E+tx3TX3WdgGh40cliYEBj/2eByASG+/EjGzkDhX2ZzYVRIWg==
X-Received: by 2002:a54:4781:0:b0:3c4:e208:b784 with SMTP id o1-20020a544781000000b003c4e208b784mr1726036oic.27.1712895111330;
        Thu, 11 Apr 2024 21:11:51 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:50 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:16 -0700
Subject: [PATCH 10/19] RISC-V: define the elements of the VCSR vector CSR
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-10-4af9815ec746@rivosinc.com>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
In-Reply-To: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, 
 Heiko Stuebner <heiko@sntech.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=899;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=TuSThplyvDtTVWqwUFhV/gX6CqguLjbnzElxxGAX5lI=;
 b=IoxQnX7xJtd3/O6TEZTN81ZKioZw5d0r4tz8jwxoksLzmt6rX3y60kHb1haJbdArKfd+lqIbO
 ic08kmN1+92DSy5wQJq3UBtk09zK5SOAjN41rNduYXhvK29guCQEHVa
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211158_021397_02F174C9 
X-CRM114-Status: UNSURE (   8.24  )
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
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2468c55933cd..13bc99c995d1 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -215,6 +215,11 @@
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
