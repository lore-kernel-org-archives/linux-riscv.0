Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA2AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iBDoTxDI4kvw804o3+ZTa5MjbyJaozAuD7tRjW34alc=; b=YfNccDy+e2HSyp
	34UrA55FEE9YqPztBMdL52ro/c0zA1+k3bGO7bt3Biu/n3bOW6ZFwcP+G1/cl7qWbxTBPSIUEV5pR
	3Xr6CIvcIQ2pdV7BH8n+RdugjDmhff880O08sX7RtcYsikMRKG/wQavTS9lekzCqjlYrY3/MCUXbt
	uHJNAn4WnzoNbJYr2m93LtLwCpaAcJx3QkZ1XMsEtTCybBk2+sPqE+XTXxd+NCmVv/57l9MGeh0/i
	LjIDR2vJBZtcRLyOXldt7O3MWGtOIe40/al/42EWpDKjAehM4hDRSVjJEz4LIH2REO3aeW9WxtciV
	8D6zJ3sltdnlZw+yBcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niCZX-003zYL-HD; Sat, 23 Apr 2022 10:00:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niCZM-003zVr-PQ; Sat, 23 Apr 2022 10:00:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83D72B808CF;
 Sat, 23 Apr 2022 10:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09578C385A0;
 Sat, 23 Apr 2022 10:00:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="BrTNBu3U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1650708039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yzboIlk5vJyGJ9lIUicUoHDvMySNFYIAfwJpuAS8VE0=;
 b=BrTNBu3UPGd/snRKQaW6FCT2ETTW5AjxdyJ6d5OFslB53rAsjYQWfTknmHGingrsxLV4ix
 yB3Z33fq8ZEu9lWFNSAsBIXFWS69ptmi6XvOsvr/W2o6ZDyCsI3ruk6NWXUUVsrydwnSwy
 QbHGR2xD+RPJeLJSPg/mehva8mt8n/8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7d5a8aa6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sat, 23 Apr 2022 10:00:38 +0000 (UTC)
Date: Sat, 23 Apr 2022 12:00:33 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Sandy Harris <sandyinchina@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Theodore Ts'o <tytso@mit.edu>,
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
 Johannes Berg <johannes@sipsolutions.net>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v5 11/11] random: insist on random_get_entropy() existing
 in order to simplify
Message-ID: <YmPOQS9GvdiM2brX@zx2c4.com>
References: <20220419111650.1582274-1-Jason@zx2c4.com>
 <20220419111650.1582274-12-Jason@zx2c4.com>
 <CACXcFmksd3cw+xa-c2gEdd4=96PO8GCCMF6q2d6JHnJum2LjiA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACXcFmksd3cw+xa-c2gEdd4=96PO8GCCMF6q2d6JHnJum2LjiA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_030048_989485_DEA23486 
X-CRM114-Status: GOOD (  16.78  )
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

Hi Sandy,

On Sat, Apr 23, 2022 at 10:24:07AM +0800, Sandy Harris wrote:
> On Sat, Apr 23, 2022 at 6:37 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > All platforms are now guaranteed to provide some value for
> > random_get_entropy(). In case some bug leads to this not being so, we
> > print a warning, ...
> 
> Would it make sense to test at compile time? If there is no hardware
> RNG nor a cycle counter, then the kernel should be compiled with
> the gcc latent entropy plugin. Generate a warning suggesting that,
> or even an error insisting on it.

Unfortunately, as a last ditch warning safeguard against bugs, I don't
think that's something we can determine at build time. A lot of this
machinery is dynamic. Fortunately a single check at init time brings
with it zero appreciable overhead.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
