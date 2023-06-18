Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDD6EB64D7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jun 2023 20:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdz1dj79+Vkvth3DsQFJyu3A6Y6H48TTzpAVo0RGMBs=; b=tAaKU41hyW5zlB
	XZJvKLCNXvq19LXo4xxDh5JN1KVtY+GawpbzeOOOGproqtgNtvAZmv/BvhB3ppIKkSZ25FhdZxqE5
	dKe6VF214YkURfB29tjMk5R5bHtCcgiMvowd3qWena1/G0MZp9Sw0ZxXSfsCSsah9k81xL58dEiKq
	DjIAYxo17NXxRkONzsFgxgjZYKDY4AL6saz/RCDcCKYKPDWHhPjIOmC12I1w1xEFO1g24YPlkHhvo
	Mbub3D9af2c6HhMoVUo08raAjz+umE60DDwFgFtpslFy4MMtGjH/tA78S9zxsSLe1vBc7eagkrevO
	dX4hDaTCF+INzgFT9cHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAzTQ-006gwG-24;
	Sun, 18 Jun 2023 20:58:12 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAzTN-006gv0-1J
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jun 2023 20:58:10 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-3f9d619103dso205601cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 18 Jun 2023 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687121888; x=1689713888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZtyfCTAVMiPGQWHjgwoE9XDDUe5Zitl3naYIJu5u8M=;
        b=ZVT9TlvXekbzjsIk4FVN6w5b3V3bL2g07xM58CsOQEKlBliMaOMo4yZji4Q+4M2pTX
         PwOyYLy6AVqkAYYG8oZQzsoJ5wXO3fYU4dvuBveWcoPn/DBqA76dOm2wErETk5RMX4DF
         Pdjj7y7tVBfSg3bUPlVpNbbP9RKpJTFpWfMqG6NS8ogCoI9SFLLQjHjuiJCl9wmx/QMI
         sfudbAhw5Fv3ydEbSaSvd7K7sWgk9eaIp4KEVRbqeVVI+v27ojzRWzN3DHLLYoRPb3Uw
         6IMcAn+rqIjZUCyYlDlj0BpHHcpwknOPBIBYMxSFkst2yjNHbhKR20MPChNpYuTjpIYD
         wwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687121888; x=1689713888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZtyfCTAVMiPGQWHjgwoE9XDDUe5Zitl3naYIJu5u8M=;
        b=C0ayQjNKNUScalxt/S2WMcA8JOSP/ED48aP7cjqCtvPW3XZC0/CT4Xzxj3gjZTXn05
         KKoDEmtpAUSFEbTO9LAX/JRpayjpkmI4OSLcU3VhL0wbLJaoMcqIJiG8C3aEOvSWvLak
         JAB633J8qvqAZYg1+uh9DwixauXFMqTHUYSOj1VNYMr0Al1Ryo4zfXCHwKX7OZ0afNtP
         suPUMDdPreMXwFpXHyDhiZ9rsNIndC6SDA2LidzrRSVY26DexTGMVWujlsSYOea7XwmF
         Q/OEfeFaP31ZrGOMufsY3nSCgQpAyh/7G3KHb3ktHw9tq8nF/yGOAjk66zIWH/hy4o1X
         sFTw==
X-Gm-Message-State: AC+VfDzm/JN0qR/skzV1yMSGUopvCs05VoLwBbWQdy9Ce5Zhw2AA5FWI
	LoAWg6aAY/5Wlny3+I/DznynLmLz0Wm5qU4NyLEY5A==
X-Google-Smtp-Source: ACHHUZ6ZDWbPtAWRuLjADFFa6FEUQ3GypTx245KPaUVC0BHZGX9Wd0LOXtVKSGnZtQDaYiPHdDlVEaUz0sYg2vTadSQ=
X-Received: by 2002:a05:622a:20a:b0:3f9:a78f:c527 with SMTP id
 b10-20020a05622a020a00b003f9a78fc527mr291449qtx.21.1687121888063; Sun, 18 Jun
 2023 13:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
 <178970b0-1539-8aac-76fd-972c6c46ec17@google.com> <20230614231758.GA1503611@dev-arch.thelio-3990X>
 <f5526f17-9d78-f7ea-427a-7e76bfeb6b8@google.com> <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
 <20230615155059.GB3665766@dev-arch.thelio-3990X> <76b41825-30fa-b9e8-d043-2affcba24317@google.com>
 <addfcb3-b5f4-976e-e050-a2508e589cfe@google.com> <ZI0uh8P/akwkGo0D@google.com>
In-Reply-To: <ZI0uh8P/akwkGo0D@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Sun, 18 Jun 2023 14:57:31 -0600
Message-ID: <CAOUHufbAjZd4Mxkio9OGct-TZ=L0QRG+_6Xa7atQVFN_4ez86w@mail.gmail.com>
Subject: Re: [PATCH v2 07/23 replacement] mips: add pte_unmap() to balance pte_offset_map()
To: Hugh Dickins <hughd@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Helge Deller <deller@gmx.de>, 
	John David Anglin <dave.anglin@bell.net>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_135809_448528_7EA9C932 
X-CRM114-Status: GOOD (  16.50  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgOTo1NOKAr1BNIFl1IFpoYW8gPHl1emhhb0Bnb29nbGUu
Y29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDE1LCAyMDIzIGF0IDA0OjAyOjQzUE0gLTA3MDAs
IEh1Z2ggRGlja2lucyB3cm90ZToKPiA+IFRvIGtlZXAgYmFsYW5jZSBpbiBmdXR1cmUsIF9fdXBk
YXRlX3RsYigpIHJlbWVtYmVyIHRvIHB0ZV91bm1hcCgpIGFmdGVyCj4gPiBwdGVfb2Zmc2V0X21h
cCgpLiAgVGhpcyBpcyBhbiBvZGQgY2FzZSwgc2luY2UgdGhlIGNhbGxlciBoYXMgYWxyZWFkeSBk
b25lCj4gPiBwdGVfb2Zmc2V0X21hcF9sb2NrKCksIHRoZW4gbWlwcyBmb3JnZXRzIHRoZSBhZGRy
ZXNzIGFuZCByZWNhbGN1bGF0ZXMgaXQ7Cj4gPiBidXQgbXkgdHdvIG5haXZlIGF0dGVtcHRzIHRv
IGNsZWFuIHRoYXQgdXAgZGlkIG1vcmUgaGFybSB0aGFuIGdvb2QuCj4gPgo+ID4gVGVzdGVkLWJ5
OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBIdWdoIERpY2tpbnMgPGh1Z2hkQGdvb2dsZS5jb20+Cj4KPiBGV0lXOiBUZXN0ZWQtYnk6IFl1
IFpoYW8gPHl1emhhb0Bnb29nbGUuY29tPgo+Cj4gVGhlcmUgaXMgYW5vdGhlciBwcm9ibGVtLCBs
aWtlbHkgY2F1c2VkIGJ5IGtodWdlcGFnZWQsIGhhcHBlbmVkIG11bHRpcGxlIHRpbWVzLiBCdXQg
SSBkb24ndCB0aGluayBpdCdzIHJlbGF0ZWQgdG8geW91ciBzZXJpZXMsIGp1c3QgRllJLgo+Cj4g
ICBHb3QgbWNoZWNrIGF0IGZmZmZmZmZmODExMzRlZjAKPiAgIENQVTogMyBQSUQ6IDM2IENvbW06
IGtodWdlcGFnZWQgTm90IHRhaW50ZWQgNi40LjAtcmM2LTAwMDQ5LWc2MmQ4Nzc5NjEwYmItZGly
dHkgIzEKCi4uLgoKPiAgIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBDYXVnaHQgTWFjaGlu
ZSBDaGVjayBleGNlcHRpb24gLSBjYXVzZWQgYnkgbXVsdGlwbGUgbWF0Y2hpbmcgZW50cmllcyBp
biB0aGUgVExCLgoKSW4gY2FzZSBhbnlvbmUgcGxhbnMgdG8gdHJ5IHRvIGZpeCB0aGlzIC0gdGhl
IHByb2JsZW0gZ29lcyBiYWNrIHRvIGF0CmxlYXN0IDUuMTUgc3RhYmxlLiBNeSAoZWR1Y2F0ZWQp
IGd1ZXNzIGlzIHRoYXQgbm9ib2R5IGNvbXBsYWluZWQgYWJvdXQKaXQgYmVjYXVzZSBhbGwgdGhl
IHRlc3RpbmcgaXMgZG9uZSBpbiBRRU1VLCB3aGljaCBkb2VzIE5PVCBkZXRlY3QKY29uZmxpY3Rp
bmcgVExCcy4gVGhpcyBtZWFucyB0aGUgdmVyaWZpY2F0aW9uIG9mIHRoZSBmaXggd291bGQgbmVl
ZCB0bwpiZSBvbiBhIHJlYWwgcGllY2Ugb2YgaC93IG9yIGFuIHVwZGF0ZWQgUUVNVS4KCkluIHRh
cmdldC9taXBzL3RjZy9zeXNlbXUvdGxiX2hlbHBlci5jOgoKc3RhdGljIHZvaWQgcjRrX2ZpbGxf
dGxiKENQVU1JUFNTdGF0ZSAqZW52LCBpbnQgaWR4KQp7CiAgICByNGtfdGxiX3QgKnRsYjsKICAg
IHVpbnQ2NF90IG1hc2sgPSBlbnYtPkNQMF9QYWdlTWFzayA+PiAoVEFSR0VUX1BBR0VfQklUUyAr
IDEpOwoKICAgIC8qIFhYWDogZGV0ZWN0IGNvbmZsaWN0aW5nIFRMQnMgYW5kIHJhaXNlIGEgTUNI
RUNLIGV4Y2VwdGlvbiB3aGVuIG5lZWRlZCAqLwouLi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
