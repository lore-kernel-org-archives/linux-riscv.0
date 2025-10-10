Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB11CAC5BB
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 04:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/bIPDPhXI1HGG1YxHOC/XGnOWje1VIM23q7Nit451DI=; b=33Aqog1JUEgjoT
	TnMYSgFRXFKRVS+kn5JyGdLfl5rfEMFzif2SNthDV6J9eKqsqaYdzv9hrCuzlV1ZUiqvjyUj5SVHO
	g/nzbn3WMecI3rtGt9HcJmIP5t6tZ0P+t7We/ZUug/WcljpTrkJ78kHJoEbXQVytI11cfOMlrPGbc
	RzH3VrPwT4oBcuANbYW/myLZBQAumyW5i3L91hjkuoiU1TyHwZk3Wj4CJLCjQGhTgNXaZZ0sfzLGj
	nzr59nRSJ8L4vW0q4a+LFGQxxSAMOuWqEassKeMtZMMBp4KczZDb8V4vWgCK1gAdwpu36K7YJ8El/
	wP+xOzNfaV35AOihWKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Rp-00000007dkG-3upq;
	Fri, 10 Oct 2025 04:09:41 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v74Ro-00000007dil-0Ote
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 04:09:41 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-63605f6f64eso1461985d50.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 21:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069379; x=1760674179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=PGMEb5C0TDzFP/RAVyzqFdeH5N2/zr9r2MEf6PHAbkm6wok3cB1LyYrx25qG02P1cm
         0CvYRKZkwsV/LTbLWORgPkXGl1nv3k7h7qcUXXbVOqKk8C43ab+wyFcJpfH4Q20qEUi8
         RdQrEU8B2XGEdBo+0qE0U0fPpasNKhslJ4nhVaWTIq7P5whH+jtQg+vKHvQP1GQJ9T/Y
         gk4zbpPGTqbCj2hit5n7gbm3XeTrG5lqu7Jn/F0IHg3SWw41TdmE7OdnOEp/CteoriS+
         af0UZ3ax40ew4TgUC3DQqSTYEzMPBGEcw0sC/25WiO3WYsQmMmvGV/x7SZvMlTZenaIh
         aYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069379; x=1760674179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QekwWSNZM13jRboBgI+VcoYsXugGuoxwasNpiteDkcg=;
        b=Tv17BPXhPi9ncUo5dcvwfSk98/2EpEX5zDwHRSTs1VCWUfskxhpdcV6/9uJBjiFbGJ
         gHRLDI5nqo+qNd9dWDGEO7/z96Sa3J82NqqCVB4QfsLBvG7zeYfSH8HgbrznhghqKUaK
         NCvBq50R6PGHnmMTxG/4aI4k2O0I2hApAl9vzl6Q1+bVvKT3HUZ6q5PCnkgI1gc+D4bl
         017acW9L3GryfhLtbWSV8KczxQu3Tnzyz/Kqid0qg6Go1xkvAouKGRSu69OSZLfDEtDC
         iBDjz3cLaq/mkfGcNDxGIh0UgVp4o5UK/R2hjLiia9/rLRrX/99D2Uzbt1XL21lZGLe6
         ayxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5kmloSPLF/5el/Pk1ZYQVw9P3k9Oy7t0NuPGlkg8TMrSRTMgRMUsy+SehBrq3pf7O11vi3zbAphfyMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6/AR6EWMUoermE4PPQLiwQomWUJDhOFrFP0LlPppBghbNybU+
	XlvwEcY79FyPGa1lpYPDXThriVCd2bkk7+4WeL8cJ31Kdg+JYxuWmuVSjgXxDumpU7zWuEtv6Fw
	trffIiQmRqRccrfFsYQTkOHWiuQKDFPo=
X-Gm-Gg: ASbGncuXNzNYGb2A1XjLFhHgBD/rX5n7nrGL/bNrbirE6G9gYXXSoHn7PBUyJKYTs5Z
	ffzmjJM3WDPfjmXBrjRGLfhhPmWelkmQcQKBZ4kFhVgub0WdTjMuqjmWEEx11HTKROkTPuzuSwl
	/ZkCqoVxvj4+BbABQkOhTF3bR9pYQkSCncVZS6KpuEic1bdeq0lFrFnkfLYUlZhsky0MRaIofLA
	dppJR124PmZ6rfx4NeNkengbdUoTCUxswNK
X-Google-Smtp-Source: AGHT+IEKzDZJ3mg1FFWOqowFJqWLj/+dmJPdM199pmmtVcavFH/YLuoH0hEdsvn7dHSOiTNw/3Aomiv0DcOjJivXzrY=
X-Received: by 2002:a53:e946:0:b0:636:17d6:a30 with SMTP id
 956f58d0204a3-63ccb82410bmr7618496d50.15.1760069378763; Thu, 09 Oct 2025
 21:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
In-Reply-To: <A08066E1-A57E-4980-B15A-8FB00AC747CC@jrtc27.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:09:02 +0300
X-Gm-Features: AS18NWDxe32nrD4BfQQFhIe3tEEfxrwgJsYQo_BWhSUPsy5CceSv7QOcZ20roI0
Message-ID: <CAPnZJGAKmgySY_RK0kmGTgwUh9hw4FSrVR+LoJCbD_RmJZe6RA@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_210940_165165_305ADF21 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTYsIDIwMjUgYXQgODowOOKAr1BNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdA
anJ0YzI3LmNvbT4gd3JvdGU6Cj4gSSBzdHJvbmdseSBzdWdnZXN0IHBpY2tpbmcgZGlmZmVyZW50
IG5hbWVzIGdpdmVuIF9fYnVpbHRpbl9mb28gaXMgdGhlCj4gbmFtaW5nIHNjaGVtZSB1c2VkIGZv
ciBHTlUgQyBidWlsdGlucy9pbnRyaW5zaWNzLiBJIGxlYXZlIHlvdSBhbmQKPiBvdGhlcnMgdG8g
YmlrZXNoZWQgdGhhdCBvbmUuCgpUaGFuayB5b3UhIEkgd2lsbCBmaXggdGhpcy4KCi0tIApBc2th
ciBTYWZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
