Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14CFCCD195
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 03:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g3cFdetLhcrEUL1R84nvONdJ3Yn054EpHM881+cmQo8=; b=I1ceX5f/Yp+t27
	wD6d+FcU2kpSJNI+l5NP8L7AgCWWzVgKn4jc6Nim7Ulcb8mbcvcAFCMV5PIjHndLqqVoTt7U1FYJ7
	ClRyAEex2WXPgoTE9LxK5r6tAnVsvfNDfH6q0Zgj1LkcN7ejOjkwYJaIOX4AzRlAgajOglo0LEu0k
	WNfvespReWmbCPg0iWIQxcEKcjm17ZfVvVnDUj9i34FtdClyd7UuW+hf8syUk7g4FHG5m5X5L3EW7
	CKMyPp79sXTNJk4oZlKlI/TVKLMDyo4WTF3ZveSgaX1mrJBYkAhTuPhgB2yHV94nBkeHD2vssreE3
	k1ZP0Af5JYcr0m9cg4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgdx-0000000BmZh-0ELA;
	Mon, 20 Oct 2025 03:33:09 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgdu-0000000BmZL-1Eeu
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 03:33:07 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7c0e357ab51so3336486a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931185; x=1761535985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TM+5sZf5OooBDgSucBoXLeOFjPqmBCLK+QVbvsF8E6w=;
        b=CfGoLPaCuPCLzsdV1XA2nKPgUh7EGgN0ynXkcij6f+d/Qk3w6VgdaIHLMW/jJEk7ax
         Y2UlxEcYeEY14d9wKJ6FkcdbWhkNyQ1yBb0gBFiUMLbxo/ddUE57FrtKto8euO39gXhK
         dTqss1Iy3GUmOwTk/FnUPgS5VO5cTl7+49tQ4fs5GN+OrdYdqyaC9l0MW7ol+CVnTIKp
         qGVUWvbw/YDBevQmNRCFOsCrSbbuMf3SQd/rQiE4Ee9EfzcPS3KQpmkNPOnwF9/02dID
         MzbefFYsaBtqkeeMyWMZk00BowniM0qTM8+r7nzK52lMxnLHHw2ESXWM8zr+myaHV06H
         M3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931185; x=1761535985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TM+5sZf5OooBDgSucBoXLeOFjPqmBCLK+QVbvsF8E6w=;
        b=AYvClD8aSjsZlzzriZidvmKyg7UZJjn3Es94CvXvownF1ydgkTkUfQBr0j1DC4ptHD
         8d0imguxBZQM1pCS1XryE3H2c231p/DQMjVbj3fBpAaN3OOdXhXCg1w1z7l9DwtmGzlA
         8c4G/KmldMe/KY7cCp98Gcy/UYfAga7WNCxyjTktSKQEQL+ge91gBT7UwAsceGLRaj3Q
         fi6+hInBH77IqjgPL704FZhb7+4cx+mY8DkUMQe3jxaCXk3lwiN+pYpCV7Oh9U2bY5/B
         5nI2YITk0Zq1HHB8PA1SsXpO8cFL1bu4eadoVbVr/EZHLXS/nNip/Jlo5Gx+qPeY73GF
         Yj2A==
X-Forwarded-Encrypted: i=1; AJvYcCVNr96O4jiLaS+bHquEjn+Uy+JajNQKAfDyWFyHd/vlATdaaqWx0a4hXRJlmH0f4zw8ZJKapfHZMN8ATw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxC9x6rkaoHJRcKLCuP4DfUAVQwCxuKbWQQ92huYT2TucnX9Fn
	lSnYxE+F+La5G2iOT5bHrzf1DzhdJ/AS0axp+UK0y20xSb1p5VvScM07
X-Gm-Gg: ASbGnctNcU9Ek9KG2Za8XPnZNyAKgiZE1i+USJs0FY/QoPLXlM/GYzMNlwAx7NZyBTC
	WZDOwr+CLVoVGIStVfwTGx93rOpXZ9+cIHKZObsUQhI0Jh+IlaBBb4LSrSZ0TWHKjxATYWoSmrq
	3SN+t2bOsYFsUdkOh4+H8BzSCpfgxNr5uPPuJmfRarAz0aO2h8MP96Pq8uskoVRPlKZ3SjMfrh8
	t317anJ/0U2uTRfRTg9+4B7c9AXPYNia57Ec5vwrXSMwYBjRrkGjfhWqdynllqzJzXLGFBXel40
	7BBdeAQk+Qykb+DOwkP53eFkG5UH7hKjYuB4NptDWxCfo/RnTpDnl+xhRGtsa0cXC2cvh3Htthj
	6Q6ot9pfjRvb9vPAhXJElg6XgLRhiGnKoesaQDLb98Sm3V+9klOaWx33ZKjK5Fll3keKSjLdsAC
	GmIBrNDu2UTg==
X-Google-Smtp-Source: AGHT+IHSXRKU0H/Tj60xds+NdCJx8dzbIdYpjnBVmyNb0yUakAI7tZidFBFo9vJrXoitO39gS81lLQ==
X-Received: by 2002:a05:6830:3895:b0:7c2:7b5e:8cb2 with SMTP id 46e09a7af769-7c27cc4be1emr4547628a34.30.1760931184891;
        Sun, 19 Oct 2025 20:33:04 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c28890e24bsm2244146a34.23.2025.10.19.20.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:33:04 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 0/4] Add PCIe support in DTS for Sophgo SG2042 SoC
Date: Mon, 20 Oct 2025 11:32:55 +0800
Message-Id: <cover.1760929111.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_203306_339536_3A9B8D50 
X-CRM114-Status: UNSURE (   9.68  )
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

This new patch set is a continuation of the previous patchset
"[PATCH v3 0/7] Add PCIe support to Sophgo SG2042 SoC" [1].

The drivers and bindings have already been merged into the kernel
mainline, and this patchset will focus on submitting the remaining
DTS changes into the mainline.

This patchset is based on v6.18-rc1 and the only changes since v3
is a fix to address the comments from Manivannan Sadhasivam to make
sure PCI address of the I/O port to start from 0.

Link: https://lore.kernel.org/linux-riscv/cover.1757643388.git.unicorn_wang@outlook.com/ [1]

Chen Wang (4):
  riscv: sophgo: dts: add PCIe controllers for SG2042
  riscv: sophgo: dts: enable PCIe for PioneerBox
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0

 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  | 12 +++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  | 12 +++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 12 +++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 88 +++++++++++++++++++
 4 files changed, 124 insertions(+)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
