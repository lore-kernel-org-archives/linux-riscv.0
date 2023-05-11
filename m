Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E0AC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 07:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mm0uwi3yuTVnKvmUiAdLYCACssZ/qVDi9/+h+HM3gGA=; b=DsHhuCbk1RuAQT
	sw2sKNY4Gog0ILF+e1xgr7N/9AqVzxI0ePJy6Jhwkwc3ywWBtkJlb1YX57cB2zwgTYbkkAQkqXrIW
	It40+O5fUcO+6rvdaYXQOA+2ARcFMXxvcagxXHXNxUY9UrDIo2S9YNhrjfJn5hlyl7qGFXEvKJ3dz
	NKLkI+h4vVXRFYaHuUJHST3UCkaTBh9AkURRYSmy2jltWRH7o3PYv6h5N3x568bFhGdduo/ahkglg
	kH3QeNkFiYU4ugnKmQ4YPLVJjzTc/K3+Dk8sA0lPqie4hZ/G/BqjtaJqgtdBnenhWJvOO7EzBhqvp
	J1QhzEEgXjHQw5Tra/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0kC-0088Pn-0l;
	Thu, 11 May 2023 07:29:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0kA-0088P9-1V;
	Thu, 11 May 2023 07:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=azrNy8jR/eywnBe5iwkYoTICDEd2tFtH6QS0WKjjh5Y=; b=DOnolZC/QK5V4Ywtwv/HYv2sLi
	G/VPQSHN21qshNyaBTulG9YFOTbpF8huQfm5A3YVQC9FVPP0LJ/rY35lV3geLDJTLnx3KAm/xmXY3
	72gZNN6EVuWC6WMSTxquMfkz56mhTF/9kJFHkxmZHYd8lFAtAPuTu83wHSH7aa7l3hLdJ0vYXlapL
	CX9ty1km6fTUTDuW10LgI0DaPt+V1bs9I+wdQw+TRqwlutvImWhUZhKWAqmN2ul+mYWVLG1d2d5Z9
	Cs7p6fUpjHcPwE88ZV6c+gEZlM5oLRoRD1B7l9kfMlks8GJWdml4nPgUlzCx+T0plhz7c265PEFIK
	ldBZ4AtQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1px0jv-00Gz99-0Q; Thu, 11 May 2023 07:29:27 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8D3CC300023;
	Thu, 11 May 2023 09:29:21 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 68A20235CC445; Thu, 11 May 2023 09:29:21 +0200 (CEST)
Date: Thu, 11 May 2023 09:29:21 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Matthew Wilcox <willy@infradead.org>,
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
	linux-mm@kvack.org
Subject: Re: [PATCH 21/23] x86: Allow get_locked_pte() to fail
Message-ID: <20230511072921.GP4253@hirez.programming.kicks-ass.net>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <eba2b72f-2180-498b-c8bd-ce8f717fc78a@google.com>
 <20230510081848.GD83892@hirez.programming.kicks-ass.net>
 <e5554cd1-417a-aa6a-5e5e-f4f5f773dda@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5554cd1-417a-aa6a-5e5e-f4f5f773dda@google.com>
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

On Wed, May 10, 2023 at 08:16:34PM -0700, Hugh Dickins wrote:
> Thanks for looking so quickly, Peter: I didn't Cc you on this particular
> series, but shall certainly be doing so on the ones that follow, because
> a few of those patches go into interesting pmdp_get_lockless() territory.

I'm in the x86@ catch-all, which is how I saw this as quickly :-) A
direct copy won't hurt ofc, the mail system will sort it out.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
