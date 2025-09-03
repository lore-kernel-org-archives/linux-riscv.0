Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B242CA1005
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 00:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ucorKFWxiJhifR9Mj5fU2D1RJzWVhCpbpJzpHbzGzzw=; b=AZ1FRD3CQ+vVy2
	VxVGt7EMfGLze0ASe2lBFWHm3L3lkJnvnazTf7ywMtCQOEVlFeJnI9e+KFQpMgP+kkU3Nfrn0xKMu
	pWHxI4fD4hNKS1JML9hXwRQGqeLF82zY+C8snSqv6ZeO6BXmhCCvpcuspwj6jr4UMnj4w5TtLEfu3
	n6gs/VkY7q/L65NRDlAMY6BHHYazb2o5HAyMsfJPcftL8eV9zZSsijOfJqbpCPMcaMSTNgJojDKp4
	s0hb77z2xoOUU2brHQhlUK1HbrNSbZc1f40OczTPn5EPSpaYGjtmd7+U2+l0xKIaWmOHhmaaCncte
	T0AQTm1cg+lbxmnhWEGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbfE-00000002uPl-2l4X;
	Wed, 03 Sep 2025 00:47:52 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbZv-00000002ob6-3A3t
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 00:42:25 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B093725DB0;
	Wed,  3 Sep 2025 02:42:20 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHYT6eTry66f; Wed,  3 Sep 2025 02:42:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756860139; bh=FD3rVftaBGV2mQ+n+/bkbUpgs1u88xX5yE3RgbMNAtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eT+h1A1DHmwt2J7b+cv2FaP5H+FE9UbE0BAKODxKF+YU8YtK+BNqz3bLbfFZcAJ3t
	 XH92wBTThN35ERFKFS7NcCGzVbvBr+HX9DyQuOyu9fw7ZqZabkXwmDnevU5W/znfig
	 vohxwjPgdmaPkeK3kRO++iNCBHMsI8lYAtNzi6/q7Pa34MD1p50MQnSnw5phz56XYq
	 io2EJXu2vJMIQmO163jRG6l/bts3K5rPwblQEErpULIK75dEhEd1fWo1JkZSn2r59S
	 1BH3x/Ng9hbDY1wkevrIhSV27kV1rjzK160Bdkk+dZ1/wenjXbcPdTKnncYgK+1N4g
	 Bwk2sW3ABM3Qg==
Date: Wed, 3 Sep 2025 00:41:57 +0000
From: Yao Zi <ziyao@disroot.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH 1/4] dt-bindings: reset: thead,th1520-reset: Add
 controllers for more subsys
Message-ID: <aLeO1T1YM8_UorEr@pie>
References: <20250901042320.22865-1-ziyao@disroot.org>
 <20250901042320.22865-2-ziyao@disroot.org>
 <8de5763d7104a552f32196f04363d071548b7bba.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8de5763d7104a552f32196f04363d071548b7bba.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_174224_200773_98BC794D 
X-CRM114-Status: GOOD (  14.92  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 02, 2025 at 03:57:07PM +0200, Philipp Zabel wrote:
> On Mo, 2025-09-01 at 04:23 +0000, Yao Zi wrote:
> > TH1520 SoC is divided into several subsystems, most of them have
> > distinct reset controllers. Let's document reset controllers other than
> > the one for VO subsystem and IDs for their reset signals.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > ---
> >  .../bindings/reset/thead,th1520-reset.yaml    |   8 +-
> >  .../dt-bindings/reset/thead,th1520-reset.h    | 219 +++++++++++++++++-
> >  2 files changed, 223 insertions(+), 4 deletions(-)
> > 
> [...]
> > diff --git a/include/dt-bindings/reset/thead,th1520-reset.h b/include/dt-bindings/reset/thead,th1520-reset.h
> > index ee799286c175..927e251edfab 100644
> > --- a/include/dt-bindings/reset/thead,th1520-reset.h
> > +++ b/include/dt-bindings/reset/thead,th1520-reset.h
> > @@ -7,11 +7,186 @@
> [...]
> > +/* AP Subsystem */
> [...]
> > +#define TH1520_RESET_ID_C910_C0			5
> > +#define TH1520_RESET_ID_C910_C1			5
> > +#define TH1520_RESET_ID_C910_C2			5
> > +#define TH1520_RESET_ID_C910_C3			5
> 
> As the kernel test robot already noticed, this doesn't seem right.

Yes, this is a copy-paste error. I'll fix it and run static check before
sending v2. Thanks.

> regards
> Philipp

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
