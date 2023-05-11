Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AC1C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 06:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ft0HrBO1f69EqcVVIYnzB+tr24VjvsBrrWOMPNBv3kQ=; b=ybFmnyxycdxhiR
	S3u/J1jM5r4iH3cHK8r4kRaI8rDX1Q/4AE9y/okCQlSlMbbU8nyYlh3gL3oBogx8W9i/3+tJhCrmg
	2Aj1KcI5ls93Uxn1ZDtJ7SoiX+lN3Y++gSHlKTPMiC8wGOebHwNDJL3T1AxiEqzcFzs+a8RP+YoAm
	yc3BcQhZxl3oJFCEu/WXvjounSZEMPArDGy/0KiidIX5plkPn2xGOih7XmbL/ZyYbQUf9pPZ4Mgaf
	v7g0WuQ8qwgy/IZU/Nwr22nfd6RIw+lj9QiuTz0t/CMLWCDgarTgMU9wzmedsHnvAqHWdOR4vO8E+
	/EhgEmirXf9dFjAOQmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px0BY-0083h4-0P;
	Thu, 11 May 2023 06:53:56 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px0BM-0083Yx-1f;
	Thu, 11 May 2023 06:53:47 +0000
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3ef2f81a96cso82431901cf.0;
        Wed, 10 May 2023 23:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683788021; x=1686380021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MblyuSVWD0Rw/dgsETYZNoTE8y2XjkYZe4ysDLt2Njg=;
        b=M4FCQvcaSDETw9lQ9D19ATjqPZLvlaJY9T4ZQvKH4cWy6IEy4QoSoLZ8KB5HAHnVin
         hh5r9FnVQ5Y7k6IAw+//807VOqR5jKHFeHvHz1sbSsQgIXBHMMMF5qBkB2nmdyNFy5QQ
         0hqn2EtLjwpCc8RKFLMDe43BLvcyZy5I2rXSvtYsFy+eZ3jYhuKxzUfOanj+bLMya7da
         /O9V1ZsbQKoAiEnocm8fZiFv9bogHfiKCW+HQR2hD+lEMm5pWL3ucCJkmHmX48F/kHf1
         0Jg1OcJuJHt5HEqiCZsJAbqrJbo25S1LaiJYhF8LZ4xnseCNYiIFOqLOwB6O/ewHeaw3
         AVJw==
X-Gm-Message-State: AC+VfDyAj8B/tqL2gbaXgaBdaLJdeWXbRBhQ+En6XNTKTK+OTIes7GhE
	qzh8BfOrV4EGP2wGLhC2MYAINyU9/xGHtg==
X-Google-Smtp-Source: ACHHUZ45lUuAQwIux6SP3yCayoWCRT+GN85cKlk6M4SIdHVbJTt1bCPymb+KgMBgkFndjVH6bSiVgw==
X-Received: by 2002:ac8:5a0d:0:b0:3f3:640b:48b0 with SMTP id n13-20020ac85a0d000000b003f3640b48b0mr30814756qta.47.1683788020720;
        Wed, 10 May 2023 23:53:40 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com. [209.85.222.182])
        by smtp.gmail.com with ESMTPSA id ge26-20020a05622a5c9a00b003f27719c179sm2005544qtb.69.2023.05.10.23.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 23:53:40 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7575fc62c7aso547132585a.0;
        Wed, 10 May 2023 23:53:40 -0700 (PDT)
X-Received: by 2002:a25:aaa6:0:b0:b9d:a27c:3fc9 with SMTP id
 t35-20020a25aaa6000000b00b9da27c3fc9mr17668190ybi.33.1683787999800; Wed, 10
 May 2023 23:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
 <237c8410-ce61-94c-4260-7318ad6a4f3@google.com> <CAMuHMdWb0SrEs=cDzKW1Ai2UywnnpZip4pk9mOkiVGivPpj8sg@mail.gmail.com>
 <b4a5f11-68ee-7bba-b362-10ef7c9b956@google.com>
In-Reply-To: <b4a5f11-68ee-7bba-b362-10ef7c9b956@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 May 2023 08:53:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMhQ_DyNC-4yJRRHKYcKCrwRdxvBwGDv2FzhLSNw4Bmw@mail.gmail.com>
Message-ID: <CAMuHMdXMhQ_DyNC-4yJRRHKYcKCrwRdxvBwGDv2FzhLSNw4Bmw@mail.gmail.com>
Subject: Re: [PATCH 05/23] m68k: allow pte_offset_map[_lock]() to fail
To: Hugh Dickins <hughd@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	John David Anglin <dave.anglin@bell.net>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_235344_574929_D9978FE2 
X-CRM114-Status: GOOD (  41.47  )
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

SGkgSHVnaCwKCk9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDQ6NTjigK9BTSBIdWdoIERpY2tpbnMg
PGh1Z2hkQGdvb2dsZS5jb20+IHdyb3RlOgo+IE9uIFdlZCwgMTAgTWF5IDIwMjMsIEdlZXJ0IFV5
dHRlcmhvZXZlbiB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDEwLCAyMDIzIGF0IDY6NDjigK9BTSBI
dWdoIERpY2tpbnMgPGh1Z2hkQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPiBJbiByYXJlIHRyYW5z
aWVudCBjYXNlcywgbm90IHlldCBtYWRlIHBvc3NpYmxlLCBwdGVfb2Zmc2V0X21hcCgpIGFuZAo+
ID4gPiBwdGVfb2Zmc2V0X21hcF9sb2NrKCkgbWF5IG5vdCBmaW5kIGEgcGFnZSB0YWJsZTogaGFu
ZGxlIGFwcHJvcHJpYXRlbHkuCj4gPiA+Cj4gPiA+IFJlc3RydWN0dXJlIGNmX3RsYl9taXNzKCkg
d2l0aCBhIHB0ZV91bm1hcCgpIChwcmV2aW91c2x5IG9taXR0ZWQpCj4gPiA+IGF0IGxhYmVsIG91
dCwgZm9sbG93ZWQgYnkgb25lIGxvY2FsX2lycV9yZXN0b3JlKCkgZm9yIGFsbC4KPiA+Cj4gPiBU
aGF0J3MgYSBidWcgZml4LCB3aGljaCBzaG91bGQgYmUgYSBzZXBhcmF0ZSBwYXRjaD8KPgo+IE5v
LCB0aGF0J3Mgbm90IGEgYnVnIGZpeCBmb3IgdGhlIGN1cnJlbnQgdHJlZSwgc2luY2UgbTY4ayBk
b2VzIG5vdAo+IG9mZmVyIENPTkZJR19ISUdIUFRFLCBzbyBwdGVfdW5tYXAoKSBpcyBuZXZlciBh
bnl0aGluZyBidXQgYSBuby1vcAo+IGZvciBtNjhrIChzZWUgaW5jbHVkZS9saW51eC9wZ3RhYmxl
LmgpLgo+Cj4gQnV0IEkgd2FudCB0byBjaGFuZ2UgcHRlX3VubWFwKCkgdG8gZG8gc29tZXRoaW5n
IGV2ZW4gd2l0aG91dAo+IENPTkZJR19ISUdIUFRFLCBzbyBoYXZlIHRvIGZpeCB1cCBhbnkgc3Vj
aCBwcmV2aW91c2x5IGhhcm1sZXNzCj4gb21pc3Npb25zIGluIHRoaXMgc2VyaWVzIGZpcnN0LgoK
T0suCgo+ID4gPiAtLS0gYS9hcmNoL202OGsvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaAo+ID4g
PiArKysgYi9hcmNoL202OGsvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaAo+ID4gPiBAQCAtOTks
NyArOTksNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbG9hZF9rc3BfbW11KHN0cnVjdCB0YXNrX3N0
cnVjdCAqdGFzaykKPiA+ID4gICAgICAgICBwNGRfdCAqcDRkOwo+ID4gPiAgICAgICAgIHB1ZF90
ICpwdWQ7Cj4gPiA+ICAgICAgICAgcG1kX3QgKnBtZDsKPiA+ID4gLSAgICAgICBwdGVfdCAqcHRl
Owo+ID4gPiArICAgICAgIHB0ZV90ICpwdGUgPSBOVUxMOwo+ID4gPiAgICAgICAgIHVuc2lnbmVk
IGxvbmcgbW11YXI7Cj4gPiA+Cj4gPiA+ICAgICAgICAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOwo+
ID4gPiBAQCAtMTM5LDcgKzEzOSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2FkX2tzcF9tbXUo
c3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQo+ID4gPgo+ID4gPiAgICAgICAgIHB0ZSA9IChtbXVh
ciA+PSBQQUdFX09GRlNFVCkgPyBwdGVfb2Zmc2V0X2tlcm5lbChwbWQsIG1tdWFyKQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBwdGVfb2Zmc2V0X21hcChwbWQs
IG1tdWFyKTsKPiA+ID4gLSAgICAgICBpZiAocHRlX25vbmUoKnB0ZSkgfHwgIXB0ZV9wcmVzZW50
KCpwdGUpKQo+ID4gPiArICAgICAgIGlmICghcHRlIHx8IHB0ZV9ub25lKCpwdGUpIHx8ICFwdGVf
cHJlc2VudCgqcHRlKSkKPiA+ID4gICAgICAgICAgICAgICAgIGdvdG8gYnVnOwo+ID4KPiA+IElm
IHRoZSBhYnNlbmNlIG9mIGEgcHRlIGlzIHRvIGJlY29tZSBhIG5vbi1hYm5vcm1hbCBjYXNlLCBp
dCBzaG91bGQKPiA+IHByb2JhYmx5IGp1bXAgdG8gImVuZCIgaW5zdGVhZCwgdG8gYXZvaWQgc3Bh
bW1pbmcgdGhlIGtlcm5lbCBsb2cuCj4KPiBJIGRvbid0IHRoaW5rIHNvIChidXQgb2YgY291cnNl
IGl0J3MgaGFyZCBmb3IgeW91IHRvIHRlbGwsIHdpdGhvdXQKPiBzZWVpbmcgYWxsIGNvbXBsZXRl
ZCBzZXJpZXMgb2Ygc2VyaWVzKS4gIElmIHBtZF9ub25lKCpwbWQpIGNhbiBzYWZlbHkKPiBnb3Rv
IGJ1ZyBqdXN0IGFib3ZlLCBhbmQgcHRlX25vbmUoKnB0ZSkgZ290byBidWcgaGVyZSwgd2VsbCwg
dGhlICFwdGUKPiBjYXNlIGlzIGdvaW5nIHRvIGJlIHN0cmFuZ2VyIHRoYW4gZWl0aGVyIG9mIHRo
b3NlLgo+Cj4gTXkgdW5kZXJzdGFuZGluZyBvZiB0aGlzIGZ1bmN0aW9uLCBsb2FkX2tzcF9tbXUo
KSwgaXMgdGhhdCBpdCdzIGRlYWxpbmcKPiBhdCBjb250ZXh0IHN3aXRjaCB3aXRoIGEgcGFydCBv
ZiB1c2Vyc3BhY2Ugd2hpY2ggdmVyeSBtdWNoIG5lZWRzIHRvIGJlCj4gcHJlc2VudDogd2hhdGV2
ZXIga2VlcHMgdGhhdCBmcm9tIGJlaW5nIHN3YXBwZWQgb3V0IG9yIG1pZ3JhdGVkIGF0Cj4gcHJl
c2VudCwgd2lsbCBiZSBzdXJlIHRvIGtlZXAgdGhlICFwdGUgY2FzZSBhd2F5IC0gd2UgY2Fubm90
IHN0ZWFsIGl0cwo+IHBhZ2UgdGFibGUganVzdCBhdCByYW5kb20gKGFuZCBhIFRIUCBvbiBtNjhr
IHdvdWxkIGJlIHN1cnByaXNpbmcgdG9vKS4KPgo+IFRob3VnaCB0aGVyZSBpcyBvbmUgY2FzZSBJ
IGNhbiB0aGluayBvZiB3aGljaCB3aWxsIGNhdXNlICFwdGUgaGVyZSwKPiBhbmQgc28gZ290byBi
dWc6IGlmIHRoZSBwbWQgZW50cnkgaGFzIGdvdCBjb3JydXB0ZWQsIGFuZCBjb3VudHMgYXMKPiBw
bWRfYmFkKCksIHdoaWNoIHdpbGwgYmUgdGVzdGVkIChhbmQgY2xlYXJlZCkgaW4gcHRlX29mZnNl
dF9tYXAoKS4KPiBCdXQgaXQgaXMgb2theSB0byByZXBvcnQgYSBidWcgaW4gdGhhdCBjYXNlLgo+
Cj4gSSBjYW4gY2VydGFpbmx5IGNoYW5nZSB0aGlzIHRvIGdvdG8gZW5kIGluc3RlYWQgaWYgeW91
IHN0aWxsIHByZWZlciwKPiBubyBwcm9ibGVtOyBidXQgSSdkIHJhdGhlciBrZWVwIGl0IGFzIGlz
LCBpZiBvbmx5IGZvciBtZSB0byBiZSBwcm92ZWQKPiB3cm9uZyBieSB5b3UgYWN0dWFsbHkgc2Vl
aW5nIHNwYW0gdGhlcmUuCgpPSywgbWFrZXMgc2Vuc2UuCgo+ID4gPiBAQCAtMTYxLDYgKzE2MSw4
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2FkX2tzcF9tbXUoc3RydWN0IHRhc2tfc3RydWN0ICp0
YXNrKQo+ID4gPiAgYnVnOgo+ID4gPiAgICAgICAgIHByX2luZm8oImtzcCBsb2FkIGZhaWxlZDog
bW09MHglcCBrc3A9MHgwOCVseFxuIiwgbW0sIG1tdWFyKTsKPiA+ID4gIGVuZDoKPiA+ID4gKyAg
ICAgICBpZiAocHRlICYmIG1tdWFyIDwgUEFHRV9PRkZTRVQpCj4gPiA+ICsgICAgICAgICAgICAg
ICBwdGVfdW5tYXAocHRlKTsKPiA+Cj4gPiBJcyB0aGlzIGFsc28gYSBidWdmaXgsIG5vdCBtZW50
aW9uZWQgaW4gdGhlIHBhdGNoIGRlc2NyaXB0aW9uPwo+Cj4gSSdtIG5vdCBzdXJlIHdoZXRoZXIg
eW91J3JlIHJlZmVycmluZyB0byB0aGUgcHRlX3VubWFwKCkgd2hpY2ggd2UKPiBhbHJlYWR5IGRp
c2N1c3NlZCBhYm92ZSwgb3IgeW91J3JlIHNlZWluZyBzb21ldGhpbmcgZWxzZSBpbiBhZGRpdGlv
bjsKPiBidXQgSSBkb24ndCB0aGluayB0aGVyZSdzIGEgYnVnZml4IGhlcmUsIGp1c3QgYSByZWFy
cmFuZ2VtZW50IGJlY2F1c2UKPiB3ZSBub3cgd2FudCBsb3RzIG9mIGNhc2VzIHRvIGRvIHRoZSBw
dGVfdW5tYXAoKSBhbmQgbG9jYWxfaXJxX3Jlc3RvcmUoKS4KCkkgd2FzIHJlZmVycmluZyB0byB0
aGUgYWRkaXRpb24gb2YgcHRlX3VubWFwKCkuCkFzIHBlciB5b3VyIGV4cGxhbmF0aW9uIGFib3Zl
LCB0aGlzIGlzIG5vdCBhIGJ1Z2ZpeC4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25h
bCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhh
Y2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJv
Z3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
