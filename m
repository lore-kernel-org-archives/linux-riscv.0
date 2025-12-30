Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D65E92722
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 04:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AP/1qiF+Q3k+WoDC5vooOH9ScFEbmBpX8NM4ZaJ231c=; b=qEa3Ikmbe+NOPk
	Y4QNpPcfIxFZWzm+WBDMk+010zNo5DeR25GfmOx5RxlzB1qhcyjNSRKT6oJih/6M7nK/Zo8zzMSEy
	lYG73M2n5pGZbmk+rFk0TPBGN2bn5p31jaLdujTMecE+G6GPn4+Yvv1uJhzdUfm53SrYQ0lRdMa5E
	zGuZdO1n2sDKGujfOf63r0Oy36Eru3HJQG+0oCg9f3DsMJ3qUOckKYkCTLBAT0P8+0xColvo6T48t
	jO9PzzhQ3TK9/R4KPZ839Ij21ceeX38ErVc+6Iy3P35oLq+Uek0LxeJiFm8YEFcc+RsbRI5mDLzjr
	4fOWAoG35/6IVgkfCz3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQuc-00000004NnE-21D1;
	Tue, 30 Dec 2025 04:00:46 +0000
Received: from mail103.out.titan.email ([34.226.11.255])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQua-00000004NmT-0yBN
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 04:00:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4dgKBK1bPTz7t7k;
	Tue, 30 Dec 2025 04:00:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=pgoi0kavrdiXHW8AgEZoYSacqFxVye/voJVKHdbpWi0=;
	c=relaxed/relaxed; d=ziyao.cc;
	h=subject:mime-version:to:date:from:cc:message-id:references:in-reply-to:from:to:cc:subject:date:message-id:in-reply-to:references:reply-to;
	q=dns/txt; s=titan1; t=1767067241; v=1;
	b=NsV8C8cWdw/MPZHR9ezKCn7T7LEkPtCv2LrM4rAaZmXAjFJU3bBnNhhqNAm0c67Lu2qavpO9
	+r6niwOo6bmH3k5sLceL5uRUy1lnoroK0W5FgFrvQ4Jx+I7aYLNIK604vpZ4r51rdAVktNfmM/P
	YtS6Q6B1ooSb47FI65xKJHec=
Received: from pie (unknown [117.171.66.56])
	by smtp-out.flockmail.com (Postfix) with ESMTPA id 4dgKBF3PBtz7t7g;
	Tue, 30 Dec 2025 04:00:37 +0000 (UTC)
Date: Tue, 30 Dec 2025 04:00:34 +0000
Feedback-ID: :me@ziyao.cc:ziyao.cc:flockmailId
From: Yao Zi <me@ziyao.cc>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/3] clk: spacemit: extract common ccu functions
Message-ID: <aVNOYuC0-lcymn-P@pie>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-2-28b59418b4df@gentoo.org>
 <3ea5b28b-a0ed-49fb-a8a8-6f575a24820d@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ea5b28b-a0ed-49fb-a8a8-6f575a24820d@riscstar.com>
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1767067241070516921.30087.1589077241347436584@prod-use1-smtp-out1002.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=WtDRMcfv c=1 sm=1 tr=0 ts=69534e69
	a=ILiXPvH1yGBXwyP4YTaA5g==:117 a=ILiXPvH1yGBXwyP4YTaA5g==:17
	a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=CEWIc4RMnpUA:10 a=VwQbUJbxAAAA:8
	a=9WVa6OCtZuRSJDRKafAA:9 a=CjuIK1q_8ugA:10 a=3z85VNIBY5UIEeAh_hcH:22
	a=NWVoK91CQySWRX1oVYDe:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_200044_408074_5D7AFBD5 
X-CRM114-Status: GOOD (  15.69  )
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

On Mon, Dec 29, 2025 at 06:50:14PM -0600, Alex Elder wrote:
> On 12/26/25 12:55 AM, Yixun Lan wrote:
> > Refactor the probe function of SpacemiT's clock, and extract a common ccu
> > file, so new clock driver added in the future can share the same code,
> > which would lower the burden of maintenance. Since this commit changes the
> > module name where the auxiliary device registered, the auxiliary device id
> > need to be adjusted. Idea of the patch is come from review of K3 clock
> > driver, please refer this disucssion [1].
> 
> I understand the point here, and it's just like the first patch:
> you're extracting generic code out of the K1-specific file so a
> new K3-specific source file can use it too.  This is really good.
> 
> However the end result should incorporate *only* generic code
> in the generic file, and have the SoC-specific source files
> contain everything else.
> 
> But as you have it now, the (new) generic probe function
> contains special handling for "spacemit,k1-pll", and that's
> not generic.
> 
> So I suggest you still implement k1_ccu_probe() (and k3_ccu_probe())
> separately, allowing each of them to do platform-specific things
> before (and/or after) calling the generic probe function.

I've raised similar concerns in the series for K3 clock tree[1].

Regards,
Yao Zi

[1]: https://lore.kernel.org/all/aU50DIe9qMneb0GT@pie/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
