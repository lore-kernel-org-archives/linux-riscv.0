Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49069C43458
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2026 01:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ur0HqELIqSYSbbfbCX+E9FzxxGd2IgLMbOLmqKB8Wc=; b=BWSydD0MMrE1QW
	xAJH77MlF1IKOInS/Do5i63M1moTBdG8cHCiDChYBULn/0ZAWVITethQhe3jNrp2bswgRYcymAVgD
	QL7KAVi73p8KIMmBZjboPXy1UKygUihKysaK1oDEsfxuucgU9JH7xVVSsnArGXtsWxviIhKod6eD/
	3mlNgF3ErkBblLfw9Bpb7Csv/oJ/OIHv8eN7z04OOFl0fdORBV881HPhK6/sCOro6s2y1osUacfLj
	HfRNL296axVcBmrAS0aFnItRjX1CggwqCBwZWEgvkOTNs8tZSuUUe1HgXARBrBEZkvdNpJI2nzKXr
	56r6lLVp8EbCjZE05sDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdHyK-0000000C3WU-231F;
	Sat, 27 Jun 2026 01:36:40 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdHyG-0000000C3W5-149k;
	Sat, 27 Jun 2026 01:36:39 +0000
Received: from [IPV6:2601:646:8081:7da1:dcd4:e1f8:5d79:bdb4] ([IPv6:2601:646:8081:7da1:dcd4:e1f8:5d79:bdb4])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 65R0qN0N2285168
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 26 Jun 2026 17:52:24 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 65R0qN0N2285168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026052701; t=1782521550;
	bh=CoKSivJMaQDV2sSkRTRw7olGkcZfQ72Xwmih/Aa0td0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qMyBFc1gnGXRksBwsJ1/rUznZgiE7lPuLPv/lWpmOM+5Q3Fqu1GkBtPV/i01hTsmm
	 FyrrwODPBIMXlAoyCpEVfCiClmUhwPWsNagz78j3LDMf+Ut0XXJAAidVe9l1aTOAut
	 7WQuEQASgzET2NWeiLHKYC5brvZfsPACaGhvlYNW5X1iG8c+02aTJiS4yaJSFbtRty
	 RzVpKhz70FSqCBKm8TK2gLW8sDPukFdgs1lqJ60AGqtpglwDIA/PnerR6f0L+dvu0f
	 tzL0aZnBm0Ed9q+Fj1E4zhVGr5LPAVMhZk4GFV4YP0Rst/9nwzTfe9CuWNPpW58FjU
	 Q8Foj51/YA5sw==
Message-ID: <7d8efc7c-65e3-49f8-9381-910de7affef2@zytor.com>
Date: Fri, 26 Jun 2026 17:52:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: cleanup the RAID6 P/Q library v3
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Song Liu <song@kernel.org>,
        Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
        Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-raid@vger.kernel.org
References: <20260518051804.462141-1-hch@lst.de>
 <20260518141205.c100f76eec5f58e78bbbf7af@linux-foundation.org>
 <20260519082432.GA14956@lst.de>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260519082432.GA14956@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_183638_479962_81B51C68 
X-CRM114-Status: GOOD (  10.50  )
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

On 2026-05-19 01:24, Christoph Hellwig wrote:
> 
> raid6: rework registration of optimized algorithms
> 
>  - avx2 instead of avx512 is probably the right thing for no
>    benchmarking, but if it was intentional (it wasn't), that should
>    be document.  So I'll just switch back to the previous version to
>    keep the state of the art

It is unlikely to be the right thing *going forward*, though.

The very unfortunate performance inversion is likely model-specific. It is one
of those things where you largely would have to have a list of quirks :(

	-hpa


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
