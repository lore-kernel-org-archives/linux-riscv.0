Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0202CC61CE7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UodxOX+PH4jd6fJO/+IB3Ex34Lq7MM20PUVBbBwqwkc=; b=Xvz3a33glfnjZ7
	JUmnoZyGQlbeN5jC3jtNDKII+pul/p0CidMxr8mH1XVIKT937VXd3QXzIcXIx6TGe/gwz2J0HGRaf
	vWzTO7Fa+NtugwneQT4KY4XVoVJuKWRFhksvV0Nl6N7UmFibQNjOWk/EW3WgHSi3mA5dFqezRcHf4
	elFklPtC07s2bLJBvDqzkOUA5NqNDPZpQNstS0VCU+71cYyurnfHbbQaLwGT+JHNzhuXO16dn9eba
	UEXYlljKmNaF4JBQmJ8U92jPPh3tw/+zVDoH466ruMeQTTp7jV7du/ySMkT7n5thIGWmwCLWVMQhs
	RVyr3Rdm6qtiXxAG3pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGjJ-00000009FcJ-34Lu;
	Wed, 11 Jun 2025 08:22:41 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGR3-00000009CbV-0XjA
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 08:03:50 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a5840ec53dso76456441cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 01:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629028; x=1750233828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO0oOIhU9gTDAHfzv4bngGzr8nk9uJvKVCCgCMFOJ7s=;
        b=Bpzr7uN3qNh+pkGhpFIpsiVnlGbS0eZhYijCzHK1pUOpAzTUdmz0wjXYG4FpQTG0hR
         9DbdCu9QAZ4WgweqwluoJatxetOOcxs6kNqiNm+tiRYYXRzBubUpCf3dr/TNjaAtYdIQ
         HZ+oU9WdmIG1iG/uWXlNaLXCRbXufZMHcizj7lPZxRKUsQK144bq+dAjVarA4Zp8bwgU
         NdN56gV8J+CJmOybQcqpoep6vGMp233ANaLGONO5bBTlZqRQehwlEBhEOmUpq9w1bMgr
         3F1EEw7cYsM0XpDPX2QFqZLKUYoz2+PVfcRT4RZYO4Mg9YeO08QM5YbZazDgjcsLV6j9
         V6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629028; x=1750233828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO0oOIhU9gTDAHfzv4bngGzr8nk9uJvKVCCgCMFOJ7s=;
        b=sBRS++imU02+4i9Izt+WVA3QS+ThRbfiXn9KoKA2Y5l2pTWd6j/G0kNK3y8yae26ii
         NNscVGA/pCO9fToAwItPutHdaQjg+kCy7WERSk8geCupRROzGYPRkoq/RZSXDn8eGPOj
         WcVq8V/Rg85AmP4TODxDwVnv17VT9ecWcBvHk9vE7GPOA18MFZSwF2TVI1VRXT2SYWIE
         bGGtRVyQ/6LHFv9w2fBaf/1gQ79zU/jy8MPAZV/7LeAALjTN1yz20cf3yhGTivGzKPiR
         w+PWDjKyApXBHrtLjEiQ7o2rOOP+XBVpmJ1U5g/AVEuyjBMwItbNwHJHd67gvsYISWHK
         E4AA==
X-Forwarded-Encrypted: i=1; AJvYcCXnEyOEGbXZHLc3yHtXnWclCCgh6/nFPkpeiMBeXC/5WRrU/7m3pQx1MkdoMoP2gatYYFfLkcqRWUrqhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7QFVVpKGJUroRXqdVmF/yCrD5IKQWM8JbDCc5QxLL1SAAXAt9
	h13L9yMPhPOZNFCr7+LRnB9kh4dgwDqyvyD1VJPrwMXTNKqLz2DW7VJh
X-Gm-Gg: ASbGncvlPdlced2p68CwQpq1SgPyOmuAsuHKHYByTgU4ABdEPH2sR6eiowN35ymd635
	DjfPDeSc7um4ZhcTnn0P09AAR++cQYcJ4B9On/fr7LHrdNij0Dwx5l519rCiz/VIc7VOlLkYoKL
	TXhoOeJBb+2YvcQUie4DOeHE/+DTTMGLnCREefrvsqSfLdYvQpbuCWJ0iW1EAzMZXpK1DJuj2XG
	jkCHkhmpbmDFhTPFn+W0FYY+cxoyHkwI7H/+/ViYGNs8KQd5sMOQwVmILYGUimu/oxPUE2kHmNC
	sKpVQNm2xci3otPHHEpq8CM0BEPtcgrMNusPMg==
X-Google-Smtp-Source: AGHT+IG+DVPIIzWnmuIfybYPUVY9Wm0WTbrG5rT0kebswDgegdaXVZwVdvA8Qy8soVcQDTBv9EOxqA==
X-Received: by 2002:a05:622a:4249:b0:4a5:a96d:6068 with SMTP id d75a77b69052e-4a713c5871dmr47918471cf.37.1749629027868;
        Wed, 11 Jun 2025 01:03:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61116ae58sm85983721cf.17.2025.06.11.01.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:03:47 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 0/2] riscv: dts: sophgo: Add mdio multiplexer for cv18xx
Date: Wed, 11 Jun 2025 16:01:58 +0800
Message-ID: <20250611080228.1166090-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_010349_168139_EFA68108 
X-CRM114-Status: UNSURE (   8.59  )
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

Add mdio multiplexer support for CV18XX series SoC.

Inochi Amaoto (2):
  dt-bindings: net: Add Sophgo CV1800 MDIO multiplexer
  net: mdio-mux: Add MDIO mux driver for Sophgo CV1800 SoCs

 .../bindings/net/sophgo,cv1800b-mdio-mux.yaml |  47 +++++++
 drivers/net/mdio/Kconfig                      |  10 ++
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-mux-cv1800b.c           | 119 ++++++++++++++++++
 4 files changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-mdio-mux.yaml
 create mode 100644 drivers/net/mdio/mdio-mux-cv1800b.c

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
