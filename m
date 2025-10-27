Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1317CCCF9E9
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 01:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kP6wkE8nTFOr7BQj7lYRMmQRyZ3a+s2iMEL0efdiMOE=; b=RFt5pPAHj2Pp1O
	OfpjFtZyfI8IQmmMnIMOvc5rI1baG8bMEPMMe2DmmW/gEjJfvlAlk4mDbfiy2viK39BoDaZiHE0Fk
	xw7A6e9Kj2/2niwOtn18xMNwL4shwOzYem2OAw6rKmv7FDHS0+nt8BYF4I+qmOPVMjenH38Cy3y0a
	v33lAFcYfkwZnW2KUaszYEOb/q4SffPV5DWqOFcEWliBDL3p8Z5SITYthRqiLmQpCfnrKzZtPQkPL
	WUwp+L/wAbqTnl+YLohXm+M/TNaM/ye/b+BN3aJntAaDVAjYZIzUXqGz5mACpRjOzVFD7vB/+JM0z
	Gmvxfd5Vq8SmnfTgBV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCKe-0000000CyJx-2ZfH;
	Mon, 27 Oct 2025 01:47:36 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCKY-0000000CyIZ-0V2T
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 01:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761529577;
	bh=JKvBZjDsOTLXyIrjlq85SYk3IB+FQ+tslKn3pT1PxHA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=osalstkLmmxJZ4PLSkMofHZwwguqSO6OH1r7Am8+AmygXg59sQyD/hQIRRQ0nhuxr
	 VVQe3BHbdi+G0RPxIfFYpq0vT4v9mzkhJSZ+sO3tpDSrZH5pDiSIQEbLRriO4AlIqO
	 DG8RvWpbnD2/ucVjsvILS6KgW/7PnYj4QlQISkKU=
X-QQ-mid: esmtpsz11t1761529569t620f5b47
X-QQ-Originating-IP: gRCZCvClcdLqDxlvoHtFPbNT2eMAdSDim737RLKZi24=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 09:46:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1112444510141004708
EX-QQ-RecipientCnt: 17
Date: Mon, 27 Oct 2025 09:46:07 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Message-ID: <A61F456C6F5290B8+aP7O37HtuMNAYHpi@kernel.org>
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
 <0E60AA15166FED21+aP7JRmPzDIq2WhWw@kernel.org>
 <1bceed11-e7d2-4d10-93fc-b40c6e102bc5@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1bceed11-e7d2-4d10-93fc-b40c6e102bc5@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OREGFqcrX2H3/L8J1Tb+z5fzGYvk0lt8FOsB027SDVCdj+t1M/S7+Oya
	TxGqfzSjorqWhynqVzq2B9tkqqSq12d150Y/rz8EE3wYPItwElBqkwRij9jps3Utxl9ia0H
	W8fcTaC4ltz0WbP3ywpT/HZeZf6X6VHgpZ3SbI8RXDrTAt77J3Xkzd2kV1Gtd6g2NmHUW2I
	jA9C3RW4XJDZsVUnYhW6kXVKjqXQ8XhzGYOqTNqqvf+4s3R02smlGfQEu/0IEpoe+2x1Zdi
	//HJpzYdXXz//Y7ivyd64mC+cuEyAVLanlCj85K/RvGs/e7i6zvcJa34m+9yhAHy5DTvc8I
	w58gx3MReBkFuHuKiH1506Kly4OiM5OhUdwWJJ96CkXZlT6bS31kXsUgX6AczD6ywRU/wdW
	H4voOhVZN01o/w+uyXBTKen+pIHCDgpKQsFS4McTKdD6gUtPKUPlC96FmPLivB0VVqM26Ub
	SFSFrAdt3YttHE1S2ARoOZkqnyi1vzk7j+6HzlphI7RjCmsEQsBMOFQH9cy5/T8qjFa++HE
	8MA07BKk/6gSKo8La4sAp66JPATVJk5z37rJZh9GkJb65BNB+6HhaOV2rhUNfsrX0FqfM6W
	0lOQsZ0qDT37t2xytm1t2lQ1TdGawkmK8S6cR6YxjWYMLuMaveExxcVgAtXpv6xPadQXzpy
	bfZWAywmJkUYpZP3uia41BJEReF0ZWkylcQZC/JVZ87ef/fQn5sHymo2JAi8igVy4Z/IW6Q
	kfQkFcBEHbFZRF49SzWYNJJsKGxcxwXIhgZNKRx8PhGJkrQw8Eke2LNJqKfbEvQpuNrZVbK
	25mQ9/s1yFSyUGS0Eo1jIC+AdFsUuKcZl8M8ulGCA6vo0oZKdqs9lBCB33TOmCeXmyhFAIM
	hz/uus93yvZ5WnpCaJNhFkLrOkHy85GMT3Kc5n6as0icX3sGaC1hV7b/yU6Pa/ITsrbWgao
	Qtl+O2iUb8/2BhoWAVpabM9F39awdTHz77CWwZTTN3cMY/VmmmsCM4cKcZEZrasR91w3wJR
	enp3Udbhe1xs/+mmMLS3YI0TZwJeH2sr3rBFs2FdDG7AFieJ6WQNL8ALQu0wOFx7jwPavOh
	bi7O+aYKOpRZ4EBwFaYyWZ0YAQhn2tTPJTBswvQTounSCqUtBLOKE1azS2EaDVKaw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_184731_134999_28443607 
X-CRM114-Status: GOOD (  22.25  )
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

On Mon, Oct 27, 2025 at 09:39:09AM +0800, Junhui Liu wrote:
> Hi Troy,
> 
> On 10/27/25 9:22 AM, Troy Mitchell wrote:
> > On Sun, Oct 26, 2025 at 10:00:40PM +0800, Junhui Liu wrote:
> > > This adds Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC,
> > > as well as corresponding dts bindings and dts integration.
> > > 
> > > The CRU driver framework is built around the clock controller as the
> > > primary device, with the reset controller implemented as an auxiliary
> > > device. The clock part refers to the vendor's code [1] to determine the
> > > structure of the clock tree.
> > > 
> > > The Anlogic DR1 series includes not only the DR1V90 (based on the Nuclei
> > > UX900 RISC-V core), but also the DR1M90 (based on the Cortex-A35 ARM64
> > > core). Most of the clock tree and CRU design can be shared between them.
> > > This series only adds CRU support for DR1V90. Nevertheless, the driver
> > > is structured to make future extension to other DR1 variants like
> > > DR1M90.
> > > 
> > > This depends on the basic dt series for DR1V90 SoC [2].
> > > 
> > > Link: https://gitee.com/anlogic/linux/blob/anlogic-6.1.54/drivers/clk/anlogic/anl_dr1x90_crp.c [1]
> > > Link: https://lore.kernel.org/all/20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech/ [2]
> > > ---
> > Do we really need a cover-letter? Since you only have one patch, Is it
> > better to put the above information below the --- line in the actual patch?
> 
> Yes, we do need a cover letter since there are 6 patches in this series.
> I think the b4 tool only added you to the To list in patch 0 and 1 because
> you gave a Reviewed-by to patch 1 in v1. You can check the full patch
> series from the mailing list [1]. Thanks.
> 
> [1] https://lore.kernel.org/all/20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech
OOPS!I missed that...
Thanks for your link.

                - Troy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
