Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D94C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 03:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXa3niaHHxLNFPvWAkALMXY8rVVMavE1xd2ds98LyJk=; b=Tm4iESSdNb0sLv
	Pk8Mddm7WqDGJ4iGdZ/4ODtRwH+ObYU0HqnWGvuyOWoHokvS+YGdn5kxfEQN6I+nkmJN/whGqMwGH
	ccl9UGp2I7EabmzAUKW/vkQdBwzcGXSbIoFWmsjvYu/L9ZUcRl+slEg4ggw7QMGClJFYG1ETduPBa
	TCQdCUdimhZrJgsujeQsw8grxwrQeCeUmg+W993Lb6VpSTv6wylJN87UrBp2rdM0gaCPP+MIqTZj5
	no5PORJD5nFz763dzzsa/liTvbKptEBCz/8ZVgJA1KkRPyRB0o5FzdsLBT10tJOpfiFB4dF+v9pdT
	3VAwNE/bCTE6kau7zQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weleh-00000000aM6-0BuY;
	Wed, 01 Jul 2026 03:30:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weled-00000000aLB-1gA2
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 03:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782876626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YoMJdx5zn+YGKPIJdZfuaw6N0IusaD8A3j1a7ig86wQ=;
	b=Hr6h4hZC38QkoCQQ31vMEMKuwFQwzuWHRSMnaofauBpJhlcNwmnM4LycSbpPfysmdISteW
	a4ngr7fjl08whH4LxwbeHsirGSYM1qfDprlCiQpMKH+WQspxvxZQD7ED19bMjDBhePz56u
	xCn81YQrQkJXd5FwKt8r9j3VKP4n3cg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-C0zHxf-6Pj-IJ246B9lKxg-1; Tue, 30 Jun 2026 23:30:24 -0400
X-MC-Unique: C0zHxf-6Pj-IJ246B9lKxg-1
X-Mimecast-MFC-AGG-ID: C0zHxf-6Pj-IJ246B9lKxg_1782876624
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso1530711cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 20:30:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782876624; x=1783481424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YoMJdx5zn+YGKPIJdZfuaw6N0IusaD8A3j1a7ig86wQ=;
        b=kH03klHQwsU3u5efNhpvGrR8+oGqdEjyQgqySmyDY4/OMCicBfSpln1yo4DekT/ozj
         fWzI0mkMZQ4tNrOv+/qLRdMZbIqNyQ7TyIiBAYoFLzY2yCmIyh6roCjgbaJFkU1na5nK
         OsKtk4f1Cr/nt2YDkxoC9EomClq5CbJo2w6l1t3G1OuOGXK1V1KdaUUpYflAbyxaDmpn
         YvOsW9juAy6rfLgHY5OSJkCRU30tkEwFEQ6tw+IG2x/yBlF1oV1S/bkzCHD9nXHGZIQV
         Et0hsKfqrHYXeXdHkZueWc7j/ioXg5J6jx/X0lb/LPUMQZw/UZXuRadmQ6bepnci90O3
         j2dA==
X-Forwarded-Encrypted: i=1; AFNElJ8Rcp80+kv8j5/ST986fKrIteNE01MX6JaMHRZXVmyu2CRYXLuDF4e7LremgJC/KcyvpQbyDfEQA2GDLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx35GsdwMeyLAi1u2pK7aMkVjwOs1LhWb8EnB9nS/VzEsbE5k7J
	C/FgDxznojunFDMolW7WV3AISmBLxNldq+yazVD3ENELQ9dKOe4VFwwLZkBK+lVbxJ0sAx07cMk
	yasNsIA3uGzudP2WrnDzdklPZM0IgBjB/4Q4VSIZYxP0LvgN9NushhtypxpvB4mmJIeu5DsrC1q
	BZx9iT2ISGrkKMmKSv+5Lq18WPQDJDUmopx8IIbKdW2WhD
X-Gm-Gg: AfdE7clv1rs3Dye6qumPc1iTK5qJSUNIOfl5DyzkqklHVVw+GX2yHxU7INRVFdp7wbd
	zjOA+SP9B2jAnJScIPdrMj7jEusD/WmYmyPfgW6SjO+8bN3YRkdR7whna+syNoFwJ54bPXnW7Pz
	QoSYdaE6QAd0X60EXN5a1du20Yl+3rO/+rghI82Zmh8OL2n7xESO+xeeJUCNotRJcnbQ==
X-Received: by 2002:a05:622a:1491:b0:51b:ec5a:ec0f with SMTP id d75a77b69052e-51c26a78b2cmr68581cf.27.1782876623864;
        Tue, 30 Jun 2026 20:30:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1491:b0:51b:ec5a:ec0f with SMTP id
 d75a77b69052e-51c26a78b2cmr68181cf.27.1782876623221; Tue, 30 Jun 2026
 20:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260529032739.13264-2-ltao@redhat.com> <CAO7dBbW+LEy8SBGAKcrxEDzK5Xctw-r7ztgnXuURa9g0xntbtQ@mail.gmail.com>
 <CAP_BRoQEM8Re1dT7JNQgO72o50GAnb2y7R1HWPd+E772GVYAJg@mail.gmail.com> <2vxzh5mlk3bd.fsf@kernel.org>
In-Reply-To: <2vxzh5mlk3bd.fsf@kernel.org>
From: Tao Liu <ltao@redhat.com>
Date: Wed, 1 Jul 2026 15:29:44 +1200
X-Gm-Features: AVVi8CdKF1AKTpYGlqKLlXqBd2QuDG30_C7t77l5Ewf9c6uDhUVIB40R85nEe14
Message-ID: <CAO7dBbXzs2pMrVuJ3qUVT2KYNh9RysOOWy_HPTmCY3gYUh9LDQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in machine_kexec_prepare
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	linux-integrity@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N7zym6HlhOlhvAtsVPBem6Fwkxss4oCj8w29RtSeLTU_1782876624
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_203028_022623_7E6488D0 
X-CRM114-Status: GOOD (  32.46  )
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

SGkgUHJhdHl1c2gsCgpPbiBNb24sIEp1biAyOSwgMjAyNiBhdCAxMToxM+KAr1BNIFByYXR5dXNo
IFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPiB3cm90ZToKPgo+ICtDYyBJTUEgbWFpbnRhaW5l
cnMKPgo+IE9uIEZyaSwgSnVuIDI2IDIwMjYsIEJhb3F1YW4gSGUgd3JvdGU6Cj4KPiA+IEFkZCBr
ZXhlYyBNTCB0byBDQy4KPiA+Cj4gPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCA3OjQ24oCvQU0g
VGFvIExpdSA8bHRhb0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEtpbmRseSBwaW5nLCBh
bnkgY29tbWVudHM/Cj4gPj4KPiA+PiBUaGFua3MsCj4gPj4gVGFvIExpdQo+ID4+Cj4gPj4gT24g
RnJpLCBNYXkgMjksIDIwMjYgYXQgMzozNeKAr1BNIFRhbyBMaXUgPGx0YW9AcmVkaGF0LmNvbT4g
d3JvdGU6Cj4gPj4gPgo+ID4+ID4gQSBOVUxMIHBvaW50ZXIgcmVmZXJlbmNlIGlzc3VlIGlzIG5v
dGljZWQgaW4gcmlzY3YncyBtYWNoaW5lX2tleGVjX3ByZXBhcmUsCj4gPj4gPiB3aGVyZSBpbWFn
ZS0+c2VnbWVudFtpXS5idWYgbWlnaHQgYmUgTlVMTCBhbmQgY29waWVkIHVuY2hlY2tlZC4KPiA+
PiA+Cj4gPj4gPiBUaGUgTlVMTCBidWYgY29tZXMgZnJvbSBzZWN1cml0eS9pbnRlZ3JpdHkvaW1h
L2ltYV9rZXhlYy5jOgo+ID4+ID4gaW1hX2FkZF9rZXhlY19idWZmZXIoKSwgd2hlcmUga2J1ZiBp
cyBhZGRlZCBieSBrZXhlY19hZGRfYnVmZmVyKCksCj4gPj4gPiBidXQga2J1Zi5idWZmZXIgaXMg
TlVMTC4KPiA+PiA+Cj4gPj4gPiBGaXggdGhpcyBieSBzaW1wbHkgYWRkaW5nIGEgY2hlY2sgYmVm
b3JlIGNvcHkuCj4gPj4gPgo+ID4+ID4gU2lnbmVkLW9mZi1ieTogVGFvIExpdSA8bHRhb0ByZWRo
YXQuY29tPgo+ID4+ID4gLS0tCj4gPj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhl
Yy5jIHwgMyArKysKPiA+PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPj4g
Pgo+ID4+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+ID4+ID4gaW5kZXggMjMwNmNlM2U1
ZjIyLi5kODFkNTc2ZjljYjUgMTAwNjQ0Cj4gPj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9t
YWNoaW5lX2tleGVjLmMKPiA+PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4
ZWMuYwo+ID4+ID4gQEAgLTQxLDYgKzQxLDkgQEAgbWFjaGluZV9rZXhlY19wcmVwYXJlKHN0cnVj
dCBraW1hZ2UgKmltYWdlKQo+ID4+ID4gICAgICAgICAgICAgICAgIGlmIChpbWFnZS0+c2VnbWVu
dFtpXS5tZW1zeiA8PSBzaXplb2YoZmR0KSkKPiA+PiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+ID4+ID4KPiA+PiA+ICsgICAgICAgICAgICAgICBpZiAoaW1hZ2UtPnNlZ21l
bnRbaV0uYnVmID09IE5VTEwpCj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiA+PiA+ICsKPiA+Cj4gPiBUaGlzIGlzIGEgZ29vZCBmaXgsIG1heWJlIHdlIGNhbiBhZGQg
Y29kZSBjb21tZW50cyB0byBleHBsYWluIGl0IGFzCj4gPiBiZWxvdywganVzdCBmb3IgcmVmZXJl
bmNlLgo+ID4KPiA+ICAgICAgICAgICAgICAgIC8qCj4gPiAgICAgICAgICAgICAgICAgKiBTb21l
IHNlZ21lbnRzIChlLmcuIElNQSkgcmVzZXJ2ZSBzcGFjZSBidXQgaGF2ZSBubyBidWZmZXIKPiA+
ICAgICAgICAgICAgICAgICAqIGxvYWRlZCB5ZXQuIFNraXAgdGhlbSBhcyB0aGV5IGNhbm5vdCBj
b250YWluIGFuIEZEVC4KPiA+ICAgICAgICAgICAgICAgICAqLwo+ID4gQW5kIGlzIHRoZXJlIGFu
eSBvdGhlciBwbGFjZSB3aGVyZSB0aGUgc2ltaWxhciBpc3N1ZSBleGlzdHM/IGUuZyBvbiBMb29u
Z0FyY2g/Cj4gPgo+ID4gT3RoZXIgdGhhbiBhYm92ZSBjb25jZXJucywgdGhpcyBwYXRjaCBsb29r
cyBnb29kIHRvIG1lOgo+ID4KPiA+IEFja2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNv
bT4KPgo+IFllYWgsIHRoZSBwYXRjaCBMR1RNIHRvIG1lIHRvby4KPgo+IEFja2VkLWJ5OiBQcmF0
eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz4KPgo+IEFsdGhvdWdoIEkgdGhpbmsgSU1B
IGNhbiBtYWtlIHRoaXMgYSBiaXQgZWFzaWVyIHRvIHVuZGVyc3RhbmQuIEZpcnN0LCBpbgo+IGlt
YV9hZGRfa2V4ZWNfYnVmZmVyKCkgaXQgc2hvdWxkIHNldCBrYnVmLmJ1ZmZlciB0byBOVUxMIGFu
ZCBrYnVmLmJ1ZnN6Cj4gdG8gMCBleHBsaWNpdGx5IGluc3RlYWQgb2YgdXNpbmcga2V4ZWNfYnVm
ZmVyIGFuZCBrZXhlY19idWZmZXJfc2l6ZQo+IHdoaWNoIGFyZSBpbml0aWFsaXplZCB0byBOVUxM
IGFuZCAwLCBidXQgbmV2ZXIgdXBkYXRlZC4gVXNpbmcgdGhlCj4gdmFyaWFibGVzIGhlcmUgYWRk
cyBhbiBleHRyYSBsZXZlbCBvZiBpbmRpcmVjdGlvbi4KPgo+IEFsc28sIHBlcmhhcHMgd2Ugc2hv
dWxkIGFkZCBhIGNvbW1lbnQgaW4gaW1hX2FkZF9rZXhlY19idWZmZXIoKSBhYm91dAo+IGhvdyB0
aGlzIGFsbCB3b3Jrcywgc2luY2Ugd2hlcmUgdGhlIElNQSBidWZmZXIgbGl2ZXMgYW5kIHdoZXJl
IGl0IGdldHMKPiB1cGRhdGVkIGl0IGZhaXJseSBjb21wbGljYXRlZCBhbmQgdG9vayBtZSBzb21l
IHRpbWUgdG8gcGllY2UgdG9nZXRoZXIuCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ggcmV2aWV3IGFu
ZCBzdWdnZXN0aW9ucyEgSSBhZ3JlZSB3aXRoIHlvdXIgcG9pbnQKb24gdGhlIElNQSBwYXJ0LCBJ
IHdhcyBjb25mdXNlZCBieSB0aGUgY29kZSB0b28sIGUuZyBpbgppbWFfYWRkX2tleGVjX2J1ZmZl
cigpOgoKdm9pZCAqa2V4ZWNfYnVmZmVyID0gTlVMTDsKa2J1Zi5idWZmZXIgPSBrZXhlY19idWZm
ZXI7CnJldCA9IGtleGVjX2FkZF9idWZmZXIoJmtidWYpOwppZiAocmV0KSB7CiAgICBwcl9lcnIo
IkVycm9yIHBhc3Npbmcgb3ZlciBrZXhlYyBtZWFzdXJlbWVudCBidWZmZXIuXG4iKTsKICAgIHZm
cmVlKGtleGVjX2J1ZmZlcik7CiAgICByZXR1cm47Cn0KCkRvIHdlIG5lZWQgdG8gdmZyZWUoa2V4
ZWNfYnVmZmVyKT8gV2hlbiBrZXhlY19idWZmZXIgaXMgTlVMTCBhbmQgc2VlbXMKbmV2ZXIgZ2V0
IHVwZGF0ZWQuCgpJJ20gbm90IGZhbWlsaWFyIHdpdGggSU1BIGNvZGUsIG1heWJlIHRoZXJlIGlz
IGEgcmVhc29uIHdoaWNoIEknbSB1bmF3YXJlIG9mLi4uCgpUaGFua3MsClRhbyBMaXUKCgoKPgo+
IC0tCj4gUmVnYXJkcywKPiBQcmF0eXVzaCBZYWRhdgo+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
