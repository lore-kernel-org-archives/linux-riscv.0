Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA74CAC5A0
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 03:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qMXzXK+z+zojjc32URD77V7NTUsOQN56aD5DM7swFA8=; b=v8RcyUSVHAFuuq
	m0j4sz6txYX91Wm1vuzLKbwNJZsiwPxZfJMIkk+Ox09nUgI8DiMyKQnMZMgwB3LOgDOmpxmp12mcy
	T8U+Jc4d31IO9zcOL2EX6FHCjCdpPUB/A/AUcDornO3x0+Qotx702l+qUKrZeFGkibDCfU3Yj4b/N
	4AtCaYLJ0Tx/g8GauZvXFR3ktC3zX7B8zoOQy3PFp2RRlUgf5/QUrhstV3JgNZtYbpTEMMexcrhqF
	iVDAr50SAiukI2i36JpLqrYJSjrk0bJ7D0wAX8gwZzvikuZeFVoLjdPW/eDGKoc6I8bzgh4XqKpbR
	XTxLhC7EL2Bk1fNHeNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzohG-00000004gcO-3ZRL;
	Sat, 20 Sep 2025 03:55:38 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzohD-00000004gaf-3pKU
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 03:55:37 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-ea5bc345eddso2257563276.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 20:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758340534; x=1758945334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=LOBZL0WJkbfdvSEIhDYYVJqbnDIy5O/FGjT8qeBG6cFhsDNoXlkGLLCTUHFXB2U1i1
         2h0CbS1ZWGzYFdwusgU+QOfCfqkJpY00odG9uXpOQ7yh6YAylJsVmwi0rTcxxT48h0cV
         6royviXFGGZ/eIgxCV/otVVM3cQ1XwVyQmYObEOLpjnnCiyHR9UaYx778o4JDFZE9mgr
         CxRjom846231CMq8OssPqFVxTzgJFtlBluWwB1kaVwNU019p0upJ+dN0C14lSfRIy+Uh
         cFa7HAUKfRAiIv1UgnKZMbdhBH9m2I8lsCSxNISo+KTZiHNfTTCxHEze37Fb4pccFHGP
         HMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758340534; x=1758945334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLR5A4WVJygISPHG42IIvYb+LPD25B9I3WH7jC2e5xU=;
        b=lDXbNPyupMSy5yUFn4J/c65sEQ117+5B2e1nC8SCYqRUUKjutRwuNUTfLoUbfnA7nD
         PtZWG14Yf5jvPiRaZqW3LTclacNwashlX5DVmELuIomkEK0TBDdDpz8cuDFKaMwTKm9b
         H7GgwAOLHXeK/ZJ4Fb62XZ1L4NJtnerXMfVFZGsbcFzgnawcYfJyzJPtS6RE/OfnxuRV
         GBYTdvPQIq+uQ8FYbXcyS+yx1ZNodHpgR3GSQBHuIC6mp5qENCV90X5GpJM9jyEgJwGh
         Hq09xXaZ5LkQSy2B2b/6db7H5cr+Q3W2pS4Av0jqnYrb6BoQ35rUGiH0Ts+jTy+spCiy
         HKvw==
X-Forwarded-Encrypted: i=1; AJvYcCU2dBTWt/9UC/DN3lMSzNO+Ap4y+Ow4UOtNEIs3i/9bkiEdksD4jCQ6JvbArtEQlr1X3ayyx3KILsJL3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLOHFgvOlJFNzcpZWY09xDfiFbjk/0AEknUN1Ua1aHDKPxvTQ6
	NCqYmVREuzBwpwwzGwfsa/G0j9hCt0Jf4IUF/8h2LGPf8pmWV1xdZS9H+G16Ynr6WrN1Szm85vh
	RBtvJwNl2bKnhk9rBOavfiEg+2c3BuXI=
X-Gm-Gg: ASbGncss8gis3ckZR64qy6iIHwxQ4K3eQOwHTzsudfbk4cNRSQfp5XKDfm+tlnC8nNB
	YKAFiUsZZW54I568OKOZ4svFkaMbWa1QpGkgtpUVP8W1XFGetXHdSGDMH/9RoqEUuQcCzMU14uc
	TsbUILPDA6NglCq3G3LdQmBhnjBhZepN6qJkt+7yrRopOzFl4VEMOn4epg2NccKijVIzhWKkctl
	O2w6jU=
X-Google-Smtp-Source: AGHT+IH7cxRQcDAWrx6iopGK0fgAvvotX/SwRt/T/KElvH4XQULrd96czgOrVv1CSvA0vDpbRNCMKcVlhfdowxEBryU=
X-Received: by 2002:a53:b3c5:0:b0:622:4818:ce38 with SMTP id
 956f58d0204a3-6347f610c7emr3546092d50.37.1758340534336; Fri, 19 Sep 2025
 20:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
In-Reply-To: <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Sat, 20 Sep 2025 06:54:58 +0300
X-Gm-Features: AS18NWCqg0xtU5KiNe17DWjmiPCEbBI_FSj5NCOyDGZFj_7oFaRqSu7O_vUKCrA
Message-ID: <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Nicolas Schichan <nschichan@freebox.fr>
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
X-CRM114-CacheID: sfid-20250919_205535_981092_E2A0550C 
X-CRM114-Status: UNSURE (   7.06  )
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

T24gRnJpLCBTZXAgMTksIDIwMjUgYXQgNjoyNeKAr1BNIE5pY29sYXMgU2NoaWNoYW4gPG5zY2hp
Y2hhbkBmcmVlYm94LmZyPiB3cm90ZToKPiBDb25zaWRlcmluZyB0aGF0IHRoZSBkZXByZWNhdGlv
biBtZXNzYWdlIGRpZG4ndCBnZXQgZGlzcGxheWVkIGluIHNvbWUKPiBjb25maWd1cmF0aW9ucywg
bWF5YmUgaXQncyBhIGJpdCBlYXJseSBhdCB0aGUgdmVyeSBsZWFzdC4KCkkgY2hhbmdlZCBteSBv
cGluaW9uLgpCcmVha2luZyB1c2Vycywgd2hvIGRpZCBub3Qgc2VlIGEgZGVwcmVjYXRpb24gbWVz
c2FnZSBhdCBhbGwsCmlzIHVuZmFpci4KSSB3aWxsIHNlbmQgYSBwYXRjaHNldCBzb29uLCB3aGlj
aCB3aWxsIHJlbW92ZSBpbml0cmQgY29kZXBhdGgsCndoaWNoIGN1cnJlbnRseSBjb250YWlucyBk
ZXByZWNhdGlvbiBub3RpY2UuIEFuZCBJIHdpbGwgcHV0CmRlcHJlY2F0aW9uIG5vdGljZSB0bwpv
dGhlciBjb2RlcGF0aC4KClRoZW4gaW4gU2VwdGVtYmVyIDIwMjYgSSB3aWxsIGZ1bGx5IHJlbW92
ZSBpbml0cmQuCgo+IFNNVFAgc2VydmVyIEkgdXNlZCB3YXNuJ3QgYXV0aGVudGljYXRlZCB0byBn
b29nbGUsIHNvIGFsbCBnbWFpbAo+IHJlY2lwaWVudHMgd2VyZSBkcm9wcGVkLiBIb3BlZnVsbHkg
dGhpcyB3b3JrIGJldHRlciB0b2RheS4KClllcywgdGhpcyB0aW1lIEkgZ290IHlvdXIgZW1haWwK
Ci0tIApBc2thciBTYWZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
