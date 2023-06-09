Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03309C7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 13:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhZcCLRQRw5Rgk5bYInFzBtWiH9WXO9PaGgt0JNBfsc=; b=p5WVknF9iH1gdN
	TGZulqL3A4owUak5WpY1a+JrUwxFb16sJ4/EHCa2lPsXRJreswiakf5tIHYW0jFcvUZtbg1pz3Pkt
	uDdSUlTJvJlvx1mIg07QEKP9O16H9KgttRkHWlqfviKX2W4M+xVYlOavryWROgAsyd0jWN85OZsUg
	epSpHqr+fAqLnC4G0HJpWJYJljWi95yxrE13v5GTFU6XjBWNNPZgsQ+LwHzS9TH8NmqR7p3ix9krU
	89n6+JU64qPKcNd94DfRcxIMFsGbqPLwKegaFdngpLl14KyIZU9ewP6B8mVAUyBVIMjjzC2bN4h5r
	c3Ubpx1Z1ga+W0NNGNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7bnu-00D4u1-2O;
	Fri, 09 Jun 2023 13:05:22 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7bnr-00D4rT-03;
	Fri, 09 Jun 2023 13:05:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1686315913;
	bh=hT63nSeqfXe+w/wcTH/EVqDDlEdDBDYjRZhYbxbpM9E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=npo+qrCHsIrTavth6RFp9whOgzBlVXmzRzYXUH+dxBlx16fsDq62B5M0BsrtN4VtJ
	 1fdfpCWNVPfQBRPxlsk/T5jnywsDDxzlQF9T3tubgjW3v4DrYce6kTsX/rRJiWMx5i
	 hBEItCRBrPuBf/r8DMY+d6WFyBryIiRnxabHdAlU=
Received: from [192.168.124.11] (unknown [113.140.11.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 48AE16638D;
	Fri,  9 Jun 2023 09:05:09 -0400 (EDT)
Message-ID: <5de9d69817138f2ccae0867b5ccb602dcfa007a3.camel@xry111.site>
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
From: Xi Ruoyao <xry111@xry111.site>
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, 
 llvm@lists.linux.dev, linux-ia64@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
 x86@kernel.org,  linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongson-kernel@lists.loongnix.cn
Date: Fri, 09 Jun 2023 21:05:07 +0800
In-Reply-To: <ca4c4968-411d-4e2c-543e-ffb62413ddef@loongson.cn>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
	 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
	 <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
	 <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
	 <ca4c4968-411d-4e2c-543e-ffb62413ddef@loongson.cn>
User-Agent: Evolution 3.48.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_060519_072573_45B9B85B 
X-CRM114-Status: GOOD (  11.20  )
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

On Fri, 2023-06-09 at 14:50 +0800, Tiezhu Yang wrote:

/* snip */

> > > > In musl, the documentation states that at least gcc-3.4 or
> > > > clang-3.2 are required, which probably predate the
> > > > __SIZEOF_LONG__ macro.

Indeed, I've digged some history and __SIZEOF_LONG__ was added into GCC-
4.3 (in 2008).  And I didn't realize the bitsperlong.h in tools
directory is a copy from uapi.

> > > > On the other hand, musl was only
> > > > released in 2011, and building musl itself explicitly
> > > > does not require kernel uapi headers, so this may not
> > > > be too critical.

> Only arm64, riscv and loongarch belong to the newer architectures
> which are related with this change, I am not sure it is necessary
> to "unify" uapi bitsperlong.h for them.

At least it will stop the engineers working on "the next architecture"
from adding an unneeded bitsperlong.h :).


-- 
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
