Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA5DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 08:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waFBjFcNEjCnnyiWERGFHdf2KQx//yWEAG1QOB5soQ4=; b=ChAA3GwtpoMTDmD77fI84ArPvD
	6Sc6zZWcnzU+OVshDQUk8zPEwOSAQgCuQ9CJP36tJCGQ3skW/NCNfH1t9D9ISKsVqHXH5Ux9gatnF
	DdhuY3UbHbwedxMZkHVS3/g9r7cc3RegR5Shoog6WCHgeRX2QRvBFMZcVCl3VmSimr8TE9e/x1S3E
	9k6zqQ/Mr24RbOJMgHMGnyMiJlsLRDbd55i/oc0NOYhiPca0sJefWDbRGR2cjcGKKEPdSNho62dcp
	5XSyyQAS9+HW7nuBcgQ1siUSw8jpkERXWH5U1ngUYqKqJfTSQiwPAGGIonxyQuDI3T4/pSrOYqwkk
	rjwSFcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqWQr-006kTG-5j; Mon, 16 May 2022 08:50:25 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqWQn-006kRF-6T
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 08:50:23 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R251e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0VDI4vKu_1652691014; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0VDI4vKu_1652691014) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 16 May 2022 16:50:15 +0800
Subject: Re: [PATCH v2] RISC-V: Mark IORESOURCE_EXCLUSIVE for reserved mem
 instead of IORESOURCE_BUSY
To: mick@ics.forth.gr, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, anup@brainfault.org, akpm@linux-foundation.org,
 wangkefeng.wang@huawei.com, rppt@kernel.org, david@redhat.com,
 wangborong@cdjrlc.com, twd2.me@gmail.com, seanjc@google.com, alex@ghiti.fr,
 petr.pavlu@suse.com, atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jianghuaming.jhm@alibaba-inc.com, guoren@kernel.org, stable@kernel.org
References: <20220512060910.601832-1-xianting.tian@linux.alibaba.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <e32a2228-2e2f-0da2-87e8-e364c0450dcd@linux.alibaba.com>
Date: Mon, 16 May 2022 16:50:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220512060910.601832-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_015021_445453_499B2554 
X-CRM114-Status: GOOD (  16.33  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkKCkNvdWxkIEkgZ2V0IGFueSBjb21tZW50cyBmb3IgdGhlIHYyIHBhdGNoLCB0aGFua3MKCtTa
IDIwMjIvNS8xMiDPws7nMjowOSwgWGlhbnRpbmcgVGlhbiDQtLXAOgo+IENvbW1pdCAwMGFiMDI3
YTNiODIgKCJSSVNDLVY6IEFkZCBrZXJuZWwgaW1hZ2Ugc2VjdGlvbnMgdG8gdGhlIHJlc291cmNl
IHRyZWUiKQo+IG1hcmtlZCBJT1JFU09VUkNFX0JVU1kgZm9yIHJlc2VydmVkIG1lbW9yeSwgd2hp
Y2ggY2FzdWVkIHJlc291cmNlIG1hcAo+IGZhaWxlZCBpbiBzdWJzZXF1ZW50IG9wZXJhdGlvbnMg
b2YgcmVsYXRlZCBkcml2ZXIsIHNvIHJlbW92ZSB0aGUKPiBJT1JFU09VUkNFX0JVU1kgZmxhZy4g
SW4gb3JkZXIgdG8gcHJvaGliaXQgdXNlcmxhbmQgbWFwcGluZyByZXNlcnZlZAo+IG1lbW9yeSwg
bWFyayBJT1JFU09VUkNFX0VYQ0xVU0lWRSBmb3IgaXQuCj4KPiBUaGUgY29kZSB0byByZXByb2R1
Y2UgdGhlIGlzc3VlLAo+IGR0czoKPiAgICAgICAgICBtZW0wOiBtZW1vcnlAYTAwMDAwMDAgewo+
ICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MCAweGEwMDAwMDAwIDAgMHgxMDAwMDAwPjsKPiAg
ICAgICAgICAgICAgICAgIG5vLW1hcDsKPiAgICAgICAgICB9Owo+Cj4gICAgICAgICAgJnRlc3Qg
ewo+ICAgICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICAgICAgICAgICAgICAgICAg
bWVtb3J5LXJlZ2lvbiA9IDwmbWVtMD47Cj4gICAgICAgICAgfTsKPgo+IGNvZGU6Cj4gICAgICAg
ICAgbnAgPSBvZl9wYXJzZV9waGFuZGxlKHBkZXYtPmRldi5vZl9ub2RlLCAibWVtb3J5LXJlZ2lv
biIsIDApOwo+ICAgICAgICAgIHJldCA9IG9mX2FkZHJlc3NfdG9fcmVzb3VyY2UobnAsIDAsICZy
KTsKPiAgICAgICAgICBiYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsICZy
KTsKPiAgICAgICAgICAvLyBiYXNlID0gLUVCVVNZCj4KPiBGaXhlczogMDBhYjAyN2EzYjgyICgi
UklTQy1WOiBBZGQga2VybmVsIGltYWdlIHNlY3Rpb25zIHRvIHRoZSByZXNvdXJjZSB0cmVlIikK
PiBSZXBvcnRlZC1ieTogSHVhbWluZyBKaWFuZyA8amlhbmdodWFtaW5nLmpobUBhbGliYWJhLWlu
Yy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+IFJldmll
d2VkLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+IFNpZ25lZC1vZmYt
Ynk6IFhpYW50aW5nIFRpYW4gPHhpYW50aW5nLnRpYW5AbGludXguYWxpYmFiYS5jb20+Cj4gLS0t
Cj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gaW5kZXgg
ODM0ZWI2NTJhN2I5Li5lMGEwMDczOWJkMTMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc2V0dXAuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiBAQCAtMTg5LDcg
KzE4OSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3Jlc291cmNlcyh2b2lkKQo+ICAgCQly
ZXMgPSAmbWVtX3Jlc1tyZXNfaWR4LS1dOwo+ICAgCj4gICAJCXJlcy0+bmFtZSA9ICJSZXNlcnZl
ZCI7Cj4gLQkJcmVzLT5mbGFncyA9IElPUkVTT1VSQ0VfTUVNIHwgSU9SRVNPVVJDRV9CVVNZOwo+
ICsJCXJlcy0+ZmxhZ3MgPSBJT1JFU09VUkNFX01FTSB8IElPUkVTT1VSQ0VfRVhDTFVTSVZFOwo+
ICAgCQlyZXMtPnN0YXJ0ID0gX19wZm5fdG9fcGh5cyhtZW1ibG9ja19yZWdpb25fcmVzZXJ2ZWRf
YmFzZV9wZm4ocmVnaW9uKSk7Cj4gICAJCXJlcy0+ZW5kID0gX19wZm5fdG9fcGh5cyhtZW1ibG9j
a19yZWdpb25fcmVzZXJ2ZWRfZW5kX3BmbihyZWdpb24pKSAtIDE7Cj4gICAKPiBAQCAtMjE0LDcg
KzIxNCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3Jlc291cmNlcyh2b2lkKQo+ICAgCj4g
ICAJCWlmICh1bmxpa2VseShtZW1ibG9ja19pc19ub21hcChyZWdpb24pKSkgewo+ICAgCQkJcmVz
LT5uYW1lID0gIlJlc2VydmVkIjsKPiAtCQkJcmVzLT5mbGFncyA9IElPUkVTT1VSQ0VfTUVNIHwg
SU9SRVNPVVJDRV9CVVNZOwo+ICsJCQlyZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9NRU0gfCBJT1JF
U09VUkNFX0VYQ0xVU0lWRTsKPiAgIAkJfSBlbHNlIHsKPiAgIAkJCXJlcy0+bmFtZSA9ICJTeXN0
ZW0gUkFNIjsKPiAgIAkJCXJlcy0+ZmxhZ3MgPSBJT1JFU09VUkNFX1NZU1RFTV9SQU0gfCBJT1JF
U09VUkNFX0JVU1k7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
