Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2A5C48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 19:22:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA0896109D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 19:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA0896109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpDarpgED2deLXYx5rJE9C6WF0OHwhZ/8ErlnKmNd1U=; b=5F5TKx3FQjficq
	xRopTd3oJ9dpJ+wWNi4R6ynnUhh1B3NEZkPqpQA7l3trp9oIAA1hqGmH4dt23tNKOiHnOlaDhye49
	Q2z2P5i1k/bSPvHkS7zyxBKBSZqcq1jeCexeNisQhMaIXpoXjgSGUi9kiv6lIv/rDroOw4lkMCqh1
	ErrrUFdTBqVw3+DKAAwwIdSIhgcqZd3yF7DPtG/fZ/weMpHft4mIJ2ci1mCObENTBcCxCB6ggAMIp
	qTFyV9SAZIYPamC2ROdOW5Asa6/K287BqWjF93hqQFAFoOxmFAfBQc8lzPVHwy5C7g1BGZ5/+wCKS
	EQRCl+A0WbFazswrhvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltEdK-002OoX-0f; Tue, 15 Jun 2021 19:21:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9CQ-000ByJ-77
 for linux-riscv@bombadil.infradead.org; Tue, 15 Jun 2021 13:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sMoUsP+kTPDRNp3NldXN+6OEKu9qLojvf+qqhyJ9SvI=; b=BGCUbL9CneC+8g719l+bOKscEP
 bVkqqB2EyaP86PqtjxtX3alMNuIHv3IInqAFydnEG6BJE9Rc5556haKXsGOuTudWqlDIFKIh3+fJc
 /YBpFkAUlHtijb+4M9W1JToA0jHU7kI5oo0eSEj6KPcwcstyOt+7w+FfLjsDxHXp4K4hCm1xrgfDN
 HFkzHoSmyVpV6ZUGD/VAPQdPxoAb9OHbgDKSWNFuGd3keTeh5/+32AiWfyyLNSjgYcJDzfHJEmhNu
 ASz7LhuOB71h6fUXHRCHfgflTrq06eCokGVXgRkN5Se5RGM+snxOl8Sew2UHUZZbI2NaYqtLymzGY
 TKvW+qeQ==;
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt8oM-007uEa-Fs
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 13:09:09 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id g38so20393652ybi.12
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 06:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sMoUsP+kTPDRNp3NldXN+6OEKu9qLojvf+qqhyJ9SvI=;
 b=e2K8Av2mPhp/Qeq3KR/ThAvnqvDFvMbejy/3Ex/owuKzje5Y+wwd9CsaR90l/bXbGJ
 kdqtd2J+YMSQ7wycS5aBVY2UliD5oBSunimr+X4dkG+Wx53oya8zvYk/d+2LuKuQDMHk
 1divJo+iYnTBNUHIiP1bujE5Wnvj29JmhoW9yQHCmXGmP5S/EtgnVlm/hdHNUvl5CCST
 SO6xRhB2a2ceKa+8RF02NdHUVs0chn4sbbnG5SNX/cx5vhyW7g2Xm5YGzh8d46vMFZVd
 vrEDf4jcScYNQ04YJugroFYx+OxQz1Fne/K6s0JaL2BG2N87f3YGPkDYEwn0X1Sv5DUI
 7Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sMoUsP+kTPDRNp3NldXN+6OEKu9qLojvf+qqhyJ9SvI=;
 b=Ec2F/HYv6hqx+Ew8gHLtD8WSHV2RCXMHVRMOh8SrWPoRoOKGzU0q2lk6pb6v1XUcqG
 aWSKXDQaMIN31qcOGAVCBRDIcGR/r/OeJhKhiTc0cPm9MkTTwsc46a+XYI2QrzbBju1x
 I76dXqh1Mn6Dz7hjWNvx0Q6kiGzBwlY6Pa7Blsa/SgVGNlSbRdGrkmM95LZ6NlS8Ho7S
 OCaT/pZcHWbCxMSC7vXQbsBmj0WPkyOXIuTVO9Pt9RHsFkcJ/wUYo7w6AlwqvcmhBTpz
 tV7BP8oY3aIOtq9yVzQz7wuXSDcMWEl+Ap9Ev+XmxVRwyYbaD7HndcGP+Sc4hVpyEPfZ
 9Qtw==
X-Gm-Message-State: AOAM532FTBKZtCknhOJZ6UE3L7xDzXxK7O0LkBCXTt8QuR5IfNpQzBt4
 nzjOwXXN0tzgJNv7A50b9FbVFj/aMA95VXc4/7c=
X-Google-Smtp-Source: ABdhPJzqnqyJZ1wDf7Pt24OTXE9VQutGzT6s5BF+/eUK7LCanbzAlwyIlJMFKWxTx4KlYzWXOWf4uy5yzQIhIDzKAys=
X-Received: by 2002:a25:2e43:: with SMTP id b3mr31849821ybn.152.1623762541678; 
 Tue, 15 Jun 2021 06:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210615023812.50885-1-mcroce@linux.microsoft.com>
 <20210615023812.50885-2-mcroce@linux.microsoft.com>
 <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
In-Reply-To: <6cff2a895db94e6fadd4ddffb8906a73@AcuMS.aculab.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Jun 2021 21:08:50 +0800
Message-ID: <CAEUhbmV+Vi0Ssyzq1B2RTkbjMpE21xjdj2MSKdLydgW6WuCKtA@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: optimized memcpy
To: David Laight <David.Laight@aculab.com>
Cc: Matteo Croce <mcroce@linux.microsoft.com>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_140905_415955_8765336B 
X-CRM114-Status: GOOD (  17.35  )
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

On Tue, Jun 15, 2021 at 4:57 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Matteo Croce
> > Sent: 15 June 2021 03:38
> >
> > Write a C version of memcpy() which uses the biggest data size allowed,
> > without generating unaligned accesses.
>
> I'm surprised that the C loop:
>
> > +             for (; count >= bytes_long; count -= bytes_long)
> > +                     *d.ulong++ = *s.ulong++;
>
> ends up being faster than the ASM 'read lots' - 'write lots' loop.

I believe that's because the assembly version has some unaligned
access cases, which end up being trap-n-emulated in the OpenSBI
firmware, and that is a big overhead.

>
> Especially since there was an earlier patch to convert
> copy_to/from_user() to use the ASM 'read lots' - 'write lots' loop
> instead of a tight single register copy loop.
>
> I'd also guess that the performance needs to be measured on
> different classes of riscv cpu.
>
> A simple cpu will behave differently to one that can execute
> multiple instructions per clock.
> Any form of 'out of order' execution also changes things.
> The other big change is whether the cpu can to a memory
> read and write in the same clock.
>
> I'd guess that riscv exist with some/all of those features.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
