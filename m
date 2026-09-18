Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B401C982DD
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 19:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pt4c5oEbgXsl3XGeZfPEJHG/kYcENYSt9In+O+YAi64=; b=cdySIy9BJfd+Px
	Bin/gDUJjIXUBLv0zFn4OqWfCyK06YHEGtQIv9MKg94df5vfgKZsOIUVcW4+ONUQSsuuiobNhUhjH
	Y9Qv71/mPx2nVPVSBLUPKp0ppEpvGS0mZ4uf7tWiDVytJ7ilzeCBmT5sQLFq+zX2RexBFWc+FOZ1f
	M63RLe677osD9XlYNh/DiIO9Vcb/JrCBdbHhR+ELREtyxRt6mm/GYhCSIHMiV5h7wNz9j/2s+71uo
	zLUGQONL15KNEBF/4leoOjA1jdILWpxRi679cvdqOuimnsVBG8EDBcqpM4pol5Q5pKWuFMIMohWXz
	oPSMU5gKjO7xiIFpfrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dqG-0000000FMz9-1BSI;
	Fri, 18 Sep 2026 19:01:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dqF-0000000FMz1-2TyW
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 19:01:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08D0F40501;
	Fri, 18 Sep 2026 19:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC29D1F000FF;
	Fri, 18 Sep 2026 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758106;
	bh=PZtRe8/sfu+cFB2Kt87gZj0OEGNX4bKFhx1kTn2/Qeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LnIJNjMETsBBn6uxmN4f54V2RzEIPQ4uWwa9nz3pCQue/g53wpM94+fgOvWi/07vz
	 sgTNFsI0BVg6mzLKbK2InCg8dzWb02vEMArgWpHVQ2ySAjazMqEQFW2dJhUngl3clh
	 UW/JSxn2GOJhFKgVjt30HY27DJ5b3jzwooaQAQzs9gcNyVwY3hcbJL1GQCWLXUFMjb
	 czofJ+ZGCMwwNhyDVzinijUyz8oOKlo37/Ddr3qRWfxKLP/28gwoT9NMBsICuL5DGs
	 YkIATSkdzIyJ2ACYc3/ztFsoVU8vfk4zUplxTVsZ5OdcyDXu5l9CV6beTJVpfJp6Rn
	 oh2iULpVsspaQ==
Date: Fri, 18 Sep 2026 14:01:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v8 05/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl
Message-ID: <178975810467.1420737.16588227115480467397.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-6-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-6-changhuang.liang@starfivetech.com>
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


On Thu, 10 Sep 2026 03:03:40 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
