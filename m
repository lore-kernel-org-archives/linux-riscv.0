Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1B5C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 12:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yhAn1X14zh0JiUQJLGwuh45MdLQvvn1GFLcNw6x3PkY=; b=r7tTF5ORoK9a27ffN80lfFvKtO
	LmaPwFf3b13IjOsS3Jt3wcJt3Gk78zIfyo0UCvWXD3nvbT896BcVcCrvtem1/D8snE/51sJgMDUvf
	OqQVg2wh5I+7p+S35/G66fehr28dhJAxA0ouMaYa4E/akCTV7GA9APmjpc9mJSvrm/mDBKBRIE4Ow
	knUmVTOCcAbadnPPALPHWyWAB9FuAp5ni5te+8bDm0DoqqJ/H9zsGRunGfAYwZELnYdQ28R3nsqjL
	F5Gp70ivvQhtl0P14C6ytnIVl+KjZzZyo1uvgdrdlGSxpTWvKbOPVFmpSKiwkgOTG2CFcuOZcD3z5
	tNlEhuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muCgT-003fs5-34; Mon, 06 Dec 2021 12:01:29 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muCgQ-003fqj-3X
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 12:01:27 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so13252114otg.4
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 04:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OLVkuf2VHqBraJN6UKqJW/7pIWk4jCD2gqOAT8Duosw=;
 b=Vh6Q5WDvCjfyr9Q/Kw49rYqcy/UPZCZY5YEmfXwiWvNrGk4VqNfChiPclAfZPQHhDN
 qCZKu+2g84yvnhUhk/i+dm5prq8dBtGhU3jml+YDhbRKV65NZQid1h3UA+6sR4G3t3bU
 M058vxbf1f3zOdhHF4Lr/xPybqpjSkwQ3KvLaI5dipjIP1w0VGg6O7QTA8X5Anq0c30Z
 bdtPPXAz9McLdG832r8qGwGyhIs7t7QBsY0HiIdHK5mQIPB3t45wAjzpaHK8GM4yeWCk
 BJEZU6Xgiw7COGYppK/kcWIp/mZ/JtPul0rm0nPjnYhX1Jg1apc34P+Rz7AcgKu/OtLE
 xmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OLVkuf2VHqBraJN6UKqJW/7pIWk4jCD2gqOAT8Duosw=;
 b=a14kiSn2kNWEEaS/qMmW3/qPyCib/eNK6mKS1Cx6NSJlhD3grZs92g9h7KZE4eccG/
 tFjLUML5RwZ8YpWjrb7/2xL7p3uYvIS5xom1nMaG2x6hha1E/tCLTOOvF+KvVe6Q9Xmp
 rDZZ1ko+Ah2qOe7uQkq3oJC89Yf6TH2c3mqJvpS80oSw9EMrweQSs9ks7O7cRJTXpPDJ
 ZaGT4X5es7Z2Rle+dGY7w5JW2N07C0blcjwjvBzNBYCP6NRMIZrKPJhIR1AgwA5ZxNL4
 oH7HVytZLWNmwBFBq8KN1oafxgBSn1KcZdN8zY4v4r1XYPJlRH7osQrQ9uACDrrPB6Sy
 RbmA==
X-Gm-Message-State: AOAM532X3vzSBrxKo0ABV3ePhFiTk5ghflwyftN+TDQ+gq4vAHHKjvdt
 /SCpU0P1jzwlaQf3jjxo6TNfx4dsLlCLaA==
X-Google-Smtp-Source: ABdhPJzHa/1wotKULJxF+ugrVF/ynN7dBGu2imoZeFzkV1v737ronebjDwExa+7/xQcAn8p0pjhHNQ==
X-Received: by 2002:a9d:4f0e:: with SMTP id d14mr29385451otl.137.1638792083214; 
 Mon, 06 Dec 2021 04:01:23 -0800 (PST)
Received: from ?IPv6:2607:fb90:c29e:6304:f48f:7eff:fe87:20e1?
 ([2607:fb90:c29e:6304:f48f:7eff:fe87:20e1])
 by smtp.gmail.com with ESMTPSA id t11sm2178271otj.24.2021.12.06.04.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 04:01:22 -0800 (PST)
Subject: Re: [PATCH] percpu: km: ensure it is used with NOMMU (either UP or
 SMP)
To: Dennis Zhou <dennis@kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arch-owner@vger.kernel.org, linux-mm@kvack.org, tj@kernel.org,
 cl@linux.com, akpm@linux-foundation.org, npiggin@gmail.com, hch@lst.de,
 arnd@arndb.de, linux-sh@vger.kernel.org, dalias@libc.org,
 linux-riscv@lists.infradead.org
References: <20211130172954.129587-1-vladimir.murzin@arm.com>
 <20211130172954.129587-2-vladimir.murzin@arm.com> <YaZiOnNd6fAnLcxz@fedora>
 <8c2b4666-cf13-3735-be1e-b8a1c71df113@arm.com> <YaqFyznA5hab3PUA@fedora>
From: Rob Landley <rob@landley.net>
Message-ID: <a2473a90-bdd3-b5af-6967-73c59952b7c1@landley.net>
Date: Mon, 6 Dec 2021 06:01:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YaqFyznA5hab3PUA@fedora>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_040126_233635_927B61DF 
X-CRM114-Status: GOOD (  25.90  )
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

On 12/3/21 3:02 PM, Dennis Zhou wrote:
> On Wed, Dec 01, 2021 at 11:51:04AM +0000, Vladimir Murzin wrote:
>> Hi,
>> 
>> On 11/30/21 5:41 PM, Dennis Zhou wrote:
>> > Hello,
>> > 
>> > On Tue, Nov 30, 2021 at 05:29:54PM +0000, Vladimir Murzin wrote:
>> >> Currently, NOMMU pull km allocator via !SMP dependency because most of
>> >> them are UP, yet for SMP+NOMMU vm allocator gets pulled which:
>> >>
>> >> * may lead to broken build [1]
>> >> * ...or not working runtime due to [2]
>> >>
>> >> It looks like SMP+NOMMU case was overlooked in bbddff054587 ("percpu:
>> >> use percpu allocator on UP too") so restore that.
>> >>
>> >> [1]
>> >> For ARM SMP+NOMMU (R-class cores)
>> >>
>> >> arm-none-linux-gnueabihf-ld: mm/percpu.o: in function `pcpu_post_unmap_tlb_flush':
>> >> mm/percpu-vm.c:188: undefined reference to `flush_tlb_kernel_range'
>> >>
>> >> [2]
>> >> static inline
>> >> int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>> >>                 pgprot_t prot, struct page **pages, unsigned int page_shift)
>> >> {
>> >>        return -EINVAL;
>> >> }
>> >>
>> >> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> >> ---
>> >>  mm/Kconfig | 3 +--
>> >>  1 file changed, 1 insertion(+), 2 deletions(-)
>> >>
>> >> diff --git a/mm/Kconfig b/mm/Kconfig
>> >> index d16ba92..66331e0 100644
>> >> --- a/mm/Kconfig
>> >> +++ b/mm/Kconfig
>> >> @@ -425,9 +425,8 @@ config THP_SWAP
>> >>  # UP and nommu archs use km based percpu allocator
>> >>  #
>> >>  config NEED_PER_CPU_KM
>> >> -	depends on !SMP
>> >>  	bool
>> >> -	default y
>> >> +	default !SMP || !MMU
>> >>  
>> > 
>> > Should this be `depends on !SMP || !MMU` with default yes? Because with
>> > SMP && MMU, it shouldn't be an option to run with percpu-km.
>> 
>> IIUC these are equivalent, truth table would not change if is under "depends"
>> or "default"
>> 
>> SMP    MMU   NEED_PER_CPU_KM
>>  y      y    !y || !y => n || n => n
>>  y      n    !y || !n => n || y => y
>>  n      y    !n || !y => y || n => y
>>  n      n    !n || !n => y || y => y
>> 
> 
> I may be wrong, but I think this is slightly different as we're using
> #ifdef / #if defined().
> 
>> > 
>> >>  config CLEANCACHE
>> >>  	bool "Enable cleancache driver to cache clean pages if tmem is present"
>> >> -- 
>> >> 2.7.4
>> >>
>> > 
>> > It's interesting to me that this is all coming up at once. Earlier this
>> > month I had the same conversation with people involved with sh [1].
>> > 
>> > [1] https://lore.kernel.org/linux-sh/YY7tp5attRyK42Zk@fedora/
>> > 
>> > I can pull this shortly once I see whatever happened to linux-sh.
>> 
>> Ahh, good to know! Adding SH folks here (start of discussion [0]). I see you came
>> to the same conclusion, right? 
> 
> Yeah, I don't see anything else from linux-sh. So I'll go ahead and
> apply this with my change if you're fine with that.

I can't test against current until I get some unrelated fixes from Rich Felker
(who's been busy over the weekend), but I tested the "depends" version on 5.10
and got a shell prompt on my "make ARCH=sh j2_defconfig" board.

Tested-by: Rob Landley <rob@landley.net>

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
