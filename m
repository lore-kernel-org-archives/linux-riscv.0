Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650F8C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 22:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1B4XthRKi3huUVsgjw9cZfW7LR96zCXqoB80gE1+tA=; b=YR7TQ5YFUSDtxJ
	NX+MkuDjaDMxks+dLssxRvKXVeFEXLPcYRZK1rtRKvRg2Qgfkdx9g1PBQ5c9w2ogPydOMR92G3RdC
	ILgXuFDzFr0T4WSqR71kDn4tQ+6Ssi53BgdrJrBI9iUbH/CrJEB03ykX6nE8XQp7g3Y7iCm6lryg7
	FnYkkqHR8ryUxEsFI11VNJSd9D+4vzeS7wiLlUk4gomLQvNfW8ExvCU9HAIQPBc4J/7NNaFwK+vuI
	zfALpD+rvTCqsU7A7YyXNyKEtv71OOm4QMK/rEKhwVqGQPaMh2WB7U3hc47Y1Tuu7kcBo+Mh4zJQ6
	o4ydB9gh+leaDA/JVFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIdyo-008raP-9h; Fri, 11 Feb 2022 22:01:26 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIdyl-008rYm-Sl
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 22:01:25 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E34C75800E8;
 Fri, 11 Feb 2022 17:01:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 11 Feb 2022 17:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5zf6jVEQjwVSQ5ZFe
 HnTKZGFpRdZHZ64iwTJ9Ju+0KE=; b=LlFvrTcCq1B+2kEzvZkHLSNkaWQr+m3ZZ
 +0eNXDEcpgjZKJLxRPUU7XKWitNaITB5A24lv7mV5wFNdlg0F/oFQoyenr8w1mH/
 tzlG/0nSoAwyu/3ZvJ3nf/TvNmpBOrTo9uwSCv+QOqVFmJo7zB8bXWV8br2jfFt4
 8YpVXRleEQuGoWwUV9YZ0z4iJYJjLa2bSPfcjSbC51AF5Su871F1cf9viY3KmNcN
 QrZMKWh8gPwaTrVWg2hQWLmVHydYnu0E5QTrExMqSyupjRb0QuPAmAMctEZeFKpX
 S0LNElQDEz4zuHSkj2fotjAV8Fx+pSnHiwVFUtso3CkNry6xR44/w==
X-ME-Sender: <xms:q9wGYn48OGhGsL8cJ8uYo8qg0iS1w3eSwpSXUALEMiGOjCSEBUALBw>
 <xme:q9wGYs4RaTaEjtoL8gRFIavTAIMUj78qxHJBIiJxvFpaXQGWETFawyilaAjcFQIqD
 0knvYX5_lf0YHCwd1o>
X-ME-Received: <xmr:q9wGYucABJbEybN1WMgSQFiQJTytRIVIe4hXHpQIYfw7EMTzhwYw6wyAxL6wQixK6o1Do7vysV2iU8rnLzbGl8-WORiwgEX13ME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrieefgdduheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
 uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:q9wGYoJYW-TUBr2EYt8mEOqMinOi3-peDoIC-mAjQGqPgu3cg_MifA>
 <xmx:q9wGYrI_hdzBCJKO34Xz4nTZ6qKmVPEgK_XTo1FkhKRNcrIzELAmKg>
 <xmx:q9wGYhyn9DBmzMoSqb-Wu9VkYGRZW6ipQTjxpRDmB-WJ_kZknYQ0yw>
 <xmx:rdwGYr9J_xCb6W1UqUIVb-n7z5Gv3lAyoRa5bB7MSFahBmLExEQg_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Feb 2022 17:01:12 -0500 (EST)
Date: Sat, 12 Feb 2022 09:01:19 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
 linux-m68k@lists.linux-m68k.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-mips@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, 
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Andy Lutomirski <luto@kernel.org>, Kees Cook <keescook@chromium.org>, 
 Lennart Poettering <mzxreary@0pointer.de>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
In-Reply-To: <20220211210757.612595-1-Jason@zx2c4.com>
Message-ID: <a7c12f2-c12-f0ea-ad44-10fb607d86@linux-m68k.org>
References: <20220211210757.612595-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_140124_071119_54ACDE82 
X-CRM114-Status: UNSURE (   8.17  )
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

On Fri, 11 Feb 2022, Jason A. Donenfeld wrote:

> + * Reading from /dev/random and /dev/urandom both the same effect as
> + * calling getrandom(2) with flags=0. In earlier versions, however,
> + * they each had vastly different semantics and should therefore be
> + * avoided to prevent backwards compatibility issues.

If the end result "should be avoided", then why bother? IOW, how does this 
improve the ABI? I know you said it's a "panacea" but I'm afraid that's 
not clear to me and the patch description doesn't explain it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
