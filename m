Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D9FC71155
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 03:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwR0WSUN2Mc0m3dtehazF/v9IX0LMXAWulgQfsODFVU=; b=vSPrYYgVYA73Bw
	2HYoZ9Hf4Ia4/CkR0VksB2EdhvDOROvz5ssmzbOHHW0hdqXOAGMayE7L7lXZruil6isKKez50/GhZ
	YLGoIr+WbP8+/A3thgSdr20IsDHxMsGofm7TslkswioOw32DlYd+iLPYGZn2eVURNq3XBozXU2SNh
	XomBHlTN2yhZhGo9njhnpGEleQLvhaToh5XFzYLWPhNVyoHJuouPxyCzgRpp27IhdBhAfUtu7KsHX
	it3bsyBmo/DjbhunIdXVVqbWoSptZua3ixYliYV4k9/SMrL1cLrqhZEsJSRQmw5X928SRxK/Z+DUX
	XvQDWlmIzt8Xou3QwPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjGB-00000008t3G-34gv;
	Wed, 18 Jun 2025 03:14:47 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjEQ-00000008sqs-1IcG
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 03:12:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-235ef62066eso97910065ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 20:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216377; x=1750821177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVmw5bZbkl4jrrqCt8IvJKSgjCMD7aRK/gZMumHgDnk=;
        b=i1Vm3V338ZmOvEK0vFLZnbvQMyfEmPMLabr4ipcPbe6ARwUt/mRR0fiGUXg/ANulDY
         7CgYjh2njkUjTOEboYlY1eWmJJ8UNuV6dtmxbja1AVXno/jj/psJOLiDpShEK6zoJMY8
         QBpSGhVInECNbPB/BfZQHD0dc3Yh3Gzv53zs3KAqYk/cKB1ZsuCaqfK172rkE/TTHGu3
         bNq/axgZum8I8rHZsYzGKW1kyNDn1NItKN9eWcFql54h8qj6bBZVqaH3lHaLaCaz8mj+
         qRDEcnZrtvPQUHNps8S6GE2DtVcmsl8SARwMF7hAJk1hTcW6cYyPZrcxQOfeKR3m1wMU
         Q9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216377; x=1750821177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVmw5bZbkl4jrrqCt8IvJKSgjCMD7aRK/gZMumHgDnk=;
        b=e/r3qtUSkxLg1tIgLi0DjHetE2llolRaEKwLocHhXVdVXJ5uJ+TcR3H0iZsEzxvRqY
         /ghzgcX4LlUhGWj0Z/UQd+nGsJRIya+pi2SQkpnHdiryFSAu3jECd8fEsG1bc7QFzR8i
         cBrTu7v+u5ZcDVA1Ez9LzG9QlC8Pi7iWDf3fQFSixpYruB3aIjzETmnv+xCEMcUm0esp
         hGzhzWKu86YqyBrVe7c9GKk0rXiCwSrA5vsrSITIYoenkFz5sCd2vDKXGp2+kniImQGx
         tZPqHlSwbXDjEifs0V/uWYF3fTCos+kwFgQunwIeuaaKwuiDttcW+1DdWLq4Bf3+pCHp
         ue9g==
X-Forwarded-Encrypted: i=1; AJvYcCUkwB4EaOWM45gsd4hHzcWlOiWUU3rvuvHZYTMEuin6OjF5CDaWO2+1oCHHGo/N9c5Fb9AQpINcef4yfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTOwwt0YwJjEPptHyNiq19cK+uF+SRu8DMh61rQ2fx4vnzgoRf
	sPBw3foXudiYJoQLIPBoz3YEhAeKSqaeoN7idwBGkDzAgbu47X9lSi7D
X-Gm-Gg: ASbGncuxfMBOWbkkg3yXRR1exmwyFkio52GBd1CkGKaPifNw9t5PwzzfpYOOjk7RF3u
	S/Kr0+LJgH41bJDpfoLo8teBQtQ4dI6P+7Pw+cwlvrbDikvj/iunA64bfUPMY6xdHfqaU2X8lDs
	+8YYXMVU0h3FJVXAFbEiiiFhNVqxDwg3XvgN2Cx5NM1nFyT8GoAaCRt7/1NrOQhL00ofKkeD3TV
	0O/ARV7HLX/Ihn+RgLvU6E+zupYHxiHstgw59jCp2EgkqeYVf1EySOR2RqRzimBziWMaVDu5hpi
	WhC+gDXR7Hb7PXjzvnmrS06ok+AELpAircYJCWpaLV91UTojyLFyl1NbJtpWeYNAWxS/lYEj
X-Google-Smtp-Source: AGHT+IH8hgD1LGsHJfDQnAXl9HvOeBTvxQ0AmdkVrJ64/WhDiqReq6a0y9o7OxH1H5lmzbPMTmNXgw==
X-Received: by 2002:a17:902:ce81:b0:234:f1ac:c036 with SMTP id d9443c01a7336-2366b40b7c2mr211182775ad.50.1750216377556;
        Tue, 17 Jun 2025 20:12:57 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe1642ecfsm9772763a12.19.2025.06.17.20.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:12:57 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] usb: dwc2: follow compatible string change for Sophgo CV18XX/SG200X series SoC
Date: Wed, 18 Jun 2025 11:11:30 +0800
Message-ID: <20250618031132.373216-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618031132.373216-1-inochiama@gmail.com>
References: <20250618031132.373216-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_201258_348863_5E4CAB07 
X-CRM114-Status: GOOD (  13.19  )
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

As the wildcard name is dropped and favor new compatible string
which match a real SoC, and it is not used for any board at now.

Rename it to sophgo,cv1800b-usb to match the binding change.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 4d73fae80b12..ea6bd537e337 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -334,7 +334,7 @@ const struct of_device_id dwc2_of_match_table[] = {
 	  .data = dwc2_set_amlogic_a1_params },
 	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
 	{ .compatible = "apm,apm82181-dwc-otg", .data = dwc2_set_amcc_params },
-	{ .compatible = "sophgo,cv1800-usb",
+	{ .compatible = "sophgo,cv1800b-usb",
 	  .data = dwc2_set_cv1800_params },
 	{ .compatible = "st,stm32f4x9-fsotg",
 	  .data = dwc2_set_stm32f4x9_fsotg_params },
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
