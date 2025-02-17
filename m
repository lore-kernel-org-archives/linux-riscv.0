Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ED6C021AA
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 17:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQQKKmvFJp1M3akcW/2z0tZzWVprN/v9hp6pV8AQJPY=; b=JHZb+kJq2Oln11
	UfaQMNNX6N2nvh+nUuLGs3XfIpez5Ht39TylR0QgaKq6Xc5/ShmGGOJhamiVX8gMDlKGWslU2zoYO
	MH7T7erJ/5WC0giPXSJJeHmc5X75dSdaNfW/40Mgz8Uy8ohKcQ7HKJLAZ729YwQD0FEzr00GuyA85
	3+Y5IVz9/oXcsW/536PglLgxqDipqz3ncMcTyhK6dTnickNRcNpi172jWtrDQrqS32JBo1xDVtr5A
	Lgfojy4OqUxXP/uQaBD7zDItZspPpBOEBet82MUoZ3swCjwlH32WTeNNm42bESNzG+s0GTkCobl0D
	o/fY9oacdZnkOkv3Shyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4og-00000005Qxl-0JEf;
	Mon, 17 Feb 2025 17:21:58 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3kW-00000005Dpz-22ie;
	Mon, 17 Feb 2025 16:13:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso2273362f8f.3;
        Mon, 17 Feb 2025 08:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739808814; x=1740413614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KxbE/LUi+pBeXrp6r1WoRsJN4gZHatc3HSxCggqAc8=;
        b=CITy9zIxJ5BxPDqycyf5FzR88I4cerZR+tBg2R93m4Dlad8VEcSeFEgMrnt++5mc1L
         GYfNU1tlcPg6XJy/ybJ6KMB8Y74+u+SmhXxiQ+qlM48OSi/0Wfv9Mso1uafPuPbdz78r
         xP8pm1PWye193zCYfGT7b4cBSLrbxaUkh7BW2/RiRUF9zt82I6X23vAVH4wLnOo+/yX7
         6v9zm1k0/2hj1Dt2hJa9D+jF03p0vwFDtFnSn6vDDeHOwKs1G9oSEgQ1AJPUS+6ZcxcG
         FcOhfk+waPWrj9fyk4MFcxAPFSjUEi/eLSdORdoA6BYBejgogO7+85sx4X3+N9YQniLV
         dkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739808814; x=1740413614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KxbE/LUi+pBeXrp6r1WoRsJN4gZHatc3HSxCggqAc8=;
        b=fNxDDw+lQ8cn1ZfUlwlMDmDurA/LTY7r88BPOjAe/bQnt1kSAgO9Vd5yXUvoeK7jr4
         wAN4869Vyd46cgwZZx707iAlcZjL3FU4crl0oxgIerflxDaA74ECUeDLvvYfy/kjtoRD
         vQarAX2QzTKevh5VLWcuS0dzXyudWvq+KuM9Wdk92ig8nf4mDlQSd+R/6ShysevPsXFQ
         6xEwPvM9tRyERPHrB314QgsomVMEMPScZGlenBQRh8RobO8y01IAPVYHPDB2fVyTsDnc
         btxSqeSoVmK3160uY124+hQcjBB2jY5HvnMQ0Vk5bIMR9teF02488qpeFRwGscRsVMom
         Ay5w==
X-Forwarded-Encrypted: i=1; AJvYcCULdPUksZ8vi8QMQjvC0otA+WeXPpkG6/MapFeEnAfLDBlykxMib0ZfzoVx9xvDQc8PwtOFz+/tYekBp8o=@lists.infradead.org, AJvYcCX8/PrsfY3bzbTHtxsmB9X6d7tIsHz+H5s+fd5qwW5nkS3buxQnoDJ59WwGwcCubfYGBLhNqM2qUn3zjFIG5azZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzny7x5xVBMQki9/piKDWZm7nqXF+IHz4JHdiqXvaqvypcDrZAL
	f3Ij+gFRhd0cZBuWxcJeUfR1HMKj1iAGBzRMBsH6Ux27Ly90zQMoN7TC46rpfk25/EpLJDe//AF
	ko6QHZf9zY03kjQlngPueWVwtedM=
X-Gm-Gg: ASbGncuMbnEfCO60USJVh2RCXm7vaE8CJcnVV2Py3pWR60aI0+wZzXNs7x40GXgjtW0
	GDU7NCtHsLT7c3utoTlwHzr48K7+TQ/lt5VIKRp0vggFrDpzypj3fSoGD32WzBkyHtlE4dUuvEP
	M=
X-Google-Smtp-Source: AGHT+IHm8HBgn3sImk7NTjtXb+A27btOABGGevI0EONCrC/Ff9AcLGqA4yAvmgT0QuA1lhKIHNQku0J8pxt9SI1xfb8=
X-Received: by 2002:a5d:64cc:0:b0:38f:4fa6:bb24 with SMTP id
 ffacd0b85a97d-38f4fa6bca3mr698753f8f.39.1739808814051; Mon, 17 Feb 2025
 08:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
 <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
 <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
 <sjownmnyf4ygi5rtbedan6oauzvyk2d7xcummo5rykiryrpcrt@kasomz5imkkm> <tuwambkzk6ca5mpni7ev5hvr47dkbk6ru3vikplx67hyvqj2sw@rugqv7vhikxb>
In-Reply-To: <tuwambkzk6ca5mpni7ev5hvr47dkbk6ru3vikplx67hyvqj2sw@rugqv7vhikxb>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 17 Feb 2025 17:13:23 +0100
X-Gm-Features: AWEUYZmQ1uvVHZE607fk9A3oqamhim11vzns-dfPoe7sFHHzYYWlnLIpBeOBi1A
Message-ID: <CA+fCnZcHnWr0++8omB5ju8E3uSK+s+JOFZ3=UqgtVEcBzrm2Lg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_081336_526175_37A7DC19 
X-CRM114-Status: GOOD (  33.30  )
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

T24gRnJpLCBGZWIgMTQsIDIwMjUgYXQgOToyMeKAr0FNIE1hY2llaiBXaWVjem9yLVJldG1hbgo8
bWFjaWVqLndpZWN6b3ItcmV0bWFuQGludGVsLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDI1LTAyLTEz
IGF0IDE3OjIwOjIyICswMTAwLCBNYWNpZWogV2llY3pvci1SZXRtYW4gd3JvdGU6Cj4gPk9uIDIw
MjUtMDItMTMgYXQgMDI6Mjg6MDggKzAxMDAsIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4gPj5P
biBUaHUsIEZlYiAxMywgMjAyNSBhdCAyOjIx4oCvQU0gQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5
a252bEBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBPbiBUdWUsIEZlYiAxMSwgMjAyNSBh
dCA3OjA34oCvUE0gTWFjaWVqIFdpZWN6b3ItUmV0bWFuCj4gPj4+IDxtYWNpZWoud2llY3pvci1y
ZXRtYW5AaW50ZWwuY29tPiB3cm90ZToKPiA+Pj4gPgo+ID4+PiA+IEkgZGlkIHNvbWUgZXhwZXJp
bWVudHMgd2l0aCBtdWx0aXBsZSBhZGRyZXNzZXMgcGFzc2VkIHRocm91Z2gKPiA+Pj4gPiBrYXNh
bl9tZW1fdG9fc2hhZG93KCkuIEFuZCBpdCBzZWVtcyBsaWtlIHdlIGNhbiBnZXQgYWxtb3N0IGFu
eSBhZGRyZXNzIG91dCB3aGVuCj4gPj4+ID4gd2UgY29uc2lkZXIgYW55IHJhbmRvbSBib2d1cyBw
b2ludGVycy4KPiA+Pj4gPgo+ID4+PiA+IEkgdXNlZCB0aGUgS0FTQU5fU0hBRE9XX09GRlNFVCBm
cm9tIHlvdXIgZXhhbXBsZSBhYm92ZS4gVXNlcnNwYWNlIGFkZHJlc3NlcyBzZWVtCj4gPj4+ID4g
dG8gbWFwIHRvIHRoZSByYW5nZSBbS0FTQU5fU0hBRE9XX09GRlNFVCAtIDB4ZmZmZjhmZmZmZmZm
ZmZmZl0uIFRoZW4gZ29pbmcKPiA+Pj4gPiB0aHJvdWdoIG5vbi1jYW5vbmljYWwgYWRkcmVzc2Vz
IHVudGlsIDB4MDAwN2ZmZmZmZmZmZmZmZiB3ZSByZWFjaCB0aGUgZW5kIG9mCj4gPj4+ID4ga2Vy
bmVsIExBIGFuZCB3ZSBsb29wIGFyb3VuZC4gVGhlbiB0aGUgYWRkcmVzc2VzIHNlZW0gdG8gZ28g
ZnJvbSAwIHVudGlsIHdlCj4gPj4+ID4gYWdhaW4gc3RhcnQgcmVhY2hpbmcgdGhlIGtlcm5lbCBz
cGFjZSBhbmQgdGhlbiBpdCBtYXBzIGludG8gdGhlIHByb3BlciBzaGFkb3cKPiA+Pj4gPiBtZW1v
cnkuCj4gPj4+ID4KPiA+Pj4gPiBJdCBnYXZlIG1lIHRoZSBzYW1lIHJlc3VsdHMgd2hlbiB1c2lu
ZyB0aGUgcHJldmlvdXMgdmVyc2lvbiBvZgo+ID4+PiA+IGthc2FuX21lbV90b19zaGFkb3coKSBz
byBJJ20gd29uZGVyaW5nIHdoZXRoZXIgSSdtIGRvaW5nIHRoaXMgZXhwZXJpbWVudAo+ID4+PiA+
IGluY29ycmVjdGx5IG9yIGlmIHRoZXJlIGFyZW4ndCBhbnkgYWRkcmVzc2VzIHdlIGNhbiBydWxl
IG91dCBoZXJlPwo+ID4+Pgo+ID4+PiBCeSB0aGUgZGVmaW5pdGlvbiBvZiB0aGUgc2hhZG93IG1h
cHBpbmcsIGlmIHdlIGFwcGx5IHRoYXQgbWFwcGluZyB0bwo+ID4+PiB0aGUgd2hvbGUgNjQtYml0
IGFkZHJlc3Mgc3BhY2UsIHRoZSByZXN1bHQgd2lsbCBvbmx5IGNvbnRhaW4gMS84dGgKPiA+Pj4g
KDEvMTZ0aCBmb3IgU1cvSFdfVEFHUykgb2YgdGhhdCBzcGFjZS4KPiA+Pj4KPiA+Pj4gRm9yIGV4
YW1wbGUsIHdpdGggdGhlIGN1cnJlbnQgdXBzdHJlYW0gdmFsdWUgb2YgS0FTQU5fU0hBRE9XX09G
RlNFVCBvbgo+ID4+PiB4ODYgYW5kIGFybTY0LCB0aGUgdmFsdWUgb2YgdGhlIHRvcCAzIGJpdHMg
KDQgZm9yIFNXL0hXX1RBR1MpIG9mIGFueQo+ID4+PiBzaGFkb3cgYWRkcmVzcyBhcmUgYWx3YXlz
IHRoZSBzYW1lOiBLQVNBTl9TSEFET1dfT0ZGU0VUJ3MgdmFsdWUgaXMKPiA+Pj4gc3VjaCB0aGF0
IHRoZSBzaGFkb3cgYWRkcmVzcyBjYWxjdWxhdGlvbiBuZXZlciBvdmVyZmxvd3MuIEFkZHJlc3Nl
cwo+ID4+PiB0aGF0IGhhdmUgYSBkaWZmZXJlbnQgdmFsdWUgZm9yIHRob3NlIHRvcCAzIGJpdHMg
YXJlIHRoZSBvbmNlIHdlIGNhbgo+ID4+PiBydWxlIG91dC4KPiA+Pgo+ID4+RWgsIHNjcmF0Y2gg
dGhhdCwgdGhlIDNyZCBiaXQgZnJvbSB0aGUgdG9wIGNoYW5nZXMsIGFzCj4gPj5LQVNBTl9TSEFE
T1dfT0ZGU0VUIGlzIG5vdCBhIHRoYXQtd2VsbC1hbGlnbmVkIHZhbHVlLCB0aGUgb3ZlcmFsbCBz
aXplCj4gPj5vZiB0aGUgbWFwcGluZyBob2xkcy4KPiA+Pgo+ID4+PiBUaGUgS0FTQU5fU0hBRE9X
X09GRlNFVCB2YWx1ZSBmcm9tIG15IGV4YW1wbGUgZG9lcyByZWx5IG9uIHRoZQo+ID4+PiBvdmVy
ZmxvdyAoYXJndWFibHksIHRoaXMgbWFrZXMgdGhpbmdzIG1vcmUgY29uZnVzaW5nIFsxXSkuIEJ1
dCBzdGlsbCwKPiA+Pj4gdGhlIHBvc3NpYmxlIHZhbHVlcyBvZiBzaGFkb3cgYWRkcmVzc2VzIHNo
b3VsZCBvbmx5IGNvdmVyIDEvMTZ0aCBvZgo+ID4+PiB0aGUgYWRkcmVzcyBzcGFjZS4KPiA+Pj4K
PiA+Pj4gU28gd2hldGhlciB0aGUgYWRkcmVzcyBiZWxvbmdzIHRvIHRoYXQgMS84dGggKDEvMTZ0
aCkgb2YgdGhlIGFkZHJlc3MKPiA+Pj4gc3BhY2UgaXMgd2hhdCB3ZSB3YW50IHRvIGNoZWNrIGlu
IGthc2FuX25vbl9jYW5vbmljYWxfaG9vaygpLgo+ID4+Pgo+ID4KPiA+UmlnaHQsIEkgc29tZWhv
dyBmb3Jnb3QgdGhhdCBvYnZpb3VzbHkgdGhlIHdob2xlIExBIGhhcyB0byBtYXAgdG8gMS8xNnRo
IG9mIHRoZQo+ID5hZGRyZXNzIHNwYWNlIGFuZCBpdCBzaG9sZCBzdGF5IGNvbnRpZ3VvdXMuCj4g
Pgo+ID5BZnRlciByZXRoaW5raW5nIGhvdyB0aGUgbWFwcGluZyB3b3JrZWQgYmVmb3JlIGFuZCB3
aWxsIHdvcmsgYWZ0ZXIgbWFraW5nIHN0dWZmCj4gPnNpZ25lZCBJIHRob3VnaHQgdGhpcyBwYXRj
aCBjb3VsZCBtYWtlIHVzZSBvZiB0aGUgb3ZlcmZsb3c/Cj4gPgo+ID5Gcm9tIHdoYXQgSSBub3Rp
Y2VkLCBhbGwgdGhlIEtjb25maWcgdmFsdWVzIGZvciBLQVNBTl9TSEFET1dfT0ZGU0VUIHNob3Vs
ZCBtYWtlCj4gPml0IHNvIHRoZXJlIHdpbGwgYmUgb3ZlcmZsb3cgd2hlbiBpbnB1dGluZyBtb3Jl
IGFuZCBtb3JlIHBvc2l0aXZlIGFkZHJlc3Nlcy4KPiA+Cj4gPlNvIG1heWJlIHdlIHNob3VsZCBm
aXJzdCBmaW5kIHdoYXQgdGhlIG1vc3QgbmVnYXRpdmUgYW5kIG1vc3QgcG9zaXRpdmUgKHNpZ25l
ZCkKPiA+YWRkcmVzc2VzIG1hcCB0byBpbiBzaGFkb3cgbWVtb3J5IGFkZHJlc3Mgc3BhY2UuIEFu
ZCB0aGVuIHdoZW4gbG9va2luZyBmb3IKPiA+aW52YWxpZCB2YWx1ZXMgdGhhdCBhcmVuJ3QgdGhl
IHByb2R1Y3Qgb2Yga2FzYW5fbWVtX3RvX3NoYWRvdygpIHdlIHNob3VsZCBjaGVjawo+ID4KPiA+
ICAgICAgIGlmIChhZGRyID4ga2FzYW5fbWVtX3RvX3NoYWRvdyhiaWdnZXN0X3Bvc2l0aXZlX2Fk
ZHJlc3MpICYmCj4gPiAgICAgICAgICAgYWRkciA8IGthc2FuX21lbV90b19zaGFkb3coc21hbGxl
c3RfbmVnYXRpdmVfYWRkcmVzcykpCj4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPklz
IHRoaXMgY29ycmVjdD8KPgo+IEkgc3VwcG9zZSB0aGUgb3JpZ2luYWwgY29kZSBpbiB0aGUgcGF0
Y2ggZG9lcyB0aGUgc2FtZSB0aGluZyB3aGVuIHlvdSBjaGFuZ2UgdGhlCj4gfHwgaW50byAmJjoK
Pgo+ICAgICAgICAgaWYgKGFkZHIgPCBLQVNBTl9TSEFET1dfT0ZGU0VUIC0gbWF4X3NoYWRvd19z
aXplIC8gMiAmJgo+ICAgICAgICAgICAgIGFkZHIgPj0gS0FTQU5fU0hBRE9XX09GRlNFVCArIG1h
eF9zaGFkb3dfc2l6ZSAvIDIpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPgo+IGthc2FuX21l
bV90b19zaGFkb3coMHg3RkZGRkZGRkZGRkZGRkZGKSAtPiAweDA3ZmY3ZmZmZmZmZmZmZmYKPiBr
YXNhbl9tZW1fdG9fc2hhZG93KDB4ODAwMDAwMDAwMDAwMDAwMCkgLT4gMHhmN2ZmODAwMDAwMDAw
MDAwCgpJJ20gYSBiaXQgbG9zdCB3aXRoIHRoZXNlIGNhbGN1bGF0aW9ucyBhdCB0aGlzIHBvaW50
LiBQbGVhc2Ugc2VuZCB0aGUKZnVsbCBwYXRjaCwgaW5jbHVkaW5nIHRoZSBuZXcgdmFsdWVzIGZv
ciBLQVNBTl9TSEFET1dfT0ZGU0VUIChkbyBJCnVuZGVyc3RhbmQgY29ycmVjdGx5IHRoYXQgeW91
IHdhbnQgdG8gY2hhbmdlIHRoZW0/KS4gSXQnbGwgYmUgZWFzaWVyCnRvIGxvb2sgYXQgdGhlIGNv
ZGUuCgpGZWVsIGZyZWUgdG8gc2VuZCB0aGlzIHBhdGNoIHNlcGFyYXRlbHkgZnJvbSB0aGUgcmVz
dCBvZiB0aGUgc2VyaWVzLApzbyB0aGF0IHdlIGNhbiBmaW5hbGl6ZSBpdCBmaXJzdC4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
