Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC8BECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 01:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HgAhAqo8xEJx9Flye98xRo6jT9hYIvMe1fRGE7T064U=; b=j+6WbTtVGMTbkv
	Sp+Bt4Rb3EqCLyJGQcoqZwmJ1R9bkCwg+eV13yTIbfUPMyY66/70HG+b4h26UpWzBRyYn55QF9c9A
	W/W5Nd4hMak/hg6SbT0cgSyMSjwRkEoQwgqSiLCtiXkZkzhG3N0Sb0+MnemrEOCTEZ+3fJYVo8BOv
	MoyAU9lqyIeqBITOza+mrkeoMS8R3+LT7GxySTZ/NU1fpTTPaV8MEf2zTi9TJDyifQ2Qx8RcMfKIL
	XdLBSDnjgcmZLQdds89Dr3m9rlcr5DGmEh3aYrXoJZlmZhR/6hgQRg325kkmzpQhTgKQb5w2pIXRT
	0U3KweSZ737UT+xbP0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXbU-00122C-7i; Fri, 23 Sep 2022 01:35:44 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXRD-000z5S-0o; Fri, 23 Sep 2022 01:25:11 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYZ971SjTzWh5r;
	Fri, 23 Sep 2022 09:20:59 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 09:24:56 +0800
Message-ID: <55c32279-1a96-0a31-ca2b-ae4e34365625@huawei.com>
Date: Fri, 23 Sep 2022 09:24:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH V2 3/3] arm64/kprobe: Optimize the performance of patching
 single-step slot
To: Will Deacon <will@kernel.org>
CC: <catalin.marinas@arm.com>, <guoren@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<rostedt@goodmis.org>, <mhiramat@kernel.org>, <maz@kernel.org>,
	<alexandru.elisei@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-csky@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20220913033454.104519-1-liaochang1@huawei.com>
 <20220913033454.104519-4-liaochang1@huawei.com>
 <20220922133850.GC12095@willie-the-truck>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <20220922133850.GC12095@willie-the-truck>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_182507_307966_1025D42C 
X-CRM114-Status: GOOD (  12.84  )
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

CgrlnKggMjAyMi85LzIyIDIxOjM4LCBXaWxsIERlYWNvbiDlhpnpgZM6Cj4gT24gVHVlLCBTZXAg
MTMsIDIwMjIgYXQgMTE6MzQ6NTRBTSArMDgwMCwgTGlhbyBDaGFuZyB3cm90ZToKPj4gU2luZ2xl
LXN0ZXAgc2xvdCB3b3VsZCBub3QgYmUgdXNlZCB1bnRpbCBrcHJvYmUgaXMgZW5hYmxlZCwgdGhh
dCBtZWFucwo+PiBubyByYWNlIGNvbmRpdGlvbiBvY2N1cnMgb24gaXQgdW5kZXIgU01QLCBoZW5j
ZSBpdCBpcyBzYWZlIHRvIHBhY3RoIHNzCj4+IHNsb3Qgd2l0aG91dCBzdG9wcGluZyBtYWNoaW5l
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBMaWFvIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5jb20+
Cj4+IC0tLQo+PiAgYXJjaC9hcm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyB8IDUgKystLS0K
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIGIvYXJjaC9h
cm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+PiBpbmRleCBkMWQxODIzMjAyNDUuLjU5MDJl
MzNmZDNiNiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMu
Ywo+PiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4+IEBAIC00NCwx
MSArNDQsMTAgQEAgcG9zdF9rcHJvYmVfaGFuZGxlcihzdHJ1Y3Qga3Byb2JlICosIHN0cnVjdCBr
cHJvYmVfY3RsYmxrICosIHN0cnVjdCBwdF9yZWdzICopOwo+PiAgc3RhdGljIHZvaWQgX19rcHJv
YmVzIGFyY2hfcHJlcGFyZV9zc19zbG90KHN0cnVjdCBrcHJvYmUgKnApCj4+ICB7Cj4+ICAJa3By
b2JlX29wY29kZV90ICphZGRyID0gcC0+YWluc24uYXBpLmluc247Cj4+IC0Jdm9pZCAqYWRkcnNb
XSA9IHthZGRyLCBhZGRyICsgMX07Cj4+IC0JdTMyIGluc25zW10gPSB7cC0+b3Bjb2RlLCBCUks2
NF9PUENPREVfS1BST0JFU19TU307Cj4+ICAKPj4gIAkvKiBwcmVwYXJlIGluc24gc2xvdCAqLwo+
PiAtCWFhcmNoNjRfaW5zbl9wYXRjaF90ZXh0KGFkZHJzLCBpbnNucywgMik7Cj4+ICsJYWFyY2g2
NF9pbnNuX3dyaXRlKGFkZHIsIHAtPm9wY29kZSk7Cj4+ICsJYWFyY2g2NF9pbnNuX3dyaXRlKGFk
ZHIgKyAxLCBCUks2NF9PUENPREVfS1BST0JFU19TUyk7Cj4+ICAKPj4gIAlmbHVzaF9pY2FjaGVf
cmFuZ2UoKHVpbnRwdHJfdClhZGRyLCAodWludHB0cl90KShhZGRyICsgTUFYX0lOU05fU0laRSkp
Owo+IAo+IEhtbSwgc28gaXQgbG9va3MgbGlrZSBwcmlvciB0byB5b3VyIGNoYW5nZSB3ZSB3ZXJl
IGRvaW5nIHRoZSBjYWNoZQo+IG1haW50ZWJuYW5jZSB0d2ljZTogb25jZSBpbiBhYXJjaDY0X2lu
c25fcGF0Y2hfdGV4dCgpIGZyb20gc3RvcCBtYWNoaW5lCj4gY29udGV4dCBhbmQgdGhlbiBhZ2Fp
biBpbiB0aGUgZmx1c2hfaWNhY2hlX3JhbmdlKCkgY2FsbCBhYm92ZS4KPiAKPiBJIHN1cHBvc2Ug
dGhlIGNsZWFuZXN0IHRoaW5nIHdvdWxkIGJlIHRvIGRyb3AgdGhlIGZsdXNoX2ljYWNoZV9yYW5n
ZSgpCj4gY2FsbCBhbmQgdGhlbiB1c2UgYWFyY2g2NF9pbnNuX3BhdGNoX3RleHRfbm9zeW5jKCkg
aW5zdGVhZCBvZgo+IGFhcmNoNjRfaW5zbl93cml0ZSgpIGluIHlvdXIgY2hhbmdlLgoKT0vvvIxJ
IHdpbGwgaW1wcm92ZSBpdCBpbiBuZXh0IHZlcnNpb24sIHRoYW5rcy4KCj4gCj4gV2lsbAo+IC4K
Ci0tIApCUiwKTGlhbywgQ2hhbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
