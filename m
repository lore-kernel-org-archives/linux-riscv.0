Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BF7E77170
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 21:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyy6bxkiKo6BZkWhhUxth1C7fCsVxnm/hkSf9NA8fAk=; b=Pae48XspQwrQBs
	FsPvp+S/vro6e98bNxM+bE4QAA0Q6ySUqRVylFjQsheEv5CBHbA0D/v2xyJtL+M9qV/ohch3dSoxE
	qesNdqLjNyUXvxBVlYakN5e1FP12o725DXQzuQeWr588OB0+/F+LD8uQK35duckixd8MdT07dAd8Q
	QdxTT8ssT5kZRZinLHN45c0Gwmpp2Kak2nQHf6sZKe8TVuLz2ZeUXlB8PN5PXJsQBPDvFgd4wFTEs
	VkII9Avv7jHidYfQIYqDfbEQ4r0eODiEeEgJ93IFHT+almcPCpHrpvtS9bLD2IFEC9WZsepjP74jw
	zfBdxqb3CtMY4bqm6d/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJRF-0000000HP8N-1xDH;
	Thu, 05 Dec 2024 21:31:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJR8-0000000HP5f-3emX
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 21:31:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-724fc1aaa91so1512582b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 13:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733434262; x=1734039062; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=swrB1X9v62XhnQOwomPfhFuZeA3/Dy25MIYnjNAQ9Aw=;
        b=FkPzn6hrZsYKnNtqvfds6HWMYishKMr+w7wEVMaxX1O425dpaywzi8/hIWQEH27+wU
         BWavDLt5e+RZI3d+mLB5a75/M7vXfv1mjQ1kStsNbqbjOyo2oIUPNeUht1DYGLlOTUkq
         /YfGW6dKeefxzRzut/+/yl89FD+LL+nTtQ/3zsfnnFbzBgEsjZp6E/StgbY/ozMJw4B0
         jUpc3PrGIn6fXhICb/8t98jRwZXnh6JetIKjYjPRXd3MQKM4YQdwp2zuoYIFWP5v0+Ho
         +Bi+t39oHtS1tlz1QmYzDkbxZSlcMk++1UWyoM0hwxVZMqOZZFvdP8mGIr/oiWcolehw
         e3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733434262; x=1734039062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swrB1X9v62XhnQOwomPfhFuZeA3/Dy25MIYnjNAQ9Aw=;
        b=ZB8UBbFSEa62l7kUSDefDMqT5fLirS07pb0evKLTyVdiqloZ00Y93YqF5jMVs29NLe
         geAjNH0SwbxWuukJD0FQBxyx2pQEMik8jvzzGVSA1oTK9kKiocvYcOYqsaMoIshxeYbv
         cnqFdWMjueV6EnilgunzhzQqrpc9qfveaRE7owBXfmcJGofRdKoLmIno5dWnzcQVb+5+
         La8n366SUzZwmpGD0UBVzi7gwW27YpcjtjA6MSQgA3qulaIzSvG/MYcglWjPS09mL93A
         IllfUmkyJ7f3hDZkJRLk7VRA+dY9Oky0ca/DUzGnpf1bGhdq8fyNj0L2fxTxp+GcpHBC
         v6mw==
X-Forwarded-Encrypted: i=1; AJvYcCXIZd/qYZiwogwXATl6+bIfmyGFM26VvLC1Y/Oyg9k2c/TRqleeT0NiEHXbVYfYe295Og4sozpH/mbzOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaP6WHnKll+w+5uLTlNbkbchU+D14dXfLWJZ4pY70+vaI65QJX
	wm2xNi0PoxicHUDHAdwMmkORD1YdbczbuR+lxFo1Ss8/Y6kjYpKlnp23pkWdMzk=
X-Gm-Gg: ASbGncu0Fj5vE7D0HvNbJDVmh+jequnXbaS6hO8GmCBp0pPFO/A5ZQjrWPRGrg2IDlN
	yRYqCzoHQ7aPbNOuSfrAvOrMqkLxqeqgFLrUfSea6yzAXCC86p8+797wiHnb3gmfzh2xJCRicNv
	uPIVBU4kbXiffvyY8c2Pzt+f331IfkBLsieZ5oSAcLezl6VBnnHN112VgD/1J3Ghwpy8BO1Nssf
	cHG4gPttuSm26X8CAvzERB+YZ9qO/MNPZ5wiYDgxL99
X-Google-Smtp-Source: AGHT+IFL9KJFSFdqWEJ5S3rFfqk+7jTG8B4QqZ1/8txfPBPRJMuKSjeQj3xp8kqjhhl1CQpulA+rfw==
X-Received: by 2002:a05:6a00:2196:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-725b8156675mr1310656b3a.13.1733434261665;
        Thu, 05 Dec 2024 13:31:01 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:643d:2bb:e7d1:adbd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725a29e8fa7sm1748633b3a.67.2024.12.05.13.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 13:31:01 -0800 (PST)
Date: Thu, 5 Dec 2024 13:30:59 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v2] riscv: selftests: Fix warnings pointer masking test
Message-ID: <Z1Ibk8izrtPAywoU@ghost>
References: <20241204-fix_warnings_pointer_masking_tests-v2-1-1bf0c5095f58@rivosinc.com>
 <20241205-45c00adab2636bf26ce05f70@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241205-45c00adab2636bf26ce05f70@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_133103_173093_1324B60E 
X-CRM114-Status: GOOD (  28.53  )
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

T24gVGh1LCBEZWMgMDUsIDIwMjQgYXQgMDk6MDQ6MTJBTSArMDEwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIFdlZCwgRGVjIDA0LCAyMDI0IGF0IDA2OjU3OjEwUE0gLTA4MDAsIENoYXJsaWUg
SmVua2lucyB3cm90ZToKPiA+IFdoZW4gY29tcGlsaW5nIHRoZSBwb2ludGVyIG1hc2tpbmcgdGVz
dHMgd2l0aCAtV2FsbCB0aGlzIHdhcm5pbmcKPiA+IGlzIHByZXNlbnQ6Cj4gPiAKPiA+IHBvaW50
ZXJfbWFza2luZy5jOiBJbiBmdW5jdGlvbiDigJh0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGzi
gJk6Cj4gPiBwb2ludGVyX21hc2tpbmcuYzoyMDM6OTogd2FybmluZzogaWdub3JpbmcgcmV0dXJu
IHZhbHVlIG9mIOKAmHB3cml0ZeKAmQo+ID4gZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUg4oCYd2Fy
bl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1bHRdCj4gPiAgIDIwMyB8ICAgICAgICAg
cHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOyB8Cj4gPiAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4gcG9pbnRlcl9tYXNraW5nLmM6MjA4Ojk6IHdhcm5pbmc6Cj4gPiBpZ25vcmluZyByZXR1
cm4gdmFsdWUgb2Yg4oCYcHdyaXRl4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlCj4gPiDigJh3
YXJuX3VudXNlZF9yZXN1bHTigJkgWy1XdW51c2VkLXJlc3VsdF0KPiA+ICAgMjA4IHwgICAgICAg
ICBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4gPiAKPiA+IEkgY2FtZSBhY3Jvc3MgdGhpcyBv
biByaXNjdjY0LWxpbnV4LWdudS1nY2MgKFVidW50dQo+ID4gMTEuNC4wLTF1YnVudHUxfjIyLjA0
KS4KPiA+IAo+ID4gRml4IHRoaXMgYnkgY2hlY2tpbmcgdGhhdCB0aGUgbnVtYmVyIG9mIGJ5dGVz
IHdyaXR0ZW4gZXF1YWwgdGhlIGV4cGVjdGVkCj4gPiBudW1iZXIgb2YgYnl0ZXMgd3JpdHRlbi4K
PiA+IAo+ID4gRml4ZXM6IDc0NzBiNWFmZDE1MCAoInJpc2N2OiBzZWxmdGVzdHM6IEFkZCBhIHBv
aW50ZXIgbWFza2luZyB0ZXN0IikKPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIEkg
aGFkIHJldCAhPSAyIGZvciB0ZXN0aW5nLCBJIGNoYW5nZWQgaXQgdG8gYmUgcmV0ICE9IDEuCj4g
PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDQtZml4X3dh
cm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy12MS0xLWVhMWU5NjY1Y2U3YUByaXZvc2luYy5j
b20KPiA+IC0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVy
X21hc2tpbmcuYyB8IDE5ICsrKysrKysrKysrKysrKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYwo+ID4gaW5kZXgg
ZGVlNDFiN2VlM2UzLi4yMjlkODVjY2ZmNTAgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMKPiA+ICsrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYwo+ID4gQEAgLTE4OSw2
ICsxODksNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGwodm9pZCkK
PiA+ICB7Cj4gPiAgCWNoYXIgdmFsdWU7Cj4gPiAgCWludCBmZDsKPiA+ICsJaW50IHJldDsKPiA+
ICAKPiA+ICAJa3NmdF9wcmludF9tc2coIlRlc3RpbmcgdGFnZ2VkIGFkZHJlc3MgQUJJIHN5c2N0
bFxuIik7Cj4gPiAgCj4gPiBAQCAtMjAwLDE0ICsyMDEsMjQgQEAgc3RhdGljIHZvaWQgdGVzdF90
YWdnZWRfYWRkcl9hYmlfc3lzY3RsKHZvaWQpCj4gPiAgCX0KPiA+ICAKPiA+ICAJdmFsdWUgPSAn
MSc7Cj4gPiAtCXB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiA+ICsJcmV0ID0gcHdyaXRlKGZk
LCAmdmFsdWUsIDEsIDApOwo+ID4gKwlpZiAocmV0ICE9IDEpIHsKPiA+ICsJCWtzZnRfdGVzdF9y
ZXN1bHRfZmFpbCgiV3JpdGUgdG8gL3Byb2Mvc3lzL2FiaS90YWdnZWRfYWRkcl9kaXNhYmxlZCBm
YWlsZWQuXG4iKTsKPiA+ICsJCXJldHVybjsKPiA+ICsJfQo+ID4gKwo+ID4gIAlrc2Z0X3Rlc3Rf
cmVzdWx0KHNldF90YWdnZWRfYWRkcl9jdHJsKG1pbl9wbWxlbiwgdHJ1ZSkgPT0gLUVJTlZBTCwK
PiA+ICAJCQkgInN5c2N0bCBkaXNhYmxlZFxuIik7Cj4gPiAgCj4gPiAgCXZhbHVlID0gJzAnOwo+
ID4gLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4gPiAtCWtzZnRfdGVzdF9yZXN1bHQoc2V0
X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9PSAwLAo+ID4gLQkJCSAic3lzY3Rs
IGVuYWJsZWRcbiIpOwo+ID4gKwlyZXQgPSBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4gPiAr
CWlmIChyZXQgIT0gMSkgewo+ID4gKwkJa3NmdF90ZXN0X3Jlc3VsdF9mYWlsKCJXcml0ZSB0byAv
cHJvYy9zeXMvYWJpL3RhZ2dlZF9hZGRyX2Rpc2FibGVkIGZhaWxlZC5cbiIpOwo+ID4gKwkJcmV0
dXJuOwo+ID4gKwl9Cj4gCj4gQ291bGQgbWFrZSBhIHdyYXBwZXIgZnVuY3Rpb24gZm9yIHB3cml0
ZSgpIHRvIGF2b2lkIGR1cGxpY2F0aW5nIHRoZSByZXQKPiB2YWx1ZSBjaGVjay4KCkknbGwgY2hh
bmdlIGl0IHRvIGEgZ290byBzdGF0ZW1lbnQgdG8gYXZvaWQgZHVwbGljYXRpbmcgdGhlCmtzZnRf
dGVzdF9yZXN1bHRfZmFpbCBjYWxsLgoKPiAKPiA+ICsKPiA+ICsJa3NmdF90ZXN0X3Jlc3VsdChz
ZXRfdGFnZ2VkX2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUpID09IC1FSU5WQUwsCj4gPiArCQkJ
ICJzeXNjdGwgZGlzYWJsZWRcbiIpOwo+IAo+IFdoeSBpcyB0aGlzIGNoYW5nZWQgZnJvbSBleHBl
Y3RpbmcgMCBmb3IgdGhlIHJldHVybiBhbmQgYmVpbmcgdGhlCj4gInN5c2N0cmwgZW5hYmxlZCIg
dGVzdD8gV2Ugc3RpbGwgd3JpdGUgJzAnIHRvIHRhZ2dlZF9hZGRyX2Rpc2FibGVkIGhlcmUuCgpT
aWxseSBjb3B5IG1pc3Rha2UsIHRoYW5rIHlvdSEKCj4gCj4gPiAgCj4gPiAgCXNldF90YWdnZWRf
YWRkcl9jdHJsKDAsIGZhbHNlKTsKPiA+ICAKPiA+IAo+ID4gLS0tCj4gPiBiYXNlLWNvbW1pdDog
NDAzODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3NWVkMDg4ZWNmMGIzNwo+ID4gY2hhbmdlLWlkOiAy
MDI0MTIwNC1maXhfd2FybmluZ3NfcG9pbnRlcl9tYXNraW5nX3Rlc3RzLTM4NjBlNGYzNTQyOQo+
ID4gLS0gCj4gPiAtIENoYXJsaWUKPiA+Cj4gCj4gTm90IHBhcnQgb2YgdGhpcyBwYXRjaCwgYnV0
IG5vdyB0aGF0IEkgbG9va2VkIGF0Cj4gdGVzdF90YWdnZWRfYWRkcl9hYmlfc3lzY3RsKCkgSSBz
ZWUgdGhhdAo+IGtzZnRfdGVzdF9yZXN1bHRfc2tpcCgpIGlzIGR1cGxpY2F0ZWQuCgpPaCBodWgg
SSBoYWRuJ3Qgbm90aWNlZCB0aGF0LiBJJ2xsIHNlbmQgYSBwYXRjaCBmb3IgdGhhdCBJIGd1ZXNz
LCBlYXN5CmZpeC4KCi0gQ2hhcmxpZQoKPiAKPiBUaGFua3MsCj4gZHJldwo+IAo+ID4gCj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
