Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C7DC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 10:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tyl1VLCqOPjMtlsRRDPn9PtehGtHAvNsXLxgKAdl9Y0=; b=KBpDIn7+jdiyvO
	40Ac73ihJPf4GGFDZ1mx7trE4mMarQ5lb6UZHPNMS61mlheodRHmbyFM1sNzKBqdRc8k6ZzqHkjDb
	crd4Rk+q9Zg3TwNpCNnigJoLCm4uZ2xOUKU1EHTnuqjGvfH4IBx7v9mNtL3K8L+X2E2LWstBbVl/Z
	YPbHMSUC9Z80D7nE730RTgNtbF30UpLAkA5aQ2kLWpZhENrGL6FEYP5Uhp8x0B6yg4YklCgd4qZji
	GM4kU0g13yqOOWri3tH4nSVPNg5OrDe/O+DfzxBMclDYgT2tThcuVT1Je/7P7OekaxpjU/VgMOFwT
	4Xbpi20TDjtKwNMNeZqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pys8K-005Jop-1Q;
	Tue, 16 May 2023 10:42:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pys8I-005JmK-1P;
	Tue, 16 May 2023 10:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aFE52arMbeuGVCs81HtFqwlRw7vUUbocXdncBereG0Q=; b=FkkqeXjyINXcZ0dn67fZnclgj5
	cM/jyQTU2OOfVb/EiYFiDE06liJQP27KDAcpUH/jvL5QV5T8XRtCJzU+4kg1GW4V/NzKuN4GPJCdQ
	0sqkIOfozkG/6bRoKC331l4E55SrRg5QgVT5Oax7JRzQ8FaceCgUVhX3+9fgImj0uvsScOdj/gykc
	BiRVVw7g07fwYDhA/dioi9Gx9dHD4NjilKqhgdxQMUfWU0+KUYPlLl+nB8lai821mGMHryLvk+NSQ
	Eh+gOFJ/bYjCd1MgOmvB2ulDNpaXZcyForWW7zbsHFkP4U9F6xTP8XOIUJ9iT/VeLM4yXgttg5d8o
	HZ+p+e2A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pys7y-00C5WG-2z;
	Tue, 16 May 2023 10:41:59 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D21DF30008D;
	Tue, 16 May 2023 12:41:52 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A9E932013503C; Tue, 16 May 2023 12:41:52 +0200 (CEST)
Date: Tue, 16 May 2023 12:41:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Michel Lespinasse <michel@lespinasse.org>
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
Message-ID: <20230516104152.GH2587705@hirez.programming.kicks-ass.net>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <ZFs0k2rrLPH9A/UU@casper.infradead.org>
 <d7f3c7b2-25b8-ef66-98a8-43d68f4499f@google.com>
 <ZFz1j1slZHCQmwMJ@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZFz1j1slZHCQmwMJ@casper.infradead.org>
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

On Thu, May 11, 2023 at 03:02:55PM +0100, Matthew Wilcox wrote:

> We also talked about moving x86 to always RCU-free page tables in
> order to make accessing /proc/$pid/smaps lockless.  I believe Michel
> is going to take a swing at this project.

Shouldn't be too controversial I think -- effectively everybody already
has it enabled because everybody builds with KVM enabled.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
