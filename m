Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E2AC27C79
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlYx76nUFts8m/wuQm8XGLcgKQ3+aVd3vHf8t/Emr/g=; b=ztxrQut1jXLye+
	qbxGtOOCF9eRltXw/wdI+D0rl96os0pLTWkql/Ngo94mw9t7IaBSSHcHgAsBWY8XDLHmBzNbipLxV
	/yupq3IBgUqLOxJYyd0dywLek28PA+ghSem22QMzxfr9EpMHeBzj3R+JC4w82gnjeFcy+M2mjN0P0
	bXCTKykMR5TLyIoTvLTlHbfkkh/TUiZJUG+W1UeGnGYaJoDKD9rLGJ9xDLF2WryU4ibDMA3BZXFjk
	5MUnKoTCP7M89KPHFITobhCcwmevqSBcAf26unUE0yspUrzGWnd8zsyIZDPFVLMSL40B9OXyrBHb/
	74PAL/l8Cm8lHXYLtP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDIO-0000000B9gZ-3z99;
	Mon, 17 Jun 2024 14:25:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDIM-0000000B9eJ-15pw
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 14:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39F7FCE1247;
	Mon, 17 Jun 2024 14:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3358BC2BD10;
	Mon, 17 Jun 2024 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718634315;
	bh=ME8qz19GOaLNX/5j98PmYI8BvZeCSpM159rOsXAygRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YDV6/8UUivqNYbFD7pVzIrm2TCaXgojnoyOPLZ8dKvelVoqjnZIY3CypZ+pLoZhjQ
	 /yOIDPBxqKbscqTvLkk1id8weDXk0S4K4w8/a1W4JcE/pXVXr9S0oQgU06wW5djO6s
	 mPT83UkIWWMJd23Lzc1GvihVyvDyg3gtKgzVn24EhFp0vFLGQihj49qhSeLibl7NPW
	 WCy484OVZl9zXf2aksjjt5Qs+nvOtHxOCj78TE8W9J3CpcHeiaGHWj39MOvXOIqkXK
	 FdYpr6ZvDRzkCvsjrKEtEW+G2Fz7TIRFw3zO5nHQF/LE2zQ7p9bigBJysx0AuRDhTQ
	 TCw3dTJisTd2A==
Date: Mon, 17 Jun 2024 22:11:17 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jesse Taube <jesse@rivosinc.com>
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
Message-ID: <ZnBEBQjTQtFs-fXt@xhacker>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <20240616-exorcism-computing-e11e26084a62@spud>
 <20240616224811.GC3983622@ofsar>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616224811.GC3983622@ofsar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_072518_565574_2C4B9B86 
X-CRM114-Status: GOOD (  15.00  )
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

On Sun, Jun 16, 2024 at 10:48:11PM +0000, Yixun Lan wrote:
> Hi Conor
>  Thanks for bringing this up
> 
> On 19:35 Sun 16 Jun     , Conor Dooley wrote:
> > On Mon, Jun 17, 2024 at 01:18:52AM +0800, Yangyu Chen wrote:
> > 
> > No MAINTAINERS update, so I figure that means you don't want to maintain
> > it going forwards? If there's someone out that that does care about the
> > spacemit k1 (Jesse maybe?), then I'd be more than happy to have them
> > look after it.
> Yangyu kind of has limited time, too many stuff for him..
> 
> I'd volunteered to help on this if it can fill the gap
> Also I'd be more than happy if anyone willing step forward to co-maintain..

Does maintainership work like this? Is willing to do enough?
FWICT, maintainership involves active patch contributing, reviewing and
maintaining the whole SoC. It is better to take over the maintainership
after showing enough patch contributions and understanding of the SoC.

> 
> -- 
> Yixun Lan (dlan)
> Gentoo Linux Developer
> GPG Key ID AABEFD55
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
