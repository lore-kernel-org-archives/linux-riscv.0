Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5D3CFA751
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZmwU5HxJPSjZotbhJYVstHSnRnmvXvs4oiTWdXVkQeg=; b=SiRA3sVTKeMTQM
	qpNbOq+/kfKWyj2JycQW5MFhOFgZi66eTNRShcNdt/BQpkAAuDDqKuCTP0KY9s916hBu0g/IySL3B
	X5W3hCkeqjV6aIlikxSkKSmvsQTwizH99NeLyqj5Wh16dkq0XeIoXEE6oMzNvz3BdY+yPP7lTcBe+
	7wNMGX4cvqNffe4EIYK9RlzD8Gzzi7EEKPDwmbzP3hfqorUlTruDP3XsNYxDJ+Uc06OQcSLtjyBo+
	xbkvKs+p9RXfNEap9m9t3E9SCYbRknDvetxlU3du+Quh6AsZP7wULbQb9thOfh8wlz5zP+eY+IsIG
	wjM3Uu5olbxf9MX5XEpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdSI-0000000BMX7-0W8G;
	Fri, 04 Oct 2024 08:14:30 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdKJ-0000000BKYT-3Auh
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 08:06:17 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71ddfc61c78so839746b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 01:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728029174; x=1728633974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IIVOVxu9XfMaLlpy1+QMdcSq5GsuEzAvbsSA/qxcZ88=;
        b=ERR0Bsest7keaDQveJ7gv5IRcTaP3JRzEhL5uaxN6PcQVCorl8gYjIBUqTvzwj3boI
         sMKh2RpX+BTj5UZu/Tzc1Skm4QVcTpoPhZINdPE5kzhsdxThMV/O0VOs3KfoZCEZH3eK
         ReQ1MApDMvE4sTasIloRd3wQNluoep9MfdGuwErQlP/Z4WJlv0m3wOWd4Cc+2cEhpW8D
         qXXtJuafwcxo5JSu68XuaE9ZUA9kuRRamfYTUDwyFFzLKozA1sGOlG5RyHK9h0qgAbWm
         nUTVfkmiMjYvXPfLBE6BYz3M8GH3Yh7fRJrPmRexuyeHswd78MCYKJK5agSsj45+umJm
         OQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029174; x=1728633974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIVOVxu9XfMaLlpy1+QMdcSq5GsuEzAvbsSA/qxcZ88=;
        b=MaQgK3aDO8fiQemr0701w0hsB9m4DV6NIsvsIn547Azs0ZdJv1e1x2Usq3E1hCBWtl
         e94YsyXc6wlZO4+nVXhiU3TQTfTH62K5dZL5RCTtCzgJn5T8U5gXxnjJ2u0k6ckWr6cr
         uezsd9cv5IKPxW9b3D9yYLhXEdRvJezMk3U/DwJiiGSIcZ1chW/Zkkv4aOKhcQqj3MB7
         1XnW65D9hfUW9Ax4iMXbeMoGBzvA8843THNyBF4sOEtfHkGvlfsdiQXqxd4kt8R4ih+t
         DsXyRtoRyk9PIaHeOMg3akXUDvfmONm1msadisqLDVsZ+FhR6vq5uIG/wOQaB/wKinHy
         MvqA==
X-Forwarded-Encrypted: i=1; AJvYcCX4rE8hGfnjgqQ14h/8dsRcaZAVt2GBkZRWuPf4SXKljLnDJulufj6v/+W6rpXway7skRsNw8C3RK4Qag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Xj/gLXI2IoxiXg6QSgPGG8CYDiQF63s/E9myYfpRlu5sJUGJ
	4wY+r/JAXs6XF4/GdQXCxlSNeSrSNTaVmP9mrZQsh5wyY457SOf1
X-Google-Smtp-Source: AGHT+IFD93Hx9WdYcsinPCBU7f7jsifCqWXaRlWgBVZX2Aq7Tsr0QLF6mfhgNojtgp0wn4ICIS6pww==
X-Received: by 2002:a05:6a00:124a:b0:70d:33b3:2d7f with SMTP id d2e1a72fcca58-71de245f650mr2912648b3a.26.1728029174386;
        Fri, 04 Oct 2024 01:06:14 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9dcb138besm1940795a12.37.2024.10.04.01.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:06:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] riscv: interrupt-controller: Add T-HEAD C900 ACLINT SSWI
Date: Fri,  4 Oct 2024 16:05:54 +0800
Message-ID: <20241004080557.2262872-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_010615_816466_6F5136C5 
X-CRM114-Status: GOOD (  10.56  )
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

New version of T-HEAD C920 implement a fully featured ACLINT[1] device
(This core is used by Sophgo SG2044). This ACLINT device provides a
SSWI field to support fast S-mode IPI. This SSWI device is like the
MSWI device in CLINT/ACLINT, but for S-mode. The only thing is different
from the draft is that the T-HEAD version SSWI needs to write 0 on the
SSWI address to clear the IPI.

Add full support for T-HEAD C900 SSWI device.

[1] https://github.com/riscv/riscv-aclint

Inochi Amaoto (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
  irqchip: add T-HEAD C900 ACLINT SSWI driver
  riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers

 .../thead,c900-aclint-sswi.yaml               |  58 ++++++
 arch/riscv/configs/defconfig                  |   1 +
 drivers/irqchip/Kconfig                       |  10 ++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-thead-c900-aclint-sswi.c  | 169 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 6 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
 create mode 100644 drivers/irqchip/irq-thead-c900-aclint-sswi.c

--
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
