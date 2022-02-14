Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09878C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1t0dLFn7k7Viy9glX+CDubX6P2OLBhf6a23PU4SzGYQ=; b=C0aiwiUkr45NeR
	7XLJmZOrClc7QKtBh+gV7Vw3MEY+wynknkoFiQ08wQqaKHsORulc3/z78bNmvkhQM2eeplFXWXmit
	Rd0pDeLCaU6gZFdtM6KnO0hxs85QcKioZQ0eZFEIIO2qXclZop//nsGNI3DX/xPOdHrlRNNBAXDf2
	hVhJRVkaTR3Qe0rL4bO0IOHQXwB/R7pzJ7wuENSUTss3Z2v17AAdtvF2T9Oj/HpkJ405tMbqP6FHP
	ERCYnsvPnirorFP8Nl+q+EEJHSV8UDkjxC7SeTdcrx7N2F/o+qNrh+bdjWs7uhWj56b6IGssVfU8G
	MFfe3s/eereadXJihoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJcjA-00FjAI-IX; Mon, 14 Feb 2022 14:53:20 +0000
Received: from gardel.0pointer.net ([2a01:238:43ed:c300:10c3:bcf3:3266:da74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1nJcj7-00Fj9u-9W
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 14:53:19 +0000
Received: from gardel-login.0pointer.net (gardel-mail [85.214.157.71])
 by gardel.0pointer.net (Postfix) with ESMTP id 2D1E0E8045A;
 Mon, 14 Feb 2022 15:53:14 +0100 (CET)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
 id BF6CC16010E; Mon, 14 Feb 2022 15:53:13 +0100 (CET)
Date: Mon, 14 Feb 2022 15:53:13 +0100
From: Lennart Poettering <mzxreary@0pointer.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 Eric Biggers <ebiggers@google.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
Message-ID: <Ygps2W6MfxKkP5eD@gardel-login>
References: <20220211210757.612595-1-Jason@zx2c4.com>
 <YgoYnX97imub7KEB@gardel-login> <YgpjfncV+C9FEZDc@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgpjfncV+C9FEZDc@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_065317_605479_31A1955D 
X-CRM114-Status: GOOD (  18.86  )
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

On Mo, 14.02.22 15:13, Jason A. Donenfeld (Jason@zx2c4.com) wrote:

> Hi Lennart,
>
> On Mon, Feb 14, 2022 at 9:53 AM Lennart Poettering <mzxreary@0pointer.de> wrote:
> > So, systemd uses (potentially half-initialized) /dev/urandom for
> > seeding its hash tables. For that its kinda OK if the random values
> > have low entropy initially, as we'll automatically reseed when too
> > many hash collisions happen, and then use a newer (and thus hopefully
> > better) seed, again acquired through /dev/urandom. i.e. if the seeds
> > are initially not good enough to thwart hash collision attacks, once
> > the hash table are actually attacked we'll replace the seeds with
> > someting better. For that all we need is that the random pool
> > eventually gets better, that's all.
> >
> > So for that usecase /dev/urandom behaving the way it so far does is
> > kinda nice.
>
> Oh that's an interesting point. But that sounds to me like the problem
> with this patch is not that it makes /dev/urandom block (its primary
> purpose) but that it also removes GRND_INSECURE (a distraction). So
> perhaps an improved patch would be something like the below, which
> changes /dev/urandom for new kernels but doesn't remove GRND_INSECURE.
> Then your hash tables could continue to use GRND_INSECURE and all would
> be well.  (And for kernels without getrandom(), they'd just fall back to
> /dev/urandom like normal which would have old semantics, so works.)

In fact, systemd already uses getrandom(GRND_INSECURE) for this, if it
is supported, and falls back to /dev/urandom only if it is not. So as
long as GRND_INSECURE remains available we are good.

Lennart

--
Lennart Poettering, Berlin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
