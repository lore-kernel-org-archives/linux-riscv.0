Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05754D1814C
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 03:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlldU6ChZFXn4BjZo/vw2mQCNYl2fTHttbUi5t5aHr4=; b=BGnEq7DK1rJMwQ
	mT4MTSPz8lURdPbSUbXrmzkpWAGNAwKYDw/O8snb+shTNo7X7Ksc0JvBllYTlA+ic+skhnRdl/9ZG
	TYskBJf/B+j9Q29Uog7yfKiRJcnNFUF1tSApwVUp7a50/T/S8R5HvSWYfMnL1xtxBH5c6Pv0vCTuK
	3Qb9zG+0rtVrkmYg+TDMNk6XTdtlnb3lGT1U/x2CiBupvz1HR8kq+hbyxH9Hz8U6+B8zYly9IY9So
	R2IMdyHqUFVZxF2OuRBkHEzEGZ/g9p4iGAIuJhxiYaZLi8i4unoD50fqe7MeSOzf8qwLX7kE0mFCb
	iuiHHPSnr8F05TNXX8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0XrV-00000006wsj-2St7;
	Tue, 15 Oct 2024 03:04:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0XrR-00000006wqk-3yxl
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 03:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728961476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LILJl12FRTprkZPDsnRty3i0K05AFLZzsWu9wwpXxI=;
	b=LhA+lqqx/PRbhSL0UIHw5uB90tDsym+Z6OdeYNQFLJNAAUIhlNm6MGLDsPrfN95J5JJ6pW
	Z4BGCguoysuS/C5Csi8zOk5hDjzDUk+8LUsPaaMT1umkDrFjbzmhNjONTS6CKfBx09FMbX
	aYBF6ECAiCSKzK9vZvLzkcwJTP58E+s=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-zTKcFgOEOQaYYgXWrKa_lQ-1; Mon, 14 Oct 2024 23:04:33 -0400
X-MC-Unique: zTKcFgOEOQaYYgXWrKa_lQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7ae3f3529faso1277421385a.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 20:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728961472; x=1729566272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LILJl12FRTprkZPDsnRty3i0K05AFLZzsWu9wwpXxI=;
        b=rKNi0GwKHlk3jedoabzgjP+m65NfmSczsV6CuZ60lB8PyVf4s1mcWWnZJ+1oQcdRWU
         pxCJd3Cv16o4/TMuLECWJuAkWpvkYE19+XCWa6Bzw5Z76uMi5JcJYDGR+K+Y6saCoraT
         fIYmUP2AkMoDFpNgafFBWNIkvor9u/8kDdCJS79xDdwMnBKUaaO4jdwgcQfMgioYPVTJ
         5EKh5eiMvczPc0tI74h0+bH7o4OpxxYI36zbiQIF1ht3Haotj4UHig+TRWkRfxEJCCoy
         gPJUW8BZFeoJIb36Xc6ETinDEvXSEOzXKYUhZNK+6R5Ta9nJha9PMaadkiNEnVlIp0gk
         f7ig==
X-Forwarded-Encrypted: i=1; AJvYcCUhWiAYvS/aNEQjep/TLpPjCyrY91HvYjLLWJvXnxi7GceFOTm/SfQgBAmOzhR6VMs5BuwOehrIn7yViQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/QNg7DzhxsD7BrbXLj3QDisi0xS83Qajz0NElyNc6IdtdbQs/
	yXpOjtU4IpS6lJANXG5avDu6/71eSSYwNpvW8BYxJSBWySHukWdOJbv8vo25qElB8n5rel7pqIL
	FFTYypkadwHGWAb1OSgL8rTQ7fWvXyRcd9dvKYRoVB9XShwTAwYWgpAJ1S8/SUaMaY1RtFxhVoH
	ldgbPS0IPJPUV7I/kDUjrA9ADVvcrQeRZ1YrLZhPOp
X-Received: by 2002:a05:6214:5347:b0:6cb:e9eb:1b24 with SMTP id 6a1803df08f44-6cbeff63948mr208010716d6.24.1728961472415;
        Mon, 14 Oct 2024 20:04:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp3T4Yepy5h5DQueUeaIl2hWfHF7EpApBAxl9jBnWIq5Z+upYe1XYSqd8+UMzLGOwXgyDg2kobb+ggSdFvo7w=
X-Received: by 2002:a05:6214:5347:b0:6cb:e9eb:1b24 with SMTP id
 6a1803df08f44-6cbeff63948mr208010076d6.24.1728961472016; Mon, 14 Oct 2024
 20:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com> <Zw0iegwMp5ZVGypy@fedora> <9b7e4f65-a171-4574-bd53-580e79527fbc@arm.com>
In-Reply-To: <9b7e4f65-a171-4574-bd53-580e79527fbc@arm.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Tue, 15 Oct 2024 11:04:21 +0800
Message-ID: <CAF+s44QbdPBN-8EcPiWiZgYgZY4v8RK-wA0VEaVXbfnc9_HQ9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/57] mm: Add macros ahead of supporting boot-time
 page size selection
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Chris Zankel <chris@zankel.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Marsden <greg.marsden@oracle.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Ivan Ivanov <ivan.ivanov@suse.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonas Bonn <jonas@southpole.se>, 
	Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <mbrugger@suse.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Miroslav Benes <mbenes@suse.cz>, Rich Felker <dalias@libc.org>, 
	Richard Weinberger <richard@nod.at>, Stafford Horne <shorne@gmail.com>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_200438_070940_DF4F3104 
X-CRM114-Status: GOOD (  46.80  )
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

T24gTW9uLCBPY3QgMTQsIDIwMjQgYXQgMTA6MDfigK9QTSBSeWFuIFJvYmVydHMgPHJ5YW4ucm9i
ZXJ0c0Bhcm0uY29tPiB3cm90ZToKPgo+IE9uIDE0LzEwLzIwMjQgMTQ6NTQsIFBpbmdmYW4gTGl1
IHdyb3RlOgo+ID4gSGVsbG8gUnlhbiwKPiA+Cj4gPiBPbiBNb24sIE9jdCAxNCwgMjAyNCBhdCAx
MTo1ODowOEFNICswMTAwLCBSeWFuIFJvYmVydHMgd3JvdGU6Cj4gPj4gYXJtNjQgY2FuIHN1cHBv
cnQgbXVsdGlwbGUgYmFzZSBwYWdlIHNpemVzLiBJbnN0ZWFkIG9mIHNlbGVjdGluZyBhIHBhZ2UK
PiA+PiBzaXplIGF0IGNvbXBpbGUgdGltZSwgYXMgaXMgZG9uZSB0b2RheSwgd2Ugd2lsbCBtYWtl
IGl0IHBvc3NpYmxlIHRvCj4gPj4gc2VsZWN0IHRoZSBkZXNpcmVkIHBhZ2Ugc2l6ZSBvbiB0aGUg
Y29tbWFuZCBsaW5lLgo+ID4+Cj4gPj4gSW4gdGhpcyBjYXNlIFBBR0VfU0hJRlQgYW5kIGl0J3Mg
ZGVyaXZhdGl2ZXMsIFBBR0VfU0laRSBhbmQgUEFHRV9NQVNLCj4gPj4gKGFzIHdlbGwgYXMgYSBu
dW1iZXIgb2Ygb3RoZXIgbWFjcm9zIHJlbGF0ZWQgdG8gb3IgZGVyaXZlZCBmcm9tCj4gPj4gUEFH
RV9TSElGVCwgYnV0IEknbSBub3Qgd29ycnlpbmcgYWJvdXQgdGhvc2UgeWV0KSwgYXJlIG5vIGxv
bmdlcgo+ID4+IGNvbXBpbGUtdGltZSBjb25zdGFudHMuIFNvIHRoZSBjb2RlIGJhc2UgbmVlZHMg
dG8gY29wZSB3aXRoIHRoYXQuCj4gPj4KPiA+PiBBcyBhIGZpcnN0IHN0ZXAsIGludHJvZHVjZSBN
SU4gYW5kIE1BWCB2YXJpYW50cyBvZiB0aGVzZSBtYWNyb3MsIHdoaWNoCj4gPj4gZXhwcmVzcyB0
aGUgcmFuZ2Ugb2YgcG9zc2libGUgcGFnZSBzaXplcy4gVGhlc2UgYXJlIGFsd2F5cyBjb21waWxl
LXRpbWUKPiA+PiBjb25zdGFudHMgYW5kIGNhbiBiZSB1c2VkIGluIG1hbnkgcGxhY2VzIHdoZXJl
IFBBR0VfW1NISUZUfFNJWkV8TUFTS10KPiA+PiB3ZXJlIHByZXZpb3VzbHkgdXNlZCB3aGVyZSBh
IGNvbXBpbGUtdGltZSBjb25zdGFudCBpcyByZXF1aXJlZC4KPiA+PiAoU3Vic2VxdWVudCBwYXRj
aGVzIHdpbGwgZG8gdGhhdCBjb252ZXJzaW9uIHdvcmspLiBXaGVuIHRoZSBhcmNoL2J1aWxkCj4g
Pj4gZG9lc24ndCBzdXBwb3J0IGJvb3QtdGltZSBwYWdlIHNpemUgc2VsZWN0aW9uLCB0aGUgTUlO
IGFuZCBNQVggdmFyaWFudHMKPiA+PiBhcmUgZXF1YWwgYW5kIGV2ZXJ5dGhpbmcgcmVzb2x2ZXMg
YXMgaXQgZGlkIHByZXZpb3VzbHkuCj4gPj4KPiA+Cj4gPiBNSU4gYW5kIE1BWCBhcHBlYXIgdG8g
Y29uc3RydWN0IGEgYm91bmRhcnksIGJ1dCBpdCBtYXkgYmUgbm90IGVub3VnaC4KPiA+IFBsZWFz
ZSBzZWUgdGhlIGZvbGxvd2luZyBjb21tZW50IGlubGluZS4KPiA+Cj4gPj4gQWRkaXRpb25hbGx5
LCBpbnRyb2R1Y2UgREVGSU5FX0dMT0JBTF9QQUdFX1NJWkVfVkFSW19DT05TVF0oKSB3aGljaCB3
cmFwCj4gPj4gZ2xvYmFsIHZhcmlhYmxlIGRlZmludGlvbnMgc28gdGhhdCBmb3IgYm9vdC10aW1l
IHBhZ2Ugc2l6ZSBzZWxlY3Rpb24KPiA+PiBidWlsZHMsIHRoZSB2YXJpYWJsZSBiZWluZyB3cmFw
cGVkIGlzIGluaXRpYWxpemVkIGF0IGJvb3QtdGltZSwgaW5zdGVhZAo+ID4+IG9mIGNvbXBpbGUt
dGltZS4gVGhpcyBpcyBkb25lIGJ5IGRlZmluaW5nIGEgZnVuY3Rpb24gdG8gZG8gdGhlCj4gPj4g
YXNzaWdubWVudCwgd2hpY2ggaGFzIHRoZSAiY29uc3RydWN0b3IiIGF0dHJpYnV0ZS4gQ29uc3Ry
dWN0b3IgaXMKPiA+PiBwcmVmZXJyZWQgb3ZlciBpbml0Y2FsbCwgYmVjYXVzZSB3aGVuIGNvbXBp
bGluZyBhIG1vZHVsZSwgdGhlIG1vZHVsZSBpcwo+ID4+IGxpbWl0ZWQgdG8gYSBzaW5nbGUgaW5p
dGNhbGwgYnV0IGNvbnN0cnVjdG9ycyBhcmUgdW5saW1pdGVkLiBGb3IKPiA+PiBidWlsdC1pbiBj
b2RlLCBjb25zdHJ1Y3RvcnMgYXJlIG5vdyBjYWxsZWQgZWFybGllciB0byBndWFycmFudGVlIHRo
YXQKPiA+PiB0aGUgdmFyaWFibGVzIGFyZSBpbml0aWFsaXplZCBieSB0aGUgdGltZSB0aGV5IGFy
ZSB1c2VkLiBBbnkgYXJjaCB0aGF0Cj4gPj4gd2FudHMgdG8gZW5hYmxlIGJvb3QtdGltZSBwYWdl
IHNpemUgc2VsZWN0aW9uIHdpbGwgbmVlZCB0byBzZWxlY3QKPiA+PiBDT05GSUdfQ09OU1RSVUNU
T1JTLgo+ID4+Cj4gPj4gVGhlc2UgbmV3IG1hY3JvcyBuZWVkIHRvIGJlIGF2YWlsYWJsZSBhbnl3
aGVyZSBQQUdFX1NISUZUIGFuZCBmcmllbmRzCj4gPj4gYXJlIGF2YWlsYWJsZS4gVGhvc2UgYXJl
IGRlZmluZWQgdmlhIGFzbS9wYWdlLmggKGFsdGhvdWdoIHNvbWUgYXJjaGVzCj4gPj4gaGF2ZSBh
IHN1Yi1pbmNsdWRlIHRoYXQgZGVmaW5lcyB0aGVtKS4gVW5mb3J0dW5hdGVseSB0aGVyZSBpcyBu
bwo+ID4+IHJlbGlhYmxlIGFzbS1nZW5lcmljIGhlYWRlciB3ZSBjYW4gZWFzaWx5IHBpZ2d5LWJh
Y2sgb24sIHNvIGxldCdzIGRlZmluZQo+ID4+IGEgbmV3IG9uZSwgcGd0YWJsZS1nZW9tZXRyeS5o
LCB3aGljaCB3ZSBpbmNsdWRlIG5lYXIgd2hlcmUgZWFjaCBhcmNoCj4gPj4gZGVmaW5lcyBQQUdF
X1NISUZULiBVZ2guCj4gPj4KPiA+PiAtLS0tLS0tCj4gPj4KPiA+PiBNb3N0IG9mIHRoZSBwcm9i
bGVtcyB0aGF0IG5lZWQgdG8gYmUgc29sdmVkIG92ZXIgdGhlIG5leHQgZmV3IHBhdGNoZXMKPiA+
PiBmYWxsIGludG8gdGhlc2UgYnJvYWQgY2F0ZWdvcmllcywgd2hpY2ggYXJlIGFsbCBzb2x2ZWQg
d2l0aCB0aGUgaGVscCBvZgo+ID4+IHRoZXNlIG5ldyBtYWNyb3M6Cj4gPj4KPiA+PiAxLiBBc3Np
Z25tZW50IG9mIHZhbHVlcyBkZXJpdmVkIGZyb20gUEFHRV9TSVpFIGluIGdsb2JhbCB2YXJpYWJs
ZXMKPiA+Pgo+ID4+ICAgRm9yIGJvb3QtdGltZSBwYWdlIHNpemUgYnVpbGRzLCB3ZSBtdXN0IGRl
ZmVyIHRoZSBpbml0aWFsaXphdGlvbiBvZgo+ID4+ICAgdGhlc2UgdmFyaWFibGVzIHVudGlsIGJv
b3QtdGltZSwgd2hlbiB0aGUgcGFnZSBzaXplIGlzIGtub3duLiBTZWUKPiA+PiAgIERFRklORV9H
TE9CQUxfUEFHRV9TSVpFX1ZBUltfQ09OU1RdKCkgYXMgZGVzY3JpYmVkIGFib3ZlLgo+ID4+Cj4g
Pj4gMi4gRGVmaW5lIHN0YXRpYyBzdG9yYWdlIGluIHVuaXRzIHJlbGF0ZWQgdG8gUEFHRV9TSVpF
Cj4gPj4KPiA+PiAgIFRoaXMgc3RhdGljIHN0b3JhZ2Ugd2lsbCBiZSBkZWZpbmVkIGFjY29yZGlu
ZyB0byBQQUdFX1NJWkVfTUFYLgo+ID4+Cj4gPj4gMy4gRGVmaW5lIHNpemUgb2Ygc3RydWN0IHNv
IHRoYXQgaXQgaXMgcmVsYXRlZCB0byBQQUdFX1NJWkUKPiA+Pgo+ID4+ICAgVGhlIHN0cnVjdCBv
ZnRlbiBjb250YWlucyBhbiBhcnJheSB0aGF0IGlzIHNpemVkIHRvIGZpbGwgdGhlIHBhZ2UuIElu
Cj4gPj4gICB0aGlzIGNhc2UsIHVzZSBhIGZsZXhpYmxlIGFycmF5IHdpdGggZHluYW1pYyBhbGxv
Y2F0aW9uLiBJbiBvdGhlcgo+ID4+ICAgY2FzZXMsIHRoZSBzdHJ1Y3QgZml0cyBleGFjdGx5IG92
ZXIgYSBwYWdlLCB3aGljaCBpcyBhIGhlYWRlciAoZS5nLgo+ID4+ICAgc3dhcCBmaWxlIGhlYWRl
cikuIEluIHRoaXMgY2FzZSwgcmVtb3ZlIHRoZSBwYWRkaW5nLCBhbmQgbWFudWFsbHkKPiA+PiAg
IGRldGVybWluZSB0aGUgc3RydWN0IHBvaW50ZXIgd2l0aGluIHRoZSBwYWdlLgo+ID4+Cj4gPgo+
ID4gQWJvdXQgdHdvIHllYXJzIGFnbywgSSB0cmllZCB0byBkbyBzaW1pbGFyIHRoaW5nIGluIHlv
dXIgc2VyaWVzLCBidXQgcmFuCj4gPiBpbnRvIHByb2JsZW0gYXQgdGhpcyBwb2ludCwgb3IgbWF5
YmUgbm90IGV4YWN0bHkgYXMgdGhlIHBvaW50IHlvdSBsaXN0Cj4gPiBoZXJlLiBJIGNvbnNpZGVy
IHRoaXMgYXMgdGhlIG1vc3QgY2hhbGxlbmdlZCBwYXJ0Lgo+ID4KPiA+IFRoZSBzY2VuYXJpbyBp
cwo+ID4gc3RydWN0IFggewo+ID4gICAgICAgYVtzaXplX2FdOwo+ID4gICAgICAgYltzaXplX2Jd
Owo+ID4gICAgICAgYzsKPiA+IH07Cj4gPgo+ID4gV2hlcmUgc2l6ZV9hID0gZihQQUdFX1NISUZU
KSwgc2l6ZV9iPWcoUEFHRV9TSElGVCkuIE9uZSBvZiBmKCkgYW5kIGcoKQo+ID4gaXMgcHJvcG9y
dGlvbmFsIHRvIFBBR0VfU0hJRlQsIHRoZSBvdGhlciBpcyBpbnZlcnNlbHkgcHJvcG9ydGlvbmFs
Lgo+ID4KPiA+IEhvdyBjYW4geW91IGZpeCB0aGUgcmVmZXJlbmNlIG9mIFguYSBhbmQgWC5iPwo+
Cj4gSWYgeW91IG5lZWQgdG8gYWxsb2NhdGUgc3RhdGljIG1lbW9yeSwgdGhlbiBpbiB0aGlzIHNj
ZW5hcmlvLCBhc3N1bWluZyBmKCkgaXMKPiBwcm9wb3J0aW9uYWwgYW5kIGcoKSBpcyBpbnZlcnNl
bHktcHJvcG9ydGlvbmFsLCB0aGVuIEkgZ3Vlc3MgeW91IG5lZWQKPiBzaXplX2E9ZihQQUdFX1NJ
WkVfTUFYKSBhbmQgc2l6ZV9iPWcoUEFHRV9TSVpFX01JTikuIE9yIGlmIHlvdSBjYW4gYWxsb2Nh
dGUgdGhlCgpNeSBwb2ludCBpcyB0aGF0IHN1Y2ggc3R1ZmYgY2FuIG5vdCBiZSBoYW5kbGVkIGJ5
IHNjcmlwdHMKYXV0b21hdGljYWxseSBhbmQgbmVlZHMgbWFudWFsIGludGVydmVudGlvbi4KCj4g
bWVtb3J5IGR5bmFtaWNhbGx5LCB0aGVuIG1ha2UgYSBhbmQgYiBwb2ludGVycyB0byBkeW5hbWlj
YWxseSBhbGxvY2F0ZWQgYnVmZmVycy4KPgoKVGhpcyBzZWVtcyBhIGJldHRlciB3YXkgb3V0LgoK
PiBJcyB0aGVyZSBhIHNwZWNpZmljIHBsYWNlIGluIHRoZSBzb3VyY2Ugd2hlcmUgdGhpcyBwYXR0
ZXJuIGlzIHVzZWQgdG9kYXk/IEl0Cj4gbWlnaHQgYmUgZWFzaWVyIHRvIGRpc2N1c3MgaW4gdGhl
IGNvbnRleHQgb2YgdGhlIGNvZGUgaWYgc28uCj4KCk5vIHN1Y2ggY29kZSBhdCBoYW5kLiBKdXN0
IHRocm93IG91dCB0aGUgcG90ZW50aWFsIGlzc3VlIGFuZCBiZQpjdXJpb3VzIGFib3V0IGl0IHdo
aWNoIGZydXN0cmF0ZXMgbWUuCkkgaG9wZSBwZW9wbGUgY2FuIHJlYWNoIGFuIGFncmVlbWVudCBv
biBpdCBhbmQgdHVybiB0aGlzIHVzZWZ1bCBzZXJpZXMKaW50byByZWFsaXR5LgoKVGhhbmtzLAoK
UGluZ2ZhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
