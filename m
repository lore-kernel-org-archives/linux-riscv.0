Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83521FA0C3D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ipo8r2PB9b7rSwugjlkycYM7otggvL7THO2mosCdBno=; b=tOVXUDHEizZXiG
	/wC+MRkZ6yekiShDMCqiGnUF/OHuMyStkKuTp6qcHzG+1UXA31I0kQzn+NUWUO+OqHfeWfngeYwBw
	2ueqkzV0kqj7QQ8A3KS3IY/c3ah2I6nf7ETQuCZmq+LzVRA1V8oCn1b6Gtde8/wzN32U7F2rgUUCM
	ro69PAeiFkllKbHxAQA9QTeqZ2xmCGmolJjsdt6YfjW1zoFijQzRtf/edGI+Jdg3sRwfwevPjNjw5
	3H9Eji3BcA8IEb4aAI+fVuyAqLNmKEOButvjMwybmBzQW9ueqz8aGVXkNcGNhpNYlkuwQsulZhca3
	hSeTD/AGJvqc/Vx/uURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuqU-00000000k14-42Vi;
	Wed, 15 Apr 2026 07:39:34 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuqQ-00000000jzz-1wr1
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 07:39:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xAWH0vekplqg9nKMnqwmGFbsAKMeVxmaVE/r2NQ6tWM=;
	b=Spq8wimfX+GEz3itMSWWENVE0jwLWbCxck9n4vTjj73DCnsqBFzZZz+uXAq+QJZdmILzLO5ET
	acBpYA9cbA8Bu6uV6BViDS2W0Iwz8n2EXzxZhBL7DZLoc9w84Ns+hpWtpRrBOcjNBnMPrykKxgo
	tJn4MH/ywgvLXqGbtwHVMEg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fwXtM00F7z12LJC;
	Wed, 15 Apr 2026 15:32:58 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 0812640576;
	Wed, 15 Apr 2026 15:39:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Apr 2026 15:39:16 +0800
Message-ID: <87e0da16-2953-47b6-b6d7-329873c22248@huawei.com>
Date: Wed, 15 Apr 2026 15:39:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arch/riscv: Add bitrev.h file to support rev8 and brev8
To: <cp0613@linux.alibaba.com>
CC: <akpm@linux-foundation.org>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<palmer@dabbelt.com>, <pjw@kernel.org>
References: <150bfb90-ec49-7209-b841-2e48ca12b370@huawei.com>
 <20260413122817.122787-1-cp0613@linux.alibaba.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260413122817.122787-1-cp0613@linux.alibaba.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_003931_543195_7A00190F 
X-CRM114-Status: GOOD (  15.92  )
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

CgpPbiA0LzEzLzIwMjYgODoyOCBQTSwgY3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tIHdyb3RlOgo+
IE9uIFNhdCwgMTEgQXByIDIwMjYgMTA6NDg6MTcgKzA4MDAsIHJ1YW5qaW5qaWVAaHVhd2VpLmNv
bSB3cm90ZToKPiAKPj4+PiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+Pj4gKyNpbmNsdWRl
IDxhc20vY3B1ZmVhdHVyZS1tYWNyb3MuaD4KPj4+PiArI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+
Pj4+ICsKPj4+PiArZXh0ZXJuIHU4IGNvbnN0IGJ5dGVfcmV2X3RhYmxlWzI1Nl07Cj4+Pj4gK3N0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgX19hdHRyaWJ1dGVfY29uc3RfXyB1MzIgX19hcmNoX2JpdHJl
djMyKHUzMiB4KQo+Pj4+ICt7Cj4+Pj4gKyBpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNB
X1pCS0IpICYmCj4+Pj4gKyAgICAgcmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNB
X0VYVF9aQktCKSkgewo+Pj4+ICsgIHVuc2lnbmVkIGxvbmcgcmVzdWx0ID0geDsKPj4+PiArCj4+
Pj4gKyAgYXNtIHZvbGF0aWxlKAo+Pj4+ICsgICAiLm9wdGlvbiBwdXNoXG4iCj4+Pj4gKyAgICIu
b3B0aW9uIGFyY2gsK3pia2JcbiIKPj4+PiArICAgInJldjggJTAsICUwXG4iCj4+Pj4gKyAgICJi
cmV2OCAlMCwgJTBcbiIKPj4+PiArICAgIi5vcHRpb24gcG9wIgo+Pj4+ICsgICA6ICIrciIgKHJl
c3VsdCkKPj4+PiArICApOwo+Pj4+ICsKPj4+PiArICBpZiAoX19yaXNjdl94bGVuID09IDY0KQo+
Pj4+ICsgICByZXR1cm4gKHUzMikocmVzdWx0ID4+IDMyKTsKPj4+PiArCj4+Pj4gKyAgcmV0dXJu
ICh1MzIpcmVzdWx0Owo+Pj4+ICsgfQo+Pj4+ICsKPj4+PiArIHJldHVybiAodTMyKWJ5dGVfcmV2
X3RhYmxlW3ggJiAweGZmXSA8PCAyNCB8Cj4+Pj4gKyAgICAgICAgKHUzMilieXRlX3Jldl90YWJs
ZVsoeCA+PiA4KSAmIDB4ZmZdIDw8IDE2IHwKPj4+PiArICAgICAgICAodTMyKWJ5dGVfcmV2X3Rh
YmxlWyh4ID4+IDE2KSAmIDB4ZmZdIDw8IDggfAo+Pj4+ICsgICAgICAgICh1MzIpYnl0ZV9yZXZf
dGFibGVbeCA+PiAyNF07Cj4+Pj4gK30KPj4+Cj4+PiBIaSBKaW5qaWUsCj4+Pgo+Pj4gVGhhbmtz
IGZvciB5b3VyIHBhdGNoLiBJIGhhdmUgdHdvIHN1Z2dlc3Rpb25zLgo+Pj4gMS4gV2hlbiBaQktC
IGlzIG5vdCBzdXBwb3J0ZWQsIGlzIGl0IHNpbXBsZXIgdG8gZGlyZWN0bHkgdXNlIHRoZSBnZW5l
cmljCj4+PiBpbXBsZW1lbnRhdGlvbiBfX2JpdHJldjMyIGluIDxsaW51eC9iaXRyZXYuaD4uCj4+
Cj4+IEFjdHVhbGx5LCB5b3UgY2FuJ3Qgc2ltcGx5IHVzZSB0aGUgZGVmYXVsdCBpbXBsZW1lbnRh
dGlvbiBmcm9tCj4+IGxpbnV4L2JpdHJldi5oLiBJdCBpbmNsdWRlcyBhc20vYml0cmV2LmggKHRo
ZSBhcmNoaXRlY3R1cmUtc3BlY2lmaWMKPj4gaW1wbGVtZW50YXRpb24pLCB3aGljaCB3b3VsZCBs
ZWFkIHRvIGNvbXBpbGF0aW9uIGlzc3Vlcy4gRnVydGhlcm1vcmUsCj4+IHdoZW4gWkJLQiBpcyBu
b3Qgc3VwcG9ydGVkLCBjdXJyZW50IGltcGxlbWVudGF0aW9uIGlzIGlkZW50aWNhbCB0byB0aGUK
Pj4gZGVmYXVsdCBvbmUuCj4gCj4gVW5kZXJzdG9vZC4gU28sIGhhdmUgeW91IGNvbnNpZGVyZWQg
cmVuYW1pbmcgdGhlIGZ1bmN0aW9uIHRvIGBnZW5lcmljX3h4eGAsCj4gbGlrZSBgZ2VuZXJpY19f
X2Zmc2AgaW4gYml0b3BzPwoKWW91IGFyZSByaWdodCEgSSdsbCB0cnkgZG9pbmcgaXQgdGhpcyB3
YXkuCgo+IAo+Pj4gMi4gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIGEgYmVuY2htYXJrIHRlc3Qg
Y2FzZSB0byBpbGx1c3RyYXRlIHRoZQo+Pj4gcGVyZm9ybWFuY2UgY29tcGFyaXNvbiB3aXRoIGFu
ZCB3aXRob3V0IHRoaXMgZXh0ZW5zaW9uIChyZWZlciB0bwo+Pj4gdGVzdF9iaXRvcHMuYykgYW5k
IGFsc28gcHJvdmlkZSB0aGUgcmVzdWx0cyBieSBibG9hdC1vLW1ldGVyLgo+Pgo+PiBJIGRvbid0
IGhhdmUgYWNjZXNzIHRvIFJJU0MtViBoYXJkd2FyZSBhdCB0aGUgbW9tZW50LCBzbyBJJ3ZlIG9u
bHkKPj4gcGVyZm9ybWVkIGJhc2ljIGZ1bmN0aW9uYWwgdGVzdGluZyBvbiBRRU1VLCB3aGljaCBj
b21wbGV0ZWQgd2l0aG91dAo+PiBpc3N1ZXPvvIxjb3VsZCB5b3UgcGxlYXNlIGhlbHAgcnVuIHNv
bWUgYmVuY2htYXJrcyB0byB2ZXJpZnkgdGhlIHBlcmZvcm1hbmNlPwo+IAo+IEkgZG9uJ3QgY3Vy
cmVudGx5IGhhdmUgdGhlIGhhcmR3YXJlIHRoYXQgc3VwcG9ydHMgdGhlIGNvcnJlc3BvbmRpbmcg
ZXh0ZW5zaW9uLAo+IGJ1dCBJIGNhbiB0ZXN0IGl0IHVzaW5nIGFuIEZQR0EgZW52aXJvbm1lbnQg
d2hlbiBJIGhhdmUgdGhlIG9wcG9ydHVuaXR5IChpdAo+IHdpbGwgdGFrZSBzb21lIHRpbWUpLgoK
VGhhbmsgeW91IHZlcnkgbXVjaCEKCj4gCj4+IFRoYW5rcywKPj4gSmluamllCj4+Cj4+Pgo+Pj4g
VGhhbmtzLAo+Pj4gUGVpCj4gCj4gVGhhbmtzLAo+IFBlaQoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
