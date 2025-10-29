Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36BFCCF9EA
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 00:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Af7lfGSDNke1aUznvzb47LrxjjF9UOmB6b2XJLugB08=; b=DxSFZkw1o1uo0l
	Dw6KrdH2i9k2DHozVtx7uUEXKrXSOZeknOIs2SVRG9ScXalZdFRg/9uQaiSdjo5a/991DRHt19S1q
	k6hl5hoRe0caMay1yLIgCAFoDg4sdWlyLdc+knL70jwQhhZ07+Pj4e0QVIsmmZPThtLtYo48J98Jw
	xeKyTuNVIjXgoxs0KQXiB+N2w57GHQvYcb4w+zhuzOw4wXGwaQwadEYxhYIjbphQpaXW/AMRrFEtO
	sQid6pjAJgZdlV7zH5ydg7FWS77j1lBuVLpC9DJ6ddJgrnQWxFQ5qAfQfloRzD6tuCpL6YVhV9sdW
	gkGm5D5t/TqPJ35jRqVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtn4-0000000GqLF-0opZ;
	Wed, 29 Oct 2025 00:11:50 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtn1-0000000GqJZ-2u5Y
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 00:11:49 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-7ea50f94045so4454796d6.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 17:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696706; x=1762301506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq2p1V6khYqdwj7axqsIU1Jb8x290oJDm2pwh+Ywad8=;
        b=jCc12TqTL4gRERWik/7tkpdSZJ58VsCRhmSLPP0k2LadguSNaJWHb4fcZtkbcEV7AO
         FA10Z4xRkwnAeQrlr/znN5ogntGeim7oEQwvtUgpXiNMoBZyr6n6GrD+bulpOnpI8oj0
         YshbH4glUC560USjPWqmkRt1TEg92QfoFlYCx50zi7kzzbfbhK6AbS2Sf+Vb8eU3/aWD
         Dx52OoOW8gFKXevBNkymmex7iBEPPn0ynPtmslbTTnE3eS60l8NHn1g73MHaFmGZL7Cu
         oabyp+DLFu27MlC5jvQqagba0gCHszsqOwhnSHOnmDFp91zz3yXg1v7Q8jE+doHTAVzs
         Bndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696706; x=1762301506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tq2p1V6khYqdwj7axqsIU1Jb8x290oJDm2pwh+Ywad8=;
        b=wke113X83bX8YGHUB2m/ari2YoeRiCDSRgnjq1hyfhvlTP0niVR+xybxlGs2yFN72L
         CtV43XmIOcUkNahp1C1zqcU7nHgvLt6KP3Stkq24Tl0kL91dsksElzZcL64UgMVReZUG
         sc0ttKv7ujEjcGfrrdiFc+Yuqy/ZLSDQNmw3gx0AfjbYbWyaJW22lsm71HasMY57eLtG
         6rN3I6OKW45O0oRBBn+YyNv3KGQiV7zGy66LJMoJT3T5za7e5VSRggHVD2R4oPTOf9Cn
         1cyn0gksTSNkii65X5FUYB6zU+ItXBBUVUy9bFtfCO4kN/TFI4P/IOtrvBMTxP9zdsOu
         g1Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXCnnP7WmRJmbpJ2Cl6PUUADhKWIpabMnWeRHJtq9/fyEhwgVsHV13msfTKmUOkBrEDlqaT2BFYtj+ulw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx3coPOCvviZcZrqU2Z3nlwj1jTCIMM01Cdo/GFqNXeOZC3BCj
	Rq4KAchqvDZ0oqyDX+hGf8uCmC/Myhru/NLwHXOp3chR3ne6NmP7l+zg
X-Gm-Gg: ASbGnct+/OwhgjTq2AarA1QpEjS7Ib6Orm5ADMJMt58/TxLY9um47nzU+v+HUHcjwlz
	qoO09z7Wip3UIlc2slcEIvU9Y5pQ9qzYF3wa314EU13YI856irD6OLpQl+Cx1N7MlhSg7vNJZ7p
	uVuWS19K2cpCN+2xZUd62q/1yyNwQpe8L/+sJHfE3Fhoskz+EjfWSS5ous2Exz6zCVId5cQZxHu
	13ZIWJq93LCu9fcTljP+rtsobzopvIvuN06CBBnIb+Y0w22C44e7p4TaZM5pVhECHStVWZJ8Bl5
	w1pScFYyGXn2kHfRVK8/aKaB3rjLZib/5KVRUYi1fhn9+CZbVStJ1kHhanOUMQU12cl9tepkEnQ
	ASqK7lH3jwNZ3w+fRP5UaOgLM1m+7qq9KwarYYhwp4vQGxm758BblIHP3QhC+PDbaIGpyrdYB1g
	zYeM1z8OMOMEOy5/RA5VR4J6QQZGZVgczNgNEQFiGE36PP
X-Google-Smtp-Source: AGHT+IFhZd8hjXUHUkgWb5j59kFDmvYlbS3no4lghYJO/biRsJA71NeXCb5OP8OCzXDNjXkj1j2Y4Q==
X-Received: by 2002:a05:6214:234b:b0:77e:aba2:c8b1 with SMTP id 6a1803df08f44-87ffb49eae6mr67532066d6.22.1761696706418;
        Tue, 28 Oct 2025 17:11:46 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:46 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/5] dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
Date: Tue, 28 Oct 2025 20:10:50 -0400
Message-ID: <20251029001052.36774-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
References: <20251029001052.36774-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_171147_737439_85E04955 
X-CRM114-Status: UNSURE (   8.99  )
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

Document the compatible strings for the sg2000 [1] interrupt
controller and timer.

Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 Documentation/devicetree/bindings/timer/sifive,clint.yaml        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 5b827bc243011..122d622d20a57 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -69,6 +69,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2000-plic
               - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - sophgo,sg2044-plic
diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d85a1a088b35d..42cbfb4d46a17 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -48,6 +48,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2000-clint
               - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
