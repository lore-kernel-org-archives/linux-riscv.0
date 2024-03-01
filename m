Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38349C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 16:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3l/52T4Re5fFbnKk/SAzk3/M4VkpIEyiyginr3Yj/j0=; b=Tcp+PbIL2yF/Ds
	pQYVeKTUs10IihLPVDjnGqnmllgvZKTbIoEjK498ViRLhbkJAgoxQs8e9b5FfdmMyWZLxekJZmbkC
	uW5J115xGtZ4JwfEGu8O2ZUKJMb1qY0OM4Gfn/CSUx+tM3s9Z++beArKfW5aa2EcKE22vp9fDO3SB
	YBqZgzHZ+95A8g6HOOMuXW1XPyCYl2FjmwTGtkHHz6j5Y7H0i6u/TZ63pww0mvJer8uAiyrE/rd0m
	DSnUdcpedGVofA/WZA4ZV+aUaz3sx9rw71tKeJdM8ELbMOV/MUfJqq/tR1XiiCr6Il0Sxyj1xxAmo
	5dQqMVUX+RnUOGr4tjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5Wa-000000012ve-07aD;
	Fri, 01 Mar 2024 16:14:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5WW-000000012uq-3z26
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 16:14:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D3535CE08BE;
	Fri,  1 Mar 2024 16:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3EEC433C7;
	Fri,  1 Mar 2024 16:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709309650;
	bh=BikzDK1QW0K2bWi7muKUljDgu1skoyyFPZELijkX52k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TEOzgbzVFsLomQFvAfuSVAfDEuhsD4VvQdASJ6LjNj10+td2wi0MCxU4FIP3pi0V7
	 a1TdcPajbG1NfAVladYc6nqtbsgm3GdUE8uSqAUN76NLm1P3oOASJQ4NOcT87a7FzR
	 a6Zk/13yRchQIQ8WyZpiIKujV3KCDpKc44CQgFzPorDsheHjwjGq4M6uDjEkuMLGuv
	 x8Fkbl1iqCWIZsmUnn511pkATzZudzJ7jsOqi3iuhNBT6HV6r2eTimTDV9+4RhQZxM
	 PZjiakJ1gh/Tjya4WNczaoQIZ7roUSxYyfZEpOHv4dc8uTxI0L6Y5Azs4Tgl0QTplD
	 MbhZGTNc1pykA==
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [v3] riscv: dts: starfive: jh7110: Add camera subsystem nodes
Date: Fri,  1 Mar 2024 16:14:00 +0000
Message-ID: <20240301-wildfire-glue-983d58132599@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219032741.18387-1-changhuang.liang@starfivetech.com>
References: <20240219032741.18387-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=355; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=caay3mRU/JhC/YsFIkNMgzQjqWb0CeveGJRpWt2VyHA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKkP/x03ZRMI+/XnQ7JJfsT3mQumPClRPfv3XWH47x9vh TuVZ3D96ShlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBENixl+CuzbQHLC3uW2w1f 791QF1ryMNCNP8f9iIV7BsvOAh/9kr2MDH3cs4Rz1yz8W+G18e7FDdkWKlNPz9ixe+2WSf3P8rc cZWYHAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_081413_192560_90F77D6C 
X-CRM114-Status: UNSURE (   4.66  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Sun, 18 Feb 2024 19:27:41 -0800, Changhuang Liang wrote:
> Add camera subsystem nodes for the StarFive JH7110 SoC. They contain the
> dphy-rx, csi2rx, camss nodes.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: jh7110: Add camera subsystem nodes
      https://git.kernel.org/conor/c/28ecaaa5af19

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
