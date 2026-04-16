Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA720F8D765
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XA1fEVNhG7Wr405zmQPPOMv/N3Zwg9+YHbKUE4ZHOhE=; b=X4LND3X0bG2aHc
	S2UfneGpbMu6V5iLs1A/S5Ci4fvKSsmpLdInnMPn3fbwvafLWm1I1vhOORApxEnqhG7bm6wmOPSn8
	c7mrbWrD7UTFb2VtlOk0hBtaqk2oxp1/VvmTS/nRNeFqwFQLt8Qq/cCcEiJ3JycYDv/UVSG3XQZv0
	Oi/9y3XeNMSw1D9qmGgbIK+ewglhtNq37V0XtWWh+CK5SPqJnnb0mDAJ+YgMgx6bRlDqPXBdJgCDX
	/uYyWGN7SIjYx5G/Vru/s0gBO7xzvGpayujN+YG5pklGd5Y/1p5d8pdnFdmQuz55AIaF8s9z4Pl7V
	3Ua+khiP1iwnWfZc5IhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDRSx-00000002m7W-1EX0;
	Thu, 16 Apr 2026 18:29:27 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDRSu-00000002m6q-2bAv
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 18:29:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776364138; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NE1kTZruiDkKdurSqrfKPQfNUW9o4u5ghQYH75IbdUyx3o7sj6y5wOOFBzJiz3krFD3HlyDu0ttTUS6rEGoLv3cyPaiTI1+qW5Wfu1eWzOpxDx2js9hFGI9Jl1QsaRnym5I9XZOJHnnwleYDFRg32/6L+nHXKRPor6MgFA5h9wk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776364138; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/YaAGSJbDEtzRAI5/6sj2uFumzW2z1vouVaPcA0oz+w=; 
	b=hVzdjD2VQCZ6dSwa8hh6g7oUAQ7bL+c+D3cAhRHdCFjI2ef7dZoh4fiLsg9/lLPAMt5ffRjvs+4EYXOOADIG0+ZUEasRsl3kbgVytCRRhslOukT3Y5z2nvgXp9g93JQeXmjQZ3CVuHkyM50IPMkT4Xeleb2j+dH/6qxJUKbDcUU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776364138;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=/YaAGSJbDEtzRAI5/6sj2uFumzW2z1vouVaPcA0oz+w=;
	b=byQaRwrdr5W/VTDACSb+HBtBWXizaAMCpNmGK/GGECr4/KM+COGj11uFyIJfeVvf
	3MQUH9onOpF9YfQxnvrcXHYm8GvOUVY8oN3BMWuvf77fKXay8FpBZYlUeHSwH3IcS7k
	P+sCiU6wRU2TZRxWEJgliU2/dLj7en3Z8DrJB3Rw=
Received: by mx.zohomail.com with SMTPS id 1776364135165890.8638924599645;
	Thu, 16 Apr 2026 11:28:55 -0700 (PDT)
Date: Thu, 16 Apr 2026 18:28:23 +0000
From: Yao Zi <me@ziyao.cc>
To: "Shuwei Wu" <shuwei.wu@mailbox.org>,
	"Anand Moon" <linux.amoon@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	"Viresh Kumar" <viresh.kumar@linaro.org>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Paul Walmsley" <pjw@kernel.org>,
	"Palmer Dabbelt" <palmer@dabbelt.com>,
	"Albert Ou" <aou@eecs.berkeley.edu>,
	"Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan" <dlan@kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
Message-ID: <aeEqR-ctSI-NfEkR@pie>
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
 <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_112924_713519_4AD4A605 
X-CRM114-Status: GOOD (  16.76  )
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

On Thu, Apr 16, 2026 at 01:59:05PM +0800, Shuwei Wu wrote:
> On Tue Apr 14, 2026 at 9:25 PM CST, Anand Moon wrote:
> > Hi Shuwei,
> >
> > On Fri, 10 Apr 2026 at 13:30, Shuwei Wu <shuwei.wu@mailbox.org> wrote:
> >>
> >> Add Operating Performance Points (OPP) tables and CPU clock properties
> >> for the two clusters in the SpacemiT K1 SoC.
> >>
> >> Also assign the CPU power supply (cpu-supply) for the Banana Pi BPI-F3
> >> board to fully enable CPU DVFS.
> >>
> >> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> >>
> >> ---
> >> Changes in v2:
> >> - Add k1-opp.dtsi with OPP tables for both CPU clusters
> >> - Assign CPU supplies and include OPP table for Banana Pi BPI-F3
> >> ---
> >>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
> >>  arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
> >>  arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
> >>  3 files changed, 147 insertions(+), 1 deletion(-)
> >>

...

> Regarding the necessity of listing these clocks in the DT, my analysis is as follows:
> 1. For CCI550, I did not find a clear definition of this clock's specific role
> in the SoC datasheet. Although the vendor kernel increases its frequency,
> my benchmarks show that maintaining the mainline default (245.76MHz) has a
> negligible impact on CPU performance.

FYI, CCI550 is used for naming an ARM interconnect IP[1], which matches
your observation.

...

> Best regards,
> Shuwei Wu

Regards,
Yao Zi.

[1]: https://developer.arm.com/Processors/CoreLink%20CCI-550

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
