Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D94C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZytOzRAMKpP/0LzalrZAHqnulgaWCMoNtrDihBz86kM=; b=cvyKSxfJTexzJx
	o9AkAbO90oXx/QnCfUmf54WTk3ERn7nB6KtCZZSOOjKE4pPp6/bo3pNbA1/YlWWqDd2SAglU/5imd
	AKJcMS1eW8S/s9Qco6c2IQY1ieMVXvlWO9TYaV4IaRD8p8D1uQRfGfzN5ABospUY7awSkE93qYQNX
	RE+hMV0a8yF/uNWX/7M0NY1F0lVzRWTf9ytxLUZgy4unZPldcjzByvnF7lQ2VpaKPR4hx5wqtRdD2
	K99LlGEf7NIqxbX6nsDBr/tg8Smjj8Qnnu0UqDO8YLkZVJlCQ9s02w4sjZkY1FTJWXYlhb6oXozdV
	n/hUgVujNjPv7CPIS69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzHt-007gz6-2S; Wed, 04 Jan 2023 08:38:17 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzF7-007fxe-IP
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:35:28 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Nn2v92wmTznV0M;
	Wed,  4 Jan 2023 16:33:57 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 4 Jan 2023 16:35:23 +0800
Message-ID: <088ed826-59a8-37a3-401e-2ed022a4a097@huawei.com>
Date: Wed, 4 Jan 2023 16:35:22 +0800
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
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <87r0wcvmn1.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_003526_001704_22FE2F61 
X-CRM114-Status: GOOD (  12.01  )
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

CgrlnKggMjAyMy8xLzMgMjowNCwgQmrDtnJuIFTDtnBlbCDlhpnpgZM6Cj4gQ2hlbiBHdW9rYWkg
PGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cj4gCj4+IEZyb206IExpYW8g
Q2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Byb2Jlcy9vcHQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9vcHQuYwo+
PiBpbmRleCAyNThhMjgzYzkwNmQuLmJjMjMyZmNlNWIzOSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvYmVzL29wdC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jl
cy9vcHQuYwo+PiBAQCAtMTEsOSArMTEsMzcgQEAKPj4gICNpbmNsdWRlIDxsaW51eC9rcHJvYmVz
Lmg+Cj4+ICAjaW5jbHVkZSA8YXNtL2twcm9iZXMuaD4KPj4gICNpbmNsdWRlIDxhc20vcGF0Y2gu
aD4KPj4gKyNpbmNsdWRlIDxhc20vYXNtLW9mZnNldHMuaD4KPj4gIAo+PiAgI2luY2x1ZGUgInNp
bXVsYXRlLWluc24uaCIKPj4gICNpbmNsdWRlICJkZWNvZGUtaW5zbi5oIgo+PiArI2luY2x1ZGUg
Ii4uLy4uL25ldC9icGZfaml0LmgiCj4+ICsKPj4gK3N0YXRpYyB2b2lkCj4gCj4gU3VwZXItbml0
LCBidXQgSSByZWFsbHkgcHJlZmVyICpub3QqIGJyZWFraW5nIGZ1bmN0aW9uIG5hbWUgYW5kIHJl
dHVybgo+IHZhbHVlLCBmb3IgZ3JlcGFiaWxpdHkuCgpPSywgaSB3aWxsIGtlZXAgZnVuY3Rpb24g
bmFtZSBhbmQgcmV0dXJuIGF0IHRoZSBzYW1lIGxpbmUuCgo+IAo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvYmVzL29wdF90cmFtcG9saW5lLlMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9wcm9iZXMvb3B0X3RyYW1wb2xpbmUuUwo+PiBpbmRleCAxNjE2MGM0MzY3ZmYuLjc1ZTM0ZTM3
M2NmMiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL29wdF90cmFtcG9s
aW5lLlMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL29wdF90cmFtcG9saW5lLlMK
Pj4gQEAgLTEsMTIgKzEsMTM3IEBACj4+ICAvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5ICovCj4+ICAvKgo+PiAgICogQ29weXJpZ2h0IChDKSAyMDIyIEd1b2thaSBDaGVu
Cj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgTGlhbywgQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2Vp
LmNvbT4KPj4gICAqLwo+PiAgCj4+ICAjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgo+PiAgCj4+
ICsjaW5jbHVkZSA8YXNtL2FzbS5oPgo+PiAgI2luY2xkdWUgPGFzbS9jc3IuaD4KPj4gICNpbmNs
dWRlIDxhc20vYXNtLW9mZnNldHMuaD4KPj4gIAo+PiAgU1lNX0VOVFJZKG9wdHByb2JlX3RlbXBs
YXRlX2VudHJ5LCBTWU1fTF9HTE9CQUwsIFNZTV9BX05PTkUpCj4+ICsJYWRkaSAgc3AsIHNwLCAt
KFBUX1NJWkVfT05fU1RBQ0spCj4+ICsJUkVHX1MgeDEsICBQVF9SQShzcCkKPj4gKwlSRUdfUyB4
MiwgIFBUX1NQKHNwKQo+PiArCVJFR19TIHgzLCAgUFRfR1Aoc3ApCj4+ICsJUkVHX1MgeDQsICBQ
VF9UUChzcCkKPj4gKwlSRUdfUyB4NSwgIFBUX1QwKHNwKQo+PiArCVJFR19TIHg2LCAgUFRfVDEo
c3ApCj4+ICsJUkVHX1MgeDcsICBQVF9UMihzcCkKPj4gKwlSRUdfUyB4OCwgIFBUX1MwKHNwKQo+
PiArCVJFR19TIHg5LCAgUFRfUzEoc3ApCj4+ICsJUkVHX1MgeDEwLCBQVF9BMChzcCkKPj4gKwlS
RUdfUyB4MTEsIFBUX0ExKHNwKQo+PiArCVJFR19TIHgxMiwgUFRfQTIoc3ApCj4+ICsJUkVHX1Mg
eDEzLCBQVF9BMyhzcCkKPj4gKwlSRUdfUyB4MTQsIFBUX0E0KHNwKQo+PiArCVJFR19TIHgxNSwg
UFRfQTUoc3ApCj4+ICsJUkVHX1MgeDE2LCBQVF9BNihzcCkKPj4gKwlSRUdfUyB4MTcsIFBUX0E3
KHNwKQo+PiArCVJFR19TIHgxOCwgUFRfUzIoc3ApCj4+ICsJUkVHX1MgeDE5LCBQVF9TMyhzcCkK
Pj4gKwlSRUdfUyB4MjAsIFBUX1M0KHNwKQo+PiArCVJFR19TIHgyMSwgUFRfUzUoc3ApCj4+ICsJ
UkVHX1MgeDIyLCBQVF9TNihzcCkKPj4gKwlSRUdfUyB4MjMsIFBUX1M3KHNwKQo+PiArCVJFR19T
IHgyNCwgUFRfUzgoc3ApCj4+ICsJUkVHX1MgeDI1LCBQVF9TOShzcCkKPj4gKwlSRUdfUyB4MjYs
IFBUX1MxMChzcCkKPj4gKwlSRUdfUyB4MjcsIFBUX1MxMShzcCkKPj4gKwlSRUdfUyB4MjgsIFBU
X1QzKHNwKQo+PiArCVJFR19TIHgyOSwgUFRfVDQoc3ApCj4+ICsJUkVHX1MgeDMwLCBQVF9UNShz
cCkKPj4gKwlSRUdfUyB4MzEsIFBUX1Q2KHNwKQo+PiArCS8qIFVwZGF0ZSBmcCBpcyBmcmllbmRs
eSBmb3Igc3RhY2t0cmFjZSAqLwo+PiArCWFkZGkgIHMwLCBzcCwgKFBUX1NJWkVfT05fU1RBQ0sp
Cj4+ICsJaiAxZgo+PiArCj4+ICtTWU1fRU5UUlkob3B0cHJvYmVfdGVtcGxhdGVfc2F2ZSwgU1lN
X0xfR0xPQkFMLCBTWU1fQV9OT05FKQo+PiArCS8qCj4+ICsJICogU3RlcDE6Cj4+ICsJICogRmls
bGVkIHdpdGggdGhlIHBvaW50ZXIgdG8gb3B0aW1pemVkX2twcm9iZSBkYXRhCj4+ICsJICovCj4+
ICsJLmR3b3JkIDAKPj4gKzE6Cj4+ICsJLyogTG9hZCBvcHRpbWl6ZV9rcHJvYmUgcG9pbnRlciBm
cm9tIC5kd29yZCBiZWxvdyAqLwo+PiArCWF1aXBjIGEwLCAwCj4+ICsJUkVHX0wgYTAsIC04KGEw
KQo+PiArCWFkZCAgIGExLCBzcCwgeDAKPj4gKwo+PiArU1lNX0VOVFJZKG9wdHByb2JlX3RlbXBs
YXRlX2NhbGwsIFNZTV9MX0dMT0JBTCwgU1lNX0FfTk9ORSkKPj4gKwkvKgo+PiArCSAqIFN0ZXAy
Ogo+PiArCSAqIDxJTU1FPiBvZiBBVUlQQy9KQUxSIGFyZSBtb2RpZmllZCB0byB0aGUgb2Zmc2V0
IHRvIG9wdGltaXplZF9jYWxsYmFjawo+PiArCSAqIGp1bXAgdGFyZ2V0IGlzIGxvYWRlZCBmcm9t
IGFib3ZlIC5kd29yZC4KPj4gKwkgKi8KPj4gKwlhdWlwYyByYSwgMAo+PiArCWphbHIgIHJhLCAw
KHJhKQo+PiArCj4+ICsJUkVHX0wgeDEsICBQVF9SQShzcCkKPj4gKwlSRUdfTCB4MywgIFBUX0dQ
KHNwKQo+PiArCVJFR19MIHg0LCAgUFRfVFAoc3ApCj4+ICsJUkVHX0wgeDUsICBQVF9UMChzcCkK
Pj4gKwlSRUdfTCB4NiwgIFBUX1QxKHNwKQo+PiArCVJFR19MIHg3LCAgUFRfVDIoc3ApCj4+ICsJ
UkVHX0wgeDgsICBQVF9TMChzcCkKPj4gKwlSRUdfTCB4OSwgIFBUX1MxKHNwKQo+PiArCVJFR19M
IHgxMCwgUFRfQTAoc3ApCj4+ICsJUkVHX0wgeDExLCBQVF9BMShzcCkKPj4gKwlSRUdfTCB4MTIs
IFBUX0EyKHNwKQo+PiArCVJFR19MIHgxMywgUFRfQTMoc3ApCj4+ICsJUkVHX0wgeDE0LCBQVF9B
NChzcCkKPj4gKwlSRUdfTCB4MTUsIFBUX0E1KHNwKQo+PiArCVJFR19MIHgxNiwgUFRfQTYoc3Ap
Cj4+ICsJUkVHX0wgeDE3LCBQVF9BNyhzcCkKPj4gKwlSRUdfTCB4MTgsIFBUX1MyKHNwKQo+PiAr
CVJFR19MIHgxOSwgUFRfUzMoc3ApCj4+ICsJUkVHX0wgeDIwLCBQVF9TNChzcCkKPj4gKwlSRUdf
TCB4MjEsIFBUX1M1KHNwKQo+PiArCVJFR19MIHgyMiwgUFRfUzYoc3ApCj4+ICsJUkVHX0wgeDIz
LCBQVF9TNyhzcCkKPj4gKwlSRUdfTCB4MjQsIFBUX1M4KHNwKQo+PiArCVJFR19MIHgyNSwgUFRf
Uzkoc3ApCj4+ICsJUkVHX0wgeDI2LCBQVF9TMTAoc3ApCj4+ICsJUkVHX0wgeDI3LCBQVF9TMTEo
c3ApCj4+ICsJUkVHX0wgeDI4LCBQVF9UMyhzcCkKPj4gKwlSRUdfTCB4MjksIFBUX1Q0KHNwKQo+
PiArCVJFR19MIHgzMCwgUFRfVDUoc3ApCj4+ICsJUkVHX0wgeDMxLCBQVF9UNihzcCkKPj4gKwlS
RUdfTCB4MiwgIFBUX1NQKHNwKQo+PiArCWFkZGkgIHNwLCBzcCwgKFBUX1NJWkVfT05fU1RBQ0sp
Cj4+ICsKPj4gK1NZTV9FTlRSWShvcHRwcm9iZV90ZW1wbGF0ZV9pbnNuLCBTWU1fTF9HTE9CQUws
IFNZTV9BX05PTkUpCj4+ICsJLyoKPj4gKwkgKiBTdGVwMzoKPj4gKwkgKiBOT1BTIHdpbGwgYmUg
cmVwbGFjZWQgYnkgdGhlIHByb2JlZCBpbnN0cnVjdGlvbiwgYXQgd29yc3QgY2FzZSAzIFJWQwo+
PiArCSAqIGFuZCAxIFJWSSBpbnN0cnVjdGlvbnMgaXMgYWJvdXQgdG8gZXhlY3V0ZSBvdXQgb2Yg
bGluZS4KPj4gKwkgKi8KPj4gKwlub3AKPiAKPiBBIG5vcCBoZXJlIHdpbGwgYmUgZWl0aGVyIGEg
Y29tcHJlc3NlZCBub3Agb3IgYSBub24tY29tcHJlc3NlZCwKPiBkZXBlbmRpbmcgb24gdGhlIGJ1
aWxkIChDLWVuYWJsZWQgb3Igbm90KSwgcmlnaHQ/IE1heWJlIGJlIGV4cGxpY2l0IHRvCj4gdGhl
IGFzc2VtYmxlciB3aGF0IHlvdSB3YW50Pwo+IAoKWW91IGFyZSByaWdodCwgaWYgQ09ORklHX1JJ
U0NWX0lTQV9DIGlzIGRpc2FibGVkLCB0d28gTk9QIGlzIGVub3VnaCBmb3IgMiBSVkkgZXhlY3V0
ZSBvdXQgb2YgbGluZSwKaWYgQ09ORklHX1JJU0NWX0lTQV9DIGlzIGVuYWJsZWQsIGl0IG5lZWRz
IGVpZ2h0IEMuTk9QIGhlcmUgZm9yIHRoZSB3b3JzdCBjYXNlICgzIFJWQyArIDEgUlZJKS4KCkkg
d2lsbCB1c2Uge0N9Lk5PUCBleHBsaWNpdGx5IGZvciBkaWZmZXJlbnQgY29uZmlndXJlIGluIG5l
eHQgcmV2aXNpb24sIHRoYW5rcy4KCj4gCj4gQmrDtnJuCgotLSAKQlIsCkxpYW8sIENoYW5nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
