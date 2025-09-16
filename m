Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B32BCAC592
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUTARY69Bh843kEhh6m9pGr5dS34CLKKVbxnN1iq5oQ=; b=Kd0vufNV/qD8iQ
	bWGzI+2zbCEtlEkTb0UxwVxPjgE529FBQ5/SXy8RrcDa+87bT2/bPm18xdtD1iQuQ9x3DjF2OzErR
	BOdtqDIHLE5rFaQwh6bwTYMM3ti+CFI3mHylv/PmrFkDf5tfCzmEu7M5kA5GkUUTJu7WFA0m0HUFS
	R8yQvfLFnEmePftyxs9YWp2mmO6uEj4JWf1oveoqT/vv1bcASGKTfn0MR1FzX9tEX4XyAdhTJno+m
	U6hRq78umFcNALgXKqTKnWzVY4+lsKWiQEeUp7zYJ2aVzhjQND8Ud4ez2X+fBrUyjLOIinWn3EIW4
	76syWWBgFZx+GHlDHGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZAR-00000008aBQ-3OjS;
	Tue, 16 Sep 2025 17:08:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyZAP-00000008a98-0uyk
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 17:08:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3e2fdddd01dso1580863f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1758042511; x=1758647311; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIXyc3Fa0oN4a5i/p3ClDZo8xo9GAZJtSKI5SCU0zd8=;
        b=JZDCUwzNIL5tc0KzzKC1h1hvyA/NrAP4qNhVIzbEsRl7J2TWLRup1j9uKpwYo/Gb/Y
         gPfqnxXjaxkH3rjEMvwLggfLTtAjtm9A9jQMBMLiYb3SFRdTk0QSVR9iGP1fipvQK3k0
         MPlW8nhSMqgW2BeYOobP3qTBEBVMaT0nFyLd3G5nmBmiiq2WLggL0vCw1TVkQq3cqKcb
         51lcSs/0uLPTLk+f4lebTnJzjLL1MQK2XUnyzPEPoxmtv384ohaGR8lSmyOiljMN0az1
         NdfzzYFYUoHTnSpK2hYX7CpnF/N3w1dipkcq6ybvYGdMuQmBMFMbnwDi/wByUvcKf0Zw
         Sw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758042511; x=1758647311;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIXyc3Fa0oN4a5i/p3ClDZo8xo9GAZJtSKI5SCU0zd8=;
        b=PPQwTmZhQDvvVYcSu7+5jTGtwcRewIQ2VoGGjSc6ys8J3WlPmSL/TBj+T+LmE7ZJ8a
         nEgpykXeKbRazQyw+jr9bDi4ugqyDR9P9fCq2sskotSJH0GPWjsA+hwh8Fwa5t7MqLHG
         MS11rzw9FVH9TGaqpl3ceD/ac3cN1JFNuTP17QUUHs4rXLCYwf5jfgFZ7ioPlQHkuPLY
         twq8NmKQEmPy89nveR9g8HYGm9jqA6NFmW4XE5eiSxI07SYiFx5sxZiUHcxIOOcfCw18
         upggUIS1w70x7j4ow9lcreJ4gdvVt2BKLLmnOH5sMS/rzRx4qLqh7QMv0V7Ruv79cAnm
         BuhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKkMyqix441dK1DCo9Vc5aBoWMJnteMNi7zX8GnS5FNT2WfdyKcQo3UFeDmzZgzJpCqoB9oM/DDeLmcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp7S06QeBoVH/7fmuFy6uPFcjct0XH+7y0xNo1BiqnLg7b1fP5
	CzbDz5Vb+AAcwWyXskpif0vUGxC3NkxiYWa/k1WiUmrWHjEk93PWK6FRkvH0IdYV32o=
X-Gm-Gg: ASbGncsmWJs6ZabLDRBqrl6X7SWPnXME8in7XwC2MzQTXK7HgIbleUDl7u+SfuHtJUB
	2T5DX9JmnfE6gLySYVizMUAUFLWTdJCMH0IiOf9o2HIUhUSKL1xJVehzI2qo8exe02po9yvo8IA
	gQU0wXfllbgQT4wjIJy92mpHaFRXpmdekJbRLlovuH2Wsvv2+2wuctUw5YjIGNbkrUA0kLnHGcL
	MRI5MELsTSCetW0P3gTk2+93f5jStZN4kdjUpYibyfFzwvKid4d1EJNQ+xg+Z/pUIs2MY2leTq+
	yYFkWF8xeXUXdmTq/6t1Imd3klci99lFVzSAUq12PRwmgks/dchg4Rjkh2gx4IQemtr258EGVSu
	mO7exA1M4ICY6KFzv1HffTWkqwKozgw5+KQ3TCwcYFbpG/uWNw0WvlYGFVA==
X-Google-Smtp-Source: AGHT+IGdFovreVsG0VTuKKVTgWJJEqEKFnO21Mo+tI9uoQq7jJrFi/9vVCfXuUmfB6QhCbWUaAaAkg==
X-Received: by 2002:a05:6000:2dca:b0:3eb:2437:97c5 with SMTP id ffacd0b85a97d-3eb24379a13mr7083124f8f.22.1758042510664;
        Tue, 16 Sep 2025 10:08:30 -0700 (PDT)
Received: from smtpclient.apple (nat-184-7.net.cam.ac.uk. [131.111.184.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm22520843f8f.39.2025.09.16.10.08.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Sep 2025 10:08:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
Date: Tue, 16 Sep 2025 18:08:18 +0100
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>,
 Christoph Hellwig <hch@lst.de>,
 Jens Axboe <axboe@kernel.dk>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Aleksa Sarai <cyphar@cyphar.com>,
 =?utf-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Gao Xiang <hsiangkao@linux.alibaba.com>,
 Art Nikpal <email2tema@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Eric Curtin <ecurtin@redhat.com>,
 Alexander Graf <graf@amazon.com>,
 Rob Landley <rob@landley.net>,
 Lennart Poettering <mzxreary@0pointer.de>,
 linux-arch@vger.kernel.org,
 linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org,
 x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 linux-block@vger.kernel.org,
 initramfs@vger.kernel.org,
 linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>,
 linux-acpi@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>,
 devicetree@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <kees@kernel.org>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Heiko Carstens <hca@linux.ibm.com>,
 patches@lists.linux.dev
Message-Id: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
To: Askar Safin <safinaskar@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_100833_283449_415A5184 
X-CRM114-Status: GOOD (  10.89  )
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

On 13 Sep 2025, at 01:37, Askar Safin <safinaskar@gmail.com> wrote:
> [...]
> For example, I renamed the following global variables:
> 
> __initramfs_start
> __initramfs_size
> [...]
> 
> to:
> 
> __builtin_initramfs_start
> __builtin_initramfs_size

I strongly suggest picking different names given __builtin_foo is the
naming scheme used for GNU C builtins/intrinsics. I leave you and
others to bikeshed that one.

Jessica


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
