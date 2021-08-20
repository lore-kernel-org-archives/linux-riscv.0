Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C71DC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 17:28:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2342961101
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 17:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2342961101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wELJ4ouSQsShPGW3DYcBHyFQD6Y5yvdwlOx2tF2n9Mc=; b=O31Pk1D8jPb2eS
	TvBxhmcEHLWkCCwVRjvcNen1ddKklY1qU0xTL73JTtAdg6Qyfcn1OsrSIQeCxS/6asBS85bnYIBnc
	mBJI/rV5YEn/8q+T6CIeoxDhWXPP7u7d3TeP8Rs3igBJe27C0ee97+bTL3hAs2clpcJI6VPTT56l9
	bLgIqzMnhkrlnU+EUO6E0h0BEVqaJJ/8zakSYnivOv/uq6zOgJLZwV8iott6iH/3sm3dWd4B8iIQb
	QaSsr4nt4LnB1SmWNe34KIGdxc2H9w8DqAFIJpTF/etnTv1qO7v1NO7wexeVU2jIBHoAnAA2Rc3lH
	wqcHDsJMicUWQDGN+Hjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH8JS-00Bjek-HY; Fri, 20 Aug 2021 17:28:14 +0000
Received: from smtprelay0107.hostedemail.com ([216.40.44.107]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH8JN-00BjdN-63
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 17:28:13 +0000
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id C2CF5101CE23F;
 Fri, 20 Aug 2021 17:28:02 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id D00E220D764; 
 Fri, 20 Aug 2021 17:28:00 +0000 (UTC)
Message-ID: <37ec9a36a5f7c71a8e23ab45fd3b7f20efd5da24.camel@perches.com>
Subject: What is the oldest perl version being used with the kernel ? update
 oldest supported to 5.14 ?
From: Joe Perches <joe@perches.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Matthew Wilcox
 <willy@infradead.org>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 LukasBulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, 
 netdev@vger.kernel.org, linux-csky@vger.kernel.org
Date: Fri, 20 Aug 2021 10:27:59 -0700
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
X-Stat-Signature: wojh18d5ecfq9mr8d36u5p8pct8mmia8
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: D00E220D764
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18C1in7YDsawPZeoRsFE518C5c7FR0zQJA=
X-HE-Tag: 1629480480-234339
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_102809_337889_BEF789E6 
X-CRM114-Status: UNSURE (   6.47  )
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

Perl 5.8 is nearly 20 years old now.

https://en.wikipedia.org/wiki/Perl_5_version_history

checkpatch uses regexes that are incompatible with perl versions
earlier than 5.10, but these uses are currently runtime checked
and skipped if the perl version is too old.  This runtime checking
skips several useful tests.

There is also some desire for tools like kernel-doc, checkpatch and
get_maintainer to use a common library of regexes and functions:
https://lore.kernel.org/lkml/YR2lexDd9N0sWxIW@casper.infradead.org/

It'd be useful to set the minimum perl version to something more modern.

I believe perl 5.14, now only a decade old, is a reasonable target.

Any objections or suggestions for a newer minimum version?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
