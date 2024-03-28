Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E9EC54E67
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 02:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjXl98G0ET8TvbgeGDdpyyINeSXLNN6usR757pLEAh0=; b=EBfbU0rJOneEr+
	jN52/n4T1WKV5fArEsfpu9myjNSIckZK4o1yivoBC5XZs8jvgm7avWFB02EH7kFEotvguWFBALIqt
	zcSfGC/fM1av21QA+5zBzg4r0lPD5bsXfSjjeR/28KIoE/RdRZaFMogw7Rzcz9i87UDfHdiZX2tmt
	zLupRU9jCKWJ4Xsts7EUxfD4CnMSUug47hIQhlBcv3MX3ES3A1n2w9lsWq7Oqdvt8hcbdpp/GoVY3
	Mi63ydv1APzBv+rH17yWwEd4D2N9rmQbALuqcRjhKqCa5CSYwD3PLZw5uq+h0v/7cgKyvb8LPlxrs
	JhQo24xV/cMP0L4RKS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfOt-0000000C4rk-2bAW;
	Thu, 28 Mar 2024 02:21:55 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpfOq-0000000C4qa-0SWK
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 02:21:53 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5a493475aefso696469eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 19:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711592508; x=1712197308; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt1qJ/aapzEk7b+bqj1PXxdFxkUP6vsNQasniKK4Xiw=;
        b=f6Zl9RKMYqhc05hfnLviD6IUxkI3nnUyPacVO/OT9I+bmtNG1smB40FM36oFcOCAzv
         hHXm4R37rDBT5ALwVQ3rw2iwpiq7qTDJBcLq8lPVmQeBvquySDBFXGrpMFtnKM00SWix
         l8Gq/A6C4SmFAyooqZN2wmgXsCAletFy8z7rnD+zCL+bo5NM5xivUUYBc9MNbcnbXXG9
         SONLJpQW7/R9Xep6PvqduI3qcH+OxTJFKAoQ5xb3sAjag0LCk68oLtG1j4cfaCN1r4xd
         ltt+VLJcWDWacDSpkC1k47lqM3xw3X3qlPXeC9HlsrC92wv104lC96A9d+MuQCbC1/Su
         UZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711592508; x=1712197308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt1qJ/aapzEk7b+bqj1PXxdFxkUP6vsNQasniKK4Xiw=;
        b=KV571boflDNvrKHXvwAtf7p2Tze/Gi/WqUMZm7DpEd673RseiHH7Z3RdiPUJc26Gr7
         t0TY1tQxe7XVGxyRHoi7NTJe4B4jp8tKLnuE+6eTLGwzM17RjkhZHOVjNZoU7K6kUI6b
         xnetejB4cGiQAS7dFnjkSzQebCgimAt4hFhdDCRJCu04GWGGJi6u5ZUJGgCRrdH5Wk5Z
         ezqwbOjkmEdMjZD87aw82ZQUpNkUmzsjti7UFkP0iqiamA47oV4UMzVQKg9Vd2EEkiym
         zIGoQyGccXbQLXTKKi1UhjtUO6txviO9evzZ9Ll4uXamu8y7fhVLDJ4OoLvP9Vdblsqz
         dmyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3AOIgluVUxrDp9TL1lai9hWSYmj6clBrUdE8PNCrpMvgSx1uz4+4Y8N68MggxEUIn0DF1RJwJCs5qyW7+cRioh7IgaHKvlqI2U3/FV7yh
X-Gm-Message-State: AOJu0Yy59KV9PDc0VG5m8piRWLw4x3WHU/RNQVdlKivSzUY2hilPLGGw
	j3J93qFOEI34Jw5iWwcwmCG2opqNf+zTQ5WmSQGfzjV2j0NnrGem+YPaHOZ9pzGRwuuW5uTGcxx
	gGIgKH9FzdogQ0SqR6mh4JPFZshyrTi5beUfqow48RHNeld+tMIo6eA==
X-Google-Smtp-Source: AGHT+IF7mvHjc+uzeHTN+S+gkIbUZbxU6z0DSjgvfA9hDpJa/w883Lt26dgm5e98f7MAdqqDGgZYC4cyC2x9ZkE+D3M=
X-Received: by 2002:a05:6870:e97:b0:222:8961:43fa with SMTP id
 mm23-20020a0568700e9700b00222896143famr445494oab.15.1711592508022; Wed, 27
 Mar 2024 19:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240327045035.368512-1-samuel.holland@sifive.com>
 <20240327045035.368512-6-samuel.holland@sifive.com> <CAEEQ3wm4SoC6rvv2qtVdP+4ZF1q41EEHUpwnagNgFwxkG5iw_w@mail.gmail.com>
 <e409d77b-0dad-45c2-a507-a8b697ff4702@sifive.com>
In-Reply-To: <e409d77b-0dad-45c2-a507-a8b697ff4702@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 28 Mar 2024 10:21:37 +0800
Message-ID: <CAEEQ3wksq6Et4n7pKPD_SJdAkmgAPF6G0B7uG4PNUMknc-okyw@mail.gmail.com>
Subject: Re: [External] [PATCH v6 05/13] riscv: Only send remote fences when
 some other CPU is online
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_192152_339982_1E8A2B01 
X-CRM114-Status: GOOD (  23.27  )
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

SGkgU2FtdWVsLAoKT24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgNDoxNOKAr0FNIFNhbXVlbCBIb2xs
YW5kCjxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIFl1bmh1aSwKPgo+
IE9uIDIwMjQtMDMtMjcgMToxNiBBTSwgeXVuaHVpIGN1aSB3cm90ZToKPiA+IE9uIFdlZCwgTWFy
IDI3LCAyMDI0IGF0IDEyOjUw4oCvUE0gU2FtdWVsIEhvbGxhbmQKPiA+IDxzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tPiB3cm90ZToKPiA+Pgo+ID4+IElmIG5vIG90aGVyIENQVSBpcyBvbmxpbmUs
IGEgbG9jYWwgY2FjaGUgb3IgVExCIGZsdXNoIGlzIHN1ZmZpY2llbnQuCj4gPj4gVGhlc2UgY2hl
Y2tzIGNhbiBiZSBjb25zdGFudC1mb2xkZWQgd2hlbiBTTVAgaXMgZGlzYWJsZWQuCj4gPj4KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNv
bT4KPiA+PiAtLS0KPiA+Pgo+ID4+IChubyBjaGFuZ2VzIHNpbmNlIHY0KQo+ID4+Cj4gPj4gQ2hh
bmdlcyBpbiB2NDoKPiA+PiAgLSBOZXcgcGF0Y2ggZm9yIHY0Cj4gPj4KPiA+PiAgYXJjaC9yaXNj
di9tbS9jYWNoZWZsdXNoLmMgfCA0ICsrKy0KPiA+PiAgYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5j
ICAgfCA0ICsrKy0KPiA+PiAgMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNo
LmMgYi9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwo+ID4+IGluZGV4IGQ3NmZjNzNlNTk0Yi4u
ZjViZTFmZWM4MTkxIDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5j
Cj4gPj4gKysrIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPiA+PiBAQCAtMjEsNyArMjEs
OSBAQCB2b2lkIGZsdXNoX2ljYWNoZV9hbGwodm9pZCkKPiA+PiAgewo+ID4+ICAgICAgICAgbG9j
YWxfZmx1c2hfaWNhY2hlX2FsbCgpOwo+ID4+Cj4gPj4gLSAgICAgICBpZiAocmlzY3ZfdXNlX3Ni
aV9mb3JfcmZlbmNlKCkpCj4gPj4gKyAgICAgICBpZiAobnVtX29ubGluZV9jcHVzKCkgPCAyKQo+
ID4+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gPj4gKyAgICAgICBlbHNlIGlmIChyaXNjdl91
c2Vfc2JpX2Zvcl9yZmVuY2UoKSkKPiA+PiAgICAgICAgICAgICAgICAgc2JpX3JlbW90ZV9mZW5j
ZV9pKE5VTEwpOwo+ID4+ICAgICAgICAgZWxzZQo+ID4+ICAgICAgICAgICAgICAgICBvbl9lYWNo
X2NwdShpcGlfcmVtb3RlX2ZlbmNlX2ksIE5VTEwsIDEpOwo+ID4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L21tL3RsYmZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+PiBpbmRl
eCBkYTgyMTMxNWQ0M2UuLjA5MDFhYTQ3YjU4ZiAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2
L21tL3RsYmZsdXNoLmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiA+PiBA
QCAtNzksNyArNzksOSBAQCBzdGF0aWMgdm9pZCBfX2lwaV9mbHVzaF90bGJfYWxsKHZvaWQgKmlu
Zm8pCj4gPj4KPiA+PiAgdm9pZCBmbHVzaF90bGJfYWxsKHZvaWQpCj4gPj4gIHsKPiA+PiAtICAg
ICAgIGlmIChyaXNjdl91c2Vfc2JpX2Zvcl9yZmVuY2UoKSkKPiA+PiArICAgICAgIGlmIChudW1f
b25saW5lX2NwdXMoKSA8IDIpCj4gPj4gKyAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9h
bGwoKTsKPiA+PiArICAgICAgIGVsc2UgaWYgKHJpc2N2X3VzZV9zYmlfZm9yX3JmZW5jZSgpKQo+
ID4+ICAgICAgICAgICAgICAgICBzYmlfcmVtb3RlX3NmZW5jZV92bWFfYXNpZChOVUxMLCAwLCBG
TFVTSF9UTEJfTUFYX1NJWkUsIEZMVVNIX1RMQl9OT19BU0lEKTsKPiA+PiAgICAgICAgIGVsc2UK
PiA+PiAgICAgICAgICAgICAgICAgb25fZWFjaF9jcHUoX19pcGlfZmx1c2hfdGxiX2FsbCwgTlVM
TCwgMSk7Cj4gPj4gLS0KPiA+PiAyLjQzLjEKPiA+Pgo+ID4KPiA+IEZyb20gYSBwZXJjZXB0dWFs
IHBvaW50IG9mIHZpZXcsIHRoZSBtb2RpZmljYXRpb24gaGVyZSBpcyBub3QKPiA+IG5lY2Vzc2Fy
eS4gVGhlcmUgaXMgc3VjaCBsb2dpYyBpbiBvbl9lYWNoX2NwdSgpLiBDYW4geW91IHNoYXJlIHlv
dXIKPiA+IHRlc3QgZGF0YT8KPgo+IFRoZSBsb2dpYyBpbiBvbl9lYWNoX2NwdSgpIGRvZXNuJ3Qg
YXBwbHkgd2hlbiByaXNjdl91c2Vfc2JpX2Zvcl9yZmVuY2UoKSBpcwo+IHRydWUsIHNvIHdlIHdv
dWxkIG1ha2UgdW5uZWNlc3NhcnkgU0JJIGNhbGxzLCBhbmQgY2Fubm90IGJlIG9wcGltaXplZCBv
dXQgd2hlbgo+IENPTkZJR19TTVA9bi4KCklzIGl0IHBvc3NpYmxlIHRvIGRvIHRoaXM6CiJzYmlf
cmVtb3RlX3NmZW5jZV92bWFfYXNpZChjcHVfb25saW5lX21hc2ssLi4uKTsgIiBpbnN0ZWFkIG9m
IGFkZGluZzoKImlmIChudW1fb25saW5lX2NwdXMoKSA8IDIpIiA/CgpUaGFua3MsCll1bmh1aQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
