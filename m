Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E97BC001DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PenKroan26a0t/KrdTuJ4fuf6xLQYqma8xgDqVW4lb0=; b=OSxmFpDRzz+xS6
	cXAdUtawXkfpuqbWRdg/vnfIedpJjgcOK3QCGgHd2Iatsrxz/hB5t0VAAGhedaBIb/pCw2e2QcUiX
	/xPZ2yf9P5WtVmGc+OHJ0GOovIczHAiSQfMNXkH0p0gBTsF6U8UOcsw/jjh59qjV+9CTo5+m88+s2
	1J5+7M58Rm+ulFhw4dUKOQIkml1RzqPlklGHvLC+jz3KgOdnCZIFZjpq28Noc3Vk7lq7+0aXdtKQn
	2V/oKE8C1huj/W1LmHDwaXiZFCZD7Nx44f6wxYexd7HlosLQitrfmgixNUk+6Cw7IFF3NKpHwxlpc
	BDfyRPzDxmBU+yPXUG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzfb-003zyx-2k;
	Thu, 13 Jul 2023 16:59:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJzfY-003zyC-2O
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 16:59:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0437F61AF3
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 16:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE46C43391
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689267595;
	bh=TqUzlchrwXhWN1S5Z6sliL6d9960E2KXgd/K23x2LgM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=extyveQgY+brifHhtntGrUpZptuZuOWz1et+T4eg28m7PBEzm2aJxze01zwEDIrgq
	 knTMimLRr4XQgd4udYzZzbkth+6DayAlCJlKJh9k9ys7e2H8FjQR3Kpov3/L/Zb7qG
	 1DBKpF2pW3vASvHTcjLE2Ou2VUV5eHXPkLlJm9mlh1hcHeAMBcAmuB+EF9+YB5oecE
	 J79Dqasp/s80bwy7jllUbxao/pPAyKNs9I7TVP+pNnapTcix1kQhP0zPTA9AfwJnzv
	 ir5jnYesK+lfgpeoZNOcnpriyfNy41qbfkB1vGMo8G4/j5Euttu9G2f9Jl/ebU/Jqu
	 zboLkv7g6AW5A==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51e5d9e20ecso1159945a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 09:59:54 -0700 (PDT)
X-Gm-Message-State: ABy/qLbQ0tVhOb/+gINzvdxjTTeBjIcpzZDGyyo79QiwhIm0ogKNaDqP
	JckWwF48fk1HSHRWh7u6m6HrFwnabUDKV9fqEJo=
X-Google-Smtp-Source: APBJJlHHq6Js4fVdWS/uvXkMp8W5udysBEttpg8LjaaxKrtysI0emny2lCbalKT5PSYGULPvocJPPEv3oQKm7THOQRU=
X-Received: by 2002:a50:ef16:0:b0:51e:5322:a642 with SMTP id
 m22-20020a50ef16000000b0051e5322a642mr2114442eds.27.1689267593039; Thu, 13
 Jul 2023 09:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230711062202.3542367-1-CoelacanthusHex@gmail.com>
 <CAJF2gTRgXbEfQWiWtZtVNBDhpY2miG_ByHrVZF2fbfu60hCHcQ@mail.gmail.com> <37a22693-e33c-f64a-e3d7-febed8e9f195@gmail.com>
In-Reply-To: <37a22693-e33c-f64a-e3d7-febed8e9f195@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 13 Jul 2023 12:59:40 -0400
X-Gmail-Original-Message-ID: <CAJF2gTTmKPR-jwEpKFT4qzNqZLQV--RMzSH5LA-EPw8eSVi56g@mail.gmail.com>
Message-ID: <CAJF2gTTmKPR-jwEpKFT4qzNqZLQV--RMzSH5LA-EPw8eSVi56g@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: set a0 prior to syscall_handler
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>, 
	Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_095956_857637_BE092016 
X-CRM114-Status: GOOD (  25.15  )
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

T24gVGh1LCBKdWwgMTMsIDIwMjMgYXQgMTE6MjjigK9BTSBDZWxlc3RlIExpdSA8Y29lbGFjYW50
aHVzaGV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+IE9uIDIwMjMvNy8xMyAwODowMCwgR3VvIFJl
biB3cm90ZToKPiA+IE9uIFR1ZSwgSnVsIDExLCAyMDIzIGF0IDI6MjLigK9BTSBDZWxlc3RlIExp
dSA8Y29lbGFjYW50aHVzaGV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBXaGVuIHdlIHRl
c3Qgc2VjY29tcCB3aXRoIDYuNCBrZXJuZWwsIHdlIGZvdW5kIGVycm5vIGhhcyB3cm9uZyB2YWx1
ZS4KPiA+PiBJZiB3ZSBkZW55IE5FVExJTktfQVVESVQgd2l0aCBFQUZOT1NVUFBPUlQsIGFmdGVy
IGYwYmRkZjUwNTg2ZCwgd2Ugd2lsbAo+ID4+IGdldCBFTk9TWVMuIFdlIGdvdCBzYW1lIHJlc3Vs
dCB3aXRoIDljMjU5OGQ0MzUxMCAoInJpc2N2OiBlbnRyeTogU2F2ZSBhMAo+ID4+IHByaW9yIHN5
c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSIpLgo+ID4+Cj4gPj4gQ29tcGFyZWQgd2l0aCB4
ODYgYW5kIGxvb25nYXJjaCdzIGltcGxlbWVudGF0aW9uIG9mIHRoaXMgcGFydCBvZiB0aGUKPiA+
PiBmdW5jdGlvbiwgd2UgdGhpbmsgdGhhdCByZWdzLT5hMCA9IC1FTk9TWVMgc2hvdWxkIGJlIGFk
dmFuY2VkIGJlZm9yZQo+ID4+IHN5c2NhbGxfaGFuZGxlciB0byBmaXggdGhpcyBwcm9ibGVtLiBX
ZSBoYXZlIHdyaXR0ZW4gdGhlIGZvbGxvd2luZyBwYXRjaCwKPiA+PiB3aGljaCBjYW4gZml4IHRo
aXMgcHJvYmxlbSBhZnRlciB0ZXN0aW5nLiBCdXQgd2UgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQK
PiA+PiB0aGlzIHBhcnQgb2YgdGhlIGNvZGUgdG8gZXhwbGFpbiB0aGUgcm9vdCBjYXVzZS4gSG9w
ZSBzb21lb25lIGNhbiBmaW5kCj4gPj4gYSByZWFzb25hYmxlIGV4cGxhbmF0aW9uLiBBbmQgd2Un
ZCBsaWtlIHRvIHJld29yZCB0aGlzIGNvbW1pdCBtZXNzYWdlCj4gPj4gYWNjb3JkaW5nIHRvIHRo
ZSBleHBsYW5hdGlvbiBpbiB2Mgo+ID4+Cj4gPj4gRml4ZXM6IGYwYmRkZjUwNTg2ZCAoInJpc2N2
OiBlbnRyeTogQ29udmVydCB0byBnZW5lcmljIGVudHJ5IikKPiA+PiBSZXBvcnRlZC1ieTogRmVs
aXggWWFuIDxmZWxpeG9ubWFyc0BhcmNobGludXgub3JnPgo+ID4+IENvLWRldmVsb3BlZC1ieTog
UnVpemhlIFBhbiA8YzE0MTAyOEBnbWFpbC5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogUnVpemhl
IFBhbiA8YzE0MTAyOEBnbWFpbC5jb20+Cj4gPj4gQ28tZGV2ZWxvcGVkLWJ5OiBTaGlxaSBaaGFu
ZyA8c2hpcWlAaXNyYy5pc2Nhcy5hYy5jbj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTaGlxaSBaaGFu
ZyA8c2hpcWlAaXNyYy5pc2Nhcy5hYy5jbj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDZWxlc3RlIExp
dSA8Q29lbGFjYW50aHVzSGV4QGdtYWlsLmNvbT4KPiA+PiBUZXN0ZWQtYnk6IEZlbGl4IFlhbiA8
ZmVsaXhvbm1hcnNAYXJjaGxpbnV4Lm9yZz4KPiA+PiAtLS0KPiA+PiAgYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHMuYyB8IDMgKy0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MiBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+ID4+IGluZGV4IGY5MTBkZmNjYmY1
ZDIuLmNjYWRiNWZmZDA2M2MgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+PiBAQCAtMzAxLDYg
KzMwMSw3IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJh
cF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4+Cj4gPj4gICAgICAgICAgICAgICAg
IHJlZ3MtPmVwYyArPSA0Owo+ID4+ICAgICAgICAgICAgICAgICByZWdzLT5vcmlnX2EwID0gcmVn
cy0+YTA7Cj4gPj4gKyAgICAgICAgICAgICAgIHJlZ3MtPmEwID0gLUVOT1NZUzsKPiA+IE9oLCBu
by4gWW91IGRlc3Ryb3llZCB0aGUgYTAgZm9yIHN5c2NhbGxfaGFuZGxlciwgcmlnaHQ/IEl0J3Mg
bm90Cj4gPiByZWFzb25hYmxlLiBMZXQncyBzZWUgd2hpY2ggc3lzY2FsbF9oYW5kbGVyIG5lZWRz
IGEwPS1FTk9TWVMuCj4KPiBzeXNjYWxsX2hhbmRsZXIgYWx3YXlzIHVzZSBvcmlnX2EwLCBub3Qg
YTAuCj4gQW5kIEkgaGF2ZSBhIG1pc3Rha2UgaW4gb3JpZ2luYWwgZW1haWwsIGNvcnJldCBvbmUg
aXMKPiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlIG5vdCBzeXNjYWxsX2hhbmRsZXIuCkkg
bWlzdW5kZXJzdG9vZC4gWWVzLCBhMCB3b3VsZCBiZSByZXBsYWNlZCBieSBvcmlnX2EwOgpzeXNj
YWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlX3dvcmsgLT4gIHN5c2NhbGxfcm9sbGJhY2sKCklmIHRo
ZSBzeXNjYWxsIHdhcyBkZW5pZWQgYnkgc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpLCB0
aGUKcmV0dXJuIG51bWJlciBpcyBmb3JjZWQgdG8gYmUgLUVOT1NZUy4gTWF5YmUgcmVncy0+YTAg
aGFzIGFscmVhZHkgYmVlbgp1cGRhdGVkIGJ5IFNZU0NBTExfV09SS19TRUNDT01QLiBlZzoKCl9f
c2VjY29tcF9maWx0ZXIoKSB7Ci4uLgogICAgICAgIGNhc2UgU0VDQ09NUF9SRVRfVFJBUDoKICAg
ICAgICAgICAgICAgIC8qIFNob3cgdGhlIGhhbmRsZXIgdGhlIG9yaWdpbmFsIHJlZ2lzdGVycy4g
Ki8KICAgICAgICAgICAgICAgIHN5c2NhbGxfcm9sbGJhY2soY3VycmVudCwgY3VycmVudF9wdF9y
ZWdzKCkpOwogICAgICAgICAgICAgICAgLyogTGV0IHRoZSBmaWx0ZXIgcGFzcyBiYWNrIDE2IGJp
dHMgb2YgZGF0YS4gKi8KICAgICAgICAgICAgICAgIGZvcmNlX3NpZ19zZWNjb21wKHRoaXNfc3lz
Y2FsbCwgZGF0YSwgZmFsc2UpOwogICAgICAgICAgICAgICAgZ290byBza2lwOwoKPgo+ID4gQ291
bGQgeW91IGdpdmUgb3V0IG1vcmUgZGV0YWlsIG9uIHlvdXIgdGVzdCBjYXNlPwo+ID4KPiA+Pgo+
ID4+ICAgICAgICAgICAgICAgICByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3MpOwo+ID4+Cj4g
Pj4gQEAgLTMwOCw4ICszMDksNiBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlv
biB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+Pgo+ID4+ICAg
ICAgICAgICAgICAgICBpZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQo+ID4+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsKPiA+PiAtICAgICAg
ICAgICAgICAgZWxzZQo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgIHJlZ3MtPmEwID0gLUVO
T1NZUzsKPiA+Pgo+ID4+ICAgICAgICAgICAgICAgICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2Rl
KHJlZ3MpOwo+ID4+ICAgICAgICAgfSBlbHNlIHsKPiA+PiAtLQo+ID4+IDIuNDEuMAo+ID4+Cj4g
Pgo+ID4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
