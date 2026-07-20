Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC2BC44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btyAK4kjoWudJ/XY6uB0M4598fLnC6il6s3kYd+cMKQ=; b=xYgOPi9caBuUh4
	/s5K276omm/+iOk6xfUL8wDZEcJ9bwUd6Vnodo2a8JCyoWN4HuEfXyQ9MLSefMdMQM9KJtTPlqpB2
	gH7OajyPoqVD8LZFontMF7eBgoqq5E7xhxVF+YBdd1kl4Y3Lgk3DyXT+gKk8lcuEPHtLkKNgwzWg9
	bGIrOTlDNs5DsvCZIlYuF/y0/rEHHPyN32cZ0YpEGKwQtStt7S9Ww+06IzlZAnJxKlJ5w2vN2RivR
	9rv9BiaeTYyyeA+pvua5pfxI4d91QRziIFQ9jVHEY8UDxZ5hK+RqQ5YoT+ilJobL6ckzxoLsPhUeg
	PBeSbTTqKjF0AUSmXhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrtt-00000007YN9-1Z9U;
	Mon, 20 Jul 2026 17:35:33 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrtq-00000007YLP-1ExD
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 17:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VpgEGbQd7TUjFEcy4MwyOPp2fSwSzsT74h5eZuIrKNc=; b=Sp87H45crDR89XUlafK04T1y/o
	I/b/2NpEeAeRnQBadvGb72DkxwlguQl6tUofmiDsjeo5mO/LWih1G6hnM7Z+lEARQGQ+RJPXRNdtv
	T+qYaVKqv6P0ymHqoZJxZ2NsfuKXkSGiuEh5FnXzLK6BTcK/6+ozaV+vbG2VIbqZxjMEKEuiUPyaZ
	qfaI2NHjMIz8HQ4xMWNT96PZUDFAGvlnX9dvR9YcBPSbitfgdzv4jTscRR53wthhZTdPUkeCxsK8O
	pZTPHyLxLMiNK5IFk81GPB93l4sWHbvjCVXCuGG+D2uNfCmeXTYdvQ+1xluzEuJq1iZaEc+jTLi5b
	H2ezgwrA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wlrt1-00000000359-185o;
	Mon, 20 Jul 2026 13:34:39 -0400
Message-ID: <51c0025d2eb885ff1f4775e4d9ffcf34f478f378.camel@surriel.com>
Subject: Re: [PATCH RFC v3 2/6] riscv/mm: add untagged_addr_remote_unlocked()
From: Rik van Riel <riel@surriel.com>
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 	kernel-team@meta.com, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes	 <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka	 <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan	 <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti	
 <alex@ghiti.fr>, linux-riscv@lists.infradead.org
Date: Mon, 20 Jul 2026 13:34:39 -0400
In-Reply-To: <46dc1b58-f2de-492a-9da5-a5c429c19a10@linux.dev>
References: <20260720115741.239657-1-usama.arif@linux.dev>
	 <13ec2603d5cbfdc493939f182b71e5133c26af54.camel@surriel.com>
	 <46dc1b58-f2de-492a-9da5-a5c429c19a10@linux.dev>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_103530_335981_6A2B0B6E 
X-CRM114-Status: GOOD (  14.76  )
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

On Mon, 2026-07-20 at 17:46 +0100, Usama Arif wrote:
> 
> 
> On 20/07/2026 16:08, Rik van Riel wrote:
> > On Mon, 2026-07-20 at 04:57 -0700, Usama Arif wrote:
> > > On Fri, 17 Jul 2026 13:00:32 -0400 Rik van Riel
> > > <riel@surriel.com>
> > > wrote:
> > > 
> > > 
> > > > 
> > > > mm->context.pmlen is set only through PR_SET_TAGGED_ADDR_CTRL
> > > > and
> > > > is stable
> > > > afterwards, so it can be read without the mmap lock, as it
> > > > already
> > > > is from
> > > > untagged_addr() and mm_untag_mask().
> > > > 
> > > 
> > > I think it might not be stable? set_tagged_addr_ctrl() can change
> > > it
> > > repeatedly until a CLONE_VM operation sets MM_CONTEXT_LOCK_PMLEN.
> > 
> > You're right, ARM tagged addresses seem to work a
> 
> ah do you mean RISCV here?

Ugh, I looked at the wrong one.  RISCV is like
x86, with a dynamic (though a limited number
of options?) mask.

Having said that, won't a process have all of
its VMAs in the masked-off area, so coming in
from a remote process to a valid memory address
should already give us a valid address?

-- 
All Rights Reversed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
