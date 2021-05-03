Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF92C433B4
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 09:00:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9868F6121D
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 09:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9868F6121D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eUR1Fc2PM1DzVSyCYdHQoB2ab4HhcqrmkoUGWh+y0/M=; b=W/zSpV6w5xQk1Mp0/gd8RbB1S
	334/y+kMFWqaFAvyDyzjYQjeV4ltGdBmvhgS+Y50FO+6JN0HEdgD7kcaP3QmbhTcigMEf6azmP2pf
	NKc0bmtQfV4JSu4P4FxoHqctK3cXUL2TLHOT6j8KvE8zOEsg7j4HpxwasCdhieeIg6fAh1N/ZnzQi
	GksVUqxoZO5Ajox0JkhEZPttm/TDvGO/qN7lQOgKaD5YaVfvq5GcB0OlMaiDrlaq1sgVzFCXxFHkN
	nK2E6wnu1YDQQWKm/0YBdlvFwHit+2ABpfmEvwvd4RqaK85t5aGPsAeTg3j1u9oGgGH6a0+41dhLr
	mZddyQQAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldUQg-00DUTA-5v; Mon, 03 May 2021 08:59:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldUMB-00DUEo-FI; Mon, 03 May 2021 08:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=hgfZq464Izj2kc7VCkzShyHa+mKZGImELp6VtD8oIVc=; b=OikEhn6zKEkJXQMmnaanNCE3Tx
 +IDSk2phwTKDz5HotgeLZ2hSEbKi9d+vdPuvkX94SG5tO8K+BgoI1VMFWWCmV07Erz+LwEWVpSqE/
 sAzfSZVBVNiYUfZTRK2wHDcHlnomAzkxeg0lD5GfKMVB3s5QPns3+4QV292y9j/dNlmhMmbhWqBKu
 5CVUmSuqh69tmZJHbVp9aprsivVP0vM9ZC6uQm47MvdFIY0HgvOO+csw1eq4U0tX2sj/u7dOcbU0E
 8UcOslysxp1V3oJEughWQsgTZzFkAjnqn6JB/vAcxQlnBBpuTOAd2GqWC/YrT/ZGYU5VML0Ira77i
 QJ0AoOtg==;
Received: from smtprelay0058.hostedemail.com ([216.40.44.58]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldUM8-002vgJ-7J; Mon, 03 May 2021 08:55:09 +0000
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 659F0180C2CD0;
 Mon,  3 May 2021 08:55:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf03.hostedemail.com (Postfix) with ESMTPA id 7813213D93; 
 Mon,  3 May 2021 08:54:58 +0000 (UTC)
Message-ID: <de86b54eb783204ef174a05c60b0d190de7cd85c.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
From: Joe Perches <joe@perches.com>
To: Alexander Dahl <ada@thorsis.com>, Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Segher Boessenkool
 <segher@kernel.crashing.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>,  Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Linux
 Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, Linux Doc
 Mailing List <linux-doc@vger.kernel.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Catalin Marinas
 <catalin.marinas@arm.com>,  Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras
 <paulus@samba.org>, linux-riscv@lists.infradead.org,  linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 03 May 2021 01:54:57 -0700
In-Reply-To: <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 7813213D93
X-Stat-Signature: kzayu4orffhmqaa8ff8iq8d4a8ipzp46
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1952/ks3MY8TXp5Ug6xsGLjA9GLFC3+spA=
X-HE-Tag: 1620032098-353050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_015508_356775_A4A9EBA6 
X-CRM114-Status: UNSURE (   8.60  )
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

On Mon, 2021-05-03 at 09:34 +0200, Alexander Dahl wrote:
> Desktops and servers are all nice, however I just want to make you
> aware, there are embedded users forced to stick to older cross
> toolchains for different reasons as well, e.g. in industrial
> environment. :-)

In your embedded case, what kernel version do you use?

For older toolchains, unless it's kernel version 5.13+,
it wouldn't matter.

And all the supported architectures have gcc 10.3 available at
http://cdn.kernel.org/pub/tools/crosstool/



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
