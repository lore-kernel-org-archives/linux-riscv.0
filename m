Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A41CFC515
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 01:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/qK1rAR//G+H4hBMGX4vOPuHHZ3G8ZK4r3uQcHW1CA=; b=dw2vSjDe+Uw16r
	vCquS6Po632ULCbNHzd3x/2K67bK9+073VDO1C75/i02hFrpPkbTDHQ7sSQ637QqbWPhy/RBRpn6M
	wCWH+6wOOfFDOmi4Nio9jxJz3s3k7r7yx7skCLyXhuIRZZrwqVynyysulpWErALXzKFP+iKYZB2Ww
	a32eg61sE3coLts6aw7QDT8xFtIwX0lDzi04u8VgUKR8LqdBJH/HtS2U4nb2NwP4ZWPlCsKC13G7G
	ch2zGpQG1tzb6hu1fQIc67vPGn6AIVNku1zs6nMRE887Ew5BHzRJMUQVZH6hNgxzNCepTsD65IZSA
	fnDjikXUpMTVYnEVjm5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMc93-000000098BC-3Gre;
	Sat, 22 Nov 2025 01:10:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMc91-000000098B4-3YNP
	for linux-riscv@lists.infradead.org;
	Sat, 22 Nov 2025 01:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB6BF601BC;
	Sat, 22 Nov 2025 01:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACA4C4CEF1;
	Sat, 22 Nov 2025 01:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763773829;
	bh=V5/3lcf0wE54FxK6rCPxY1hvL1brr+ChL3XS4dJOp4g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GUmypLaJnPk6p2ddsECWAmjKvrfITMjOeqoNkNHBcpeWmHbK7cJnM30ztlr0EYWm+
	 RhBQgyyfWkcYWt238rGr0nCRklVvLvdWzT88KEgqPkuHeQ2tk295TUHtT/mX/oheCq
	 CxAZUpED9Q2bKhPgrkNz9g2r8cA7I4Q3BIFTLa8Z1ENBNIktcbRbAviP5NuCx6a72m
	 eDp8lvM457D7FC6HFSe1lrZfNPNOkttuXA2uwahFCsCjF27J8+IlH8F6uyvhf9aPFA
	 z5hNI59XwRa7l35hLBz7eNa2Lx7yhrjXfxPuTuRF03IdEj0eWnq+LdU3LJj07V3+64
	 p8Gh1to8iY2qA==
Date: Fri, 21 Nov 2025 18:10:23 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, namcao@linutronix.de
Subject: Re: Re: Re: [PATCH] riscv: fix KUnit test_kprobes crash when building
 with Clang
In-Reply-To: <5b293e31.1dde8.19a9a0f91bb.Coremail.xujiakai2025@iscas.ac.cn>
Message-ID: <f1ea892e-a07a-5ded-dd6e-3e7ea55fe446@kernel.org>
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn> <621798fc-68bc-504c-755f-0a2f1f83d1c2@kernel.org> <108ac2f0.17c6b.19a8fc4d1ca.Coremail.xujiakai2025@iscas.ac.cn> <bd82855d-4a80-58fb-c949-b968569ef1e2@kernel.org>
 <5b293e31.1dde8.19a9a0f91bb.Coremail.xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
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

On Wed, 19 Nov 2025, Jiakai Xu wrote:

> &gt; Looks like you're using a mail client that sends HTML in what should be a 
> &gt; plain-text E-mail; please fix that.
> 
> I apologize for that oversight. 
> I will make sure to use plain-text emails going forward.

Looks like there's still a problem (the "&gt;"s above).

> &gt; Not all of it, but some edited summary is appropriate.  I've queued the 
> &gt; following revision for v6.18-rc fixes, under the theory that it would be 
> &gt; good to get the test working for Clang users while the LLVM folks 
> &gt; investigate.  Please let us know ASAP if you think anything in it should 
> &gt; be changed.  I plan to send a PR out later this week.
> 
> Thank you for your review of the patch and for the time and effort
> you spent on it. I fully agree with the modifications you made to the patch
> description.

Looks like some of the LLVM folks have responded to 
https://github.com/llvm/llvm-project/issues/168308 with some suggestions.  
Could you implement those and test it and update the patch?  If that can 
be done by early next week, then we should hopefully be able to get it in 
before v6.18 is tagged.

thanks,

- Paul 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
