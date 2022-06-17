Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AB1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 06:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGy6XGgkJZgVwX4AduaGHN+UTa2FPyRC1dMSYmWk2xc=; b=uWHaogHDLa7sn2bDZwpBx/Un+M
	WbOZEZreV0s23sdxVjj6AhaRPwYOT17yOLIwsyYR4UKaTW4H0Xn8zvoiEBB1kdYmuf2w9Ct9vfytl
	kPrxWsLX9iQRb9dJShvVimz5b0ZJoOJFLb6g++xfd7ZL7xZDx3+W4U0qhvxg3tZrCfMFHJpyJUqSP
	AZd1Si7s35giHwhpv4k1UBN3AN9H8UKZOLK7w1GjWzJnAMjDiAt6k5Nst3f78TpAQOnOdU6TysxNl
	IByAmZpdqQtyPznk7LeLU+GBC7XmyL8BYqK2R+bVJwd6f7HPsPMNjEU12uYLadD22JRI2vJ8JXIiE
	Y25N2mJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25f7-005ke5-5E; Fri, 17 Jun 2022 06:40:57 +0000
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25f3-005kbh-MD
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 06:40:55 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R591e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0VGdrNNM_1655448044;
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VGdrNNM_1655448044)
          by smtp.aliyun-inc.com;
          Fri, 17 Jun 2022 14:40:45 +0800
Subject: Re: [PATCH v3] RISC-V: Add fixup to support fast call of
 crash_kexec()
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, philipp.tomsich@vrull.eu,
 ebiederm@xmission.com, heiko@sntech.de, vitaly.wool@konsulko.com,
 tongtiangen@huawei.com, guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220606123750.2884245-1-xianting.tian@linux.alibaba.com>
 <b2a45f97-0f97-6621-bb7e-11f51282c468@huawei.com>
 <b1098514-d185-e649-6dea-3c2f01e97ea8@linux.alibaba.com>
Message-ID: <9fa53c5b-361a-a044-a08b-57458d7fcab8@linux.alibaba.com>
Date: Fri, 17 Jun 2022 14:40:44 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b1098514-d185-e649-6dea-3c2f01e97ea8@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_234053_929477_15393E6F 
X-CRM114-Status: GOOD (  13.03  )
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

SGkgUGFsbWVyCgpXaWxsIHlvdSBhcHBseSB0aGlzIHBhdGNoIGZvciA1LjE5PwoKdGhhbmtzCgrl
nKggMjAyMi82Lzcg5LiK5Y2IOTo0NiwgWGlhbnRpbmcgVGlhbiDlhpnpgZM6Cj4KPiDlnKggMjAy
Mi82Lzcg5LiK5Y2IOToyMSwgS2VmZW5nIFdhbmcg5YaZ6YGTOgo+Pgo+PiBPbiAyMDIyLzYvNiAy
MDozNywgWGlhbnRpbmcgVGlhbiB3cm90ZToKPj4+IEN1cnJlbnRseSwgYWxtb3N0IGFsbCBhcmNo
cyAoeDg2LCBhcm02NCwgbWlwcy4uLikgc3VwcG9ydCBmYXN0IGNhbGwKPj4+IG9mIGNyYXNoX2tl
eGVjKCkgd2hlbiAicmVncyAmJiBrZXhlY19zaG91bGRfY3Jhc2goKSIgaXMgdHJ1ZS4gQnV0Cj4+
PiBSSVNDLVYgbm90LCBpdCBjYW4gb25seSBlbnRlciBjcmFzaCBzeXN0ZW0gdmlhIHBhbmljKCku
IEhvd2V2ZXIgcGFuaWMoKQo+Pj4gZG9lc24ndCBwYXNzIHRoZSByZWdzIG9mIHRoZSByZWFsIGFj
Y2lkZW50IHNjZW5lIHRvIGNyYXNoX2tleGVjKCksCj4+PiBpdCBjYXVzZWQgd2UgY2FuJ3QgZ2V0
IGFjY3VyYXRlIGJhY2t0cmFjZSB2aWEgZ2RiLAo+Pj4gwqDCoMKgwqAkIHJpc2N2NjQtbGludXgt
Z251LWdkYiB2bWxpbnV4IHZtY29yZQo+Pj4gwqDCoMKgwqBSZWFkaW5nIHN5bWJvbHMgZnJvbSB2
bWxpbnV4Li4uCj4+PiDCoMKgwqDCoFtOZXcgTFdQIDk1XQo+Pj4gwqDCoMKgwqAjMMKgIGNvbnNv
bGVfdW5sb2NrICgpIGF0IGtlcm5lbC9wcmludGsvcHJpbnRrLmM6MjU1Nwo+Pj4gwqDCoMKgwqAy
NTU3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRvX2NvbmRfcmVz
Y2hlZCkKPj4+IMKgwqDCoMKgKGdkYikgYnQKPj4+IMKgwqDCoMKgIzDCoCBjb25zb2xlX3VubG9j
ayAoKSBhdCBrZXJuZWwvcHJpbnRrL3ByaW50ay5jOjI1NTcKPj4+IMKgwqDCoMKgIzHCoCAweDAw
MDAwMDAwMDAwMDAwMDAgaW4gPz8gKCkKPj4+Cj4+PiBXaXRoIHRoZSBwYXRjaCB3ZSBjYW4gZ2V0
IHRoZSBhY2N1cmF0ZSBiYWNrdHJhY2UsCj4+PiDCoMKgwqDCoCQgcmlzY3Y2NC1saW51eC1nbnUt
Z2RiIHZtbGludXggdm1jb3JlCj4+PiDCoMKgwqDCoFJlYWRpbmcgc3ltYm9scyBmcm9tIHZtbGlu
dXguLi4KPj4+IMKgwqDCoMKgW05ldyBMV1AgOTVdCj4+PiDCoMKgwqDCoCMwwqAgMHhmZmZmZmZl
MDAwNjNhNGUwIGluIHRlc3RfdGhyZWFkIChkYXRhPTxvcHRpbWl6ZWQgb3V0PikgYXQgCj4+PiBk
cml2ZXJzL3Rlc3RfY3Jhc2guYzo4MQo+Pj4gwqDCoMKgwqA4McKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqKGludCAqKXAgPSAweGRlYWQ7Cj4+PiDCoMKgwqDCoChnZGIpCj4+PiDCoMKgwqDCoChn
ZGIpIGJ0Cj4+PiDCoMKgwqDCoCMwwqAgMHhmZmZmZmZlMDAwNjRkNWMwIGluIHRlc3RfdGhyZWFk
IChkYXRhPTxvcHRpbWl6ZWQgb3V0PikgYXQgCj4+PiBkcml2ZXJzL3Rlc3RfY3Jhc2guYzo4MQo+
Pj4gwqDCoMKgwqAjMcKgIDB4MDAwMDAwMDAwMDAwMDAwMCBpbiA/PyAoKQo+Pj4KPj4+IFRlc3Qg
Y29kZSB0byBwcm9kdWNlIE5VTEwgYWRkcmVzcyBkZXJlZmVyZW5jZSBpbiB0ZXN0X2NyYXNoLmMs
Cj4+PiDCoMKgwqDCoHZvaWQgKnAgPSBOVUxMOwo+Pj4gwqDCoMKgwqAqKGludCAqKXAgPSAweGRl
YWQ7Cj4+Pgo+Pj4gRml4ZXM6IDc2ZDJhMDQ5M2ExNyAoIlJJU0MtVjogSW5pdCBhbmQgSGFsdCBD
b2RlIikKPj4+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPj4+IFNp
Z25lZC1vZmYtYnk6IFhpYW50aW5nIFRpYW4gPHhpYW50aW5nLnRpYW5AbGludXguYWxpYmFiYS5j
b20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgZnJvbSB2MToKPj4+IC0gc2ltcGxpZnkgdGhlIGNvbW1p
dCBtZXNzYWdlCj4+PiBDaGFuZ2VzIGZyb20gdjI6Cj4+PiAtIGFkZCBmaXh1cCBpbiB0aXRsZQo+
Pj4gLS0tCj4+PiDCoCBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgNCArKysrCj4+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+PiBpbmRl
eCBiNDA0MjY1MDkyNDQuLjM5ZDBmOGJiYTRiNCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4+IEBA
IC0xNiw2ICsxNiw3IEBACj4+PiDCoCAjaW5jbHVkZSA8bGludXgvbW0uaD4KPj4+IMKgICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KPj4+IMKgICNpbmNsdWRlIDxsaW51eC9pcnEuaD4KPj4+ICsj
aW5jbHVkZSA8bGludXgva2V4ZWMuaD4KPj4+IMKgIMKgICNpbmNsdWRlIDxhc20vYXNtLXByb3Rv
dHlwZXMuaD4KPj4+IMKgICNpbmNsdWRlIDxhc20vYnVnLmg+Cj4+PiBAQCAtNDQsNiArNDUsOSBA
QCB2b2lkIGRpZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgY29uc3QgY2hhciAqc3RyKQo+Pj4gwqAg
wqDCoMKgwqDCoCByZXQgPSBub3RpZnlfZGllKERJRV9PT1BTLCBzdHIsIHJlZ3MsIDAsIHJlZ3Mt
PmNhdXNlLCBTSUdTRUdWKTsKPj4+IMKgICvCoMKgwqAgaWYgKHJlZ3MgJiYga2V4ZWNfc2hvdWxk
X2NyYXNoKGN1cnJlbnQpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNyYXNoX2tleGVjKHJlZ3MpOwo+
Pj4gKwo+Pgo+PiBJdCBzZWVtcyB0aGF0IHRoZSByZWdzIHdvbid0IGJlIG51bGwsIHJpZ2h0PyBl
eGNlcHQgdGhhdCwKPgo+IEF1dHVhbGx5IGJvdGggcmVncyB3b24ndCBiZSBudWxsLCBCdXQgaWYg
aXQgaXMgdHJpZ2dlcmVkIGJ5IHBhbmljKCkgLCAKPiB0aGUgcmVncyBhcmUgZ290IHZpYSByaXNj
dl9jcmFzaF9zYXZlX3JlZ3MoKSwgd2hpY2ggYXJlIHRoZSByZWdzIG9mIAo+IHRoYXQgbW9tZW50
LCBidXQgbm90IHRoZSByZWFsIGFjY2lkZW50IHNjZW5lLgo+Cj4+Cj4+IFJldmlld2VkLWJ5OiBL
ZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4+Cj4+PiDCoMKgwqDCoMKg
IGJ1c3Rfc3BpbmxvY2tzKDApOwo+Pj4gwqDCoMKgwqDCoCBhZGRfdGFpbnQoVEFJTlRfRElFLCBM
T0NLREVQX05PV19VTlJFTElBQkxFKTsKPj4+IMKgwqDCoMKgwqAgc3Bpbl91bmxvY2tfaXJxKCZk
aWVfbG9jayk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
