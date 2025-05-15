Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFD3C3ABC3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 03:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mi+tGRec6kQDq4uzXs82sPVvhwrhLvI0sYC+wWKdFU4=; b=DkP82lvln6Q6Vx
	A9hgu5w6bCVcJIRqRvBPvmRC7zcM8HxbwgjOLMxPxtOc2+Ft5MndlioybMdGzOQ8HjM0aRqkavmLF
	AlnXlmg0NRn/cTr3aNcBRt3cymI6LgjN5bPWj7hKsT/NIAn/8ybMBeiMJkIKZdp0L9IFOU4E4O9Ij
	Ggo2deT3xxJxFkaTrfe7KbGVLYCet2yb1fO21kroFCu1B+L4zvuVuiAlDiil9iPvm/Ue5Ppl5eb8I
	NcAE2luo88BRtOdpNpXxzXIzCwCfUJLSMHmHqD6HjlLe6hfmrOwIKj9v43HZlRBe2BR7H+hqSymrw
	UDnRSBUimoxlsKGc3a4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFP21-0000000GuH1-1TRK;
	Thu, 15 May 2025 03:13:13 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFP1y-0000000GuGY-24Vz
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 03:13:11 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 54F3Caka051801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 15 May 2025 11:12:36 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 11:12:36 +0800
Date: Thu, 15 May 2025 11:12:36 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Rob Herring <robh@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <daniel.lezcano@linaro.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <devicetree@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 4/9] dt-bindings: interrupt-controller: add Andes
 machine-level software interrupt controller
Message-ID: <aCVbpNkyHlfg+vc7@atctrx.andestech.com>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-5-ben717@andestech.com>
 <20250514150102.GA2180131-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514150102.GA2180131-robh@kernel.org>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 54F3Caka051801
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_201310_845774_972D04D9 
X-CRM114-Status: GOOD (  13.53  )
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

On Wed, May 14, 2025 at 10:01:02AM -0500, Rob Herring wrote:
> [EXTERNAL MAIL]
> 
> On Wed, May 14, 2025 at 05:53:45PM +0800, Ben Zong-You Xie wrote:
> > Add the DT binding documentation for Andes machine-level software
> > interrupt controller.
> >
> > In the Andes platform such as QiLai SoC, the PLIC module is instantiated a
> > second time with all interrupt sources tied to zero as the software
> > interrupt controller (PLICSW). PLICSW can generate machine-level software
> > interrupts through programming its registers.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > ---
> >  .../andestech,plicsw.yaml                     | 54 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> 
> This won't apply for me due to MAINTAINERS conflict with this series. So
> apply the bindings patches with the dts files.
> 
> Rob

The conflict is due to the second patch in this series not being applied.
Should I wait for that patch to be applied, or is there something specific
I can do to resolve the conflict?

Thanks,
Ben


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
