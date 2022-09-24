Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DCCC04A95
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Sep 2022 01:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ziKVOYSIFRwD/4ZWHwJkSankMlRCrgrs9xRDi/4fxI8=; b=SUaUHfaksG3/9A
	SGXb2ELTC6wM6nQrRqwbjbq0Id/Z5SC1VSa91tw+koU66MoaLzIm1USaEdFdliHD1lodio3vv1Tlj
	qSqUuI7XqTXFon2LKwUUnKiPBYeur+DzwZQ5HaQ7eD4r6DhwePPlnsV5xJr9tpYhguaTq58IZAFxO
	sAjdpLlIMvUZN6zzVEyjLtqY9A3KcI1I6CFc9zW1dwCh3KGivpmQmArOy+9OXPm/qtIIJwwdq9Jl4
	FOuISaly6RmQ5CiHRkn/qgLVzzDM7HJQLEhNQ0SGu+/yU3RjVj5e/HKg0+qwHu+K72EqyyR3VCj5L
	weoDw1h2eG7pwFifmPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obuLn-00674Y-Cm; Sat, 24 Sep 2022 01:53:03 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obuLa-006721-Bw; Sat, 24 Sep 2022 01:52:53 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MZBmT4r3qzHqM9;
	Sat, 24 Sep 2022 09:50:17 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 24 Sep 2022 09:52:29 +0800
Message-ID: <19ffdae6-8484-08e5-f408-ab39a97ce5c0@huawei.com>
Date: Sat, 24 Sep 2022 09:52:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching
 single-step slot
To: Mark Rutland <mark.rutland@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>, <maz@kernel.org>,
	<alexandru.elisei@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-csky@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20220923084658.99304-1-liaochang1@huawei.com>
 <20220923084658.99304-4-liaochang1@huawei.com>
 <Yy2pAEvWKVloVr3U@FVFF77S0Q05N>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <Yy2pAEvWKVloVr3U@FVFF77S0Q05N>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_185250_795309_01ADB29A 
X-CRM114-Status: GOOD (  19.62  )
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

CgrlnKggMjAyMi85LzIzIDIwOjM5LCBNYXJrIFJ1dGxhbmQg5YaZ6YGTOgo+IE9uIEZyaSwgU2Vw
IDIzLCAyMDIyIGF0IDA0OjQ2OjU4UE0gKzA4MDAsIExpYW8gQ2hhbmcgd3JvdGU6Cj4+IFNpbmds
ZS1zdGVwIHNsb3Qgd291bGQgbm90IGJlIHVzZWQgdW50aWwga3Byb2JlIGlzIGVuYWJsZWQsIHRo
YXQgbWVhbnMKPj4gbm8gcmFjZSBjb25kaXRpb24gb2NjdXJzIG9uIGl0IHVuZGVyIFNNUCwgaGVu
Y2UgaXQgaXMgc2FmZSB0byBwYWN0aCBzcwo+PiBzbG90IHdpdGhvdXQgc3RvcHBpbmcgbWFjaGlu
ZS4KPiAKPiBJIHRoaW5rIHRoaXMgaXMgY29ycmVjdCwgYnV0IHRoaXMgZGVwZW5kcyBvbiBhIGNv
dXBsZSBvZiBzdWJ0bGV0aWVzLAo+IGltcG9ydGFudGx5Ogo+IAo+ICogVGhhdCB0aGUgSS1jYWNo
ZSBtYWludGVuYW5jZSBmb3IgdGhlc2UgaW5zdHJ1Y3Rpb25zIGlzIGNvbXBsZXRlICpiZWZvcmUq
IHRoZQo+ICAga3Byb2JlIEJSSyBpcyB3cml0dGVuIChhbmQgYWFyY2g2NF9pbnNuX3BhdGNoX3Rl
eHRfbm9zeW5jKCkgZW5zdXJlcyB0aGlzLCBidXQKPiAgIGp1c3Qgb21pdHMgY2F1c2luZyBhIENv
bnRleHQtU3luY2hyb25pemF0aW9uLUV2ZW50IG9uIGFsbCBDUFVTKS4KClNvIGluIG9yZGVyIHRv
IGd1YXJhbnRlZSB0aGUgSS1jYWNoZSBtYWludGVuYW5jZSBpcyBvYnNlcnZlZCBvbiBhbGwgQ1BV
UywKaXQgbmVlZHMgdG8gYmUgZm9sbG93ZWQgYnkgYSBleHBsaWNpdCBDb250ZXh0LVN5bmNocm9u
aXphdGlvbi1FdmVudCwgcGVyaGFwcwppdCBpcyBiZXR0ZXIgdG8gcGxhY2UgSVNCIGJlZm9yZSBr
cHJvYmUgQlJLIGlzIHdyaXR0ZW4uCgo+IAo+ICogVGhhdCB0aGUga3Byb2JlIEJSSyByZXN1bHRz
IGluIGFuIGV4Y2VwdGlvbiAoYW5kIGNvbnNlcXVlbnRseSBhCj4gICBDb250ZXh0LVN5bmNocm9u
b2l6YXRpb24tRXZlbnQpLCB3aGljaCBlbnN1cmVzIHRoYXQgdGhlIENQVSB3aWxsIGZldGNoIHRo
ZQo+ICAgc2luZ2xlLXN0ZXAgc2xvdCBpbnN0cnVjdGlvbnMgKmFmdGVyKiB0aGlzLCBlbnN1cmlu
ZyB0aGF0IHRoZSBuZXcKPiAgIGluc3RydWN0aW9ucyBhcmUgdXNlZC4KClllcywgYmVjYXVzZSBv
ZiBzaW5nbGUtc3RlcCBzbG90IGlzIGluc3RhbGxlZCBpbnQgdGhlIEJSSyBleGVjcHRpb24gaGFu
ZGxlciwKc28gaXQgaXMgbm90IG5lY2Vzc2FyeSB0byBnZW5lcmF0ZSBDb250ZXh0LVN5bmNocm9u
aXphdGlvbi1FdmVudCB2aWEgSVNCIG1lbnRpb25lZCBhYm92ZS4uLgoKVGhhbmtzLgoKPiAKPiBJ
dCB3b3VsZCBiZSBnb29kIGlmIHdlIGNvdWxkIGNhbGwgdGhhdCBvdXQgZXhwbGljaXRseS4KPiAK
PiBUaGFua3MsCj4gTWFyay4KPiAKPj4gU2luY2UgSSBhbmQgRCBjYWNoZXMgYXJlIGNvaGVyZW50
IHdpdGhpbiBzaW5nbGUtc3RlcCBzbG90IGZyb20KPj4gYWFyY2g2NF9pbnNuX3BhdGNoX3RleHRf
bm9zeW5jKCksIGhlbmNlIG5vIG5lZWQgdG8gZG8gaXQgYWdhaW4gdmlhCj4+IGZsdXNoX2ljYWNo
ZV9yYW5nZSgpLgo+Pgo+PiBBY2tlZC1ieTogTWFzYW1pIEhpcmFtYXRzdSAoR29vZ2xlKSA8bWhp
cmFtYXRAa2VybmVsLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogTGlhbyBDaGFuZyA8bGlhb2NoYW5n
MUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gIGFyY2gvYXJtNjQva2VybmVsL3Byb2Jlcy9rcHJvYmVz
LmMgfCA3ICsrLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3By
b2Jlcy5jIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+PiBpbmRleCBkMWQx
ODIzMjAyNDUuLjI5Yjk4YmMxMjgzMyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwv
cHJvYmVzL2twcm9iZXMuYwo+PiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jl
cy5jCj4+IEBAIC00NCwxMyArNDQsMTAgQEAgcG9zdF9rcHJvYmVfaGFuZGxlcihzdHJ1Y3Qga3By
b2JlICosIHN0cnVjdCBrcHJvYmVfY3RsYmxrICosIHN0cnVjdCBwdF9yZWdzICopOwo+PiAgc3Rh
dGljIHZvaWQgX19rcHJvYmVzIGFyY2hfcHJlcGFyZV9zc19zbG90KHN0cnVjdCBrcHJvYmUgKnAp
Cj4+ICB7Cj4+ICAJa3Byb2JlX29wY29kZV90ICphZGRyID0gcC0+YWluc24uYXBpLmluc247Cj4+
IC0Jdm9pZCAqYWRkcnNbXSA9IHthZGRyLCBhZGRyICsgMX07Cj4+IC0JdTMyIGluc25zW10gPSB7
cC0+b3Bjb2RlLCBCUks2NF9PUENPREVfS1BST0JFU19TU307Cj4+ICAKPj4gIAkvKiBwcmVwYXJl
IGluc24gc2xvdCAqLwo+PiAtCWFhcmNoNjRfaW5zbl9wYXRjaF90ZXh0KGFkZHJzLCBpbnNucywg
Mik7Cj4+IC0KPj4gLQlmbHVzaF9pY2FjaGVfcmFuZ2UoKHVpbnRwdHJfdClhZGRyLCAodWludHB0
cl90KShhZGRyICsgTUFYX0lOU05fU0laRSkpOwo+PiArCWFhcmNoNjRfaW5zbl9wYXRjaF90ZXh0
X25vc3luYyhhZGRyLCBwLT5vcGNvZGUpOwo+PiArCWFhcmNoNjRfaW5zbl9wYXRjaF90ZXh0X25v
c3luYyhhZGRyICsgMSwgQlJLNjRfT1BDT0RFX0tQUk9CRVNfU1MpOwo+PiAgCj4+ICAJLyoKPj4g
IAkgKiBOZWVkcyByZXN0b3Jpbmcgb2YgcmV0dXJuIGFkZHJlc3MgYWZ0ZXIgc3RlcHBpbmcgeG9s
Lgo+PiAtLSAKPj4gMi4xNy4xCj4+Cj4gCj4gLgoKLS0gCkJSLApMaWFvLCBDaGFuZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
