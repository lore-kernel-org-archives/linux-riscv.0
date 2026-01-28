Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAEED46C0F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 22:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVS9vfp+S9RUxEBhZflxpAEAijVy3zcsXRNeupjl8oQ=; b=p2AC0dV0mkfc2r
	7AuMsnpnjm/8LXBYi+4GHGsuV1ZmFnLR+U6rCHeyqNzZFrEFtcH4d5MvgXB+7LiyjtVdWRx0BCXFc
	0sp/fTvJnIyd6JHyj/jqKEG6Ck1txuCxd5qK1xsoM8DU2SuxaTILjkWj0nHuIHSBo13B2gumyUawi
	i80eLab6VBqacElhweKoSJdfRR+LcDEjmYU2waCxjEbeOa7tVnYJP0nooWMx18K1EiOs/A3uTlUde
	bfV8aQVFN3nCOQpBvcxNFsHb/ijzaaxX86lnB0YxOkXK+52i8nLPpzjAW2P/52Z3xIg81g+pDzCEd
	KJ/vZ7g4Bqr1feDnwa1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlETy-0000000GuV7-27ob;
	Wed, 28 Jan 2026 22:57:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlETv-0000000GuUm-41Ou
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 22:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7032A41567;
	Wed, 28 Jan 2026 22:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2BAC4CEF1;
	Wed, 28 Jan 2026 22:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769641070;
	bh=zzDPxa7YTOuxLsTohGS9o5cD9aMxBThQMZVsekatb4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APE1AEwTUOcZZ+IQmP17cC9GRK94sU9OeZ/v7jHgkDwIOBOrZpB+vQtNnXrep80Bx
	 9sJacVWYQ6fmBBJQon+E4uhVlMmA4PsJDmWLnT3NmVaxKhDMcx59DvgL8JbahtGyJW
	 tlSCEoqsoDhTsndDt3Mqe3mZzNNWhVT/bJ9V+zWwFEMjT4xIYYmOxL/VmZ6jVouwE0
	 hHTPw5qCftlxbvrMn/eRhsu1c8GwkR6CkPfk1LtxyJmFEU7AYKXQWBFpdirjOxx5UK
	 vDnGnXzSxLwu5r8+nlH5COUoPzb0VzZcz4lcpKNrmrtfg/B+RkdZQleGKglPI+OANW
	 jQUhDbQJJfntQ==
Date: Wed, 28 Jan 2026 14:57:48 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v6 2/9] dt-bindings: display: add verisilicon,dc
Message-ID: <aXqUbDw45ulf8c+s@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-3-zhengxingda@iscas.ac.cn>
 <aXpy4f9G9QKRh3Ts@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXpy4f9G9QKRh3Ts@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_145752_046320_EE42E6B3 
X-CRM114-Status: GOOD (  22.08  )
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 28, 2026 at 12:34:41PM -0800, Drew Fustini wrote:
> On Fri, Jan 23, 2026 at 05:28:23PM +0800, Icenowy Zheng wrote:
> > From: Icenowy Zheng <uwu@icenowy.me>
> > 
> > Verisilicon has a series of display controllers prefixed with DC and
> > with self-identification facility like their GC series GPUs.
> > 
> > Add a device tree binding for it.
> > 
> > Depends on the specific DC model, it can have either one or two display
> > outputs, and each display output could be set to DPI signal or "DP"
> > signal (which seems to be some plain parallel bus to HDMI controllers).
> > 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > Changes in v6:
> > - Added Rob's R-b.
> > 
> > Changes in v5:
> > - Dropped the requirement of port@0.
> > - Dropped the if clause for TH1520, which seems to be not needed because
> >   of implicit DT binding rules.
> > 
> > Changes in v4:
> > - Added a comment for "verisilicon,dc" that says the ID/revision is
> >   discoverable via registers.
> > - Removed clock minItems constraint w/o specific compatible strings.
> > 
> > Changes in v3:
> > - Added SoC-specific compatible string, and arm the binding with clock /
> >   port checking for the specific SoC (with a 2-output DC).
> > 
> > Changes in v2:
> > - Fixed misspelt "versilicon" in title.
> > - Moved minItems in clock properties to be earlier than items.
> > - Re-aligned multi-line clocks and resets in example.
> > 
> >  .../bindings/display/verisilicon,dc.yaml      | 122 ++++++++++++++++++
> >  1 file changed, 122 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
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
