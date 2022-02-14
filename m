Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861C3C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 14:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/GiiIKoMo85IrFVr53RQ1v69SX4IOJ5HylcztftCDg=; b=qytToKyO0WRsDX
	7t9RgaljQ0YW0KyfK1/9F1lWi4aIQBJD6eki0it41+1iLwLEgx3tNr18tg8PztK/Pa4+ZAloJ/3BU
	kFRxGf15szMhDXORhPDglK3lPJL/Vjie9Ow2q3cQYbhzlU+xWN0u4bLxrQeCUM15E0c91ak/d/1oC
	++ZK9Gp7+KvEIYTeykhh9UNkut2boXt1lSCUzvcfIPxOC0C+iynSAk9BszIYzQzhcpf8c+6k0wyJt
	3U6EppLC/jwClpopNt/DX+AOjCkAmdL+STno8UWdinfIdfuFb9KlleGTYHuofuIpxYXg4IjbYpO+V
	fKnq20U7PgkpUsKZYkww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJc8p-00Fd74-VW; Mon, 14 Feb 2022 14:15:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJc8m-00Fd5s-Jd
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 14:15:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 874AAB80E94;
 Mon, 14 Feb 2022 14:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96287C340E9;
 Mon, 14 Feb 2022 14:15:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="JYW49XlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1644848138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gNy906fCfgtg3rrlPPwGuVAeoK9jD6AuJHW2V5mt6m4=;
 b=JYW49XlRspfC2c1nAI7Rfr4oIINd+RuhXGm5Ttly1yB27rz1bFbcu6Ct+BN4DV13mAqwVF
 LL00LWvDILFvpHMGSA4EYXjEwmcKHXE3Wnw83XR5+D9JYLG27u54YwGQrtwl2xy+/xab4B
 TxuVSVkwFNxpCkhoN78MHWULosvWt9g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d91a5074
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 14 Feb 2022 14:15:37 +0000 (UTC)
Date: Mon, 14 Feb 2022 15:13:18 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Lennart Poettering <mzxreary@0pointer.de>
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
Message-ID: <YgpjfncV+C9FEZDc@zx2c4.com>
References: <20220211210757.612595-1-Jason@zx2c4.com>
 <YgoYnX97imub7KEB@gardel-login>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgoYnX97imub7KEB@gardel-login>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_061545_011362_4FE792B5 
X-CRM114-Status: GOOD (  28.59  )
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

Hi Lennart,

On Mon, Feb 14, 2022 at 9:53 AM Lennart Poettering <mzxreary@0pointer.de> wrote:
> So, systemd uses (potentially half-initialized) /dev/urandom for
> seeding its hash tables. For that its kinda OK if the random values
> have low entropy initially, as we'll automatically reseed when too
> many hash collisions happen, and then use a newer (and thus hopefully
> better) seed, again acquired through /dev/urandom. i.e. if the seeds
> are initially not good enough to thwart hash collision attacks, once
> the hash table are actually attacked we'll replace the seeds with
> someting better. For that all we need is that the random pool
> eventually gets better, that's all.
>
> So for that usecase /dev/urandom behaving the way it so far does is
> kinda nice.

Oh that's an interesting point. But that sounds to me like the problem
with this patch is not that it makes /dev/urandom block (its primary
purpose) but that it also removes GRND_INSECURE (a distraction). So
perhaps an improved patch would be something like the below, which
changes /dev/urandom for new kernels but doesn't remove GRND_INSECURE.
Then your hash tables could continue to use GRND_INSECURE and all would
be well.  (And for kernels without getrandom(), they'd just fall back to
/dev/urandom like normal which would have old semantics, so works.)

Jason



---------8<-----------------8<-------------------------------

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index cc296f0823bd..9f586025dbe6 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -707,7 +707,7 @@ static const struct memdev {
 	 [5] = { "zero", 0666, &zero_fops, FMODE_NOWAIT },
 	 [7] = { "full", 0666, &full_fops, 0 },
 	 [8] = { "random", 0666, &random_fops, 0 },
-	 [9] = { "urandom", 0666, &urandom_fops, 0 },
+	 [9] = { "urandom", 0666, &random_fops, 0 },
 #ifdef CONFIG_PRINTK
 	[11] = { "kmsg", 0644, &kmsg_fops, 0 },
 #endif
diff --git a/drivers/char/random.c b/drivers/char/random.c
index ce199af9bc56..ae4400c48b2f 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -89,8 +89,6 @@ static LIST_HEAD(random_ready_list);
 /* Control how we warn userspace. */
 static struct ratelimit_state unseeded_warning =
 	RATELIMIT_STATE_INIT("warn_unseeded_randomness", HZ, 3);
-static struct ratelimit_state urandom_warning =
-	RATELIMIT_STATE_INIT("warn_urandom_randomness", HZ, 3);
 static int ratelimit_disable __read_mostly;
 module_param_named(ratelimit_disable, ratelimit_disable, int, 0644);
 MODULE_PARM_DESC(ratelimit_disable, "Disable random ratelimit suppression");
@@ -336,11 +334,6 @@ static void crng_reseed(void)
 				  unseeded_warning.missed);
 			unseeded_warning.missed = 0;
 		}
-		if (urandom_warning.missed) {
-			pr_notice("%d urandom warning(s) missed due to ratelimiting\n",
-				  urandom_warning.missed);
-			urandom_warning.missed = 0;
-		}
 	}
 }

@@ -993,10 +986,8 @@ int __init rand_initialize(void)
 		pr_notice("crng init done (trusting CPU's manufacturer)\n");
 	}

-	if (ratelimit_disable) {
-		urandom_warning.interval = 0;
+	if (ratelimit_disable)
 		unseeded_warning.interval = 0;
-	}
 	return 0;
 }

@@ -1387,20 +1378,17 @@ static void try_to_generate_entropy(void)
  * getrandom(2) is the primary modern interface into the RNG and should
  * be used in preference to anything else.
  *
- * Reading from /dev/random has the same functionality as calling
- * getrandom(2) with flags=0. In earlier versions, however, it had
- * vastly different semantics and should therefore be avoided, to
- * prevent backwards compatibility issues.
- *
- * Reading from /dev/urandom has the same functionality as calling
- * getrandom(2) with flags=GRND_INSECURE. Because it does not block
- * waiting for the RNG to be ready, it should not be used.
+ * Reading from /dev/random and /dev/urandom both the same effect as
+ * calling getrandom(2) with flags=0. In earlier versions, however,
+ * they each had vastly different semantics and should therefore be
+ * avoided to prevent backwards compatibility issues.
  *
  * Writing to either /dev/random or /dev/urandom adds entropy to
  * the input pool but does not credit it.
  *
- * Polling on /dev/random indicates when the RNG is initialized, on
- * the read side, and when it wants new entropy, on the write side.
+ * Polling on /dev/random or /dev/urandom indicates when the RNG
+ * is initialized, on the read side, and when it wants new entropy,
+ * on the write side.
  *
  * Both /dev/random and /dev/urandom have the same set of ioctls for
  * adding entropy, getting the entropy count, zeroing the count, and
@@ -1485,21 +1473,6 @@ static ssize_t random_write(struct file *file, const char __user *buffer,
 	return (ssize_t)count;
 }

-static ssize_t urandom_read(struct file *file, char __user *buf, size_t nbytes,
-			    loff_t *ppos)
-{
-	static int maxwarn = 10;
-
-	if (!crng_ready() && maxwarn > 0) {
-		maxwarn--;
-		if (__ratelimit(&urandom_warning))
-			pr_notice("%s: uninitialized urandom read (%zd bytes read)\n",
-				  current->comm, nbytes);
-	}
-
-	return get_random_bytes_user(buf, nbytes);
-}
-
 static ssize_t random_read(struct file *file, char __user *buf, size_t nbytes,
 			   loff_t *ppos)
 {
@@ -1586,15 +1559,6 @@ const struct file_operations random_fops = {
 	.llseek = noop_llseek,
 };

-const struct file_operations urandom_fops = {
-	.read = urandom_read,
-	.write = random_write,
-	.unlocked_ioctl = random_ioctl,
-	.compat_ioctl = compat_ptr_ioctl,
-	.fasync = random_fasync,
-	.llseek = noop_llseek,
-};
-

 /********************************************************************
  *


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
