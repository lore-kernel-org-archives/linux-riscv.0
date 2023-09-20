Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CBDCE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tqC0be0v9s4FsWNPLYL3VJ2WcFGtz+9NZf30jSmcqg=; b=ionISIgBHpwQvf
	FuZYzP9azBbYdJHIMZxrOYkGA5Ur201goLVaIAHUCWRQO3EH+tyw6zL5DsZ2ZSHS9MXYuX5xhJNbQ
	bVkwaCX10FuCPJPHIQU7aSk55XNb3ffJ1vmS1ctQlsQHdNMdrlVofqD/g+qe3RpAAv7c0L78BGY8D
	KRcIME/OpRJcvTEL2xb9qZOL2eWC46FMM1wuxTknq+kCmyML0BSH7GpIvs8StwmS2WsE6R2FuK/i1
	3RIyJnsYIav8rubZuOSQmG4ZwDoMy8o/rQY4rglWr5n+T1OnlBdKeowmQ7WZs6RAV0ghNcFD/Hoxa
	y7mHKXPmQ/1gUXyX3J1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisGG-002Eao-0G;
	Wed, 20 Sep 2023 08:08:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisGC-002EZR-2Q
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:08:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 522C1B81C03
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F60C43140
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695197312;
	bh=qAIWwAW7lDeNaVQ6985ltio37pUtvHfKeT/9/6f+OBI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Og/WmP3CZ5J7hvEETGEL3OPUIlYQllkLKHEDQMjERAINdOUuCn8UxlgYAbZoxHuQV
	 2gY21+83STqm9iL6lZ+aozfwPU2p2QUWQcft5kEW3keZ900y5539c8j32vAXOnh+y5
	 uiOhAgTjsGDUVzisBwiN2ReF86J+XigjtjnsVgg7W0QDpkubxdq4DIyYVOVqK4nNX2
	 e+MYZvHvO4f9aPexa4ig6YjO8FovDEc7wPBhXK73/eAMYRvRWaojJGuD83bAMEq5wq
	 1QkyrCt7mUZ/Y4pFehvmo+F95iGJ7w5sZONetCB+gYxhkWZn9iYzB0ddX4r0HNDK0X
	 1b/CneLa/VoCw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9aa0495f9cfso135881466b.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 01:08:32 -0700 (PDT)
X-Gm-Message-State: AOJu0YzL91aLiGcFgiOEUwAc2ka2RKQL9s0Vvi80p/8Y3+mWJ5/HUSpu
	dP9mlJhhfC8HDetM2FMiQtSqUee1cXsR25hX5/M=
X-Google-Smtp-Source: AGHT+IGJiPFLwCVRF104WW4YBT4ZXHyqim7bUeetLR+HqIGqrPKeTAvjlz5fqzoJgz93uyq8IImxyV+0vGy9K2i7YvA=
X-Received: by 2002:a17:906:74db:b0:99c:5056:4e31 with SMTP id
 z27-20020a17090674db00b0099c50564e31mr2898912ejl.15.1695197310819; Wed, 20
 Sep 2023 01:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
 <CAJF2gTR7xzGvQeewuhRLHE2yjH8zeDMj4qfE4_W-yb71-Zx6Zg@mail.gmail.com> <MA0P287MB03320173BB92D2C54FD659A7FEF9A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB03320173BB92D2C54FD659A7FEF9A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 16:08:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRNQwEgcFKOUt_A6jzF1k8GeU46FTvLBsE2YkHzGMvP6A@mail.gmail.com>
Message-ID: <CAJF2gTRNQwEgcFKOUt_A6jzF1k8GeU46FTvLBsE2YkHzGMvP6A@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] serial: 8250_dw: Add Sophgo SG2042 support
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, 
	conor@kernel.org, devicetree@vger.kernel.org, 
	emil.renner.berthing@canonical.com, jszhang@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	robh+dt@kernel.org, xiaoguang.xing@sophgo.com, 
	Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_010837_082821_7EF3AE70 
X-CRM114-Status: GOOD (  21.91  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgNDowNuKAr1BNIENoZW4gV2FuZyA8dW5pY29ybl93YW5n
QG91dGxvb2suY29tPiB3cm90ZToKPgo+IFJlbiwgdGhhbmtzIGZvciB5b3VyIHJldmlldy4KPgo+
IHNnMjA0MiBhbmQgamg3MTAwIHVzZSB0aGUgc2FtZSB1YXJ0IGRyaXZlciBhbmQgd2UgaGVyZSBq
dXN0IHdhbnQgdG8gcmV1c2UgdGhlIGxvZ2ljIGZyb20gamg3MTAwLgo+IFdlIGRvbid0IHRvdWNo
IGpoNzEwMCBzdHVmZiwgd2UganVzdCByZW5hbWUgImR3ODI1MF9zdGFyZml2ZV9qaDcxMDBfZGF0
YSIgIHRvICJkdzgyNTBfc2tpcF9zZXRfcmF0ZV9kYXRhIiBhbmQgbWFrZSBpdCBhIGNvbW1vbiBk
YXRhIGZvciBib3RoIHNnMjA0MiBhbmQgamg3MTAwLgpPa2F5LCBJIGdvdCBpdCBub3cuCkxHVE0K
ClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCj4KPiDlnKggMjAyMy85
LzIwIDE1OjUzLCBHdW8gUmVuIOWGmemBkzoKPiA+IE9uIFdlZCwgU2VwIDIwLCAyMDIzIGF0IDI6
NDDigK9QTSBDaGVuIFdhbmcgPHVuaWNvcm54d0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+IEZyb206
IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29t
Pgo+ID4+Cj4gPj4gQWRkIHF1aXJrIHRvIHNraXAgc2V0dGluZyB0aGUgaW5wdXQgY2xvY2sgcmF0
ZSBmb3IgdGhlIHVhcnRzIG9uIHRoZQo+ID4+IFNvcGhnbyBTRzIwNDIgU29DIHNpbWlsYXIgdG8g
dGhlIFN0YXJGaXZlIEpINzEwMC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEVtaWwgUmVubmVy
IEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+ID4+IFNpZ25l
ZC1vZmYtYnk6IENoZW4gV2FuZyA8d2FuZ2NoZW4yMEBpc2Nhcy5hYy5jbj4KPiA+PiAtLS0KPiA+
PiAgIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZHcuYyB8IDUgKysrLS0KPiA+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jIGIvZHJpdmVycy90
dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jCj4gPj4gaW5kZXggZjRjYWZjYTFhN2RhLi42YzM0NDg3
N2EwN2YgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5j
Cj4gPj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jCj4gPj4gQEAgLTc3
MCw3ICs3NzAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGR3ODI1MF9wbGF0Zm9ybV9kYXRhIGR3
ODI1MF9yZW5lc2FzX3J6bjFfZGF0YSA9IHsKPiA+PiAgICAgICAgICAucXVpcmtzID0gRFdfVUFS
VF9RVUlSS19JU19ETUFfRkMsCj4gPj4gICB9Owo+ID4+Cj4gPj4gLXN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHc4MjUwX3BsYXRmb3JtX2RhdGEgZHc4MjUwX3N0YXJmaXZlX2poNzEwMF9kYXRhID0gewo+
ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGR3ODI1MF9wbGF0Zm9ybV9kYXRhIGR3ODI1MF9za2lw
X3NldF9yYXRlX2RhdGEgPSB7Cj4gPj4gICAgICAgICAgLnVzcl9yZWcgPSBEV19VQVJUX1VTUiwK
PiA+PiAgICAgICAgICAucXVpcmtzID0gRFdfVUFSVF9RVUlSS19TS0lQX1NFVF9SQVRFLAo+ID4+
ICAgfTsKPiA+PiBAQCAtNzgwLDcgKzc4MCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIGR3ODI1MF9vZl9tYXRjaFtdID0gewo+ID4+ICAgICAgICAgIHsgLmNvbXBhdGlibGUg
PSAiY2F2aXVtLG9jdGVvbi0zODYwLXVhcnQiLCAuZGF0YSA9ICZkdzgyNTBfb2N0ZW9uXzM4NjBf
ZGF0YSB9LAo+ID4+ICAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWFydmVsbCxhcm1hZGEtMzh4
LXVhcnQiLCAuZGF0YSA9ICZkdzgyNTBfYXJtYWRhXzM4eF9kYXRhIH0sCj4gPj4gICAgICAgICAg
eyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6bjEtdWFydCIsIC5kYXRhID0gJmR3ODI1MF9yZW5l
c2FzX3J6bjFfZGF0YSB9LAo+ID4+IC0gICAgICAgeyAuY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxq
aDcxMDAtdWFydCIsIC5kYXRhID0gJmR3ODI1MF9zdGFyZml2ZV9qaDcxMDBfZGF0YSB9LAo+ID4+
ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLXVhcnQiLCAuZGF0YSA9ICZk
dzgyNTBfc2tpcF9zZXRfcmF0ZV9kYXRhIH0sCj4gPj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0g
InN0YXJmaXZlLGpoNzEwMC11YXJ0IiwgLmRhdGEgPSAmZHc4MjUwX3NraXBfc2V0X3JhdGVfZGF0
YSB9LAo+ID4gV2h5IHNoYWxsIHdlIHRvdWNoIHRoZSBqaDcxMDAgc3R1ZmYgaW4gdGhpcyBwYXRj
aD8KPiA+Cj4gPj4gICAgICAgICAgeyAvKiBTZW50aW5lbCAqLyB9Cj4gPj4gICB9Owo+ID4+ICAg
TU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHc4MjUwX29mX21hdGNoKTsKPiA+PiAtLQo+ID4+IDIu
MjUuMQo+ID4+Cj4gPgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
