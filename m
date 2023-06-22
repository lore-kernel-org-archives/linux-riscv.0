Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE316EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 21:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ISqWpZKwDh9gGjWQpaOG6Jxv7ntA9txaUohM6uPEkP0=; b=1v4QQtPcTKdbuAZCsawUV9QQ4b
	W7dZqwAVREtFMDknU8DOsQM9+toWmhRV7nvCFIu7+PMT7Ej6xQgnEgzZb617c7b8uahUCPTUWU9xr
	xbuwBnIWK4MPr6PLIib9XxhEPSToC+zQnXWww5ZkgaHEvaiZTD5fzdBwnsVUOpW9iq6bvu5MgRDIq
	Z2nxSPfAjUyVG3IpYEwWOnrwaDBFWw+Czow00FE7OVnTCqv6+oVnwILqfwsaNGy2+m6AeIiI/Mucz
	nJKkvaoIOhwvL7J5KHdrT1Sr0d+tEXM16aCXxRkqjcojs2Hy18TrUspnkHDer/4rXHMfqEgwhHeng
	ED869BWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCS49-001sr6-2O;
	Thu, 22 Jun 2023 21:42:09 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCS46-001sqC-1L
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 21:42:08 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-54fac3b7725so19418a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 14:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687470125; x=1690062125;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jceW0LefNLIMcdHkXOkHyrZ6hyhvAWI/rnJOWQTlRkU=;
        b=ir6ofxvHhRbxfpKb5tlLnQm2vqASmGbQrhU2aaNbUwdUqiHClocflNrOjfMKmUCDmc
         HY8ZWaV3y3lsUyonNzjpzPQNTOqx1/xpDI79l6COM49RMMPzygpLFxNjuIGX6KFzJlYl
         fMy+IqSex0XilMVkDQAT2P42JJmfFjprfJxcNZiop47QajWyVyGorI/at1DL1KLtm3tZ
         RYZgS4Agbb02afaoTEHcoeOrvqQ7bQkdR9ivL0PZ66d6ZXN/HC49IJMpu2ycyath9ECc
         g5plpTU/pfW7o1cTdufSQMMbiHSyWOyZlGtoA3Y0WWt80oh9rwggm0zw5NLUMVqRDnUB
         PQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687470125; x=1690062125;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jceW0LefNLIMcdHkXOkHyrZ6hyhvAWI/rnJOWQTlRkU=;
        b=L7lqh43cr2+l1LPZT10G585RGEin89VkfPSwGu/Bn60kAjVUf/xgSyzmawiLZblRAD
         WNlyIYvVQ+Hb/OtxfzKd/dkfSEK8vHGnXcY5VfXz+zPvPc2DN0XXfGvGAU1hiXQcBfY1
         VqGAYA1iAPTIcwQK2Yzhe7xa8BOXBInrzD7F8ojiJN5QreJmjwn4ouVnUfzOiQj6PDUN
         Q7iTtpNlPG/BnYWdeWEqaJPzA5PENvS/qrgGF1mOEX1dIMP2YstRX702Yofqn+CE/xSN
         hrNd4T8n82mr86IgGOCPui8mzm61MbVjm0NR/QAXWpU967jzG1DdVNx2kxxGTRrqI3lA
         59NQ==
X-Gm-Message-State: AC+VfDwoZD6Bkx6U/72osz9QJOqYBx4K0I70SNohrV4GeFZPWLmBt4Ep
	cD1onP/3h/42sasdE6WLu87rNA==
X-Google-Smtp-Source: ACHHUZ4pOcAQElXv15ZXkTtOi9qORFEI0aktifpMt2TmQ2FdKT4p3ACtlIIRsH02h3ehHwsN8DtdSg==
X-Received: by 2002:a05:6a00:174d:b0:64c:c5f9:1533 with SMTP id j13-20020a056a00174d00b0064cc5f91533mr16483486pfc.33.1687470124730;
        Thu, 22 Jun 2023 14:42:04 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id m2-20020aa79002000000b0064d1d8fd24asm4944130pfo.60.2023.06.22.14.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 14:42:04 -0700 (PDT)
Date: Thu, 22 Jun 2023 14:42:04 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 14:41:24 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <CAKwvOd=bHe07O=eBimOg5G-XxXgs6=h5OXzkfS+ayfuAHGOUew@mail.gmail.com>
CC: nathan@kernel.org, bjorn@kernel.org, Conor Dooley <conor@kernel.org>,
  jszhang@kernel.org, llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com
Message-ID: <mhng-3f62072d-7b42-4fa0-9076-3899054749cc@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_144206_680689_4FF236C5 
X-CRM114-Status: GOOD (  23.15  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMiBKdW4gMjAyMyAxNDo0MDo1OSBQRFQgKC0wNzAwKSwgbmRlc2F1bG5pZXJzQGdv
b2dsZS5jb20gd3JvdGU6Cj4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMTI6NDbigK9QTSBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPj4KPj4gT24gV2VkLCAyMSBK
dW4gMjAyMyAxMToxOTozMSBQRFQgKC0wNzAwKSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+ID4g
T24gV2VkLCAyMSBKdW4gMjAyMyAxMDo1MToxNSBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPj4gPj4gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cj4+
ID4+Cj4+ID4+IFsuLi5dCj4+ID4+Cj4+ID4+Pj4gU28gSSdtIG5vIGxvbmdlciBhY3R1YWxseSBz
dXJlIHRoZXJlJ3MgYSBoYW5nLCBqdXN0IHNvbWV0aGluZyBzbG93Lgo+PiA+Pj4+IFRoYXQncyBl
dmVuIG1vcmUgb2YgYSBncmV5IGFyZWEsIGJ1dCBJIHRoaW5rIGl0J3Mgc2FuZSB0byBjYWxsIGEg
MS1ob3VyCj4+ID4+Pj4gbGluayB0aW1lIGEgcmVncmVzc2lvbiAtLSB1bmxlc3MgaXQncyBleHBl
Y3RlZCB0aGF0IHRoaXMgaXMganVzdCB2ZXJ5Cj4+ID4+Pj4gc2xvdyB0byBsaW5rPwo+PiA+Pj4K
Pj4gPj4+IEkgZHVubm8sIGlmIGl0IHdhcyBvbmx5IGEgdGhpbmcgZm9yIGFsbHllc2NvbmZpZywg
dGhlbiB3aGF0ZXZlciAtIGJ1dAo+PiA+Pj4gaXQncyBnb25uYSBzaWduaWZpY2FudGx5IGluY3Jl
YXNlIGJ1aWxkIHRpbWVzIGZvciBhbnkgbGFyZ2Uga2VybmVscyBpZiBMTEQKPj4gPj4+IGlzIHRo
aXMgbXVjaCBzbG93ZXIgdGhhbiBMRC4gUmVncmVzc2lvbiBpbiBteSBib29rLgo+PiA+Pj4KPj4g
Pj4+IEknbSBnb25uYSBnbyBhbmQgZXhwZXJpbWVudCB3aXRoIG1peGVkIHRvb2xjaGFpbiBidWls
ZHMsIEknbGwgcmVwb3J0Cj4+ID4+PiBiYWNrLi4KPj4gPj4KPj4gPj4gSSB0b29rIHBhbG1lci9m
b3ItbmV4dCAoMWJkMjk2M2IyMTc1ICgiTWVyZ2UgcGF0Y2ggc2VyaWVzICJyaXNjdjogZW5hYmxl
Cj4+ID4+IEhBVkVfTERfREVBRF9DT0RFX0RBVEFfRUxJTUlOQVRJT04iIikpIGZvciBhIHR1eG1h
a2UgYnVpbGQgd2l0aCBsbHZtLTE2Ogo+PiA+Pgo+PiA+PiAgIHwgfi9zcmMvdHV4bWFrZS9ydW4g
LXYgLS13cmFwcGVyIGNjYWNoZSAtLXRhcmdldC1hcmNoIHJpc2N2IFwKPj4gPj4gICB8ICAgICAt
LXRvb2xjaGFpbj1sbHZtLTE2IC0tcnVudGltZSBkb2NrZXIgLS1kaXJlY3RvcnkgLiAtayBcCj4+
ID4+ICAgfCAgICAgYWxseWVzY29uZmlnCj4+ID4+Cj4+ID4+IFRvb2sgZm9yZXZlciwgYnV0IHBh
c3NlZCBhZnRlciAyLjVoLgo+PiA+Cj4+ID4gVGhhbmtzLiAgSSBqdXN0IHJlLXJhbiBtaW5lIDE3
L3RydW5rIExMRCB1bmRlciB0aW1lIChyYXRoZXIgdGhhdCBqdXN0Cj4+ID4gY2hlY2tpbmcgdG9w
IHNvbWV0aW1lcyksIGl0J3MgYXQgMS41aCBidXQgZXZlbiB0aGF0IHNlZW1zIHF1aXRlIGxvbmcu
Cj4+ID4KPj4gPiBJIGd1ZXNzIHRoaXMgaXMgc29ydCBvZiB1cCB0byB0aGUgTExWTSBmb2xrczog
aWYgaXQncyBleHBlY3RlZCB0aGF0IERDRQo+PiA+IHRha2VzIGEgdmVyeSBsb25nIHRpbWUgdG8g
bGluayB0aGVuIEknbSBub3Qgb3Bwb3NlZCB0byBhbGxvd2luZyBpdCwgYnV0Cj4+ID4gaWYgdGhp
cyBpcyBwcm9iYWJseSBhIGJ1ZyBpbiBMTEQgdGhlbiBpdCBzZWVtcyBiZXN0IHRvIHR1cm4gaXQg
b2ZmIHVudGlsCj4+ID4gd2Ugc29ydCB0aGluZ3Mgb3V0IG92ZXIgdGhlcmUuCj4+ID4KPj4gPiBJ
IHRoaW5rIG1heWJlIE5pY2sgb3IgTmF0aGFuIGlzIHRoZSBiZXN0IGJldCB0byBrbm93Pwo+Pgo+
PiBMb29rcyBsaWtlIGl0J3MgYWJvdXQgMmggZm9yIG1lLiAgSSdtIGdvaW5nIHRvIGRyb3AgdGhl
c2UgZnJvbSBteQo+PiBzdGFnaW5nIHRyZWUgaW4gdGhlIGludGVyZXN0IG9mIG1ha2luZyBwcm9n
cmVzcyBvbiBvdGhlciBzdHVmZiwgYnV0IGlmCj4+IHRoaXMgaXMganVzdCBleHBlY3RlZCBiZWhh
dmlvciB0aGVtIEknbSBPSyB0YWtpbmcgdGhlbSAodGhvdWdoIHRoYXQncwo+PiB0b28gbXVjaCBj
b21wdXRlIGZvciBtZSB0byB0ZXN0IHJlZ3VsYXJseSk6Cj4+Cj4+ICQgdGltZSAuLi8uLi8uLi8u
Li9sbHZtL2luc3RhbGwvYmluL2xkLmxsZCAtbWVsZjY0bHJpc2N2IC16IG5vZXhlY3N0YWNrIC1y
IC1vIHZtbGludXgubyAtLXdob2xlLWFyY2hpdmUgdm1saW51eC5hIC0tbm8td2hvbGUtYXJjaGl2
ZSAtLXN0YXJ0LWdyb3VwIC4vZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1Yi9saWIuYSAtLWVu
ZC1ncm91cAo+Pgo+PiByZWFsICAgIDExMW01MC42NzhzCj4+IHVzZXIgICAgMTExbTE4LjczOXMK
Pj4gc3lzICAgICAxbTEzLjE0N3MKPgo+IEFoLCBJIHRoaW5rIHlvdSBtZWFudCBzL2FsbG1vZGNv
bmZpZy9hbGx5ZXNjb25maWcvIGluIHlvdXIgaW5pdGlhbAo+IHJlcG9ydC4gIFRoYXQgbWFrZXMg
bW9yZSBzZW5zZSwgYW5kIEkgY2FuIHJlcHJvZHVjZS4gIExldCBtZSB3b3JrIG9uIGEKPiByZXBv
cnQuCgpBd2Vzb21lLCB0aGFua3MhCgo+Cj4+Cj4+ID4+IENPTkZJR19DQ19WRVJTSU9OX1RFWFQ9
IkRlYmlhbiBjbGFuZyB2ZXJzaW9uIDE2LjAuNiAoKysyMDIzMDYxMDExMzMwNys3Y2JmMWEyNTkx
NTItMX5leHAxfjIwMjMwNjEwMjMzNDAyLjEwNikiCj4+ID4+Cj4+ID4+Cj4+ID4+IEJqw7ZybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
