Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C07C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 01:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=n68wfWL1lacm3NwfVmsU7z5lSGP2t903HXJDnPTLUxo=; b=HbQphbSUFKdMb1ZmJmFiV7ZgSz
	8JbC4wJTaRFFJY/eaQTPTLZS6WinV9fBDj+fVQWonyGHwfxq1DjYR0jG0vDef8ox5NXqulOm9VGMl
	n0cjvVpHlY9EF1KnrrQVle6eDL+3mMoncj6wt0sRojFxyWp79PDaw1aI9YIbULTVA6XyD+X2wsfkM
	M2frcOdzUNzA0wJS4M4LVMG3H5UrABLTMZorERfON3q3r8sQmdZO4dvA4fASOtyR7SsVGRJLtRRb7
	evsGypahd+B0M0p79X15R5DAGE7rYYFrkV1HWR22MRNERGIpzOQiafXH60pCX24t5+fKiPsdfrn0S
	CmOVahmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogFfX-00GpVa-7i; Thu, 06 Oct 2022 01:27:23 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogFfU-00GpVF-9E
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 01:27:21 +0000
Received: by mail-pg1-x530.google.com with SMTP id 195so562824pga.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 18:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4/8/dQZgzDnDwc7lFNRt35pHqe6S7Rsx4sWI3f60qWY=;
        b=OKHCuMgVy0aO8VhAi/0zERlIMCY+9+rohIQUpTWa77B0RFiVd78eWWUepBW4AbMDz2
         Tf+pFedKIV3wey7d48vzT9Ctg3hAfCGT43ppAAcGy9B4pHzId4NCp1go4lqsWY1eDsNs
         l6wgmKe48acqNdnEjipiGgCKb6I3Qdezw3SdmXZqlcHbUIjeJQLHzAsr8Qr+lqswk7IX
         9wpZs6lWR0NJR2vDGyAFFdxND9O6OLngfp41Dn5cfsCZs4QB+WcXxNz9aAOatIf7yJ3g
         i9LsVLyLyM9vJ1Qu32h065O5hthE2EqhfuZ9FIOeyPpe+OWO1020OvcRa9HGm/H+VzQ8
         7MkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/8/dQZgzDnDwc7lFNRt35pHqe6S7Rsx4sWI3f60qWY=;
        b=dLG2BaCg7X81dqdOeFK0aft98BZr7MGs3KZ/n2WZyKnm4ZigpiMihkumM9fB8NRLj2
         xxnDx7Zaas7gGaT+/AL1yJvlIN61fXrjX0+ySeInvdGaJOieC78CYxPPXwIjeNx6Kpdi
         mwVD1YEKDRit8j+KU+y/fh+9DqSInzyXN0cCwu+IXzTIPRaugIq3d/CiHfc8n1mYR/8K
         x0XVlU7xvHa3T7ozou+xDdTeW92YUXgfjlde+3K++/ECn73EhlR/GSHWBzfCPk6g8Jy2
         hzcRuArXT09y9LiYuHsnMBJZf9HStiHRw7tpcXANK4T1IRCoC7ERKpkL5kmy0sLgYSbI
         RUSA==
X-Gm-Message-State: ACrzQf2YwrvJ20sAtELYPLU5qvXWyZBJcX4hcyfOvWZ+eam5N/qjHP5Q
	/2fa5KGUzO6qQsPd/1UZPSmhoQ==
X-Google-Smtp-Source: AMsMyM7jioPPSarJQSbh+NnOBCQxAoudbqQsvD16os+ChMetUP1F93L+czcImnHOLnPM3ZwvC5pUoA==
X-Received: by 2002:aa7:9083:0:b0:55f:9827:42e7 with SMTP id i3-20020aa79083000000b0055f982742e7mr2175116pfa.15.1665019636465;
        Wed, 05 Oct 2022 18:27:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id k15-20020a170902c40f00b0017f64ab80e5sm5218784plk.179.2022.10.05.18.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 18:26:55 -0700 (PDT)
Date: Wed, 05 Oct 2022 18:26:55 -0700 (PDT)
X-Google-Original-Date: Wed, 05 Oct 2022 18:26:06 PDT (-0700)
Subject: Re: [PATCH -next 0/2] riscv: ptrace: implement PTRACE_{PEEK,POKE}USR
In-Reply-To: <mvmzgfwelmw.fsf@suse.de>
CC: zouyipeng@huawei.com, linux-riscv@lists.infradead.org, oleg@redhat.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, guoren@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-c0ab4916-fb1a-49e1-9a26-b93500ce5839@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_182720_364043_6D1E29F3 
X-CRM114-Status: GOOD (  15.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Aug 2022 01:19:03 PDT (-0700), schwab@suse.de wrote:
> On Aug 22 2022, Yipeng Zou wrote:
>
>> The PTRACE_{PEEK,POKE}USR going to get/set tracee's user register.
>> This patch sets add PTRACE_{PEEK,POKE}USR and compat implement to
>> riscv.
>>
>> I notice this issuse when transplanting some app form x86 to riscv
>> recently.
>> I don't know why these two function are not implemented now, and I
>> found few talk about that.
>>
>> The {PEEK,POKE}USR are both defined in include\uapi\linux\ptrace.h,
>> So I was thinking maybe these two function shouled be implemented.
>
> There are PTRACE_[GS]ETREGSET.  I think PTRACE_{PEEK,POKE}USR are
> legacy-only.

That's my understanding as well.  Anything ported to RISC-V would need 
to understand the new register formats, so there's not much benefit to 
supporting these old flavors of register twiddling -- maybe some 
refactoring needs to be done in userspace to take advantage of accessing 
multiple registers at the same time, but that should probably be done 
anyway as all ports support the new interfaces these days.

There's been a few rounds of these having been posted, maybe that means 
the documentation should be improved?  I sent 
<https://lore.kernel.org/r/20221006012432.19008-1-palmer@rivosinc.com/>, 
that'll also help sort out whether we're supposed to have these.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
