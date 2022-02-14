Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2204C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFnMDjPrL4x4RnltfqZqgI97O/7Uh5Q0K1fOrLVt6MI=; b=EcTyLxjRL6KIPk
	lve51iLu19L5gDj3zWkWdFTAURTX3LApkH944fO5yxwfxarY8s3CFTAqOksfyP3K5Y73mAwGZr9Tp
	PgD7TObjvR75Lp9foPO4BPeeTgnbG1m4sCxvYLo/bCFxCVk7qZq4MnuqqEShTe7Z/fUkY57YqO0sn
	BIsOwVc/e3s9E183450yawRidpUV+KgdPsXijSIcHIuYZHNviw/dupHs4TT2bRQohKm75Wj9sltEp
	PLPKGOzl6Jb8THfbl91v3f9AEyBtF/zn9/TrRG5aSLsBpm1slg4FoIQawVLVMuIpBhR/Y6accGk0G
	rycNL3JnRXd/n+78L2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJXE6-00E8SS-3v; Mon, 14 Feb 2022 09:00:54 +0000
Received: from gardel.0pointer.net ([2a01:238:43ed:c300:10c3:bcf3:3266:da74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1nJXE3-00E8Pk-Ad
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 09:00:53 +0000
Received: from gardel-login.0pointer.net (gardel-mail [85.214.157.71])
 by gardel.0pointer.net (Postfix) with ESMTP id 20549E80485;
 Mon, 14 Feb 2022 09:53:50 +0100 (CET)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
 id 72E3916010E; Mon, 14 Feb 2022 09:53:49 +0100 (CET)
Date: Mon, 14 Feb 2022 09:53:49 +0100
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
Message-ID: <YgoYnX97imub7KEB@gardel-login>
References: <20220211210757.612595-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211210757.612595-1-Jason@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_010051_625331_F6716BA3 
X-CRM114-Status: GOOD (  13.96  )
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

On Fr, 11.02.22 22:07, Jason A. Donenfeld (Jason@zx2c4.com) wrote:

> So, given that the kernel has grown this mechanism for seeding itself
> from nothing, and that this procedure happens pretty fast, maybe there's
> no point any longer in having /dev/urandom give insecure bytes. In the
> past we didn't want the boot process to deadlock, which was
> understandable. But now, in the worst case, a second goes by, and the
> problem is resolved. It seems like maybe we're finally at a point when
> we can get rid of the infamous "urandom read hole".

So, systemd uses (potentially half-initialized) /dev/urandom for
seeding its hash tables. For that its kinda OK if the random values
have low entropy initially, as we'll automatically reseed when too
many hash collisions happen, and then use a newer (and thus hopefully
better) seed, again acquired through /dev/urandom. i.e. if the seeds
are initially not good enough to thwart hash collision attacks, once
the hash table are actually attacked we'll replace the seeds with
someting better. For that all we need is that the random pool
eventually gets better, that's all.

So for that usecase /dev/urandom behaving the way it so far does is
kinda nice. We need lots of hash tables, from earliest initialization
on, hence the ability to get some seed there reasonably fast is really
good, even if its entropy is initially not as high as we'd want. It's
a good middle ground for us to be able to boot up quickly and not
having to block until the entropy pool is fully initialized, but still
thwart hash table collision attacks.

If you make /dev/urandom block for initialization then this would mean
systemd and its components would start waiting for initialization
(simply because we need hash tables all over the place), i.e you'd
effectively add a second to the boot process of each affected system.

What about AT_RANDOM and /proc/sys/kernel/random/uuid btw, do you
intend to block for that too? If you block for the former it doesn't
really matter what systemd does I guess, given that you already have
to delay invoking PID 1 until you get a good AT_RANDOM.

Lennart

--
Lennart Poettering, Berlin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
