Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB78C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 12:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L90yUHCg13qrGmVvVsmpiqcuS6Q8fhfndI9odIzDbNk=; b=3gjLvjiG1uUxaB7yyEhYzsBfi7
	ufvYlHpXpuLsYIpoMA4T7M2qJv6+IjGNsz0EnExRaZTk4h7WZBt5WreaHteI8VsgdfqTYjpct/7LG
	SEvEYIfJZeUbWvajV+t7XVnuzBIOK9Xqy4TlAeP+0uoEvYKvbV9tAovAOG4cx0SNNLwn5O9bw97nv
	3WpGkN8ADeHQ/v4oHTFRfYLQ3L+mooFJZC9OEk71NmwmtyQoOtB5itq3pHwzsua0TvcDlWFrtxg6l
	ohFUkEEYDSidEGRTcXTq1qiFEcoDMzUfVA9aIyq1Z8iEFchBq2SK9ozYPyNzBIRhu/MONszPZ6Zeu
	3PxCeyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nolb2-006ndN-19; Wed, 11 May 2022 12:37:40 +0000
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nolax-006nZe-2A
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 12:37:38 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
 TI=SMTPD_---0VCwIZRf_1652272646; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0VCwIZRf_1652272646) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 11 May 2022 20:37:28 +0800
Subject: Re: [PATCH] RISC-V: Remove IORESOURCE_BUSY flag for no-map reserved
 memory
To: David Hildenbrand <david@redhat.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 anup@brainfault.org, wangkefeng.wang@huawei.com, rppt@kernel.org,
 alex@ghiti.fr, twd2.me@gmail.com, seanjc@google.com, petr.pavlu@suse.com,
 atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, jianghuaming.jhm@alibaba-inc.com,
 Nick Kossifidis <mick@ics.forth.gr>
References: <20220511112413.559734-1-xianting.tian@linux.alibaba.com>
 <4407c84b-a64f-51b0-fa96-388aaf3b3e35@redhat.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <f12c2576-1bd4-970d-4435-59273c5de0fc@linux.alibaba.com>
Date: Wed, 11 May 2022 20:37:26 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <4407c84b-a64f-51b0-fa96-388aaf3b3e35@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_053735_334509_9202C00D 
X-CRM114-Status: GOOD (  14.50  )
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

CuWcqCAyMDIyLzUvMTEg5LiL5Y2IODoyNywgRGF2aWQgSGlsZGVuYnJhbmQg5YaZ6YGTOgo+IE9u
IDExLjA1LjIyIDEzOjI0LCBYaWFudGluZyBUaWFuIHdyb3RlOgo+PiBDb21taXQgMDBhYjAyN2Ez
YjgyICgiUklTQy1WOiBBZGQga2VybmVsIGltYWdlIHNlY3Rpb25zIHRvIHRoZSByZXNvdXJjZSB0
cmVlIikKPj4gYWRkZWQgSU9SRVNPVVJDRV9CVVNZIGZsYWcgZm9yIG5vLW1hcCByZXNlcnZlZCBt
ZW1vcnksIHRoaXMgY2FzdWVkCj4+IGRldm1faW9yZW1hcF9yZXNvdXJjZSgpIGZhaWxlZCBmb3Ig
dGhlIG5vLW1hcCByZXNlcnZlZCBtZW1vcnkgaW4gc3Vic2VxdWVudAo+PiBvcGVyYXRpb25zIG9m
IHJlbGF0ZWQgZHJpdmVyLCBzbyByZW1vdmUgdGhlIElPUkVTT1VSQ0VfQlVTWSBmbGFnLgo+Pgo+
PiBUaGUgY29kZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlLAo+PiBkdHM6Cj4+IAltZW0wOiBtZW1v
cnlAYTAwMDAwMDAgewo+PiAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhhMDAwMDAwMCAw
IDB4MTAwMDAwMD47Cj4+ICAgICAgICAgICAgICAgICAgbm8tbWFwOwo+PiAgICAgICAgICB9Owo+
Pgo+PiAJJnRlc3Qgewo+PiAJCXN0YXR1cyA9ICJva2F5IjsKPj4gCQltZW1vcnktcmVnaW9uID0g
PCZtZW0wPjsKPj4gCX07Cj4+Cj4+IGNvZGU6Cj4+IAlucCA9IG9mX3BhcnNlX3BoYW5kbGUocGRl
di0+ZGV2Lm9mX25vZGUsICJtZW1vcnktcmVnaW9uIiwgMCk7Cj4+IAlyZXQgPSBvZl9hZGRyZXNz
X3RvX3Jlc291cmNlKG5wLCAwLCAmcik7Cj4+IAliYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNl
KCZwZGV2LT5kZXYsICZyKTsKPj4gCS8vIGJhc2UgPSAtRUJVU1kKPj4KPj4gRml4ZXM6IDAwYWIw
MjdhM2I4MiAoIlJJU0MtVjogQWRkIGtlcm5lbCBpbWFnZSBzZWN0aW9ucyB0byB0aGUgcmVzb3Vy
Y2UgdHJlZSIpCj4+IFJlcG9ydGVkLWJ5OiBIdWFtaW5nIEppYW5nIDxqaWFuZ2h1YW1pbmcuamht
QGFsaWJhYmEtaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPgo+PiBDQzogTmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4KPj4gU2lnbmVk
LW9mZi1ieTogWGlhbnRpbmcgVGlhbiA8eGlhbnRpbmcudGlhbkBsaW51eC5hbGliYWJhLmNvbT4K
Pj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyB8IDIgKy0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+
IGluZGV4IDgzNGViNjUyYTdiOS4uNzFmMjk2NmIxNDc0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zZXR1cC5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4g
QEAgLTIxNCw3ICsyMTQsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9yZXNvdXJjZXModm9p
ZCkKPj4gICAKPj4gICAJCWlmICh1bmxpa2VseShtZW1ibG9ja19pc19ub21hcChyZWdpb24pKSkg
ewo+PiAgIAkJCXJlcy0+bmFtZSA9ICJSZXNlcnZlZCI7Cj4+IC0JCQlyZXMtPmZsYWdzID0gSU9S
RVNPVVJDRV9NRU0gfCBJT1JFU09VUkNFX0JVU1k7Cj4+ICsJCQlyZXMtPmZsYWdzID0gSU9SRVNP
VVJDRV9NRU07Cj4+ICAgCQl9IGVsc2Ugewo+PiAgIAkJCXJlcy0+bmFtZSA9ICJTeXN0ZW0gUkFN
IjsKPj4gICAJCQlyZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9TWVNURU1fUkFNIHwgSU9SRVNPVVJD
RV9CVVNZOwo+IEkgYXNzdW1lIHRoZSAiUmVzZXJ2ZWQiIHBhcnQgaXMgZXNzZW50aWFsbHkgdW51
c2VkIGJ5IHRoZSBrZXJuZWwgY29ycmVjdD8KCkkgdGhpbmsgd2UgbWF5IHVzZSBpdCwgYWN0dWFs
bHkgd2UgZm91bmQgdGhlIGlzc3VlIGluIG91ciBwcm9kdWN0IGFmdGVyIAptZXJnZWQga2R1bXAg
ZnVuY3Rpb25hbGl0eS4KCkFjdHVhbGx5LCB0aGUgY29kZSBkaWRuJ3QgYWRkIElPUkVTT1VSQ0Vf
QlVTWSBmb3Igbm8tbWFwIHJlc2VydmVkIG1lbW9yeSAKYmVmb3JlIDAwYWIwMjdhM2I4MiBtZXJn
ZWQswqAgc28gaXQgaXMgYSB0eXBvIGZvciBjb21taXQgMDBhYjAyN2EzYjgyIHRvIAphZGQgSU9S
RVNPVVJDRV9CVVNZPwoKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
