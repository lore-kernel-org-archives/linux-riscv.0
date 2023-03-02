Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A841C678D4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxENglQ3hSZpm4/5i6EbVIAF3wgBtxML/Fa7BpvMioI=; b=k/nMKxM1jtUXNP
	DBAyax7uoXWah5y6LMEgCJqvLMSRA+TXV59M+mSquOhbMc0BtP5ZxtH16G1PhWFYNPGk0zl6DtWKg
	DO57fXYYElGQJ5RSEoTra7aLohqjgsThrN7eF+tvsmhufgOZab/rMtDzYvjEXsqOMvRH2WpVzVb85
	rh+nQ7tvqgzYNr9JVPAXtGMFXDJlEYHNnozugaOeitM2/lsvvAY1By6yFN04wdiFMjyNyGkQtl2vL
	LTQKMetJl9Q9TjWho7ysbY6GS+jwc5/QmiTpmCRtWzvYDTvVCKrDvk6bvgzOkOpcZlr6YU6mxF5Sc
	3ol7vEVlG2jwTxOB2J/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXenq-001LT7-Km; Thu, 02 Mar 2023 09:00:42 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXdoZ-001Coi-H2
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 07:57:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so954377wmq.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Mar 2023 23:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677743839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3gGlmdrxpk12L0HtiU5R9bJeUayhxQ74GXgfAq6meuw=;
        b=pn+DJn+k9uImMGeBMXuwnMQE1biMNzy71Plo8H7DOI3fKK/ceps9rgGUxc/bmw8s6L
         4TQMSud9TXFc8/r2OEOEiAKv5SApxcJ1Yd/LQHA0imhiw3qi8hrsJYLIdS7LaNAmBH1O
         AbgLlGVWFn2hf8BkmR90At5+g3zqQ61Ankq9cGuBB9WgQfAsyn4JZulcRbW71gf7ZeYz
         oRP4F6/LxUTL9nxCbjnWUdwQSV0fTcnbx/sIcDMk8fB8xQ9dJ6UAQMnDD3HBbCn+Qr4a
         fIykdIwuX5WmEnYpwkBvfu6oXc7MDCcdwlfNYOa5JGNIdVdo8Hubuxh+Kfco99U7Z89i
         QfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677743839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gGlmdrxpk12L0HtiU5R9bJeUayhxQ74GXgfAq6meuw=;
        b=hLNy6V5VZ/+kTkh1nUAx/WwrFtvmKx7bvqZKeJlDaZyT+IgY820l7Ij6+tQqg8VDgN
         Xax1aSPuHFwsNn5+9OVpQ1wqmAMSYUu/DjVj6D4TUh7c2oi326o55kcYaPmv/ct8aJ9q
         WkBkds8zo/NU+QEqWMro9MVx/dwYx0vYHlRwBqusKMeddgQ2FtVyK4VEJs5Vtbn6wNYQ
         hxgDR4LSAe6NEHqPUdNUHxMeFJkeG4ihrl4+pCODqjlEGeZzhUO6eCCZJprnRU6kownG
         4GexWShH9k0RrHsWXwVKE/cnBIlI5WQpx1s0wk21lZG6aFEL8bCc0a9ze0t5v7uPEtdo
         RN+g==
X-Gm-Message-State: AO0yUKXIF51sqFOWOn+RiB9qd9SfyEzu7HniF6fvgSF9RfkKiyxMAIG9
	GQLsRUXeD2zR8jOzLVO2puJpVBVoKeDe2vtyPYNhHQ==
X-Google-Smtp-Source: AK7set8WtHYe+gEo1Fgs1pSlJqsnM2tCvgsXzdB6/J3n+P8FnRw3jetc5Yrjj9TAlqQSjPmyeFZCYlu44lotg0az/Sk=
X-Received: by 2002:a05:600c:4591:b0:3ea:8ed9:8e4b with SMTP id
 r17-20020a05600c459100b003ea8ed98e4bmr2655128wmo.6.1677743839531; Wed, 01 Mar
 2023 23:57:19 -0800 (PST)
MIME-Version: 1.0
References: <Y+tSBlSsQBQF/Ro2@osiris> <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
In-Reply-To: <mhng-e8b09772-24e5-4729-a0bf-01a9e4c76636@palmer-ri-x1c9a>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 2 Mar 2023 08:57:08 +0100
Message-ID: <CAHVXubgdr_NrLPnZ6NhuDt8uZYZD+R_swpCVGoLDxnD+eOJcuA@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: hca@linux.ibm.com, geert@linux-m68k.org, corbet@lwn.net, 
	Richard Henderson <richard.henderson@linaro.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	vgupta@kernel.org, linux@armlinux.org.uk, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, chenhuacai@kernel.org, 
	kernel@xen0n.name, monstr@monstr.eu, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, chris@zankel.net, 
	jcmvbkbc@gmail.com, Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_235723_654035_FC5FC94A 
X-CRM114-Status: GOOD (  36.14  )
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

T24gVGh1LCBNYXIgMiwgMjAyMyBhdCA0OjE34oCvQU0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDE0IEZlYiAyMDIzIDAxOjE5OjAyIFBTVCAo
LTA4MDApLCBoY2FAbGludXguaWJtLmNvbSB3cm90ZToKPiA+IE9uIFR1ZSwgRmViIDE0LCAyMDIz
IGF0IDA5OjU4OjE3QU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+PiBIaSBI
ZWlrbywKPiA+Pgo+ID4+IE9uIFR1ZSwgRmViIDE0LCAyMDIzIGF0IDk6MzkgQU0gSGVpa28gQ2Fy
c3RlbnMgPGhjYUBsaW51eC5pYm0uY29tPiB3cm90ZToKPiA+PiA+IE9uIFR1ZSwgRmViIDE0LCAy
MDIzIGF0IDA4OjQ5OjAxQU0gKzAxMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+PiA+ID4g
VGhpcyBhbGwgY2FtZSB1cCBpbiB0aGUgY29udGV4dCBvZiBpbmNyZWFzaW5nIENPTU1BTkRfTElO
RV9TSVpFIGluIHRoZQo+ID4+ID4gPiBSSVNDLVYgcG9ydC4gIEluIHRoZW9yeSB0aGF0J3MgYSBV
QUJJIGJyZWFrLCBhcyBDT01NQU5EX0xJTkVfU0laRSBpcyB0aGUKPiA+PiA+ID4gbWF4aW11bSBs
ZW5ndGggb2YgL3Byb2MvY21kbGluZSBhbmQgdXNlcnNwYWNlIGNvdWxkIHN0YXRpY2x5IHJlbHkg
b24KPiA+PiA+ID4gdGhhdCB0byBiZSBjb3JyZWN0Lgo+ID4+ID4gPgo+ID4+ID4gPiBVc3VhbGx5
IEkgd291bGRuJ3QgbWVzcyBhcm91bmQgd2l0aCBjaGFuZ2luZyB0aGlzIHNvcnQgb2YgdGhpbmcs
IGJ1dAo+ID4+ID4gPiBQb3dlclBDIGluY3JlYXNlZCBpdCB3aXRoIGE1OTgwZDA2NGZlMiAoInBv
d2VycGM6IEJ1bXAgQ09NTUFORF9MSU5FX1NJWkUKPiA+PiA+ID4gdG8gMjA0OCIpLiAgVGhlcmUg
YXJlIGFsc28gYSBoYW5kZnVsIG9mIGV4YW1wbGVzIG9mIENPTU1BTkRfTElORV9TSVpFCj4gPj4g
PiA+IGluY3JlYXNpbmcsIGJ1dCB0aGV5J3JlIGZyb20gYmVmb3JlIHRoZSBVQVBJIHNwbGl0IHNv
IEknbSBub3QgcXVpdGUgc3VyZQo+ID4+ID4gPiB3aGF0IHRoYXQgbWVhbnM6IGU1YTZhMWM5MDk0
OCAoInBvd2VycGM6IGRlcml2ZSBDT01NQU5EX0xJTkVfU0laRSBmcm9tCj4gPj4gPiA+IGFzbS1n
ZW5lcmljIiksIDY4NGQyZmQ0OGU3MSAoIltTMzkwXSBrZXJuZWw6IEFwcGVuZCBzY3BkYXRhIHRv
IGtlcm5lbAo+ID4+ID4gPiBib290IGNvbW1hbmQgbGluZSIpLCAyMjI0MjY4MWNmZjUgKCJNSVBT
OiBFeHRlbmQgQ09NTUFORF9MSU5FX1NJWkUiKSwKPiA+PiA+ID4gYW5kIDJiNzRiODU2OTNjNyAo
InNoOiBEZXJpdmUgQ09NTUFORF9MSU5FX1NJWkUgZnJvbQo+ID4+ID4gPiBhc20tZ2VuZXJpYy9z
ZXR1cC5oLiIpLgo+ID4+ID4gPgo+ID4+ID4gPiBJdCBzZWVtcyB0byBtZSBsaWtlIENPTU1BTkRf
TElORV9TSVpFIHJlYWxseSBqdXN0IHNob3VsZG4ndCBoYXZlIGJlZW4KPiA+PiA+ID4gcGFydCBv
ZiB0aGUgdWFwaSB0byBiZWdpbiB3aXRoLCBhbmQgdXNlcnNwYWNlIHNob3VsZCBiZSBhYmxlIHRv
IGhhbmRsZQo+ID4+ID4gPiAvcHJvYy9jbWRsaW5lIG9mIHdoYXRldmVyIGxlbmd0aCBpdCB0dXJu
cyBvdXQgdG8gYmUuICBJIGRvbid0IHNlZSBhbnkKPiA+PiA+ID4gcmVmZXJlbmNlcyB0byBDT01N
QU5EX0xJTkVfU0laRSBhbnl3aGVyZSBidXQgTGludXggdmlhIGEgcXVpY2sgR29vZ2xlCj4gPj4g
PiA+IHNlYXJjaCwgYnV0IHRoYXQncyBub3QgcmVhbGx5IGVub3VnaCB0byBjb25zaWRlciBpdCB1
bnVzZWQgb24gbXkgZW5kLgo+ID4+ID4gPgo+ID4+ID4gPiBUaGUgZmVlZGJhY2sgb24gdGhlIHYx
IHNlZW1lZCB0byBpbmRpY2F0ZSB0aGF0IENPTU1BTkRfTElORV9TSVpFIHJlYWxseQo+ID4+ID4g
PiBzaG91bGRuJ3QgYmUgcGFydCBvZiB1YXBpLCBzbyB0aGlzIG5vdyB0b3VjaGVzIGFsbCB0aGUg
cG9ydHMuICBJJ3ZlCj4gPj4gPiA+IHRyaWVkIHRvIHNwbGl0IHRoaXMgYWxsIG91dCBhbmQgbGVh
dmUgaXQgYmlzZWN0YWJsZSwgYnV0IEkgaGF2ZW4ndAo+ID4+ID4gPiB0ZXN0ZWQgaXQgYWxsIHRo
YXQgYWdncmVzc2l2ZWx5Lgo+ID4+ID4KPiA+PiA+IEp1c3QgdG8gY29uZmlybSB0aGlzIGFzc3Vt
cHRpb24gYSBiaXQgbW9yZTogdGhhdCdzIGFjdHVhbGx5IHRoZSBzYW1lCj4gPj4gPiBjb25jbHVz
aW9uIHRoYXQgd2UgZW5kZWQgdXAgd2l0aCB3aGVuIGNvbW1pdCAzZGEwMjQzZjkwNmEgKCJzMzkw
OiBtYWtlCj4gPj4gPiBjb21tYW5kIGxpbmUgY29uZmlndXJhYmxlIikgd2VudCB1cHN0cmVhbS4K
Pgo+IFRoYW5rcywgSSBndWVzcyBJJ2QgbWlzc2VkIHRoYXQgb25lLiAgQXQgc29tZSBwb2ludCBJ
IHRoaW5rIHRoZXJlIHdhcwo+IHNvbWUgZGlzY3Vzc2lvbiBvZiBtYWtpbmcgdGhpcyBhIEtjb25m
aWcgZm9yIGV2ZXJ5b25lLCB3aGljaCBzZWVtcwo+IHJlYXNvbmFibGUgdG8gbWUgLS0gb3VyIHVz
ZSBjYXNlIGZvciB0aGlzIGJlaW5nIGV4dGVuZGVkIGlzIHN5emthbGxlciwKPiBidXQgd2UncmUg
c29ydCBvZiBqdXN0IHBpY2tpbmcgYSB2YWx1ZSB0aGF0J3MgYmlnIGVub3VnaCBmb3Igbm93IGFu
ZAo+IHJ1bm5pbmcgd2l0aCBpdC4KPgo+IFByb2JhYmx5IGJlc3QgdG8gZ2V0IGl0IG91dCBvZiB1
YXBpIGZpcnN0LCB0aG91Z2gsIGFzIHRoYXQgd2F5IGF0IGxlYXN0Cj4gaXQncyBjbGVhciB0aGF0
IGl0J3Mgbm90IHVBQkkuCj4KPiA+PiBDb21taXQgNjIyMDIxY2Q2YzU2MGNlNyAoInMzOTA6IG1h
a2UgY29tbWFuZCBsaW5lIGNvbmZpZ3VyYWJsZSIpLAo+ID4+IEkgYXNzdW1lPwo+ID4KPiA+IFll
cywgc29ycnkgZm9yIHRoYXQuIEkgZ290IGRpc3RyYWN0ZWQgd2hpbGUgd3JpdGluZyBhbmQgdXNl
ZCB0aGUgd3JvbmcKPiA+IGJyYW5jaCB0byBsb29rIHRoaXMgdXAuCj4KPiBBbGV4OiBQcm9iYWJs
eSB3b3J0aCBhZGRpbmcgdGhhdCB0byB0aGUgbGlzdCBpbiB0aGUgY292ZXIgbGV0dGVyIGFzIGl0
Cj4gbG9va3MgbGlrZSB5b3Ugd2VyZSBwbGFubmluZyBvbiBhIHY0IGFueXdheSAod2hpY2ggSSBn
dWVzcyB5b3Ugbm93IGhhdmUKPiB0byBkbywgZ2l2ZW4gdGhhdCBJIGp1c3QgYWRkZWQgdGhlIGlz
c3VlIHRvIFJJU0MtVikuCgpZZXAsIEkgd2lsbCA6KQoKVGhhbmtzLAoKQWxleAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
