Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF8DC5B543
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 00:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpEDzPYiBhgjRDP8ziIV19uSJeIO7/ycfG7CK/O9hqQ=; b=pYzlqLKpbItqaK
	lMEpVu7JbEjD9MgAKK+n6T7093XsZVAyUFm9dpMafxWUkODx85EH9CSHCBSBmwuTNNrkBLXFlvAAv
	LisR/tk4jmUNpDjtBUHobVK/YWvexspHAk/Hm76GOyy6Qqcf+qpYGunlO9zgj5GHHMl/q49ZBPdw9
	WhzRuWA9DozwN/Z4hySa0AmnYLFqTmBMf8Yk+nDXtspFvLqF/UPP7v9yi+hCt2dGCqA+8nV6UAu0L
	VcH6nC2uPJiVByKX2u/87ztbUi8kPIMxSGBZHwkA99j3YfKg1SYbIAOnagfPtzWLa+eGkIRZhLK1y
	Gx4JJ+Rn2xH/bYup5d0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKnUo-0000000GnLS-1lrO;
	Fri, 30 May 2025 00:21:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKnSf-0000000GnAS-1WBU;
	Fri, 30 May 2025 00:19:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BABE1434CE;
	Fri, 30 May 2025 00:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1318DC4CEE7;
	Fri, 30 May 2025 00:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748564340;
	bh=fzOvslZ2yd+4RFEep1dbc5ORhnJiU65cwMbwzfxOuJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orABEw9GW8hha5WEfX4nOeo6UClo8SCkt06HiIxuvuXY7GIfYcPzgNE32XTnhzdfX
	 kKMuYGPwMqs+WLu0Qj8v4D5q6qNBKBDogc8zbaCiVXEQrnWp9+f4G6a49QkyH5AQMF
	 dDx8VrJ3wVC7iECbcZX0SpWm8aiThHGfvOpkVjVWpDL+74WBH03Q2Ykt1cb+GFASa2
	 NU60WR7MaU4No+If0hsqwvEwuY0P3bfo2S5jzwxo83RXY/5/tgfmwQm04dF8NWmBDR
	 v1DbNr/Hjp64FvFbXKbCNsalVpnA3MSbZXY5ojWWQl9zts6A8OtUTG4mPMeo4MMzkm
	 Ln6fC4JypHUAQ==
Date: Fri, 30 May 2025 00:18:58 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
Message-ID: <20250530001858.GD3840196@google.com>
References: <20250428170040.423825-1-ebiggers@kernel.org>
 <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com>
 <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
 <20250529211639.GD23614@sol>
 <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_171901_422781_F3C70513 
X-CRM114-Status: GOOD (  17.54  )
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

On Thu, May 29, 2025 at 04:54:34PM -0700, Linus Torvalds wrote:
> On Thu, 29 May 2025 at 14:16, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
> > similar), the current behavior is that ext4.ko depends on the crc32c_arch()
> > symbol.
> 
> Yes, I think that's a good example.
> 
> I think it's an example of something that "works", but it certainly is
> a bit hacky.
> 
> Wouldn't it be nicer if just plain "crc32c()" did the right thing,
> instead of users having to do strange hacks just to get the optimized
> version that they are looking for?

For crc32c() that's exactly how it works (since v6.14, when I implemented it).
The users call crc32c() which is an inline function, which then calls
crc32c_arch() or crc32c_base() depending on the kconfig.  So that's why I said
the symbol dependency is currently on crc32c_arch.  Sorry if I wasn't clear.
The SHA-256, ChaCha, and Poly1305 library code now has a similar design too.

If we merged the arch and generic modules together, then the symbol would become
crc32c.  But in either case crc32c() is the API that all the users call.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
