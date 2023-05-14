Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780B9C7EE25
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2uwUS0+BthrgXGKBusalw9L0j6/7+XONYM407kLg4cE=; b=Knkj9fZfl1CPki
	0CNSy4wBZNRMHlczClZBAoQFQlV6mmx782pkNoet3WvbL1CfUgg47wUP1qSxMQ15QeRtuo6O/R85M
	MDOoUKz+d9Dde8hXf0cwdLJJdS68EpcwYwvkZyam9aVO/uC99KyowHjJwNoA0vtaiEU1LMYc3LHDr
	m4qwzzPsNIVLLSqDpfA+sX/jiTIpYiYvu19MhPzmCNrKe4RTnFsC+YEqxGbKS65y0A0V4wiheM3np
	DLXkRtHf47EjR5R9xn4TIEMPkiqNXgD2oM48ahtkjnTAGgZx81n3/f+xLmHjjBnaWaiTO6q7VGe7T
	kzzU9R8jCGaxh2+2BNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1py7eu-00GncK-2W;
	Sun, 14 May 2023 09:04:52 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1py7eo-00GnZ5-1a
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 09:04:47 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-643b7b8f8ceso6438827b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 02:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684055085; x=1686647085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usTUzbJN3/c9qoBFyD+eiQ3LKf9ePyuHk2BoTbJ/pEs=;
        b=Tw1gGElBkh8bqUaPMfHAAZpRT3Noti9lbtsdwJLRTcytBsUA/i1hG+XMsGkmHnE6NY
         aHyrQhxtHygbXeK/92udiPG55yV8EGkzNaio9qwQplvUx5sEerv5EeH6u1WMhAdb6N/7
         M9P2Vlp5GGdsHBrcjmupaObC0zMFXrMAFACphbX4vQ4STofy+TILK02+2UjFMvrnREmj
         oZ7Yg4pHVIuF5i0TThC/V1EHpb0HqvcLuG6GRJtsj2LflWeJ6PoRT287VJaAgOlCm7Ty
         EFvBddckDp8Cn1pQrKbTbUvZFzRUb5SaRQdnP0uyk2p3U4gLRu3Oi1Ebc2GGBcaxZTw/
         Hqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684055085; x=1686647085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usTUzbJN3/c9qoBFyD+eiQ3LKf9ePyuHk2BoTbJ/pEs=;
        b=Di+QPiMNdS/RXliCBgGr7C+cyeOKqXBYiHUq6tqbWC577TngCJvWXzROF67yEFBfsn
         OQoDvEyAqSpomCJixcioqm9xjD21TbRz6u/XjPbsDred4q9kPGeKxp9ZMR8EeBAGy1JQ
         y+FaEjf3kFRBMhwpwGewAO73pW5Iw7n/33Z25Ga9secVaSUrYYC1Z/5t3Mw8qaDkQ882
         9F+G1YCJn1XyDHBq0h0Fg9ciF1jg+QI6sKhiYiqWXcRmDzfIaVhaghu/ZqoNlbll02lF
         R6azH2N4cJhcXMwaLUJExI5kMO8Twwpa6EbGD/c93ZSrs0E7yP4aMbIwiayfigkTKLSS
         J2zg==
X-Gm-Message-State: AC+VfDzQWag7sme9pJcTXpyZjb5LcNrN24Ooor1yN/s7UVDZf431wmvr
	oNnprL1yHwGYGNsAg2XcV8Gmg2RyEyQ=
X-Google-Smtp-Source: ACHHUZ4bUWZYUrifcQ0piB59H0YsIlr7vxuuwgc5h7KVvnAMIt651hXEgbblF0+3MbYFblaVCvxnfA==
X-Received: by 2002:a05:6a20:12ce:b0:104:edde:67b7 with SMTP id v14-20020a056a2012ce00b00104edde67b7mr6862078pzg.27.1684055084819;
        Sun, 14 May 2023 02:04:44 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-68.three.co.id. [180.214.232.68])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79251000000b00637b0c719c5sm9662227pfp.201.2023.05.14.02.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 02:04:44 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 8522F1061D9; Sun, 14 May 2023 16:04:36 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux RISC-V <linux-riscv@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/5] Documentation: riscv: vector: Separate SPDX license identifier and page title
Date: Sun, 14 May 2023 16:04:28 +0700
Message-Id: <20230514090432.78217-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230514090432.78217-1-bagasdotme@gmail.com>
References: <20230514090432.78217-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=bagasdotme@gmail.com; h=from:subject; bh=6LP5rrObq7wY9XwwQUBOiCWJUloqKCLwe+amTJtxnvQ=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCkJS+RnPnfcu+Hy37mZ1jef+dt2Ptr9+Iufm9XfTywvy 6TDTgtZdpSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAizt8YGTrnCWsFTL5asDRN +NDv/0Wavgb1J92MZm1fkWfmHfA3/T8jw8po0UlPrOqmBbyVkvrzZ2W9wJTchw3rW89alujLulb 18QMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_020446_532504_6CCD246F 
X-CRM114-Status: UNSURE (   9.61  )
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

kernel test robot reports htmldocs warning:

Documentation/riscv/vector.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.

Add a blank line separator between SPDX tag and doc title to fix above warning.

Fixes: 412c68cfeeb178 ("riscv: Add documentation for Vector")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/linux-doc/202305141409.bEBvlSY4-lkp@intel.com/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/riscv/vector.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
index d4d626721921aa..acc97508ccb249 100644
--- a/Documentation/riscv/vector.rst
+++ b/Documentation/riscv/vector.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+
 =========================================
 Vector Extension Support for RISC-V Linux
 =========================================
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
