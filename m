Return-Path: <SRS0=Qg0u=QH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48CDC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 31 Jan 2019 19:25:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3A89218AC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 31 Jan 2019 19:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5VGFAbC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="jwwe3PLV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3A89218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LFnddTZk2xd9N8k8I9ysqUSR4k1Ohq1997hadDPmmMM=; b=i5VGFAbCReeO004/Pcqy7PRvi3
	wetH081EOsj4ztkYtnVcDDF9s96xDM6E+G403bpS6aLCVFtp3hu6JvfASGANetfRbZKEvNqbvywDH
	2UxcvETJLuzOW+lx4CsOuc8lmAPbVNpkihAsJlg5gDEF2mRx0S5fueFZAS1BrklJfDAKhFq51aMtx
	s4J5D+9CNFyAIpNFyRFEf21jldS0T/FFEDbPKMlAhC0qVmfNrZZK409AUGxrQDODMxAvcH6gz6CtQ
	/wLMiP6Xvh5RAuEBNCw+tzqF4h4fUhpIW+2rDhCZ91T7KusaVfFsAld7YViSy+UF061avEzni6CxB
	1cSP7PIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpHxr-0003Yc-Sk; Thu, 31 Jan 2019 19:25:31 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpHxl-0003Xl-IA
 for linux-riscv@lists.infradead.org; Thu, 31 Jan 2019 19:25:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1548962726; x=1580498726;
 h=to:cc:from:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=D+vNrmqwEjMHNurnKP/z8nZxchGuz9LetIH+1hu+Pcs=;
 b=jwwe3PLVTItqITivgaLdQ119H2bAhTaRylpS9YHCFD+xwI7xiMLelyFW
 tdygtwdEQgj0K4equalbjybgEVxhfeGP2OwqzL+xVv+gutMwc+Yng4CMb
 vWX9nncBm/9FSSRFrRSol/X7U64hKdIH68vG993YxUci8c0wLYpvpDBFz
 8vmihTkRBRrqz7SXzsgTNMeDHKby8GTn7HXRxwGqOrHVn/6zCwdpEOKa5
 UWzgMCsmq67tDgg3XgIVVTkicrgXPCKEUwM8iLm7o+yVrC1y5UV9rD4za
 O+efcRR8tOxQZMN2a/NpIkF957vJjTtycH/+ISblHt9LnkV1Rp4weoHFc Q==;
X-IronPort-AV: E=Sophos;i="5.56,545,1539619200"; d="scan'208";a="102019985"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2019 03:25:22 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 31 Jan 2019 11:06:17 -0800
Received: from gjnvvz1.ad.shared (HELO [10.86.62.37]) ([10.86.62.37])
 by uls-op-cesaip02.wdc.com with ESMTP; 31 Jan 2019 11:25:21 -0800
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>, qemu-devel@nongnu.org,
 "sw-dev@groups.riscv.org" <sw-dev@groups.riscv.org>
From: Atish Patra <atish.patra@wdc.com>
Subject: RISC-V Open source Supervisor Binary Interface (OpenSBI) Version 0.1
 Released
Message-ID: <17ecfa78-7098-8cdd-7318-68a997cd685d@wdc.com>
Date: Thu, 31 Jan 2019 11:25:20 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_112528_912187_2ACAFDB0 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 "olof.johansson@gmail.com" <olof.johansson@gmail.com>,
 "David.Abdurachmanov@cern.ch" <David.Abdurachmanov@cern.ch>,
 Anup Patel <Anup.Patel@wdc.com>, Alexander Graf <agraf@suse.de>,
 Christoph Hellwig <hch@infradead.org>,
 "rminnich@gmail.com" <rminnich@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 Jorge Campello De Souza <jorge.campello@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

OpenSBI version 0.1 is now publicly available in GitHub at
https://github.com/riscv/opensbi.

OpenSBI is an open source implementation of the RISC-V Supervisor Binary
Interface (SBI). RISC-V SBI specifications are maintained as an 
independent project by the RISC-V Foundation in [Github].

This initial release of OpenSBI provides an implementation of the RISC-V 
SBI specifications version 0.1. These specifications define the legacy 
SBI interface currently in use by various products as well as by RISC-V 
QEMU virtual machines.

OpenSBI also implements SBI compliant early boot firmwares capable of 
handling various boot flows and payloads on various environments. 
OpenSBI firmwares have been tested with payloads such as U-Boot and 
Linux kernel, showing that these open firmwares can fully replace the 
legacy non-standard BBL intermediate boot loader.

The platforms supported with this first release are as follows.
* Sifive HiFive Unleashed board
* RISC-V QEMU *virt* and *sifive_u* virtual machines
* Kendryte K210 SoC based boards.

OpenSBI implementation can be easily extended by RISC-V platform vendors 
and System-on-Chip vendors to fit new hardware configurations.

As SBI specifications evolve and extend beyond the current base legacy
features, OpenSBI will be modified to provide a reference implementation 
for new SBI specifications.

More information on OpenSBI capabilities as well as a contribution 
guideline are available in OpenSBI documentation included with the 
source code in GitHub.

[Github]: https://github.com/riscv/riscv-sbi-doc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
