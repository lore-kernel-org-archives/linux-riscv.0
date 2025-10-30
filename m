Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32542CCF9FC
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 12:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3l5QV1SHdOsIFCPlFcSQEirA8UqPavxh1ZjPkA6isPg=; b=sHHu+paMDFaW9+
	4G1tRP3OojDk67U2genDo2kVgc6pJYxtJNULR9swETrVlw6f+SLE8hU+B3u82ilv9RIGiDuEsR0Wz
	/9WEV6Hq3bprmhiJf6VsqA8l59jbZBDEus6C41XoATeg/CzyRimiy6tpSU9Z7tMoIfeAXqpl8KI+6
	NtC8Oonze5D6yxKWYCbJjSvcj868O0sUsdVEm/ymsPa2WI+SM5R20KtZmf9UCOWDoHp1iW0IXJ7/p
	XE4VaEg14E3Xrps2jBeNswLu1krHkrIbYmQkxV2IvdcvtKroYQcr5qYlD7OR5Cl3MR86p/rWYiIl3
	q/6cKBDILco1uPPJR2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESCF-00000004ADW-0XuB;
	Thu, 30 Oct 2025 12:56:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESCC-00000004ADB-4B5v
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 12:56:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESBz-0004nE-8s; Thu, 30 Oct 2025 13:55:51 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESBx-006DFj-09;
	Thu, 30 Oct 2025 13:55:49 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vESBw-000000009Jt-3zT9;
	Thu, 30 Oct 2025 13:55:48 +0100
Message-ID: <845f360bb63bf3db5a57f90a5c474271a7194d9a.camel@pengutronix.de>
Subject: Re: [PATCH v3 0/5] Add reset controllers for other TH1520 subsystems
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yao Zi <ziyao@disroot.org>, Drew Fustini <fustini@kernel.org>, Guo Ren	
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley	 <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Michal Wilczynski	 <m.wilczynski@samsung.com>
Date: Thu, 30 Oct 2025 13:55:48 +0100
In-Reply-To: <20251014131032.49616-1-ziyao@disroot.org>
References: <20251014131032.49616-1-ziyao@disroot.org>
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055605_056946_621F8787 
X-CRM114-Status: UNSURE (   9.38  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Di, 2025-10-14 at 13:10 +0000, Yao Zi wrote:
> TH1520 SoC is split into several subsystems, and each of them comes with
> distinct reset controllers. We've already had the one for VO subsystem
> documented as "thead,th1520-reset" and supported, and this series adds
> support for others, including AO, VI, MISC, AP, DSP and VO.
> 
> For TH1520_RESET_ID_{NPU,WDT0,WDT1}, these're reset signals that have
> been introduced along with support for the VO reset controller. However,
> registers in control of these resets don't stay in the VO reset region,
> instead they're AP-subsystem resets, thus the original ABI is
> problematic. I remove them in PATCH 1 and reintroduce them in PATCH 2.
[...]

Patches 1-4 applied to reset/next, thanks!

[1/5] dt-bindings: reset: thead,th1520-reset: Remove non-VO-subsystem resets
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=68ce5ac15ff8
[2/5] dt-bindings: reset: thead,th1520-reset: Add controllers for more subsys
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=76001d5d3cd1
[3/5] reset: th1520: Prepare for supporting multiple controllers
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=ac3d323caee8
[4/5] reset: th1520: Support reset controllers in more subsystems
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=f5da5084e282

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
