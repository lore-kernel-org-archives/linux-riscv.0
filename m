Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C046BC3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 18:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LStvCxKKeyuy2Sgi7aV9IsS7Ick1nEP2E8ALsij+Ng=; b=ZpPAJfMZoxqLHL
	ojMhJ0/SPeEkjmDB+EjcypWY0Mq7H1y8PoaflmHdaooBYkmsHHGKOmiVQqT5kSqbhA4++Sb5Ac2Yx
	48KXFpbmtSE1inzz6wdd6mzCchWLQhyHg/8Q0hpBYYaqCip+a9SU5sYDjT9TVkIbYxa4fxE8myYA/
	mfHv+pKoYlhvdRa1NneWUp+89KrsamUEk4fE3wK9Pn7AhuVP05TXiaTt/fxrFiEIL+qT3FAVOuYrV
	hz9Ch6jUjC7/NxYU9mSiuCLh9lYuor+iep/nwIH/QLciWUvmYaABVgOd9lDLhleu5ASj1HI+Y/71v
	YmvF43c4oXli5Kdo5uRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVAn-00DkLQ-O9; Thu, 05 Jan 2023 18:41:05 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDEOe-00EyBZ-60
	for linux-riscv@lists.infradead.org; Thu, 05 Jan 2023 00:46:24 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NnSR7612czRqtm;
	Thu,  5 Jan 2023 08:44:35 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 5 Jan 2023 08:46:08 +0800
Message-ID: <4062e65d-f411-bc01-d789-afee3c4b5b99@huawei.com>
Date: Thu, 5 Jan 2023 08:46:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 7/9] riscv/kprobe: Prepare detour buffer for optimized
 kprobe
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Chen Guokai
	<chenguokai17@mails.ucas.ac.cn>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <sfr@canb.auug.org.au>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-8-chenguokai17@mails.ucas.ac.cn>
 <87r0wcvmn1.fsf@all.your.base.are.belong.to.us>
 <088ed826-59a8-37a3-401e-2ed022a4a097@huawei.com>
 <87sfgqr7d4.fsf@all.your.base.are.belong.to.us>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <87sfgqr7d4.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_164621_628280_2DA26567 
X-CRM114-Status: UNSURE (   7.53  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMy8xLzQgMTc6MTIsIEJqw7ZybiBUw7ZwZWwg5YaZ6YGTOgo+ICJsaWFvY2hhbmcg
KEEpIiA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPiB3cml0ZXM6Cj4gCj4+Pj4gK1NZTV9FTlRSWShv
cHRwcm9iZV90ZW1wbGF0ZV9pbnNuLCBTWU1fTF9HTE9CQUwsIFNZTV9BX05PTkUpCj4+Pj4gKwkv
Kgo+Pj4+ICsJICogU3RlcDM6Cj4+Pj4gKwkgKiBOT1BTIHdpbGwgYmUgcmVwbGFjZWQgYnkgdGhl
IHByb2JlZCBpbnN0cnVjdGlvbiwgYXQgd29yc3QgY2FzZSAzIFJWQwo+Pj4+ICsJICogYW5kIDEg
UlZJIGluc3RydWN0aW9ucyBpcyBhYm91dCB0byBleGVjdXRlIG91dCBvZiBsaW5lLgo+Pj4+ICsJ
ICovCj4+Pj4gKwlub3AKPj4+Cj4+PiBBIG5vcCBoZXJlIHdpbGwgYmUgZWl0aGVyIGEgY29tcHJl
c3NlZCBub3Agb3IgYSBub24tY29tcHJlc3NlZCwKPj4+IGRlcGVuZGluZyBvbiB0aGUgYnVpbGQg
KEMtZW5hYmxlZCBvciBub3QpLCByaWdodD8gTWF5YmUgYmUgZXhwbGljaXQgdG8KPj4+IHRoZSBh
c3NlbWJsZXIgd2hhdCB5b3Ugd2FudD8KPj4+Cj4+Cj4+IFlvdSBhcmUgcmlnaHQsIGlmIENPTkZJ
R19SSVNDVl9JU0FfQyBpcyBkaXNhYmxlZCwgdHdvIE5PUCBpcyBlbm91Z2ggZm9yIDIgUlZJIGV4
ZWN1dGUgb3V0IG9mIGxpbmUsCj4+IGlmIENPTkZJR19SSVNDVl9JU0FfQyBpcyBlbmFibGVkLCBp
dCBuZWVkcyBlaWdodCBDLk5PUCBoZXJlIGZvciB0aGUgd29yc3QgY2FzZSAoMyBSVkMgKyAxIFJW
SSkuCj4+Cj4+IEkgd2lsbCB1c2Uge0N9Lk5PUCBleHBsaWNpdGx5IGZvciBkaWZmZXJlbnQgY29u
ZmlndXJlIGluIG5leHQgcmV2aXNpb24sIHRoYW5rcy4KPiAKPiBXaGF0IEkgbWVhbnQgd2FzIHRo
YXQgIm5vcCIgY2FuIGV4cGFuZCB0byBjb21wcmVzc2VkIGluc3RydWN0aW9ucywgYW5kCj4geW91
IHNob3VsZCBiZSBleHBsaWNpdC4gU28geW91IGtub3cgaG93IGl0J3MgZXhwYW5kZWQgYnkgdGhl
Cj4gY29tcGlsZXIvYXNzZW1ibGVyLgo+IAo+IEFuIGV4YW1wbGU6Cj4gCj4gJCBjYXQgYmFyLlMK
PiAJLnRleHQKPiBiYXI6Cj4gCW5vcAo+IAlub3AKPiAkIHJpc2N2NjQtbGludXgtZ251LWdjYyAt
TzIgLW8gYmFyLm8gLWMgYmFyLlMgJiYgcmlzY3Y2NC1saW51eC1nbnUtb2JqZHVtcCAtTSBuby1h
bGlhc2VzIC1kIGJhci5vCj4gCj4gYmFyLm86ICAgICBmaWxlIGZvcm1hdCBlbGY2NC1saXR0bGVy
aXNjdgo+IAo+IAo+IERpc2Fzc2VtYmx5IG9mIHNlY3Rpb24gLnRleHQ6Cj4gCj4gMDAwMDAwMDAw
MDAwMDAwMCA8YmFyPjoKPiAgICAwOgkwMDAxICAgICAgICAgICAgICAgIAljLmFkZGkJemVybyww
Cj4gICAgMjoJMDAwMSAgICAgICAgICAgICAgICAJYy5hZGRpCXplcm8sMAo+IAo+IAo+IHZzCj4g
Cj4gJCBjYXQgZm9vLlMKPiAJLnRleHQKPiBmb286Cj4gCS5vcHRpb24gbm9ydmMKPiAJbm9wCj4g
CW5vcAo+IAo+ICQgcmlzY3Y2NC1saW51eC1nbnUtZ2NjIC1PMiAtbyBmb28ubyAtYyBmb28uUyAm
JiByaXNjdjY0LWxpbnV4LWdudS1vYmpkdW1wIC1NIG5vLWFsaWFzZXMgLWQgZm9vLm8KPiAKPiBm
b28ubzogICAgIGZpbGUgZm9ybWF0IGVsZjY0LWxpdHRsZXJpc2N2Cj4gCj4gCj4gRGlzYXNzZW1i
bHkgb2Ygc2VjdGlvbiAudGV4dDoKPiAKPiAwMDAwMDAwMDAwMDAwMDAwIDxmb28+Ogo+ICAgIDA6
CTAwMDAwMDEzICAgICAgICAgIAlhZGRpCXplcm8semVybywwCj4gICAgNDoJMDAwMDAwMTMgICAg
ICAgICAgCWFkZGkJemVybyx6ZXJvLDAKCkFib3ZlIGV4YW1wbGVzIGFyZSB2ZXJ5IGNsZWFyLCBp
IHdpbGwgdXNlIHRoZXNlIGV4cGFuZWQgaW5zdHJ1Y3Rpb25zIGluIG5leHQgcmV2aXNpb24sIHRo
YW5rcy4KCj4gCj4gCj4gQmrDtnJuCgotLSAKQlIsCkxpYW8sIENoYW5nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
