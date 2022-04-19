Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF11C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qv4BQlcysCi+mQ13GniZW4zrFDgLF6naC7dlooo+OW4=; b=kjnB+JNCPbPjb4
	lZfiE6HkGvNsI4/E8pF8O4GkseEXimOX99nbVsah2GaFbnmKh67tYRdsoGkM4pgZ71UgDCTSbf989
	ExpktBJW1QyUeXJnky2Q4w0YogQ84pnbGFhiUxb/6XFjB/ATGuImngvTPBPxhdw4AWJ3brecyEobO
	r4TWaWTLIe3qMysVOadpFHqhBfx3WNk5ZVUIdT7S1JV03y8jfXrML3Y15675eIHDmgZecl1NfVHYI
	FURCW2JcX5mGwne0LS9XMWZU2w0eKFsbOh4C5I7vYtlYA6+ZnjArFiy7CwJVj9YIF1bhC/lACTiKv
	Y5YtttKVK5vFJX5mXntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnKC-003ccW-Pm; Tue, 19 Apr 2022 12:51:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmAe-003BJG-Q0; Tue, 19 Apr 2022 11:37:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 053426140C;
 Tue, 19 Apr 2022 11:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0096CC385A5;
 Tue, 19 Apr 2022 11:37:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="qHSdBNkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650368237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ERMMrurTq4taC2ovJg+tOy4Fbtf3EbfcM62G0GQKnfo=;
 b=qHSdBNkzuhjW9XbSKRmJMDQTyTvNjn6SuAHfO+ryi5v1ui/BdqZF8oxRiSm7KhJrlVElBt
 NF9Mzm3Q3fp2gEoI4VoWkt4zduakEI2LdVRg0JsZXBGMdcVvpqAL3nwfDJh0OxpGvJIEGx
 UICzcnIUVK5UqMSa3uhJ4gILC4Ke9fA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 64e6d223
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 19 Apr 2022 11:37:17 +0000 (UTC)
Date: Tue, 19 Apr 2022 13:37:12 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 tglx@linutronix.de, arnd@arndb.de, Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S . Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v5 08/11] um: use fallback for random_get_entropy()
 instead of zero
Message-ID: <Yl6e6CRezyGsQh26@zx2c4.com>
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-9-Jason@zx2c4.com>
 <694c2318d98973ee8995e891f81216ad267341dc.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <694c2318d98973ee8995e891f81216ad267341dc.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_043724_988418_60C8B247 
X-CRM114-Status: GOOD (  22.81  )
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

Hi Johannes,

On Tue, Apr 19, 2022 at 01:33:21PM +0200, Johannes Berg wrote:
> On Tue, 2022-04-19 at 13:16 +0200, Jason A. Donenfeld wrote:
> > In the event that random_get_entropy() can't access a cycle counter or
> > similar, falling back to returning 0 is really not the best we can do.
> > Instead, at least calling random_get_entropy_fallback() would be
> > preferable, because that always needs to return _something_, even
> > falling back to jiffies eventually. It's not as though
> > random_get_entropy_fallback() is super high precision or guaranteed to
> > be entropic, but basically anything that's not zero all the time is
> > better than returning zero all the time.
> > 
> > This is accomplished by just including the asm-generic code like on
> > other architectures, which means we can get rid of the empty stub
> > function here.
> 
> 
> LGTM, actually better than before, though not even sure any drivers in
> ARCH=um have interrupts that say they can be used for this.
> 
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> 
> I assume you're going to take this through the random tree?

Right, that's the plan (as mentioned in the cover letter). Changes to
random.c will depend on these patches being there.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
