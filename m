Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDC3C0218A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 11:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nr4tvcFmvynhfusq+tks8vMZq+Lc+yi52KH6aoIWByE=; b=iKfp6MCxQPT8vj
	mkpYDfalgeIVwHW47VhffKfc48IbPNV+UhWxGTTCv3MvT1H3iRsZ5ADWnTeaa0LVmWXLs8xlc+JtM
	KL0xDD2th9rfoFBXvBgwD3FB8Rv+n8DWC+mnBgP3xnh9Acq3IidJ+weRf8+HYldBrgJ1V0V2qwVIX
	pI0snMRYrJ+IfDn5waC6Imv5EqBCT50H2jniyc57tMghsuHTtVfSdsN3eQIxpvC9qxLDwnOtBXnOH
	LSXh6RmEQRebbw278f1W32GyUMRg6x/7H7rYudc0k6Il3FIAvJrmCy4OgWBqNDmE5uN5grs630Oz0
	cm8TXSw/s1HqOtFqicoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjia-00000004mCz-0hzj;
	Tue, 28 Jan 2025 11:25:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjg2-00000004lX4-3nRm;
	Tue, 28 Jan 2025 11:22:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3179E5C5D79;
	Tue, 28 Jan 2025 11:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98109C4CEDF;
	Tue, 28 Jan 2025 11:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738063362;
	bh=AJfDJn9pFkPItjs+l9CjDlC33TdlTCE01Kr4mfJIOJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foTouGKI5Xpt6DiifiySGU1Px4B0JlxynZkL/A+4GJ+F1wUAFkM/N4G83a9sI8N06
	 lsMHA2F0I+BGkV1h4oylhwmSeJznMzbN+UJy9qwbYRK5QlpfqNfv8Msq/ndA/iDm4I
	 JYp3P2GR22dNEIcBnZOOATJGYPU+gMIFK9XfLLma3B24+UKToDLZL/ZLBF6bwp16qy
	 HMKr9svtYad8MrCuOMMF5t2I0WLB8bGS9HGYMu9w94+SD6sanYCztaTmP2cubx4D+F
	 lhSPEntAtoYhJR/j92VqRwE5MifEf7tNzvj9NQnTwv0sbHofELHMou005/QzH1lonP
	 yczCENnq4hKEA==
Date: Tue, 28 Jan 2025 12:22:37 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, codalist@coda.cs.cmu.edu, linux-mm@kvack.org, 
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, Song Liu <song@kernel.org>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Corey Minyard <cminyard@mvista.com>
Subject: Re: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where
 applicable
Message-ID: <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com>
 <Z5epb86xkHQ3BLhp@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z5epb86xkHQ3BLhp@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_032243_030062_7DDCE89F 
X-CRM114-Status: GOOD (  14.94  )
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

On Mon, Jan 27, 2025 at 03:42:39PM +0000, Matthew Wilcox wrote:
> On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> > You could have static const within functions too. You get the rodata
> > protection and function local scope, best of both worlds?
> 
> timer_active is on the stack, so it can't be static const.
> 
> Does this really need to be cc'd to such a wide distribution list?
That is a very good question. I removed 160 people from the original
e-mail and left the ones that where previously involved with this patch
and left all the lists for good measure. But it seems I can reduce it
even more.

How about this: For these treewide efforts I just leave the people that
are/were involved in the series and add two lists: linux-kernel and
linux-hardening.

Unless someone screams, I'll try this out on my next treewide.

Thx for the feedback

Best

-- 

Joel Granados

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
