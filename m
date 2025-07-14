Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFEEC83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 06:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGrluSQm4yk2+UsXcJ0DAh6j6CmaUQCFfh1MnkyEA5I=; b=p8ZUI/3elUGQ8a
	PDIIJJLkW1rQVA/tNs3zvBjQol1VRTr3I3oSDdl+/z4m8e//kUsqW9KjqKKk+iZi8wsjmTYmgJW6x
	PPJrH8+2qQNUgzt0Zvc0Yhq369BG/DF5N+CKMhHttTSTe2X93I5PdxfGOK0FPp67dHiI01bVUSQww
	hpKvSstE9Mx7Or8MaXEnbKhHzYn7wizyKdKsFYjKDawb259Rbxq0d5B4ulwLdqEAjPP3n7u6Mhmtj
	Oc6etE/SglISQUYrVlYMFH+IU06PLQ0Fww5J8w8vpF9eUGtDHdgHHORd6YpU0ZGLDQdD1vWQlkFCG
	cs980PlaEnuJaqRkOVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCx0-00000001OHo-1J9n;
	Mon, 14 Jul 2025 06:46:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCXn-00000001K9V-3nkE;
	Mon, 14 Jul 2025 06:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96AB161120;
	Mon, 14 Jul 2025 06:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F54DC4CEF9;
	Mon, 14 Jul 2025 06:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752474005;
	bh=606fsEOf3GOJX8AxMnc5SbWlI62YxfGkSD/kQ0qCCvc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uli+yctbio2KJL40Z0sJCpobKSwWMS/q9w1hC7hZxQO+Y+Yg03V3qCxrNzGbmBH/k
	 xDHWt/WbWnRin3S1wBbDlOUnsd1qGPShPPfsRnU8gPpt5m+va+KWqTlPxVHkID+bA5
	 MPc/KMYSYYLOnAEyZp5ltOLX3deIij8UmOcLkDBpSom6eSqy6g9GV93wcRbjUuKmvN
	 Cisa9PX+i5dXi81XjVqFnQr/GkDJjE0ePHxWYAS/Jb3ioh613e2GxXXC45UvWqxRRI
	 24MWxqdO6M6ayoJpoGGkhfi+RvhPDuunG/Mj3Dv4sHw+1DTDFTfKpJ6xsFQllw8/N6
	 e/WJNUS9XoO8w==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-558fa0b2c99so3327327e87.2;
        Sun, 13 Jul 2025 23:20:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVPJMuxVwtaC9SHtGhFEwyCZW+sM2PaGjNUhFLlnnXgarR5gbtjJzwU1nKEFnsMByrfElcowAW9bF4ghk4=@lists.infradead.org, AJvYcCXUePX9FlSVqk1huKQWIDtrZL+FvOIbY4ZP89TyqaWoUVwpKo1If8tOVqnLMwAiTbvxAqNnAWU/95MUbucig77N@lists.infradead.org
X-Gm-Message-State: AOJu0YzmLRaOswvwqf74Jaw/I4cY43m9zNtS4SwEGiS4h0oWmc3B2Zq0
	O3o+tvXmjNXvMInPyExDywMA/gWnBeMRDRg9GsSfVQuyOt+B8zD1Oql67NkFuhnl2dHdeETFqUu
	/gDO8nP+iH4zAqA8NvvRN0GiYLJfpZYU=
X-Google-Smtp-Source: AGHT+IE2y+mnn6gRDYyvRcFjRA9M/TcvC+Yv7itcf8PEq8SUCnfludPIC0L+2CId0IaAy39lcVu+VQplF3E0k6RCiek=
X-Received: by 2002:a05:6512:3048:b0:553:5135:6a0e with SMTP id
 2adb3069b0e04-55a057c3971mr3597796e87.4.1752474003585; Sun, 13 Jul 2025
 23:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com> <20250714060843.4029171-6-ardb+git@google.com>
 <dade7d17-d45d-455e-a43c-01e9ea95c3b4@gmail.com>
In-Reply-To: <dade7d17-d45d-455e-a43c-01e9ea95c3b4@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 14 Jul 2025 16:19:52 +1000
X-Gmail-Original-Message-ID: <CAMj1kXETDd+19i+awMx1v1sE4RXhF-r2a-mTa3rWfus5s4HMmw@mail.gmail.com>
X-Gm-Features: Ac12FXyqdPXKdPkXKcrHisnGj_9A8qao-_Ean6Zn-muhfOH0lpX7Li9QylqqJXw
Message-ID: <CAMj1kXETDd+19i+awMx1v1sE4RXhF-r2a-mTa3rWfus5s4HMmw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
To: Demi Marie Obenour <demiobenour@gmail.com>
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
Cc: Juergen Gross <jgross@suse.com>, linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Stefano Stabellini <sstabellini@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, linux-efi@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, loongarch@lists.linux.dev, xen-devel@lists.xenproject.org, Feng Tang <feng.tang@linux.alibaba.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 14 Jul 2025 at 16:13, Demi Marie Obenour <demiobenour@gmail.com> wrote:
>
> On 7/14/25 02:08, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > The EFI rtc driver is used by non-x86 architectures only, and exposes
> > the get/set wakeup time functionality provided by the underlying
> > platform. This is usually broken on most platforms, and not widely used
> > to begin with [if at all], so let's just remove it.
> systemd uses the underlying functionality: a timer can wake the system up.
> I have no idea if that is implemented in terms of this function, though.

To be clear, you are referring to wake from poweroff at some date/time
in the future, right?

This change does not remove this functionality from the RTC subsystem,
it just ceases to expose it on non-x86 EFI platforms that claim to
support it.

For reference (which I should have included in the cover letter) [0],
there are arm64 server systems which always return an error when
calling this API, and most non-server arm64 systems do not implement
it to begin with.

The patch in question implements one of the workarounds that was
considered, which is to invoke GetWakeupTime() when registering the
RTC, and disable the wakeup functionality if that fails. However, that
call by itself could easily regress other platforms, where
GetWakeupTime() was simply never called before, and where calling it
may tickle other bugs.

Hence this RFC: if nobody uses this API on non-x86 EFI platforms, then
I'd rather not support it to begin with.



[0] https://lore.kernel.org/all/20250710084151.55003-1-feng.tang@linux.alibaba.com/T/#u

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
