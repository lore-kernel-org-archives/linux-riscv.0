Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86F8C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 07:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnHxURlrIaLXGEUw4dK3DS916rsaqEib2BW3TWWLBTw=; b=lf4obfWZMrDWg1
	yDyWzaKwdETefYgVYqUxdBHzFdUgPxur6o1iXLrK3cf/VOBJ2P/Q3laQwCbT39pCS4setaiJkblC0
	FPE+bxVk/TjROb552KoA8GAAf9eUwPpPib6+YYAZhudI4D/wBb8sUTujpaxOMpd3Hp2lVKiP6YckH
	4VQZhjH00ey06dVwfnBI5NFawtSY6z9X2XnHhqyHc/Mcm3SWd5NS6EceuhhXeQ9l1V17qsAGW7cmY
	GFVlZcV9QqpKIkcn3NrzfA8K7r0wzHFQXlZpNRZ1mBGhptSnIiDRcBwLvLoxklw60N9CkVorHEMXv
	81kb0ZTdxjHRvfLARU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXyY-008g0C-3f; Mon, 27 Feb 2023 07:31:10 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWXyU-008fxt-Te
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 07:31:09 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PQBwt0KKhzrSJV;
	Mon, 27 Feb 2023 15:30:22 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Feb 2023 15:30:27 +0800
Message-ID: <42e9b829-196b-25b2-7c10-c64748af25d9@huawei.com>
Date: Mon, 27 Feb 2023 15:30:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf v2] riscv, bpf: fix patch_text implicit declaration
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, <linux-kernel@vger.kernel.org>
CC: kernel test robot <lkp@intel.com>, Luke Nelson <luke.r.nels@gmail.com>, Xi
 Wang <xi.wang@gmail.com>, <bpf@vger.kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend
	<john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230227072016.14618-1-rdunlap@infradead.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20230227072016.14618-1-rdunlap@infradead.org>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_233107_150029_E071C155 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMDIzLzIvMjcgMTU6MjAsIFJhbmR5IER1bmxhcCB3cm90ZToKPiBicGZfaml0X2NvbXA2
NC5jIHVzZXMgcGF0Y2hfdGV4dCgpLCBzbyBhZGQgPGFzbS9wYXRjaC5oPiB0byBpdAo+IHRvIHBy
ZXZlbnQgdGhlIGJ1aWxkIGVycm9yOgo+IAo+IC4uL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29t
cDY0LmM6IEluIGZ1bmN0aW9uICdicGZfYXJjaF90ZXh0X3Bva2UnOgo+IC4uL2FyY2gvcmlzY3Yv
bmV0L2JwZl9qaXRfY29tcDY0LmM6NjkxOjIzOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YgZnVuY3Rpb24gJ3BhdGNoX3RleHQnOyBkaWQgeW91IG1lYW4gJ3BhdGhfZ2V0Jz8gWy1XZXJy
b3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICAgNjkxIHwgICAgICAgICAgICAg
ICAgIHJldCA9IHBhdGNoX3RleHQoaXAsIG5ld19pbnNucywgbmluc25zKTsKPiAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fgo+IAo+IEZpeGVzOiA1OTZmMmU2ZjljZjQg
KCJyaXNjdiwgYnBmOiBBZGQgYnBmX2FyY2hfdGV4dF9wb2tlIHN1cHBvcnQgZm9yIFJWNjQiKQo+
IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IFJl
cG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMwMjI3MTAwMC5BajRuTVhiWi1sa3BAaW50ZWwuY29t
Cj4gQ2M6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4gQ2M6IEx1a2UgTmVsc29uIDxs
dWtlLnIubmVsc0BnbWFpbC5jb20+Cj4gQ2M6IFhpIFdhbmcgPHhpLndhbmdAZ21haWwuY29tPgo+
IENjOiBicGZAdmdlci5rZXJuZWwub3JnCj4gQ2M6IEFsZXhlaSBTdGFyb3ZvaXRvdiA8YXN0QGtl
cm5lbC5vcmc+Cj4gQ2M6IERhbmllbCBCb3JrbWFubiA8ZGFuaWVsQGlvZ2VhcmJveC5uZXQ+Cj4g
Q2M6IEpvaG4gRmFzdGFiZW5kIDxqb2huLmZhc3RhYmVuZEBnbWFpbC5jb20+Cj4gQ2M6IEFuZHJp
aSBOYWtyeWlrbyA8YW5kcmlpQGtlcm5lbC5vcmc+Cj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwu
d2FsbXNsZXlAc2lmaXZlLmNvbT4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0
LmNvbT4KPiBDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+Cj4gQ2M6ICJCasO2
cm4gVMO2cGVsIiA8Ympvcm5Aa2VybmVsLm9yZz4KPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IC0tLQo+IHYyOiBhZGQgaGVhZGVyIGZpbGUgZGlyZWN0bHkgdG8gYnBmX2pp
dF9jb21wNjQuYyAoUHUgTGVodWkpCj4gICAgICBjaGFuZ2UgcGF0Y2ggdGFyZ2V0IHRvIGJwZiAo
Zm9yIGZpeGVzKQo+IAo+ICAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8ICAgIDEg
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLSBhL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2
NC5jCj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ICsrKyBiL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBAQCAtMTAsNiArMTAsNyBAQAo+ICAgI2luY2x1
ZGUgPGxpbnV4L2ZpbHRlci5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L21lbW9yeS5oPgo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3N0b3BfbWFjaGluZS5oPgo+ICsjaW5jbHVkZSA8YXNtL3BhdGNoLmg+Cj4g
ICAjaW5jbHVkZSAiYnBmX2ppdC5oIgo+ICAgCj4gICAjZGVmaW5lIFJWX1JFR19UQ0MgUlZfUkVH
X0E2CgpBY2tlZC1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
