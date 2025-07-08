Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5067AC71130
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L87kR2h5aCqoIPhq8BjhgFkMeb4L2fKu+Xx+WU40Ahw=; b=BS3Qb/GS1r0bfa
	Dmk61qbKvgiHBXBC71gGLHRx1phFI1IBvH0mLrO+EpzkfYcKK1FLP7rvaEmJyTEECstQW84TxMHfC
	al0xraxvllSzMx6hQM8iP3S6/K6bvyvRH/plUW0Xge+RbRGBmc4MWrRMSq5ply4CDz5QyaE0DTKin
	hfMLSRZNA84Xiy1ny6eIX9CZpopFO9cgej9hK45Nb4pxZ/T2QiOuvtsyJo2jooKpXDWUuWl26twbp
	alk56EIIQDpWR5ki27z3RzcyejwM5Eqdh8w7X0If92E9HZfjbKzf5XlbV1st4vTpFspmbWJujO1wp
	VYuQSmoH6qQ3NLrCduPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2Ee-00000004VgO-02q4;
	Tue, 08 Jul 2025 06:55:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2Cc-00000004VFR-2YG3
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Jul 2025 06:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=RUaCIiC5eT7Qg5Sm8qe+PiTSoWZ3Xtk6pXg4jHYXzdA=; b=HfCSfMdoPyMo9K6DpqlH2DYCl+
	2nzsQwb5JywXUhRTFf3cao4LM1k+hInKKfGS0DF/BPU+gudlecwz5cdmcGUuUuPHr7Us+bZP7E2D5
	EA8bMvG7r+7g1DSVUhUy1de27LnoL15wf7DvkRnN3xMDkDMOLfnAsEwEV1vTON69QuowusqY4cvlt
	NQ42ZhdGXYF+0y5n0kSJPprqIsNuOr9MKWNgm49x4bCKAQsgbbOdz/iEu8cyDshmy1TdTEhb1nH7C
	d9GOd5YMb8a6x137K58lhEJmy0JuLSVuy8SCt8jtnG5EXyGqu6BULDFJa8IAbuSQ76ZN/pbVvuct9
	J6DB0auQ==;
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2CZ-00000008gxO-06FI
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 06:53:17 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-6facc3b9559so65186586d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 23:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751957592; x=1752562392; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUaCIiC5eT7Qg5Sm8qe+PiTSoWZ3Xtk6pXg4jHYXzdA=;
        b=e8D43EA8PN585QuF/wBmpuf8/QcSgyGXPmKNg7b5dUuJnAuAHhjrHXJqplJT/fCSgq
         v1U/HaotPemJ4ufmCwNH/d0AdPloMSqtfbOC9MnUTLqgj4l0Mwmv5zQAaHRhVg7E1GfS
         1GUjsoVaYkxwatP4bVtOdE5RLMg+aiLESjfRrcAhQY3ppC+hDzH7jVF1tYmlt6NX0C1B
         dp/jYc76+0BzXfQf9BMEGVIZ3gsSyUgl/FYUaPaofRIk+Yw7DI6YHy0LC43+zCp1wtGp
         gGNrI5bTJLwWfQ0Zbg6C5fiS2tvS3qmH2d/kJsweZYZpXE4XjbpXX/OxF11BudBFtly4
         ub9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751957592; x=1752562392;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUaCIiC5eT7Qg5Sm8qe+PiTSoWZ3Xtk6pXg4jHYXzdA=;
        b=bPblnj55MBcXB6nKDTWFGThdfa+SyDPZFAloyL/R+oUvzX6mp7IoVHc3d8ogdqEpdo
         tcf+/e0R8v6LZRu42gXjJnBftHytvCxU8iMu1ji9PUSXrrafa3eFgC9X2nGolqr/1WyA
         Gq2drREGGaNIudgFy9qSCBUoLehoewBPMbVMU+sMZdAwqTBKhWIAq+cW9Cslw412L0vt
         G+kSJ4dMAthAiH1BQ//NoL4vfPd41M4DKz04ZGa5rmRA3cr52p/UI/Tvipvj4wiATXVB
         UaJM5+FsgHW9wCATaFXWaAug0fbQnccmjo2H7FHL+i/YyDzdqCp2f63XowUqtaRtxShl
         zQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCVSN56393nVjbZTg6Wa3xyNX80qtpRvjybFmTDNMFHTVvw/st2dT/uYRkdj7v7JYej/6laa2YW1Z7by0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyBLJmYMUrwH5eZylgDbu8cI2kONKMtaQuQMGX5rb5LB2aYFTQ
	vPZpmlKUdNukdAIALMmMPXhJ4mImSaK/XC4NHIuAq+xxw3MovchhqyTXNNodrs/u5MM=
X-Gm-Gg: ASbGnctZsl4yjkM3RX9t6TdO0j3dz4Oar+6Li2p7hElsCIDGdcbYeuKGPVHTHYyY5r9
	TDEyP9rinkYyfW7LP1B2bclflgUL8tiqVyAp9EyQTyuhaeOnYIrn0kCyz5U88eHIChlY2uqLLxx
	dbT2cPIxC9rLsl+KyU1ul0xQYoDaDK+/QH+r+1jSr51K1rrp8ODDErtKhLoAtIMNHUCvZISZipF
	IbfNFuB9jeyJ7HT33nAn56ZMSh2CnA4DPP5VT3i5O0lqaiKpKNXOsQzTEs5OKh/1OPHstF6713J
	4WipcBT4vxzPzBciIxxjOPuIHvyH9s+kx7jjEjFiuueWPaxJzOdclSJ8MiMW3HX2b/zrFhid7IO
	nXrKCfsgm
X-Google-Smtp-Source: AGHT+IFO5mmekcCC0R1ZHrs+gCMYv738zxfhnZx8tkn82YBM93zZS29An9l1jVIQp8jc/Pogs4YsmA==
X-Received: by 2002:ad4:5ce8:0:b0:6fa:c054:1628 with SMTP id 6a1803df08f44-702c6d66235mr267954486d6.23.1751957591948;
        Mon, 07 Jul 2025 23:53:11 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d50e14sm72109856d6.74.2025.07.07.23.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:53:11 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] dt-bindings: riscv: Add SiFive vendor extensions description
Date: Tue,  8 Jul 2025 14:52:42 +0800
Message-Id: <20250708065242.26371-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_075315_287057_C5A914B4 
X-CRM114-Status: UNSURE (   7.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add description for SiFive vendor extensions "xsfcflushdlone",
"xsfpgflushdlone" and "xsfcease".

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 72c1b063fdfe..10c37c61243d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -626,6 +626,24 @@ properties:
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
         # SiFive
+        - const: xsfcease
+          description:
+            SiFive CEASE Instruction Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/freedom-u740-c000-manual
+
+        - const: xsfcflushdlone
+          description:
+            SiFive L1D Cache Flush Instruction Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/freedom-u740-c000-manual
+
+        - const: xsfpgflushdlone
+          description:
+            SiFive PGFLUSH Instruction Extensions for the power management. The
+            CPU will flush the L1D and enter the cease state after executing
+            the instruction.
+
         - const: xsfqmaccdod
           description:
             SiFive Int8 Matrix Multiplication Extensions Specification.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
