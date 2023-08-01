Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B84C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 02:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekUZY10+nmLN+UUSeHkYufhoB5KH0PButwW3o6UX6x0=; b=QsvVfWa97U5ybH
	hbJ7mS5o3rTzKxpWtvlXEv9PyUVkv5qFl7x0mx+AxcBEJ3d8+o9aJDF3tYdt2P5ak2UMQNxrfDOlx
	p3U7/Na2FduZd0CWEFPMfzL6g9idHKaPxzVtpfiU7PDO2nucxm48UPefVPnKIFwdJ7btn/oJrTTMu
	FQxs7coIgdWyMdSUaDIojvn/7GGxpaDjTx3W/++nws+8mywiniPpv/SIvvl5mlowQAyt3P4BfXSwM
	fwxWBeXP+Xds8/I/1gKEePSFj44YPUMSIXpCjwTflBJhK0XhVe7ELlC8JZodXIQP0konKt0u6y0OV
	UHjzq3zuHgfbPCR7P8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQefq-000AeU-1q;
	Tue, 01 Aug 2023 01:59:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQefn-000Adu-2t
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 01:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690855181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BoiBxXOmx6CpsDJVeX/Pql9MtD1ohfFLvpt/Vo7JoTM=;
	b=Jm3VtXKUX89wWXluD9Y2LOr0YVifEmolQGR9bLjV/qlm1DfmIvp0enrNvwSAnViihhgKD0
	dJVAM/qEJUu1Kn+olvdVw9OlJzKqZ/8YDn5V+BdcvqdWkxgvTsMOAkpVLS1/mCwErpIG9V
	+0S80OwN40qv3fJhdBkqmYyP9yEceww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-ToP1tb8vPf28vrStPja-Jw-1; Mon, 31 Jul 2023 21:59:37 -0400
X-MC-Unique: ToP1tb8vPf28vrStPja-Jw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85DDB891F21;
	Tue,  1 Aug 2023 01:59:35 +0000 (UTC)
Received: from [10.22.10.62] (unknown [10.22.10.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12E161121325;
	Tue,  1 Aug 2023 01:59:33 +0000 (UTC)
Message-ID: <f34ddf7f-3ed9-6118-8106-eb9df110c44c@redhat.com>
Date: Mon, 31 Jul 2023 21:59:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2] asm-generic: ticket-lock: Optimize
 arch_spin_value_unlocked
Content-Language: en-US
To: bibo mao <maobibo@loongson.cn>, guoren@kernel.org,
 David.Laight@ACULAB.COM, will@kernel.org, peterz@infradead.org,
 mingo@redhat.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
References: <20230731023308.3748432-1-guoren@kernel.org>
 <c603e7f1-a562-6826-1c86-995c8127abee@redhat.com>
 <2437ac29-29f0-34f9-b7cb-f0e294db7dc6@loongson.cn>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <2437ac29-29f0-34f9-b7cb-f0e294db7dc6@loongson.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_185944_010929_E8F5B8CA 
X-CRM114-Status: GOOD (  21.50  )
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

T24gNy8zMS8yMyAyMTozNywgYmlibyBtYW8gd3JvdGU6Cj4KPiDlnKggMjAyMy83LzMxIDIzOjE2
LCBXYWltYW4gTG9uZyDlhpnpgZM6Cj4+IE9uIDcvMzAvMjMgMjI6MzMsIGd1b3JlbkBrZXJuZWwu
b3JnIHdyb3RlOgo+Pj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
Pj4KPj4+IFRoZSBhcmNoX3NwaW5fdmFsdWVfdW5sb2NrZWQgd291bGQgY2F1c2UgYW4gdW5uZWNl
c3NhcnkgbWVtb3J5Cj4+PiBhY2Nlc3MgdG8gdGhlIGNvbnRlbmRlZCB2YWx1ZS4gQWx0aG91Z2gg
aXQgd29uJ3QgY2F1c2UgYSBzaWduaWZpY2FudAo+Pj4gcGVyZm9ybWFuY2UgZ2FwIGluIG1vc3Qg
YXJjaGl0ZWN0dXJlcywgdGhlIGFyY2hfc3Bpbl92YWx1ZV91bmxvY2tlZAo+Pj4gYXJndW1lbnQg
Y29udGFpbnMgZW5vdWdoIGluZm9ybWF0aW9uLiBUaHVzLCByZW1vdmUgdW5uZWNlc3NhcnkKPj4+
IGF0b21pY19yZWFkIGluIGFyY2hfc3Bpbl92YWx1ZV91bmxvY2tlZCgpLgo+Pj4KPj4+IFRoZSBj
YWxsZXIgb2YgYXJjaF9zcGluX3ZhbHVlX3VubG9ja2VkKCkgY291bGQgYmVuZWZpdCBmcm9tIHRo
aXMKPj4+IGNoYW5nZS4gQ3VycmVudGx5LCB0aGUgb25seSBjYWxsZXIgaXMgbG9ja3JlZi4KPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPj4+IENjOiBX
YWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPgo+Pj4gQ2M6IERhdmlkIExhaWdodCA8RGF2
aWQuTGFpZ2h0QEFDVUxBQi5DT00+Cj4+PiBDYzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZy
YWRlYWQub3JnPgo+Pj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJh
YmEuY29tPgo+Pj4gLS0tCj4+PiBDaGFuZ2Vsb2cKPj4+IFYyOgo+Pj4gIMKgIC0gRml4dXAgY29t
bWl0IGxvZyB3aXRoIFdhaW1hbiBhZHZpY2UuCj4+PiAgwqAgLSBBZGQgV2FpbWFuIGNvbW1lbnQg
aW4gdGhlIGNvbW1pdCBtc2cuCj4+PiAtLS0KPj4+ICDCoCBpbmNsdWRlL2FzbS1nZW5lcmljL3Nw
aW5sb2NrLmggfCAxNiArKysrKysrKystLS0tLS0tCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9hc20tZ2VuZXJpYy9zcGlubG9jay5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy9zcGlubG9jay5o
Cj4+PiBpbmRleCBmZGZlYmNiMDUwZjQuLjkwODAzYTgyNmJhMCAxMDA2NDQKPj4+IC0tLSBhL2lu
Y2x1ZGUvYXNtLWdlbmVyaWMvc3BpbmxvY2suaAo+Pj4gKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJp
Yy9zcGlubG9jay5oCj4+PiBAQCAtNjgsMTEgKzY4LDE4IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxp
bmUgdm9pZCBhcmNoX3NwaW5fdW5sb2NrKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPj4+ICDCoMKg
wqDCoMKgIHNtcF9zdG9yZV9yZWxlYXNlKHB0ciwgKHUxNil2YWwgKyAxKTsKPj4+ICDCoCB9Cj4+
PiAgwqAgK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgaW50IGFyY2hfc3Bpbl92YWx1ZV91bmxvY2tl
ZChhcmNoX3NwaW5sb2NrX3QgbG9jaykKPj4+ICt7Cj4+PiArwqDCoMKgIHUzMiB2YWwgPSBsb2Nr
LmNvdW50ZXI7Cj4+PiArCj4+PiArwqDCoMKgIHJldHVybiAoKHZhbCA+PiAxNikgPT0gKHZhbCAm
IDB4ZmZmZikpOwo+Pj4gK30KPj4+ICsKPj4+ICDCoCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGlu
dCBhcmNoX3NwaW5faXNfbG9ja2VkKGFyY2hfc3BpbmxvY2tfdCAqbG9jaykKPj4+ICDCoCB7Cj4+
PiAtwqDCoMKgIHUzMiB2YWwgPSBhdG9taWNfcmVhZChsb2NrKTsKPj4+ICvCoMKgwqAgYXJjaF9z
cGlubG9ja190IHZhbCA9IFJFQURfT05DRSgqbG9jayk7Cj4+PiAgwqAgLcKgwqDCoCByZXR1cm4g
KCh2YWwgPj4gMTYpICE9ICh2YWwgJiAweGZmZmYpKTsKPj4+ICvCoMKgwqAgcmV0dXJuICFhcmNo
X3NwaW5fdmFsdWVfdW5sb2NrZWQodmFsKTsKPj4+ICDCoCB9Cj4+PiAgwqAgwqAgc3RhdGljIF9f
YWx3YXlzX2lubGluZSBpbnQgYXJjaF9zcGluX2lzX2NvbnRlbmRlZChhcmNoX3NwaW5sb2NrX3Qg
KmxvY2spCj4+PiBAQCAtODIsMTEgKzg5LDYgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQg
YXJjaF9zcGluX2lzX2NvbnRlbmRlZChhcmNoX3NwaW5sb2NrX3QgKmxvY2spCj4+PiAgwqDCoMKg
wqDCoCByZXR1cm4gKHMxNikoKHZhbCA+PiAxNikgLSAodmFsICYgMHhmZmZmKSkgPiAxOwo+Pj4g
IMKgIH0KPj4+ICDCoCAtc3RhdGljIF9fYWx3YXlzX2lubGluZSBpbnQgYXJjaF9zcGluX3ZhbHVl
X3VubG9ja2VkKGFyY2hfc3BpbmxvY2tfdCBsb2NrKQo+Pj4gLXsKPj4+IC3CoMKgwqAgcmV0dXJu
ICFhcmNoX3NwaW5faXNfbG9ja2VkKCZsb2NrKTsKPj4+IC19Cj4+PiAtCj4+PiAgwqAgI2luY2x1
ZGUgPGFzbS9xcndsb2NrLmg+Cj4+PiAgwqAgwqAgI2VuZGlmIC8qIF9fQVNNX0dFTkVSSUNfU1BJ
TkxPQ0tfSCAqLwo+PiBJIGFtIGZpbmUgd2l0aCB0aGUgY3VycmVudCBjaGFuZ2UuIEhvd2V2ZXIs
IG1vZGVybiBvcHRpbWl6aW5nIGNvbXBpbGVyIHNob3VsZCBiZSBhYmxlIHRvIGF2b2lkIHRoZSBy
ZWR1bmRhbnQgbWVtb3J5IHJlYWQgYW55d2F5LiBTbyB0aGlzIHBhdGNoIG1heSBub3QgaGF2ZSBh
biBpbXBhY3QgZnJvbSB0aGUgcGVyZm9ybWFuY2UgcG9pbnQgb2Ygdmlldy4KPiBhcmNoX3NwaW5f
dmFsdWVfdW5sb2NrZWQgaXMgY2FsbGVkIHdpdGggbG9ja3JlZiBsaWtlIHRoaXM6Cj4KPiAjZGVm
aW5lIENNUFhDSEdfTE9PUChDT0RFLCBTVUNDRVNTKSBkbyB7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgICBpbnQgcmV0cnkgPSAxMDA7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAg
ICAgc3RydWN0IGxvY2tyZWYgb2xkOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgIEJVSUxEX0JVR19PTihzaXplb2Yob2xkKSAh
PSA4KTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAg
ICBvbGQubG9ja19jb3VudCA9IFJFQURfT05DRShsb2NrcmVmLT5sb2NrX2NvdW50KTsgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gICAgICAgICAgd2hpbGUgKGxpa2VseShhcmNoX3NwaW5fdmFs
dWVfdW5sb2NrZWQob2xkLmxvY2sucmxvY2sucmF3X2xvY2spKSkgeyAgICAgXAo+Cj4gV2l0aCBt
b2Rlcm4gb3B0aW1pemluZyBjb21waWxlciwgSXMgaXQgcG9zc2libGUgdGhhdCBvbGQgdmFsdWUg
b2YKPiBvbGQubG9jay5ybG9jay5yYXdfbG9jayBpcyBjYWNoZWQgaW4gcmVnaXN0ZXIsIGRlc3Bp
dGUgdGhhdCB0cnlfY21weGNoZzY0X3JlbGF4ZWQKPiBtb2RpZmllcyB0aGUgbWVtb3J5IG9mIG9s
ZC5sb2NrX2NvdW50IHdpdGggbmV3IHZhbHVlPwoKV2hhdCBJIG1lYW50IGlzIHRoYXQgdGhlIGNh
bGwgdG8gYXJjaF9zcGluX3ZhbHVlX3VubG9ja2VkKCkgYXMgaXQgaXMgCnRvZGF5IHdpbGwgbm90
IGdlbmVyYXRlIDIgbWVtb3J5IHJlYWRzIG9mIHRoZSBzYW1lIGxvY2F0aW9uIHdpdGggb3IgCndp
dGhvdXQgdGhlIHBhdGNoLiBPZiBjb3Vyc2UsIGEgbmV3IG1lbW9yeSByZWFkIHdpbGwgYmUgbmVl
ZGVkIGFmdGVyIGEgCmZhaWxlZCBjbXB4Y2hnKCkuCgpDaGVlcnMsCkxvbmdtYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
