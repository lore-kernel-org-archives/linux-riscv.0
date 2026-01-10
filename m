Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E36CD277CE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ma/w0psBp7UCcRRN9ovpLFanOv0dDEIdG9Db9cnvBqg=; b=fo5PoTSMf/Ufkt
	B2O6L/8y1/YEbk/7PgT46Zs/GcEOdH+woxqmSY+Q7+uzBxS1B7Zmwq5KpwQsnMDmHJVJUa9X23mya
	NS7WygKea9wpSf2CMW0Q/bFLj0OlaiYIoqlKE6Qyw2cbOz+ratv/4adCdOQw8h+A5ZlqO1aCpEfFn
	WCd+BsUIAht8RCW/Uu+fh3E7B/i+p5zO3/zWjKVSaKShwRsIYB8a6STDtkc8CANfRJLfoPj1TxCJV
	eAtCqrLMbhfCs/DmVl5HS4IGNOVwoU2ZRw8qYqVqvLrdOR+mOhH2jaK+JntLqjAWEZBq1bGM/QAGi
	GqQdbczGxJRpzS6vRaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRO1-00000003Fvg-1BpN;
	Sat, 10 Jan 2026 05:19:41 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRNz-00000003FvF-1EJi
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:19:40 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c4464dfeae8so3321090a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022378; x=1768627178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB1julTcwsVwIqkOMTaY5tjMY89z5qQTP6TBk69d44k=;
        b=vZwDwjWrXnqub3YoyZpukXEwgWj8RZ2XcCYp6JkLz+lVrOI/rQt9xNy6bUK7JP5ee3
         AlOEqLqUXtCTxvsLflqwdyHKpHyiMaCDDDa0vIk/mrBwPCDlraFyXc6hLDI+AJerzRAx
         zWW63DRiTakiJpowFVjB7fJ50P4vJDOKSHdrMNdCHwlDqZkLrPAx7SXnnUOCgcWK5rVi
         co1mD3wDjAuS3YxSU5k3rS6VYE3CFz5CTkbu3e1+exKZYMQKl6d4boMJJ/8hLhy+I8xj
         jlWmypWCfFsiLI/NxTCYOyVJsQtIo5qVSqSgbOZLHfK2zgfdSM79AVdjU2Je6774XYSh
         dHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022378; x=1768627178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RB1julTcwsVwIqkOMTaY5tjMY89z5qQTP6TBk69d44k=;
        b=u/hZxfT3ICREK4JehyDSiWzj6prJPAu0awM1oHLGT4mCD8XVbgtbA/NtkEb7GxtMzx
         c0P/U/gfrREnPfvNAz+7ezJjiuqmZTFv/O04LJGoXRghZKrcJvRMPEqDSZO0w04BKI2P
         Q0NSAGP2d3GCrOAmE4/YvCP4VNolCNC+hMKHeoYjAjpLxcicOcO6sRfpZuUb4z50VIhw
         GqpaCLefUsd9hYvQX6bJiV5uQ+9ZspPmGtaYXPxoU4L38JPCDVN6UGUlAR8aJeuqjmup
         MnMTOXoz+iPv7jxtBiucERnEz/w9Bl9DTljq5l6ZQh9gKmfBfbPZJrb7XsOW9pHV94Tg
         N0gg==
X-Forwarded-Encrypted: i=1; AJvYcCVumrFxcDvEv4vyT158hHYrkD7X1NXiUUvDzTuCDCkyvyxfxy58eR6mX3U9zcEslHgumJmIgldr4W8liQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxig8oAK/3q5xSgggxu6W6v8nnXuveG5tc4Af0ccXCmes5mfWcs
	procdc+GIgXArjFhGUYnG/Q5q0+aGPTEkttuKL28LeIY9Blr5G5/KXPysObaSU7eXdM=
X-Gm-Gg: AY/fxX7RiK1NwaqDvTrDV/xH1GqeUXIDJOvMoNOTmfforeZfNBop5bLZpjAGswE3jpg
	pnbbgTkDEnykKypHOAE8vxBIH6PEhC8eqnAJAN1QuNyhjhyydWrRIhB87Kzpg9FFLfCLcsp8Py5
	V+EX9UKuLCcVjG2EF2+0usz091AU/zckT3mLeCKEkCPafm4n42xMWggNvaMkL4XhH4cCEL5aJ/9
	d/vmXVpTC+Mhbc/6j+zB4qjowJPEl7/3LNswt5LlV721n4TsykRoQkVZk92EC5G7/sQlQUxLmht
	e/E8P7UpthPU8YPw6xOkUw+Nb5OaKLQv3h1Y7Mn1+IKQfgd4oQTEwVQXca8ZATI8qi6TzCNoJ6v
	UjXI3fSIasqH1zc4D8A8MVNxgIe7SZfyCWpY4924a2ZLRublinBpg683hW5LYrghDi1lS0yrr84
	aqosIGbKyRXmOBeRxU23WLntVb/QPpSa3iRQ6ZtIY0wL/lr/0qE3cMLw==
X-Google-Smtp-Source: AGHT+IEbLN+ufDRbhXFu7As22NIuOsgWDNIIPN8ZaXZZdRrHya+Ppa2gw7UP6RqhkdSdQ7NFe5NtJg==
X-Received: by 2002:a17:903:1a6b:b0:2a0:a484:6b87 with SMTP id d9443c01a7336-2a3ee49c6dbmr128077985ad.47.1768022378403;
        Fri, 09 Jan 2026 21:19:38 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:38 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:16 +0800
Subject: [PATCH v4 04/11] dt-bindings: interrupt-controller: add SpacemiT
 K3 IMSIC
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-4-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_211939_343036_B63484E7 
X-CRM114-Status: UNSURE (   8.53  )
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

Add compatible string for SpacemiT K3 IMSIC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: Add Acked-by from Krzysztof.
v2: Fix the order to keep things alphabetically.
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index c23b5c09fdb9..feec122bddde 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -48,6 +48,7 @@ properties:
     items:
       - enum:
           - qemu,imsics
+          - spacemit,k3-imsics
       - const: riscv,imsics
 
   reg:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
