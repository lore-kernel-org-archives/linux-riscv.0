Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FD9C41535
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 01:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3dJH9yjVnNDmMg0/t0ZUPi4Rr95zIZIcp7Pjeq0t91M=; b=fteRKk/xU+Mpoy
	K80AJC2PYHh+p/N3Ll+t4IdgHgvns7qOimfqeQBX9NZ5OsgDrD7E92pyARdig12LqwzBacusBMbIx
	qJqH7X69aLUtO11uQcei0dN3UolYyumS3oejcUsaKowICudsUYtNHw152YAT1oDrl+T+SKz33mSZO
	MXpWm9KbLMqN7T7qAdAeAB1LF9L0cxfmyvmR9JW8gl3OKXwWFGU3IjneFVU/0bSsgGiWMmvcg5fjF
	z6joHDkKzIhNhad3Q9KZC1S17aEIMRK2GN1uOjhSA029P8kuXlq8If+cLb0sTvE12CoqCUMxlFvmG
	PGZHTQVoiNl/sjwKdpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LS9-00Cy68-22;
	Mon, 13 Nov 2023 01:09:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LS7-00Cy5c-2E
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 01:09:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC40260C40;
	Mon, 13 Nov 2023 01:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514F7C433C8;
	Mon, 13 Nov 2023 01:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699837762;
	bh=NWIlzFEgg2A3+SpkYxmsGisYK5SmdcnCfOPvo5IDKK8=;
	h=From:To:Cc:Subject:Date:From;
	b=PMq3rYRZJrQbhLBj0X7qQDeo5yg0CezYYjpfZRMrnxhUFb9ku/AgdcENPQSUJoY40
	 A1Fmg2/M2FooliyANBTSfsMsXAcww1LNdwTkno680bvuvDhzfhCTwTfi223qqhN6PQ
	 oXMN3GC4sOfSPfLZWocDw0RjZYr1PQ+82yZGeAz+gievaNco5TfNvbGnZHR80lMmBk
	 pDwAeS+w+TPD/ILgA1auQ6UbjiW5XuA2nXVC9JGK7sPxt1pHxS+Dq26L/OcnZcWscf
	 EgiH+mp/3nO8PPPCaZRwb4vJTD4lK4+4gA1BITRgjEc448aZB488XxJrMF4emnIBvM
	 Cla/YDhGteDaA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] riscv: sophgo: add pinctrl support for cv1800b
Date: Mon, 13 Nov 2023 08:57:00 +0800
Message-Id: <20231113005702.2467-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_170923_767973_CF3B7C0A 
X-CRM114-Status: UNSURE (   7.38  )
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

This series adds pinctrl support for cv1800b reusing the
pinctrl-single driver.

Jisheng Zhang (2):
  riscv: dts: cv1800b: add pinctrl node for cv1800b
  riscv: dts: sophgo: set pinctrl for uart0

 arch/riscv/boot/dts/sophgo/cv-pinctrl.h       | 19 +++++++++++++++++++
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     | 11 +++++++++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 10 ++++++++++
 3 files changed, 40 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
