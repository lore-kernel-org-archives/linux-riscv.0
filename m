Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCE3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 01:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpUAnV9ZHGPRldcDA+YigrM1AX0Pu9GSrnIAsU7y8v8=; b=cebBJ4AXVgNUGx
	PErNG3VtRBP1ZIhVvBAMONq8eaiHf+FI685qlYTa/Ib0onk7W+63OF9P9aUt+3X3GL/04ad9WfoVS
	U99/w3QibNYT+fMrpdZ3MNSuqMYZe+PtRhasuSiq3TaaP1hrNmNi/9nGATBoeuaJSdoiHouNRKtGN
	J5AL82srcNG6/nxCax/2VFTCliZTW2a4StbXHEHOtLcwPX9AYye1FEYbu5HpfuoVwB1KgLYWfC8pS
	RcPUn1NEi2K+/ZSRT9IIcC22riVUgW+n8elEOeSRNi8+boX9fLiAkmORabvNdXK+KWCQ5xG9mzPAm
	F3NVoUqfBCRhwBCi5SLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9dEC-00GlJx-P9; Tue, 18 Jan 2022 01:24:04 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9dE9-00GlJF-CL
 for linux-riscv@lists.infradead.org; Tue, 18 Jan 2022 01:24:03 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Jd9vd2rwmz8wPt;
 Tue, 18 Jan 2022 09:21:01 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 18 Jan 2022 09:23:49 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Tue, 18 Jan 2022 09:23:49 +0800
Message-ID: <f761c08e-c3d1-3101-38b8-aedd597531d6@huawei.com>
Date: Tue, 18 Jan 2022 09:23:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/1] RISC-V: Change signature header field to use `.ascii`
 instead of opcode
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>, Florian Wagner
 <florian.wagner@nextsilicon.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
 <yaron.dinkin@nextsilicon.com>
References: <20220117173941.3798325-1-florian.wagner@nextsilicon.com>
 <20220117173941.3798325-2-florian.wagner@nextsilicon.com>
 <98743A89-2871-434C-B17A-70EFE1D188CC@jrtc27.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <98743A89-2871-434C-B17A-70EFE1D188CC@jrtc27.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_172401_631963_11195C17 
X-CRM114-Status: GOOD (  13.26  )
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

Ck9uIDIwMjIvMS8xOCAyOjU5LCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiBPbiAxNyBKYW4gMjAy
MiwgYXQgMTc6MzksIEZsb3JpYW4gV2FnbmVyIDxmbG9yaWFuLndhZ25lckBuZXh0c2lsaWNvbi5j
b20+IHdyb3RlOgo+PiBUaGUgYE1aYCBpbiB0aGUgc2lnbmF0dXJlIGhlYWRlciBmaWVsZCBpcyBu
b3cgZW5jb2RlZCB2aWEgYC5hc2NpaWAgdG8gbWFrZQo+PiB0aGUga2VybmVsIGNvbXBpbGUgd2l0
aG91dCB0aGUgYGNgIGV4dGVuc2lvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRmxvcmlhbiBXYWdu
ZXIgPGZsb3JpYW4ud2FnbmVyQG5leHRzaWxpY29uLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWWFy
b24gRGlua2luIDx5YXJvbi5kaW5raW5AbmV4dHNpbGljb24uY29tPgo+PiAtLS0KPj4gYXJjaC9y
aXNjdi9rZXJuZWwvaGVhZC5TIHwgMiArLQo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2hl
YWQuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+PiBpbmRleCBmNTJmMDFlY2JlZWEuLjkz
MWI2MzQ2NGI5MCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+PiBAQCAtNDgsNyArNDgsNyBAQCBFTlRSWShf
c3RhcnQpCj4+IAkvKgo+PiAJICogVGhpcyBpbnN0cnVjdGlvbiBkZWNvZGVzIHRvICJNWiIgQVND
SUkgcmVxdWlyZWQgYnkgVUVGSS4KPj4gCSAqLwo+PiAtCWMubGkgczQsLTEzCj4+ICsJLmFzY2lp
ICJNWiIKPj4gCWogX3N0YXJ0X2tlcm5lbAo+IENPTkZJR19FRkkgaGFzIHNlbGVjdCBSSVNDVl9J
U0FfQywgc28gdGhpcyBkb2VzbuKAmXQgc2VlbSB0byBhY2hpZXZlCj4gYW55dGhpbmc/IElmIHlv
dSB0aGVuIHJlbW92ZSB0aGF0IHNlbGVjdCwgd2VsbCwgeW91IGdldCBhbiBFRkkgYmluYXJ5Cj4g
dGhhdCB3b3JrcywgYnV0IGlmIHlvdSBqdW1wIHRvIGl0IGRpcmVjdGx5IGFzIGEgbm9uLUVGSSBi
aW5hcnkgdGhlbgo+IHlvdeKAmWxsIHRyYXAgb24gYSBub24tUlZDIHN5c3RlbSBhcyB0aGF0IHdv
buKAmXQgYmUgYSB2YWxpZCBpbnN0cnVjdGlvbi4KPiBTbyBJIHRoaW5rIHRoaXMgbmVlZHMgbW9y
ZSBleHBsYW5hdGlvbiBhbmQgZGlzY3Vzc2lvbi4KCkkgc2VudCBhIHF1ZXN0aW9uWzFdIGJlZm9y
ZSwgYW5kIHRoZXJlIGFyZSBzb21lIGFkdmlzZXMgZnJvbSBBcm5kIGFuZCAKUGFsbWVyLgoKWzFd
IApodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8zNTBjNzQ1OC1jNzdiLTU2ZGUt
ZGU1ZS04Yzk2Y2U5YzE2YWVAaHVhd2VpLmNvbS8KCj4gSmVzcwo+Cj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
