Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF43C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ff1O/LWjm3H2ad5O0ByKSz4Z5BQUqQCA3y6nNuOJTyY=; b=fZ1EK3afOIuIv3
	6QruMPhlb/2/IK7YasSmOC5ziHS867FOPDQynCxnyaoan7ewpCiI1lKGHV+l6H4BTgMcdAC4AZQjT
	PTgrlckbU3Y77UP+mJOqOWWUYjiUESub1swyOwrzZVZokpBs6GHS3VI/L3vPXN/NqbaSmDKwk/z0p
	AKFOPV1aP9YhcWVsusqXSTKsGPnrpAMP39NQhmJQNEjQGbZN49dGz0YuJAPqbk20S6f5ODMCzMRUG
	byuHoMM65PDthY+StNHBHKolaehhzBwGOx25Rssmn4PkGD/o2wMhvnhIXE7NhIAZy0+LK/1yc8d5u
	WJVTT6tl2Wv8oq4PPk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhEQe-009z7b-D5; Wed, 20 Apr 2022 17:47:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhEQa-009z4F-LG
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 17:47:47 +0000
Received: by mail-pf1-x436.google.com with SMTP id p3so1299684pfw.0
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 10:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SHMsfABGGrvn2lsVsfqgzVLwywQSfxtdJBF+mJ5LZXs=;
 b=ifQm0MVgjtV+BXIaAo3bFkMuhxuVZBnwY0aFGZk1+nVrlhCy5FA9hG9fnZaS/1OTlY
 U72SN6BUq0YrEvFiM/wPkP4INNUU0czy83FarimwkCa8pzM0gwf67bpq4SZcz0RNe9bt
 jNsKDh5xmimNviBlpr5yk0v18LF9HjlZQa6zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SHMsfABGGrvn2lsVsfqgzVLwywQSfxtdJBF+mJ5LZXs=;
 b=OW4Z5619vm64GgK740xAdNtb0K3KZvuxtCujGreB5Ypd+D8bOu4cZpajjF3i8YItAZ
 eO6VYDlcI60+z0stbIlXyP9UDahZ1rRQQxbgX7z3aDRSeG4FI/W0eSeBu5UQTSzIT9i9
 x3paR/jNhUu+Vc1WJ3/xFK8gfSebu39CJGA6nOxwkj5INdJ31QxMK9vAATmqi7CQQpro
 zHPUPWkqGmSuRYgvnHlJc6GvOmnq93x4g1tuckXTZ7Z2Qu20obKgB5jPlphNkXyoPXQL
 dyf7FpJcLHwi4Y4pSjFe2EjEMgYiOHnFxtYP+MYuWcKONgZBrHzIMaL1e/N8993BTZrz
 uCpg==
X-Gm-Message-State: AOAM530kRftPBEqGW6sOqIcaOAFRWTGd5kvWIO8G0WQL/qsAZLXqP5wG
 vKPKtjiuHgh+mpGjVqg+mlWdAqHPM60cgA==
X-Google-Smtp-Source: ABdhPJzlyKuQhYm9qanfZk6jXGeHYMGh09tbQmAJbxfwhgdwizKPI1SHKfbvpHUJSUj6EwAypoQ+yA==
X-Received: by 2002:a05:6a00:2284:b0:50a:40b8:28ff with SMTP id
 f4-20020a056a00228400b0050a40b828ffmr24827405pfe.17.1650476861016; 
 Wed, 20 Apr 2022 10:47:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090a680100b001d28905b214sm22614pjj.39.2022.04.20.10.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 10:47:40 -0700 (PDT)
Date: Wed, 20 Apr 2022 10:47:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Rich Felker <dalias@libc.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, ebiederm@xmission.com,
 damien.lemoal@opensource.wdc.com, Niklas.Cassel@wdc.com,
 viro@zeniv.linux.org.uk, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, vapier@gentoo.org, stable@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org,
 gerg@linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org, ysato@users.sourceforge.jp
Subject: Re: [PATCH] binfmt_flat: Remove shared library support
Message-ID: <202204201044.ACFEB0C@keescook>
References: <87levzzts4.fsf_-_@email.froward.int.ebiederm.org>
 <mhng-32cab6aa-87a3-4a5c-bf83-836c25432fdd@palmer-ri-x1c9>
 <20220420165935.GA12207@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220420165935.GA12207@brightrain.aerifal.cx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_104744_753514_56A44A83 
X-CRM114-Status: GOOD (  25.54  )
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

On Wed, Apr 20, 2022 at 12:59:37PM -0400, Rich Felker wrote:
> On Wed, Apr 20, 2022 at 09:17:22AM -0700, Palmer Dabbelt wrote:
> > On Wed, 20 Apr 2022 07:58:03 PDT (-0700), ebiederm@xmission.com wrote:
> > >
> > >In a recent discussion[1] it was reported that the binfmt_flat library
> > >support was only ever used on m68k and even on m68k has not been used
> > >in a very long time.
> > >
> > >The structure of binfmt_flat is different from all of the other binfmt
> > >implementations becasue of this shared library support and it made
> > >life and code review more effort when I refactored the code in fs/exec.c.
> > >
> > >Since in practice the code is dead remove the binfmt_flat shared libarary
> > >support and make maintenance of the code easier.
> > >
> > >[1] https://lkml.kernel.org/r/81788b56-5b15-7308-38c7-c7f2502c4e15@linux-m68k.org
> > >Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
> > >---
> > >
> > >Can the binfmt_flat folks please verify that the shared library support
> > >really isn't used?
> > 
> > I don't actually know follow the RISC-V flat support, last I heard it was still
> > sort of just in limbo (some toolchain/userspace bugs th at needed to be sorted
> > out).  Damien would know better, though, he's already on the thread.  I'll
> > leave it up to him to ack this one, if you were even looking for anything from
> > the RISC-V folks at all (we don't have this in any defconfigs).
> 
> For what it's worth, bimfmt_flat (with or without shared library
> support) should be simple to implement as a binfmt_misc handler if
> anyone needs the old shared library support (or if kernel wanted to
> drop it entirely, which I would be in favor of). That's how I handled
> old aout binaries I wanted to run after aout was removed: trivial
> binfmt_misc loader.

Yeah, I was trying to understand why systems were using binfmt_flat and
not binfmt_elf, given the mention of elf2flat -- is there really such a
large kernel memory footprint savings to be had from removing
binfmt_elf?

But regardless, yes, it seems like if you're doing anything remotely
needing shared libraries with binfmt_flat, such a system could just use
ELF instead.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
