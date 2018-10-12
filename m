Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA84C6787C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 21:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75D262098A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 21:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sr9l5Qv5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="Q7MBCldy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75D262098A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYlt/HakCh+ISX2FkoNAo5hGLuJmVjD18jWI1AXiNEc=; b=sr9l5Qv5ku7TXA
	znZfAM61rsTp7pu+lSfIrSma0dD1c9nFEr6No+RLg6UZqTkPb28h/IQPLR+qV67zhER6pPUWDcJHt
	3WK3kjdMtifDHI3AROrMcq3YewefQDteuIX+hqsUVLmV2E3OFK59wNQLgaOSqHFn7DQUn7Mag6MRV
	M4umowa+K0L4FAg8NB2yzeBHTTAovtBOLx+kQA4oE1Z1pOdd7mbwcuxpJxrbpeTtwPUcAyN+2dG5x
	iISOL4HedX7pVpSYSp6OSyPViNc/O+yY9Y7Dta/2ufHauCVNCBugC6Vg9KtYu78v6OdJjliAikkdU
	3eOvVY/iOohfiEU6KgQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB5Ah-0000JK-Dv; Fri, 12 Oct 2018 21:40:35 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB5AX-0000Fj-Tm
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 21:40:32 +0000
Received: by mail-pl1-x641.google.com with SMTP id y15-v6so6492521plr.12
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 14:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=EZ6AbY0+QEnL8HzuWmhaSK57wwCzlnbyYarLpRCj7aE=;
 b=Q7MBCldyZ+B/JLvaaWb2BMtFheBm5otzXbhsmcIEVD1EtSsxlAuCLFEl3Qc9pQvALC
 OQ51TCa4SHitV2rlVUpX3cM0p+/om0n5xzX3/rZS/fRPaTfcdmGyTACXh/UCtpVx+tey
 t8B5BykJZgHPVDKJPRm0A5ZSASpImmXPcYBQvXSamjRHhwRlGrcyKkA930swlfj92SWS
 pCp04U3HKrqug2Ljbc1e2tkQdP63fnpVyLcEWWWj/2cEOxqu6DOQ29jS+ZKX9Dnvh6dY
 xV/QUedFYwWz1E7NKGs3C2fT6MKWqRGH5aQEFuLubHYXLKyxnHGCRSChPda1hBOJq2br
 s0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=EZ6AbY0+QEnL8HzuWmhaSK57wwCzlnbyYarLpRCj7aE=;
 b=j8uG7c40D1APHfhX0fwGVB2CTMnRhH4nN8j/g7ZojHLuZThBYWVBUCwGQ44tEZ0yiC
 bWi1BAj64iYetDRSUj3K8sIZkcVXU0nJoH9kcms9mJdPVYFCSgHDI3invy0xO9WZU9Bj
 uhiV61wX7ex6Cg4Qw/iLfgv0xjH7hEZDQWmLAFxPRIflrgQB0IYFZDBlyrDgsRJU6yIW
 XxOAZURrd+3jH1M1KCq/RBsCHLajnaOO11qJPcvSjotNB8qLndKxcpMi9TC4CEeIJO2T
 yL18ebqQ8vssR8OUj539Dve578qq5S1jyAlESuyfyqotDMrVUeoDyWfvLGX8cRmjpszP
 8UfA==
X-Gm-Message-State: ABuFfoh6e29TeQw3ay5GuaBGaDxOZ8zNfH81i+pITFRp8qHi/E+a2SMc
 X1g4gx2aR/jqrxtwIjMyWRd+uA==
X-Google-Smtp-Source: ACcGV62d4s8oK2nDlUWN514RERavyrSsHNwTTo+k9wMz9Jnjk7To6L0I7Xbsikct+spe0KRWje8CWA==
X-Received: by 2002:a17:902:b491:: with SMTP id
 y17-v6mr2579110plr.122.1539380413742; 
 Fri, 12 Oct 2018 14:40:13 -0700 (PDT)
Received: from kshutemo-mobl1.localdomain (fmdmzpr03-ext.fm.intel.com.
 [192.55.54.38])
 by smtp.gmail.com with ESMTPSA id a79-v6sm3576671pfa.124.2018.10.12.14.40.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Oct 2018 14:40:12 -0700 (PDT)
Received: by kshutemo-mobl1.localdomain (Postfix, from userid 1000)
 id 710CC300030; Sat, 13 Oct 2018 00:40:08 +0300 (+03)
Date: Sat, 13 Oct 2018 00:40:08 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181012214008.jj7vhh76vte7xj7i@kshutemo-mobl1>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <9ed82f9e-88c4-8e4f-8c45-3ef153469603@kot-begemot.co.uk>
 <20181012143728.t42uvr6etg7gp7fh@kshutemo-mobl1>
 <4dd52e22-5b51-9b30-7178-fde603a08f88@kot-begemot.co.uk>
 <97cb3fe1-7bc1-12ff-d602-56c72a5496c5@kot-begemot.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97cb3fe1-7bc1-12ff-d602-56c72a5496c5@kot-begemot.co.uk>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_144026_014739_721FEB70 
X-CRM114-Status: GOOD (  31.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 mhocko@kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, kvmarm@lists.cs.columbia.edu,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 linux-xtensa@linux-xtensa.org, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 pantin@google.com, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012214008.4Y1k5rtXylNFc2fSbB9WE4fTHJhWsSuH0WY29ik9MNY@z>

On Fri, Oct 12, 2018 at 05:42:24PM +0100, Anton Ivanov wrote:
> =

> On 10/12/18 3:48 PM, Anton Ivanov wrote:
> > On 12/10/2018 15:37, Kirill A. Shutemov wrote:
> > > On Fri, Oct 12, 2018 at 03:09:49PM +0100, Anton Ivanov wrote:
> > > > On 10/12/18 2:37 AM, Joel Fernandes (Google) wrote:
> > > > > Android needs to mremap large regions of memory during
> > > > > memory management
> > > > > related operations. The mremap system call can be really
> > > > > slow if THP is
> > > > > not enabled. The bottleneck is move_page_tables, which is copying=
 each
> > > > > pte at a time, and can be really slow across a large map.
> > > > > Turning on THP
> > > > > may not be a viable option, and is not for us. This patch
> > > > > speeds up the
> > > > > performance for non-THP system by copying at the PMD level
> > > > > when possible.
> > > > > =

> > > > > The speed up is three orders of magnitude. On a 1GB mremap, the m=
remap
> > > > > completion times drops from 160-250 millesconds to 380-400
> > > > > microseconds.
> > > > > =

> > > > > Before:
> > > > > Total mremap time for 1GB data: 242321014 nanoseconds.
> > > > > Total mremap time for 1GB data: 196842467 nanoseconds.
> > > > > Total mremap time for 1GB data: 167051162 nanoseconds.
> > > > > =

> > > > > After:
> > > > > Total mremap time for 1GB data: 385781 nanoseconds.
> > > > > Total mremap time for 1GB data: 388959 nanoseconds.
> > > > > Total mremap time for 1GB data: 402813 nanoseconds.
> > > > > =

> > > > > Incase THP is enabled, the optimization is skipped. I also flush =
the
> > > > > tlb every time we do this optimization since I couldn't find a wa=
y to
> > > > > determine if the low-level PTEs are dirty. It is seen that the co=
st of
> > > > > doing so is not much compared the improvement, on both
> > > > > x86-64 and arm64.
> > > > > =

> > > > > Cc: minchan@kernel.org
> > > > > Cc: pantin@google.com
> > > > > Cc: hughd@google.com
> > > > > Cc: lokeshgidra@google.com
> > > > > Cc: dancol@google.com
> > > > > Cc: mhocko@kernel.org
> > > > > Cc: kirill@shutemov.name
> > > > > Cc: akpm@linux-foundation.org
> > > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > > ---
> > > > > =A0=A0 mm/mremap.c | 62
> > > > > +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > =A0=A0 1 file changed, 62 insertions(+)
> > > > > =

> > > > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > > > index 9e68a02a52b1..d82c485822ef 100644
> > > > > --- a/mm/mremap.c
> > > > > +++ b/mm/mremap.c
> > > > > @@ -191,6 +191,54 @@ static void move_ptes(struct
> > > > > vm_area_struct *vma, pmd_t *old_pmd,
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drop_rmap_locks(vma);
> > > > > =A0=A0 }
> > > > > +static bool move_normal_pmd(struct vm_area_struct *vma,
> > > > > unsigned long old_addr,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long new_addr, unsigned lon=
g old_end,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 pmd_t *old_pmd, pmd_t *new_pmd, bool=
 *need_flush)
> > > > > +{
> > > > > +=A0=A0=A0 spinlock_t *old_ptl, *new_ptl;
> > > > > +=A0=A0=A0 struct mm_struct *mm =3D vma->vm_mm;
> > > > > +
> > > > > +=A0=A0=A0 if ((old_addr & ~PMD_MASK) || (new_addr & ~PMD_MASK)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 || old_end - old_addr < PMD_SIZE)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > +
> > > > > +=A0=A0=A0 /*
> > > > > +=A0=A0=A0=A0 * The destination pmd shouldn't be established, fre=
e_pgtables()
> > > > > +=A0=A0=A0=A0 * should have release it.
> > > > > +=A0=A0=A0=A0 */
> > > > > +=A0=A0=A0 if (WARN_ON(!pmd_none(*new_pmd)))
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > +
> > > > > +=A0=A0=A0 /*
> > > > > +=A0=A0=A0=A0 * We don't have to worry about the ordering of src =
and dst
> > > > > +=A0=A0=A0=A0 * ptlocks because exclusive mmap_sem prevents deadl=
ock.
> > > > > +=A0=A0=A0=A0 */
> > > > > +=A0=A0=A0 old_ptl =3D pmd_lock(vma->vm_mm, old_pmd);
> > > > > +=A0=A0=A0 if (old_ptl) {
> > > > > +=A0=A0=A0=A0=A0=A0=A0 pmd_t pmd;
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0 new_ptl =3D pmd_lockptr(mm, new_pmd);
> > > > > +=A0=A0=A0=A0=A0=A0=A0 if (new_ptl !=3D old_ptl)
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_lock_nested(new_ptl, SING=
LE_DEPTH_NESTING);
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0 /* Clear the pmd */
> > > > > +=A0=A0=A0=A0=A0=A0=A0 pmd =3D *old_pmd;
> > > > > +=A0=A0=A0=A0=A0=A0=A0 pmd_clear(old_pmd);
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0 VM_BUG_ON(!pmd_none(*new_pmd));
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0 /* Set the new pmd */
> > > > > +=A0=A0=A0=A0=A0=A0=A0 set_pmd_at(mm, new_addr, new_pmd, pmd);
> > > > UML does not have set_pmd_at at all
> > > Every architecture does. :)
> > =

> > I tried to build it patching vs 4.19-rc before I made this statement and
> > ran into that.
> > =

> > Presently it does not.
> > =

> > https://elixir.bootlin.com/linux/v4.19-rc7/ident/set_pmd_at - UML is not
> > on the list.
> =

> Once this problem as well as the omissions in the include changes for UML=
 in
> patch one have been fixed it appears to be working.
> =

> What it needs is attached.

Well, the optization is only suitable for arch that has 3 or more levels
of page tables. Otherwise it will not have [non-folded] pmd.

And in this case arch/um already should have set_pmd_at(), see
3_LEVEL_PGTABLES.

To port on 2-level paging, it has to be handled on pgd level. It
complicates the code and will not bring much value.

-- =

 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
