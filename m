Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1295C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 06:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IGbEBm/RGla7OJyhf0kSqzcEaOvnyvsc8aAhSITJmM=; b=L/3vO8hXvlXdIw
	DM6f5+y1sucK+X/qlepOiRU/TFfLRJpsjxugBPyjfwXNQRjMiqb5HFf9de7IBeh4zNW35uRnL3QHt
	eEawty2w26jmbUl/b6ontdXhqGUG20x+/F2okgs26xbV4qv5oNec1Xjkl5Ia3nK+CiSZ5ShpRWbXN
	LmOuXFv7xDrJsDkoxBPCw7PI62cIWmNhQ8wBy6wzVBP3s5Y0RZbHolf+bo+ERInY9vzC1nwVQRQ+Z
	8uKILSjEeCF5Xp7XRb5OaIrePODiFGl5l55ot9t6asnqdC5Sv34pHDsWh4osp4SbUSf45+MmfTY2m
	C0BGr8DsqNhdtCnO8BWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXMo-008boq-9C; Mon, 27 Feb 2023 06:52:10 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXMk-008bms-6z
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 06:52:08 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PQ9yh0s8mzKmQN;
	Mon, 27 Feb 2023 14:46:52 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Feb 2023 14:51:47 +0800
Message-ID: <6a2193be-70db-1681-7e4b-ff12f4c56d4b@huawei.com>
Date: Mon, 27 Feb 2023 14:51:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next] riscv, bpf: fix patch_text implicit declaration
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
CC: kernel test robot <lkp@intel.com>, Luke Nelson <luke.r.nels@gmail.com>, Xi
 Wang <xi.wang@gmail.com>, <bpf@vger.kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
	<john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230227040221.15442-1-rdunlap@infradead.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20230227040221.15442-1-rdunlap@infradead.org>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_225206_476136_21623472 
X-CRM114-Status: GOOD (  11.23  )
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

CgpPbiAyMDIzLzIvMjcgMTI6MDIsIFJhbmR5IER1bmxhcCB3cm90ZToKPiBicGZfaml0X2NvbXA2
NC5jIHVzZXMgcGF0Y2hfdGV4dCgpLCBzbyBhZGQgaXQgdG8gYSBsb2NhbCBoZWFkZXIgZmlsZQo+
IHRvIHByZXZlbnQgdGhlIGJ1aWxkIGVycm9yOgo+IAo+IC4uL2FyY2gvcmlzY3YvbmV0L2JwZl9q
aXRfY29tcDY0LmM6IEluIGZ1bmN0aW9uICdicGZfYXJjaF90ZXh0X3Bva2UnOgo+IC4uL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmM6NjkxOjIzOiBlcnJvcjogaW1wbGljaXQgZGVjbGFy
YXRpb24gb2YgZnVuY3Rpb24gJ3BhdGNoX3RleHQnOyBkaWQgeW91IG1lYW4gJ3BhdGhfZ2V0Jz8g
Wy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAgNjkxIHwgICAgICAg
ICAgICAgICAgIHJldCA9IHBhdGNoX3RleHQoaXAsIG5ld19pbnNucywgbmluc25zKTsKPiAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fgo+IAo+IEZpeGVzOiA1OTZmMmU2
ZjljZjQgKCJyaXNjdiwgYnBmOiBBZGQgYnBmX2FyY2hfdGV4dF9wb2tlIHN1cHBvcnQgZm9yIFJW
NjQiKQo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3Jn
Pgo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwMjI3MTAwMC5BajRuTVhiWi1sa3BAaW50
ZWwuY29tCj4gQ2M6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4gQ2M6IEx1a2UgTmVs
c29uIDxsdWtlLnIubmVsc0BnbWFpbC5jb20+Cj4gQ2M6IFhpIFdhbmcgPHhpLndhbmdAZ21haWwu
Y29tPgo+IENjOiBicGZAdmdlci5rZXJuZWwub3JnCj4gQ2M6IEFsZXhlaSBTdGFyb3ZvaXRvdiA8
YXN0QGtlcm5lbC5vcmc+Cj4gQ2M6IERhbmllbCBCb3JrbWFubiA8ZGFuaWVsQGlvZ2VhcmJveC5u
ZXQ+Cj4gQ2M6IEpvaG4gRmFzdGFiZW5kIDxqb2huLmZhc3RhYmVuZEBnbWFpbC5jb20+Cj4gQ2M6
IEFuZHJpaSBOYWtyeWlrbyA8YW5kcmlpQGtlcm5lbC5vcmc+Cj4gQ2M6IFBhdWwgV2FsbXNsZXkg
PHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4KPiBDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+Cj4gQ2M6
ICJCasO2cm4gVMO2cGVsIiA8Ympvcm5Aa2VybmVsLm9yZz4KPiBDYzogbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IC0tLQo+IFdoYXQgaXMgdGhlIHByb3BlciBwYXRoIHRvIGhhdmUg
dGhpcyBtZXJnZWQgc29vbiB0byBzdG9wIGJ1aWxkCj4gZXJyb3JzPwo+IAo+ICAgYXJjaC9yaXNj
di9uZXQvYnBmX2ppdC5oIHwgICAgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKPiAKPiBkaWZmIC0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oIGIvYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdC5oCj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4gKysrIGIvYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4gQEAgLTEyLDYgKzEyLDcgQEAKPiAgICNpbmNsdWRlIDxs
aW51eC9icGYuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9maWx0ZXIuaD4KPiAgICNpbmNsdWRlIDxh
c20vY2FjaGVmbHVzaC5oPgo+ICsjaW5jbHVkZSA8YXNtL3BhdGNoLmg+Cj4gICAKClRoYW5rcyBS
YW5keS4gU2luY2UgcGF0Y2hfdGV4dCBpcyBvbmx5IHVzZWQgaW4gcmlzY3Y2NCBhdCBwcmVzZW50
LCBJIAp0aGluayBpdCBpcyBhcHByb3ByaWF0ZSB0byBhZGQgaXQgdG8gYXJjaC9yaXNjdi9uZXQv
YnBmX2ppdF9jb21wNjQuYwoKPiAgIHN0YXRpYyBpbmxpbmUgYm9vbCBydmNfZW5hYmxlZCh2b2lk
KQo+ICAgewoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
