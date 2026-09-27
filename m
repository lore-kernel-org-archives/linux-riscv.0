Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB65C9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 22:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mkZv1lFUFwKbKAAR0+yx2WVZet+j/0X1OgM1+T7Sn0=; b=yOcNmiexXNoDr1
	cvm8MsKG7OQycgNBxczQr5CClcsEmxWt59IbYsQj5Nk1BpvP9W8mSyzvT+YCR5HYRNaUVT1BeenXr
	zQgdOlQNft6gsnEZ10FSNutjHM7N70EfNb8N0MrZw7B0HZg7PdEIPnCUupoo5tszcNnSXE6G36KBd
	nrCrO3TpNDiWKaUV+Kk6foIa07a7Zo1NOzQ+9gEwCwoL0M9GIFqPi2jvuga6Nd4NCVufhXuk9F6XY
	6A9iUjQ/kdczykhn0pdCE5G+szqKRlzkftWJAmxGMs7i1M0UfDiFlKlkfzqXdLgYccwO4MwsSBDFE
	U9hgTJ3i80q8zOOki9pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxm1-0000000GyiZ-01e2;
	Sun, 27 Sep 2026 22:55:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxlz-0000000GyiA-21Ot;
	Sun, 27 Sep 2026 22:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fonZKBEVnLUi3nmIxkkXaoCZILdYms0d8ZYuqeeaJBg=; b=eIGI0kb8JoQ6f59QATnKY4VWTy
	KlWA18PX6hX10BKhOmxNq0tGi3u1aRfvl4+RCRxnypG+Q3zub+tAGfPLahvJ7UxrqebG6Hw87AV+5
	pjJ5wII77N8SG6ISTZur4tDlzHyQJG/AruwRnBvYUL5h5vM1R4LIVih5MQuljHXPOD6svEMX0vt5w
	fN1uh3q8xkndWOy2mJeEInuuRC2htXs6SWKt9eP27BmPHjB6Elzy1vZxpqCT0Gl7etIkQcBpxUbK4
	n8v611VA11zwhLqKPmNANUdBBOafXd7NBkYlngO75KzUN/H3oVubmt74amemlxLWMaFpHJpsXr2/5
	Lk6vs5tg==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxlt-000000025TY-0cPK;
	Sun, 27 Sep 2026 22:55:01 +0000
Date: Sun, 27 Sep 2026 23:55:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Hongru Zhang <zhanghongru06@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, baohua@kernel.org,
	surenb@google.com, david@kernel.org, liam@infradead.org,
	mhocko@suse.com, rppt@kernel.org, shakeel.butt@linux.dev,
	vbabka@kernel.org, zhaonanzhe@xiaomi.com, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, chenhuacai@kernel.org,
	kernel@xen0n.name, loongarch@lists.linux.dev, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	linux-s390@vger.kernel.org, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	Hongru Zhang <zhanghongru@xiaomi.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
Message-ID: <armexcXDiG8ryZd6@casper.infradead.org>
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin>
 <arF-E3Nsw9ZliH0t@casper.infradead.org>
 <arI_w2wTfA00Mgy9@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arI_w2wTfA00Mgy9@gremlin>
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

On Tue, Sep 22, 2026 at 09:55:23AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 21, 2026 at 07:57:23PM +0100, Matthew Wilcox wrote:
> > more to say on this in two weeks at Plumbers.
> 
> I look forward to it :)

So while doing my slides, I realised that what we need to avoid doing
is (a) sleeping while holding the mmap_lock (b) returning RETRY while
holding the VMA lock

And that turns out to be as simple as this patch:

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..94ed2333f8d8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -723,6 +723,8 @@ enum {
  */
 static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
 {
+	if (flags & FAULT_FLAG_VMA_LOCK)
+		return false;
 	return (flags & FAULT_FLAG_ALLOW_RETRY) &&
 	    (!(flags & FAULT_FLAG_TRIED));
 }

OK, this is a hack.  The function is spectacularly badly named, and
needs to be renamed before a patch can go upstream.  But this should
fix the contention on mmap_lock.

Could somebody try it?  I've verified it boots and runs some userspace
fine, but I don't have the workload to test the contention.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
