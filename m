Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61983EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 06:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRh4WyvX8kmIwwfif5wvppW8eOpzXfUpdY7l37BC2Gk=; b=kwwN6DPHG/ZUWA
	m9NYW5Jk9FkjoLiNCJr+sBpFmJ5iuqCnpivAaZxHzVUS6SXa4stlO1sA6ElZ8cL/wpz+PVlwihMfc
	Kyka4q/wfiHGpOWG4P44YTBV7qTbZKVsd3G/Lfq4rtaynOds2QkpgnLve7zIQ77GuGKCyBldGirL5
	hSBM+nVBB059buuEpA+ALDvgSodJTf0SjaOII5E0GwJ+ptPAUOzlNRbq5gpk/Tnu9CLhjFm1L/mlm
	+i8PlEzCO1qwcsZYk6bCrVwIXdAdRp8Y98SLZFVJ1c5vXo0JjXcFo48SgjwiYKuevN3m8cU8ZxlK2
	O8g6RKc5IiBFvWCeq75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKYRL-0080bJ-1y;
	Sat, 15 Jul 2023 06:07:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKYRG-0080ap-2R
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 06:07:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB1BA6098A
	for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 06:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20FC8C433C9
	for <linux-riscv@lists.infradead.org>; Sat, 15 Jul 2023 06:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689401248;
	bh=l3K4BnT2cYoAyNP+v8AxghHuNfrq2Ot5LGuxr8LxXBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RsoiMY8MSY1o17LGPYpVFlrHyJaoA4FrZFiuJHysoIdZWJdFxlx5MtMLtoX084ANi
	 gvsb/eJrtBeIatfkfr4WoyNTi/Vw5EdPHMICKMYIL02eMIhsayM9gnLWWYDpMi31vw
	 PeD7d4NMMl/BF3EZSYJz9wnr7psFDJokgcp6td9PJR16Hrsfp3uWkf0ZOiymzqqZ3h
	 qFFvpdOT0+tc9PB4a4v8Tkmt+ZlhduWXvD9cCyAkXxumGN/l5JPn8AUC8X1LFyDt8w
	 UoaMO6bTeiBprWwP37k2z7ZJ1AY+oBe8bQyBz6qW6ukAb9wtBNIyknRJ/26OydS4BM
	 OR8VsXNuRRrXg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-992dcae74e0so361437366b.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 23:07:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLbW2+4OcRWHSO5erLSrt4LYxAZ3I3YMkxl5uXxUg4ykCVluEtlQ
	j8S5RX/GOtkH9fsowMlEn0/dgNAiTE1WBmFmaqY=
X-Google-Smtp-Source: APBJJlEzLc7L7O8lYCYBm/oEPRNhJwr+v77FyxxEvmv7V4gr/ndZRpAMGpCeKZbF0WrS11A8RXu1QPj5YO8q8/HIj6o=
X-Received: by 2002:a17:906:10cd:b0:98d:e696:de4f with SMTP id
 v13-20020a17090610cd00b0098de696de4fmr6311923ejv.26.1689401246297; Fri, 14
 Jul 2023 23:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230712-postal-affiliate-0d61a209897f@spud> <ZLAoIWX+qqWvucWz@xhacker>
 <CAJF2gTQ-RotMeRGCSh6P7uQvZDbfWdZZHtTdeZqCAHWK4DzmMQ@mail.gmail.com>
 <20230713-statutory-balance-f2c9e862f2e3@spud> <CAJF2gTRy5eK73=d6s7CVy9m9pB8p4rAoMHM3cZFwzg=AuF7TDA@mail.gmail.com>
 <20230714-saturate-verbalize-27571671249d@spud>
In-Reply-To: <20230714-saturate-verbalize-27571671249d@spud>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 15 Jul 2023 14:07:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTGeWb1GijUdixE=+G9mVGUfj5iCNkwwSKN6Yq1xp0S9w@mail.gmail.com>
Message-ID: <CAJF2gTTGeWb1GijUdixE=+G9mVGUfj5iCNkwwSKN6Yq1xp0S9w@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Don't trust V from the riscv,isa DT property
 on T-Head CPUs
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, palmer@dabbelt.com, heiko@sntech.de, 
	charlie@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_230730_900224_2045198A 
X-CRM114-Status: GOOD (  31.01  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNzoxMOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBhdCAwMjoxNDo0NVBNICsw
ODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTo0NeKAr0FN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRo
dSwgSnVsIDEzLCAyMDIzIGF0IDAxOjMzOjU2UE0gLTA0MDAsIEd1byBSZW4gd3JvdGU6Cj4gPiA+
ID4gT24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMTI6NDjigK9QTSBKaXNoZW5nIFpoYW5nIDxqc3po
YW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gT24gV2VkLCBKdWwgMTIsIDIwMjMgYXQg
MDY6NDg6MDJQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPgo+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgIC8qCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICogIlYiIGluIElTQSBz
dHJpbmdzIGlzIGFtYmlndW91cyBpbiBwcmFjdGljZTogaXQgc2hvdWxkIG1lYW4KPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgKiBqdXN0IHRoZSBzdGFuZGFyZCBWLTEuMCBidXQgdmVuZG9ycyBh
cmVuJ3Qgd2VsbCBiZWhhdmVkLgo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAqIE1hbnkgdmVu
ZG9ycyB3aXRoIFQtSGVhZCBDUFUgY29yZXMgd2hpY2ggaW1wbGVtZW50IHRoZSAwLjcuMQo+ID4g
PiA+ID4gPiArICAgICAgICAgICAgICAqIHZlcnNpb24gb2YgdGhlIHZlY3RvciBzcGVjaWZpY2F0
aW9uIHB1dCAidiIgaW50byB0aGVpciBEVHMKPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgKiBh
bmQgbm8gVC1IZWFkIENQVSBjb3JlcyB3aXRoIHRoZSBzdGFuZGFyZCB2ZXJzaW9uIG9mIHZlY3Rv
cgo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAqIGFyZSBpbiBjaXJjdWxhdGlvbiB5ZXQuCj4g
PiA+Cj4gPiA+ID4gVC1IRUFEJ3MgdmVjdG9yIDEuMCBTb0NzIGlzIGluIGNpcmN1bGF0aW9uLiBL
ZW5kcnl0ZSBLMjMwIGlzIHRoZQo+ID4gPiA+IHNoaXBwZWQgU29DIGNoaXAsIHdoaWNoIHZlbmRv
ciBpZCA9IFRIRUFEX1ZFTkRPUl9JRCBhbmQgd2l0aCB2ZWN0b3IKPiA+ID4gPiAxLjAuCj4gPiA+
Cj4gPiA+IFdoZXJlIGNhbiBJIGJ1eSBvbmUsIGlmIGl0IGlzIGluIGNpcmN1bGF0aW9uPwo+ID4g
PiBHb29nbGluZyBpbiBFbmdsaXNoIG1pZ2h0IG5vdCBiZSB0aGUgYmVzdCB0aGluZyB0byBkbywg
YnV0IGRvaW5nIHNvIEkKPiA+ID4gY291bGQgZmluZCBiYXNpY2FsbHkgbm8gaW5mb3JtYXRpb24g
b24gdGhlIGsyMzAgLSBJIGRpZCBrbm93IGl0IGV4aXN0ZWQKPiA+ID4gYW5kIHRyaWVkIHRvIGZp
bmQgc29tZSBpbmZvIG9uIGl0IGJlZm9yZSBzZW5kaW5nIHRoZSBwYXRjaC4KPiA+ID4gSWYgaXQg
aXMgbm90IGluIGNpcmN1bGF0aW9uLCB0aGVuIHRoZSBjb21tZW50IGlzIG5vdCBpbmFjY3VyYXRl
ICYgd2hlbgo+ID4gPiB0aGV5IGRvIGFycml2ZSB0aGV5IGNhbiB1c2UgdGhlIG5ldyBkZWRpY2F0
ZWQgcHJvcGVydHkgdG8gY29udmV5IHN1cHBvcnQKPiA+ID4gZm9yIHZlY3Rvci4KPgo+IEkgc2F3
IHlvdSBzZW50IHRvIFBhbG1lciBhIGxpbmsgdG8gdGhlIGsyMzAuIFdoZW4gSSBjbGlja2VkIHRo
ZSBsaW5rLAo+IGl0IGdhdmUgKHBlciBnb29nbGUgdHJhbnNsYXRlKSBwdXJjaGFzZSBvcHRpb25z
IGZvciBrMjEwIGFuZCBrNTEwIG9ubHkuCj4gSSBmaWd1cmUgdGhhdCBtZWFucyB0aGVyZSBpcyBu
b3RoaW5nIF9wdWJsaWNseV8gYXZhaWxhYmxlPwpUaGUgY3VycmVudCBpcyBpbiB0aGUgZWFybHkg
c3RhZ2UuIElmIHlvdSBoYXZlIGludGVyZXN0aW5nIHRvIGJ1eQpjaGlwcyAvIEVWQnMsIGRvbid0
IGhlc2l0YXRlIHRvIGVtYWlsIHRoZW0uCkNoaXBzIGFyZSByZWFkeSBmb3Igc2FsZSwgYW5kIHlv
dSBtYXkgYnV5IHRoZSBkZXZlbG9wbWVudCBib2FyZHMgZnJvbQpUYW9iYW8vLi4uIGluIFE0IG9m
IHRoaXMgeWVhci4KCj4KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgKiBQbGF0Zm9ybXMgd2l0
aCBULUhlYWQgQ1BVIGNvcmVzIHRoYXQgc3VwcG9ydCB0aGUgc3RhbmRhcmQKPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgKiB2ZXJzaW9uIG9mIHZlY3RvciBtdXN0IHByb3ZpZGUgdGhlIGV4cGxp
Y2l0IFYgcHJvcGVydHksCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICogd2hpY2ggaXMgd2Vs
bCBkZWZpbmVkLgo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAqLwo+ID4gPiA+ID4gPiArICAg
ICAgICAgICAgIGlmIChhY3BpX2Rpc2FibGVkICYmIHJpc2N2X2NhY2hlZF9tdmVuZG9yaWQoY3B1
KSA9PSBUSEVBRF9WRU5ET1JfSUQpIHsKPiA+ID4gPiBJZiB5b3UgaW5zaXN0IG9uIGRvaW5nIHRo
aXMsIHBsZWFzZToKPiA+ID4gPgo+ID4gPiA+IGlmIChhY3BpX2Rpc2FibGVkICYmIHJpc2N2X2Nh
Y2hlZF9tdmVuZG9yaWQoY3B1KSA9PSBUSEVBRF9WRU5ET1JfSUQgJiYKPiA+ID4gPiByaXNjdl9j
YWNoZWRfbWFyY2hpZChjcHUpID09IDAgJiYgcmlzY3ZfY2FjaGVkX21pbXBpZChjcHUpID09IDAp
IHsKPiA+ID4KPiA+ID4gV2h5PyBEb2VzIHRoZSBjOTA4IHJlcG9ydCBub24temVybyBtaW1waWQv
bWFyY2hpZD8KPgo+ID4gWWVzCj4KPiA+ID4gSWYgeWVzLCBkb2VzIGl0IG5lZWQgZWl0aGVyIHRo
ZSBlcnJhdGEgZm9yIENNT3Mgb3IgdGhlIHBhZ2UgdGFibGVzPwo+Cj4gPiBDOTA4IGlzIGNvbXBh
dGlibGUgdG8gUlZBMjIgUHJvZmlsZSwgaGVyZSBpcyB0aGUgZGV0YWlsIGxpbms6Cj4gPiBodHRw
czovL3hydm0uY29tL2NwdS1kZXRhaWxzP2lkPTQxMDc5MDQ0NjY3ODk5Mjg5NjAKPgo+IFRoYXQn
cyBmYW50YXN0aWMgbmV3cyEgSSdsbCBzdWJtaXQgYSB2MyBvZiB0aGlzIHdpdGggdGhlIGhhbW1l
ciByZWR1Y2VkLAo+IGFzIHlvdSBoYXZlIHN1Z2dlc3RlZCBhYm92ZS4KPgo+IFRoYW5rcywKPiBD
b25vci4KCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
