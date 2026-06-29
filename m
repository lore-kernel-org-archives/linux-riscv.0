Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00863C43602
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 12:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+Emvm2ExtjPsMYhmC8XabMNQZ0AuHEqwdDQeOWCl94=; b=w656RkvbRJtM2s
	CcBf4Aa5v4v02+iNCjlu60ofjFSAQCujQd18kWwKvGp41Ky4J8P4Q29W4QlBthuWyLhjRTn3nCkH8
	ydmlZ6vTRPlb8X+0NIO5Q6M0qhDBHhKtS5EREN9XcB4vfvPH+IdaV9V08VQkPVJf+rmaJeY1WGTb9
	FzPXfwyJSxVWVONsBg25DAfThJ4fjyBOVMWx0mFVggSr3GPXwcG9/e0/9UqH59piOoHQdSfuZupCU
	opNZ8ibNoXTdYKDhJo7b/ADVao+2YSQEl7vKWTWSI1ljAu2Oyoz1Ke0FH3YT10GfioquEQmUiGesX
	nF5MdLnI1rRECriKpJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBOQ-0000000Ebtx-2Z9W;
	Mon, 29 Jun 2026 12:47:18 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBOO-0000000Ebsr-1jAn;
	Mon, 29 Jun 2026 12:47:17 +0000
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 65TCYlVH219229
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 29 Jun 2026 05:34:48 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 65TCYlVH219229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1782736492;
	bh=F5eNBCeca9FFTuFbHhVBFOemJYWYzDmHgzejZkXlIwM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ItDa3yOyOnzgUJtBSZCdhS4zlYRD1XzlbHnWBCrsgDuyOKDQnLXWfugxh1RYrcnHj
	 Wo6d2ASe4aa2kENlvakDGwv3s+KtWwghI1YzuSK4mfraTOB1p7+BurPnKzbMpbQKQL
	 FArnwwcKd8vhlMO88QNlKM8z1OAEuHhiE7bWCyq/7xJ09JZm9//17j5avtQhx3ZQCW
	 62VMIArJVSZ3KSFw9+v6qyIZPgiOE1KxeelvfNkr5eljLOhZuntNE2qq7OnkyMcON6
	 lCC018LGMBA4PoGUZ03daik0PWEEF4Ej3Y7mFmcxCoVSXT9w4uUsvXWEvA5Jy73wT+
	 n9LoSC8sobApw==
Date: Mon, 29 Jun 2026 05:34:41 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Christoph Hellwig <hch@lst.de>
CC: Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
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
Subject: Re: cleanup the RAID6 P/Q library v3
User-Agent: K-9 Mail for Android
In-Reply-To: <20260629122152.GA21344@lst.de>
References: <20260518051804.462141-1-hch@lst.de> <20260518141205.c100f76eec5f58e78bbbf7af@linux-foundation.org> <20260519082432.GA14956@lst.de> <7d8efc7c-65e3-49f8-9381-910de7affef2@zytor.com> <20260629122152.GA21344@lst.de>
Message-ID: <8684FEC2-AD56-4BDA-874F-1D3D7170F880@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054716_458364_4332EA29 
X-CRM114-Status: GOOD (  14.85  )
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

On June 29, 2026 5:21:52 AM PDT, Christoph Hellwig <hch@lst.de> wrote:
>On Fri, Jun 26, 2026 at 05:52:18PM -0700, H. Peter Anvin wrote:
>> On 2026-05-19 01:24, Christoph Hellwig wrote:
>> > 
>> > raid6: rework registration of optimized algorithms
>> > 
>> >  - avx2 instead of avx512 is probably the right thing for no
>> >    benchmarking, but if it was intentional (it wasn't), that should
>> >    be document.  So I'll just switch back to the previous version to
>> >    keep the state of the art
>> 
>> It is unlikely to be the right thing *going forward*, though.
>> 
>> The very unfortunate performance inversion is likely model-specific. It is one
>> of those things where you largely would have to have a list of quirks :(
>
>Note that the default is still to benchmark the implementations.
>This is just about the case where the user explicitly disabled that
>benchmark-based selection.
>

The real issue though is that the benchmarking isn't really helpful, either. 

It has to do with power across the whole chip, so it perversely enough depends on what *else* is going on...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
