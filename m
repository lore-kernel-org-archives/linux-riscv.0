Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EC1C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 05:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA+2IOyPuiPvQnC5lznNpN+oq8RWRvP67fTs3mO9+i4=; b=2Ib1BXmMlBfUjX
	/vfphtLIxVaBD/kksJwyHmUXMBHyWb8YLZiQgmW0uUsCoA17Tya2emQurCzDPl975p0Aoi3cmkaYl
	L4J5VH9JuYcgu78aYbEknh5+iNQakZKKPLSyDZW6/eGcQHa1hgWoHVwvCbaEWS+cCZIL9Quycrmhp
	eTAYPj56iOA3IChotL7v0Bp0STs2Ske/DUY2RhFNprvqZ4uwoc/rcxqXZ/5l2AC5Q3sj3ALTZZS3I
	L1Mt+xGJHRDR8z+RgBMyLXj2bBOeDTsqfnKuzuC+K6R1PW94jxLGG/5Kdl4U73wMFGIq6F2VsiJnG
	EaFyR/pMyziA2fMs4TtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv9JE-0000000FNER-0bPn;
	Fri, 12 Apr 2024 05:18:44 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv8Gb-0000000FAMB-1f8r
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 04:12:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6ecee1f325bso472013b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 21:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712895113; x=1713499913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOUeprLdHOU8cEpU799KylD0peVHBTaWNcK25xy1sNk=;
        b=Iq8n5OUsKmLQOMpS6WrEK5uJK8HS+uunK62lEjtEul2Bja5u0hyEs93vTsdkG3h2N7
         mDvhyEuSVKOv3NtZRjT/KmPpgZXM3yjk1Mxoq3QrtMAV5s3uFlKBqadsn4upFae3IVA8
         pqcRCfhTFPvDziRhHdGbcE0pQsZf3Vhp0BYUZnqpGv/wjx36dl9RrHcY/XrSufTJ0QM0
         d5U963fIZvUG+ozoy4u6pPjmPjukgOB0tNF5WRazlavGqdPDLsgFJ2/1P1bHDLxyp7cz
         Vb9qdSjawTIBX8mrTkf35/M05uljTfdvmaJD4N4J0Tti3pPCAUc8kKQYJk8D64ai1KGE
         czLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712895113; x=1713499913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOUeprLdHOU8cEpU799KylD0peVHBTaWNcK25xy1sNk=;
        b=u2Q6gucfAAOpisoP1+qoHLz3VrPB+nDLjBKbF0NjINcoqNgxGBO5IdGZzfjTCq04Kk
         OCtwVTyX0aBlEfEmf2tbUbdfiSt8KVGy2EfhfCbL5+3pAoOIaAemsLFoG0nbX2hfNjMF
         17Fng+hpcnG2JETIiqklJ7GN/KTty504WUJa+QXNyBUczVSk9A/9438qvZjoAqlBiSDV
         ANKDu1hyMggYjWvUjXBX2ev8gW9XL+9KOgVchZKreZY2sIY/KmhwYmglmhidKt1x0g8B
         EnsOFQpofCAuu3TG3kWE3vIerghTZqq/aMVQrM5cmuGgw7A4kM+7rSEZxI92P1zgAwqI
         qrAg==
X-Gm-Message-State: AOJu0YwBWDaPcHjRSPBvtRmV1g7oyJjtMnbB663r+I3iUSopj2O05CdU
	Ds7neq6gQV8gg9DkdaOdCcxwWm0ZjZkiyhPq0xMg9jnBahwLKg2aRmIh/YfHvkE=
X-Google-Smtp-Source: AGHT+IED3p/jhyvepbWDfXS+NkSfJRWurygM2oLU3V1hXND944PsU0f6q05HekJLfNfek/WJfI9eig==
X-Received: by 2002:a05:6a00:2da1:b0:6ed:de30:9e43 with SMTP id fb33-20020a056a002da100b006edde309e43mr1816601pfb.32.1712895112997;
        Thu, 11 Apr 2024 21:11:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ka13-20020a056a00938d00b006e57247f4e5sm1949712pfb.8.2024.04.11.21.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 21:11:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 11 Apr 2024 21:11:17 -0700
Subject: [PATCH 11/19] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240411-dev-charlie-support_thead_vector_6_9-v1-11-4af9815ec746@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712895091; l=655;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=GIHSCNvBGq9/NXbY8oLLRsk2prCOn2ba2+sGa13S19M=;
 b=mAvaWamAnbq08BHcEl80jizwRpsYisWXatxTk+5hgXDH4/1Sk+ipO6fgeViKIstip0OZAfrpK
 PyaZbv+RsurBGMnGF6brQSfUNL2lUdCG9CjDA0Su9bm8BYxy6igksdv
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_211158_061007_E5C4BC62 
X-CRM114-Status: UNSURE (   8.23  )
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

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 13bc99c995d1..e5a35efd56e0 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -219,6 +219,8 @@
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
