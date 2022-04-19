Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C86C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6llQBV2kYwNqhFPLGvBw7c4zBB5bp5T4FI5Mxdo6kjs=; b=r6SD6/UnM4ZFBK
	vVEIPOoV0c+4s3ota6fTdQ7j9XSdurJnp/ArSphDKiWUnZL53jXZSyEQZ6KORKCJbNO02pPBhCLsM
	rgW0UirS2H5zdUNiCqqoLI/hAnA04kaaoDcHemUKOrTzA5R54reGIKq7jVIeOzUxGwMg50Ylf662k
	IQmYCxEpbIjV4r6ysN2yfGVSgu8GMfG9wb3Xtel5ZIdE0aujtTxqY1pgfPs/evPxFxhLLkUyUrDZM
	p/jM7KA2T+4Vzb9ncie5ve0o1xl8dXCJ9dMhMXZQUQxy8XEnGOBuiGr50ZDIiYJE1Fvn+nuv5dMKn
	q1VP2QmlsQOD792EsvQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngmwt-003Tr3-OL; Tue, 19 Apr 2022 12:27:15 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngm7b-0039xv-18; Tue, 19 Apr 2022 11:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=PBEaZlFaHYvw3+tY3UhjQeVca+KaL0Du1BTdeZIcC7U=; 
 t=1650368050; x=1651577650; b=VVIm3MbmHnnqqslYSRoyalByghZkGUkNvNHMGV0xdhaUkvA
 oso7l21/9A7GqCzmwGW4o2A7BTeGgpXxE4pSB1rHERQ+i6v0SC6XfLuK79YdTgRpPlbMuD4xQmnIt
 J7bdG1bfPtRfGP67SCvYxturQOKiOPfIMd6a3FG5euECEla7xkbYGgxA1WoP8MrZw4Xar2aeFN8Fu
 TNGG/75Bbi8wSG6iqfwOq/G3r8isyM1EyP2+s5oCX6p3RdvwI2JMh6G8cDPr1pEsjsLHvtDDC06kP
 buzNPn3rmWWw5yLwhEoOZxFEYwPY/nrVdKJUL9Psv1VywK743Gw14IJRrAaPv92A==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1ngm6l-00BueY-OI; Tue, 19 Apr 2022 13:33:23 +0200
Message-ID: <694c2318d98973ee8995e891f81216ad267341dc.camel@sipsolutions.net>
Subject: Re: [PATCH v5 08/11] um: use fallback for random_get_entropy()
 instead of zero
From: Johannes Berg <johannes@sipsolutions.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, tglx@linutronix.de, arnd@arndb.de
Cc: Theodore Ts'o <tytso@mit.edu>, Dominik Brodowski
 <linux@dominikbrodowski.net>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, Chris
 Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel@lists.infradead.org,  linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,  linux-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org,  linux-um@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org
Date: Tue, 19 Apr 2022 13:33:21 +0200
In-Reply-To: <20220419111650.1582274-9-Jason@zx2c4.com>
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-9-Jason@zx2c4.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_043415_138405_6756CEB1 
X-CRM114-Status: GOOD (  13.66  )
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

On Tue, 2022-04-19 at 13:16 +0200, Jason A. Donenfeld wrote:
> In the event that random_get_entropy() can't access a cycle counter or
> similar, falling back to returning 0 is really not the best we can do.
> Instead, at least calling random_get_entropy_fallback() would be
> preferable, because that always needs to return _something_, even
> falling back to jiffies eventually. It's not as though
> random_get_entropy_fallback() is super high precision or guaranteed to
> be entropic, but basically anything that's not zero all the time is
> better than returning zero all the time.
> 
> This is accomplished by just including the asm-generic code like on
> other architectures, which means we can get rid of the empty stub
> function here.


LGTM, actually better than before, though not even sure any drivers in
ARCH=um have interrupts that say they can be used for this.

Acked-by: Johannes Berg <johannes@sipsolutions.net>

I assume you're going to take this through the random tree?

johannes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
