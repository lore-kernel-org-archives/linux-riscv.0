Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27C4CAC5A8
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ic5cFTuP8zt6CPQAcTJsFBAiYe7LsjCppeZ3U97AFfI=; b=yP6EjC7SPWkAYs
	YiY4VpYkFWIEhi8aSROOqcc8r3BNIACKWFu2yXkd9Ub8dqSgHvkLSlREEde50sBQYRyCCkHshrgP3
	CtKYBsW7UwSPVHMx6n8G0LLchC3ULufKmztyG1woJs1nfFMsmK4aoPiDQHonhsm+VtLc5+N7ZbO0Z
	zYizJJgiAJ/30qMTRW1GaO6kIcSbHahIB79ryEyNSm6un2eidhNjFtpSZaOVF53gp24vh8Eeth4og
	EgG2u7p9lrOBM/kzhpmx7n7VWSaeRZ0JzEGwEMn0vleDNbgyTk9jKzSFgusYrTjZnYoO9cVERhnh2
	7eHNVWdISRvhrG4F+3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hXT-0000000Afmt-3wjj;
	Mon, 22 Sep 2025 14:29:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0hXP-0000000Afk2-1gnu
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 14:29:10 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso892733e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1758551345; x=1759156145; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zds9c11i5EPuC+LW5E2qVk5slu7nHVv1cCYASY1uK64=;
        b=P1ieyf2nIp2RpJk542YbXtX4cx12sh1wQ1iyNp6MCcE5vKczUKlsucJZcLwhqsHYD9
         5dIbM++7m7znKd5VQNwI8epOEPYmJlaRC2cTEOfWhxaKba+u5YRmkQC78BZb0vtv0mqQ
         U0k6GcRTXShatB8rN6MXqtPmjVmX/CjQJEmqCmywe22jIs40nxfuK2gnGfmH1sjwZBos
         J/BbhfA4mqEuSX/TX8VEjv5aMCQ49Bcla/NzNxRndwrd1fmv/c2P/stei8P6UEtGQCm9
         cWRgfwXPYBwZUZKWV5eMd11IJSXH6nvlNP+kTKIoJOKr+sR2dhBiwS4jbFIdLn0pzqIh
         /wag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758551345; x=1759156145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zds9c11i5EPuC+LW5E2qVk5slu7nHVv1cCYASY1uK64=;
        b=TOI1PUmViObm6gKjUsD/5Fgh9r9GYkfJAurTPmuDQkSTP+VrCxc/JZEafk37xh7598
         RIjVk8RlAmnMRsRPVaQpvvojNP51XlGbfX+OXbUMdAswFG8IGxuxwXBA7d2Ngv/jl2n3
         g7dZBzI8c0n7ntXOe2G/J1XZ2PhsjGx/tbTXe8gsMXzUqD4Xx9MgSFlEL1YQ+z2EF1WT
         1u9MnOCtjrO7C1cz5gILna+FSZsR6xcKcCbK9tNqeY7NeLXmH/qjO8cq4MQHBuZ5koXF
         SDmn/K9jSNL1g2yaR/RVpdebmVI7czJAgQRxP7vl96gf7bhvaZw6gQHSwITglfdenOWn
         g1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXa4Q24dAOxnuWWRRxdD0igdUvK1FjbkI6XNHhiX1z7V9MiWM/KnhSERYBrl97TohtFwNS1h8258PMCBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxGaqsKCxSJIpudl62nN172sIiAccAplohXsnQPm5G+YwsLvO8
	Aof9mxZD5Vw/H7wfgEYLi3M822ZnlKXpeEokppDDFkFjagsjkOtdzTXVs/32RXpwSWiygsvAWy1
	gaV5Q0gXKo86tjUqh7Dl6X20PRIUeclKAvrlwcLtBjw==
X-Gm-Gg: ASbGncskqqTeT5z9n5+1lJi1aKiO6MEF+l+6MySvcb7seHoxDVxbSi0EwVi7W0Ni2dy
	pSePDhAWC/GGfzAff+b2Jl5aCG7q4tlqcpohZzUOy86wRm2aXATa6C+vz+02pnUnBt0lsU9V7C/
	znSbh6NDfIrlhj/oDcE6x99EB9WsleN8qgoStK88JXAYghTRVFDsG4wc9bBJfhG/lzLCaNK5rRU
	7TyZX1l4AtQllA=
X-Google-Smtp-Source: AGHT+IF9Kx0YHTgWZximr8IphichwJGTQ/wmiFKfxBKU7xEPIwY53K1eZ5EsUZqb+vcW1xAllqgOcQU2VEEacURTmEE=
X-Received: by 2002:a05:6512:4389:b0:57b:478b:d8a6 with SMTP id
 2adb3069b0e04-57b478be162mr3313173e87.35.1758551344116; Mon, 22 Sep 2025
 07:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com> <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com>
In-Reply-To: <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Mon, 22 Sep 2025 16:28:52 +0200
X-Gm-Features: AS18NWBjmNA3KBj8cPrgwDAVm5OX9a5odWP7LbRlHvhoE96nP3yo2_PGoZ1JbG8
Message-ID: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250922_072907_561901_FFAC98B8 
X-CRM114-Status: GOOD (  22.97  )
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

W3Jlc2VuZGluZyB0byB0aGUgbGlzdHMgYW5kIENjLCBzb3JyeSBJIGluaXRpYWxseSByZXBsaWVk
IG9ubHkgdG8gQXNrYXJdCgpPbiBTYXQsIFNlcCAyMCwgMjAyNSBhdCA1OjU14oCvQU0gQXNrYXIg
U2FmaW4gPHNhZmluYXNrYXJAZ21haWwuY29tPiB3cm90ZToKPiBPbiBGcmksIFNlcCAxOSwgMjAy
NSBhdCA2OjI14oCvUE0gTmljb2xhcyBTY2hpY2hhbiA8bnNjaGljaGFuQGZyZWVib3guZnI+IHdy
b3RlOgo+ID4gQ29uc2lkZXJpbmcgdGhhdCB0aGUgZGVwcmVjYXRpb24gbWVzc2FnZSBkaWRuJ3Qg
Z2V0IGRpc3BsYXllZCBpbiBzb21lCj4gPiBjb25maWd1cmF0aW9ucywgbWF5YmUgaXQncyBhIGJp
dCBlYXJseSBhdCB0aGUgdmVyeSBsZWFzdC4KPgo+IEkgY2hhbmdlZCBteSBvcGluaW9uLgo+IEJy
ZWFraW5nIHVzZXJzLCB3aG8gZGlkIG5vdCBzZWUgYSBkZXByZWNhdGlvbiBtZXNzYWdlIGF0IGFs
bCwKPiBpcyB1bmZhaXIuCj4gSSB3aWxsIHNlbmQgYSBwYXRjaHNldCBzb29uLCB3aGljaCB3aWxs
IHJlbW92ZSBpbml0cmQgY29kZXBhdGgsCj4gd2hpY2ggY3VycmVudGx5IGNvbnRhaW5zIGRlcHJl
Y2F0aW9uIG5vdGljZS4gQW5kIEkgd2lsbCBwdXQKPiBkZXByZWNhdGlvbiBub3RpY2UgdG8KPiBv
dGhlciBjb2RlcGF0aC4KClRoYW5rcwoKPiBUaGVuIGluIFNlcHRlbWJlciAyMDI2IEkgd2lsbCBm
dWxseSByZW1vdmUgaW5pdHJkLgoKSXMgdGhlcmUgYSB3YXkgdG8gZmluZCBzb21lIGtpbmQgb2Yg
bWlkZGxlIGdyb3VuZCBoZXJlID8KCkknbSBsZWFkIHRvIGJlbGlldmUgdGhhdCB0aGUgbWFpbiBp
c3N1ZSB3aXRoIHRoZSBjdXJyZW50IGNvZGUgaXMgdGhhdAppdCBuZWVkcyB0byBwYXJzZSB0aGUg
c3VwZXJibG9ja3Mgb2YgdGhlIHJhbWRpc2sgaW1hZ2UgaW4gb3JkZXIgdG8gZ2V0CnRoZSBhbW91
bnQgdG8gZGF0YSB0byBjb3B5IGludG8gL2Rldi9yYW0wLgoKSXQgbG9va3MgbGlrZSBpdCBpcyBw
YXJ0bHkgYmVjYXVzZSBvZiB0aGUgcmFtZGlza19zdGFydD0ga2VybmVsCmNvbW1hbmQgbGluZSBw
YXJhbWV0ZXIgd2hpY2ggbG9va3MgdG8gYmUgYSByZW1uYW50IG9mIHRoZSB0aW1lIGl0IHdhcwpw
b3NzaWJsZSB0byBib290IG9uIGZsb3BweSBkaXNrIG9uIHg4Ni4KClRoaXMga2VybmVsIGNvbW1h
bmQgbGluZSBhbGxvd3MgdG8gbG9vayBmb3IgYSByb290ZnMgaW1hZ2UgYXQgYW4Kb2Zmc2V0IGlu
dG8gdGhlIGluaXRyZCBkYXRhLgoKSWYgd2UgYXNzdW1lIG5vdyB0aGF0IHRoZSByb290ZnMgaW1h
Z2UgZGF0YSBzdGFydHMgYXQgdGhlIGJlZ2lubmluZyBvZgp0aGUgaW5pdHJkIGltYWdlIGFuZCBp
cyB0aGUgb25seSBwYXJ0IG9mIHRoZSBpbml0cmQgaW1hZ2UgdGhpcyB3b3VsZAppbmRlZWQgcmVt
b3ZlIGEgbG90IG9mIGNvbXBsZXhpdHkuCgpNYXliZSBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBy
ZW1vdmUgdGhlIGlkZW50aWZ5X3JhbWRpc2tfaW1hZ2UoKQpmdW5jdGlvbiBhbmQganVzdCBjb3B5
IHRoZSBhY3R1YWwgc2l6ZSBvZiAvaW5pdHJkLmltYWdlIGludG8KL2Rldi9yYW0wLiBUaGlzIHdv
dWxkIGFsbG93IGFueSBmaWxlIHN5c3RlbSB0byBiZSB1c2VkIGluIGFuIGluaXRyZAppbWFnZSAo
bm8ganVzdCByb21mcywgY3JhbWZzLCBtaW5peGZzLCBleHQyZnMgYW5kIHNxdWFzaGZzKSwgYW5k
IHRoaXMKd291bGQgc2ltcGxpZnkgdGhlIGNvZGUgaW4gaW5pdC9kb19tb3VudHNfcmQuYyBncmVh
dGx5LCB3aXRoIGp1c3QgdGhlCmZ1bmN0aW9uIHJkX2xvYWRfaW1hZ2UoKSBhbmQgbnJfYmxvY2tz
KCkgcmVtYWluaW5nIGluIHRoaXMgZmlsZS4KCkkgY2FuIHNlbmQgYSBwYXRjaCBmb3IgdGhhdCBi
dXQgZmlyc3QgSSBuZWVkIHRvIHNvcnQgb3V0IG15IFNNVFAKaXNzdWVzIGZyb20gdGhlIG90aGVy
IGRheS4KClJlZ2FyZHMsCgotLSAKTmljb2xhcyBTY2hpY2hhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
