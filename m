Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDFD2C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 17:34:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDEB61157
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 17:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BDEB61157
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDZbeOA/HiiIGqk1Mja/ZAOxDMgwK2z2Zus4pypblJQ=; b=1GQ2zK1VI7hmds
	ZVesK7bsy2i7KrS8NwbpnSK+IBu4B4r4/a3euEuaXZpsWKJw1ZJ3a5z9rv/MfakvQBRVrF5SE6Odq
	cJtbAlh9x/Y0b6xL35p/fU1Ligzo2/3lIAhiclF4O0uNWhRLrLbFe82SZiQXx7vJjy9GLCM/gKtvi
	3rtK/XBwsa8173ZCCX9Y/rypM5stYrAH7GqtJveDY1WmOBH/7IQMNalVhtY9iMooJ5wDaX5h2a9iI
	a0ELMLbSX0sA8ls7VB2yzNQamtigq0UE2GRVKy4GLt7t/yf/IewVS96D0YcBAt9SG7L8vACg8yb1u
	LBc14uGUDNcgbKCBflOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH8Ox-00BkBN-Qh; Fri, 20 Aug 2021 17:33:55 +0000
Received: from wtarreau.pck.nerim.net ([62.212.114.60] helo=1wt.eu)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH8Ou-00Bk8w-SZ
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 17:33:54 +0000
Received: (from willy@localhost)
 by pcw.home.local (8.15.2/8.15.2/Submit) id 17KHXall026146;
 Fri, 20 Aug 2021 19:33:36 +0200
Date: Fri, 20 Aug 2021 19:33:36 +0200
From: Willy Tarreau <w@1wt.eu>
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 LukasBulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, linux-csky@vger.kernel.org
Subject: Re: What is the oldest perl version being used with the kernel ?
 update oldest supported to 5.14 ?
Message-ID: <20210820173336.GA26130@1wt.eu>
References: <37ec9a36a5f7c71a8e23ab45fd3b7f20efd5da24.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37ec9a36a5f7c71a8e23ab45fd3b7f20efd5da24.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_103353_280071_C98333F3 
X-CRM114-Status: GOOD (  12.65  )
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

On Fri, Aug 20, 2021 at 10:27:59AM -0700, Joe Perches wrote:
> Perl 5.8 is nearly 20 years old now.
> 
> https://en.wikipedia.org/wiki/Perl_5_version_history
> 
> checkpatch uses regexes that are incompatible with perl versions
> earlier than 5.10, but these uses are currently runtime checked
> and skipped if the perl version is too old.  This runtime checking
> skips several useful tests.
> 
> There is also some desire for tools like kernel-doc, checkpatch and
> get_maintainer to use a common library of regexes and functions:
> https://lore.kernel.org/lkml/YR2lexDd9N0sWxIW@casper.infradead.org/
> 
> It'd be useful to set the minimum perl version to something more modern.
> 
> I believe perl 5.14, now only a decade old, is a reasonable target.
> 
> Any objections or suggestions for a newer minimum version?

It's probably reasonable, even the Slackware 14.2 on my home PC, which
is starting to date, ships a 5.22.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
