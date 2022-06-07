Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D390C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 01:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VTFE4TFBWEvkgZgxuFUBbZkF/H6Z4P6UE92CZCsLMro=; b=YyoVLI1V2TAzr5ervb3ZJP31bV
	zjH/ka+0/aM4oOoG0sltadQ9+YLHJsHZdNNhrzp6lf9QOvbnYvLdJHcL/yzVQEyUo8KuzOBpPqB+f
	Pzt2li6yXJnokodXnhsfyqoLYjil9MWAFPGzO/I9xpLDhmKzSlEmwhXZJ9NYMBtEn3VMsVjJBdX+9
	HEb+AvrlOsfxNOyuy7oFZm342bNE0Qd/tN7iqQyUv+vRdIwEx5Rs3qtvkSg/aYz5RKeT8pcVNq0bX
	HqjrjEFBK1TA9qWtgsl/QDPMwAUi3RvRhweQJdu/REfC2BWYagAl3suVEM7pGJIMshlUe7y9d7Ge6
	MMTg3FFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyOIM-0042MU-4h; Tue, 07 Jun 2022 01:46:10 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyOII-0042M0-JI
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 01:46:09 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R561e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0VFbCL8E_1654566361;
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VFbCL8E_1654566361)
          by smtp.aliyun-inc.com;
          Tue, 07 Jun 2022 09:46:02 +0800
Subject: Re: [PATCH v3] RISC-V: Add fixup to support fast call of
 crash_kexec()
To: Kefeng Wang <wangkefeng.wang@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, philipp.tomsich@vrull.eu,
 ebiederm@xmission.com, heiko@sntech.de, vitaly.wool@konsulko.com,
 tongtiangen@huawei.com, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220606123750.2884245-1-xianting.tian@linux.alibaba.com>
 <b2a45f97-0f97-6621-bb7e-11f51282c468@huawei.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <b1098514-d185-e649-6dea-3c2f01e97ea8@linux.alibaba.com>
Date: Tue, 7 Jun 2022 09:46:01 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b2a45f97-0f97-6621-bb7e-11f51282c468@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_184606_843498_08B8394F 
X-CRM114-Status: GOOD (  14.66  )
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

CuWcqCAyMDIyLzYvNyDkuIrljYg5OjIxLCBLZWZlbmcgV2FuZyDlhpnpgZM6Cj4KPiBPbiAyMDIy
LzYvNiAyMDozNywgWGlhbnRpbmcgVGlhbiB3cm90ZToKPj4gQ3VycmVudGx5LCBhbG1vc3QgYWxs
IGFyY2hzICh4ODYsIGFybTY0LCBtaXBzLi4uKSBzdXBwb3J0IGZhc3QgY2FsbAo+PiBvZiBjcmFz
aF9rZXhlYygpIHdoZW4gInJlZ3MgJiYga2V4ZWNfc2hvdWxkX2NyYXNoKCkiIGlzIHRydWUuIEJ1
dAo+PiBSSVNDLVYgbm90LCBpdCBjYW4gb25seSBlbnRlciBjcmFzaCBzeXN0ZW0gdmlhIHBhbmlj
KCkuIEhvd2V2ZXIgcGFuaWMoKQo+PiBkb2Vzbid0IHBhc3MgdGhlIHJlZ3Mgb2YgdGhlIHJlYWwg
YWNjaWRlbnQgc2NlbmUgdG8gY3Jhc2hfa2V4ZWMoKSwKPj4gaXQgY2F1c2VkIHdlIGNhbid0IGdl
dCBhY2N1cmF0ZSBiYWNrdHJhY2UgdmlhIGdkYiwKPj4gwqDCoMKgwqAkIHJpc2N2NjQtbGludXgt
Z251LWdkYiB2bWxpbnV4IHZtY29yZQo+PiDCoMKgwqDCoFJlYWRpbmcgc3ltYm9scyBmcm9tIHZt
bGludXguLi4KPj4gwqDCoMKgwqBbTmV3IExXUCA5NV0KPj4gwqDCoMKgwqAjMMKgIGNvbnNvbGVf
dW5sb2NrICgpIGF0IGtlcm5lbC9wcmludGsvcHJpbnRrLmM6MjU1Nwo+PiDCoMKgwqDCoDI1NTfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZG9fY29uZF9yZXNjaGVk
KQo+PiDCoMKgwqDCoChnZGIpIGJ0Cj4+IMKgwqDCoMKgIzDCoCBjb25zb2xlX3VubG9jayAoKSBh
dCBrZXJuZWwvcHJpbnRrL3ByaW50ay5jOjI1NTcKPj4gwqDCoMKgwqAjMcKgIDB4MDAwMDAwMDAw
MDAwMDAwMCBpbiA/PyAoKQo+Pgo+PiBXaXRoIHRoZSBwYXRjaCB3ZSBjYW4gZ2V0IHRoZSBhY2N1
cmF0ZSBiYWNrdHJhY2UsCj4+IMKgwqDCoMKgJCByaXNjdjY0LWxpbnV4LWdudS1nZGIgdm1saW51
eCB2bWNvcmUKPj4gwqDCoMKgwqBSZWFkaW5nIHN5bWJvbHMgZnJvbSB2bWxpbnV4Li4uCj4+IMKg
wqDCoMKgW05ldyBMV1AgOTVdCj4+IMKgwqDCoMKgIzDCoCAweGZmZmZmZmUwMDA2M2E0ZTAgaW4g
dGVzdF90aHJlYWQgKGRhdGE9PG9wdGltaXplZCBvdXQ+KSBhdCAKPj4gZHJpdmVycy90ZXN0X2Ny
YXNoLmM6ODEKPj4gwqDCoMKgwqA4McKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqKGludCAqKXAg
PSAweGRlYWQ7Cj4+IMKgwqDCoMKgKGdkYikKPj4gwqDCoMKgwqAoZ2RiKSBidAo+PiDCoMKgwqDC
oCMwwqAgMHhmZmZmZmZlMDAwNjRkNWMwIGluIHRlc3RfdGhyZWFkIChkYXRhPTxvcHRpbWl6ZWQg
b3V0PikgYXQgCj4+IGRyaXZlcnMvdGVzdF9jcmFzaC5jOjgxCj4+IMKgwqDCoMKgIzHCoCAweDAw
MDAwMDAwMDAwMDAwMDAgaW4gPz8gKCkKPj4KPj4gVGVzdCBjb2RlIHRvIHByb2R1Y2UgTlVMTCBh
ZGRyZXNzIGRlcmVmZXJlbmNlIGluIHRlc3RfY3Jhc2guYywKPj4gwqDCoMKgwqB2b2lkICpwID0g
TlVMTDsKPj4gwqDCoMKgwqAqKGludCAqKXAgPSAweGRlYWQ7Cj4+Cj4+IEZpeGVzOiA3NmQyYTA0
OTNhMTcgKCJSSVNDLVY6IEluaXQgYW5kIEhhbHQgQ29kZSIpCj4+IFJldmlld2VkLWJ5OiBHdW8g
UmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogWGlhbnRpbmcgVGlhbiA8
eGlhbnRpbmcudGlhbkBsaW51eC5hbGliYWJhLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgZnJvbSB2
MToKPj4gLSBzaW1wbGlmeSB0aGUgY29tbWl0IG1lc3NhZ2UKPj4gQ2hhbmdlcyBmcm9tIHYyOgo+
PiAtIGFkZCBmaXh1cCBpbiB0aXRsZQo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYyB8IDQgKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdHJhcHMuYwo+PiBpbmRleCBiNDA0MjY1MDkyNDQuLjM5ZDBmOGJiYTRiNCAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwcy5jCj4+IEBAIC0xNiw2ICsxNiw3IEBACj4+IMKgICNpbmNsdWRlIDxsaW51eC9tbS5o
Pgo+PiDCoCAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9p
cnEuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9rZXhlYy5oPgo+PiDCoCDCoCAjaW5jbHVkZSA8YXNt
L2FzbS1wcm90b3R5cGVzLmg+Cj4+IMKgICNpbmNsdWRlIDxhc20vYnVnLmg+Cj4+IEBAIC00NCw2
ICs0NSw5IEBAIHZvaWQgZGllKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBjb25zdCBjaGFyICpzdHIp
Cj4+IMKgIMKgwqDCoMKgwqAgcmV0ID0gbm90aWZ5X2RpZShESUVfT09QUywgc3RyLCByZWdzLCAw
LCByZWdzLT5jYXVzZSwgU0lHU0VHVik7Cj4+IMKgICvCoMKgwqAgaWYgKHJlZ3MgJiYga2V4ZWNf
c2hvdWxkX2NyYXNoKGN1cnJlbnQpKQo+PiArwqDCoMKgwqDCoMKgwqAgY3Jhc2hfa2V4ZWMocmVn
cyk7Cj4+ICsKPgo+IEl0IHNlZW1zIHRoYXQgdGhlIHJlZ3Mgd29uJ3QgYmUgbnVsbCwgcmlnaHQ/
IGV4Y2VwdCB0aGF0LAoKQXV0dWFsbHkgYm90aCByZWdzIHdvbid0IGJlIG51bGwsIEJ1dCBpZiBp
dCBpcyB0cmlnZ2VyZWQgYnkgcGFuaWMoKSAsIAp0aGUgcmVncyBhcmUgZ290IHZpYSByaXNjdl9j
cmFzaF9zYXZlX3JlZ3MoKSwgd2hpY2ggYXJlIHRoZSByZWdzIG9mIHRoYXQgCm1vbWVudCwgYnV0
IG5vdCB0aGUgcmVhbCBhY2NpZGVudCBzY2VuZS4KCj4KPiBSZXZpZXdlZC1ieTogS2VmZW5nIFdh
bmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+Cj4+IMKgwqDCoMKgwqAgYnVzdF9zcGlu
bG9ja3MoMCk7Cj4+IMKgwqDCoMKgwqAgYWRkX3RhaW50KFRBSU5UX0RJRSwgTE9DS0RFUF9OT1df
VU5SRUxJQUJMRSk7Cj4+IMKgwqDCoMKgwqAgc3Bpbl91bmxvY2tfaXJxKCZkaWVfbG9jayk7Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
