Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D46C7EE2A
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4X9FyyjiHO/vBbRI9ZfitUOTJ4fftIqkrrPQgkLU4s8=; b=P4SnmKEbbDirMN
	VeqKcQZzVW9Op5s3DCm4e88K9hrTkll0v+iqgmb32ywIbdF7XDGz9srWJJhp2Uxeuy/kYo5KoBSHU
	o6YCfSbvVqgaB3NnmB+SwtDJ81KMHFy7Ro2TSpC7HIAoFOdAIfY1aNg9tZ2kwN/cb9WUvBfwlWfRX
	yGs6+HwtUEYRUc/8Wg2mDnsmy0BtYkcPfbxGzIAaA5wgLWHm+w3A79AH9zHpDYjpmuLV78ngUVOHb
	NfzBrzDY9YVLakF+lpbqu69RujL35bl9HkbRQsa0L6kWqb9s2/1Y6hw0BYIEPZybqUjQnxjYzyyj3
	vp/hvetQOZFk7ijqO+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxeo-00000004p2d-450s;
	Tue, 24 Jun 2025 07:01:26 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxUA-00000004nka-0NAO
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 06:50:27 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so10702078a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 23:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750747824; x=1751352624; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu8eC7tjLOcqYS30DQpzKeHXmMgccPLWCEIpeUViNbA=;
        b=sJEpuIobOCaVRXwS6NzHAQ3Pw1dtFi3peqIsxIwPB+2f0UDEdLHydXFjXjdDiiRTOa
         R066x2qlC6aFbfjja4RXgsVPu4zDnAqC5lQRzwk1Rw4ejLICc+JFFlj/9AaxiktPkRd7
         1POf+mOBbajsZ3UG40KuxvR/mNxJLVVjqydBlCatW7UQl5VEeQkKFP5TOxeNlcT5tBjl
         2Cd1EvzoNzvfF0QdDQthxhpCR8okoen6FQv7vpX7bMOSlQQCtPwfK2tnRHHvKqAbrGpR
         Sf+uTBdfOdN9nycn+Q3X1MKe9szb9pZ8Uzc5miBpy04eBX/caK1MR862H/k3d9chcU3h
         ReZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750747824; x=1751352624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zu8eC7tjLOcqYS30DQpzKeHXmMgccPLWCEIpeUViNbA=;
        b=CKzta9gvSvelmp3GNXsILs0r8oyAlA31lSMCybQan7dPxuI0uEZzh3An/i18QUCN5q
         C4nDbXRaTtznaZ6LxbyEFTOjcdWjs3sEBKjRZ7Cj7Za10mK38uObbOpl7pFv62nvrEcT
         /3/7hP1Yz9NCWHp6X4jqGneuFT8/s4wyNyD5xX/S6zYdgIqw5nxjK0uRA9bmiQNZdOql
         CmCWnlhubyCzrG7/r+QDlpnSLRdyUv/jsw0T2kZcty1klBNamlnDtwk064P77fDzOJyg
         FpCedJSHJBJt7u+RGxgwGYySGhTuiZq0wDEqf1O4SWkxO9NF/+EatQSntXn/KHxL92Ea
         OIuw==
X-Forwarded-Encrypted: i=1; AJvYcCU3hXSXK9tM8+7wP4+HM0Ypy4byLRDzdn1MbJnE8aIVmb67Kp6ASItMiqbGy3v0PIRH/8YbMFtWF4P8Hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZssfutdJdL3BEuyrnanAsg595HBImZmIts3e724U4ZKE0XBH3
	G8r9r9mLyUpw88n5wCCp9brCx85udlNKDCvaNRLOFxF7kwz2IyYBgNmsOlR8JVUvxIvZpHp3vdB
	sRvnRmD4DMCR/2QBPw7mWCcYTza+lgQhaD5grXlWWwA==
X-Gm-Gg: ASbGncsXKv/+Or4MdnsesOYxg/lYwNjjrMP88wwWVkIHmE/AmYPGSU+GiV6w/R1h8Un
	iIeLuuPU8dKdoDwcrLEW/DgE9Ql5h+e+LMYQfbcDI3CTv2GDPBVA4OSDiKd+pzAwAdIvZU5t95C
	O7BIKBcKlOzsKUellW/JFbrC3qtxkJNt/BAtZYlLOdwfieHSPa1+aaocAxPTwmnO92l/DAjxeID
	eTc
X-Google-Smtp-Source: AGHT+IGzRwLebB44X+HpPW+RsQT3tGB+3zulPTXxDb2tIjKNXgf9UqaYU57NIhPu4xxRfC+d82ZL8fIlQYadz0IPFTA=
X-Received: by 2002:a17:907:7ea1:b0:ad8:9a86:cf52 with SMTP id
 a640c23a62f3a-ae057ce92d9mr1342939866b.11.1750747824453; Mon, 23 Jun 2025
 23:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
 <aFoLb21xklpZoOzk@cyan-mbp>
In-Reply-To: <aFoLb21xklpZoOzk@cyan-mbp>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jun 2025 08:50:13 +0200
X-Gm-Features: Ac12FXyqq4o4L1eGDeUyDUphsBPDf_zSUfSKSQdlxXal54sQQd1XJxJPsnm5y_I
Message-ID: <CAHVXubhsSreoLUbjKZMRwH4EHHaHQYfQmU2r0D4Cey8m8R8sPQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix sparse warning in vendor_extensions/sifive.c
To: Cyan Yang <cyan.yang@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_235026_388390_FB3A9784 
X-CRM114-Status: GOOD (  22.43  )
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

SGkgQ3lhbiwKCk9uIFR1ZSwgSnVuIDI0LCAyMDI1IGF0IDQ6MjDigK9BTSBDeWFuIFlhbmcgPGN5
YW4ueWFuZ0BzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFsZXhhbmRyZSwKPgo+IFNvcnJ5IHRo
YXQgSSBtaXNzZWQgdGhpcyBwYXRjaC4KPgo+IEkgYmVsaWV2ZSB0aGVyZSBpcyBhbHJlYWR5IHRo
ZSB2MiB2ZXJzaW9uIHRvIGZpeCB0aGlzIHdhcm5pbmcgYXQKPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjUwNTE2MDMwMzEwLjE2OTUwLTEtY3lhbi55YW5nQHNpZml2ZS5jb20vCgpZ
ZXMgYnV0IHYxIGdvdCBtZXJnZWQgaW5zdGVhZCwgaGVuY2UgdGhlIHNlcGFyYXRlIGZpeC4KClRo
YW5rcywKCkFsZXgKCj4KPiBSZWdhcmRzLAo+IEN5YW4KPgo+IE9uIEZyaSwgSnVuIDIwLCAyMDI1
IGF0IDEyOjA4OjExUE0gKzAwMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IHNwYXJzZSBy
ZXBvcnRzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPiA+Cj4gPiBhcmNoL3Jpc2N2L2tlcm5lbC92
ZW5kb3JfZXh0ZW5zaW9ucy9zaWZpdmUuYzoxMTozMzogc3BhcnNlOiBzcGFyc2U6IHN5bWJvbCAn
cmlzY3ZfaXNhX3ZlbmRvcl9leHRfc2lmaXZlJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQg
YmUgc3RhdGljPwo+ID4KPiA+IFNvIGFzIHRoaXMgc3RydWN0IGlzIG9ubHkgdXNlZCBpbiB0aGlz
IGZpbGUsIG1ha2UgaXQgc3RhdGljLgo+ID4KPiA+IEZpeGVzOiAyZDE0N2Q3N2FlNmUgKCJyaXNj
djogQWRkIFNpRml2ZSB4c2Z2cW1hY2Nkb2QgYW5kIHhzZnZxbWFjY3FvcSB2ZW5kb3IgZXh0ZW5z
aW9ucyIpCj4gPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
Cj4gPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNTA1
MDcyMTAwLlRabEVwOGgxLWxrcEBpbnRlbC5jb20vCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy9zaWZpdmUuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvdmVuZG9yX2V4dGVuc2lvbnMvc2lmaXZlLmMgYi9hcmNoL3Jpc2N2
L2tlcm5lbC92ZW5kb3JfZXh0ZW5zaW9ucy9zaWZpdmUuYwo+ID4gaW5kZXggMTQxMTMzN2RjMWU2
MWFiYTBiODQ0OTAyZjM1NjYyNTA0OGM4NWFiYy4uOGZjZjY3ZThjMDdmYWNkMWJmZGJjMGUxOGRk
OWI0MzEwMmYyMjE0NSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRvcl9l
eHRlbnNpb25zL3NpZml2ZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZW5kb3JfZXh0
ZW5zaW9ucy9zaWZpdmUuYwo+ID4gQEAgLTgsNyArOCw3IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+Cj4gPgo+ID4gIC8qIEFsbCBTaUZpdmUgdmVuZG9yIGV4dGVuc2lvbnMgc3VwcG9y
dGVkIGluIExpbnV4ICovCj4gPiAtY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNj
dl9pc2FfdmVuZG9yX2V4dF9zaWZpdmVbXSA9IHsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJp
c2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2FfdmVuZG9yX2V4dF9zaWZpdmVbXSA9IHsKPiA+ICAg
ICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHhzZnZmbnJjbGlweGZxZiwgUklTQ1ZfSVNBX1ZFTkRP
Ul9FWFRfWFNGVkZOUkNMSVBYRlFGKSwKPiA+ICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHhz
ZnZmd21hY2NxcXEsIFJJU0NWX0lTQV9WRU5ET1JfRVhUX1hTRlZGV01BQ0NRUVEpLAo+ID4gICAg
ICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoeHNmdnFtYWNjZG9kLCBSSVNDVl9JU0FfVkVORE9SX0VY
VF9YU0ZWUU1BQ0NET0QpLAo+ID4KPiA+IC0tLQo+ID4gYmFzZS1jb21taXQ6IGUxMGEwZGMyZDIx
ZmQ3NDJjOGQ2YmEwNDJhOThjMDU4MTUwMTFmOWQKPiA+IGNoYW5nZS1pZDogMjAyNTA2MjAtZGV2
LWFsZXgtZml4X3NwYXJzZV9zaWZpdmVfdjEtNGUxMzBlN2UyODMzCj4gPgo+ID4gQmVzdCByZWdh
cmRzLAo+ID4gLS0KPiA+IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
PiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
