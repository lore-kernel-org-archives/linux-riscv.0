Return-Path: <SRS0=IJcX=SV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB93FC282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 07:23:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9D8A21736
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 07:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I5OwqipQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pFkplIc7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9D8A21736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fGHC0g3Yv/gAQviDuajwF9D1yFbQf1BbeH9kv3v3xv4=; b=I5OwqipQYPYcHKMAyUpwkY6/T
	WDm4rTtbM+X/g1CuYOij6zP6p3uBrLZfHqcBJF5Eh/3+0Zk+LwqOvOYRlkMBW2HcEzKbFLkNj49XP
	zH8ph/yegc206zX5GaW68GwFdRQIAcyS0mUQoUcrpXrA3wkdFd9q6Oo6bQ353RqA/wtM3FKOBX4Pd
	RFzT1n8DhnabaiYMn3hxTaEAfMcCSi6mAdbztgcj8I3cPmgr5E0mgyI7Tc9Q2y8xX1L1sZFWcO+t2
	42bDK6wtNX9+5wnziPlx3/MYZD6Nhx294qoPRt1NP3I4QHtKwHoHVod3nYrEdJmCvaaBHhFe6MYfk
	zNXV45KEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHNrM-0006tV-Se; Fri, 19 Apr 2019 07:22:56 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHNrF-0006lx-Lv; Fri, 19 Apr 2019 07:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pLbKEWX3KLQG4g9IcO72nGPPB8USEyEFpeVB06WUSPY=; b=pFkplIc7LzkrV8joFTtOIgIiTY
 Fod0Ouq9NVOtroKlUP2yvYT1i8HH0KYpG6IoADoIkQesIyMlTTH9NyOUHILZs5VSRb8Y90bLT8XL2
 7ff3TICYPXIUVzY9YWpSIS+dl82F9DzSOMR4m/kswbqy3iV9J4Xy3oD/RZeWrFLFoM+8ApLSFv3sC
 xW+tPgiKUPP1WMmf2gRE0Xw4m2IugLguwKlNS7Fls6tzI68bRSKReCEbhst8Zbu7Q7q+11Ddko0o7
 JyLxN/Hv+NPr5CwB4Jxvy42+mW9HdaMCENOZ1RIz5mi7UvbnGnnzxVARU7zATAgg5EL3Ph3eW4+bA
 Zk8qOYXQ==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHNrC-0004Hm-IT; Fri, 19 Apr 2019 07:22:47 +0000
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id F1A80240006;
 Fri, 19 Apr 2019 07:21:51 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v3 04/11] arm64, mm: Move generic mmap layout functions to
 mm
To: Kees Cook <keescook@chromium.org>
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-5-alex@ghiti.fr>
 <CAGXu5j+NV7nfQ044kvsqqSrWpuXH5J6aZEbvg7YpxyBFjdAHyw@mail.gmail.com>
 <fd2b02b3-5872-ccf6-9f52-53f692fba02d@ghiti.fr>
 <CAGXu5j+NkQ+nwRShuKeHMwuy6++3x0QMS9djE=wUzUUtAkVf3g@mail.gmail.com>
Message-ID: <365fe520-b14a-c792-9961-c18f79edfe13@ghiti.fr>
Date: Fri, 19 Apr 2019 09:20:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAGXu5j+NkQ+nwRShuKeHMwuy6++3x0QMS9djE=wUzUUtAkVf3g@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_032246_739272_F9FD78C7 
X-CRM114-Status: GOOD (  23.87  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 Paul Burton <paul.burton@mips.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/18/19 10:19 AM, Kees Cook wrote:
> On Thu, Apr 18, 2019 at 12:55 AM Alex Ghiti <alex@ghiti.fr> wrote:
>> Regarding the help text, I agree that it does not seem to be frequent to
>> place
>> comment above config like that, I'll let Christoph and you decide what's
>> best. And I'll
>> add the possibility for the arch to define its own STACK_RND_MASK.
> Yeah, I think it's very helpful to spell out the requirements for new
> architectures with these kinds of features in the help text (see
> SECCOMP_FILTER for example).
>
>>> I think CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT should select
>>> CONFIG_ARCH_HAS_ELF_RANDOMIZE. It would mean moving
>>
>> I don't think we should link those 2 features together: an architecture
>> may want
>> topdown mmap and don't care about randomization right ?
> Given that the mmap randomization and stack randomization are already
> coming along for the ride, it seems weird to make brk randomization an
> optional feature (especially since all the of the architectures you're
> converting include it). I'd also like these kinds of security features
> to be available by default. So, I think one patch to adjust the MIPS
> brk randomization entropy and then you can just include it in this
> move.


Ok that makes sense, and that would bring support for randomization to
riscv at the same time, so I'll look into it, thanks.


>> Actually, I had to add those ifdefs for mmap_rnd_compat_bits, not
>> is_compat_task.
> Oh! In that case, use CONFIG_HAVE_ARCH_MMAP_RND_BITS. :) Actually,
> what would be maybe cleaner would be to add mmap_rnd_bits_min/max
> consts set to 0 for the non-CONFIG_HAVE_ARCH_MMAP_RND_BITS case at the
> top of mm/mmap.c.


Ok I'll do that.


>
> I really like this clean-up! I think we can move x86 to it too without
> too much pain. :)
>

Yeah I think too, I will do that too.


Thanks again,


Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
