Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43573C4452A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+Do7ZFQ3Rpwh30/T1b9tIv1S7pkwI0gE3AM79xyVck=; b=b8yrGZJn7yS0R3
	pL5Fk5I8hcwzYKcfpV+n8MuDs/cJzg6ARtjWWxdEfhSmXu1EAECr2UkuCFye8AD+sD0qWVk5GOjSt
	9Up6OpT60b+wSS01BQ+4RB0Md7ViUzPWeHieVhfEOjrnIrzauV+OrtQjMRlZKrrsxrZy9LFXu9Gp1
	mFNRXJnUYyHchM+UrBVDcxyAJRClqzYb8YmccGY/GboCEj7axPxuCNVaaRWvMGhnG7TdHPs6VdMGD
	/+j3Sfy9GIIp2W2gxL89G3Qme/zIalB/HRfx0K0us3LE9U+mOFjx9PqugIfMfK8Ok6B8OjRo19vvf
	Zx7eBr6WO4DCjXTCp1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpcJ-000000077bx-1gzu;
	Mon, 20 Jul 2026 15:09:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpcH-000000077Zc-38iN
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3Kwva7Zy1z1wrcNqc8C7vuOXZAaSl5rSUSt0nXXiyx0=; b=fBhvSoCmPZzmb06av9VCCIl2M/
	UM7sR+ji3ZYJkv1QkgmujZOY1g8d9T3QyPWYOA1UzhrPSoM59VGXS3F2xqMlX47KIO7YAasnAx/V7
	N73QNKh+FANJIKgsGU15ZZBU0zxqAohdeBubkf9r+5TApqLjGRqgVgSUNWDPNfHzA/3n1/FkQeBcY
	vbFxVqXbHgSRuDxOtAk7wBLfSpXTzIFEi6TgpTpmJJiRffQy8Jl4powEafj5L2jh5IPIg4wFTiV25
	PjMfKr8xRlFV0wivaebTUZRz0idD2PHtBe5s5W8Y2xMqaMFyopKCf6woD4JG+Ng80JdBkS4CXAGBb
	qohvsNUw==;
Received: from shelob.surriel.com ([96.67.55.147])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlpcE-0000000Gi3L-1XWJ
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 15:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3Kwva7Zy1z1wrcNqc8C7vuOXZAaSl5rSUSt0nXXiyx0=; b=fNG3pE531FrkzSi/ukWn7R+4zt
	HJOBnGpm49FdsglRvScBkbywX83gyp8V7S5kQSTRP6WYHpX+Mp7RrZ6AkTsKYporq6eqw2avYLlyT
	ToPD3oazGSH059mpSXDrEu86kIcooInZZqHa0hYEU0lAHKOHtGmTFFgte0T81Va5d4beLSR1BbHpt
	04iSypL6lC08QrrdfZfDwcFQGdqmIC/2+q0ZGzkh2kJx4Bf3jClleajAkq1gNnCvSDIdAXIDaHedw
	IPKu879tFoMATr71yu5hOKseko0K+B6XffsCTPI56E+k6uOky4rKAJW2SYpqlKAicaLh6zgfnHoE+
	3FRSXt1Q==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wlpbG-000000001Qs-0nhT;
	Mon, 20 Jul 2026 11:08:10 -0400
Message-ID: <13ec2603d5cbfdc493939f182b71e5133c26af54.camel@surriel.com>
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
Date: Mon, 20 Jul 2026 11:08:08 -0400
In-Reply-To: <20260720115741.239657-1-usama.arif@linux.dev>
References: <20260720115741.239657-1-usama.arif@linux.dev>
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
X-CRM114-CacheID: sfid-20260720_160911_240636_151F2595 
X-CRM114-Status: GOOD (  13.70  )
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

On Mon, 2026-07-20 at 04:57 -0700, Usama Arif wrote:
> On Fri, 17 Jul 2026 13:00:32 -0400 Rik van Riel <riel@surriel.com>
> wrote:
> 
> 
> > 
> > mm->context.pmlen is set only through PR_SET_TAGGED_ADDR_CTRL and
> > is stable
> > afterwards, so it can be read without the mmap lock, as it already
> > is from
> > untagged_addr() and mm_untag_mask().
> > 
> 
> I think it might not be stable? set_tagged_addr_ctrl() can change it
> repeatedly until a CLONE_VM operation sets MM_CONTEXT_LOCK_PMLEN.

You're right, ARM tagged addresses seem to work a
little differently from x86 LAM.

It looks like on ARM with MTE, the top 8 bits of
the virtual address are available as tags, meaning
that address space cannot be used for VMAs.

For purposes of accessing process memory, this
is a little more stable than LAM, because the
number of bits we need to mask out of the address
is always the same when MTE is in use.

At least, I think so. Am I overlooking anything?

I will clean up the changelog like you suggested.

-- 
All Rights Reversed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
