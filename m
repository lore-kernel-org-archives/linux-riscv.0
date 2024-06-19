Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0630CC2BA1A
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 23:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2Wwq6lrjU/9lVdnHHeLYezE9adaKuLViIvPwX/6MpA=; b=ldAv15iW0EzGt5
	QXhHXkrJcf3CjZvkQDZ2Zpc6CkAelbqUiETuiJg4evsaQs1C2d6Dx/KiytS1uuif/u99SyM92pUm7
	3IfidIuLXkvKHj4uED098Egb7hwzjjDXiHFQd1YYxTyJG7S6eikSaERIDQNJw5X5LShYTTqyqnA4t
	k6kKoxy50mmMeVLk3AsS3gClWB9WBefX61QYeuNYY2SXpx56IylvqBrnkKYZY2avelJGdyN8iLjwM
	tE6Ms/nmJpOanl/qpq8i8ObX0PmRIVTplVHVNW5NQAspCruOgg5pz94YJattW7JZzit4iqAYqneBP
	lu/wDhByW9+tRxd+3sxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5Bf-000000033zM-1oVA;
	Wed, 19 Jun 2024 23:57:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK5BM-000000033kW-2dI5
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 23:57:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f717ee193fso2333875ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 16:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718841460; x=1719446260; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGm9bR48fQZKrjgDMB8aJbhbPwJ34IXCq2RfsHXoLZI=;
        b=gWWd5AvR5cpwX21PsLnzSXvXJy7zv/aPeItl3bPkkwgrrVo5K/rWlvUbK0C+YVA8GG
         mkAJHJH0YjdY+Z5RApy5qIAhOWNMFzbNPmCbibAP1IPkbItIUSNu8glJln4z/Mjmqk41
         tGDMcTSBxjWj48PugycMEDDO2pivDp+b+l0sAHIb0nmeDPiD5TmMpXs6QjeDsolRvYY4
         nxAQufqdtCJRZF08WK4W4dv+B+mLcoNgW14J3TPIB6Vbs4mvmQXs8wvn9qBC3rd5/8KG
         oBreR2jK1JYy5bekw5jC/J3n31rD+p+gNe0gksVNIDMEKfS050WNurdTy673c/poFOwM
         ZXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718841460; x=1719446260;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGm9bR48fQZKrjgDMB8aJbhbPwJ34IXCq2RfsHXoLZI=;
        b=tL0C5UMBeOa/I1q+NE9NLd7kRSI4sl3W0SRav+GPXrzcTpawHzpuNtxtXTu9azCiHX
         99x9A2ob7QNXrXGuYxAoDuPAv4DhHHscuDQAHxAwRxFt1X9bpB2zkxr++WAf/BrzpEUV
         MiUu9tkBoF0KBSDx1nFQMZzeaJlNmDCLsbhSApKZw7sB7TYoKcO9SgIuUSKrjO62XlMn
         jBVAlXoUSGNXBZgb7mVi/CnRnJF4Wa7Fsg3qOMm4wT/BErNZ4T27qFm5O8uDv7/MdEnM
         EQyhCdWyc69SIJ0G5J8SaEVnl5HDItwJvaNeCewfCM04KSOX6wrB8izBaJXBiA8m6P3w
         7G3Q==
X-Gm-Message-State: AOJu0Ywl8/l7Iet44ZU4Wc8AvPc7l/YHm67L3dEsruNzfS3eWrFhN1Cz
	cY62Z1enuKkT0fzzFJtOmX9dZktowPFWD3lQz9uHXWjAq8Gi8bD9GUC8NzVyUKg=
X-Google-Smtp-Source: AGHT+IGZe6+GX7Bjo6+EdbnkSSMv0ycmgYSf0lOtQV9jqcllSY9oN2x7oysal0+JtdKkvzepk85+Ag==
X-Received: by 2002:a17:902:a503:b0:1f8:393e:8b9a with SMTP id d9443c01a7336-1f9aa3faf67mr36989385ad.33.1718841459802;
        Wed, 19 Jun 2024 16:57:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e70ae6sm123620745ad.71.2024.06.19.16.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 16:57:39 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 19 Jun 2024 16:57:20 -0700
Subject: [PATCH v3 07/13] riscv: csr: Add CSR encodings for
 VCSR_VXRM/VCSR_VXSAT
MIME-Version: 1.0
Message-Id: <20240619-xtheadvector-v3-7-bff39eb9668e@rivosinc.com>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
In-Reply-To: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718841444; l=755;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=AO/P99EqLjRLr+XZCKwsGlMw4bGAY6x2AzplV863nPM=;
 b=zhlgALb4EtAKwwNl6/SMtNUUGYnH1C52UqTG3+qHZUZP33vF3PwPV5WduUrw+JoeyKIcO9QR+
 RACEkaXfrmZBz9gFsj9GClo/uIZ0WJqc4L96CkCti6fvsaufYtXGxmS
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_165740_871602_AFC3347F 
X-CRM114-Status: UNSURE (   9.08  )
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
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
