Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC8BD12D6D
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 04:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bocwWJvYtjsf5vuqnaMia2q6OSU6DkBrndOWOAzzmf8=; b=HLaw+2zZVHIi4q
	fTgOmUf151OLTAA/qksok3VjIDvWV4CzPBErk+6qPImvwcLnHDxoEvxJ6bDEGgQs4bkY6r3nMTBN1
	Uxj4AFIqeWDNqwo4g9827bHO1/poQBvu+h5KyclnB07BEpY0RtC7mF7C+tYTij+xGDwUco4JrYwMB
	8UjT/et/umWI4Yh1T4BzEzpBoP3C+steTGSJceAastgmun1NiUoraf4Q02xSqCaomDmhN9SolpVYr
	GymXi/JFMZvFCXd2UFtID6uAvAV9b6pg5PW+JR6u7Jd5Xo48/mqmBed8n5LeERMjxpVsrjmUV/H9O
	CJVaLuSxStIW8Ix2Y5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALcG-0000000GGdY-3C01;
	Mon, 11 Nov 2024 04:01:28 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALcE-0000000GGd4-0dvV
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 04:01:27 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-71808b6246bso2305289a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 20:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731297684; x=1731902484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hy8jT9Ue/QY/D9ejeEuTCpC9OQ+qg6j+m/BJDWm3iVw=;
        b=GGb+f9nlW7pIDRpgmPBSURcZ1+Hvx2/H/G4Xn2DqT48BwPyAKs7OJ+9tYcYNoAs/ed
         UArqorWVjKeehGMgS0zRbk+I0k0sbhShwzPEnsPXp96k5tfhpWpNmqRZlTt5vxvhRQjK
         Vx36P320QNuCneyOf6hEOhkCEVgj/V8U8HiqYmtWGjjWCd3rO3P4PH0vQjRVz+1JtWpq
         xtqCY8QLQ6hXIB73/eawf32DXQvsbiNFg6XNyRE17tl3U3mMTLOjZhRpdZXDieB4e9su
         lcOFCISQAhWXbtcvZliYkvberDNxgCsNIItynF2ZWMsR4upoGr/bfcBU26chO92jChfz
         VO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731297684; x=1731902484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hy8jT9Ue/QY/D9ejeEuTCpC9OQ+qg6j+m/BJDWm3iVw=;
        b=Rx+zA88dtqMd55Wsqq9AOSiU9Me+6Nolj8Y8YeX+rMHgqhUPKqVwkt/RwaFqLFwr89
         IKRUI9opPm3KQ3mvQv8XJjmnBJ0chNpFDSMXYgWfibPOQMhAaNZBBXrgEy4zFvf14jf6
         7N31ppGx3OMABmmWKo6JmxISgqeguDbySOctqMYqSOY7vaDsXNOrynbgMab/k4gJXtUI
         LXsIxuQFtDOjfKLKxpMgddt0EAgX+S2L/8clvptFBsyiKDmBjHvt7IXXdgqo6LQrWrS9
         u5ymyg0qsxcPSWfgs6YmrSrOD82IslIZ0V4YIbLno5Chi5DHuIaR9JxFafaDZovmIv2R
         qxiA==
X-Forwarded-Encrypted: i=1; AJvYcCUQfJVibaL9gGoUd4gVCZpJINMU2p1j5/HFLDo1H0LY0MGx1SVHI4WbSZsWCDfJvt6L8wtY8iLniA8ODA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQH9mfc/6zcE2L/j+E70kVAMJm3yqPV1pTzqLIRTJucKsObGLT
	72VzVmLVUIvB8v5v3AjP3AZiq+vSg95b06NoLs68thROBsnH3gGD
X-Google-Smtp-Source: AGHT+IEU0F2CPMWmhtTpRyOGW29QngOAi4sHzqAOqOtg2OfvHnGdY/3OvOLJcSlVD7vH7oOQ1i8hMw==
X-Received: by 2002:a05:6830:600d:b0:718:99a0:2168 with SMTP id 46e09a7af769-71a1c1de347mr8513477a34.4.1731297684455;
        Sun, 10 Nov 2024 20:01:24 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a109210d7sm2107427a34.60.2024.11.10.20.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:01:23 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 0/3] irqchip: Add Sophgo SG2042 MSI controller
Date: Mon, 11 Nov 2024 12:01:13 +0800
Message-Id: <cover.1731296803.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_200126_221510_1E1E3BD0 
X-CRM114-Status: UNSURE (   7.33  )
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

From: Chen Wang <unicorn_wang@outlook.com>

This controller is on the Sophgo SG2042 SoC to transform interrupts from
PCIe MSI to PLIC interrupts.

Chen Wang (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
  irqchip: Add the Sophgo SG2042 MSI interrupt controller
  riscv: sophgo: dts: add msi controller for SG2042

 .../sophgo,sg2042-msi.yaml                    |  78 ++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  13 +
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-sg2042-msi.c              | 255 ++++++++++++++++++
 5 files changed, 355 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
 create mode 100644 drivers/irqchip/irq-sg2042-msi.c


base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
