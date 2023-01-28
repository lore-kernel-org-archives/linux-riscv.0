Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6171C61DA7
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 09:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0e73Q9JVL/sPz71sk9a0b/8Cc9aeIWtXYH5lKyE0a04=; b=dR21s4Qy5ytEDp
	kTF+1xRvTSjVQ7sowc/JggaOYNZU+68zCbvN0xQd8SGxm3D7cjpd3UGhPdZYj5Kj5H10A5K1qLow0
	FLMQrMqugVn/3gJM48CeBkQ7G6ynLEcaWETi3Eqo8PETRBcs/sEo/wHdAiU97vvIwjFtLLaL6MnsE
	kGMPWmyxA1Fi1yAfqcYsIDvB5HYVSB0i4qVtlXoAfJtBDm/vTwkqGO7/SQicmc48s4JFKTYSf11Cu
	1l6+Xoe3cqoGjs06BVzSe4D0wUdpl4Awilq2VT6LIJCfvSLD2LFqStwkWxNd2CJV/aX0UXi0udSp0
	daB87awDSYxK7uSZR1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLhtm-00HZ6T-7h; Sat, 28 Jan 2023 09:53:26 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLhti-00HZ4s-JX
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 09:53:24 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4P3qWV0h69zfZ4D;
	Sat, 28 Jan 2023 17:53:10 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Sat, 28 Jan 2023 17:53:15 +0800
Message-ID: <e9e78ef3-bbab-a248-488b-016bda9dcaf3@huawei.com>
Date: Sat, 28 Jan 2023 17:53:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal
 position
To: Guo Ren <guoren@kernel.org>
CC: <palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <mhiramat@kernel.org>,
	<conor.dooley@microchip.com>, <penberg@kernel.org>, <mark.rutland@arm.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Guo Ren
	<guoren@linux.alibaba.com>
References: <20230126130509.1418251-1-guoren@kernel.org>
 <0871074a-cafb-a172-f062-6ada6d2a3a41@huawei.com>
 <CAJF2gTTd9V6PKu6_ip21HbXWgN6X-epw8yc_s6XonssStFNdEQ@mail.gmail.com>
 <CAJF2gTTCFPsn+8NJaQyHan9h9b7=UzjY-+H4_qi4DaGXJ_kD3w@mail.gmail.com>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <CAJF2gTTCFPsn+8NJaQyHan9h9b7=UzjY-+H4_qi4DaGXJ_kD3w@mail.gmail.com>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_015323_034304_DF895ED1 
X-CRM114-Status: GOOD (  16.42  )
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

CgrlnKggMjAyMy8xLzI4IDExOjUyLCBHdW8gUmVuIOWGmemBkzoKPiBPbiBTYXQsIEphbiAyOCwg
MjAyMyBhdCAxMTo0NiBBTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+
IE9uIFNhdCwgSmFuIDI4LCAyMDIzIGF0IDEwOjU1IEFNIGxpYW9jaGFuZyAoQSkgPGxpYW9jaGFu
ZzFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4KPj4+Cj4+PiDlnKggMjAyMy8xLzI2IDIxOjA1
LCBndW9yZW5Aa2VybmVsLm9yZyDlhpnpgZM6Cj4+Pj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxp
bnV4LmFsaWJhYmEuY29tPgo+Pj4+Cj4+Pj4gVGhlIGtlcm5lbCB3b3VsZCBwYW5pYyB3aGVuIHBy
b2JlZCBmb3IgYW4gaWxsZWdhbCBwb3NpdGlvbi4gZWc6Cj4+Pj4KPj4+PiAoQ09ORklHX1JJU0NW
X0lTQV9DPW4pCj4+Pj4KPj4+PiBlY2hvICdwOmhlbGxvIGtlcm5lbF9jbG9uZSsweDE2IGEwPSVh
MCcgPj4ga3Byb2JlX2V2ZW50cwo+Pj4+IGVjaG8gMSA+IGV2ZW50cy9rcHJvYmVzL2hlbGxvL2Vu
YWJsZQo+Pj4+IGNhdCB0cmFjZQo+Pj4+Cj4+Pj4gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6
IHN0YWNrLXByb3RlY3RvcjogS2VybmVsIHN0YWNrCj4+Pj4gaXMgY29ycnVwdGVkIGluOiBfX2Rv
X3N5c19uZXdmc3RhdGF0KzB4YjgvMHhiOAo+Pj4+IENQVTogMCBQSUQ6IDExMSBDb21tOiBzaCBO
b3QgdGFpbnRlZAo+Pj4+IDYuMi4wLXJjMS0wMDAyNy1nMmQzOThmZTQ5YTRkICM0OTAKPj4+PiBI
YXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+Pj4gQ2FsbCBUcmFjZToKPj4+
PiBbPGZmZmZmZmZmODAwMDcyNjg+XSBkdW1wX2JhY2t0cmFjZSsweDM4LzB4NDgKPj4+PiBbPGZm
ZmZmZmZmODBjNWU4M2M+XSBzaG93X3N0YWNrKzB4NTAvMHg2OAo+Pj4+IFs8ZmZmZmZmZmY4MGM2
ZGEyOD5dIGR1bXBfc3RhY2tfbHZsKzB4NjAvMHg4NAo+Pj4+IFs8ZmZmZmZmZmY4MGM2ZGE2Yz5d
IGR1bXBfc3RhY2srMHgyMC8weDMwCj4+Pj4gWzxmZmZmZmZmZjgwYzVlY2Y0Pl0gcGFuaWMrMHgx
NjAvMHgzNzQKPj4+PiBbPGZmZmZmZmZmODBjNmRiOTQ+XSBnZW5lcmljX2hhbmRsZV9hcmNoX2ly
cSsweDAvMHhhOAo+Pj4+IFs8ZmZmZmZmZmY4MDJkZWViMD5dIHN5c19uZXdzdGF0KzB4MC8weDMw
Cj4+Pj4gWzxmZmZmZmZmZjgwMDE1OGMwPl0gc3lzX2Nsb25lKzB4MjAvMHgzMAo+Pj4+IFs8ZmZm
ZmZmZmY4MDAwMzllOD5dIHJldF9mcm9tX3N5c2NhbGwrMHgwLzB4NAo+Pj4+IC0tLVsgZW5kIEtl
cm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBzdGFjay1wcm90ZWN0b3I6Cj4+Pj4gS2VybmVsIHN0
YWNrIGlzIGNvcnJ1cHRlZCBpbjogX19kb19zeXNfbmV3ZnN0YXRhdCsweGI4LzB4YjggXS0tLQo+
Pj4+Cj4+Pj4gVGhhdCBpcyBiZWNhdXNlIHRoZSBrcHJvYmUncyBlYnJlYWsgaW5zdHJ1Y3Rpb24g
YnJva2UgdGhlIGtlcm5lbCdzCj4+Pj4gb3JpZ2luYWwgY29kZS4gVGhlIHVzZXIgc2hvdWxkIGd1
YXJhbnRlZSB0aGUgY29ycmVjdGlvbiBvZiB0aGUgcHJvYmUKPj4+PiBwb3NpdGlvbiwgYnV0IGl0
IGNvdWxkbid0IG1ha2UgdGhlIGtlcm5lbCBwYW5pYy4KPj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggYWRk
cyBhcmNoX2NoZWNrX2twcm9iZSBpbiBhcmNoX3ByZXBhcmVfa3Byb2JlIHRvIHByZXZlbnQgYW4K
Pj4+PiBpbGxlZ2FsIHBvc2l0aW9uIChTdWNoIGFzIHRoZSBtaWRkbGUgb2YgYW4gaW5zdHJ1Y3Rp
b24pLgo+Pj4+Cj4+Pj4gRml4ZXM6IGMyMmIwYmNiMWRkMCAoInJpc2N2OiBBZGQga3Byb2JlcyBz
dXBwb3J0ZWQiKQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGli
YWJhLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
Pj4+PiAtLS0KPj4+PiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyB8IDE4ICsr
KysrKysrKysrKysrKysrKwo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4+Pj4gaW5kZXggZjIxNTkyZDIw
MzA2Li40NzU5ODlmMDZkNmQgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJv
YmVzL2twcm9iZXMuYwo+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVz
LmMKPj4+PiBAQCAtNDgsNiArNDgsMjEgQEAgc3RhdGljIHZvaWQgX19rcHJvYmVzIGFyY2hfc2lt
dWxhdGVfaW5zbihzdHJ1Y3Qga3Byb2JlICpwLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4+PiAg
ICAgICBwb3N0X2twcm9iZV9oYW5kbGVyKHAsIGtjYiwgcmVncyk7Cj4+Pj4gIH0KPj4+Pgo+Pj4+
ICtzdGF0aWMgYm9vbCBfX2twcm9iZXMgYXJjaF9jaGVja19rcHJvYmUoc3RydWN0IGtwcm9iZSAq
cCkKPj4+PiArewo+Pj4+ICsgICAgIHVuc2lnbmVkIGxvbmcgdG1wICA9ICh1bnNpZ25lZCBsb25n
KXAtPmFkZHIgLSBwLT5vZmZzZXQ7Cj4+Pj4gKyAgICAgdW5zaWduZWQgbG9uZyBhZGRyID0gKHVu
c2lnbmVkIGxvbmcpcC0+YWRkcjsKPj4+PiArCj4+Pj4gKyAgICAgd2hpbGUgKHRtcCA8PSBhZGRy
KSB7Cj4+Pj4gKyAgICAgICAgICAgICBpZiAodG1wID09IGFkZHIpCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiB0cnVlOwo+Pj4+ICsKPj4+PiArICAgICAgICAgICAgIHRtcCArPSBH
RVRfSU5TTl9MRU5HVEgoKihrcHJvYmVfb3Bjb2RlX3QgKil0bXApOwo+Pj4+ICsgICAgIH0KPj4+
PiArCj4+Pj4gKyAgICAgcmV0dXJuIGZhbHNlOwo+Pj4+ICt9Cj4+Pgo+Pj4gTEdUTS4KPj4+Cj4+
PiBJIGhhdmUgc3VibWl0IGEgcGF0Y2ggdG8gZml4IHRoZSBzYW1lIHByb2JsZW0sIGZvdW5kIGF0
Ogo+PiBPaCwgSSBtaXNzZWQgdGhhdCBwYXRjaC4gT3VyIGdvYWwgaXMgdGhlIHNhbWUuCj4+Cj4+
IEJ1dCBpdCB3b3VsZCBiZSBiZXN0IGlmIHlvdSByZXVzZWQgcC0+b2Zmc2V0LCBub3QKPj4ga2Fs
bHN5bXNfbG9va3VwX3NpemVfb2Zmc2V0LCB0aGUgcC0+YWRkciBhZGRlZCBieSBfa3Byb2JlX2Fk
ZHIKPj4gKGtlcm5lbC9rcHJvYmVzLmMpLCBub3QganVzdCBrYWxsc3ltc19sb29rdXBfc2l6ZV9v
ZmZzZXQuIFN1cmUsIGl0Cj4+IHdvcmtzIGFyb3VuZCBmb3IgdGhlIGN1cnJlbnQgcmlzY3YsIGJ1
dCB0aGF0J3Mgbm90IGNvcnJlY3QuCj4gU29ycnksIHRoZSBhYm92ZSBkZXNjcmlwdGlvbiBpcyBh
IGxpdHRsZSBiaXQgY29uZnVzaW5nLiBXaGF0IEkgbWVhbiBpcyB0aGF0Ogo+IFRoZSBwLT5hZGRy
ID0gZnVuY19lbnRyeSArIHAtPm9mZnNldC4gTm90IGthbGxzeW1zX2xvb2t1cF9zaXplX29mZnNl
dC4KPiBZb3VyIHBhdGNoIGNvdWxkIGdldCB0aGUgd3JvbmcgZnVuY19lbnRyeS4KCkFjY29yZGlu
ZyB0byBteSB0ZXN0aW5nIGFuZCBkZWJ1Z2dpbiBvbiBRRU1VLCBJIHRoaW5rIGJvdGggeW91ciBw
YXRjaCBhbmQgbWluZSBpcyBhYmxlCnRvIGZpbmQgdGhlIGNvcnJlY3QgZnVuY19lbnRyeSwgYmVj
YXVzZSBfa3Byb2JlX2FkZHIgYWxzbyB1c2VzIGthbGxzeW1zX2xvb2t1cF9zaXplX29mZnNldAp0
byBnZXQgdGhlIGZpcnN0IGluc3RydWN0aW9uIGFkZHJlc3Mgb2YgZ2l2ZW4gc3ltYm9sLiBPZiBj
b3Vyc2UsIGkgcHJlZmVyZSB0byB5b3VyIHBhdGNoIGJlY2F1c2UgaXQgcmV1c2UgcC0+b2Zmc2V0
LgoKVGhhbmtzLgoKPiAKPj4KPj4+Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIw
MjMwMTI3MTMwNTQxLjEyNTA4NjUtMTEtY2hlbmd1b2thaTE3QG1haWxzLnVjYXMuYWMuY24vCj4+
Pgo+Pj4gU28gdGhpcyBib3VuZGFyeSBjaGVjayBpcyBuZWNlc3Nhcnkgbm8gbWF0dGVyIENPTkZJ
R19SSVNDVl9JU0FfQyBpcyBlbmFibGUgb3Igbm90LCByaWdodD8KPj4gWWVzLCBteSBwYW5pYyBl
eGFtcGxlIGluIHRoZSBjb21taXQgbG9nIGlzIGJhc2VkIG9uIHRoZQo+PiAhQ09ORklHX1JJU0NW
X0lTQV9DLCB5b3UgY291bGRuJ3QgbWlzcyB0aGF0Lgo+Pgo+Pj4KPj4+Cj4+Pj4gKwo+Pj4+ICBp
bnQgX19rcHJvYmVzIGFyY2hfcHJlcGFyZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPj4+PiAg
ewo+Pj4+ICAgICAgIHVuc2lnbmVkIGxvbmcgcHJvYmVfYWRkciA9ICh1bnNpZ25lZCBsb25nKXAt
PmFkZHI7Cj4+Pj4gQEAgLTU1LDYgKzcwLDkgQEAgaW50IF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVf
a3Byb2JlKHN0cnVjdCBrcHJvYmUgKnApCj4+Pj4gICAgICAgaWYgKHByb2JlX2FkZHIgJiAweDEp
Cj4+Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTFNFUTsKPj4+Pgo+Pj4+ICsgICAgIGlmICgh
YXJjaF9jaGVja19rcHJvYmUocCkpCj4+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTFNFUTsK
Pj4+PiArCj4+Pj4gICAgICAgLyogY29weSBpbnN0cnVjdGlvbiAqLwo+Pj4+ICAgICAgIHAtPm9w
Y29kZSA9ICpwLT5hZGRyOwo+Pj4+Cj4+Pgo+Pj4gLS0KPj4+IEJSLAo+Pj4gTGlhbywgQ2hhbmcK
Pj4KPj4KPj4KPj4gLS0KPj4gQmVzdCBSZWdhcmRzCj4+ICBHdW8gUmVuCj4gCj4gCj4gCgotLSAK
QlIsCkxpYW8sIENoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
