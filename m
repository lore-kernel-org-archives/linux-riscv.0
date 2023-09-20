Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31BBCE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTKtnIf5VjJ4aYxGQ32KoyImcg0PcQpltQHi362KCwE=; b=5GNvPGInpzLZWf
	XM6yL1MXcOHANG7USK/Twk3+WrHGnNmq6EBnQuSJIEVsyWJSX2B1qyWvMWyCILmj4DnAOlfrTR20I
	Dj6ewESFJxk8sFsWMBbtxKvmoVY9L5FT9Iy2aQfRjrGdDDGWWxeUPpaLK7TB9URrkPOdN8JlGEFL8
	dXru84jmsqDpOewY3d04jLKl3fl7GOwL24SKUOI/jCpz7VH1K94rjZHTl89LQ2pqFJfyJKFoOZdXu
	jB70uEwJqmOoh01JuYcmhx2aZdstBT4S3ARsKPeGgVcwaHEO1gz0l5hoJHclJhIMWwvQPzcDyYwZv
	EVDBB2p8FQ/nHpbCeqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qis2J-002CIw-1Z;
	Wed, 20 Sep 2023 07:54:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qis2G-002CHs-2K
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:54:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 59D26CE19DB
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 955A4C433C8
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695196448;
	bh=K8AxAQOT8+MI8bjoZz6VFx9HFGUcrIa/mTpDzepHRqQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qcrm7xRpOB1M/xx+Jt3nveIAcPj6dRcCA65n0mOocvxjwjQLs9wPuKZ3ebG5vyifa
	 v3p32tX71Wn7Gz9KCLZm/AN/+uZxedlA6ZTiXaWKacbFKRtWaQk4abA7QdNDAz0iec
	 lKauU63ofbazoNbJxqzU63qtvBAY55qWZOaaG8bTipkKRmnF48TnlNdR9bdqCMmtdO
	 Pf+tLup5Th4rEWdWM2cEC5gRGWxLmmmqcKQXXVjOsImsrF64/hK1Qzz3Hv5QMGX2Wl
	 bj9gf49Gsm0/61faQnGFu321cew5dcncmH1VfKo/nkE7V+oETghdZVqJWvoZQS5qoF
	 APwzFyesWst2g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c008042211so51238501fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:54:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YymBA5f0sD9iz2q3GbxK1sdHT9mI7lsDU6QJ7+Cl4bLwX/wGobq
	BYn49Pvvv7j/j1fcOdANpHd7KoxFEOFzFYPE2xI=
X-Google-Smtp-Source: AGHT+IGbON4qUvKyn9SpbtgKFzXwyHZKLVPKIdLZul8MBdsq+dCsBfr2RGFZYdhev89kclP9xbz7mSdJOX7f6FJRyOo=
X-Received: by 2002:a05:651c:1034:b0:2bc:d8cb:5a13 with SMTP id
 w20-20020a05651c103400b002bcd8cb5a13mr1419793ljm.42.1695196446802; Wed, 20
 Sep 2023 00:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 15:53:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR7xzGvQeewuhRLHE2yjH8zeDMj4qfE4_W-yb71-Zx6Zg@mail.gmail.com>
Message-ID: <CAJF2gTR7xzGvQeewuhRLHE2yjH8zeDMj4qfE4_W-yb71-Zx6Zg@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] serial: 8250_dw: Add Sophgo SG2042 support
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_005413_129261_0B1A72C2 
X-CRM114-Status: GOOD (  18.00  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjo0MOKAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5u
ZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPgo+IEFkZCBxdWlyayB0byBza2lwIHNldHRpbmcg
dGhlIGlucHV0IGNsb2NrIHJhdGUgZm9yIHRoZSB1YXJ0cyBvbiB0aGUKPiBTb3BoZ28gU0cyMDQy
IFNvQyBzaW1pbGFyIHRvIHRoZSBTdGFyRml2ZSBKSDcxMDAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBF
bWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHdhbmdjaGVuMjBAaXNjYXMuYWMuY24+Cj4gLS0t
Cj4gIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZHcuYyB8IDUgKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwv
ODI1MC84MjUwX2R3LmMKPiBpbmRleCBmNGNhZmNhMWE3ZGEuLjZjMzQ0ODc3YTA3ZiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMKPiArKysgYi9kcml2ZXJz
L3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMKPiBAQCAtNzcwLDcgKzc3MCw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHc4MjUwX3BsYXRmb3JtX2RhdGEgZHc4MjUwX3JlbmVzYXNfcnpuMV9kYXRh
ID0gewo+ICAgICAgICAgLnF1aXJrcyA9IERXX1VBUlRfUVVJUktfSVNfRE1BX0ZDLAo+ICB9Owo+
Cj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHc4MjUwX3BsYXRmb3JtX2RhdGEgZHc4MjUwX3N0YXJm
aXZlX2poNzEwMF9kYXRhID0gewo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGR3ODI1MF9wbGF0Zm9y
bV9kYXRhIGR3ODI1MF9za2lwX3NldF9yYXRlX2RhdGEgPSB7Cj4gICAgICAgICAudXNyX3JlZyA9
IERXX1VBUlRfVVNSLAo+ICAgICAgICAgLnF1aXJrcyA9IERXX1VBUlRfUVVJUktfU0tJUF9TRVRf
UkFURSwKPiAgfTsKPiBAQCAtNzgwLDcgKzc4MCw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIGR3ODI1MF9vZl9tYXRjaFtdID0gewo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJjYXZpdW0sb2N0ZW9uLTM4NjAtdWFydCIsIC5kYXRhID0gJmR3ODI1MF9vY3Rlb25fMzg2MF9k
YXRhIH0sCj4gICAgICAgICB7IC5jb21wYXRpYmxlID0gIm1hcnZlbGwsYXJtYWRhLTM4eC11YXJ0
IiwgLmRhdGEgPSAmZHc4MjUwX2FybWFkYV8zOHhfZGF0YSB9LAo+ICAgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJyZW5lc2FzLHJ6bjEtdWFydCIsIC5kYXRhID0gJmR3ODI1MF9yZW5lc2FzX3J6bjFf
ZGF0YSB9LAo+IC0gICAgICAgeyAuY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMDAtdWFydCIs
IC5kYXRhID0gJmR3ODI1MF9zdGFyZml2ZV9qaDcxMDBfZGF0YSB9LAo+ICsgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLXVhcnQiLCAuZGF0YSA9ICZkdzgyNTBfc2tpcF9zZXRf
cmF0ZV9kYXRhIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzEwMC11
YXJ0IiwgLmRhdGEgPSAmZHc4MjUwX3NraXBfc2V0X3JhdGVfZGF0YSB9LApXaHkgc2hhbGwgd2Ug
dG91Y2ggdGhlIGpoNzEwMCBzdHVmZiBpbiB0aGlzIHBhdGNoPwoKPiAgICAgICAgIHsgLyogU2Vu
dGluZWwgKi8gfQo+ICB9Owo+ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkdzgyNTBfb2ZfbWF0
Y2gpOwo+IC0tCj4gMi4yNS4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
