Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE22ACCD187
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 08:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LleIdSGIXaSIVvBH/JyHOCjnGoQ06wn3QfBp3e4wgoA=; b=0CnvxHfe2fU2M3
	EORyM1jYH5AN2shvqQRl+mkG9+M11DxBWwL+0aum4iX2gKNTj9LOJ3rwpVc9/2vrpyG5Sb02RYCc3
	UH6tch7P+Wi68Xeiesf6KzoUkM4EgHWVdEjolD0yEhb/f5NhsbjfOubhpLmC/fSZ9hIrTTDR3AEWh
	k6DkFzMqJA94RrLLmen9YCA1cD/rXHskxNOpmxIAYlAzHQanoKWvqMpPBeL4D7mssFH21GpAmGLrJ
	X3Z+wQtgIRbhVoQTZW/19tRMrq0JuN+UEoDdKaHgYtYbuzlPb1W66fGtxS5DT0f5A29UtjLHlvHLP
	GmQhZM+u5IGLQXM9yQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mFT-00000005XnA-1LSC;
	Thu, 09 Oct 2025 08:43:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mFS-00000005XmR-16Rt
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Oct 2025 08:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=; b=lhRx7b65upfq2OhBVrjQeT82hk
	dCPCJxtL3eGW+njIYgW/vjqnesHkER9S+UniHu7zybnX0+FGjR27PJG5F0SOrmC/DSBxYeNiDXVh7
	I9BO61En/UZV/WabQV4KEFN/R2W+WsXmBkTfuIYML+OPS/XglUFJhgzNKr+bXF3w6SJeyro5fkEIC
	gqMdmcS/SUGPL6B4TpL50ivfnHq5MwoYqxe7inOXNZmbU5UKAG7sB3MKKsEbHWTzDoDWtTX7gGEId
	9mHalwjQwZVm+fZkfk5C7Qun1zkuNNDWuH2qIciPSkvQPFSJAIpH7JRf//8O35+f3E1ffSKX4QkOw
	4bghUYrg==;
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mFO-00000001JK3-2Vvc
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 08:43:40 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-71d6051aeafso7391977b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Oct 2025 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999416; x=1760604216; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
        b=C6BOkosjlHa5VkwhZfh4j+ONXYtGY72PJsF2FjfJap1x36ou7RfHimBT88ck1DLlus
         d44YI4r6TgGfy+qaA1Y5pBcm7gj+imB3YubptbNvteMRFJdsy0vrmDDZz9uvnJfuaeld
         Uc5T5tfGMzNWl9HXcb+a63wHTkS43zEfdIQ3zdWg8M4DZBFrws0DaUoSnhuES65wDk6h
         4mrTN/xHnZU3YojS5vfnAJvTy9UFCp91iREx3Ub4DK13pGEpX41A8Jb8iC6R7EOCTKe+
         WoYnb7d1dxF+vt2+NDAdsyOmVWLxvvRK+KPOzAngAXE/CZ+oTlgQPLSD0DdlchQ1KuSi
         FGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999416; x=1760604216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
        b=B/2B48YVJTuTwDX6Gdd6D2OnhMvJix00VloSxJ10RDgYs+0IsG53MQHrcLkAFSDS49
         4YgEb7thdOxWzlAw0sldJuQfyLB0xs5r6I+TRj/YvHlrIHBfiGfsEJ8qEnMBBB+fvEds
         ogJFiyLo/P2M5o33e+w96oMXaMnMTa/Di/CT71nuULdS+mT5Xll6GhtJbwMm//t3HWiB
         26TFhCcbiwyWepCPjflIiN3gD98A0eGacbudbIE7F4H2BFggSkUTnq5mln17QqeJqaHH
         ALMk1GFmcU72AHnahlTYpDn/sWAI1xE9FsibcvdMjHpRKQxIEMzewrhPoNjWgcRCHsp8
         T2NA==
X-Forwarded-Encrypted: i=1; AJvYcCU0unoXEZ3vaEhnZ3eQWxgZaV3GXVR+3syvYMEa1tgmw3s1TMBfNdsK7C5AWyDNaFZnmrsGB1/faNBZZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt15NufSepr5e3XvmN4GxHVnKKXpzRvHELAil0EhYCw+r78xZe
	txBtpn2DomcvTojuOwrn0I8a03G8fk/l+2R3E/6v0chmDlkZVC++CjgKGLiTflbbbIBl5u4koZ0
	EKmNPG0Mf6DBEuxx63XTgjSpZ/z1+hHo=
X-Gm-Gg: ASbGncs+yMGp+FQ3IK+IDwfv6B/aILM5qWhCpdVjSBWC18mYQXtJ/7mAz2VD11wzYTl
	OYodSPyeYxXtibwr1DRraS5vjjTmT5kkAwUfjSlnGqUdhS/bB36yS97V9sL5Qpb1/1sYuBkHRaZ
	c8m8Nc0gXfGEuT/hjf8XLpu+YROKwAadRi88zOvuBERikJT3QhzuzxUQOtFs0xkyQWXx5Jzvn6c
	VJLMN6H/WusuCYGGlmyR/ApQNfh21UMUU50xMhyhw==
X-Google-Smtp-Source: AGHT+IHqqt7JHMFlL5DEMxX8/4fuWke6o7x715NV65SuEycRYAp5q8y3uA9SPr+Cccah/gPAgRpT2LfWBS7AmxUm0/4=
X-Received: by 2002:a05:690e:146:b0:635:4ece:20a9 with SMTP id
 956f58d0204a3-63ccb91d5e0mr4410660d50.46.1759999415603; Thu, 09 Oct 2025
 01:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
 <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com> <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
In-Reply-To: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 11:42:59 +0300
X-Gm-Features: AS18NWA7xuLtf9pobQHoPGHI9uL9SjsnEaZg-EuuD52zBO81KbUszIYBPPZ5wRY
Message-ID: <CAPnZJGAp-wG+9wDmmisfpxvFbRtXkG-RipAuZe=fi1BWy-3G-Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251009_094338_969522_7E8E7898 
X-CRM114-Status: GOOD (  12.85  )
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

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgNToyOeKAr1BNIE5pY29sYXMgU2NoaWNoYW4gPG5zY2hp
Y2hhbkBmcmVlYm94LmZyPiB3cm90ZToKPiA+IFRoZW4gaW4gU2VwdGVtYmVyIDIwMjYgSSB3aWxs
IGZ1bGx5IHJlbW92ZSBpbml0cmQuCj4KPiBJcyB0aGVyZSBhIHdheSB0byBmaW5kIHNvbWUga2lu
ZCBvZiBtaWRkbGUgZ3JvdW5kIGhlcmUgPwoKSSBzdGlsbCBwbGFuIHRvIGZ1bGx5IHJlbW92ZSBp
bml0cmQgaW4gU2VwdGVtYmVyIDIwMjYuCk1haW50YWluZXJzIHdpbGwgZGVjaWRlIHdoZXRoZXIg
dGhleSB3aWxsIG1lcmdlIG15IHBhdGNoc2V0LgpZb3UgbWF5IHRyeSB0byBjb252aW5jZSB0aGVt
LgoKPiBJIGNhbiBzZW5kIGEgcGF0Y2ggZm9yIHRoYXQgYnV0IGZpcnN0IEkgbmVlZCB0byBzb3J0
IG91dCBteSBTTVRQCj4gaXNzdWVzIGZyb20gdGhlIG90aGVyIGRheS4KCklmIHlvdSBzdGlsbCBo
YXZlIG1haWwgaXNzdWVzLCBjb25zaWRlciBhcHBseWluZyBmb3IgQGxpbnV4LmRldiBlbWFpbCwK
dGhleSBhcmUgZnJlZSBmb3IgTGludXggZGV2cyAoIGh0dHBzOi8vbGludXguZGV2LyApLgoKQWxz
bywgSSBqdXN0IHRyaWVkIHRvIHRlc3Qgd2hldGhlciB5b3VyIHVzZSBjYXNlIGlzIHN0aWxsIHN1
cHBvcnRlZCBpbgptYWlubGluZSAoaS4gZS4gdW5jb21wcmVzc2VkIGluaXRyZCB3aXRoIHJvb3Q9
L2Rldi9yYW0wKS4KSXQgdHVybmVkIG91dCB0aGF0IG9uIG1vZGVybiBrZXJuZWxzIHlvdSBuZWVk
IHRvIGVuYWJsZQpyZWNlbnRseSBpbnRyb2R1Y2VkIENPTkZJR19CTEtfREVWX1dSSVRFX01PVU5U
RUQgdG8KbWFrZSB0aGlzIHdvcmsuClNvLCBtYWtlIHN1cmUgdG8gZW5hYmxlIHRoaXMgd2hlbiB1
cGdyYWRpbmcga2VybmVsLgoKLS0gCkFza2FyIFNhZmluCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
