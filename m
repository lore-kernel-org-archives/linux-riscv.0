Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC98C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 03:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42KnQzu+WqDSN+tNftkgCfGXR+vXqB+L/WFyRf3PItY=; b=XaM8d0WGT7uvi4pVv0N+WYFRuh
	5JR7NVXw5+zwGUUn0VD/8QVeMn9B9vzY5Kg70nssxDD4eH8nXnnZKa1/Hwy1Jc9raJNtqaYV0vLxW
	q9H8myAStBs5xadc/0MxizuwuTA2Yd6C5UqmiagFU1oy/ttaLFaei92aSWznJdHTBmQycFT8knZLw
	Pi/fg9HfMPSe3pUAP3MhEIJzfFjTvrAQwRvvzwc6/rX3TE+BfjrWgb9l2uSXlGqszRUV5k8IAoohg
	z+caFYNN2IaadCEfpHfh0KiV5sU07v9Pvt33eXUo3Me7RjaA/Uhb6dGrho7yP8fIJTKx/3kCzqmjT
	F/gmid2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEjXT-00HIfH-E0; Fri, 22 Jul 2022 03:41:19 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEjXQ-00HIdt-C0
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 03:41:18 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045170;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0VK3QLxV_1658461267;
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VK3QLxV_1658461267)
          by smtp.aliyun-inc.com;
          Fri, 22 Jul 2022 11:41:08 +0800
Subject: Re: [RESEND PATCH v2] RISC-V: Add fast call path of crash_kexec()
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 wangkefeng.wang@huawei.com, philipp.tomsich@vrull.eu, ebiederm@xmission.com,
 heiko@sntech.de, vitaly.wool@konsulko.com, tongtiangen@huawei.com,
 guoren@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-c42cbd7f-4935-4d16-9150-5504fd06aedd@palmer-mbp2014>
From: tianxianting <xianting.tian@linux.alibaba.com>
Message-ID: <6412d106-24c0-a2ad-79b9-de6664c8723d@linux.alibaba.com>
Date: Fri, 22 Jul 2022 11:41:07 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <mhng-c42cbd7f-4935-4d16-9150-5504fd06aedd@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_204116_622602_2457ACD3 
X-CRM114-Status: GOOD (  14.40  )
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

CuWcqCAyMDIyLzcvMjIg5LiK5Y2IODoxMSwgUGFsbWVyIERhYmJlbHQg5YaZ6YGTOgo+IE9uIE1v
biwgMDYgSnVuIDIwMjIgMDE6MjM6MDggUERUICgtMDcwMCksIAo+IHhpYW50aW5nLnRpYW5AbGlu
dXguYWxpYmFiYS5jb20gd3JvdGU6Cj4+IEN1cnJlbnRseSwgYWxtb3N0IGFsbCBhcmNocyAoeDg2
LCBhcm02NCwgbWlwcy4uLikgc3VwcG9ydCBmYXN0IGNhbGwKPj4gb2YgY3Jhc2hfa2V4ZWMoKSB3
aGVuICJyZWdzICYmIGtleGVjX3Nob3VsZF9jcmFzaCgpIiBpcyB0cnVlLiBCdXQKPj4gUklTQy1W
IG5vdCwgaXQgY2FuIG9ubHkgZW50ZXIgY3Jhc2ggc3lzdGVtIHZpYSBwYW5pYygpLiBIb3dldmVy
IHBhbmljKCkKPj4gZG9lc24ndCBwYXNzIHRoZSByZWdzIG9mIHRoZSByZWFsIGFjY2lkZW50IHNj
ZW5lIHRvIGNyYXNoX2tleGVjKCksCj4+IGl0IGNhdXNlZCB3ZSBjYW4ndCBnZXQgYWNjdXJhdGUg
YmFja3RyYWNlIHZpYSBnZGIsCj4+IMKgwqDCoMKgJCByaXNjdjY0LWxpbnV4LWdudS1nZGIgdm1s
aW51eCB2bWNvcmUKPj4gwqDCoMKgwqBSZWFkaW5nIHN5bWJvbHMgZnJvbSB2bWxpbnV4Li4uCj4+
IMKgwqDCoMKgW05ldyBMV1AgOTVdCj4+IMKgwqDCoMKgIzDCoCBjb25zb2xlX3VubG9jayAoKSBh
dCBrZXJuZWwvcHJpbnRrL3ByaW50ay5jOjI1NTcKPj4gwqDCoMKgwqAyNTU3wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRvX2NvbmRfcmVzY2hlZCkKPj4gwqDCoMKg
wqAoZ2RiKSBidAo+PiDCoMKgwqDCoCMwwqAgY29uc29sZV91bmxvY2sgKCkgYXQga2VybmVsL3By
aW50ay9wcmludGsuYzoyNTU3Cj4+IMKgwqDCoMKgIzHCoCAweDAwMDAwMDAwMDAwMDAwMDAgaW4g
Pz8gKCkKPj4KPj4gV2l0aCB0aGUgcGF0Y2ggd2UgY2FuIGdldCB0aGUgYWNjdXJhdGUgYmFja3Ry
YWNlLAo+PiDCoMKgwqDCoCQgcmlzY3Y2NC1saW51eC1nbnUtZ2RiIHZtbGludXggdm1jb3JlCj4+
IMKgwqDCoMKgUmVhZGluZyBzeW1ib2xzIGZyb20gdm1saW51eC4uLgo+PiDCoMKgwqDCoFtOZXcg
TFdQIDk1XQo+PiDCoMKgwqDCoCMwwqAgMHhmZmZmZmZlMDAwNjNhNGUwIGluIHRlc3RfdGhyZWFk
IChkYXRhPTxvcHRpbWl6ZWQgb3V0PikgYXQgCj4+IGRyaXZlcnMvdGVzdF9jcmFzaC5jOjgxCj4+
IMKgwqDCoMKgODHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKihpbnQgKilwID0gMHhkZWFkOwo+
PiDCoMKgwqDCoChnZGIpCj4+IMKgwqDCoMKgKGdkYikgYnQKPj4gwqDCoMKgwqAjMMKgIDB4ZmZm
ZmZmZTAwMDY0ZDVjMCBpbiB0ZXN0X3RocmVhZCAoZGF0YT08b3B0aW1pemVkIG91dD4pIGF0IAo+
PiBkcml2ZXJzL3Rlc3RfY3Jhc2guYzo4MQo+PiDCoMKgwqDCoCMxwqAgMHgwMDAwMDAwMDAwMDAw
MDAwIGluID8/ICgpCj4+Cj4+IFRlc3QgY29kZSB0byBwcm9kdWNlIE5VTEwgYWRkcmVzcyBkZXJl
ZmVyZW5jZSBpbiB0ZXN0X2NyYXNoLmMsCj4+IMKgwqDCoMKgdm9pZCAqcCA9IE5VTEw7Cj4+IMKg
wqDCoMKgKihpbnQgKilwID0gMHhkZWFkOwo+Pgo+PiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+Cj4+IFRlc3RlZC1ieTogWGlhbnRpbmcgVGlhbiA8eGlhbnRpbmcudGlh
bkBsaW51eC5hbGliYWJhLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWGlhbnRpbmcgVGlhbiA8eGlh
bnRpbmcudGlhbkBsaW51eC5hbGliYWJhLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgZnJvbSB2MToK
Pj4gLSBzaW1wbGlmeSB0aGUgY29tbWl0IG1lc3NhZ2UKPj4gLS0tCj4+IMKgYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyB8IDQgKysrKwo+PiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jCj4+IGluZGV4IGZlOTJlMTE5ZTZhMy4uZTY2NmViZmEyYTY0IDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMKPj4gQEAgLTE2LDYgKzE2LDcgQEAKPj4gwqAjaW5jbHVkZSA8bGlu
dXgvbW0uaD4KPj4gwqAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+IMKgI2luY2x1ZGUgPGxp
bnV4L2lycS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2tleGVjLmg+Cj4+Cj4+IMKgI2luY2x1ZGUg
PGFzbS9hc20tcHJvdG90eXBlcy5oPgo+PiDCoCNpbmNsdWRlIDxhc20vYnVnLmg+Cj4+IEBAIC00
NCw2ICs0NSw5IEBAIHZvaWQgZGllKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBjb25zdCBjaGFyICpz
dHIpCj4+Cj4+IMKgwqDCoMKgIHJldCA9IG5vdGlmeV9kaWUoRElFX09PUFMsIHN0ciwgcmVncywg
MCwgcmVncy0+Y2F1c2UsIFNJR1NFR1YpOwo+Pgo+PiArwqDCoMKgIGlmIChyZWdzICYmIGtleGVj
X3Nob3VsZF9jcmFzaChjdXJyZW50KSkKPj4gK8KgwqDCoMKgwqDCoMKgIGNyYXNoX2tleGVjKHJl
Z3MpOwo+PiArCj4+IMKgwqDCoMKgIGJ1c3Rfc3BpbmxvY2tzKDApOwo+PiDCoMKgwqDCoCBhZGRf
dGFpbnQoVEFJTlRfRElFLCBMT0NLREVQX05PV19VTlJFTElBQkxFKTsKPj4gwqDCoMKgwqAgc3Bp
bl91bmxvY2tfaXJxKCZkaWVfbG9jayk7Cj4KPiBUaGFua3MsIHRoaXMgaXMgb24gZm9yLW5leHQu
CgpQYWxtZXIsIHRoYW5rcyBmb3IgdGhlIHJlcGx5LAoKTGFzdCB3ZWVrLCBJIGNvbW1pdCBhIHNl
cmllcyBvZiAKcGF0Y2hlcyhodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMi83LzE3LzY0IAo8aHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMjIvNy8xNy82ND4pLCB3aGljaCBjb250YWlucyB0aGlzIG9u
ZS4KClRoaXMgc2VyaWVzIG9mIHBhdGNoZXMgd29ya2VkIHdpdGggY3Jhc2gtdXRpbGl0eSBmb3Ig
UklTQ1Y2NCwgQ291bGQgeW91IApwbGVhc2UgcmV2aWV3IGl0PwoKV2UgZXhwZWN0IDUuMTkgY291
bGQgc3VwcG9ydCBjcmFzaC11dGlsaXR5LCBpdCBpcyBhIGdvb2QgZnVuY3Rpb25hbGl0eS4KCmNy
YXNoLXV0aWxpdHkgcGF0Y2hlcyBmb3IgUklTQ1Y2NDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIyMDcxODAyNTM0Ni40MTE3NTgtMS14aWFudGluZy50aWFuQGxpbnV4LmFsaWJhYmEu
Y29tLyAKPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDcxODAyNTM0Ni40MTE3NTgt
MS14aWFudGluZy50aWFuQGxpbnV4LmFsaWJhYmEuY29tLz4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
