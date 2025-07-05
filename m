Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D28C8303C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jBsN5fIq3nOcT5VYPYTQLXb+roi6lKr78RZS6XXd9Ck=; b=Ve3csg3K4N0sQg
	LI2PxSqQKCxIj5+QfJLuJYe0OnFvxGGrRnAwQ5+ao/FgjfLatVneXiTT3KchU1dlcd+xuUpF30jAb
	X1ZbMbNGTnmJNZa4JgpCDEf7RRUiRrYaF+kICTWeXm+v/VgwQNsngRy4tJXLdrasogtqw0NsoKPEI
	fzaV//QJSb1RUDShvSEyIdfypAcmuanXB6RXYcD1ueX0ZptLF/HkvmT4N1y/XRgmZmHh1PY0/usi4
	Bmpn8odI9YP90aCMnnB2a9JHt+4xTIhoFdZFd+MwGnZka0yFTxOp0AoO5W11bWk40oHktaHwLwGU2
	reJgy0hWcptORUO1//sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxi6-0000000GFYi-40LJ;
	Sat, 05 Jul 2025 07:53:22 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxVa-0000000GEXJ-0oNf
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 07:40:27 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso1978928b3a.2
        for <linux-riscv@lists.infradead.org>; Sat, 05 Jul 2025 00:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701225; x=1752306025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TdtCKmCXZJuQXIsMKlprNk8AhOeK48KprK7+CyhBCY=;
        b=XtHsk8iTc5R+ypbfUWqBsejeSjuEEV4WgtXwnAkBUuu+AYH+05pLOpO5ug50Xzd9q6
         jCS6HzFSGV3neczhbIN/svWLIa90Mvkx8gD8BdaLQZ0fnLNlwryDscoFiHRAMv3kFlRV
         VlvR7iXq0ZwVVdfEWQS8BTdQLJmi7M0Yh/F8xsap18V5H2jBasdgra2rf2lXC0zP3lcC
         m9BRRnWF+cGu1pE7/5NVQ2uLr2uTbMznbd5UdQlbjfFfP5osUiX34limNIatA77CteTt
         ANr6peuvs2RXavSEcWCUWrb5rkjIpJitHSxXcmOYSu+r/KTBYln4PIPmoZ7ippvrBTu3
         ZJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701225; x=1752306025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TdtCKmCXZJuQXIsMKlprNk8AhOeK48KprK7+CyhBCY=;
        b=OSY4dFOiMAiZau7Dlww0wv4srjkliBRkRAs8mWQtqo5eqhndyBXlS6h58qdo3oX93f
         fk2vARN2fh43G3Kes6qh0wOqC0ot0kGzlzxpzzoGRK+VqSTxSvxwrLY/XaX6iS6DJthQ
         2Hl8bF8Go5Rz3ZeIYdBrUejrFezhHThJo9ZKIrF4Uw3PMbjfJmglsQ82dgDIH6SQ3pOL
         tgY1+bziaVGJDEJmL7BBG3rqiY8DF1QBw4f3wbtJOO/JsmgLDeyl0kyHA68N/nbhUkRo
         TqBEzOCnSqmY5s8XijIbZvD8bO/s9RRsAvTEtPaEsQ8JRXfg/Id1sDTaTkrF2Q+zmjb8
         VcOA==
X-Forwarded-Encrypted: i=1; AJvYcCWko3Y8OEvFiD89Xd+p7apmQph+SbH4cy0XWrtOOLqEHTjRNpEKBoSA8RUIYeTDXF8ACzPYVgePovVFwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yynh0xVsbChHsLZgWl+TZjyVxEKI6uVTDX3l2Ji+mzrJshhcvL+
	AFH6HAO0E1vX+TuLl1whWxEy57VzoeOGIrWw1XS+kwF0eMIRPC6EB9Ho
X-Gm-Gg: ASbGncu69ny5fxzQ4+lbImXIp/iZSXTlrn8GOcHF5vFCU3IjKef6TA+KjCx4zOVeyz3
	bOT+llpvQPOjcZIYCQab3bR0GZHWUjpXopM88u6d3/GjhRWHB6m5X4vdrJwWdsScW3rsFobkx9A
	OliviJX/sDqFIf7AuYWvUmSfa137wRP5JnU2Q84e8dL6gxIi72wlIbw3PfQAtSsYOB5s5iz/H9C
	8gW3GAUfaShhncxqNVECSbMH9rGhWOf336F6BPB/AsEo/hYd4oL3P8CkiDsCFx/SZYtqXzTK0ib
	iU3A1ce2xO/jeqn92xdqfSJBisXb7qlnzhpDj2T3rmdfawSoQRoCfp9KSy+gqGXGg2hRJAOnn4k
	f/QMDfBE=
X-Google-Smtp-Source: AGHT+IHjXclbDebSZEtYRCAUOrQLhMMCQODW3kWiRYwINLupbFQ06Dfe9PNiuFjlOuB4EbYy6RonEw==
X-Received: by 2002:a05:6a00:14c9:b0:748:eb38:8830 with SMTP id d2e1a72fcca58-74ce6669b0emr6653982b3a.13.1751701224987;
        Sat, 05 Jul 2025 00:40:24 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:24 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X/V2.0 bindings
Date: Sat,  5 Jul 2025 15:39:54 +0800
Message-ID: <204c8214aa084d592e8dc45d6c5ca23381937b54.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751700954.git.rabenda.cn@gmail.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_004026_232046_55071617 
X-CRM114-Status: UNSURE (   8.35  )
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

Add DT binding documentation for the Sophgo SG2042_EVB_V1.X/V2.0 board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index b4c4d7a7d7ad..e21b65938a65 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -34,6 +34,8 @@ properties:
       - items:
           - enum:
               - milkv,pioneer
+              - sophgo,sg2042-evb-v1
+              - sophgo,sg2042-evb-v2
           - const: sophgo,sg2042
       - items:
           - enum:
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
