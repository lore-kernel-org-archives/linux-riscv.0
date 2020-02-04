Return-Path: <SRS0=IMUx=3Y=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858D4C3524A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2020 07:19:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57EA121582
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2020 07:19:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ISylCz1q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGEdHFh3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57EA121582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bbpjRAo82vzFqtqf80M6Cq+Rki5jZeSy49ZzMJwlj4=; b=ISylCz1qXzH8NV
	Pa4temMCdp9nDDFcgGypnod53eBBhE4i9o5cLf+TipqvsCXZ3hLIDfXtes4Z8HuCYqsbFU4GPgNbn
	xgagxvbFNeIYxpF+N6hPM6l3EQvhLdSidXIPMH6LhQaFQP8K53rRP/SfIiCHn9D2OQRZMl7DPAWGL
	5JE2oT0Gtq/Yj7211G8f0D6zErnRPT8Zz3y5udgHAxu//Jdj/UVCF1I3qWZde2QFf0v66BR6bqgqt
	yvrHw4CB8wj8cPEQ40Gviw/1A5DvPnr9mALEBLDdyyTMqT4iFjvRq7ffL915sYO7stG8I69ob6XFb
	hI3W0fEU8RbDBxAmJ0NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iysUu-00067B-AO; Tue, 04 Feb 2020 07:19:48 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iysUr-00066c-3b
 for linux-riscv@lists.infradead.org; Tue, 04 Feb 2020 07:19:46 +0000
Received: by mail-lf1-x141.google.com with SMTP id 9so11446329lfq.10
 for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2020 23:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1bbpjRAo82vzFqtqf80M6Cq+Rki5jZeSy49ZzMJwlj4=;
 b=nGEdHFh3K69PiMayvAgQBFkio4CyhWe6aPyQwVrj1ubeHquHxegmnH4dnKD2eZeABT
 H5YwoxbsKVTcq0ft3LbYFzNd1bHmhoAEvZEUASQNTnK5GgmBiNmwVEOXi0esReXbM9bW
 4/sNevTsNAQ+RoxgEKGlVzm07I2fedwg+Ik7LhSexdnhph0epaQeltCAPm6nxELZEHbb
 3Fx9kDze00qwA0/qANLBb/sh1rJ3S++U0FLAccgRwbg9McJezLMzYFr4/EvU6cw/xuJi
 FESfuLsonzeDOfLo/T/BoV3e6FXt3Q6iUEPt5ziGZfGfnDBrsvvARdsuIp/CtgzIdiLk
 fUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1bbpjRAo82vzFqtqf80M6Cq+Rki5jZeSy49ZzMJwlj4=;
 b=CTj74/GoM0PcEVlahmXEEH8npvM7HckpqxcKVbw2Z6KQA89257Xo1xF5id+ZvZxEto
 q/BMDCeyHTaJWqXkWVhDxvSg657ZQEPItiiavZ2TlkSyhE9TM0Im5hIMqh9ksuovqmwD
 Yp/f8zaoIqTrwZ1hZ2J3t9h70rTvOV9mgkcEAgyYdJ/pcpM/hLAv/2x3ex+KQAvF8kF2
 vtW1coVCiuaA4Wxe/ejc5SLwLACmAzf6HTFn48HI35fi3LTavQko0EUt1QdVnZ/nhpO6
 LhFtN+qmrXIMsv9U5+p0P4to/3f+rgrdkGe5IbGiHvQD4AzWy72c1cqKycT/rhwe9BEs
 sQ9A==
X-Gm-Message-State: APjAAAWNklEnB9gHnPmslGIv2lZ4GPoC53B1Mmx/qj6dhyED5OXsSg9n
 L/DNqaoH04MUbrZYZxIWJALKMnZ0t2FFPUHnl7I=
X-Google-Smtp-Source: APXvYqxCXDVJ8lYkwC87xj8it9nbwZd9QQ9o8YlYOgGX0pdoBk2rZMVVQmb4AH82/0kW6pj9SOWv4fV3zOrcGZ1t9rQ=
X-Received: by 2002:ac2:5f65:: with SMTP id c5mr14417872lfc.207.1580800782148; 
 Mon, 03 Feb 2020 23:19:42 -0800 (PST)
MIME-Version: 1.0
References: <CADnnUqfhxWN=cyyr0QQyKrrO13LuDFS9NTqOLwm10CnwB3sDXA@mail.gmail.com>
 <alpine.DEB.2.21.999.2001300259070.23963@utopia.booyaka.com>
 <CAEn-LToMfm=G80TmGQZefpmKhKvpGy_=XOoBLGU0a_77ahY+_w@mail.gmail.com>
 <20200131201118.GA4121429@aurel32.net>
 <CAAhSdy03C==7PmuXE441BtDJH8H07rOH-u+-_sZJG70tbTrJcA@mail.gmail.com>
 <d868acf5-7242-93dc-0051-f97e64dc4387@ghiti.fr>
 <33c9a276-6212-115c-c7c9-e62244f13c76@european-processor-initiative.eu>
 <CABvJ_xiWDZfO6fOd4Roiy-yaUVFKrGEcBDBSWsvj2TKGGMjy0g@mail.gmail.com>
 <CA+ZOyaj16M5q-g4wZ60MuUs4q1AfCB48wd+AN4TTJNu8K4NZRA@mail.gmail.com>
 <68bb87cb-50d7-5e85-37f4-ad2cc44865f1@ghiti.fr>
In-Reply-To: <68bb87cb-50d7-5e85-37f4-ad2cc44865f1@ghiti.fr>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 4 Feb 2020 15:19:32 +0800
Message-ID: <CA+ZOyahEPtuNqgSUHVcZpZp3WP3oX4jFOiqJvO827ye4+1DT8Q@mail.gmail.com>
Subject: Re: Error on loading some network Kernel modules
To: Alex Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_231945_148977_138A0465 
X-CRM114-Status: GOOD (  28.24  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Anup Patel <anup@brainfault.org>, Carlos Eduardo de Paula <me@carlosedp.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Romain Dolbeau <romain.dolbeau@european-processor-initiative.eu>,
 Zong Li <zong.li@sifive.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Alex Ghiti <alex@ghiti.fr> =E6=96=BC 2020=E5=B9=B42=E6=9C=884=E6=97=A5 =E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Zong,
>
> On 2/3/20 10:55 PM, Zong Li wrote:
> > Vincent Chen <vincent.chen@sifive.com> =E6=96=BC 2020=E5=B9=B42=E6=9C=
=883=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=
=EF=BC=9A
> >> On Mon, Feb 3, 2020 at 12:27 AM Romain Dolbeau
> >> <romain.dolbeau@european-processor-initiative.eu> wrote:
> >>> On 2020-02-01 14:59, Alex Ghiti wrote:
> >>>> Why restrict to 128M whereas we have 2GB offset available to the end=
 of
> >>>> the kernel ?
> >>> Isn't that 2 GiB offset to whatever the module requires in the kernel=
,
> >>> rather than to the end of the kernel space?
> >>>
> >>> Is there some guarantee that symbols accessible by modules are at the
> >>> end of the kernel? If so, wouldn't the maximum offset for this patch
> >>> still be (2 GiB - <total size of accessible symbols>)?
> >>>
> >>> Cordially,
> >>>
> >>> --
> >>> Romain Dolbeau
> >> It took me some time to find the root cause of this problem, please
> >> allow me to share some observations before the discussion.
> >> The root cause of this issue is that the percpu data is declared as a
> >> static variable. The "static" attribute will make the compiler think
> >> that this symbol is close to the .text section at runtime. Hence, the
> >> compiler uses "auipc" to access this percpu data instead of using GOT.
> >> In this case,  the access range is limited to + -2G. However, in
> >> practice, these percpu data are placed at a pre-allocated region
> >> created by the memblock_allocate() function. In other words, the
> >> distance between the pre-allocated region (>PAGE_OFFSET ) and the
> >> .text section of the kernel module (in VMALLOC region) is much larger
> >> than 2G.
> >> I agree that the original patch,
> >> https://github.com/bjoto/linux/commit/8a56d1c8e8e91c1bc3893946d52b9217=
c96e1589,
> >> can solve most cases. However, I do not think the patch still works if
> >> the kernel module region is determined by _end or <total size of
> >> accessible symbols>. The reason is that the pre-allocated region for
> >> module percpu data comes from the memblock function at runtime. Hence,
> >> we cannot know the actual address of this region at compile-time, and
> >> this issue probably may occur again in this case.
> >>
> >> By the way, I think maybe we can refer to the implementation of MIPS.
> >> 1. For general cases, we can use this patch to solve this issue.
> >> 2. For a large kernel image (>2G) or enabling the KASLR feature, we
> >> may need a new code mode to deal with this issue.
> >>
> > The range [&_end - 2G, VMALLOC_END] won't be suitable when KASLR is
> > enabled. Unless we limit the randomized range in small area, the
> > module region start address will be bigger than VMALLOC_END.
>
>
> Actually, the relocatable patch I proposed already moves "everything" up
> at the same
> time: the kernel itself but also all the "zones" below (vmalloc,
> vmemmap, fixup...etc)
> since all those zones are defined from PAGE_OFFSET that is now dynamic.
> So the modules
> ill remain at the same offset to the kernel, unless explicitly
> randomized in the vmalloc zone.
>

OK, it makes sense. The module region moves along with kernel seems to
stay away from the concern I mentioned.

So now, the problem is that the pre-allocated region of percpu data is
located after _end symbol as Vincent mentioned, the 2G distance seems
to be too far for module region start address. (i.e. &_end - 2G).

>
> > So if we
> > divide a region into module use, we also have to provide module
> > randomization at the same time when KASLR is enabled. It good to me if
> > there is a new code model to use GOT for static variable, everything
> > will be easy.
>
>
> GOT usage seems indeed to be easier, but it seems a bit overkill to me:
> arm64 already
> uses the range I proposed for modules (arch/arm64/kernel/kaslr.c,
> module_alloc_base
> definition).
>
> Anyway, even if GOT is chosen, it won't be anytime soon right ? So we
> could, for the moment,
> constraint the modules to be close to the kernel with any range you like
> and that will still
> work with our implementation of KASLR.

Yes, I'm with you on that, we need a resolution in kernel first.

>
> It seems urgent to fix those modules loading issues for 5.6.
>
> Alex
>

