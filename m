Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40B4C52D7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 06:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ovjhj1YiqVqTrZ/dzLSKFD00PrR8QjO1j5sebnDc0A=; b=tCMzX6S/IvbyNW
	lfyCLG1pqhs9L+Diad6PMxHtcTuj/kicKmmuBamXst5yA+HPG8oyLhWQgZrCkN0l2tmHoLiD+P0/6
	E70jr7+YIJFiHThDj5AT0t7Nm/ExfL4soZw6wYdknvotHmWOKUjs+n5LZI0+WbVsDKkdE3n+kuIIu
	1w31FavABgiLj7uwqtjQECnxD7sVqf9kYKG7KF6+QDkbBRitq09Uhrx6ZgPPdf2FHQmnt5Dj4SJq9
	0+ilQZ2RwSV/jyMk/VmTnacsZAP2u5QiYHPhdjvtuqrgSQFtqOqqYolDSfXlMwWrtE8xuERQrWwqh
	j/V8bomBO+SP4XZQcIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seToD-000000099Wk-3Y2K;
	Thu, 15 Aug 2024 06:18:05 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seTo9-000000099Vp-3QLb;
	Thu, 15 Aug 2024 06:18:03 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-27010ae9815so60504fac.2;
        Wed, 14 Aug 2024 23:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723702679; x=1724307479; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAHWmUt5jip0y+u22BsHFrHANReT/fLelSD2WuMjZ6U=;
        b=lGZDYdnh6zwAIu3RhHNbNLRRvdiZFGH/TVXsSzPEVTDX/F18cAXAzHZQIKofQEQFdq
         B+7rFbfy9O/uTdJu4JgvHdZv4B2dSlOPbrjPNFmCOn20/K933mHwecOpFqJsxK7lNklF
         iic6UK/lajxQPuG4Fdvq+aMY9WNJKUy7KSAPNBEX2lsayr7NhgdsgzJ1mQkyWW1pyzoe
         p8couc/J/QcCyvD2pd3ao79aQwphNx/kt5zuXEW8TQHCeDr4zGPT3g6jISrB5nl3ZbO0
         sgO1FRVSztqKNtZd7WxLA7EOiclkGsBF7KbO9r1Ywvi7Hp0blqHC5Lm2q8qFlP/frjtE
         yf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723702679; x=1724307479;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAHWmUt5jip0y+u22BsHFrHANReT/fLelSD2WuMjZ6U=;
        b=tnKk9sxoMIDhD0PcTeT3lTrFRcgt5i9WStzX3N7l+Y2SiVmw9OemHh1tl9vsmOv167
         5t5w44WwHCzMtmpzNT1148rBgGG3BNl0iVfClTXsr0za1S8KTreXvNXO7RE5F8dcUllW
         CcIX7WynvD9oe9PEk3wUaULCv2ywny3S48S0PjUi/y5xMFqSzVlr+8MhGXuUzR9QM49A
         YPY0XWxZ6B3ewnw8+Qec/0QmiKtUusYd8SK/24Z3/5b4mhPxMitRnlHf0yNQCIWARHIa
         1fe+7CSLKJiN5AU63Wwm2lmqt7g5JAPnurzBM/v7rGCP5KzxbMlTmRIvE2d3nGjDfz2H
         AVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQLJXXC0ERKPLVc1+GYC2HNKX51i5vUpVUP377mjf/QRp4ir+dwvUQljo3ebE+6jnAI9ZceBhQyjVD1Uag/idGNpjo9aFsCU5TrhwT45XhZCXA/1U8g5S1mx3MrkbWsgaSE8nzpKTSYpUxnkiLbwtJEotuSfg=
X-Gm-Message-State: AOJu0YwGTUzX0Q7lG7hA5B4aEp7BhUdvnB4ECn2LSnRcYWKWJyWGoQSs
	+jmcbIoE3dlUXjJ5qyKZUFWxVhVp9jo8uURR58xJgXazEMFLwsRu
X-Google-Smtp-Source: AGHT+IGJpazxnkj0vrfs0qcLRP6qpL8RKPrwMyfkdNMVp4bX1EZv/Ik/vGgVpgkEp8G6HmJcF19Ukw==
X-Received: by 2002:a05:6870:8a12:b0:258:3455:4b02 with SMTP id 586e51a60fabf-26fe5ca588amr5544755fac.51.1723702678720;
        Wed, 14 Aug 2024 23:17:58 -0700 (PDT)
Received: from [192.168.255.10] ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add6b3dsm479443b3a.8.2024.08.14.23.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 23:17:58 -0700 (PDT)
Message-ID: <02d7b8a2-b0d6-4713-b03e-5b22968387c3@gmail.com>
Date: Thu, 15 Aug 2024 14:17:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] use struct ptdesc to replace pgtable_t
To: Matthew Wilcox <willy@infradead.org>, alexs@kernel.org
Cc: Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Brian Cain <bcain@quicinc.com>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Bibo Mao <maobibo@loongson.cn>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Vishal Moola <vishal.moola@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Lance Yang <ioworker0@gmail.com>,
 Peter Xu <peterx@redhat.com>, Barry Song <baohua@kernel.org>,
 linux-s390@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Breno Leitao <leitao@debian.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Hugh Dickins <hughd@google.com>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20240730064712.3714387-1-alexs@kernel.org>
 <ZrzlnIWrnaUx66rY@casper.infradead.org>
Content-Language: en-US
From: Alex Shi <seakeel@gmail.com>
In-Reply-To: <ZrzlnIWrnaUx66rY@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_231801_916941_5ED55A1B 
X-CRM114-Status: GOOD (  17.93  )
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



On 8/15/24 1:13 AM, Matthew Wilcox wrote:
> On Tue, Jul 30, 2024 at 02:46:54PM +0800, alexs@kernel.org wrote:
>> We have struct ptdesc for page table descriptor a year ago, but it
>> has no much usages in kernel, while pgtable_t is used widely.
> 
> Hum, I thought I responded to this to point out the problem, but
> I don't see the response anywhere, so I'll try again.
> 
>> The pgtable_t is typedefed as 'pte_t *' in sparc, s390, powerpc and m68k
>> except SUN3, others archs are all same as 'struct page *'.
> 
> And there's a very good reason for that.  On s390 and powerpc (I cannot
> speak to the sparc/m68k), each page table is (potentially) smaller
> than PAGE_SIZE.  So we cannot do what your patch purports to do, as
> we would not know whether we're referring to the first or subsequent
> page tables contained within a page.
>> Maybe at some point in the distant future we'll be able to allocate
> a ptdesc per page table instead of per page allocated for use by page
> tables.  But we cannot do that yet.


Got it. Thanks a lot for the info!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
