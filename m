Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62000D46C0F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 22:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPvGH4H2nobryZfLbejd4N/rGmQHlJz4w0W6bVGVmSk=; b=gvjZbPz847dEmL
	QdLCV7DGvgKKcO2VvNXoW+1B87JyDZDGfWMvhe477ExTtqgjCgxoAYJqfi7/Q/dB1TJdV60Mo/37/
	eBo7B/cQLWcdE66hWLDzT9oP88inz6cOBuEF1vez96t1rzbv4RmXMq/9JPr5ASqm6UPX5AGwY9/DX
	HFnxUnKx1i5505oeYwopB0UmXJCHasW74Q69DekpEWX2LdaNz7leZskuOte1agXfGqaXYVwtKxfZy
	9+c5DDw1gXeD9b1zqmpgiUh3lKljamkj6W8XbhwpnljE9rsn6cJWkklv7cpx1v9Lc7ZB3Ra5kuBtW
	SAaptr6ARuaJ/jK0KV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEUa-0000000GuYT-0Q6I;
	Wed, 28 Jan 2026 22:58:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlEUS-0000000GuY6-0g8r
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 22:58:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06BBC6001A;
	Wed, 28 Jan 2026 22:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55009C4CEF1;
	Wed, 28 Jan 2026 22:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769641102;
	bh=Z9OqPeF9IuAUdu1BeekUKKNyvo5WfxDHVzPt2apoXDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmMeCKXSIpP9RojxNRVcs7H1lP0xvQLj/J7xBmpBkM6vQOrrRbhWg6Wj4A95BnSiF
	 O1otSk2VEAJeIin0cfw6z3ZNBiXTFpQeMi1t8JmuNJqYRSIc9apZ/WHkCvUHTovATr
	 1FeOnna9f3hTBz4v6UWNmwRzw2lb2SRZ+55Se5862Z7w0GLTiRY2uVz5lFV+K5KL7M
	 JxM4+ZJg0iZgyi1tbxdU4FPL0zkNMJb/OJSyiDYpK/coqjb8ajQv24ghCJDzwW/0UB
	 H80PkBWiWFMGSjb2H3LDBd1U4RWSXHhrflJyCjeNyFJFsWulrwWKL7JDhBvitR7tWK
	 vpEbN8h6dZDoA==
Date: Wed, 28 Jan 2026 14:58:20 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v6 4/9] dt-bindings: display/bridge: add binding for
 TH1520 HDMI controller
Message-ID: <aXqUjLG9YdKSwh/2@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-5-zhengxingda@iscas.ac.cn>
 <aXpzC8MnShvc0tJv@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXpzC8MnShvc0tJv@x1>
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 28, 2026 at 12:35:23PM -0800, Drew Fustini wrote:
> On Fri, Jan 23, 2026 at 05:28:25PM +0800, Icenowy Zheng wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> > 
> > T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller paired
> > with DesignWare HDMI PHY, with an extra clock gate for HDMI pixel clock
> > and two reset controls.
> > 
> > Add a device tree binding to it.
> > 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > No changes since v3.
> > 
> > Changes in v2:
> > - Re-aligned multi-line clocks/resets in example.
> > - Added Krzysztof's R-b.
> > 
> >  .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 ++++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
> 
> I've applied the bindings patches (1, 2, 4) to thead-dt-for-next as well
> so that 'make W=1 dtbs_check' won't break for the next release of
> linux-next.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?h=thead-dt-for-next
> 
> Please see my reply to patch 1 for the rest of my message.

I've dropped the yaml patches from thead-dt-for-next based on Conor's
advice. Patches 1, 2 and 4 can go through drm.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
