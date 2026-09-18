Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B58C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyA+RkRww7Ye9L4kH5ym48e2qB5OiFkRs4mgZx1gSm8=; b=zRztVTO4JCYM7W
	Gg4BzLvKUJIFU9ciKzkLzWnvVwo++zVgBPErYO/vvUJmZJlJz+Vz9nEs2uRpgIg7YMhzYMz5WHjxm
	nErYNwZqlZE9c0YEojRn5/gwXQ0vCEySPAwEEP0xFZ9ruN/em1IlR/loSJj5XV9MN0Ky420VydJMu
	SiItSTK0kNg8i72Iz8pkeab/Z21eGUZxw4PJMDZstN1KksoNQS5k1GO7yMCTbxKGVsd7irsTVS8qt
	ccojGJgu6o050TlFmuVXqRfChwDnh0rsOuDI5FsxvhZEAUMbN/VDC9I3injhYVuzImO46opx5O/hf
	ft2Jd5crGPGF0jDrwOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dQt-0000000FKHA-2ER6;
	Fri, 18 Sep 2026 18:35:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dQr-0000000FKGT-3Sqm
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 18:35:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DF43B6053B;
	Fri, 18 Sep 2026 18:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6336C1F000FF;
	Fri, 18 Sep 2026 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756532;
	bh=zL3zf/Mxv25j31UU57durVN7+v90+sc0FJoRGvW0bLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O+aaC1EhcNhwSVV6edxB8w7RjETC+qhUgcUbhqETv1XF4VnvSt22MYjSZkh4W2PnF
	 ++bdTsPpa2BSkhqIQAIkuZv3miG+fwxi33gbZyv9vdtgil8GTIopbAnFSpD9G+8GLJ
	 EMPM4TvwIvTeaqAacnKCs31+x9SgQVkj6PklT1NK2ghTud++y3nPQ4ajJB4bs2wrah
	 7kPfDugWq/2nTH6ysSmdIF5Me/dbx2Lcj/MrbUtGarWhZaC2wMxE62l+4+RsOnijOK
	 MauJY+TyCxZnyeXyr3dHIZzj84MPibUg7B8Gtr41ia5/b+HAuKv0Vg9WuTYiabca3H
	 mTe7xvgb0UTrg==
Date: Fri, 18 Sep 2026 13:35:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-gpio@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH v8 03/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <178975652969.1333472.11106750466244695151.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-4-changhuang.liang@starfivetech.com>
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


On Thu, 10 Sep 2026 03:03:38 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
