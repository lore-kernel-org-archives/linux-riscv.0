Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B82C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 22:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=h1JctVBf7sFzLiNxviNPzsvidSO0Rb/HOa97wcLwfJU=; b=EyJFOul+J8Udu1
	+b968IpbQMJSJuco90EdEPAopDuyNOjPgMZ9RAhNqdq+kjp0dgIGRvyzCMFeJ4poB2OFWrRpmSicM
	hO2Cx1W7fn3mVjYhSYB1wtnKEaM5TSGJpyk4L2eX+NafQ51oXmD4IAmVaMQydRjwqkqlZfWuO0+wt
	ZpIcKeEJV34/6czyfugUpntWuaYSd7opIi9GVTMACF9IqaLcZZxQP1Myq7xOQJVsZRYECWZCZkbMT
	Z37f+Xauv6mm/dx5PaF/tCxJfdWZuqEf/y0s/NWxXyLc6rKGgZ8R3s6uj4I/KGfnzXLze9q+wlvqK
	v97QV9GATecEgO1p/6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1Bh-00C5v0-EF; Fri, 22 Jul 2022 22:32:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1BV-00C5pL-U4; Fri, 22 Jul 2022 22:31:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69E18621E7;
	Fri, 22 Jul 2022 22:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B40C341C6;
	Fri, 22 Jul 2022 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658529107;
	bh=Fu/FeSpx214X/BoevcG6EdcLDKAQmFEJ4sg9DFLd4o4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZLV9f00xXHBEZYi6orEA7bLQq5EBmkjAC5OfsmVms59T4noJqnthFEJctnRQzcz0q
	 saujHsxGUH2AqpZYlYrMt2cHABd3CBr66SzRuzUJFwWAD3cbyYVCMZbVjvwo/fepiF
	 nMuA9fEXrGKvFb9oBxCYdvL5ZTl7fAmamCCjK8/pXWHEddPhcCmQIfU4N61F6zDLVV
	 8mp5ksuEju114L04yVutuvqeopl1JZpmzw5RajfSgQybSjyVXJ/v+9IwcrzJlIA4f7
	 zS3kqAW22nepuIGjCi9zt12w9Rh+H06irv2dok0IHfYI/phb0B5TDEr90WIHFpPN94
	 B84Q/D5pLIURQ==
Date: Fri, 22 Jul 2022 17:31:46 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-csky@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] asm-generic: Add new pci.h and use it
Message-ID: <20220722223146.GA1947394@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YtsaA2Zjqa/XZZou@antec>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_153150_050396_DB08E83C 
X-CRM114-Status: UNSURE (   8.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jul 23, 2022 at 06:43:31AM +0900, Stafford Horne wrote:

> I will respin a v6 as we didn't get a reply on this.  Bjorn are you
> planning to apply the series before the upcoming merge window?

I see your v6, and I can apply it.  I only got patches 1, 2, 4
(without the csky patch).  Do you want that to go a separate route?  I
don't care either way, but not sure it improves things to split it
across trees.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
