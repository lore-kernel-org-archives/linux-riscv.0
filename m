Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A62ACAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+v5ybLuYj9OjrB2oNNeUV8HQTrysI450Sv3dmEH3iXA=; b=fnpIUGeFgCa6dU
	P3mgwT7DPDUAxR1Am6aJC82ByDBqwgcScVvN/L5CdG92PHsXOkXzTHUtEzDJm0Ez18WIn2KshPOPp
	JyIsxadzfDcKfITeeDEJCGH0HqfXZhnM/n+oy+bp3hOM44FXdCBrX3mw3uXaEnK8dvIOv1g/LQmhN
	+/FKsTFaklLmu22+Telkx6RXbWRH/RIlaW03fUJT0OgvabdyCethI0ZqOJWwXe9A/Hd1zmcrSIjIU
	fzLireMHBSyHPkUAgMowr7AhYK7KlE1CfhovaxMPa1hsh19oi98L1cbEfbXWI50KdenyqQRxKbFQW
	a//MZ8lbrEFbbG/nmT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcyv-00000003Jqi-2PHh;
	Fri, 19 Sep 2025 15:25:05 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcyr-00000003Jnl-3b4q
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 15:25:03 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-57afc648b7dso342235e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758295500; x=1758900300; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EztjVQ+y07YMfegmHOd0VyK62XkODMWu0LdNE29WAS0=;
        b=NbSD8ygVh1J2tomNUA3TgTcMH63tc/J+6L8BwNLeNgwwUPAwJ4IhZf2Wdex1C/G3b0
         IIjd1ZPIICt526PzMeBs/UBWYsttJAxkX2RLlWpfvWMyyJFh4rAR+PmcyWLp+uS61ZKP
         tHFRseVgoiFiV0qE80Zph9YhsRIk7ZO7d68cnKFI9tfsdVaDFbyIG8LJYGJUtDl70pFz
         kitwZoxjIO75jKkBI43I68KXy11BYVWu+TA5XTk0Ixfw+6DbihlN6/NdxMAcBLGGP0KW
         K5zi3gskbI1eet+JAqeeYQFetxBEYf22jGx/kAri3UUJgwnXwy5KXepOoDYHbq/iHwfB
         I5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758295500; x=1758900300;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EztjVQ+y07YMfegmHOd0VyK62XkODMWu0LdNE29WAS0=;
        b=Wl/VO8FaEyfUoyE9oRYD/UpoUn7znGAl8zm7qlLFm/QhV8qzIh83nWbT+RF7LiUkXX
         uIUfRRyjFPZCckovsOULWk74mSVlpNkgMU+ZKB+Rq5sjQO30rhP3EyEpEYVcRnDlnc5O
         cgAE7/EbQYevwrTJ9wdzxgFj0JZXJn8lE7By+0DKcEdyAv8jkhzVnwyNrB90dPUb1rHm
         OLT1ER/E1b27+REI5ww/Fea5gJImeT37dWjx9KV5dld3ekCnlc76fwkKiIDPK0W22Xf1
         3hzOHBPjmOWizYEtsQZGAgsy3295Qkks4nu6Z9+tI3nMsVcClZkX5bqkBoT234zE6Adj
         OqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNHUkt4PWOCrdCEHEmwpjyC9r2T+854iMmUsJFBWhdjyAzs62mP/p6tbeMlpvUsPU6ls3ZXPD7wo+A5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxudJrVG4AkPQQGF1yIKVzFwALzcI7kQlXsYlNTxcYIzkVtPa9d
	ZXK8EsEsdmgL3JJY3ry0r+4nmM51T7BjWmCaIxPDr171zwtRVk3ajaqbDDgsxtmEXmFLhAxA4/+
	KSqFl5e1KVcn/dtEP9lwypSy4vYWfZ3DKpaKwH2qSEg==
X-Gm-Gg: ASbGncsizR0RfxqsyXI2rOHTpWTcEPz4D5Abx+OncpqGL2SkVAwzrxgOIixQWBRXuUL
	kmfPs0pclBkizIq34hglKWacIfKepsm+CkPlPffRZDI+ieylyRUUc0L/0fNX0iNYqmo3nQQe4Ts
	RaHaYZA80MjMarCT/TOB6EaX0di7nVcfTe5LJU9qylTLesjNlIMTrta3dJ5h5mTPVbPZaUh4MjW
	YAarEcqNQUQ0SI=
X-Google-Smtp-Source: AGHT+IHin4gQus9SrkFEog2pTedfunr2Ers950l0f82oxrEtfjemfexmsAorW/Dsqdjvay/GpFMt6pfW/hwC+qBHF14=
X-Received: by 2002:a05:6512:2c0b:b0:571:b70b:7dbf with SMTP id
 2adb3069b0e04-579e2507c81mr1455897e87.17.1758295499599; Fri, 19 Sep 2025
 08:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
In-Reply-To: <20250918195806.6337-1-safinaskar@gmail.com>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Fri, 19 Sep 2025 17:24:48 +0200
X-Gm-Features: AS18NWBwMqIXE_dMXDlT0ngUIReSbekPPTszWv5gIfg03bAEg3Id33JL3Yqjedw
Message-ID: <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Askar Safin <safinaskar@gmail.com>
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_082502_020121_63A3D15C 
X-CRM114-Status: GOOD (  14.97  )
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

Hello,

> > When booting with root=/dev/ram0 in the kernel commandline,
> > handle_initrd() where the deprecation message resides is never called,
> > which is rather unfortunate (init/do_mounts_initrd.c):

> Yes, this is unfortunate.
>
> I personally still think that initrd should be removed.

Considering that the deprecation message didn't get displayed in some
configurations, maybe it's a bit early at the very least.

> I suggest using workaround I described in cover letter.

I'm not too keen on having an initramfs just to loop-mount
/sys/firmware/initrd, after all current kernels are able to handle the
use case just fine.

It looks like there is a lot of code calling into specific filesystems
so that the initrd code can guess the size of the file system before
copying into /dev/ram0, and I believe this is what causes the main
gripe against initrd today. What is wrong with just copying
/initrd.image using its actual size into /dev/ram0 instead of guessing
it with the help of filesystem specific code ?

> Also, for unknown reasons I didn't get your letter in my inbox.
> (Not even in spam folder.) I ocasionally found it on lore.kernel.org .

Sorry about that, When I used git-send-email yesterday to reply, the
SMTP server I used wasn't authenticated to google, so all gmail
recipients were dropped. Hopefully this work better today.

Regards,

-- 
Nicolas Schichan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
