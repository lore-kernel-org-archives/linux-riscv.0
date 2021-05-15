Return-Path: <SRS0=yiB6=KK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED59FC433B4
	for <linux-riscv@archiver.kernel.org>; Sat, 15 May 2021 07:28:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6D3E61370
	for <linux-riscv@archiver.kernel.org>; Sat, 15 May 2021 07:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6D3E61370
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J7VE/7IVABvgGnDvAbeDMo7bn3xwZ8LAFVy4Zgat3tI=; b=AORQsNyM2/iKqUwO4cGJzVnSf
	TgBDz8NVbrqnGuDqZdCQMaspzFUQw44XD+xmTfqUNqrUU9YrojE7W6BcC2HlnDRqMb5vtpQ9EesjV
	ZSgTimjeYoybW8Y0u70iQQFZy2EJayrKcj4B+CfCzsBol3JKAJS5OMWtwa7rMOPu996a269aAYm5C
	KnAYAJltMHT3bGKAHhlD1bMNDm8xf3vw880INXYgqC3KjJXl5e2wRE/QrkIrarO1XTEkFWSF/RYZK
	EffelAF3zgMvn6KvQUjH9qJMa5b+AUExH9m09ygUwT+v+ilKTcmSVt77pia/hFtkE7EdYUeXl/gND
	nmDaO4zmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhoie-009tKa-Iv; Sat, 15 May 2021 07:28:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhoiS-009tJY-5S; Sat, 15 May 2021 07:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=rBHwHCXsebc1237elnShQP75Eoq4Y6TbpHdFfVzzdSg=; b=gPIVUebCj/H9yDwQPskSmD0JlB
 uI3spSp4bSJQ1/iXUmfSr0bnQM71GdFauMA5qcfkZ2HVN3uqwVTJLwgbU6C60f/sX+T+Dbg3I2q4+
 EjeBoZugjneu22Nm3tKk7UXaHsVNSq1kvkULGg7S+A1Az1eJ/3yoxIXlaLDiWMC2+1y08Mv29TcHR
 S7O0s4pHPCigrI/tJH3XS9fAGGYaN/iJ5M1KhWgFY/V9HMf8ta7bBsdrRM6wo2nhqra4tpYRcEvBe
 zIo3R5JFJKI+C6NfhPLXTbfIbwjS5wP7qCA7bjJs/m6PwnwH3FFrOIT6/H8BRES7PHJplbiJ69O2i
 DTNj8MGA==;
Received: from smtprelay0187.hostedemail.com ([216.40.44.187]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhoiP-00CQle-18; Sat, 15 May 2021 07:28:02 +0000
Received: from omf06.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 6060118026A05;
 Sat, 15 May 2021 07:27:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf06.hostedemail.com (Postfix) with ESMTPA id B36F22448B4; 
 Sat, 15 May 2021 07:27:46 +0000 (UTC)
Message-ID: <acff710e1cde66db686273d430a0798c4ea4f41e.camel@perches.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
From: Joe Perches <joe@perches.com>
To: Pavel Machek <pavel@ucw.cz>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>,  linux-kbuild@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,  Jonathan Corbet
 <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Mackerras <paulus@samba.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org
Date: Sat, 15 May 2021 00:27:45 -0700
In-Reply-To: <20210515071410.GA27201@amd>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <20210515071410.GA27201@amd>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: B36F22448B4
X-Stat-Signature: sk6bp1su8mgpmhdudeekd6zmd57nm8uk
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18VobztuKx5cPb+cCAmoDLIOZAXmsA6C+8=
X-HE-Tag: 1621063666-295586
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210515_002801_168689_B9C4B646 
X-CRM114-Status: UNSURE (   9.96  )
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

On Sat, 2021-05-15 at 09:14 +0200, Pavel Machek wrote:
> On Sun 2021-05-02 00:15:38, Masahiro Yamada wrote:
> > The current minimum GCC version is 4.9 except ARCH=arm64 requiring
> > GCC 5.1.
> 
> Please don't. I'm still on 4.9 on machine I can't easily update,

Why is that?  Later compiler versions are available.
http://cdn.kernel.org/pub/tools/crosstool/

Is there some other reason your machine can not have the compiler
version updated?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
