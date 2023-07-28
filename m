Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E7EC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 08:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cojU2V2UOVHAyJalmby6l3eERXpVDL2LJLwY0PPIMCQ=; b=1Qnt3mRLRCjeV3
	1sjtXiHo2MsVO5ShYxAfjKDbUlTuaxarPckOMbddvyLZGDUo87LRQkp3sgCi6W0RZsWUtHMZuhw/f
	Qidr6J6/PB85Snwvq5Oeb8hgcppIBvr7Dm8gWwQJoFT+aIMy4vGhHBVUaQqGdHisLzMm9hXQ+QmRh
	j7fgpzbgW1ynppcSGoN2uz6Ai0MVEN5fRy4KBCHACu+JMhDG1DYYAVzb1tDwPFQbyhNcGvTlN/AAY
	UTo15DdgIIVvJZWCcvFSX3YEYNZ2kvxoOQ9W+osTHN1p/S+cE6HFgb3ELbntCSpqOkKOpQW/Xnpja
	dzakNl4kGOrkBrGuOlwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ9l-002Swl-2d;
	Fri, 28 Jul 2023 08:49:05 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJ9S-002SpL-3C
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 08:48:48 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-783698a37beso81612539f.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690534125; x=1691138925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csmJdueaYe4TxgWwO4Wd3yP+V9n21yRw5VpjM04yUXk=;
        b=RSbd4bgtPKsBA7QPaqslsLfDXZQp7b0oZq583XdLJwq7lSsPdeIZb1cxbg0DGloDE9
         VsHcP9tBikfjBh4FpGmlRYfzFp5yVqRe44c9paaBymQlknt/E17G5ARugj7Nyxc7EyFV
         Ggx7jy2GgYBlEovY8W6DODcptO6xd5WW5nYJ9ISllAFYghikABqvSJxFFBiIeIvtP/Jn
         KVr08i8v0G2ItveaI8wIZJY91zv6rkuSJVpB/sX2PKHCye7w1O2Vm+Rl7UqyY3eCNDd/
         ANHsYz3UPPuCecHDgqYZnYoWcMHNBWR3MT6M6U3xnQrhMsY5dePHp4FlzQdXJODhoVXK
         Jkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690534125; x=1691138925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csmJdueaYe4TxgWwO4Wd3yP+V9n21yRw5VpjM04yUXk=;
        b=GNHlpW8AMrivi524lf0mvaTh73O0RPdY9ZVWqfX+LumNHLjTwwRF2Vw1MZP2ANuLJl
         DYpZJayHdxyxBO0+oToQj23gl/ZtSDLrlNPwEJHpWXg8jQGhLi8rePmIcXieFOcvmIWz
         bnr1tru3oZsomjTJVQUNLHesCKmU3cVnwVaQjaoQLtDOaTpOS6801Lus5I5SN6qCCM7d
         0FhypUyOBAGyCUhDD59lDLSqxiBGGx/UxQsrtISv2DNEXqWxpdXhc+kDEwVHXnw3CBIb
         NWLVvxe5wkHdNoHQOozlgOsABa36t2Vul+Im9N3wVDgfDfuYQkQaXXlG92NMrfjqbUqX
         OBew==
X-Gm-Message-State: ABy/qLYoQK9l2r2EyMqEGtqmPwp4ByXf3JYpCu5q73H9fSlqUpL05J0M
	xAsXvuqttg6llZYgkf5IkqMiPygEFEaW4FJatOLjww==
X-Google-Smtp-Source: APBJJlHXzbuDXRfZ01YQCScE+IuEs9Tr6or3RH84HjbXeEzCJBbzJyNhFuapVEmPS3Ihqc7dQPiElvgnG37NjgZYaT4=
X-Received: by 2002:a5e:990d:0:b0:785:ff35:f340 with SMTP id
 t13-20020a5e990d000000b00785ff35f340mr2426775ioj.14.1690534124749; Fri, 28
 Jul 2023 01:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <5b8fd18e-8dfa-96bf-cdd4-4498b1d15ab9@ics.forth.gr> <CAH2o1u7uAuXsD6+6Dvam4kzQuUj8s98G0sR26_-q31wvSUYZNA@mail.gmail.com>
 <CANXhq0rz1J+0t9M-e5NY015HhDT1Yy024_-Uan9CSJ4rMqtyng@mail.gmail.com> <CAH2o1u6TaQ2PLcKRuSpcqh4Q5qUriimSZ1hmmy=37R2378NCUA@mail.gmail.com>
In-Reply-To: <CAH2o1u6TaQ2PLcKRuSpcqh4Q5qUriimSZ1hmmy=37R2378NCUA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 28 Jul 2023 16:48:32 +0800
Message-ID: <CANXhq0o40cFhVzk=eMuEXrjccSjTuTtdyu5L23bFDpzH5iPdkQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Anup Patel <apatel@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, 
	Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_014847_030531_924B9E36 
X-CRM114-Status: GOOD (  32.86  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMToxOeKAr1BNIFRvbWFzeiBKZXpuYWNoIDx0amV6bmFj
aEByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgMTE6NDfi
gK9BTSBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwg
SnVsIDIxLCAyMDIzIGF0IDI6MDDigK9BTSBUb21hc3ogSmV6bmFjaCA8dGplem5hY2hAcml2b3Np
bmMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBKdWwgMTksIDIwMjMgYXQgODoxMuKA
r1BNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gSGVsbG8gVG9tYXN6LAo+ID4gPiA+Cj4gPiA+ID4gT24gNy8xOS8yMyAyMjozMywgVG9t
YXN6IEplem5hY2ggd3JvdGU6Cj4gPiA+ID4gPiBFbmFibGVzIG1lc3NhZ2Ugb3Igd2lyZSBzaWdu
YWwgaW50ZXJydXB0cyBmb3IgUENJZSBhbmQgcGxhdGZvcm1zIGRldmljZXMuCj4gPiA+ID4gPgo+
ID4gPiA+Cj4gPiA+ID4gVGhlIGRlc2NyaXB0aW9uIGRvZXNuJ3QgbWF0Y2ggdGhlIHN1YmplY3Qg
bm9yIHRoZSBwYXRjaCBjb250ZW50ICh3ZQo+ID4gPiA+IGRvbid0IGp1cyBlbmFibGUgaW50ZXJy
dXB0cywgd2UgYWxzbyBpbml0IHRoZSBxdWV1ZXMpLgo+ID4gPiA+Cj4gPiA+ID4gPiArICAgICAv
KiBQYXJzZSBRdWV1ZSBsZW5ndHMgKi8KPiA+ID4gPiA+ICsgICAgIHJldCA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLCAiY21kcV9sZW4iLCAmaW9tbXUtPmNtZHFfbGVu
KTsKPiA+ID4gPiA+ICsgICAgIGlmICghcmV0KQo+ID4gPiA+ID4gKyAgICAgICAgICAgICBkZXZf
aW5mbyhkZXYsICJjb21tYW5kIHF1ZXVlIGxlbmd0aCBzZXQgdG8gJWlcbiIsIGlvbW11LT5jbWRx
X2xlbik7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFk
X3UzMihwZGV2LT5kZXYub2Zfbm9kZSwgImZsdHFfbGVuIiwgJmlvbW11LT5mbHRxX2xlbik7Cj4g
PiA+ID4gPiArICAgICBpZiAoIXJldCkKPiA+ID4gPiA+ICsgICAgICAgICAgICAgZGV2X2luZm8o
ZGV2LCAiZmF1bHQvZXZlbnQgcXVldWUgbGVuZ3RoIHNldCB0byAlaVxuIiwgaW9tbXUtPmZsdHFf
bGVuKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRf
dTMyKHBkZXYtPmRldi5vZl9ub2RlLCAicHJpcV9sZW4iLCAmaW9tbXUtPnByaXFfbGVuKTsKPiA+
ID4gPiA+ICsgICAgIGlmICghcmV0KQo+ID4gPiA+ID4gKyAgICAgICAgICAgICBkZXZfaW5mbyhk
ZXYsICJwYWdlIHJlcXVlc3QgcXVldWUgbGVuZ3RoIHNldCB0byAlaVxuIiwgaW9tbXUtPnByaXFf
bGVuKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICAgICAgIGRtYV9zZXRfbWFza19hbmRfY29oZXJl
bnQoJnBkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDY0KSk7Cj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+
ID4gV2UgbmVlZCB0byBhZGQgdGhvc2UgdG8gdGhlIGRldmljZSB0cmVlIGJpbmRpbmcgZG9jIChv
ciB0aHJvdyB0aGVtIGF3YXksCj4gPiA+ID4gSSB0aG91Z2h0IGl0IHdvdWxkIGJlIGJldHRlciB0
byBoYXZlIHRoZW0gYXMgcGFydCBvZiB0aGUgZGV2aWNlCj4gPiA+ID4gZGVzY2lwdGlvbiB0aGFu
IGEgbW9kdWxlIHBhcmFtZXRlcikuCj4gPiA+ID4KPiA+ID4KPiA+ID4gV2UgY2FuIGFkZCB0aGVt
IGFzIGFuIG9wdGlvbmFsIGZpZWxkcyB0byBEVC4KPiA+ID4gQWx0ZXJuYXRpdmVseSwgSSd2ZSBi
ZWVuIGxvb2tpbmcgaW50byBhbiBvcHRpb24gdG8gYXV0by1zY2FsZSBDUS9QUQo+ID4gPiBiYXNl
ZCBvbiBudW1iZXIgb2YgYXR0YWNoZWQgZGV2aWNlcywgYnV0IHRoaXMgZ2V0cyB0cmlja2llciBm
b3IKPiA+ID4gaG90LXBsdWdnYWJsZSBzeXN0ZW1zLiBJJ3ZlIGFkZGVkIG1vZHVsZSBwYXJhbWV0
ZXJzIGFzIGEgYmFyZS1taW5pbXVtLAo+ID4gPiBidXQgc3RpbGwgbG9va2luZyBmb3IgYmV0dGVy
IHNvbHV0aW9ucy4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCBy
aXNjdl9pb21tdV9wcmlxX2lycV9jaGVjayhpbnQgaXJxLCB2b2lkICpkYXRhKTsKPiA+ID4gPiA+
ICtzdGF0aWMgaXJxcmV0dXJuX3QgcmlzY3ZfaW9tbXVfcHJpcV9wcm9jZXNzKGludCBpcnEsIHZv
aWQgKmRhdGEpOwo+ID4gPiA+ID4gKwo+ID4gPiA+Cj4gPiA+ID4gPiArICAgICBjYXNlIFJJU0NW
X0lPTU1VX1BBR0VfUkVRVUVTVF9RVUVVRToKPiA+ID4gPiA+ICsgICAgICAgICAgICAgcSA9ICZp
b21tdS0+cHJpcTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgcS0+bGVuID0gc2l6ZW9mKHN0cnVj
dCByaXNjdl9pb21tdV9wcV9yZWNvcmQpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICBjb3VudCA9
IGlvbW11LT5wcmlxX2xlbjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgaXJxID0gaW9tbXUtPmly
cV9wcmlxOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICBpcnFfY2hlY2sgPSByaXNjdl9pb21tdV9w
cmlxX2lycV9jaGVjazsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgaXJxX3Byb2Nlc3MgPSByaXNj
dl9pb21tdV9wcmlxX3Byb2Nlc3M7Cj4gPiA+ID4gPiArICAgICAgICAgICAgIHEtPnFiciA9IFJJ
U0NWX0lPTU1VX1JFR19QUUI7Cj4gPiA+ID4gPiArICAgICAgICAgICAgIHEtPnFjciA9IFJJU0NW
X0lPTU1VX1JFR19QUUNTUjsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgbmFtZSA9ICJwcmlxIjsK
PiA+ID4gPiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEl0
IG1ha2VzIG1vcmUgc2Vuc2UgdG8gYWRkIHRoZSBjb2RlIGZvciB0aGUgcGFnZSByZXF1ZXN0IHF1
ZXVlIGluIHRoZQo+ID4gPiA+IHBhdGNoIHRoYXQgYWRkcyBBVFMvUFJJIHN1cHBvcnQgSU1ITy4g
VGhpcyBjb21tZW50IGFsc28gYXBwbGllcyB0byBpdHMKPiA+ID4gPiBpbnRlcnJ1cHQgaGFuZGxl
cnMgYmVsb3cuCj4gPiA+ID4KPiA+ID4KPiA+ID4gYWNrLiB3aWxsIGRvLgo+ID4gPgo+ID4gPiA+
Cj4gPiA+ID4gPiArc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X2lvbW11X2NtZF9pbnZhbF9zZXRf
YWRkcihzdHJ1Y3QgcmlzY3ZfaW9tbXVfY29tbWFuZCAqY21kLAo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTY0IGFkZHIpCj4gPiA+ID4g
PiArewo+ID4gPiA+ID4gKyAgICAgY21kLT5kd29yZDAgfD0gUklTQ1ZfSU9NTVVfQ01EX0lPVElO
VkFMX0FWOwo+ID4gPiA+ID4gKyAgICAgY21kLT5kd29yZDEgPSBhZGRyOwo+ID4gPiA+ID4gK30K
PiA+ID4gPiA+ICsKPiA+ID4gPgo+ID4gPiA+IFRoaXMgbmVlZHMgdG8gYmUgKGFkZHIgPj4gMikg
dG8gbWF0Y2ggdGhlIHNwZWMsIHNhbWUgYXMgaW4gdGhlIGlvZmVuY2UKPiA+ID4gPiBjb21tYW5k
Lgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IG9vcHMuIFRoYW5rcyEKPiA+ID4KPiA+Cj4gPiBJIHRoaW5r
IGl0IHNob3VsZCBiZSAoYWRkciA+PiAxMikgYWNjb3JkaW5nIHRvIHRoZSBzcGVjLgo+ID4KPgo+
IE15IHJlYWRpbmcgb2YgdGhlIHNwZWMgJzMuMS4xLiBJT01NVSBQYWdlLVRhYmxlIGNhY2hlIGlu
dmFsaWRhdGlvbiBjb21tYW5kcycKPiBpcyB0aGF0IGl0IGlzIGEgNGsgcGFnZSBhbGlnbmVkIGFk
ZHJlc3MgcGFja2VkIGF0IGR3b3JkMVs2MToxMF0sIHNvCj4gZWZmZWN0aXZlbHkgc2hpZnRlZCBi
eSAyIGJpdHMuCgpUaGFua3MgZm9yIHlvdXIgY2xhcmlmeWluZy4gSnVzdCBhbiBvcGluaW9uLCBw
ZXJoYXBzIHlvdSBjYW4gdXNlCidGSUVMRF9QUkVQKCknIG9uIGl0IGFzIHdlbGwsIGl0IG1pZ2h0
IGJlIGNsZWFyZXIuCgo+Cj4gcmVnYXJkcywKPiAtIFRvbWFzego+Cj4gPiA+ID4gUmVnYXJkcywK
PiA+ID4gPiBOaWNrCj4gPiA+ID4KPiA+ID4KPiA+ID4gcmVnYXJkcywKPiA+ID4gLSBUb21hc3oK
PiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiA+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
