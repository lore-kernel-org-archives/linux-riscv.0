Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA18DC3ABC3
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 03:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CleEKmUc0ZO8epsvnyZ93nD55bEjktZMS+SOytmOayE=; b=uTdeZ/x0iN1lHy
	nAGFtlEqjf6VtKnZV6BhxvKKYypIN+dxvOFjzi57RL4RfKZvom9oUcnXrgKMgUTUF+IMI3Rza8IkJ
	ix05TyAs1mzsKjMUH21yYMTPpxQaYK5KV4WU3s6SPVUPApPGcon7EwO2lr+dX4UHGi/uA1QtzzElp
	wi5wJssYcOSyQgiHIc2eYNBzXcsMGlok27gUhORBn3cu2LLSIQLpQhbcpSOiFztf0fI/2fl12zO8R
	MDGVoI14S84LJRPc7zaPdZwhhBgM/zEmwrea0YXDDhngRl5xuA8skC+ByWexFCzu03MtAFNgV4P4a
	Rgz47vHfjeHagjELxicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPEF-0000000Gvuf-0BbT;
	Thu, 15 May 2025 03:25:51 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFPED-0000000Gvrp-0HGD
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 03:25:50 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 54F3PIfo056447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 15 May 2025 11:25:18 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 May
 2025 11:25:18 +0800
Date: Thu, 15 May 2025 11:25:18 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Rob Herring <robh@kernel.org>
CC: <krzk+dt@kernel.org>, <tglx@linutronix.de>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <paul.walmsley@sifive.com>,
        <alex@ghiti.fr>, <daniel.lezcano@linaro.org>, <conor+dt@kernel.org>,
        <aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
        <tim609@andestech.com>, <linux-kernel@vger.kernel.org>,
        <geert+renesas@glider.be>, <palmer@dabbelt.com>,
        <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 3/9] dt-bindings: interrupt-controller: add Andes
 QiLai PLIC
Message-ID: <aCVenXTis5Hq5Uek@atctrx.andestech.com>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-4-ben717@andestech.com>
 <174723438154.2170160.6461910184012543621.robh@kernel.org>
 <20250514150134.GB2180131-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250514150134.GB2180131-robh@kernel.org>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 54F3PIfo056447
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_202549_434213_40CB8674 
X-CRM114-Status: GOOD (  10.69  )
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

On Wed, May 14, 2025 at 10:01:34AM -0500, Rob Herring wrote:
> [EXTERNAL MAIL]
> 
> On Wed, May 14, 2025 at 09:53:08AM -0500, Rob Herring (Arm) wrote:
> >
> > On Wed, 14 May 2025 17:53:44 +0800, Ben Zong-You Xie wrote:
> > > Add a new compatible string for Andes QiLai PLIC.
> > >
> > > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > > Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> > > ---
> > >  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> >
> > Applied, thanks!
> 
> And now dropped.
> 
> Rob

This patch was applied but has now been dropped. Could you please clarify
the reason for dropping it?

Thanks,
Ben


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
