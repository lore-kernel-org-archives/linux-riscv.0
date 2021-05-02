Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C06C433B4
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 20:01:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F82761221
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 20:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F82761221
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GkZHNxgoMh1EXttLNlsvI3yEhMx1zbPGv2Q8i4cRNbE=; b=Jyw8YvJCeK1zECRAAC2/Ryhq+
	7OF9WKpkHO6vEF3C5zdxiN24jrjHowE0ZVH31eUgwqMyppUaog2w3NxmWXecB8DwWm1u8KDgw+riz
	01QtjfYpxz6C1AASVkTPvo8w9UMzFuCGr/LEP5ZgkPGJu3W9HvGNKomeG5K7zIr51XB09da0kDfaI
	jWRXQpd/g7LiBzm88RWV4Z37T0IlUtNBSoCrbh1nFFxf5P+JL57/RqAwBwe1+qYh1ONgmloIRgFlu
	TyABLt696mJ7uGLKJhVSh8GlJucSPozblKKi/vsYXMiVvwSXemIei3OD5NEPX8NI11FbNboHlQn6t
	LZBQwHX7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldIGu-00CNyZ-OR; Sun, 02 May 2021 20:00:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldIGf-00CNxo-9p; Sun, 02 May 2021 20:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=vzXdcnz08xbPSSGrwXbyMyFvSqlbAYCGZwHIKcaMEAg=; b=qMH2wb8XQaSfyYQXVk0XDP6Ft+
 Ttxw0HBVvSvnOvcr/Wc/lzCYjP/lKuUpeLNABgsFjoeU0Oldy+UTBg28VQ2po8tPg4lxBnYFHqfYs
 pGtD54uJY2e99rcG7ABqmysBWGF2xCfAqIvp/fGAqXcdw0RrTnkJqOi4BkUktbetw7wwiNIAL/TaR
 jV5e5MX1oXFISlnDgTG+Qh9G/GU9AECAIUSTEP1CEARKrabrgXHj0a4nuRWY+E8pL20AKZ2nFEAfP
 kQMWIt9IiAAXWj/CxZ9wi1iLveKDJTJzz7u7ftafNgRbnV+YPexx+04eQsUwGYoZ/C6MtA+Z95oY7
 cjXkAemA==;
Received: from smtprelay0191.hostedemail.com ([216.40.44.191]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldIGc-002fUa-Gn; Sun, 02 May 2021 20:00:39 +0000
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id E5F31837F27B;
 Sun,  2 May 2021 20:00:34 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf06.hostedemail.com (Postfix) with ESMTPA id 7C6732448B6; 
 Sun,  2 May 2021 20:00:30 +0000 (UTC)
Message-ID: <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
From: Joe Perches <joe@perches.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann
 <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,  Linus Torvalds
 <torvalds@linux-foundation.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Catalin Marinas
 <catalin.marinas@arm.com>,  Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras
 <paulus@samba.org>, linux-riscv@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, Will Deacon <will@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Date: Sun, 02 May 2021 13:00:28 -0700
In-Reply-To: <20210502183030.GF10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 7C6732448B6
X-Stat-Signature: 71ockug33zmqd9a3epysnu3hfs3ubiyr
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19QpxupLlF/RmMAnwgGtoo8JZ2oBi/jlKM=
X-HE-Tag: 1619985630-933791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_130038_645893_2EA84443 
X-CRM114-Status: UNSURE (   9.82  )
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

On Sun, 2021-05-02 at 13:30 -0500, Segher Boessenkool wrote:
> On Sat, May 01, 2021 at 07:41:53PM -0700, Joe Perches wrote:
> > Why not raise the minimum gcc compiler version even higher?

On Sun, 2021-05-02 at 13:37 -0500, Segher Boessenkool wrote:
> Everyone should always use an as new release as practical

[]

> The latest GCC 5 release is only three and a half years old.

You argue slightly against yourself here.

Yes, it's mostly a question of practicality vs latest.

clang requires a _very_ recent version.
gcc _could_ require a later version.
Perhaps 8 might be best as that has a __diag warning control mechanism.

gcc 8.1 is now 3 years old today.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
