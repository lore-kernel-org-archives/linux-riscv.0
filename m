Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D21CCD1A2
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 13:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9M7qqp+5ppJlW8tcwnuKof9bl69lZSFD7o0jkkc1FMY=; b=c/NQNxn47PX+/H
	yxsFWYVgvx2Dt4/+wgSAFSwODBa4XI7y6tP9y599TquZ3juQvkamEOB4OLQppcmicP1zeTHP5soyy
	yMlOXLQEKmv39Qnm4i4Q1NoNYuXpZPu713+wbm1G66xT8WsxA/SvaCk9weSPW5/yJ6bd/bSwcHoj0
	zhOWg6ubPi7aWE9cnqXSdR75p0KY/3NPhouMqhvVZ9s/YTqjOJaOm8fG7EeDp8lY3yBHDroULcDVk
	A3k6hpDTtCGoUTiqBNkp1xwYfxx0kBU6uBxTZYj9JqUwjTGT6EMLu+pdS6vTyhpTLGk9kpfMsjQdJ
	stz7qU4Shl6v62s6J+yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqEK-0000000DqTc-2gcm;
	Mon, 20 Oct 2025 13:47:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqEH-0000000DqRM-02Ps
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 13:47:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AAA448BD6
	for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314F7C116B1
	for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 13:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760968026;
	bh=ANgSQSPVOIlXoVYbP+I9m5tJ0ZaaqeZGLzdTf42qYbc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ajn8vXuNnKb1LAbPZxFi0K1SpVKYv6BEENBjvz46Sv9caDB7o+XlW10cYl3uLNOIb
	 DV1BMPpT9P2ROVtknynYnMUmuw5Yj98O/adWd41Q9N0z5pm5Yg04Zxb8o1YwEdNRWv
	 /hdbw1ywMjql2m+TwIB/dEWaAe2yJ8HI411QTh7e0dArZNoWSU89ftPtasueR2lic9
	 yKp2jtGn9yJNS8zZF49TO7B+NfQLEouWx04Xrnig/kWBHsxxrvc8hfCoS/74Mnci7a
	 pyrpMcPYhrwFib862EgEwt/zugtG1JtfSbo6ARZERY0E0vHdrPUzMtbIGgjJOamR7i
	 xYKl9K5W5qd0w==
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso19120485e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 06:47:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlC9iH9mx3svTjZBgZj34ZIEt273Bp9YcAy4XaWDpPmffDC0+Qx+n20IT5T/gBC2X/wQqbtcM4obbHvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkIxXAkZniKZ5xmaxxx75Sd7GvB6VtbyLBp15r4MvyavFEVPd5
	sc3seklkdRSHRYmi4qiZDmjA/c2j0QyXjkQZQ75Is3gf17cEI0rrtvMOYe9PPcX9OFhEbQJk9iV
	JRRAJg9WssamCsklRXv3LAtFH91BtEKg=
X-Google-Smtp-Source: AGHT+IGpvHBGOazwRpML7L6p+OasmV1SnRg6q1qXry12cbpNN8zhS8TFOb5uYraKUxj/eNcIvfi0sxzsmTyVox3z8JY=
X-Received: by 2002:a05:600c:3b0c:b0:471:669:ec1f with SMTP id
 5b1f17b1804b1-471178785e1mr97856905e9.8.1760968024377; Mon, 20 Oct 2025
 06:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251020042056.30283-1-luxu.kernel@bytedance.com> <20251020042056.30283-4-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042056.30283-4-luxu.kernel@bytedance.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 20 Oct 2025 21:46:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTREY07Eo0EgB9ew1sd6FkMtoFSTgyC5ny2SQKKd83xEtw@mail.gmail.com>
X-Gm-Features: AS18NWDSEQv09h9pIrv_Q1ibVOSy0wdkcUShHmZExEFgCajrR16Dgx95ctdgozI
Message-ID: <CAJF2gTREY07Eo0EgB9ew1sd6FkMtoFSTgyC5ny2SQKKd83xEtw@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] riscv: hwprobe: Export Zalasr extension
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, anup@brainfault.org, 
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org, 
	parri.andrea@gmail.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_064717_106089_E9E6DEAA 
X-CRM114-Status: GOOD (  17.69  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTI6MjHigK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0
ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBFeHBvcnQgdGhlIFphbGFzciBleHRlbnNpb24gdG8gdXNl
cnNwYWNlIHVzaW5nIGh3cHJvYmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJu
ZWxAYnl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0ICB8IDUgKysrKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUu
aCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwgMSArCj4g
IDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRh
dGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gaW5kZXggMmFhOWJlMjcyZDVkZS4uMDY3YTM1
OTVmYjlkNSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5y
c3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiBAQCAtMjQ5
LDYgKzI0OSw5IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiAgICAgICAgIGRl
ZmluZWQgaW4gdGhlIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFydGluZyBmcm9tIGNvbW1p
dCBlODc0MTJlNjIxZjEKPiAgICAgICAgICgiaW50ZWdyYXRlIFphYW1vIGFuZCBaYWxyc2MgdGV4
dCAoIzEzMDQpIikuCj4KPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQUxBU1Jg
OiBUaGUgWmFsYXNyIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQgYXMKPiArICAgICAgIGZyb3plbiBh
dCBjb21taXQgMTk0ZjAwOTQgKCJWZXJzaW9uIDAuOSBmb3IgZnJlZXplIikgb2YgcmlzY3YtemFs
YXNyLgoiRnJvemVuIFZlcnNpb24gMC45IiBtaWdodCBub3QgYmUgcHJvcGVyOyBpdCBkZW5vdGVz
IHRoZSBjdXJyZW50CnRlbXBvcmFyeSBzdGF0ZSwgbm90IHRoZSBnb2FsIG9mIHRoZSBwYXRjaC4K
Cj4gKwo+ICAgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pBTFJTQ2A6IFRoZSBaYWxy
c2MgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcwo+ICAgICAgICAgZGVmaW5lZCBpbiB0aGUgaW4g
dGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IGU4NzQxMmU2MjFmMQo+
ICAgICAgICAgKCJpbnRlZ3JhdGUgWmFhbW8gYW5kIFphbHJzYyB0ZXh0ICgjMTMwNCkiKS4KPiBA
QCAtMzYwLDQgKzM2Myw0IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPgo+ICAg
ICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9WRU5ET1JfRVhUX1hTRlZGV01BQ0NRUVFgOiBU
aGUgWHNmdmZ3bWFjY3FxcQo+ICAgICAgICAgIHZlbmRvciBleHRlbnNpb24gaXMgc3VwcG9ydGVk
IGluIHZlcnNpb24gMS4wIG9mIE1hdHJpeCBNdWx0aXBseSBBY2N1bXVsYXRlCj4gLSAgICAgICBJ
bnN0cnVjdGlvbiBFeHRlbnNpb25zIFNwZWNpZmljYXRpb24uCj4gXCBObyBuZXdsaW5lIGF0IGVu
ZCBvZiBmaWxlCj4gKyAgICAgICBJbnN0cnVjdGlvbiBFeHRlbnNpb25zIFNwZWNpZmljYXRpb24u
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gaW5kZXggYWFmNmFkOTcwNDk5
My4uZDNhNjVmOGZmN2RhNCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUu
aAo+IEBAIC04Miw2ICs4Miw3IEBAIHN0cnVjdCByaXNjdl9od3Byb2JlIHsKPiAgI2RlZmluZSAg
ICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0VYVF9aQUFNTyAgICAgICAgICgxVUxMIDw8IDU2
KQo+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfRVhUX1pBTFJTQyAgICAg
ICAgKDFVTEwgPDwgNTcpCj4gICNkZWZpbmUgICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9F
WFRfWkFCSEEgICAgICAgICAoMVVMTCA8PCA1OCkKPiArI2RlZmluZSAgICAgICAgICAgICAgICBS
SVNDVl9IV1BST0JFX0VYVF9aQUxBU1IgICAgICAgICgxVUxMIDw8IDU5KQo+ICAjZGVmaW5lIFJJ
U0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMCAgICA1Cj4gICNkZWZpbmUgICAgICAgICAgICAgICAg
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04gICAgICAgICgwIDw8IDApCj4gICNkZWZp
bmUgICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEICAgICAg
ICgxIDw8IDApCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gaW5kZXggMGIxNzBlMThhMmJlYi4u
MDUyOWU2OTJiMTE3MyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9i
ZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+IEBAIC05OSw2ICs5
OSw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUg
KnBhaXIsCj4gICAgICAgICAgICAgICAgIEVYVF9LRVkoWkFBTU8pOwo+ICAgICAgICAgICAgICAg
ICBFWFRfS0VZKFpBQkhBKTsKPiAgICAgICAgICAgICAgICAgRVhUX0tFWShaQUNBUyk7Cj4gKyAg
ICAgICAgICAgICAgIEVYVF9LRVkoWkFMQVNSKTsKPiAgICAgICAgICAgICAgICAgRVhUX0tFWSha
QUxSU0MpOwo+ICAgICAgICAgICAgICAgICBFWFRfS0VZKFpBV1JTKTsKPiAgICAgICAgICAgICAg
ICAgRVhUX0tFWShaQkEpOwo+IC0tCj4gMi4yMC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
