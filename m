Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F7FC4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 09:08:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5304460187
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 09:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5304460187
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwnquV5zc4ZVUKWaN2ICQee3xZmjooY5OK/iEWtYeKE=; b=kZKy8U/XYM36Hdhq4ZVgaJX4E8
	uHqjc1ZtYgls5vKXT+LZXEK3JsTP201jKu/kItdkzqRTp57tSmf90hxzbM5aj+O1CJkRCf0Q8A/Tu
	WTlqSlK6ndo2rsoQz2EDKa0EdH8g2HNnRyu5zjGia2D4OxeuXN1QhXo/Ap2jo4xfTh4oqQCLBjJjH
	+gaJYrpF9m4Ql4bt26nA5L3B0c1VlGnVD9LnFRgq2xSqK1zvM8q/cS+m8/3CgJORkWB+GNgXxs91C
	o8p/hlqm7tsNqMcd8RI2AeEnbdcUAvSNH4FRtcakIYy4ceoxGwiX9voHSo1D6L2QvL5617yrhNq86
	GIo6wnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8fY4-0005d3-F5; Wed, 28 Jul 2021 09:08:20 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8fXy-0005ZV-UG
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 09:08:18 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BBB541BF20A;
 Wed, 28 Jul 2021 09:08:04 +0000 (UTC)
Subject: Re: [PATCH] riscv: fix the global name pfn_base confliction error
To: Lee Ken <nek.in.cn@gmail.com>
References: <20210728064318.375747-1-nek.in.cn@gmail.com>
 <0e81c8d2-468a-9afd-bce3-0e8211baa065@ghiti.fr>
 <CA+CqrBQPou5QuYfHUYzbe7j2AUPpmBQs1HQJgjJo5QtF51LmXw@mail.gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 moi <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@wdc.com>, Kenneth Lee <liguozhu@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Guo Ren <guoren@linux.alibaba.com>,
 Jisheng Zhang <jszhang@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 "guohanjun@huawei.com" <guohanjun@huawei.com>,
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <4da4adaf-9bd8-6463-9230-5a3a73f323ba@ghiti.fr>
Date: Wed, 28 Jul 2021 11:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CA+CqrBQPou5QuYfHUYzbe7j2AUPpmBQs1HQJgjJo5QtF51LmXw@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_020815_306734_EBB53F69 
X-CRM114-Status: GOOD (  22.29  )
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

CgpMZSAyOC8wNy8yMDIxIMOgIDA5OjMzLCBMZWUgS2VuIGEgw6ljcml0wqA6Cj4gT24gV2VkLCBK
dWwgMjgsIDIwMjEgYXQgMzoxOSBQTSBBbGV4IEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToK
Pj4KPj4gSGkgS2VubmV0aCwKPj4KPj4gTGUgMjgvMDcvMjAyMSDDoCAwODo0MywgS2VubmV0aCBM
ZWUgYSDDqWNyaXQgOgo+Pj4gRnJvbTogS2VubmV0aCBMZWUgPGxpZ3Vvemh1QGhpc2lsaWNvbi5j
b20+Cj4+Pgo+Pj4gUklTQ1YgdXNlIGEgZ2xvYmFsIHZhcmlhYmxlIHBmbl9iYXNlIGZvciBwYWdl
L3BmbiB0cmFuc2xhdGlvbi4gQnV0IHRoaXMKPj4+IGlzIGEgY29tbW9uIG5hbWUgYW5kIHdpbGwg
YmUgdXNlZCBlbHNld2hlcmUuIEluIHRob3NlIGNhc2UsCj4+PiB0aGUgcGFnZS1wZm4gbWFjcm8g
d2hpY2ggcmVmZXIgdGhpcyBuYW1lIHdpbGwgcmVmZXIgdG8gdGhlIGxvY2FsL2lucHV0Cj4+PiB2
YXJpYWJsZSBvZiB0aG9zZSBmdW5jdGlvbiAoc3VjaCBhcyBpbiB2ZmlvX3Bpbl9wYWdlc19yZW1v
dGUpLiBUaGlzIG1ha2UKPj4+IGV2ZXJ5dGhpbmcgd3JvbmcuCj4+Pgo+Pj4gVGhpcyBwYXRjaCBj
aGFuZ2UgdGhlIG5hbWUgZnJvbSBwZm5fYmFzZSB0byByaXNjdl9nbG9iYWxfcGZuX2Jhc2UgdG8g
Zml4Cj4+PiB0aGlzIHByb2JsZW0KPj4KPj4gV2hhdCBhYm91dCByZW1vdmluZyB0aGlzIHZhcmlh
YmxlIGVudGlyZWx5IGFuZCB1c2luZwo+PiBQRk5fRE9XTihrZXJuZWxfbWFwLnBoeXNfYWRkcikg
ZGlyZWN0bHkgaW4gQVJDSF9QRk5fT0ZGU0VUIGRlZmluaXRpb24/Cj4+IFRoYXQgd291bGQgcmVt
b3ZlIGNvZGUgZnJvbSBtbS9pbml0LmMsIHdoaWNoIGlzIG5pY2UgOikKPj4KPj4gVGhhbmtzLAo+
Pgo+PiBBbGV4Cj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogS2VubmV0aCBMZWUgPGxpZ3Vvemh1
QGhpc2lsaWNvbi5jb20+Cj4+PiAtLS0KPj4+ICAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFn
ZS5oIHwgNCArKy0tCj4+PiAgICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICB8IDYgKysr
LS0tCj4+PiAgICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+Pj4gaW5kZXggY2NhODc2NGFlZDgzLi44NzEx
ZTQxNWYzN2MgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+
Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKPj4+IEBAIC03OSw4ICs3OSw4
IEBAIHR5cGVkZWYgc3RydWN0IHBhZ2UgKnBndGFibGVfdDsKPj4+ICAgICNlbmRpZgo+Pj4KPj4+
ICAgICNpZmRlZiBDT05GSUdfTU1VCj4+PiAtZXh0ZXJuIHVuc2lnbmVkIGxvbmcgcGZuX2Jhc2U7
Cj4+PiAtI2RlZmluZSBBUkNIX1BGTl9PRkZTRVQgICAgICAgICAgICAgIChwZm5fYmFzZSkKPj4+
ICtleHRlcm4gdW5zaWduZWQgbG9uZyByaXNjdl9nbG9iYWxfcGZuX2Jhc2U7Cj4+PiArI2RlZmlu
ZSBBUkNIX1BGTl9PRkZTRVQgICAgICAgICAgICAgIChyaXNjdl9nbG9iYWxfcGZuX2Jhc2UpCj4+
PiAgICAjZWxzZQo+Pj4gICAgI2RlZmluZSBBUkNIX1BGTl9PRkZTRVQgICAgICAgICAgICAgKFBB
R0VfT0ZGU0VUID4+IFBBR0VfU0hJRlQpCj4+PiAgICAjZW5kaWYgLyogQ09ORklHX01NVSAqLwo+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0
LmMKPj4+IGluZGV4IGExNGJmMzkxMGVlYy4uMmNlNGU5YTQ2Y2EwIDEwMDY0NAo+Pj4gLS0tIGEv
YXJjaC9yaXNjdi9tbS9pbml0LmMKPj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+PiBA
QCAtMjI4LDggKzIyOCw4IEBAIHN0YXRpYyBzdHJ1Y3QgcHRfYWxsb2Nfb3BzIF9wdF9vcHMgX19p
bml0ZGF0YTsKPj4+ICAgICNkZWZpbmUgcHRfb3BzIF9wdF9vcHMKPj4+ICAgICNlbmRpZgo+Pj4K
Pj4+IC11bnNpZ25lZCBsb25nIHBmbl9iYXNlIF9fcm9fYWZ0ZXJfaW5pdDsKPj4+IC1FWFBPUlRf
U1lNQk9MKHBmbl9iYXNlKTsKPj4+ICt1bnNpZ25lZCBsb25nIHJpc2N2X2dsb2JhbF9wZm5fYmFz
ZSBfX3JvX2FmdGVyX2luaXQ7Cj4+PiArRVhQT1JUX1NZTUJPTChyaXNjdl9nbG9iYWxfcGZuX2Jh
c2UpOwo+Pj4KPj4+ICAgIHBnZF90IHN3YXBwZXJfcGdfZGlyW1BUUlNfUEVSX1BHRF0gX19wYWdl
X2FsaWduZWRfYnNzOwo+Pj4gICAgcGdkX3QgdHJhbXBvbGluZV9wZ19kaXJbUFRSU19QRVJfUEdE
XSBfX3BhZ2VfYWxpZ25lZF9ic3M7Cj4+PiBAQCAtNTcyLDcgKzU3Miw3IEBAIGFzbWxpbmthZ2Ug
dm9pZCBfX2luaXQgc2V0dXBfdm0odWludHB0cl90IGR0Yl9wYSkKPj4+ICAgICAgICBrZXJuZWxf
bWFwLnZhX2tlcm5lbF9wYV9vZmZzZXQgPSBrZXJuZWxfbWFwLnZpcnRfYWRkciAtIGtlcm5lbF9t
YXAucGh5c19hZGRyOwo+Pj4gICAgI2VuZGlmCj4+Pgo+Pj4gLSAgICAgcGZuX2Jhc2UgPSBQRk5f
RE9XTihrZXJuZWxfbWFwLnBoeXNfYWRkcik7Cj4+PiArICAgICByaXNjdl9nbG9iYWxfcGZuX2Jh
c2UgPSBQRk5fRE9XTihrZXJuZWxfbWFwLnBoeXNfYWRkcik7Cj4+Pgo+Pj4gICAgICAgIC8qCj4+
PiAgICAgICAgICogRW5mb3JjZSBib290IGFsaWdubWVudCByZXF1aXJlbWVudHMgb2YgUlYzMiBh
bmQKPj4+Cj4gCj4gWWVzLiBJdCBpcyBhIGNob2ljZS4gQnV0IEkgdGhpbmsgaXQgaXMgdGhlIGNo
b2ljZSBvZiB0aGUgbWFpbnRhaW5lciBvZgo+IHRoZSBtb2R1bGUuIEhlIHNob3VsZCBoYXZlIGEg
ZnVsbCBjb25zaWRlcmF0aW9uIG9uIGhvdyB0byBleHBvc2UgdGhlCj4gaW50ZXJmYWNlLiBJJ20g
bm93IGp1c3Qgd29ya2luZyBmb3IgVkZJTyBlbmFibGVtZW50IGluIFJJU0NWLiBJdCBpcwo+IG5v
dCB3aXNlIHRvIGJlIHRyYXBwZWQgaW50byB0aGlzOykKPiAKCkkgdGhpbmsgdGhlcmUgaXMgYSBt
aXN1bmRlcnN0YW5kaW5nLCBJIHN1Z2dlc3RlZCB0byBkbyB0aGUgZm9sbG93aW5nIHRvIApnZXQg
cmlkIG9mIHBmbl9iYXNlIGVudGlyZWx5OgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGFnZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmgKaW5kZXggYWRmNWI0
NjcxNjg0Li44YWZiM2RiNjFlYjAgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGFnZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCkBAIC03OSw4ICs3OSw3
IEBAIHR5cGVkZWYgc3RydWN0IHBhZ2UgKnBndGFibGVfdDsKICAjZW5kaWYKCiAgI2lmZGVmIENP
TkZJR19NTVUKLWV4dGVybiB1bnNpZ25lZCBsb25nIHBmbl9iYXNlOwotI2RlZmluZSBBUkNIX1BG
Tl9PRkZTRVQgICAgICAgICAgICAgICAgKHBmbl9iYXNlKQorI2RlZmluZSBBUkNIX1BGTl9PRkZT
RVQgICAgICAgICAgICAgICAgKFBGTl9ET1dOKGtlcm5lbF9tYXAucGh5c19hZGRyKSkKICAjZWxz
ZQogICNkZWZpbmUgQVJDSF9QRk5fT0ZGU0VUICAgICAgICAgICAgICAgIChQQUdFX09GRlNFVCA+
PiBQQUdFX1NISUZUKQogICNlbmRpZiAvKiBDT05GSUdfTU1VICovCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCmluZGV4IGM5YTYzNjJkOGM3
Zi4uYzUxZjBkYTAzYTYyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYworKysgYi9h
cmNoL3Jpc2N2L21tL2luaXQuYwpAQCAtMjExLDkgKzIxMSw2IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBzZXR1cF9ib290bWVtKHZvaWQpCiAgI2lmZGVmIENPTkZJR19NTVUKICBzdGF0aWMgc3RydWN0
IHB0X2FsbG9jX29wcyBwdF9vcHMgX19pbml0ZGF0YTsKCi11bnNpZ25lZCBsb25nIHBmbl9iYXNl
IF9fcm9fYWZ0ZXJfaW5pdDsKLUVYUE9SVF9TWU1CT0wocGZuX2Jhc2UpOwotCiAgcGdkX3Qgc3dh
cHBlcl9wZ19kaXJbUFRSU19QRVJfUEdEXSBfX3BhZ2VfYWxpZ25lZF9ic3M7CiAgcGdkX3QgdHJh
bXBvbGluZV9wZ19kaXJbUFRSU19QRVJfUEdEXSBfX3BhZ2VfYWxpZ25lZF9ic3M7CiAgZXh0ZXJu
IHB0ZV90IGZpeG1hcF9wdGVbUFRSU19QRVJfUFRFXTsvLyBfX3BhZ2VfYWxpZ25lZF9ic3M7CkBA
IC02MDgsOCArNjA1LDYgQEAgYXNtbGlua2FnZSB2b2lkIF9faW5pdCBzZXR1cF92bSh1aW50cHRy
X3QgZHRiX3BhKQogICAgICAgICBrZXJuZWxfbWFwLnZhX3BhX29mZnNldCA9IFBBR0VfT0ZGU0VU
IC0ga2VybmVsX21hcC5waHlzX2FkZHI7CiAgICAgICAgIGtlcm5lbF9tYXAudmFfa2VybmVsX3Bh
X29mZnNldCA9IGtlcm5lbF9tYXAudmlydF9hZGRyIC0gCmtlcm5lbF9tYXAucGh5c19hZGRyOwoK
LSAgICAgICBwZm5fYmFzZSA9IFBGTl9ET1dOKGtlcm5lbF9tYXAucGh5c19hZGRyKTsKLQogICAg
ICAgICAvKiBTYW5pdHkgY2hlY2sgYWxpZ25tZW50IGFuZCBzaXplICovCiAgICAgICAgIEJVR19P
TigoUEFHRV9PRkZTRVQgJSBQR0RJUl9TSVpFKSAhPSAwKTsKICAgICAgICAgQlVHX09OKChrZXJu
ZWxfbWFwLnBoeXNfYWRkciAlIFBNRF9TSVpFKSAhPSAwKTsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
