Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48745C48BD7
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JPqqcB4cG6Nd9+KipjR+iOPVEBVcV8nQIxSRS2GQGC8=; b=pZTjV7RBmo+HUe
	80HjV+o0b2DZria2W/Md9AZqI3WynG8B0gou9s05nSKxTpXIOgon3w/+rPWUmPPcgNKG3OfMafDvb
	wWJ1ZHujp1wiGWb9MhaTuQKbUo59Q0fY+ZtyX7cmROZDu1zCP7hWd+PToNoxrOFSwZpfixXMuFtOB
	eIBFjNEoBit+v1Gr4RjPlrsM0R6T2RcL2qY3FUBJlt7CPMvYLfL9VS8SogHTQZ/hIdVrAqTkP5BUW
	jjMt6mAdxZWjPhZYpsm7lu6Tns1Fej4wMrzSPWsX9FNVhkqPR9lYf5cfUKjufPrpCB/MwkO+LGrnO
	QQdBc7ONiNamkW8JNkgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3G7I-000tu6-2U;
	Wed, 15 Nov 2023 13:39:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3G7G-000ttj-01
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 13:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B1F861602;
	Wed, 15 Nov 2023 13:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EEAC433C8;
	Wed, 15 Nov 2023 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700055577;
	bh=+m5EkdsuFgk4M8NgYmYjSHFQr191uVxuI+jCtlMUOdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUTy4gSPEZVY1b1dUA7g3l2l1Pjx6h4pd44zta+k9/BLgrwu2g907HexbUKqb8p3L
	 PXtWeBDSN5DsolmNPBeXwGGeNAv9DDOwap9o59WksBFGtsSsY3nq1iQaLKpeEC75zj
	 deGYYaz8tRPiSJGmy2j+pj7JTfl4hGgic2/Hj2OVHP6wOiMgKxhHguNqGJi4NNNwXZ
	 Wd2Yy1U8HX5jjhxvUMmXGRWEoHD5IHmjN/bHBoHpgZX6kwxRdGInAcXgS8bW8EeX59
	 M/2hXSw958zAWSyd7sp6oQ2KN3oZ6QzJdmipMODs3uc3P9Fw/zZChlAMjWVsfVdJgj
	 RSPPd1UMxfigg==
Date: Wed, 15 Nov 2023 21:27:14 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: reset: Add binding for Sophgo CV1800B
 reset controller
Message-ID: <ZVTHMsXaPdHiuUOF@xhacker>
References: <20231113005503.2423-1-jszhang@kernel.org>
 <20231113005503.2423-2-jszhang@kernel.org>
 <44f21244-5bf1-4e0f-80a9-6ec76d65eea4@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44f21244-5bf1-4e0f-80a9-6ec76d65eea4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_053938_107679_E63966AD 
X-CRM114-Status: GOOD (  16.55  )
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

On Tue, Nov 14, 2023 at 10:12:35PM +0100, Krzysztof Kozlowski wrote:
> On 13/11/2023 01:55, Jisheng Zhang wrote:
> ...
> 
> > diff --git a/include/dt-bindings/reset/sophgo,cv1800b-reset.h b/include/dt-bindings/reset/sophgo,cv1800b-reset.h
> > new file mode 100644
> > index 000000000000..28dda71369b4
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/sophgo,cv1800b-reset.h
> > @@ -0,0 +1,96 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > +/*
> > + * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CV1800B_RESET_H
> > +#define _DT_BINDINGS_CV1800B_RESET_H
> > +
> > +/*				0-1	*/
> > +#define RST_DDR			2
> > +#define RST_H264C		3
> > +#define RST_JPEG		4
> > +#define RST_H265C		5
> > +#define RST_VIPSYS		6
> > +#define RST_TDMA		7
> > +#define RST_TPU			8
> > +#define RST_TPUSYS		9
> > +/*				10	*/
> 
> Why do you have empty IDs? IDs start at 0 and are incremented by 1.

there's 1:1 mapping between the ID and bit. Some bits are reserved, I.E
no actions at all. Is "ID start at 0 and increment by 1" documented
in some docs? From another side, I also notice some SoCs especially
those which make use of reset-simple driver don't strictly follow
this rule, for example, amlogic,meson-a1-reset.h and so on. What
happened?

And I'd like to ask a question here before cooking 2nd version:
if the HW programming logic is the same as reset-simple, but some
or many bits are reserved, what's the can-be-accepted way to support
the reset controller? Use reset-simple? Obviously if we want the
"ID start at 0 and increment by 1" rule, then we have to write
a custom driver which almost use the reset-simple but with a
customized mapping.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
