Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D29DEFCD9F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 09:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWdjKu6Kb5PZcyct+9iswnCaQEuS9Dstz15cIw5yXUo=; b=oW4Z5H4HquFDdk
	LRif7xlxH/2lFGQ3rl2PmfKhWkyhlMfHhy+jr/hjiOJf4T/jTr5umR9daVMN2V/ULFKqEsXeb7Fqa
	SKNO6u9O+1ZRuaS/BQsA3/OFkgPAF19hBVQ71jVkjVloULS8KhFCMle+bSKuT4lvxvvy877gt5RxQ
	tL8ODrDjp3BdC9IUwONFqWsB9V9F3/cUsZPuYSsJQAVePm/rK65TzhCwBJJWI9csXrskYsrF0EX4z
	j6EnGXoGmTs9Fjl7IsCwCfYOqyqdyXL7nr4Y6PApfj8QZ4qhCtATHdpCfieMSfTDn8iZqpVAC0Nev
	/6QlkjDZBAVSLFAWtVYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztae-000000097Kc-2PfD;
	Tue, 10 Mar 2026 09:41:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztad-000000097KW-2Tbx
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 09:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D460560054;
	Tue, 10 Mar 2026 09:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01085C19423;
	Tue, 10 Mar 2026 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773135682;
	bh=MI2ZH/AeYekSd3NSVEh03PNPVermAkXlM9wK0xXJndo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPhHeSLvqH1vkiIgPz+naYAdqXxvvcUfiHk7VBW8dcd4lLCQ6syQGWbXbxQurP1ap
	 wx8EjMS6loe1lUWPiakYO+mIVl2X67FWE55bIAqFFjCiPyy/y4EwJ8Is0bUOh1z5u8
	 13N1P17ujnqmIW8VwvcTovqe9jnBibP91khnZSDiGNQshuPedMMEnWj67wxaPLiTNR
	 dHZdvnE5YxyLUijKIR81POj0G8JCR7tA0ofhINFGGwvzG8TnokcDRQyyl1TdzO0sSx
	 WHlpcFtSALky340mtDCptJmtUz0pG7iWRLJlubbz218Mzhe6Z+ATkUgR807sk+KTW+
	 AvKSqxUJ27RIA==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
Date: Tue, 10 Mar 2026 09:41:14 +0000
Message-ID: <177313556765.25225.2115332539060652807.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309030000.1157040-1-amadeus@jmu.edu.cn>
References: <20260309030000.1157040-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
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


On Mon, 09 Mar 2026 11:00:00 +0800, Chukun Pan wrote:
> The SpacemiT K1 SoC has 3 PCIe EP controller nodes. Add the
> 'linux,pci-domain' property to assign a PCI domain number to
> each of the controllers instead of assigning it randomly.
> 
> This creates a stable sysfs path, allowing userspace scripts
> to reliably target specific PCIe devices (such as PCIe NICs).
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: Add 'linux,pci-domain' to PCIe nodes for K1
      https://github.com/spacemit-com/linux/commit/86314111f654310a69c9775e35e263c036031675

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
