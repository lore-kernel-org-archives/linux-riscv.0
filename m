Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15767D0E6D1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mce94jodX9dTXSvFVi5sLIMWdEkz6ps0J9aep9O13FY=; b=luLuqk2WsRcl3B
	J99aIfGoupnL5nZhEa9FECqyHt4vMGNE7V6b96vuixTLUr+EaSD7rZ/Mr7BsEF/8bDxHsMy99qno9
	BKVIocXKXVpjqxVmVzFF1JSFDly0nu0NS+JQjUIqa69PJMLHgr/TNj7pTS9cGxwDmfMR5aeVcC7Ug
	MQa1UTCPNDLAv0zI/pXrNpnA7cyntS9q3BMWrvPzSkFIeylntJEAWqJxxb9d8ypP5s8tUB7chxw8w
	mk6umvU2TWG1ta2MsWQ52mEPz6ZmegbOd18tdEtDvWTCuJiq2oViF5RdWSfPfZ6mzqunHk7NYP2ld
	DG1zhWFle2QzLNA4wfTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2o2V-00000006bF9-3q94;
	Mon, 21 Oct 2024 08:45:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2moa-00000006N6o-2fq4
	for linux-riscv@bombadil.infradead.org;
	Mon, 21 Oct 2024 07:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DhStVY7zbHyyvLFNMH69NpPsE3mDNu4WqRTVLLehUVk=; b=j7jvt1xeJFwTImXmbF0aO4LZ3+
	mGqbllx5zsJ35l7Nb6FLxLT5TQgMNO84n8z8ASdWCFxzgZUTmhrKw5X87o/3n1qqI59kHPjY5kjd6
	1V4cLAFFFiTC3CpJQ1a9H34xnc4u/4Zc5yWKk3Az/ilz2WQhQz22mF23jP3sAqrMbhliN0b2i5W4i
	+lcDeXKyeMCY55U+fwiuGz2+2lCa+rLL5Q9VVppyG0WCSgKDZK+ClSC/m0qHa0pU5fpt+AwfF2ByL
	N5Rj21WiVvakra+aufOWjxijfLoHnSiywWscGBFVs/bWwwu0BVlSDVyvWuSkbNhjfm4y0u+p0RCYt
	ah0X4ksg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2moV-00000007qZf-40DS
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 07:26:54 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20c714cd9c8so39505455ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 00:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729495608; x=1730100408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhStVY7zbHyyvLFNMH69NpPsE3mDNu4WqRTVLLehUVk=;
        b=POVexdbVJLQcIiW3gRjbdkS/nlYdBhz5Q8yIrGvwLW/ViXXQm5AEoxPwKdtNavwKj5
         pY9QXxv3DZYI5u/haJhDXoQgzUhPaUu8zGtM0B/lVTPVgpj783Fvt1b5wOpZoDsP/FLq
         Hnhx9vYrf/gZwzfc9YSdvARt4rX3NalaBgnMZVjTYWEjQWYjkuRzxMfJaYpitf4FjIHQ
         kNLPdxb0YsPNPwAscPC8NA/RAxbVpMZem2L1fSxQPiKzXzvE0JNmxjJsMpOufYAz6P57
         gnoyfD8Id2iiFGgMeD1cs8Iylv3LP7fKt+UFbg1c52mb6Y8ME3FxMxytervbBJCe0SqH
         7H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495608; x=1730100408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhStVY7zbHyyvLFNMH69NpPsE3mDNu4WqRTVLLehUVk=;
        b=wyR+AZDNlIX4Ma/apL6YEK/SNfqnmwLpEBaD+m7/WlpQk6xI0WHx6NAhjTApAQr+BQ
         7vD8rfZHp8xZCyP6iXeC1HP6Rxz8t6aoPWx3TtzYSoDO9m0wXgZ9+EN5zPzrSgGnWpQK
         +jE5AVzAmObZXIYSeakeHETT9+EPrqc8Ul1B94e6R6khaj7dPQyU9/g8Y7+8RaWx3rTb
         J4ZPcJQhP39wCNqsv28018PwwxpfI6pxcqLiMvMhmyYsIKlUo95udsUBtrMlFd6tXQOD
         yHInaSbabHM/SodzDJfMrYp2NSP1WmC5k18EFS1OHV28L/3hGDflk9k52nMYRnTVBMZU
         nM+w==
X-Forwarded-Encrypted: i=1; AJvYcCV1eWauewG8cVmfNOtPAtaSfI6v+hOJLU/0zaA2+bM5rsylYCXQU3XPZk6ZAJyGP1kkSrthib3ugD8CdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrN84m9V5upiYPEhyGKOLbc913NoexCOOE1Uzhii2SGPjrTSog
	u5cCf3JH378xnSlTAYy2ztEZrak0OeFJEMFOBJ3sYuuqzhHLMOg0
X-Google-Smtp-Source: AGHT+IElw7l9bexTjRbhQGN1GGYDCG2sP7WGjiobMhjR/WMmoNpKUmysk1NxTimqII6uTjyiiEZ+NQ==
X-Received: by 2002:a17:903:743:b0:20c:89b1:e76c with SMTP id d9443c01a7336-20e5a8ef945mr118594345ad.30.1729495608473;
        Mon, 21 Oct 2024 00:26:48 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee89e3sm19723805ad.21.2024.10.21.00.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:26:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: serial: snps-dw-apb-uart: Add Sophgo SG2044 uarts
Date: Mon, 21 Oct 2024 15:26:05 +0800
Message-ID: <20241021072606.585878-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021072606.585878-1-inochiama@gmail.com>
References: <20241021072606.585878-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_082652_107466_4220C252 
X-CRM114-Status: UNSURE (   9.59  )
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

The UART of SG2044 is modified version of the standard Synopsys
DesignWare UART. The UART on SG2044 relys on the internal divisor
and can not set right clock rate for the common bitrates.

Add compatibles string for the Sophgo SG2044 uarts.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 4cdb0dcaccf3..6963f89a1848 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -58,6 +58,10 @@ properties:
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
           - const: snps,dw-apb-uart
+      - items:
+          - enum:
+              - sophgo,sg2044-uart
+          - const: snps,dw-apb-uart
       - items:
           - enum:
               - starfive,jh7100-hsuart
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
