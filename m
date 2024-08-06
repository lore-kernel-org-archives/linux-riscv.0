Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A58C52D71
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Raqrr+FmykHQOMkjGOCBaYLbvBhKHFqjwRRPRpssH3Q=; b=hmIAXvQmQDQxxT
	3uGD3GkBx4YQtezTwqnQLdVOdYSxXVBAo4wKfj/M4M7yzM3PaVIjAdwcCzG4HMfYskYxqO9/P0IbJ
	AJCCXg5X/cUMr+8A3CquRjtTmdpp/KKzeYw/EVNV2UiKMtNVGkpVp8s2Ju7NTt3dP4qeOqVU9AfuE
	jD3k9qHnrznhlPpsgvDUBi4Q3QepAdeNHKclwgTgRYusVBjWRD3gXLwFovId0wYhSggty3U3hxOZa
	sjDWZ7JT5NVGx2VkCv394UBtP+8nLSJum/PigEZYAhT76e3A+kjJ0PymOkvdVHa/iviCG1v+xIrPB
	XAwOPMyJxMacrxdIUZbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNf3-00000002RiK-2MbI;
	Tue, 06 Aug 2024 17:07:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbNf0-00000002RhP-1OAP;
	Tue, 06 Aug 2024 17:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 52B11CE0F1C;
	Tue,  6 Aug 2024 17:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63975C32786;
	Tue,  6 Aug 2024 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722964063;
	bh=HvEeTOUhv0C5pYu4c2PjUH50AMGhSOMbB8EnQ1HMeqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwIxAO33u0yFzM+dF0iUSmlKMQsZXTwp8VI7ArfEHq0VvmnDx6cYZLVP1UxWLUfWw
	 GF/uA5Wcsds4bRYB1J98jF2OlYsy1vLLnSZwo0+uUFj5DbOsxC4UbIZ5zDYOsATlGP
	 uLcn7/1lIZ1ef5eTnSzqbAGyf9dTIaX/m0Z40gJRHLURctanhzWe+IBC1oFwnVcsNK
	 M7AXV/D9ruxMGaRGoCrW3IW9MgVQqiophBMn+rxsBN8L0xgm/yY7AUHqMtrzgG4Z9o
	 ac0deMWGdNHxZ+hn9HJgD9wQyc5excsl/0T/9TVWAb+H7IQz5KU90IpSo2oEp9w/f1
	 70sCB3rJtPuTw==
Date: Tue, 6 Aug 2024 11:07:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	Minda Chen <minda.chen@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: jh7110-usb-phy: Add sys-syscon
 property
Message-ID: <172296406163.1706072.1585378061823817206.robh@kernel.org>
References: <cover.1722457123.git.jan.kiszka@siemens.com>
 <ebcfe039b13097e53b3721f56a45d99807f2925b.1722457123.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebcfe039b13097e53b3721f56a45d99807f2925b.1722457123.git.jan.kiszka@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_100746_571248_1DFC3D40 
X-CRM114-Status: UNSURE (   9.42  )
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


On Wed, 31 Jul 2024 22:18:41 +0200, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Analogously to the PCI PHY, access to sys_syscon is needed to connect
> the USB PHY to its controller.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> ---
>  .../bindings/phy/starfive,jh7110-usb-phy.yaml         | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
