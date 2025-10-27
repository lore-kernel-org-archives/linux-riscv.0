Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173DCCCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CIL8RUXuaPlAA2SVJ4EHG2iMqSABmwZBzH17w7ORE8=; b=Vsml/6HYkK1JXi
	IcwAiRqnpCRB8GgK+SM9Bjajvq8vTD6Q9vXbcTDBEVOl0lj+EaVLZLntrxgj5kDWHFCCJiQju7nrU
	yUhc8yFnMx+JDOPFlABLb3SD7hXk6KmOEtCUL84P9sXEGU9yoWlga5EvfrUdicWwY+BF3tzrhgM3o
	wsIqKGer5nDgy+CKCzoUtvYctOs/H+WVmwNkJqm913d+mKMZcwFModEjxz+vQdaDWpVjKezsDIdU2
	BaNPVs0Jg9uHnZDBrdUWkvbKGCxbprTuIUjNPykZbJ4jYOWp0AX/pIg6wPHjqcF5BzhMgdO9sBcZL
	AnwMpmK+p5dqdquMBE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNQP-0000000E4ZD-34fi;
	Mon, 27 Oct 2025 13:38:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNQO-0000000E4Yl-1oFJ
	for linux-riscv@bombadil.infradead.org;
	Mon, 27 Oct 2025 13:38:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SBzTJGNPqfgMV5eUkKm2/xzjPmcyE229N1DrH/IP+kU=; b=VLoCCVlXaeOf7IS5tZ6mlESD9n
	G13vU2Wau+4cx3RfzEOk8RLtlOyZo5qPjv2+5V4ivXNww52gK9Fe/eua84oCqbFGOt3uAUqX3FrnS
	NxIFCiHafr/X97hzYzuorAU3rMIYoYNZ4SoLddBf/C1CAmnTZB333Y5s+6dhpFtNK+yhs5pjZqGWd
	iHwcJDw7cPxKUOZGVTXKD5RkrH7hvC5Iu0GQygjIP7HMRDH+h20CHEEz0gutQPE+EoWL6mHhJIWNT
	gG1JrZJIgyPhtZx6n7xNJRq7xvbCFWgpsFlEQQuXeqjiq1+rSr4PS/826UE56ymElT/Yrj07yuseJ
	qNDEyETQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMYa-00000002CWO-0hHM
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 12:42:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 841B54386D;
	Mon, 27 Oct 2025 13:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099C1C4CEF1;
	Mon, 27 Oct 2025 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761572287;
	bh=gqvuTK2airj61pCPi99n7PP0OTEYVHFTeCG5nZFFdzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n7rTHVOu0MVumBdZo9ViIt/dHyGzHfHHi7pdbUP3eF9Ubg5CmW/X3t9S6LGI3OYtB
	 UZoPhdl+Rj1NpD2KiIAbMnTJCiju0ZtQDG7RSZx2uPhTZ0M0+zfHYTOXTFE691Cufb
	 mMcsmB21miV4uJmANZCj/Gm0GLo1wz3rTUBQw9HA+DSCA7zZ1N3dLiKKXYBL1f+iww
	 Yuu3bcc7JGpNmd3+TyrXQuqGdmIgqlKTs/lovY3DiqLlQnY9sqJO+qZcB5bBNDh+ZN
	 qFKX4DKjEHU4BZosKAnG/SMyoQV9AVb86ozyRx2HfeT3kX9GG6JYt1hq/hlogpm7p2
	 Ye2JjJC7I1LZw==
Date: Mon, 27 Oct 2025 08:38:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Randolph Lin <randolph@andestech.com>
Cc: kwilczynski@kernel.org, aou@eecs.berkeley.edu,
	thippeswamy.havalige@amd.com, jingoohan1@gmail.com,
	palmer@dabbelt.com, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, randolph.sklin@gmail.com, namcao@linutronix.de,
	tim609@andestech.com, linux-riscv@lists.infradead.org,
	alex@ghiti.fr, bhelgaas@google.com, lpieralisi@kernel.org,
	shradha.t@samsung.com, conor+dt@kernel.org, ben717@andestech.com,
	devicetree@vger.kernel.org, inochiama@gmail.com,
	linux-pci@vger.kernel.org, mani@kernel.org,
	paul.walmsley@sifive.com, pjw@kernel.org
Subject: Re: [PATCH v9 1/4] dt-bindings: PCI: Add Andes QiLai PCIe support
Message-ID: <176157228191.240954.997388702686594192.robh@kernel.org>
References: <20251023120933.2427946-1-randolph@andestech.com>
 <20251023120933.2427946-2-randolph@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251023120933.2427946-2-randolph@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_124240_460396_B68FCE8A 
X-CRM114-Status: UNSURE (   7.12  )
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


On Thu, 23 Oct 2025 20:09:30 +0800, Randolph Lin wrote:
> Add the Andes QiLai PCIe node, which includes 3 Root Complexes.
> Only one example is required in the DTS bindings YAML file.
> 
> Signed-off-by: Randolph Lin <randolph@andestech.com>
> ---
>  .../bindings/pci/andestech,qilai-pcie.yaml    | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/andestech,qilai-pcie.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
