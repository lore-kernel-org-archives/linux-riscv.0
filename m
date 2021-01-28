Return-Path: <SRS0=TFiT=G7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887BDC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 17:28:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CCA361481
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jan 2021 17:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CCA361481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1ebXC1c+UsDuImE7zqYfwynTC4KmIEUXyyGVMKUwNoY=; b=ePV5Sgwp8rmUWDXcJW74plaC6
	z+pHDWDpU6l87yAhVoCSbPFbsP555beCM2jWJ/9MJAI1jjgzajOiPrIfHAXLofMBJ4lxfcUYobYe/
	0q9mTvgkSNlNx1a/VrIpuSDD2pyTMuo55rgMm12q707BfqZ3JCB0ZFpf5vNTSzM6H2aos7Jx/lBMU
	gWVDIgc4QLlVejduj89e8duHdpEAcCl8OJtfd9j6H+lX+aGwBlcVGV10TW/We2g7ZN9H0dS6OasLY
	u93y1rWnS1BJKOHMwlclQ4LfE7Ayve+5KjVsyzXAjALQCL2/KEYYqamIfB6KoQqY3dOqT5MY3fnYM
	badimA7TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5B5K-0004L7-Pw; Thu, 28 Jan 2021 17:27:58 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5B5G-0004Jb-Lx
 for linux-riscv@lists.infradead.org; Thu, 28 Jan 2021 17:27:56 +0000
Received: by mail-ej1-x629.google.com with SMTP id by1so9014891ejc.0
 for <linux-riscv@lists.infradead.org>; Thu, 28 Jan 2021 09:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QosST7j4l1ljXzY+3djf7Hi017sCNw0ib1djAQPlF10=;
 b=VHpnpcTumkVPV+DBvq46kW6shUt0mJwFGO5HVq5K/D0NuagbejoWu9ns95BEX8A9ns
 C3aLrfbwEBwwtpS1H8Xdtf7dJkiOjNm2MosdVyMYtML8fYXkPLFmASO3XkGbVJnWkG8X
 fcUK5Mx7nQIbZ8bouvbdOK5/PQRo0jj5re59EffIlnjIFi3KWZy5JwfRnSOloroN6Y3I
 71jI6HMp2OX6zYxO9479BOUxCwZQ3PXk3xVnALXww7rua3XG1O6KerGTXVmZSQdYumWh
 WuDzgizKb7lynLEEv4J9NWfNvC25Bdk1p6QGL1ul2K0TkFtysL4jkqUq38fYmPuC19DO
 zYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QosST7j4l1ljXzY+3djf7Hi017sCNw0ib1djAQPlF10=;
 b=pMz5jw9xvrV0+ARe67EbtKHbQlkPxQxVyrhGSrPByMGdlWV7Rdmd07+QAo4T+BdWYT
 Sg2+F6uMNj7RoONz0M6WKG6UjcLZAqf7suvuRSqa7n+7uryW1bXjh13HMCSa8TlwrDk/
 9EfMac3OZNtK03986whBFuYz2Z4uBbinVj2x0YPzOMnNdPqceYnXV4yjWbVCMZPblIfm
 4efLz5ymDl5r3uVICsmjE50tvLOU0vj9s0nugnXQkndCSmYmKeLbbdaAQMLCpqVhoTgk
 dDao0m7UI9aW/XseCHUKFw4erl6/Oo70VO3pgA8Jt9fJDckrA7e1BnI91Hk7h/pVn9J8
 bLYA==
X-Gm-Message-State: AOAM533t4V80os7N9BN4w1qrGkIAcif78kSTmGMfK+6SxmeG/kyvJt/J
 PKeaWMZif1TfRP1Y6Khb/ZS6yda/8W11sRI1wQ4jCw==
X-Google-Smtp-Source: ABdhPJwI1ecVhIjuGu8sBmhkXt4myAABJcYO8AXi0IUBZfW1pptS1v5hWwtNcgxFFUl4Oc54eochR40aoUKuHqzEszg=
X-Received: by 2002:a17:906:4c85:: with SMTP id
 q5mr418962eju.375.1611854873287; 
 Thu, 28 Jan 2021 09:27:53 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYta_uOLktmMnZHUTK9Uqx-rjtmQSSvHFCsvQsVdZDdm8A@mail.gmail.com>
 <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 28 Jan 2021 22:57:41 +0530
Message-ID: <CA+G9fYupjtPhynZSRG36vr_n8Vsjp9u_wWdf7bAzEwnBikhy2w@mail.gmail.com>
Subject: Re: [next] mm/nommu.c:1671:6: error: conflicting types for
 'filemap_map_pages'
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_122755_048323_B4EBDE4F 
X-CRM114-Status: GOOD (  12.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 linux-mm <linux-mm@kvack.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Geert,

On Thu, 28 Jan 2021 at 20:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Naresh,
>
> On Thu, Jan 28, 2021 at 3:25 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> > arm, sh and riscv architecture build failed on today's Linux next tag 20210128.
> >
> > FYI,
> > # CONFIG_MMU is not set on these failed configs.
> > config file attached to this email.
> >
> > make --silent --keep-going --jobs=8 O=/home/tux  -
> > build/.cache/tuxmake/builds/1/tmp ARCH=arm
> > CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
> > arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
> > mm/nommu.c:1671:6: error: conflicting types for 'filemap_map_pages'
> >  1671 | void filemap_map_pages(struct vm_fault *vmf,
> >       |      ^~~~~~~~~~~~~~~~~
> > In file included from mm/nommu.c:20:
> > include/linux/mm.h:2578:19: note: previous declaration of
> > 'filemap_map_pages' was here
> >  2578 | extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
> >       |                   ^~~~~~~~~~~~~~~~~
>
> Care to give "[PATCH -next] mm/nommu: Fix return type of
> filemap_map_pages()" a try?
> https://lore.kernel.org/lkml/20210128100626.2257638-1-geert@linux-m68k.org/
>

Thanks for your patch.
The reported build issues got fixed now.

- Naresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
