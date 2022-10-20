Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB94C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 02:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLD3G3l08Rwqixy1AD4bjls1vGbKzlJ0/L8y/F/rBpA=; b=X8WPXHjA0E3Q/N
	eXtDDdP6GdKWyrER44/DTSyxPqVpBoI7t/2mJZvNhHbrTl2+uopAjCk9tum/Ja4bo0Sjekxyr4oAp
	Tq1PHI4MleChymPxifwSnltH6sXKxbeAQmJlylHYBUJfIa9McgjjHtt3tbxtcZRFPlY8VGkyQTFhv
	ftf4oqfR2SDZ1k1i7kmdsjgsHveeFZvtf/gkdtcFSVeoNqnINIqDhRbwSJk6tdXBiMEfisyFxqhIH
	fPvW+TQXbflYsPnlErx6PkNyMSkizac7iU5sYfkTJPEWnR5NJpKJb1Qutx0grfJ9je4NB+PtCzEk1
	hZdXwDjQc9z1j3Wn1C2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olL7a-009QKj-RO; Thu, 20 Oct 2022 02:17:22 +0000
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olL7W-009QIL-Gm; Thu, 20 Oct 2022 02:17:20 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0VScsArB_1666232227;
Received: from 30.221.97.125(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VScsArB_1666232227)
          by smtp.aliyun-inc.com;
          Thu, 20 Oct 2022 10:17:09 +0800
Message-ID: <30621b3b-47ba-d612-cfb0-583d779691a3@linux.alibaba.com>
Date: Thu, 20 Oct 2022 10:17:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH V4 1/2] RISC-V: Add arch_crash_save_vmcoreinfo support
To: Baoquan He <bhe@redhat.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 anup@brainfault.org, heiko@sntech.de, guoren@kernel.org, mick@ics.forth.gr,
 alexandre.ghiti@canonical.com, vgoyal@redhat.com, dyoung@redhat.com,
 corbet@lwn.net, Conor.Dooley@microchip.com, bagasdotme@gmail.com,
 k-hagio-ab@nec.com, lijiang@redhat.com, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, crash-utility@redhat.com,
 heinrich.schuchardt@canonical.com, hschauhan@nulltrace.org,
 yixun.lan@gmail.com
References: <20221019103623.7008-1-xianting.tian@linux.alibaba.com>
 <20221019103623.7008-2-xianting.tian@linux.alibaba.com>
 <Y1CtreAKT/SEh4vN@MiWiFi-R3L-srv>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
In-Reply-To: <Y1CtreAKT/SEh4vN@MiWiFi-R3L-srv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_191718_760539_897F3EE3 
X-CRM114-Status: GOOD (  14.06  )
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

CuWcqCAyMDIyLzEwLzIwIOS4iuWNiDEwOjA4LCBCYW9xdWFuIEhlIOWGmemBkzoKPiBPbiAxMC8x
OS8yMiBhdCAwNjozNnBtLCBYaWFudGluZyBUaWFuIHdyb3RlOgo+PiBBZGQgYXJjaF9jcmFzaF9z
YXZlX3ZtY29yZWluZm8oKSwgd2hpY2ggZXhwb3J0cyBWTSBsYXlvdXQoTU9EVUxFUywgVk1BTExP
QywKPj4gVk1FTU1BUCByYW5nZXMgYW5kIEtFUk5FTF9MSU5LX0FERFIpLCB2YSBiaXRzIGFuZCBy
YW0gYmFzZSBmb3Igdm1jb3JlLgo+Pgo+PiBEZWZhdWx0IHBhZ2V0YWJsZSBsZXZlbHMgYW5kIFBB
R0VfT0ZGU0VUIGFyZW4ndCBzYW1lIGZvciBkaWZmZXJlbnQga2VybmVsCj4+IHZlcnNpb24gYXMg
YmVsb3cuIEZvciBwYWdldGFibGUgbGV2ZWxzLCBpdCBzZXRzIHN2NTcgYnkgZGVmYXVsdCBhbmQg
ZmFsbHMKPj4gYmFjayB0byBzZXR0aW5nIHN2NDggYXQgYm9vdCB0aW1lIGlmIHN2NTcgaXMgbm90
IHN1cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUuCj4+Cj4+IEZvciByYW0gYmFzZSwgdGhlIGRlZmF1
bHQgdmFsdWUgaXMgMHg4MDIwMDAwMCBmb3IgcWVtdSByaXNjdjY0IGVudiBhbmQsCj4+IGZvciBl
eGFtcGxlLCBpcyAweDIwMDAwMCBvbiB0aGUgWHVhblRpZSA5MTAgQ1BVLgo+Pgo+PiAgICogTGlu
dXggS2VybmVsIDUuMTggfgo+PiAgICogICAgICBQR1RBQkxFX0xFVkVMUyA9IDUKPj4gICAqICAg
ICAgUEFHRV9PRkZTRVQgPSAweGZmNjAwMDAwMDAwMDAwMDAKPj4gICAqIExpbnV4IEtlcm5lbCA1
LjE3IH4KPj4gICAqICAgICAgUEdUQUJMRV9MRVZFTFMgPSA0Cj4+ICAgKiAgICAgIFBBR0VfT0ZG
U0VUID0gMHhmZmZmYWY4MDAwMDAwMDAwCj4+ICAgKiBMaW51eCBLZXJuZWwgNC4xOSB+Cj4+ICAg
KiAgICAgIFBHVEFCTEVfTEVWRUxTID0gMwo+PiAgICogICAgICBQQUdFX09GRlNFVCA9IDB4ZmZm
ZmZmZTAwMDAwMDAwMAo+Pgo+PiBTaW5jZSB0aGVzZSBjb25maWd1cmF0aW9ucyBjaGFuZ2UgZnJv
bSB0aW1lIHRvIHRpbWUgYW5kIHZlcnNpb24gdG8gdmVyc2lvbiwKPj4gaXQgaXMgcHJlZmVyYWJs
ZSB0byBleHBvcnQgdGhlbSB2aWEgdm1jb3JlaW5mbyB0aGFuIHRvIGNoYW5nZSB0aGUgY3Jhc2gn
cwo+PiBjb2RlIGZyZXF1ZW50bHksIGl0IGNhbiBzaW1wbGlmeSB0aGUgZGV2ZWxvcG1lbnQgb2Yg
Y3Jhc2ggdG9vbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWGlhbnRpbmcgVGlhbiA8eGlhbnRpbmcu
dGlhbkBsaW51eC5hbGliYWJhLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwvTWFr
ZWZpbGUgICAgIHwgIDEgKwo+PiAgIGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX2NvcmUuYyB8IDIz
ICsrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRp
b25zKCspCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX2Nv
cmUuYwo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+PiBpbmRleCBkYjZlNGIxMjk0YmEuLjRjZjMwM2E3Nzlh
YiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPj4gQEAgLTgxLDYgKzgxLDcgQEAgb2JqLSQoQ09ORklH
X0tHREIpCQkrPSBrZ2RiLm8KPj4gICBvYmotJChDT05GSUdfS0VYRUNfQ09SRSkJKz0ga2V4ZWNf
cmVsb2NhdGUubyBjcmFzaF9zYXZlX3JlZ3MubyBtYWNoaW5lX2tleGVjLm8KPj4gICBvYmotJChD
T05GSUdfS0VYRUNfRklMRSkJKz0gZWxmX2tleGVjLm8gbWFjaGluZV9rZXhlY19maWxlLm8KPj4g
ICBvYmotJChDT05GSUdfQ1JBU0hfRFVNUCkJKz0gY3Jhc2hfZHVtcC5vCj4+ICtvYmotJChDT05G
SUdfQ1JBU0hfQ09SRSkJKz0gY3Jhc2hfY29yZS5vCj4+ICAgCj4+ICAgb2JqLSQoQ09ORklHX0pV
TVBfTEFCRUwpCSs9IGp1bXBfbGFiZWwubwo+PiAgIAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvY3Jhc2hfY29yZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2hfY29yZS5jCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uM2U4ODlkMGVkN2Jk
Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2hfY29yZS5j
Cj4+IEBAIC0wLDAgKzEsMjMgQEAKPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkKPj4gKwo+PiArI2luY2x1ZGUgPGxpbnV4L2NyYXNoX2NvcmUuaD4KPj4gKyNpbmNs
dWRlIDxsaW51eC9wYWdlbWFwLmg+Cj4+ICsKPj4gK3ZvaWQgYXJjaF9jcmFzaF9zYXZlX3ZtY29y
ZWluZm8odm9pZCkKPj4gK3sKPj4gKwlWTUNPUkVJTkZPX05VTUJFUihWQV9CSVRTKTsKPj4gKwlW
TUNPUkVJTkZPX05VTUJFUihwaHlzX3JhbV9iYXNlKTsKPj4gKwo+PiArCXZtY29yZWluZm9fYXBw
ZW5kX3N0cigiTlVNQkVSKFBBR0VfT0ZGU0VUKT0weCVseFxuIiwgUEFHRV9PRkZTRVQpOwo+PiAr
CXZtY29yZWluZm9fYXBwZW5kX3N0cigiTlVNQkVSKFZNQUxMT0NfU1RBUlQpPTB4JWx4XG4iLCBW
TUFMTE9DX1NUQVJUKTsKPj4gKwl2bWNvcmVpbmZvX2FwcGVuZF9zdHIoIk5VTUJFUihWTUFMTE9D
X0VORCk9MHglbHhcbiIsIFZNQUxMT0NfRU5EKTsKPj4gKwl2bWNvcmVpbmZvX2FwcGVuZF9zdHIo
Ik5VTUJFUihWTUVNTUFQX1NUQVJUKT0weCVseFxuIiwgVk1FTU1BUF9TVEFSVCk7Cj4+ICsJdm1j
b3JlaW5mb19hcHBlbmRfc3RyKCJOVU1CRVIoVk1FTU1BUF9FTkQpPTB4JWx4XG4iLCBWTUVNTUFQ
X0VORCk7Cj4+ICsjaWZkZWYgQ09ORklHXzY0QklUCj4+ICsJdm1jb3JlaW5mb19hcHBlbmRfc3Ry
KCJOVU1CRVIoTU9EVUxFU19WQUREUik9MHglbHhcbiIsIE1PRFVMRVNfVkFERFIpOwo+PiArCXZt
Y29yZWluZm9fYXBwZW5kX3N0cigiTlVNQkVSKE1PRFVMRVNfRU5EKT0weCVseFxuIiwgTU9EVUxF
U19FTkQpOwo+PiArI2VuZGlmCj4+ICsKPj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfNjRCSVQp
KQo+PiArCQl2bWNvcmVpbmZvX2FwcGVuZF9zdHIoIk5VTUJFUihLRVJORUxfTElOS19BRERSKT0w
eCVseFxuIiwgS0VSTkVMX0xJTktfQUREUik7Cj4gV29uZGVyaW5nIHdoeSB5b3UgZG9uJ3QgcHV0
IEtFUk5FTF9MSU5LX0FERFIgZXhwb3J0aW5nIGludG8gdGhlIGFib3ZlCj4gaWZkZWZmZXJ5IHNj
b3BlLCB3aXRoIHRoYXQgeW91IGNhbiBzYXZlIG9uZSBsaW5lIG9mICJJU19FTkFCTEVEKENPTkZJ
R182NEJJVCkiLgpJIGZvbGxvd2VkIHRoZSBydWxlIGluIHByaW50X3ZtX2xheW91dCgpIG9mIGFy
Y2gvcmlzY3YvbW0vaW5pdC5jLCB3aGljaCAKdXNlZCBJU19FTkFCTEVEIHdoZW4gcHJpbnQgdGhl
IHZhbHVlIG9mIEtFUk5FTF9MSU5LX0FERFIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
