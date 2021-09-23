Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06645C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 16:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C300C60E9C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 16:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C300C60E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=teaUVANUGy1Wgx/CrvT2Ff3lenHp6aCIJI3f0d+mTws=; b=OQvfkA15SnIlwy
	Be8x6tM2pXqZt5SifEt051Ees9fZuIayjDi0wPcmDYxDLLrx9vu1wfKhwzlwD5SzT4QKMnxO8NDIo
	B6e6Pct+E/hJkoivwJhKZuHqho80Q6SUJtZqfM9vl47kZ+QZf08dJTcaIbOjppz5ZZRaV49T5wLrm
	oHNtHf7kxYCyDp26Kp0ImTUmt0nnhvW2LVPGSyRzdRUgj3PWkFgfl35YzEPc4DeINoBbCAO0zNJpC
	dzqwDfJkAiaWcwr7vDn3hCzmpCVJWldWPrSGCrZXOIvRuS+a6bfVKJdok8/4KLVamsnhfyeRCil77
	F3dwTS5Aoy7ziHHk/Qyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTRB4-00C6mL-HF; Thu, 23 Sep 2021 16:02:26 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTRAr-00C6kK-Va
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 16:02:15 +0000
Received: by mail-lj1-x231.google.com with SMTP id a20so202074ljq.3
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DLOxhnwH/JaVIhRbDcxcZPpiYGHLJbtd0CRIGAWnOsw=;
 b=QMXOiJ6n28J2emY/y7cY9+DD4h8Pn0KRvNWmJxYGi/2iw91Mhhsv5k4E/yi6SvFmH+
 cwsdxpHCcIaSp+pnaMQx9j8vfDg38b4ujoTb2lzS4jvwjrgaoWuJfcNbrdzMUshkRDfy
 wyxZpTZP4dsY0GDCSs5bbcT3wFiFu+kSB/Akk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLOxhnwH/JaVIhRbDcxcZPpiYGHLJbtd0CRIGAWnOsw=;
 b=6lTxDg/FZELmLnfA8yEvnAF4km1Ry2DRqsOcjaNim+fNv77BnGzrdm6A+n0mtelwW7
 mdjqZP97m4R/RGlmsBNeG3HFiCvpmgdTcmE7wscItFnzOxwxCLDDresSMQ1M48Byj2gq
 1ptDGXW/5Gh5QlEx31jFSuSjqEpRSLrNbwkaafDf0v+apdOpj1kplbE2WQz8NGHNElJK
 gfuDAvQyXnLOsDYjrMWNefHLiKoyX21EdgaNIOcsHGOPVGWbUrEBt0FMGfn10m50ueKA
 oDdESb1Ob5YJ5/x60Gm/ap+omYvHHj+FHjbsm9dmBW1BMDJCI1Ba24L/7iVemlR81rSv
 6VTA==
X-Gm-Message-State: AOAM5311zTdsTc2s3dVEAYLaEwjYaTf63ymtKxHPfY0OIhH8CyxgLDJM
 PyjuCyu8kZPRXw2Dn5VDHlk3PRdwzNdmCkCo
X-Google-Smtp-Source: ABdhPJxzJW2IFOtAw5pin6FchlJ6gmkv1cLgjH+7US2tKGPwRf8tB7D3PbGUSPcmlROXR3h0nUlE2Q==
X-Received: by 2002:a05:651c:2de:: with SMTP id
 f30mr6271110ljo.129.1632412931327; 
 Thu, 23 Sep 2021 09:02:11 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170])
 by smtp.gmail.com with ESMTPSA id x23sm489283lfd.136.2021.09.23.09.02.02
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 09:02:05 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id u1so201206lje.12
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 09:02:02 -0700 (PDT)
X-Received: by 2002:a2e:3309:: with SMTP id d9mr5950451ljc.249.1632412922441; 
 Thu, 23 Sep 2021 09:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210923074335.12583-1-rppt@kernel.org>
In-Reply-To: <20210923074335.12583-1-rppt@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Sep 2021 09:01:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA@mail.gmail.com>
Message-ID: <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA@mail.gmail.com>
Subject: Re: [PATCH 0/3] memblock: cleanup memblock_free interface
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 devicetree <devicetree@vger.kernel.org>, 
 iommu <iommu@lists.linux-foundation.org>,
 kasan-dev <kasan-dev@googlegroups.com>, 
 KVM list <kvm@vger.kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-efi <linux-efi@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 linux-um <linux-um@lists.infradead.org>, linux-usb@vger.kernel.org, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-sparc <sparclinux@vger.kernel.org>, 
 xen-devel@lists.xenproject.org, Mike Rapoport <rppt@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_090214_079128_3F2117ED 
X-CRM114-Status: GOOD (  13.46  )
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

On Thu, Sep 23, 2021 at 12:43 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> The core change is in the third patch that makes memblock_free() a
> counterpart of memblock_alloc() and adds memblock_phys_alloc() to be a

^^^^^^^^^^^^^^^^^^^
> counterpart of memblock_phys_alloc().

That should be 'memblock_phys_free()'

HOWEVER.

The real reason I'm replying is that this patch is horribly buggy, and
will cause subtle problems that are nasty to debug.

You need to be a LOT more careful.

From a trivial check - exactly because I looked at doing it with a
script, and decided it's not so easy - I found cases like this:

-               memblock_free(__pa(paca_ptrs) + new_ptrs_size,
+               memblock_free(paca_ptrs + new_ptrs_size,

which is COMPLETELY wrong.

Why? Because now that addition is done as _pointer_ addition, not as
an integer addition, and the end result is something completely
different.

pcac_ptrs is of type 'struct paca_struct **', so when you add
new_ptrs_size to it, it will add it in terms of that many pointers,
not that many bytes.

You need to use some smarter scripting, or some way to validate it.

And no, making the scripting just replace '__pa(x)' with '(void *)(x)'
- which _would_ be mindless and get the same result - is not
acceptable either, because it avoids one of the big improvements from
using the right interface, namely having compiler type checking (and
saner code that people understand).

So NAK. No broken automated scripting patches.

               Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
