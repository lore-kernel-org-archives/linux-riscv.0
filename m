Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA176E77170
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yohnbx43Gk1g5HC0f17vbWFghKDCcIgfbsDo54uBcZM=; b=lyyw0+6PAPSf7t
	9QldOTs2xrTdK59o2NCDJnCTd2IqJw09rTBHP7fuka4SNy8ASJvDEI1vtxnQYM6y6Q15TdGQ+MzFs
	lsPc4/j3JkuJ5X/e09LgbpCfPa3W0uQL7tvTKh3R0RIcVo7mBxqDU0ZMw0k2ceP4eTlONdQeyTfgW
	4rc9sriJR1k54tUe0m9t0q+QMKX90OcBxiXHRbSZSrjFVPJgmQB4XNNRqvB96z3B6Clsn0RT7vfpR
	W7YbQMnibeWyOQX8RORwLSakOfP8wqhzFZ99V+1SO+qhT5mfnjyusktFG8uTzIzFFCxQDyc3cseV7
	0ooeeNDtHt50Ccvzlp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIvtd-0000000DnLe-30DV;
	Wed, 04 Dec 2024 20:22:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIvta-0000000DnKs-3ZcM
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 20:22:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A1825C6D0F;
	Wed,  4 Dec 2024 20:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5556C4CECD;
	Wed,  4 Dec 2024 20:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733343769;
	bh=0trD3xgMuTcQ522NBjE3lOKrUeCloP+XOtSvdc704e8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ii4Df9ETJjJlTt+OFI6XJ4qtn4c1zLT2QMdivBw/V6WxCbffn+5GnT/x9V0jfnriG
	 Ckj+ctFI030Oqp5kY2Ttv0zR6kOW749IuqszjgSBILW1RheoF2Qa5KYC5gQAeHkeYY
	 60YmmVLwIiVObrU/sYeTsQfk677+TlpgqBD3deYZ0bMgchJ8BxteVjNdjA/02aIGEH
	 dFzHP0jZ+vrXV/0LwSRwq4WXz2bREIb3pdAc/V4tfUOzKq/PcbQEXs5+DxByl0mhPX
	 DX69u3WXwSYfdZICNYAciKuIOrB+b/3OnAnc+F9VlSw4N7qgQRppPV9nKXsxdcxBle
	 T2bU/8iVNzqkQ==
Message-ID: <d15dc75cb5d0346bb56c58d4a933cf7e.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com> <CGME20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7@eucas1p1.samsung.com> <20241203134137.2114847-6-m.wilczynski@samsung.com> <f21ffd12-167b-4d10-9017-33041ec322b0@kernel.org> <07bfb02a-1df3-4a03-83bb-d7edc540739d@samsung.com> <1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org>
Subject: Re: [RFC PATCH v1 05/14] dt-bindings: clock: thead,th1520: Add support for Video Output subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, airlied@gmail.com, aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com, frank.binns@imgtec.com, guoren@kernel.org, jassisinghbrar@gmail.com, jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com, matt.coster@imgtec.com, mripard@kernel.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, ulf.hansson@linaro.org, wefu@redhat.com
Date: Wed, 04 Dec 2024 12:22:47 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_122250_931204_F1737A31 
X-CRM114-Status: UNSURE (   8.58  )
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

Quoting Stephen Boyd (2024-12-04 12:21:11)
> Quoting Michal Wilczynski (2024-12-04 02:11:26)
> > 
> > To address this, I'll specify the 'reg' property in each node to define
> > the address ranges explicitly fragmenting the address space for the VOSYS
> > manually.
> > 
> > vosys_clk: clock-controller@ffef528050 {
> >         compatible = "thead,th1520-clk-vo";
> >         reg = <0xff 0xef528050 0x0 0x8>;
> >         #clock-cells = <1>;
> > };
> > 
> > pd: power-domain@ffef528000 {
> >         compatible = "thead,th1520-pd";
> >         reg = <0xff 0xef528000 0x0 0x8>;
> >         #power-domain-cells = <1>;
> > };
> 
> You should have one node:
> 
>     clock-controller@ffef528000 {
>       compatible = "thead,th1520-vo";
>       reg = <0xff 0xef528050 0x0 0x1a04>;

Apologies for the typo. Here's the correct line:

	reg = <0xff 0xef528000 0x0 0x1a04>;

>       #clock-cells = <1>;
>       #power-domain-cells = <1>;
>     };
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
