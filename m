Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDE7C4743C
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 17:46:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1880C611CE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 17:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1880C611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2AyBKwF5aM6fherndFdKvh89n0CwlJDxke52ejLLn8=; b=G/OWEx8nUHEAW+
	y3zXYfhM50QiXhRQB2VEjQAT+IltQsEPjyz1M85eGdjBoik0c1hkw7+6f6SxQxSl3JlYTo/9Rr6do
	aj3dMFM6447zrivmFqD8cNAujgd/odlTwhKeh+Plz767foehRwZvPjDM2d9W99C6LRSCjY8iDWXxr
	jD6ni+8Zbya0KVqFxm2l3cnlM9KAogqxJ/wAIsGnWiAd0m1vlzByYU70M3O+kSAs4A1ouP0VVs/VC
	chthdt5oVk9ppGwpSYS/DcZQiQJzUMi5K+s9i7ct6q8+HrOhOgzs4x9RPBSHURjWjjm1Xcjuzzch/
	jDCCmn335de3mWvogfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpDtU-00EkA7-M3; Fri, 04 Jun 2021 17:46:04 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpDtQ-00Ek7c-0x
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 17:46:03 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id y2so14756056ybq.13
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 10:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c0jQ6LHez3RP/lYmI6QWvp1COoXeDJHGCUAVhBh30og=;
 b=Jx1r9kp4r9/zhm4TcUeJT+VVRZUq4s3fA2n9RSvyPDQXw0s90sMnIKosVRTaF8XqY+
 j/xQFmuHwQ9rRiWGFEFqLVZASWL5AONk/LjxaFUdb2Ma1kCbNmIzSwvzs2Js7PTANAZ+
 fD+/W0FxN+q6qi5l5wUYItXR3tePMyCL0gQvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c0jQ6LHez3RP/lYmI6QWvp1COoXeDJHGCUAVhBh30og=;
 b=VSltXfszYrymYYLD2NmQlH/ldTJwuzJoYwdR+eUFQuGK1ZFxeHDdRuUzA0+uoj7Df2
 FZTZNEC7zZTowMyojzN33kqu9S3IvEa5QkKMrLc+wnxPrvHFx2lft0AsgsvI852Rpe7r
 v5lBK/BWAEhqZCWkY4RaSO/u21laPzIt8QHE/4ZyxrXLDzRDVc6K3wALBU8k8aPFH4eE
 TTCZ/PspkNhtc33AqGAK6OmVysWU4opXGVtHSPzEJeH8uUeWvG4yFMADLhBywyS/7nfZ
 +gOXA6/3e3+fJxGvlepJqtvMMac56ds7A/o3Vf1woK71buaY6QfV4/u+rZpPu2uuhFbO
 Twrg==
X-Gm-Message-State: AOAM531I2tFUjE8Ao95mPXyVKCa6bQoQVFquZR9aD/KMUU4rYGONiZrZ
 VK+YMCZqoHNJi+uqUQqj/5nNQAvgnHWIaE4XJm5adw==
X-Google-Smtp-Source: ABdhPJxfm9DOEbJard/RMQCUy0MPuzeYvzBSGuoHAw7M3Mfj6MS7Gxssyf+vELiVDnfj5HxfQ2oNUhuu32kMYCvEiEk=
X-Received: by 2002:a25:1b0b:: with SMTP id b11mr6882729ybb.302.1622828756060; 
 Fri, 04 Jun 2021 10:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210604120639.1447869-1-alex@ghiti.fr>
 <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
In-Reply-To: <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Fri, 4 Jun 2021 19:45:45 +0200
Message-ID: <CAM4kBBK467AZ-qhmtREe9mr_bp3QcCEptQcFAApnbrvPc6bkuA@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix BUILTIN_DTB for sifive and microchip soc
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, DTML <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_104600_091054_45D3B104 
X-CRM114-Status: GOOD (  18.81  )
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

Hey Arnd,

On Fri, Jun 4, 2021 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Jun 4, 2021 at 2:06 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> >
> > Fix BUILTIN_DTB config which resulted in a dtb that was actually not built
> > into the Linux image: in the same manner as Canaan soc does, create an object
> > file from the dtb file that will get linked into the Linux image.
> >
> > Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>
> Along the same lines as the comment that Jisheng Zhang made on the fixed
> address, building a dtb into the kernel itself fundamentally breaks generic
> kernel images.
>
> I can understand using it on K210, which is extremely limited and wouldn't
> run a generic kernel anyway, but for normal platforms like microchip and
> sifive, it would be better to disallow CONFIG_BUILTIN_DTB in Kconfig
> and require a non-broken boot loader.

can't quite agree here. If we take XIP, it does make sense to have
BUILTIN_DTB, since 1) this will not be a generic kernel anyway 2) we
may want to skip the bootloader altogether or at least make it as thin
as possible and 3) copying device tree binaries from bootloader to RAM
as opposed to having it handy compiled in the kernel will be just a
waste of RAM.

Best regards,
   Vitaly

>       Arnd
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
