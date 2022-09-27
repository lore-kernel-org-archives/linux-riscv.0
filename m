Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034C3C07E9D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 01:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/2SbvjEUtkOZvM9r0B5WEpxhFrE/sdylZG3eeIhQ+kg=; b=FWkoezJpr8QZ3o
	fSMcCkmyL+soZJgcdjCEJ4YRyJQCU9e/rBqnl2l/srt/4YVgwe+rOgcXpzbH6L8ljfY9Ph7ygbGCl
	PbnQ12UA+3IZrhC/rM3JBzmNDv3h3p7RrK14XM8kVF621UrkPCnKs+PVoZEp8jKsFAazreJoWzCFB
	4IqgyQWFpcq5RcIvaMeib0BbkxehHspHNcxH+WFqO84ML2r/TRnkh6XquJUZL5zfkw6oAV4gkrZTg
	5K23xCbi99VJ9CxnLujzqPcBQJ+o9bTLLM2gvW7+BTPH5bcB2nhaFJWhuVvJBF/kSNbjBclRYgYc6
	HggYWN9X39LnYoTBdQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oczXs-007gBB-Ak; Tue, 27 Sep 2022 01:38:00 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oczXf-007g9b-T1; Tue, 27 Sep 2022 01:37:49 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mc2FZ4cb7z1P6r6;
	Tue, 27 Sep 2022 09:33:22 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 09:37:36 +0800
Message-ID: <ac7ffd9a-caf8-3f4a-8aa2-6d8d057a940b@huawei.com>
Date: Tue, 27 Sep 2022 09:37:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] arm64/kprobe: Optimize the performance of patching
 single-step slot
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <guoren@kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<maz@kernel.org>, <alexandru.elisei@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20220923084658.99304-1-liaochang1@huawei.com>
 <20220923084658.99304-4-liaochang1@huawei.com>
 <Yy2pAEvWKVloVr3U@FVFF77S0Q05N>
 <19ffdae6-8484-08e5-f408-ab39a97ce5c0@huawei.com>
 <20220925102159.639f39818672ef60a4ddc7f1@kernel.org>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <20220925102159.639f39818672ef60a4ddc7f1@kernel.org>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_183748_300615_AA268136 
X-CRM114-Status: GOOD (  19.31  )
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

CgrlnKggMjAyMi85LzI1IDk6MjEsIE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkg5YaZ6YGTOgo+
IE9uIFNhdCwgMjQgU2VwIDIwMjIgMDk6NTI6MjggKzA4MDAKPiAibGlhb2NoYW5nIChBKSIgPGxp
YW9jaGFuZzFAaHVhd2VpLmNvbT4gd3JvdGU6Cj4gCj4+Cj4+Cj4+IOWcqCAyMDIyLzkvMjMgMjA6
MzksIE1hcmsgUnV0bGFuZCDlhpnpgZM6Cj4+PiBPbiBGcmksIFNlcCAyMywgMjAyMiBhdCAwNDo0
Njo1OFBNICswODAwLCBMaWFvIENoYW5nIHdyb3RlOgo+Pj4+IFNpbmdsZS1zdGVwIHNsb3Qgd291
bGQgbm90IGJlIHVzZWQgdW50aWwga3Byb2JlIGlzIGVuYWJsZWQsIHRoYXQgbWVhbnMKPj4+PiBu
byByYWNlIGNvbmRpdGlvbiBvY2N1cnMgb24gaXQgdW5kZXIgU01QLCBoZW5jZSBpdCBpcyBzYWZl
IHRvIHBhY3RoIHNzCj4+Pj4gc2xvdCB3aXRob3V0IHN0b3BwaW5nIG1hY2hpbmUuCj4+Pgo+Pj4g
SSB0aGluayB0aGlzIGlzIGNvcnJlY3QsIGJ1dCB0aGlzIGRlcGVuZHMgb24gYSBjb3VwbGUgb2Yg
c3VidGxldGllcywKPj4+IGltcG9ydGFudGx5Ogo+Pj4KPj4+ICogVGhhdCB0aGUgSS1jYWNoZSBt
YWludGVuYW5jZSBmb3IgdGhlc2UgaW5zdHJ1Y3Rpb25zIGlzIGNvbXBsZXRlICpiZWZvcmUqIHRo
ZQo+Pj4gICBrcHJvYmUgQlJLIGlzIHdyaXR0ZW4gKGFuZCBhYXJjaDY0X2luc25fcGF0Y2hfdGV4
dF9ub3N5bmMoKSBlbnN1cmVzIHRoaXMsIGJ1dAo+Pj4gICBqdXN0IG9taXRzIGNhdXNpbmcgYSBD
b250ZXh0LVN5bmNocm9uaXphdGlvbi1FdmVudCBvbiBhbGwgQ1BVUykuCj4+Cj4+IFNvIGluIG9y
ZGVyIHRvIGd1YXJhbnRlZSB0aGUgSS1jYWNoZSBtYWludGVuYW5jZSBpcyBvYnNlcnZlZCBvbiBh
bGwgQ1BVUywKPj4gaXQgbmVlZHMgdG8gYmUgZm9sbG93ZWQgYnkgYSBleHBsaWNpdCBDb250ZXh0
LVN5bmNocm9uaXphdGlvbi1FdmVudCwgcGVyaGFwcwo+PiBpdCBpcyBiZXR0ZXIgdG8gcGxhY2Ug
SVNCIGJlZm9yZSBrcHJvYmUgQlJLIGlzIHdyaXR0ZW4uCj4+Cj4+Pgo+Pj4gKiBUaGF0IHRoZSBr
cHJvYmUgQlJLIHJlc3VsdHMgaW4gYW4gZXhjZXB0aW9uIChhbmQgY29uc2VxdWVudGx5IGEKPj4+
ICAgQ29udGV4dC1TeW5jaHJvbm9pemF0aW9uLUV2ZW50KSwgd2hpY2ggZW5zdXJlcyB0aGF0IHRo
ZSBDUFUgd2lsbCBmZXRjaCB0aGUKPj4+ICAgc2luZ2xlLXN0ZXAgc2xvdCBpbnN0cnVjdGlvbnMg
KmFmdGVyKiB0aGlzLCBlbnN1cmluZyB0aGF0IHRoZSBuZXcKPj4+ICAgaW5zdHJ1Y3Rpb25zIGFy
ZSB1c2VkLgo+Pgo+PiBZZXMsIGJlY2F1c2Ugb2Ygc2luZ2xlLXN0ZXAgc2xvdCBpcyBpbnN0YWxs
ZWQgaW50IHRoZSBCUksgZXhlY3B0aW9uIGhhbmRsZXIsCj4+IHNvIGl0IGlzIG5vdCBuZWNlc3Nh
cnkgdG8gZ2VuZXJhdGUgQ29udGV4dC1TeW5jaHJvbml6YXRpb24tRXZlbnQgdmlhIElTQiBtZW50
aW9uZWQgYWJvdmUuLi4KPiAKPiBDYW4geW91IHVwZGF0ZSB0aGUgcGF0Y2ggaW5jbHVkaW5nIGFi
b3ZlIGFzIGNvbW1lbnRzIGluIHRoZSBjb2RlPwo+IE1heWJlIHlvdSBhbHNvIGhhdmUgdG8gZW5z
dXJlIGl0IG9uIG90aGVyIHBhdGNoZXMgdG9vLgoKT0vvvIxpIHdpbGwgYWRkIHRoZXNlIGNvbW1l
bnRzIGluIHRoZSBjb2RlLgoKVGhhbmtzLgoKPiAKPiBUaGFuayB5b3UsCj4gCj4+Cj4+IFRoYW5r
cy4KPj4KPj4+Cj4+PiBJdCB3b3VsZCBiZSBnb29kIGlmIHdlIGNvdWxkIGNhbGwgdGhhdCBvdXQg
ZXhwbGljaXRseS4KPj4+Cj4+PiBUaGFua3MsCj4+PiBNYXJrLgo+Pj4KPj4+PiBTaW5jZSBJIGFu
ZCBEIGNhY2hlcyBhcmUgY29oZXJlbnQgd2l0aGluIHNpbmdsZS1zdGVwIHNsb3QgZnJvbQo+Pj4+
IGFhcmNoNjRfaW5zbl9wYXRjaF90ZXh0X25vc3luYygpLCBoZW5jZSBubyBuZWVkIHRvIGRvIGl0
IGFnYWluIHZpYQo+Pj4+IGZsdXNoX2ljYWNoZV9yYW5nZSgpLgo+Pj4+Cj4+Pj4gQWNrZWQtYnk6
IE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkgPG1oaXJhbWF0QGtlcm5lbC5vcmc+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogTGlhbyBDaGFuZyA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPgo+Pj4+IC0tLQo+
Pj4+ICBhcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIHwgNyArKy0tLS0tCj4+Pj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYyBiL2FyY2gv
YXJtNjQva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPj4+PiBpbmRleCBkMWQxODIzMjAyNDUuLjI5
Yjk4YmMxMjgzMyAxMDA2NDQKPj4+PiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9iZXMva3By
b2Jlcy5jCj4+Pj4gKysrIGIvYXJjaC9hcm02NC9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+Pj4+
IEBAIC00NCwxMyArNDQsMTAgQEAgcG9zdF9rcHJvYmVfaGFuZGxlcihzdHJ1Y3Qga3Byb2JlICos
IHN0cnVjdCBrcHJvYmVfY3RsYmxrICosIHN0cnVjdCBwdF9yZWdzICopOwo+Pj4+ICBzdGF0aWMg
dm9pZCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX3NzX3Nsb3Qoc3RydWN0IGtwcm9iZSAqcCkKPj4+
PiAgewo+Pj4+ICAJa3Byb2JlX29wY29kZV90ICphZGRyID0gcC0+YWluc24uYXBpLmluc247Cj4+
Pj4gLQl2b2lkICphZGRyc1tdID0ge2FkZHIsIGFkZHIgKyAxfTsKPj4+PiAtCXUzMiBpbnNuc1td
ID0ge3AtPm9wY29kZSwgQlJLNjRfT1BDT0RFX0tQUk9CRVNfU1N9Owo+Pj4+ICAKPj4+PiAgCS8q
IHByZXBhcmUgaW5zbiBzbG90ICovCj4+Pj4gLQlhYXJjaDY0X2luc25fcGF0Y2hfdGV4dChhZGRy
cywgaW5zbnMsIDIpOwo+Pj4+IC0KPj4+PiAtCWZsdXNoX2ljYWNoZV9yYW5nZSgodWludHB0cl90
KWFkZHIsICh1aW50cHRyX3QpKGFkZHIgKyBNQVhfSU5TTl9TSVpFKSk7Cj4+Pj4gKwlhYXJjaDY0
X2luc25fcGF0Y2hfdGV4dF9ub3N5bmMoYWRkciwgcC0+b3Bjb2RlKTsKPj4+PiArCWFhcmNoNjRf
aW5zbl9wYXRjaF90ZXh0X25vc3luYyhhZGRyICsgMSwgQlJLNjRfT1BDT0RFX0tQUk9CRVNfU1Mp
Owo+Pj4+ICAKPj4+PiAgCS8qCj4+Pj4gIAkgKiBOZWVkcyByZXN0b3Jpbmcgb2YgcmV0dXJuIGFk
ZHJlc3MgYWZ0ZXIgc3RlcHBpbmcgeG9sLgo+Pj4+IC0tIAo+Pj4+IDIuMTcuMQo+Pj4+Cj4+Pgo+
Pj4gLgo+Pgo+PiAtLSAKPj4gQlIsCj4+IExpYW8sIENoYW5nCj4gCj4gCgotLSAKQlIsCkxpYW8s
IENoYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
