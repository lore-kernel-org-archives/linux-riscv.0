Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE46CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 01:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fiML3ldNMExaXrafTlrhhla0MMvf3IOidvdD1f/oMFY=; b=HSw5pw1S70x/gf
	SGaPgEPN0W0peetg+CIMEc57UOb0IHtQX0Hg8bjWrP/IJbWsSjj93aKVZJqFFuDcN7NIyJNIugOfK
	n/Rz4x+2OulHfiKizQp1q/88iDwcldOAALhOybAJDwRCVuGKVNs+LO0cTe+bXbZg+rdiuHyA3DKkr
	UnjfNqQMOO8vk3gMPtxG13Xx1W/ESdYsW+H5NYWkIGwn+oBq6ON0nP+YVgJGzmFWPrGss28845Tdk
	beMT5p/8Ve5LpDrig6E+thAqSuxRq8hpALKZepr0Y9u00/VMhUuBqaDYq6mdsVg64LcM1MZ7YLwUB
	w+BI5wtJZ4OafXw3+zYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyK8N-000000067Da-3gkw;
	Tue, 16 Sep 2025 01:05:27 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyK8L-000000067BM-1UlD
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 01:05:26 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-ea3f0d9150eso1951872276.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 18:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757984724; x=1758589524; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
        b=aT2vcyNK+8b9Z6sFaw7lJiZGASnH0agFEdUyn4XBleVj9J8VpDihbfmzkTa7WBCniM
         Fvl6ocq8wrSTgLaGbGHVXSAc0z3nJX42HLZQIE0Sbvbu9+rorF/NG2ZQj+Pz1EO5rAWk
         xV1tMU/Xl46ioqDzTEfvluOm2y52VA2V6g8o3rIYgYqQZD1zPrOAlqAQ+nad7azsbkl9
         3SXTDcwhi/odNYBYfbYIv2EqR3kn/5rfwaYlwLS7iKx9vYndm72Cgjhx0Eo9w6Lhnlxn
         Yj0cmYSkAVEJTuWgo2rGedu4jCjHhoqR6b7RR12fJkeSwjQ2QOJZCVYdHfm+1vla/01M
         L0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757984724; x=1758589524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4rwn8y0vRJNvu8C079VdIgUQlj+kBjL5HuZ7smgp/E=;
        b=ZMiBqYPi1+U64ETb1R+I8gtXMWLalkR518jHeU7lKW66hW0a/7w10OSd71KkOQaY3B
         U7suFPZlCfJ9Oj6biVWYirHMR5A77Vqd6VqRgWyCXTbK8rsSv/3Ny/l7Pv5E+qFSpJGd
         y+cok2/x8bJadg2a1VlrQvaNFzyhwWkQXhBvI/Iu4c+XdJ4vacjYBbgocNlZBhxwwDE5
         Dk3tWpsnUX3L+IddDXkiLp86rp1CO2JU/EdPve3DRGjLLidMV00EQpUA7BV+KqkIMgbz
         9+NUm3Zg/oSEVsibtq57Gq8CY/QgMcRJ9Gikbzj86J6kUUw7oBrJUHxE9T7/r56bosej
         ggCA==
X-Forwarded-Encrypted: i=1; AJvYcCW1hUdLvEFOYdlYDSneSh8Z7mJBb7dwS3MrF5nI9i1yZLBTIMAtuBo8FF9GqRhoDO4OkSKEq9W66gVVqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPg/4jgss5KAtzuo0K8CnbdjF5ie78wz5mCMVuDeSZK60mnXek
	iS5FJi0KJDkZV7/h589zEM7AfqeRo+OL713QdRJ8WUw1mRtcDSJ54qW7l92utOJRp6eVeHxL01r
	0qVJtylR4S3xLXz81bMJEqfNHU5ZLblk=
X-Gm-Gg: ASbGncu4CBy0WeVN/d34wZiRJCao075hf5iHVo2LMeM9R7WQHenLb/AQZWmDwgg8v4O
	5n01TMR69EvNsyTG0j4FZJew8rCsKTHZ8EGxTiIphgvQ1ddRhOjOA5IKzXqTRbFvJItuujchWaq
	fD/e6PCwoL7QWxz4xP+4lhUoRshrNJe8+E3gDnil4+rJZ36faoGR5UUjPFd0w2PLBUjiSin6bd9
	kzHEgTPX9ZkCmwR1A==
X-Google-Smtp-Source: AGHT+IFaJEo1gVHkPCEaCD3vWYjtreYFiQ2WOrRU9CIpbMyg97OVJtr/v3uxdpG+fiXE68E0IfjXLuECnr1bsw09sPQ=
X-Received: by 2002:a05:6902:2b02:b0:e98:9926:e5ca with SMTP id
 3f1490d57ef6-ea3d9a6c911mr10729577276.36.1757984723469; Mon, 15 Sep 2025
 18:05:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250915-modebranche-marken-fc832a25e05d@brauner>
In-Reply-To: <20250915-modebranche-marken-fc832a25e05d@brauner>
From: Askar Safin <safinaskar@gmail.com>
Date: Tue, 16 Sep 2025 04:04:47 +0300
X-Gm-Features: Ac12FXwuxsP2xoupllcCoDiRw8q2uuerrvP566PgC2Qr6qfMP36Zqdrto9P8zEU
Message-ID: <CAPnZJGAjfpHZn_VzU3ry9ZV6OUS0RN2iWos153_oM_PhVbMgVg@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Aleksa Sarai <cyphar@cyphar.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20250915_180525_407141_90FD2F33 
X-CRM114-Status: GOOD (  10.42  )
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

T24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgNDozNOKAr1BNIENocmlzdGlhbiBCcmF1bmVyIDxicmF1
bmVyQGtlcm5lbC5vcmc+IHdyb3RlOgo+IFNwbGl0IGl0IHVwIGludG8gbXVsdGlwbGUgcGF0Y2gg
c2VyaWVzLiBTZW5kIGEgZmlyc3Qgc2VyaWVzIHRoYXQKPiBmb2N1c3NlcyBvbmx5IG9uIHJlbW92
aW5nIHRoZSBnZW5lcmljIGluZnJhc3RydWN0dXJlIGtlZXBpbmcgaXQgYXMKPiBjb250YWluZWQg
YXMgcG9zc2libGUuIE9ubHkgZG8gbm9uLWdlbmVyaWMgY2xlYW51cHMgdGhhdCBhcmUgYWJzb2x1
dGVseQo+IGVzc2VudGlhbCBmb3IgdGhlIHJlbW92YWwuIFRoZW4gdGhlIGNsZWFudXBzIGNhbiBn
byBpbiBzZXBhcmF0ZSBzZXJpZXMKPiBsYXRlci4KCk9rLCBJIHdpbGwgZG8gdGhpcy4KSSB3aWxs
IHNlbmQgYSBtaW5pbWFsIHBhdGNoc2V0IHdpdGggYXJjaC8gY2hhbmdlcyBrZXB0IHRvIGFic29s
dXRlIG1pbmltdW0Kb3IgZXZlbiBhYnNlbnQuIE5lYXJseSBhbGwgb2YgdGhlIGNoYW5nZXMgd2ls
bCBiZSBpbiBpbml0LyBhbmQgZG9jcy4KSG9wZWZ1bGx5IGl0IHdpbGwgcGFzcyB2aWEgdGhlIFZG
UyB0cmVlLgoKSWYgaXQgZ2V0cyB0byBrZXJuZWwgcmVsZWFzZSwgSSB3aWxsIGNvbnNpZGVyIHNl
bmRpbmcgbW9yZSBwYXRjaHNldHMuCgoKLS0gCkFza2FyIFNhZmluCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
