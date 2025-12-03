Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9060D1BDC2
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJf+SIqk/HiL5bpYAVxQ8U2WpM5n7zr/Ehqlm3GaKQU=; b=xc0/1l/dBmrSRW
	51ryrzdtwm0qkAR8oCPrZadaJNtXRghw8ZBHI0uptdjMez8Yqmlb0Wl1lmqlO7MjETsh4hm4p/cLA
	AB7bDLmxslrGA2avJ9tFWcBNbJDWHx+LxsvIGe1LBXUyx7zlKTahM9ex7lCnsch8WnZTWTPOCjjHc
	OgTRYyK7Axdj6856LTvCY82wZHmIibRCCi0A0e+MS3wauO6mIkrfaX5mbkz3hLs3T/VGlTlUQcAl3
	NksVDav1K6aLvf4oVz/u3CQk7QQ28HpqfaRN2HLU6AAXLMItzezflw48zfTxH3yc6rmvaSvB92WBy
	qb+aAfCv8KlVc7kRpYYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr6R-00000006tIl-0IJp;
	Wed, 03 Dec 2025 17:57:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr6O-00000006tIC-0aWP
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 17:57:21 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b735e278fa1so6001066b.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 09:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764784638; x=1765389438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I9vBbVnFNZx3QCSTq1xIAOnL+dBiPfyZ1uzxKTwupA=;
        b=gWb62a87KqyEoWUwiKqi4GN2MKvPks9PjWh8mfAF2p6kycOhGDieUfSCxDx5JmxFRv
         /czrEvhv1WsD10UwM+dLAbzT64p4Fwq3Uu47L3w72FqcqytzU5h8i06Ep5TAgvxJX45v
         cH3fwxxs++94GA89KAHrbqGOCAuRSTVKp2SuVEOo5UNGijJHshxdap+BzwapUMqSP6j1
         NVR9z45AoKMnLclsqW4/uwimX5c0lBeKFaC5kQFBqhHLFrU3IktkPg1ra0tChC4e7SSp
         KC/kVQ8Gw0wmH0obmkmntw4hdPFmNtDT2kIcXeFB0r2SJJJvBYDkDWFVxxcxtIUHHKGj
         Y/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784638; x=1765389438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+I9vBbVnFNZx3QCSTq1xIAOnL+dBiPfyZ1uzxKTwupA=;
        b=XRI2WypZwoAp3dGkzJzCcwtXpP4O1J5dsZrU+RFpXiq8rwgwVaTpsIBu/y5gUo4y9J
         mz5qASysI75J0EX3xqOojiOtyJLr9mUaNOmlSoEioYWMqOD0kEM4Atsb6ihzspohnvbt
         V9o4Gtl+ik0xqJ1m79KOpvaKLGlKP1Y15KNmRaCYI04uPMT6+NBqDf3YzLNE3QOKzG+u
         cmY1EWuvIC07/TeL/BdAts2KnpJNQJbdcytgKwwKk3qWfmkvbAS5mscKPnLLXNMLXrP+
         Z/qJXXzGRTI71yMdqFMjzSMQ1zHcGfPb07Efj1a5W3NhaA5r3kk7sMVw71XHgV+AJwM1
         1NvA==
X-Forwarded-Encrypted: i=1; AJvYcCWV+HETze/YgBzSOSo3t52998Lly3dZBhM6HtGB9v2j4hZhEO378lPPGL/bYT0OWRyfVkg51aT0VhTaTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Zt2mvd1wx/7VArNxAohOPUEN0fbnOW0BLHtK9TbIPyMxIx6E
	yEdUeeBP6pw8MBg1O1yZQmi+qca/qT9HQVPUjSU1HL+Gxaf/pKfZQn2w/51zEZ+e5kKTwjYanjm
	ytUjZwt7+oFpODEbiY/ISvLDp9LR5qJ4=
X-Gm-Gg: ASbGncsNJvKloI6hGNPocd113Wgn4IBvPlKPg3p8Fuar79P+m9mFMmZlW+Dxlq65nVg
	xUOozHz9HUgV7f9/d8m/LQO1M5+Qwq2latnNWBSBc/6ftXQLcKQ8sgb3HPxsBLSvD4eJAdka7jT
	XvS+H7NYwUMp30CZd6uA43/tBOzHgnemPm5dVBynk9tdVyE2/ZyMZ0Wy8Ux3HkG+HLxILWPGDRI
	guqrK9F04QQi9cC9uw2fEJ92KmuYeIxpEcyFh8cHPmcbwhWEwu7P3Z7ZyddGYOcfG4z
X-Google-Smtp-Source: AGHT+IGolAUq66Sf1/v3NSKzalmQQj7kPl02udnk7U4Xo9OP2JjIo8pInOmeNbraJNNQ0vDWM/mFH0y3xhNP06Dh6nA=
X-Received: by 2002:a17:907:7b87:b0:b76:74b6:da78 with SMTP id
 a640c23a62f3a-b79ec6743f4mr6955266b.35.1764784637530; Wed, 03 Dec 2025
 09:57:17 -0800 (PST)
MIME-Version: 1.0
References: <20251121193524.1813200-1-geomatsi@gmail.com>
In-Reply-To: <20251121193524.1813200-1-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 3 Dec 2025 11:57:06 -0600
X-Gm-Features: AWmQ_bkrrlk_PDPxAzDGug-3rsg4IwNXffMJGvryJ06Fa4-F8x1hOmGxYgQgfX8
Message-ID: <CAFTtA3NVd8HMomd60i=T_S34TSL18==aYRFhg2AH-PbsM=hggw@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: expose vector register length in bytes
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_095720_228754_EF250865 
X-CRM114-Status: GOOD (  29.26  )
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

SGkgU2VyZ2V5LAoKT24gRnJpLCBOb3YgMjEsIDIwMjUgYXQgMTozN+KAr1BNIFNlcmdleSBNYXR5
dWtldmljaCA8Z2VvbWF0c2lAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSB2ZWN0b3IgcmVnaXN0
ZXIgbGVuZ3RoIGNhbiBiZSBvYnRhaW5lZCBmcm9tIHRoZSByZWFkLW9ubHkgQ1NSIHZsZW5iLgo+
IEhvd2V2ZXIgcmVhZGluZyB0aGlzIENTUiBtYXkgYmUgdW5kZXNpcmFibGUgaW4gc29tZSBjYXNl
cy4gWFRoZWFkVmVjdG9yCj4gZXh0ZW5zaW9uIGlzIG9uZSBleGFtcGxlOiBleGlzdGluZyBpbXBs
ZW1lbnRhdGlvbnMgbWF5IG5vdCBwcm92aWRlIHRoaXMKPiByZWdpc3Rlci4gT24gc3VjaCBwbGF0
Zm9ybXMsIHZsZW5iIGlzIHNwZWNpZmllZCBhcyBkZXZpY2UtdHJlZSBwcm9wZXJ0eS4KCkkgd29u
ZGVyIHdoeSBhIGh3cHJvYmUgZW50cnkgaXMgbmVlZGVkIGV2ZW4gaW4gdGhpcyBjb250ZXh0LiBJ
ZiB2bGVuYgppcyBub3QgYXZhaWxhYmxlLCB3ZSBjYW4gYWx3YXlzIHVzZSBhIHZzZXR2bGkgYW5k
IHJlYWQgdGhlIGRlc3RpbmF0aW9uCnJlZ2lzdGVyIHRvIGluZmVyIHJlZ2lzdGVyIGxlbmd0aC4g
SXNuJ3QgdGhhdCBhbHNvIHRydWUgZm9yIFZlY3RvcgowLjcsIG9yIGFyZSB5b3UgY29uc2lkZXJp
bmcgYW55dGhpbmcgZWxzZT8KCj4gUmVhZGluZyB2bGVuYiBhbHNvIGluaXRpYWxpemVzIHRoZSBh
cHBsaWNhdGlvbuKAmXMgdmVjdG9yIGNvbnRleHQsIGV2ZW4KPiB0aG91Z2ggdGhlIGFwcGxpY2F0
aW9uIG1heSBkZWNpZGUgbm90IHRvIHVzZSB0aGUgdmVjdG9yIGV4dGVuc2lvbiBiYXNlZAo+IG9u
IHRoZSByZXBvcnRlZCBsZW5ndGguCj4KPiBNZWFud2hpbGUgdGhlIGtlcm5lbCBhbHJlYWR5IGRl
dGVybWluZXMgdmxlbmIgYXQgYm9vdCwgZWl0aGVyIGZyb20gdGhlCj4gQ1NSIG9yIGZyb20gdGhl
IGRldmljZSB0cmVlLiBTbyBhZGQgUklTQ1ZfSFdQUk9CRV9LRVlfVkVDVE9SX1JFR19MRU5HVEgK
PiB0byBleHBvc2UgdGhlIHZlY3RvciByZWdpc3RlciBsZW5ndGggYWxyZWFkeSBrbm93biB0byB0
aGUga2VybmVsLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IE1hdHl1a2V2aWNoIDxnZW9tYXRz
aUBnbWFpbC5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJz
dCAgfCAzICsrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCAgICAgIHwgMiAr
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCj4gIGFyY2gv
cmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgICAgICAgfCA2ICsrKysrKwo+ICA0IGZpbGVzIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9uL2FyY2gv
cmlzY3YvaHdwcm9iZS5yc3QKPiBpbmRleCAwNmM1MjgwYjcyOGEuLjE0NDM3ZmU3OTI3NiAxMDA2
NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiArKysgYi9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKPiBAQCAtMzc5LDMgKzM3OSw2IEBA
IFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPgo+ICAqIDpjOm1hY3JvOmBSSVNDVl9I
V1BST0JFX0tFWV9aSUNCT1BfQkxPQ0tfU0laRWA6IEFuIHVuc2lnbmVkIGludCB3aGljaAo+ICAg
IHJlcHJlc2VudHMgdGhlIHNpemUgb2YgdGhlIFppY2JvcCBibG9jayBpbiBieXRlcy4KPiArCj4g
KyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1ZFQ1RPUl9SRUdfTEVOR1RIYDogQW4gdW5z
aWduZWQgaW50IHdoaWNoCj4gKyAgcmVwcmVzZW50cyB0aGUgdmVjdG9yIHJlZ2lzdGVycyBsZW5n
dGggaW4gYnl0ZXMuCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9i
ZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPiBpbmRleCA4YzU3MmE0NjQ3
MTkuLmIxMDMxMWM5YTQ0YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
cHJvYmUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gQEAgLTgs
NyArOCw3IEBACj4KPiAgI2luY2x1ZGUgPHVhcGkvYXNtL2h3cHJvYmUuaD4KPgo+IC0jZGVmaW5l
IFJJU0NWX0hXUFJPQkVfTUFYX0tFWSAxNQo+ICsjZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tF
WSAxNgo+Cj4gIHN0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl9od3Byb2JlX2tleV9pc192YWxpZChf
X3M2NCBrZXkpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPiBpbmRl
eCAxZWRlYTIzMzFiOGIuLmJkNmNkOTdjODFmOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaAo+IEBAIC0xMTAsNiArMTEwLDcgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUg
ewo+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX1ZFTkRPUl9FWFRfU0lGSVZFXzAgIDEzCj4g
ICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfVkVORE9SX0VYVF9NSVBTXzAgICAgMTQKPiAgI2Rl
ZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1BfQkxPQ0tfU0laRSAgICAxNQo+ICsjZGVmaW5l
IFJJU0NWX0hXUFJPQkVfS0VZX1ZFQ1RPUl9SRUdfTEVOR1RIICAgIDE2Cj4gIC8qIEluY3JlYXNl
IFJJU0NWX0hXUFJPQkVfTUFYX0tFWSB3aGVuIGFkZGluZyBpdGVtcy4gKi8KPgo+ICAvKiBGbGFn
cyAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+IGluZGV4IDBmNzAxYWNlM2JiOS4uMzAwNzQz
MmZiZGYxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gQEAgLTMyOCw2ICszMjgsMTIg
QEAgc3RhdGljIHZvaWQgaHdwcm9iZV9vbmVfcGFpcihzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFp
ciwKPiAgICAgICAgICAgICAgICAgaHdwcm9iZV9pc2FfdmVuZG9yX2V4dF9taXBzXzAocGFpciwg
Y3B1cyk7Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+Cj4gKyAgICAgICBjYXNlIFJJU0NWX0hX
UFJPQkVfS0VZX1ZFQ1RPUl9SRUdfTEVOR1RIOgo+ICsgICAgICAgICAgICAgICBwYWlyLT52YWx1
ZSA9IDA7Cj4gKyAgICAgICAgICAgICAgIGlmIChoYXNfdmVjdG9yKCkgfHwgaGFzX3h0aGVhZHZl
Y3RvcigpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHBhaXItPnZhbHVlID0gcmlzY3Zfdl92
c2l6ZSAvIDMyOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArCj4gICAgICAgICAvKgo+ICAg
ICAgICAgICogRm9yIGZvcndhcmQgY29tcGF0aWJpbGl0eSwgdW5rbm93biBrZXlzIGRvbid0IGZh
aWwgdGhlIHdob2xlCj4gICAgICAgICAgKiBjYWxsLCBidXQgZ2V0IHRoZWlyIGVsZW1lbnQga2V5
IHNldCB0byAtMSBhbmQgdmFsdWUgc2V0IHRvIDAKPiAtLQo+IDIuNTEuMgo+Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpUaGFua3MsCkFu
ZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
