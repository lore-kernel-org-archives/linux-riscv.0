Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD24CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 01:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7uCB8HaQDeByCJHhEQoZthok8Z5a3tOeIC6L7z9miA=; b=X/3NMUQ2eDDivc
	I2SGc3/J/k8GDj5ZXVsVJKMooqW7oUdar6rNuy1ia0tC4V2j/8wtYpRLTFEoC2RmhnzpPO+67Gs4e
	G5etwDHBuLKbPfE1zkTXCNAbXNClOwYDOOCbSvOl1nPTCRdbX3ZvPGDiXTHD+aQZK3RrsO/FhPIbU
	nWba/BUcR5SLpJ5O/bHhbHixiJD40SuIaPEP07I5CXnvrV1iCIziFFuHTd397P8zZAQlgOTuk6OKk
	UsuTa4hoP2bQSm+nsOCEOS4NZZDnSrUGhC9TbxQflSaoBc8uTBeX56+atq5PE0nXR+HG3MuBCvbQH
	fVyNKygnmZJSiposWAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKod-00000006C6T-1CL9;
	Tue, 16 Sep 2025 01:49:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyKob-00000006C5L-2Vl8
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 01:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757987344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UM/63QbNRNL2CWSzKhJPtVEvJogEqqs3VcsifJT7nZg=;
	b=AtTBN22u2Ex/hHjOoyKFUQVrAUOjmhektnI8Vda0P+L77sNxfBzACwiJstCevqcaXbD+XC
	831/355sucdUGQ/KBT4oLzHCAn0ohYG3VChKihT0AoXdVidPKDARJLPPfKs5YMfgJw+VTi
	2yEvVPWdNMichk3pzx+OJmmuqeXhAYU=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-aLznwGxiNLuAtBoA77XllQ-1; Mon, 15 Sep 2025 21:48:51 -0400
X-MC-Unique: aLznwGxiNLuAtBoA77XllQ-1
X-Mimecast-MFC-AGG-ID: aLznwGxiNLuAtBoA77XllQ_1757987330
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-5717bd64621so2091471e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 18:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757987330; x=1758592130;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UM/63QbNRNL2CWSzKhJPtVEvJogEqqs3VcsifJT7nZg=;
        b=f3jFLYghDKR2yEil6ymiVOYvdtk3HcqkPQqNRFZvu4OGeU492Nw0ovPVFz9zG3oo9u
         R54VyqdhHS3x17t3oYXIAiQCrpBsqapUKB+NwS/6PyTC1L1MKnCtxLpENGGG7pHZWOjG
         zSUADsQ5oTppSgQ97OMbI5E0OdOcFYs4ZUcifFKjCY2QBCLPJwXl++H2EK3XQYfLcBDb
         kdoTTiiobIj3fY70t6FhBopUWYDC+BNcpF3KXEBalWxL/0VWEzhhKZSxVrRInzKpcM86
         0Lzinfj8xbu1DryYsLHUkTDuqtu/oLdhO9F378L5rqUeaJ+IjaWs5L0F/pfghipcWMXa
         sqfg==
X-Forwarded-Encrypted: i=1; AJvYcCVBYTrvSazdnoTpt7XfJiJ3rx0gWwA8gADcYRhZLEu9NCdepmMonfxpmSy+LWtFGZIb1LjJhPoG5tjJ1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFTeye/7rUW91IUfCdDJsm7JMhyE7SZF+Z/r9NK5mElsPbqkXL
	mqBF2ucfZR4b1p3HBFfT7jzhVg70I613tgMou/hcgvNWH4zL43JH02ZMRH6vxSObPXejgzYHOBS
	UvLUJARPE8hIMsLpU9KZ+elw1HeMaN31YiLIPGWtMoQRLSN35FnX1xY2B83/tfPxdujKShf9VKe
	EZZT+KPFtyL3Aw70y8IcDMOcMjAVR3arAlK4sn4K6EXkYV
X-Gm-Gg: ASbGncsV5btj6pIKC5pQYod8sfxnTVV0HdwchAZHgySITJ8IM5QQqMkf8eJoSEBoJWC
	R1t8HkDOuxCWXaws3ZxvC85remPfZZnQZPp6/luTG7Em64+pnoE3mDizSoBUouY3y+z232xp5BD
	gP8JC+4q/8LDARnUWIv9Y/mQ==
X-Received: by 2002:a05:6512:3f21:b0:563:d896:2d14 with SMTP id 2adb3069b0e04-5704f7a3535mr4252940e87.36.1757987330041;
        Mon, 15 Sep 2025 18:48:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi0qyrJSXhatUAjAN5GaSbgChEfkulnz/zBRoEI09ayrVbCpTRhDlFRFU2ScIQdlOHU/dANXpgiKsiuT/Fm5k=
X-Received: by 2002:a05:6512:3f21:b0:563:d896:2d14 with SMTP id
 2adb3069b0e04-5704f7a3535mr4252904e87.36.1757987329545; Mon, 15 Sep 2025
 18:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250912223937.3735076-1-safinaskar@zohomail.com>
In-Reply-To: <20250912223937.3735076-1-safinaskar@zohomail.com>
From: Dave Young <dyoung@redhat.com>
Date: Tue, 16 Sep 2025 09:48:40 +0800
X-Gm-Features: AS18NWBkCHbtMZDfiuZiXnfW8KzozFHrUJlGejiASEzNumvZVB8NmHoE7UrrQwg
Message-ID: <CALu+AoRt5wEgx-=S263CReDf8FmLWwjs8dF9cX4_jFcMUkuujQ@mail.gmail.com>
Subject: Re: [PATCH 00/62] initrd: remove classic initrd support
To: Askar Safin <safinaskar@zohomail.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AbGyWFIb9bb15bYy44bx1_2MwEtFO0ePr8pcFw6nQe4_1757987330
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_184905_700083_F4A5204D 
X-CRM114-Status: UNSURE (   9.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Sat, 13 Sept 2025 at 06:42, Askar Safin <safinaskar@zohomail.com> wrote:
>
> Intro
> ====
> This patchset removes classic initrd (initial RAM disk) support,
> which was deprecated in 2020.
> Initramfs still stays, and RAM disk itself (brd) still stays, too.

There is one initrd use case in my mind, it can be extended to co-work
with overlayfs as a kernel built-in solution for initrd(compressed fs
image)+overlayfs.   Currently we can use compressed fs images
(squashfs or erofs) within initramfs,  and kernel loop mount together
with overlayfs, this works fine but extra pre-mount phase is needed.

Thanks
Dave


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
