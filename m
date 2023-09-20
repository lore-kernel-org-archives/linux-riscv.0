Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629CACE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMWA6jpuEWvaXQZhlXNpu3sI+mKABcZDONOct/YJ05A=; b=4S/Cc51LRCgQeN
	Ah5eOJczxTH17ZzvQhxWtQx9WKQ4tb7Te8Mmy9yXxxSKvnJzMuzXH96ZfKJFLNg5Bcs13pXB93sZn
	/+gRvuYTB4gsvi+5pgMocOx/VpWbinizkHmmCh23TdXpSQDeDWJpYRgAefL+61V6qDNopryUIiL0+
	GYYHRuwGlKrkuxUIqOVVr62KydxiXlyIOugBid76rSx2dkkcQ9HnzH8yGnr6jn3vVzeaxkvX84vCL
	jkJlIt3v9uhU5+yLZAWJirRBpGl3Aw0s+LvHca/rPYtcqLlJztnbSj4Q4A5q+0sm+CiMSaNqxo9Vn
	A2CufGlyxFJ2P/2PMTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisDO-002E6k-0y;
	Wed, 20 Sep 2023 08:05:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisDL-002E5g-0Y
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:05:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4F153CE19E9
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83286C433C9
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695197135;
	bh=4z5ocVO20kmwYYtIcTCNJGr7rb3Lqyayq1Zc4dQto/0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KSDwx1ppRPVtSLYT8nXbEoPMBbj8Eege4himYGREzIF+3qgL2TR4tUcQcWso0RR/D
	 ibCDHH9tFJgTa9gOrpnH0uiLftIyHfzQc6lPuYJohTys85YB/r2o9hv1UuCNoUp0Di
	 9e0rIZWLkfoen9LXSdwc4YUAKfpFchAZpyAgl8xecROwToPu2T7ekncSZAoMAqFQNt
	 +T3LWeQUKvZuo9yKV5eQr8Qf752TWS4b1ofvSa+i5Vr2Y5mUVtGAM/olAvQul0KCo+
	 qjRI6cV+Tvgu6uFVDhRnVjS4NPUioY0frO/KboY4vAghbPsoL6LyjOSuDy+CNjypW9
	 qr/TIu/bzQQuw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2c00b37ad84so48582211fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 01:05:35 -0700 (PDT)
X-Gm-Message-State: AOJu0YztqdJyNrsIfvSfA6ZcI2ggyyF+xlvbjNelynrFftfmaw2brlm+
	IB1nWsIAJbO97ZjsidfckhTUhbuhhPCGC7rAm1o=
X-Google-Smtp-Source: AGHT+IFQCEdz0BmFYbfJmUDySjWk4q+NyrOTm1esI+1FfKMftbTBYe3qHzQwq/RGrzgW/l5edoUq7BFYp8iN2AGMODw=
X-Received: by 2002:a2e:9006:0:b0:2c0:21b6:e82e with SMTP id
 h6-20020a2e9006000000b002c021b6e82emr1472090ljg.4.1695197133713; Wed, 20 Sep
 2023 01:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <e9ff83e4fac9a9ebd217ef10e5f8d3260342102b.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <e9ff83e4fac9a9ebd217ef10e5f8d3260342102b.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 16:05:21 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTsCT0sBN1Qi28f-G7n+KuUe0Ny0+4rHWoND67b2wswSg@mail.gmail.com>
Message-ID: <CAJF2gTTsCT0sBN1Qi28f-G7n+KuUe0Ny0+4rHWoND67b2wswSg@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] riscv: dts: sophgo: add Milk-V Pioneer board
 device tree
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_010539_593773_C2CC0625 
X-CRM114-Status: GOOD (  19.67  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjo0MeKAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBNaWxrLVYgUGlvbmVlciBbMV0gaXMgYSBkZXZlbG9wZXIgbW90
aGVyYm9hcmQgYmFzZWQgb24gU09QSE9OCj4gU0cyMDQyIGluIGEgc3RhbmRhcmQgbUFUWCBmb3Jt
IGZhY3Rvci4gSXQgaXMgYSBnb29kCj4gY2hvaWNlIGZvciBSSVNDLVYgZGV2ZWxvcGVycyBhbmQg
aGFyZHdhcmUgcGlvbmVlcnMgdG8KPiBleHBlcmllbmNlIHRoZSBjdXR0aW5nIGVkZ2UgdGVjaG5v
bG9neSBvZiBSSVNDLVYuCj4KPiBDdXJyZW50bHkgb25seSBzdXBwb3J0IGJvb3RpbmcgaW50byBj
b25zb2xlIHdpdGggb25seSB1YXJ0Cj4gZW5hYmxlZCwgb3RoZXIgZmVhdHVyZXMgd2lsbCBiZSBh
ZGRlZCBzb29uIGxhdGVyLgo+Cj4gWzFdOiBodHRwczovL21pbGt2LmlvL3Bpb25lZXIKPgo+IEFj
a2VkLWJ5OiBYaWFvZ3VhbmcgWGluZyA8eGlhb2d1YW5nLnhpbmdAc29waGdvLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHdhbmdjaGVuMjBAaXNjYXMuYWMuY24+Cj4gLS0tCj4gIGFy
Y2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgYXJj
aC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFrZWZpbGUgICAgICAgICAgIHwgIDMgKysrCj4gIC4u
Li9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzICB8IDE5ICsrKysrKysr
KysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9NYWtlZmlsZQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBp
b25lZXIuZHRzCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZSBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKPiBpbmRleCBmNjBhMjgwYWJiMTUuLjk0Nzg4
NDg2ZjEzZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlCj4gKysr
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZQo+IEBAIC02LDUgKzYsNiBAQCBzdWJkaXIt
eSArPSByZW5lc2FzCj4gIHN1YmRpci15ICs9IHNpZml2ZQo+ICBzdWJkaXIteSArPSBzdGFyZml2
ZQo+ICBzdWJkaXIteSArPSB0aGVhZAo+ICtzdWJkaXIteSArPSBzb3BoZ28KPgo+ICBvYmotJChD
T05GSUdfQlVJTFRJTl9EVEIpIDo9ICQoYWRkc3VmZml4IC8sICQoc3ViZGlyLXkpKQo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL01ha2VmaWxlCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjVhNDcxYjE5ZGYyMgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9NYWtlZmlsZQo+IEBAIC0wLDAgKzEsMyBAQAo+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gK2R0Yi0kKENPTkZJR19BUkNIX1NPUEhHTykg
Kz0gc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRiCj4gKwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHMgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHMKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDZlOGMwMjg1ZDFlCj4gLS0tIC9kZXYvbnVsbAo+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1taWxrdi1waW9uZWVyLmR0
cwo+IEBAIC0wLDAgKzEsMTkgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAgT1IgTUlUCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBTb3BoZ28gVGVjaG5vbG9n
eSBJbmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgInNnMjA0
Mi5kdHNpIgo+ICsKPiArLyB7Cj4gKyAgICAgICBtb2RlbCA9ICJNaWxrLVYgUGlvbmVlciI7Cj4g
KyAgICAgICBjb21wYXRpYmxlID0gIm1pbGt2LHBpb25lZXIiLCAic29waGdvLHNnMjA0MiI7Cj4g
Kwo+ICsgICAgICAgY2hvc2VuOiBjaG9zZW4gewo+ICsgICAgICAgICAgICAgICBzdGRvdXQtcGF0
aCA9ICJzZXJpYWwwIjsKPiArICAgICAgIH07Cj4gK307Cj4gKwo+ICsmdWFydDAgewo+ICsgICAg
ICAgc3RhdHVzID0gIm9rYXkiOwo+ICt9Owo+IC0tCj4gMi4yNS4xCj4KTEdUTQoKUmV2aWV3ZWQt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
