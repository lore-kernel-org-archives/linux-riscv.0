Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70197D18148
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 20:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=krvZ/KSLQsjjYHv5Pgw8Csqlyi9d5IwMubbvItKU1jw=; b=OaNAcAyzGbCko3
	mt4FMeQgtfnwCoJicSW4Spftpw8LsYylddlGizRYv3dKL6lgI8uG3c4nG5aewf9Ag+zQNUuzDspzH
	tPiJZdCc39hEAG2QG8rx+YfElHaqsM/SvZG1tOiLqBEloUlpmqZwpiQXX8F8FTDZTfqBrNtPUd4X3
	2IG8ILhGaiAs8p9RjP7Nj5ugpS4kFb3XEURblWWQcosSmxUZy/ZSp+p7wBPEuh4EN2Z/H4FBlSvqQ
	6w3RXBqiJtBBvosF95iInjELAV93ZBrQNGBWJydhJw1KI+ViDxALRYGFY7UvlELTfUnoqWtJVB3oV
	GPpo6yVV9saGy+jzYwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0S5F-00000006RCM-2vzt;
	Mon, 14 Oct 2024 20:54:29 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0S5B-00000006RBF-28P3
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 20:54:27 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so2094121a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 13:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1728939263; x=1729544063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=upBIwmLVEKrYA/8mpgHqplBGbXrpIDV9EVYbTEhbDSc=;
        b=EfqwVt5Jw/vtJ2n1KtXJAE+jliAJNqeCby+WwR1syo1EzfBJO7/PuJeUzsG4fuJQxu
         bsQZDd/kW2AzbCBZAG3VMCRrMzKN1MGL71Cv7wTsR7M2cYttxNe5F+x1vTLctJFLfH16
         qE1BrLu79/RN5J42z91AOh/BJdKTEV3lfMdM5G1+bm4zjdMdB5koDc6CEFX3bzXB8OwE
         xMDWDjJ5agQTbreLI55KwNy+n9LCfH0lGwOeMUC3lyVzi9D9ExhT6LG74toC1bg7FCYK
         UZGWdeLhliGF5npCuY2rCo/3qhqpprodzDc+4AGh05X6bI81bUpd9uiHIz1E5WOnddeS
         TLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728939263; x=1729544063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upBIwmLVEKrYA/8mpgHqplBGbXrpIDV9EVYbTEhbDSc=;
        b=ok7eFAT96+s8nhIQHIQNMGelWj+zXReFE70si3gpcHtc+PKcypj9fQo66okHZlSGeJ
         RYwekU8wLdHMBLrDMU3qvUQbTFSwebKbHDpZa8gDc7azI5mGXzWEh6XINGdk4HG5gikZ
         bux10qgx8Y4olP9GIK7YqVpa3Qc1OlmhNivaYlgPoqqa2aeYeFbP0DXyVzU1B2BowxfX
         3qqP7uS4C1SMpwNJV0GNHsN72fhwSENwlVJK2TeO9SlezoduoWuWwLm9LZ8H4QdtWYKX
         CIlNfgYgd91YFpTDoaFXzljt5RhxIFnFXNNLZt2Sfky1uxZ1/D1VYt4eJO5TyZtstV0Q
         cXZg==
X-Forwarded-Encrypted: i=1; AJvYcCXAwnV/RY+2k7vAvcefyiuXDiUSLlJBiAPuImbjpYgjYidiSZdd8YTbucuv4j8DYKigbcT3wGI/kOpC9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBEyDzqWN5MZMB6Dfg671aB7MbfazSJJ6XEUlyv9G9kPz7S9eQ
	xtT/1bRXC/0TriyNw8qimJxXcmUEcG3XT6YoIDrHYGXGx0Sk8wKXJ82aMhJJmac=
X-Google-Smtp-Source: AGHT+IFHzS+dJQbp8kc2lCYA4RjGEvgxYJIfozZyGXFfM/lJ8tRvHTCm9spf7yg8DFMCiQPoDUFa9A==
X-Received: by 2002:a05:6a21:9cca:b0:1cf:451f:4624 with SMTP id adf61e73a8af0-1d8c95d5594mr15722713637.21.1728939263331;
        Mon, 14 Oct 2024 13:54:23 -0700 (PDT)
Received: from thelio.. (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e59aa9917sm3845277b3a.135.2024.10.14.13.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 13:54:22 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Drew Fustini <drew@pdp7.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: defconfig: enable gpio support for TH1520
Date: Mon, 14 Oct 2024 13:53:15 -0700
Message-Id: <20241014205315.1349391-1-drew@pdp7.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_135425_721611_9EA71FFB 
X-CRM114-Status: UNSURE (   7.75  )
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

Enable gpio-dwapb driver which is used by TH1520-based boards like the
BeagleV Ahead and the Sipeed LicheePi 4A.

Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 2341393cfac1..cfc887a7243d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -167,6 +167,7 @@ CONFIG_PINCTRL_SOPHGO_CV1800B=y
 CONFIG_PINCTRL_SOPHGO_CV1812H=y
 CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_PINCTRL_SOPHGO_SG2002=y
+CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
 CONFIG_SENSORS_SFCTEMP=m
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
