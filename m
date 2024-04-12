Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A4DC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 04:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9pJsvbALNE8k8PdOsU6Pb783C2RTZ6x6AS/NumCdieA=; b=dIWfYkaLrrmtl/
	I2w1cpnkTKZZ6qQeK9d7NTxv7l+BJRR4ppyedpmQjJYiStQDxOn/f9g0F52F9HMtw4Rai35XwNm0n
	yhJABXfPpWY1IXpxHINusN9E+s26EjjK9/jRUzj7ecMyqhbJd1vT6NLNsCiwYUc8/vuv9mqtinXNH
	TE/bUeNe/iHvUnh9WczYuoS0gDoPfAbYi0LWCZNJi/Q3EnXSKXATZF42YQ8FAxuwPlBe9pRC1jWyc
	dclXlpix9k1ViYSVwgC1ArwABApmI1v/RRCDf2jrFrPTRS8CwQvFUzeXrKvqNQDMUW+9Cb6alSyJJ
	8pGuXrObk2KAqdfhIzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8Gw-0000000FAio-31YA;
	Fri, 12 Apr 2024 04:12:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8GL-0000000FA9t-2lkH
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:11:43 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ecff9df447so554308b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895101; x=1713499901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Sixzgo2r7kg6GY3Fpd4pBZrh6mU/5eZgncRXiQPqfM=;
        b=ZpGTjR3vYoS41RTwXyaod4/+wT+RvyU07cfzfIU3mpZ1dGo7MqcaUqAfYopDvckX22
         is5WJPVjlyou6ZijYgeRI5RHSIwOuBUHhH7QOq2lE/r5xkHTmaNm6EUkPBUO9EToaoni
         5ysrhnTX1m5r8kb6m8oNL1GYWUJn6uPt94/0PNpVdmjLBZMnD5dna4BeIbsfWB4w/L0L
         ACvk298EavEJWHLoJdWBhr3kPkXTM3YhBH9TZ71ix1aI7yqQbEMMHraVMZMIej/JctBe
         IitUw5gsz1YbBt59JHjM+Z4zE0TSMugMb1XSIJNiN5u5j9afBCU96bzWouvkrfP55/0y
         pEBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895101; x=1713499901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Sixzgo2r7kg6GY3Fpd4pBZrh6mU/5eZgncRXiQPqfM=;
        b=wlV7d68PzgNWmk3Jzr5b9bvYfbECEqplIjA0R/QhvnkPKPqU9dTwdLoyzymyO4P3I4
         6FGsYGrTg1U36zIstqKjs6irSvYYCNi1om/c8H7lIvmqBqJPEKGgFI2wCQMbvGEdOkFb
         sZ8d7EN7HdVRVVxMw3mAP8AFQLNi4D+4+wliqIDJGQ3OG/syn35Vrb+NJcGxSfXBfhDx
         rXIsxW6WRHIKb1ASN6CEeglQqq9X2wJ8JrwaqNPPDzHgxVa2t3DR8t/k6cOKRwF5o7bF
         vj9VaKQbf34ebMdm3hXFN5XMBVVfxRgn5+hXKGjDtRxWZyU0//sGX64BDD+d7AKbTsU9
         f/Zg==
X-Gm-Message-State: AOJu0Yw2P3smiMdvAJnNMHxp6riqtVTrynxfmG/UDpdOTkJZIiBkSwNA
	nD8xq74HSMyoglnCozWX7YV+9P3nQQi3nR6+E3xJLrWsZnQ6CiW60qIO8yg9MXc=
X-Google-Smtp-Source: AGHT+IEba4NqNqNEkKrg/H8FclHdYVWy4WtxCQBbHrwXnwjMt5W/XGMP4yXrN/YV5Oq23+OyoGfHWg==
X-Received: by 2002:a05:6a00:c90:b0:6ec:da71:9c4c with SMTP id a16-20020a056a000c9000b006ecda719c4cmr2110137pfv.34.1712895100866;
        Thu, 11 Apr 2024 21:11:40 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:40 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:10 -0700
Subject: [PATCH 04/19] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-4-4af9815ec746@rivosinc.com>
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
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=1004;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=oL6I4ETw+/5YBi2SkRJ3Nc3nJsbymuJaBJHYjR4VtV4=;
 b=g/DzPC7a8tBrQ6gAdGC+lnd01Uz42ouki9Lrq70WlwEn3H44BQoong66ZykBP3aEbqygAr8DM
 /XZlDueiyI1BQs+8dexnhDJd/2hv+RQ1wih9R3Vr2glQhBTFzUpkdD5
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211141_880275_2BC4AD6D 
X-CRM114-Status: UNSURE (   9.44  )
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

The D1/D1s SoCs support xtheadvector which should be included in the
devicetree. Also include vendorid and archid for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..aee07d33a4d3 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,9 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vendorid = <0x00000000 0x0000005b7>;
+	                riscv,archid = <0x00000000 0x000000000>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
