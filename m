Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9CCCA1005
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 19:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVaH6Hax2phsEuwztSsO10ZgqSqXeDRFv6Y2qh8VBI0=; b=URQVuSqnYDbTol
	+hg9bIu3JlOl0a1elzVgb47iXTm7+VbwfEWixEwv9bBn/b0iUziYaEHdS3Yv7KMB0zyF3YZ4TtSTZ
	4CzCz51R9ylkFeFxJZhH+sH80sRkAaFYATVRBUv9YeEpII9GINmXlRedOhvUbWMOEbB3iGucGn2Up
	HZ75Xh2EC+mJq0qXo2/GH9/u5EwLeFiO1nPqGw0IMAKGbZn6wxbeEv6p5ecXB/YIVqvIQSo5tM2hi
	RcrGBV4Bcug79OdVuWndE2LW1+TizRIGO1+NmwW+e7Gc+O++KNnJEVIOrQDuGGahx/hvXt5qSDAgF
	l395jVCbh22EKdeD4SXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWQ8-00000001cw5-35hx;
	Tue, 02 Sep 2025 19:11:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRVp-00000000CVr-0VS1
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 13:57:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1utRVS-0007q2-Gg; Tue, 02 Sep 2025 15:57:06 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1utRVO-003P16-30;
	Tue, 02 Sep 2025 15:57:02 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1utRVO-000Rg9-2b;
	Tue, 02 Sep 2025 15:57:02 +0200
Message-ID: <705de60088f72c1ed575d92e8c4f4b90989385c5.camel@pengutronix.de>
Subject: Re: [PATCH 1/4] dt-bindings: reset: thead,th1520-reset: Add
 controllers for more subsys
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Yao Zi <ziyao@disroot.org>
Date: Tue, 02 Sep 2025 15:57:02 +0200
In-Reply-To: <75cafd7e-02a5-41d1-9daf-24bef20dab82@kernel.org>
References: <20250901042320.22865-1-ziyao@disroot.org>
	 <20250901042320.22865-2-ziyao@disroot.org>
	 <20250902-peach-jackal-of-judgment-8aee13@kuoka> <aLazFzq2l7s66IqS@pie>
	 <75cafd7e-02a5-41d1-9daf-24bef20dab82@kernel.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_065729_158139_CB22E6F1 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Di, 2025-09-02 at 15:44 +0200, Krzysztof Kozlowski wrote:
> On 02/09/2025 11:04, Yao Zi wrote:
> > On Tue, Sep 02, 2025 at 10:27:53AM +0200, Krzysztof Kozlowski wrote:
> > > On Mon, Sep 01, 2025 at 04:23:17AM +0000, Yao Zi wrote:
> > > > +/* VO Subsystem */
> > > >  #define TH1520_RESET_ID_GPU		0
> > > >  #define TH1520_RESET_ID_GPU_CLKGEN	1
> > > > -#define TH1520_RESET_ID_NPU		2
> > > > -#define TH1520_RESET_ID_WDT0		3
> > > > -#define TH1520_RESET_ID_WDT1		4
> > > 
> > > This is ABI break and deserves explanation and its own patchset.
> > 
> > The registers in control of TH1520_RESET_ID_{NPU,WDT0,WDT1} don't belong
> > to the VO reset controller (documented as "thead,th1520-reset"), and
> > thus cannot be implemented by it. They're in fact AP subsystem resets,
> > which gets supported in Linux with this series.
> > 
> > Is it okay for you to separate a patch to delete these wrong IDs and add
> > them back for the AP reset controller latter? Anyway, I should have
> > provided more information about these three resets. Thanks for catching
> > this.
> 
> So feels like separate patch dropping these resets with above explanation.

They happen to be reintroduced with exactly the same values, just for
the AP subsystem reset controller:

+/* AP Subsystem */
+#define TH1520_RESET_ID_BROM			0
+#define TH1520_RESET_ID_C910_TOP		1
+#define TH1520_RESET_ID_NPU			2
+#define TH1520_RESET_ID_WDT0			3
+#define TH1520_RESET_ID_WDT1			4
[...]
+/* VO Subsystem */
 #define TH1520_RESET_ID_GPU		0
 #define TH1520_RESET_ID_GPU_CLKGEN	1
-#define TH1520_RESET_ID_NPU		2
-#define TH1520_RESET_ID_WDT0		3
-#define TH1520_RESET_ID_WDT1		4

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
