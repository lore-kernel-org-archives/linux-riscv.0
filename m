Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8621AC3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 21:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZQJZUW3iqTt98nMvWnUjQlOBNejPbUGUQ61IuOwWpSU=; b=bAsT7xo3fBWY8B
	ZnZbIO+dAS22zio7hM+DB6ai990xYPjU1yU5oUJpCLyY64YGz91QAW66tfH62uYXT03SYNCDqmvFo
	B7b6SSqqp0XpmLZOwFJRW/JH2HY0XJoCw58XVmAjidczdomcenJ8MF9a8BtUrRYlDG+ar4l3EC0CR
	JAasc3L/NpXKBx9tU2yaumoH8gZZhEajH2di0US4ZSUReWW0URagF9zj43+rUjDklXFfXBJXkOY1X
	vlz6eS1LLAYbKflwfU0bst7FC1xJgWLqwaGOFdHXy9uLNqmrASXAQiAMKttC0WCZnpilyLkmwEj3Q
	wKwrseZH6GMCnCKIucBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVJr-00000004xzt-09Hq;
	Fri, 09 May 2025 21:31:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSF3-00000004Xrm-1bS9
	for linux-riscv@bombadil.infradead.org;
	Fri, 09 May 2025 18:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uzqFJPNWlFb5Vyjzb2p+dns6qiD8V6vJLvgrZd1P9GU=; b=pA8SQiq87ZA/lvsPDVvlRxwOFD
	Da+e5+wP3zXvy81q+N7nb//gOJH24yeEbHx7+N48lMK7adhBv0EkK2eyvsmiV7dXxaUsvGzS3NtD2
	Oa7uzhNF9ArVdUUu8oCpCkzKHWRCFJsaFpyK0aE9IgBG/mxTT/9zn9HPwF9V0KG1QaopoKue1xa3Z
	+wncSdbszPXEkEtCaK/o7fPeUzA7BoCAMrwPgMXVUbB7cMHn8BPRNFLcv5bCtR2bw0uoBWP7DBJcH
	rQIIhmNTAzM43goYYRGNGL8s41G3DNt8HJ6gXBNwULeQ/kMa7WLUtogFe6pjm86ACuOSBbS4zVTXA
	gRizXJSA==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDSEv-0000000GKJJ-0nAS
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 18:14:36 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-30a8cbddca4so2809516a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 11:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814452; x=1747419252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzqFJPNWlFb5Vyjzb2p+dns6qiD8V6vJLvgrZd1P9GU=;
        b=WEbfVLkAraxJyA2+hom6TEaPcauXNRFIPZRumhAvrzzoSc0mzsesJ4lw9mSdFoe1S5
         QkeTlQJcw0DWQzAX5MWuEyBNY3l6NQmzZK6Gmq08ZfMQnDyKKfKb2Z/VCAaAhERafCes
         lsYUFBzIVU7qgpoH+U3hmc4fhemp9pAq4xQEf9n3+BV61GYUII7Rre6yGDKUdR5CLFnI
         OssWgaqyf+Pv36EtfrWmMHunApYiFKxLkIJLEUjM0YcqVxkb1+aQXWKBKY7Bn79bhnHm
         3pfKvONM/RosJinefroiOdoSILrH9/rqHMQjR9Xtao5Ff7Zg7aFFhlpTMfozN7HJ+hm4
         PcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814452; x=1747419252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzqFJPNWlFb5Vyjzb2p+dns6qiD8V6vJLvgrZd1P9GU=;
        b=RvoNf7IjuPT5VMSNq/duHlNSZsXIyHJT3H5Epi8DOCXIZVGJwoHx5k9JUJx8NiHRwf
         kR0VX5rN9hm3YACe7cWG7mlKr9f1lQ/hxg3xvL/YtWL+cvMxKnuHtKFb/RcTDgtVCp0m
         S4gohrCGTOU60mcg1j5Yxjq6Z84loOJyPNvJg6oZZCt7KiEKqb5WXumqJVtMj8ur0szi
         2lTVsJodL221R60mshJEwSLLCdOfc2IDizbI88tt1Q8hR24DnaEq2AosagtlWI2BvvrE
         NzDupvkl/01Scgd7/0ZP2kp1A5pl6xmDyRRLF1mDVu1KuVmTvozBhopgGlsqmw2u3twV
         F9PA==
X-Forwarded-Encrypted: i=1; AJvYcCXFVXbkq+jxFbSvqyDyjyku/Ecy64wZAoLCnxBQ5+ve78kztMxNYmQqIJPFoYrQ2q/JZnhyxG1Ca5MZBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp4P+zZifxS/3RXXg7YT2c4smrhE2/fgqr4K/3HMCBfeEWSdkb
	zB3YCOTFMJXjNbhjmifj+Bn/gvLcanFD3abvU7t2ArYnhqKrfkRI
X-Gm-Gg: ASbGncvmMpUilKwJi6XUSoBTTHtXJLXf4TxSxAeiJYZMPiuEkF5JbFOMl0O653hRGB5
	q3HO+5KMiq2/YEMUPu/TkDuDbb6uWsZECB9VOvgd9nZHUGPn0UAhTWfF5NuvcBMqBdR114IS8kt
	gZLf/rUtcsP8Y+qSOCR+1hYlWZR0fnzTF8lMUVRnzYBvxup+WQvaZAkTthrVQkLzOQjRu7Pvl4H
	qyUCz+xxEDIvBjkzWHjd1a6wxZAZIvbapmCiDoSTZik6Gt7qWj0wen1x8q6KXf95/5stennWl6B
	1eTms8eXH5dVLYvFlhKhuxDCFVxTcylLha9XqCvNU6xZm3Itkxo=
X-Google-Smtp-Source: AGHT+IHa2KjYQjIdgaOluaX4vIX9MeA+TzhVP7ZXcPWMW4rnYDKm6roeCXeZYEdWNrVM1+kd8Ns2Hg==
X-Received: by 2002:a17:90a:d2c5:b0:30c:523e:89e7 with SMTP id 98e67ed59e1d1-30c523e8d29mr2996226a91.16.1746814451476;
        Fri, 09 May 2025 11:14:11 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:11 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: riscv: add Sophgo x4 EVB bindings
Date: Sat, 10 May 2025 02:13:29 +0800
Message-ID: <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746811744.git.rabenda.cn@gmail.com>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_191429_450456_745332F8 
X-CRM114-Status: UNSURE (   8.94  )
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

Add DT binding documentation for the Sophgo x4 EVB board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index ee244c9f75cc..0f93f4cbfc6c 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,7 @@ properties:
           - enum:
               - milkv,pioneer
               - sophgo,sg2042-x8evb
+              - sophgo,sg2042-x4evb
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
