Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB55FC36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=no798794+JSoke+Dl42Mvs0kowFpON6xY9+n5a7vVWQ=; b=djyTBGVqkhI/Rx
	zyGD7kAwldGSngkyst6rPVyxnF31tpIOteyac/hMjC9FBkNSzsZ0XihNuzArhRja39NvGXTOXF+8Y
	hdCr5DfxslIbLDcNL2O3IeT7Xto4sFBrpV795r/zgiSBqPfVOwzvAErmPMkvOsoZ954ddZKTMsp75
	EBL+pp4n+lWjmXAJKFwyb3ZZYkplWQPCHD2xJoef36oZpCymqkV/JSIdpJHWxOPCyyvipc2ikf3LI
	iygmPNOrNvddkpqFk/9xInhHVFRCeA+oJsZcdjBc9XZTFzzOu8Qqse9JPBk/hMOiAMNON63QT2oa/
	q3Q7wIURfhHeIe2HYSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nG9-00000000gWL-3zNm;
	Mon, 07 Apr 2025 14:15:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nEV-00000000gFl-3OZV
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44D84A48BCE;
	Mon,  7 Apr 2025 14:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61733C4CEE7;
	Mon,  7 Apr 2025 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744035230;
	bh=ahGOKRGJmVuL3rnUqzbdjyTJAQIanf1NZjaOE+zSZes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Osk59fOafMhVKJyIc3lhaBtEhZ1E+eyNpYibhPmolxY9yHL6hdpODTieP4Q9XtglN
	 bkfRhuGlDD+9zzCPjs3oIQUlH9L/kjmKdDBRmKbMxUwREyiELDmQrdH720kZTyxBQu
	 UDMf8rg7ZM4u3436PtEPaHWmJIUiuW0t5RxZ6LzKooGc6mB0VmR+iiW+4QnLic91U8
	 VRXAe4rgJmkZ231me51Y+r4EgW5S5JASYmaaK5Endvt1HJlUpLpZJTnGffYYAx6JQB
	 Vtk2QO7tOpoBRvbBRXvLJdMXStl8+kuWOOWSivNXTzjrZnsLXwITp/zvZMeRhrKsem
	 GoN4v7FDE44Gw==
Date: Mon, 7 Apr 2025 09:13:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, tglx@linutronix.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, krzk+dt@kernel.org,
	alex@ghiti.fr, aou@eecs.berkeley.edu, tim609@andestech.com,
	daniel.lezcano@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: riscv: add Andes QiLai SoC and the
 Voyager board bindings
Message-ID: <174403522889.2246903.6406254978033445523.robh@kernel.org>
References: <20250407104937.315783-1-ben717@andestech.com>
 <20250407104937.315783-3-ben717@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407104937.315783-3-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_071351_915062_593E8C2A 
X-CRM114-Status: UNSURE (   7.62  )
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


On Mon, 07 Apr 2025 18:49:30 +0800, Ben Zong-You Xie wrote:
> Add DT binding documentation for the Andes QiLai SoC and the
> Voyager development board.
> 
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../devicetree/bindings/riscv/andes.yaml      | 25 +++++++++++++++++++
>  MAINTAINERS                                   |  5 ++++
>  2 files changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
