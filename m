Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FF8FF4955
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 07:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvKyRMfdxXRw9Ry+xAYSiBd5fgEC25RF5cWlaBJCAik=; b=eopAoOkZUOPHEw
	Hdn8WIJ/6zaoCic4q7mc33N5jxzjrmefI851FZfnPbRcrMoHxad2r92qjl0URZu4dnzwX7XARBkOb
	RfQoTYsw+YBdGle/4/p7+jymyN3/NNv+weXgv5Bpu8KuUxCLEa/py5DebpqKmCBSxdFeTHPQo4PtQ
	18THeZKskDneri6srhjC5MhaaQHfM2o2FH0bsGX2skFMaR/fAEQ6qm3lGNHQP7bh7j2SZRPOieEJm
	0F+qJpUCK8U35dbv57ixDRJ5TnrpWzvA1D0tgSbH6a3dOw/hbKQDwnebXWsYkhyCToxcMXj+aBZ58
	+/Nrz0XlDzEs6uszVs3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76mh-0000000Ajim-2WAJ;
	Mon, 30 Mar 2026 07:11:39 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76md-0000000AjgS-01hH;
	Mon, 30 Mar 2026 07:11:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dtxKLBtxeK7WnTNaRuRN6wjCIkUS/712dvNiyCme+dM=;
	b=REz6lrKfLnmTbZnTSrloA8Qxl9ytOsPa/OKwvl5w3Tr9CHfmTc48CSuaquXePwoPkmMac2rJ+
	Ia8doJegFbzncelLLc+WY8AD1bp7J4dS8mfObdEHsZoC3f0vux4WUTdBtkywh/SHtrYyCW4VUbm
	dhD5rc1J2Q4kAhnpMA6VL/8=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fkj2Z2x0tz12LDJ;
	Mon, 30 Mar 2026 15:05:58 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E15B240537;
	Mon, 30 Mar 2026 15:11:22 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 30 Mar 2026 15:11:17 +0800
Message-ID: <baa90080-9e6e-c1e5-13a1-b17496c690b4@huawei.com>
Date: Mon, 30 Mar 2026 15:11:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v11 01/11] riscv: kexec_file: Fix crashk_low_res not
 exclude bug
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <pawan.kumar.gupta@linux.intel.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <rppt@kernel.org>,
	<leitao@debian.org>, <ardb@kernel.org>, <cfsworks@gmail.com>,
	<osandov@fb.com>, <jbohac@suse.cz>, <tangyouling@kylinos.cn>,
	<sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>,
	<eajames@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<kevin.brodsky@arm.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <fuqiang.wang@easystack.cn>,
	<liaoyuanhong@vivo.com>, <chenjiahao16@huawei.com>, <hbathini@linux.ibm.com>,
	<takahiro.akashi@linaro.org>, <james.morse@arm.com>, <lizhengyu3@huawei.com>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260328074013.3589544-1-ruanjinjie@huawei.com>
 <20260328074013.3589544-2-ruanjinjie@huawei.com>
 <CAJF2gTRN=RpgzQsQ7QDbwjDmyQZP9anQZ+CaK2r-Mrz9dQbohQ@mail.gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <CAJF2gTRN=RpgzQsQ7QDbwjDmyQZP9anQZ+CaK2r-Mrz9dQbohQ@mail.gmail.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_001135_414674_2BD13814 
X-CRM114-Status: GOOD (  12.02  )
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

CgpPbiAyMDI2LzMvMzAgMTE6NDksIEd1byBSZW4gd3JvdGU6Cj4gT24gU2F0LCBNYXIgMjgsIDIw
MjYgYXQgMzo0MeKAr1BNIEppbmppZSBSdWFuIDxydWFuamluamllQGh1YXdlaS5jb20+IHdyb3Rl
Ogo+Pgo+PiBBcyBkb25lIGluIGNvbW1pdCA5NDRhNDVhYmZhYmMgKCJhcm02NDoga2R1bXA6IFJl
aW1wbGVtZW50IGNyYXNoa2VybmVsPVgiKQo+PiBhbmQgY29tbWl0IDQ4MzFiZTcwMmI5NSAoImFy
bTY0L2tleGVjOiBGaXggbWlzc2luZyBleHRyYSByYW5nZSBmb3IKPj4gY3Jhc2hrcmVzX2xvdy4i
KSBmb3IgYXJtNjQsIHdoaWxlIGltcGxlbWVudGluZyBjcmFzaGtlcm5lbD1YLFtoaWdoLGxvd10s
Cj4+IHJpc2N2IHNob3VsZCBoYXZlIGV4Y2x1ZGVkIHRoZSAiY3Jhc2hrX2xvd19yZXMiIHJlc2Vy
dmVkIHJhbmdlcyBmcm9tCj4+IHRoZSBjcmFzaCBrZXJuZWwgbWVtb3J5IHRvIHByZXZlbnQgdGhl
bSBmcm9tIGJlaW5nIGV4cG9ydGVkIHRocm91Z2gKPj4gL3Byb2Mvdm1jb3JlLCBhbmQgdGhlIGV4
Y2x1c2lvbiB3b3VsZCBuZWVkIGFuIGV4dHJhIGNyYXNoX21lbSByYW5nZS4KPj4KPj4gQ2M6IEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+PiBDYzogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5j
b20+Cj4+IEZpeGVzOiA1ODgyZTVhY2YxOGQgKCJyaXNjdjoga2R1bXA6IEltcGxlbWVudCBjcmFz
aGtlcm5lbD1YLFtoaWdoLGxvd10iKQo+PiBTaWduZWQtb2ZmLWJ5OiBKaW5qaWUgUnVhbiA8cnVh
bmppbmppZUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVf
a2V4ZWNfZmlsZS5jIHwgMTQgKysrKysrKysrKystLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5l
X2tleGVjX2ZpbGUuYwo+PiBpbmRleCA1NGUyZDk1NTJlOTMuLjNmNzc2NjA1N2NhYyAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMKPj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxlLmMKPj4gQEAgLTYxLDcgKzYxLDcg
QEAgc3RhdGljIGludCBwcmVwYXJlX2VsZl9oZWFkZXJzKHZvaWQgKiphZGRyLCB1bnNpZ25lZCBs
b25nICpzeikKPj4gICAgICAgICB1bnNpZ25lZCBpbnQgbnJfcmFuZ2VzOwo+PiAgICAgICAgIGlu
dCByZXQ7Cj4+Cj4+IC0gICAgICAgbnJfcmFuZ2VzID0gMTsgLyogRm9yIGV4Y2x1c2lvbiBvZiBj
cmFzaGtlcm5lbCByZWdpb24gKi8KPj4gKyAgICAgICBucl9yYW5nZXMgPSAyOyAvKiBGb3IgZXhj
bHVzaW9uIG9mIGNyYXNoa2VybmVsIHJlZ2lvbiAqLwo+PiAgICAgICAgIHdhbGtfc3lzdGVtX3Jh
bV9yZXMoMCwgLTEsICZucl9yYW5nZXMsIGdldF9ucl9yYW1fcmFuZ2VzX2NhbGxiYWNrKTsKPj4K
Pj4gICAgICAgICBjbWVtID0ga21hbGxvY19mbGV4KCpjbWVtLCByYW5nZXMsIG5yX3Jhbmdlcyk7
Cj4+IEBAIC03Niw4ICs3NiwxNiBAQCBzdGF0aWMgaW50IHByZXBhcmVfZWxmX2hlYWRlcnModm9p
ZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6KQo+Pgo+PiAgICAgICAgIC8qIEV4Y2x1ZGUgY3Jh
c2hrZXJuZWwgcmVnaW9uICovCj4+ICAgICAgICAgcmV0ID0gY3Jhc2hfZXhjbHVkZV9tZW1fcmFu
Z2UoY21lbSwgY3Jhc2hrX3Jlcy5zdGFydCwgY3Jhc2hrX3Jlcy5lbmQpOwo+PiAtICAgICAgIGlm
ICghcmV0KQo+PiAtICAgICAgICAgICAgICAgcmV0ID0gY3Jhc2hfcHJlcGFyZV9lbGY2NF9oZWFk
ZXJzKGNtZW0sIHRydWUsIGFkZHIsIHN6KTsKPj4gKyAgICAgICBpZiAocmV0KQo+PiArICAgICAg
ICAgICAgICAgZ290byBvdXQ7Cj4+ICsKPj4gKyAgICAgICBpZiAoY3Jhc2hrX2xvd19yZXMuZW5k
KSB7Cj4+ICsgICAgICAgICAgICAgICByZXQgPSBjcmFzaF9leGNsdWRlX21lbV9yYW5nZShjbWVt
LCBjcmFzaGtfbG93X3Jlcy5zdGFydCwgY3Jhc2hrX2xvd19yZXMuZW5kKTsKPiBFeGNsdWRlIGNy
YXNoa19sb3dfcmVzIGlzIHJlYXNvbmFibGUsIGJ1dCBoYXZlIHlvdSB0ZXN0ZWQgdGhpcz8KCkp1
c3Qgc2ltcGx5IHRlc3RlZCBvbiBxZW11IHdpdGggY3Jhc2hrZXJuZWw9NEcgd2l0aCBmb2xsb3dp
bmcga2V4ZWMKbWVudGlvbmVkIGluCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDcy
NjE3NTAwMC4yNTM2MjIwLTEtY2hlbmppYWhhbzE2QGh1YXdlaS5jb20vLgpBbmQgdGhlIHNlY29u
ZCBrZXJuZWwgY2FuIGJlIHN0YXJ0ZWQgbm9ybWFsbHkuCgpodHRwczovL2dpdGh1Yi5jb20vY2hl
bmpoMDA1L2tleGVjLXRvb2xzL3RyZWUvYnVpbGQtdGVzdC1yaXNjdi12MgoKIyBkbWVzZyB8IGdy
ZXAgY3Jhc2gKWyAgICAwLjAwMDAwMF0gY3Jhc2hrZXJuZWwgbG93IG1lbW9yeSByZXNlcnZlZDog
MHhmODAwMDAwMCAtIDB4MTAwMDAwMDAwCigxMjggTUIpClsgICAgMC4wMDAwMDBdIGNyYXNoa2Vy
bmVsIHJlc2VydmVkOiAweDAwMDAwMDAxN2ZlMDAwMDAgLQoweDAwMDAwMDAyN2ZlMDAwMDAgKDQw
OTYgTUIpCgoKCj4gCj4+ICsgICAgICAgICAgICAgICBpZiAocmV0KQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIG91dDsKPj4gKyAgICAgICB9Cj4+ICsKPj4gKyAgICAgICByZXQgPSBj
cmFzaF9wcmVwYXJlX2VsZjY0X2hlYWRlcnMoY21lbSwgdHJ1ZSwgYWRkciwgc3opOwo+Pgo+PiAg
b3V0Ogo+PiAgICAgICAgIGtmcmVlKGNtZW0pOwo+PiAtLQo+PiAyLjM0LjEKPj4KPiAKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
