Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A66C433B4
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 21:23:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 786D76102A
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 21:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 786D76102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D+mQE8vUZIoSS/wT8o51cPwnlxcGLHwQC8pWMEFs0Tc=; b=fnT7M7FHm91o/5Xx9PzUKu7cJ
	AJp8W4SO1mGQYmYwBK8qc2pqbh/+27XkdZ5wCuHXEzcKB3e7fw/njglGXWF3Gk5h+9mID1AiqhfWO
	J6E+kMn3ysHtMGoCyzxN/hulecSGWVQjOLgrk/dEuNyi0Bi7QeKp60222gAHOeDMkFRNKxJ2533Ly
	ObhnbUUm/Wh/87OUNttf3hyvglIyq0FMbcP2iIPFJtRDMIjbpzzrMfOH7B8Ce6Sa3tJrDsqQcxezP
	miwFOsyEMiB8sr6kN4yg99ZQUxYZKmm4RaenVuyABmJ09txfNavO1wQxeEX+SQNQCoK+PEZ9FWNr1
	YDDSPN6ag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldJYl-00CWAO-M6; Sun, 02 May 2021 21:23:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldJYY-00CW8R-OE; Sun, 02 May 2021 21:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=br8QAlBZqkJdlenMR9TYo59N4e7gL4PmtncXq929G9A=; b=YBS1EWgAk4ENk1qsVysnopVrsX
 hw+0euTKR4ryZ5ceSPHveri+ob93AOLQXB+Jfvv365FGDusoNSxYTAoP8V59yXZPCm5koti+bO4DN
 VeEOjSsSHKtTXwzSXcbYx7LUquM6aUkeIXUghqqVXqdrml8s4prGlKqf0cPjVwewjJSxWR5nDA1NV
 rktSK5Yklc34rB+VhtXrKcf1csy8NdzxIoRlub/C5ST4Vza5xGbxrSJ+bvJSdyxNkqek9d3jNjqRt
 wwpXovgAB0RCJ+PaaXYex+aAEVJxT6BnmPM2529Con8jFQmAkSVoYe47wHEP5ybGSWuQkiaCTYZrc
 utqkF+RQ==;
Received: from smtprelay0029.hostedemail.com ([216.40.44.29]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldJYV-002h3K-Aj; Sun, 02 May 2021 21:23:13 +0000
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id BE0F518027FCE;
 Sun,  2 May 2021 21:23:06 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id 4FDC120D75C; 
 Sun,  2 May 2021 21:23:02 +0000 (UTC)
Message-ID: <fcffe807353391339a03106f175ffa71377752b1.camel@perches.com>
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
Date: Sun, 02 May 2021 14:23:01 -0700
In-Reply-To: <20210502203253.GH10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4FDC120D75C
X-Stat-Signature: 8s7n7kr6yugf5k5opoqworaztxej967t
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+fP+x9C6cIbIbx7qR6GaqDgZa7dwY1Pfw=
X-HE-Tag: 1619990582-993883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_142311_461193_A61B8BD3 
X-CRM114-Status: GOOD (  10.22  )
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

On Sun, 2021-05-02 at 15:32 -0500, Segher Boessenkool wrote:
> On Sun, May 02, 2021 at 01:00:28PM -0700, Joe Perches wrote:
[]
> > Perhaps 8 might be best as that has a __diag warning control mechanism.
> 
> I have no idea what you mean?

? read the last bit of compiler-gcc.h




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
