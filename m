Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC84C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 12:05:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25DE56115A
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 12:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25DE56115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMTONvGh7CLkt/O6y1pJP4C5l7nW1UfSNj9FuwlmGq0=; b=iF4iv8ZhA6FTk3
	o4ga2fMzwS4oagx+Z64ynWvKczuLtop5g5d378y3gVXIYvM4WtEYmkDZfLDYQ/rAq774CkaHhJZ/0
	Dm9iR8C4l6vbjV9B/flebdKiuUpmnllFLz9XZ+uB/bXLW2jjYH5X/JRKLt1obdJ/9+kouLJuo02cy
	7OZxuQt+BUn9OmXMEIYZfviVB2l6LDIxuackun9OHfHAzv8NOzhoZLzxIWChDh6suKQOzqqWu6DVE
	fdmFjsoVR/Nzt81p2ASkf6Q+dtlvn47Vm7IF60WxdFAQ86WhmPDgoCsF70Sf57FQkhxZIZTUjxJuV
	FRD7Bxy8YiQTAhwHg3lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSeWZ-004QRG-Sw; Tue, 21 Sep 2021 12:05:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSeWN-004QQQ-Ny; Tue, 21 Sep 2021 12:05:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EF5961186;
 Tue, 21 Sep 2021 12:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632225911;
 bh=DG9JNZQFvl7efc4nexOO4fg+5WMfNAZoucbjG4viZJY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JJyTS/Ag55xb5DaeQp7F/jXV/FBOFUAn8DPNofQFs1saJsZ9sCRXEj12daNeZ1Z3U
 IJy7rdLd28cfnkbFUIPx4l7a+jIPlBdCcqM4P3EccSTxfZw5ypMtQ4wJgi1clqmWah
 j9Ejl58vKka4j6aQrNPBU/aFzlnNh+0AQfmM4Ih6RjJZmAogI88Ui9hHtLFzYnYTjy
 /K2gKIXmjvfjrzLNRhsf7+kbOPs1N4Um/G5dQGUjJpf8KBG52ZNUGqVHWux9ZmKhl0
 6Erkeugudc5Kx2xaCACxztYTUSoys36n4wnpOGdktFllSKtMgVbKq4alyxOKGVfvib
 Zpyp6ZjfVtnaA==
Received: by mail-ua1-f46.google.com with SMTP id r8so13315672uap.0;
 Tue, 21 Sep 2021 05:05:11 -0700 (PDT)
X-Gm-Message-State: AOAM532TFmNkY/xjUeR+x8UJSFelB9lt6VVov0dD8Ri4lkWCOx4K5BLd
 wSxZBkL/6U9bZQi8dOnanzhp7qB6A0pgSSvHjDk=
X-Google-Smtp-Source: ABdhPJxUqmu5iQVr6fZ3TQM6eziNelFJiJn18TFwtwwTecybfc/0teebK58ixSK16CBCXGG0Y5zoMsZaVGfK1lcWdYI=
X-Received: by 2002:a05:6830:3189:: with SMTP id
 p9mr22365233ots.147.1632225899996; 
 Tue, 21 Sep 2021 05:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-2-ardb@kernel.org>
 <YUNXfWKZ7XYvw2EK@arm.com>
In-Reply-To: <YUNXfWKZ7XYvw2EK@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Sep 2021 14:04:48 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFkJtVaT2CjigZHLT+AAjmCzU1OgTg+QS-ttJxmejGkRQ@mail.gmail.com>
Message-ID: <CAMj1kXFkJtVaT2CjigZHLT+AAjmCzU1OgTg+QS-ttJxmejGkRQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/8] arm64: add CPU field to struct thread_info
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Keith Packard <keithpac@amazon.com>, 
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
 Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:S390" <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_050511_825967_922366D4 
X-CRM114-Status: GOOD (  12.80  )
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

On Thu, 16 Sept 2021 at 16:41, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Tue, Sep 14, 2021 at 02:10:29PM +0200, Ard Biesheuvel wrote:
> > The CPU field will be moved back into thread_info even when
> > THREAD_INFO_IN_TASK is enabled, so add it back to arm64's definition of
> > struct thread_info.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks. I take it this applies to patch #5 as well?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
