Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD0BC02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 20:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfISpjjjL9Pex5WNODEvZXqcOcUA+hjdk0UC3Srfp/M=; b=uViIMQJpo4UXIB
	HdHp5Woo4cYOxecjgZVIq2YG+gL0ZzofEOrYHoTK8Texq5+mDf7SiHGuOz3oNSM+9QMsm+tCCJpQH
	ZERwvd1uPCq8ogqu1PwkV4rKyiiFH0Amvusf6qjoAOCS6wHil5CpbAkAvlHbBKmEXSXwmErq4xcq1
	7vDdG/CCaAm7qG6omYT089V1w7BhfpvTxordScwjMDp7hMlFS8G0aCCTKlPY9EEe62YGEm901dJD/
	e1Ggnt+42EkHKoH/cA4gImKPjwO3QOUVlIRKZJpHQftBcgtYOyE/ng49rGS0Vkj+giAae/VQ1DAFf
	NuxHe6MMA6dbYLg1e5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWpi-0000000G4up-45tA;
	Thu, 16 Jan 2025 20:51:18 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWls-0000000G4TY-2DuE;
	Thu, 16 Jan 2025 20:47:21 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6ddcff5a823so12714116d6.0;
        Thu, 16 Jan 2025 12:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737060439; x=1737665239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4WaxXi2+hLFc11CwCXtWWCzphbkvrV7PTL31qaoaOM=;
        b=ZoOUuGS5/AELpiVjpjG/NCRNb9tyk/BJpOl1XFOigNch2X4uTZ9yWnDwLRBcuuMnHL
         V1bqvmEwLI6WdmtxnZRwJ31enl3wPoulMDFG6MHtRZdolca1Q5UYS+sZTMMpb63SapJR
         TaFGsmU/3L5cBM7udUrhDqvvkTgag9LMdLVaXO+xbnnW7DUwWtbuE9/DdwfDAkvVLUlM
         OdYYRO3+3GjsixjXgQHdIQc+yWwDQm/BzEWt1PFnBYsu+eAu2pSr+JW6MSpaEWfBAnu5
         5oadzMK04jwpRxkAGyzA23CziS/kVFgrvFgsW46IaXZIOKhb3L4PWTqWuSsIrN3KYESd
         A3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737060439; x=1737665239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4WaxXi2+hLFc11CwCXtWWCzphbkvrV7PTL31qaoaOM=;
        b=RN8QLKfaDtuWY1NCeym/bm4lzkDBbtoos4HIzJ3zlNAcOJXgX0cNG775kudoFhGSj6
         /qwI3gdy42j1FcVhkBU6B5kZdauYVmdT80y/q24vP2+M5iAPXASHaG1XfxTDH+HiEHXV
         vbHaUHdX/vTB7GJnO8c5/+4qzZ/qpOaCihzClshskLbQnceFSF7zTsaQ7SoyfQ8C5UsR
         BiG2MPsVCvN1uIbX6Mkd7k4UQdpGDg0FQgsOESqj8sG+UGeOQh1ly6nO7IPJnP2D1rv0
         3z6WR2zgtF7OU54OyLAt1yr/dhOni2ahoM8JqqpfM+eG+MZdQRG2Y4Iai+t2Z3vJmGyg
         vD2w==
X-Forwarded-Encrypted: i=1; AJvYcCU0YjIepjw9fzhOCkt5oRyoismNPli1jJA9ruuWTKIm2pH8CN18pHQDXIT1zsvB+az+szLfNr9sXhDx3ahrO/wpfhR5@lists.infradead.org, AJvYcCV8UB3mqsqn5VLkZZO72PSyujofOx7XfxrH8LeOpCdSptMQ/QYFvNJoofKrrJdSMsjbWNpIIPoI1462RFA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ1aw9iZ8r/nxQKl/GrVV/Hv0YZoU0gJJKY/6q2CRA0/KZpqSY
	l/q4jW3YMAled+if8H6lqQOuF559tVFHHMOdzgjp6SjXrmTH68zaSb1LjBPLC5mT3taeSfJINUY
	HiCuAv7+XJ1+RmMyNTQ9xHi+EybI=
X-Gm-Gg: ASbGncvGUJdZpa3IsfuH5PHBu4fFJwmC0iC6KAXyrci7uPOZ9Kjsbu0XtRmfuy1all/
	a6tDRAGnEyWVIU3b0fiTQ2Ubj9d5q8X4k1eD8lg==
X-Google-Smtp-Source: AGHT+IHkiMkxTT+D/jUmccrpj641SbpMcRFsm0/PjGiESgQXTK8ry7/fBlshiko5P+U6Wk0IaoScZJqKTAzwl10WUSs=
X-Received: by 2002:a05:6214:d67:b0:6d3:b936:60d1 with SMTP id
 6a1803df08f44-6e1b222f30dmr4145206d6.33.1737060439255; Thu, 16 Jan 2025
 12:47:19 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <20250114-316084c962eb867c0b681043@orel> <CAKp59VFkW8F2xHsgAxiw138ZrpQJL8R5cTkF8f9vY40iEoRbWg@mail.gmail.com>
 <20250116-aa9eadde9279e66dbc01c705@orel> <D73F98QBJ4S9.3CN2ZUQ0GSMT6@ventanamicro.com>
In-Reply-To: <D73F98QBJ4S9.3CN2ZUQ0GSMT6@ventanamicro.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Thu, 16 Jan 2025 21:47:07 +0100
X-Gm-Features: AbW1kvYRLMdilN-fKQeGs9HLVXMRAcFvnbevXtEayIrgWQ6TZbBT9Zlq_f2m72k
Message-ID: <CAKp59VFN+vfdvg0jVsLiQitoTDAVg=ZsuatPJkwcLdG7RqUqMw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	jgross@suse.com, aou@eecs.berkeley.edu, Milan.Djokic@rt-rk.com, 
	rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, 
	oleksandr_tyshchenko@epam.com, iommu@lists.linux.dev, sstabellini@kernel.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, xen-devel@lists.xenproject.org, 
	Slavisa.Petrovic@rt-rk.com, takakura@valinux.co.jp, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_124720_570509_35983691 
X-CRM114-Status: GOOD (  22.54  )
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

T24gVGh1LCBKYW4gMTYsIDIwMjUgYXQgMTE6MjPigK9BTSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiAyMDI1LTAxLTE2VDA5OjUxOjI1KzAxOjAw
LCBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPjoKPiA+IE9uIFdlZCwgSmFu
IDE1LCAyMDI1IGF0IDA4OjA0OjA1UE0gKzAxMDAsIE1pbGFuIMSQb2tpxIcgd3JvdGU6Cj4gPj4g
T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgNzoxOOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4+ID4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMDU6
MDk6MzZQTSArMDEwMCwgTWlsYW4gRGpva2ljIHdyb3RlOgo+ID4+ID4gPiArI2RlZmluZSBTQklf
RUNBTEwgMHhFCj4gPj4gPgo+ID4+ID4gU2hvdWxkbid0IHRoaXMgYmUgMHhBMDAwMDA3LCBpLmUu
IHRoZSBTQkkgZmlybXdhcmUgc3BlY2lmaWMgZXh0ZW5zaW9uCj4gPj4gPiBmb3IgWGVuLiBPdGhl
cndpc2Ugd2h5IHJlZmVyIHRvIFNCST8gTm90ZSwgJzB4RScgaXMgYW4gaW52YWxpZCwgbGVnYWN5
Cj4gPj4gPiBleHRlbnNpb24gSUQgaW4gU0JJLgo+ID4+ID4KPiA+PiBIeXBlcmNhbGwgaXMgdHJp
Z2dlcmVkIHRocm91Z2ggU0JJIGFuZCB3ZSBkZWZpbmVkIDB4RSBqdXN0IGFzIGFuCj4gPj4gU0JJ
X0VDQUxMIElEIG9uIFhlbiBzaWRlIGZvciBoeXBlcmNhbGwgaGFuZGxpbmcgKGFtb25nIG90aGVy
IG9wZXJhdGlvbgo+ID4+IElEcyksIHNvIHdlJ3JlIG5vdCByZWZlcnJpbmcgdG8gc29tZSBzdGFu
ZGFyZCAvbGVnYWN5IElEIGhlcmUsIGp1c3QKPiA+PiB1dGlsaXppbmcgU0JJIGZvciBoeXBlcmNh
bGwgaGFuZGxpbmcuCj4gPgo+ID4gSWYgdGhlIFNCSSBzcGVjaWZpZWQgRUlEcyBhbmQgYmluYXJ5
IGVuY29kaW5nIGFyZW4ndCB1c2VkLCB0aGVuIHRoZQo+ID4gaHlwZXJjYWxscyBhcmVuJ3QgInRy
aWdnZXJlZCB0aHJvdWdoIFNCSSIsIFhlbiBpcyBqdXN0IGRvaW5nIGl0cyBvd24KPiA+IHRoaW5n
IG9uIGFuIGVjYWxsLiBYZW4gZG9lc24ndCBoYXZlIHRvIGltcGxlbWVudCBTQkkgYXQgYWxsLCBi
dXQgaWYKPiA+IGl0IHdhbnRzIHRvIHByb3ZpZGUgU0JJIHNlcnZpY2VzLCBhcyB3ZWxsIGFzIGl0
cyBvd24gaHlwZXJjYWxscywgdGhlbgo+ID4gdGhlIGh5cGVyY2FsbHMgc2hvdWxkIGJlIGVuY29k
ZWQgaW4gdGhlIHNhbWUgd2F5IGFzIFNCSSBmdW5jdGlvbnMgYW5kCj4gPiBhbiBFSUQgYWxsb3dl
ZCBieSB0aGUgU0JJIHNwZWNpZmljYXRpb24gZm9yIGh5cGVydmlzb3Itc3BlY2lmaWMKPiA+IGZ1
bmN0aW9ucyBzaG91bGQgYmUgdXNlZC4gRm9yIFhlbiwgdGhhdCBFSUQgaXMgYWxyZWFkeSBzcGVj
aWZpZWQgYW5kCj4gPiBpdCdzIDB4QTAwMDAwNy4KPgo+IFNCSSBzcGVjaWZpZXMgYSBjb21wbGV0
ZSBjYWxsaW5nIGNvbnZlbnRpb24sIGJ1dCBpdCdzIG5vdCBuZWNlc3NhcnkgZm9yCj4gYmluYXJ5
IGNvbXBhdGliaWxpdHkuICBTQkkgYWxzbyBhaW1zIHRvIHNpbXBsaWZ5IGNhbGxlciBBUEkuCj4K
PiBMaW51eCBtYWludGFpbmVycyB3aWxsIHdhbnQgYSBnb29kIHJlYXNvbiBmb3IgaW50cm9kdWNp
bmcgc2VwYXJhdGUgWGVuCj4gU0JJIGNhbGwgZnVuY3Rpb25zL21hY3JvcyAobGludXggYWxyZWFk
eSBoYXMgc2JpX2VjYWxsLCBzbyBwbGVhc2UgdHJ5IHRvCj4gdXNlIGFuZCBwb3RlbnRpYWxseSBp
bXByb3ZlIGl0KSwgYnV0IHRoZSBFQ0FMTCBpcyBndWFyYW50ZWVkIHRvIGJlIFNCSQo+IGNvbXBh
dGlibGUgYXMgbG9uZyBhcyBhNz0weEEwMDAwMDcuCj4KPiBhNyBpcyBuZWVkZWQgdG8gZGVub3Rl
IFhlbidzIGV4dGVuc2lvbiBzcGFjZSBhbmQgdGhlIHJlbWFpbmluZwo+IGlucHV0L291dHB1dCBy
ZWdpc3RlcnMgY2FuIGJlIGltcGxlbWVudGVkIGluIGFueSB3YXkgWGVuIHdhbnRzLgpUaGFua3Mg
Zm9yIGNsYXJpZmljYXRpb24uIFdlIGhhdmUgY2hlY2tlZCB0aGUgU0JJIHNwZWNpZmljYXRpb24g
YW5kCmV2ZXJ5dGhpbmcgaXMgY2xlYXIgbm93LgpXZSdsbCBmaXggdGhpcyBpbiB0aGUgZm9sbG93
aW5nIHBhdGNoIHJldmlzaW9uLgoKQlIsCk1pbGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
