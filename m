Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC085C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 21:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+5RN+aNzJv+yPS4TTWipNxumWGYllhzMTrdrqFr8uKw=; b=FexN+N8/7fWNda
	CySJb+/C6S1R1PLKdPz+r9rk2lUSEoE5N2Zy3WarsungIVqdmDrQOo7j6jf/NomE/fZ+8s2aOd5em
	Pzn7qJzpwr1AZME2FBhxC6cXYptOZH13zn0A1Z6DDz3rCEK7SxsrEnf39kix2TXpfACa2AazONl8Q
	EtNierkKCXAdBLz0bTyzEUDhy65+VV8crCejYVazYS51JVlFh8E+LU3skCl9Qsf3bFQ2lP9b4hDZo
	64m0kn3elHF+CpDCZeAlruEyCMvhP/l5AT3otojy+JYYZ590yAB16VKEM0ysUnPZ0edrsltwpSqlw
	ZCrNF0Ade+JnYOlKqfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXc-00HOTv-Oa; Wed, 09 Nov 2022 21:23:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXX-00HOQo-G6
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 21:23:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 090EDB82020;
	Wed,  9 Nov 2022 21:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B11C433D7;
	Wed,  9 Nov 2022 21:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668028996;
	bh=MvIVgV3xfPsJb+6elt3A8/mzJcCC4+OyW4aN+AtJR4o=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=eaY7B3H999dBQlWBOal7vrDQeUvvMJcORULbQO0dPqxaopr+1OW4HVyPBrHo48dO5
	 MY/I56eQRnyWmcsbXRo2W8U3qkWF/ZdPUvK6XzMfgZGXsETRKrtzvJGCE+oEyMnLkQ
	 oMr2ijjlWi3PBck2+r4wRzKuD9jxsC9uhT0EXjDSRcwNx3pRGkg7qOz03LCNS208u3
	 BDNrLa5pvvsS+tZI7BPsqtirdxQFsJ0lvByOJIBH3a/t2GviUzRP+8kWOkjPx2RIdE
	 bMOKxD9x4AdOLRN0tSEudSoCxY13eJvLagUjKg1f7bPxCVMZN0b2cIR5TltlOnu0Lf
	 wVESKPFM8QI5w==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 0/4] Route RISC-V SoC drivers/firmware/DT via the soc tree
Date: Wed,  9 Nov 2022 21:22:16 +0000
Message-Id: <20221109212219.1598355-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_132319_711557_1ED60BF3 
X-CRM114-Status: GOOD (  11.85  )
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

Spoke to Palmer today at the linux-riscv pw sync-up (see [0] for anyone
that may see this and is interested), and he said go for it w/
MAINTAINERS changes. Routing patches this way was proposed by Palmer @
[1] where Arnd & I had a wee bit of back and forth about the maintainers
entries required.

I've CC'ed soc@kernel.org with the expectation that this series will go
via the soc tree with Palmer's ack.

I noticed while running the maintainers pattern check that I had messed
up the i2c driver in an earlier submission - I think that Lukas may have
flagged that but since It's not been fixed I've tacked on a patch for
that too since I'm already in the area...

Thanks,
Conor.

0 - https://lore.kernel.org/linux-riscv/mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3@palmer-ri-x1c9a/
1 - https://lore.kernel.org/linux-riscv/mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a/

Conor Dooley (4):
  MAINTAINERS: add entries for misc. RISC-V SoC drivers and devicetrees
  MAINTAINERS: generify the Microchip RISC-V entry name
  MAINTAINERS: add an entry for StarFive devicetrees
  MAINTAINERS: repair Microchip corei2c driver entry

 MAINTAINERS | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
