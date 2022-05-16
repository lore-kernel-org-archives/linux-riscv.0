Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D31C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grYfKPu5NpNEuQYhRowRv3dR7aLFvTn5B/Av/BdWK2E=; b=FTbjHS5cQo2LmFttSFeOZdlg6D
	3vi70EBlWxlCDt7HbkTZXElhT+7r4XWWVE0HYflCADMNyMooj8Ao4VsPyTbFLPzpRrMk5n4QocSpL
	QgXAQMP+eHQszVYen49xhu6woSfW3uynJctP1Ju5PnBx7RUDo3672AxflxovrqUqIMtyV0jBinvFT
	M3kDlup2oAUMdQVHwFPllPmi2PFOmJv1wOcoA5A9QDrSoHKOGxia090jVy7FTt03SHHsL1poj45ls
	G+/guHZraTbyn8dWsgrdLJ/Q1ric63SqaggC3JNJ787WxFEZWGAibQ2J7GHBuSKaHJiR/+PmZfj19
	0Dl3hbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqWkj-006qRU-Ki; Mon, 16 May 2022 09:10:57 +0000
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqWkZ-006qMh-Pc
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 09:10:50 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=21; SR=0;
 TI=SMTPD_---0VDHYTt8_1652692240; 
Received: from B-LB6YLVDL-0141.local(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0VDHYTt8_1652692240) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 16 May 2022 17:10:41 +0800
Subject: Re: [PATCH v2] RISC-V: Mark IORESOURCE_EXCLUSIVE for reserved mem
 instead of IORESOURCE_BUSY
To: Conor.Dooley@microchip.com, mick@ics.forth.gr, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org,
 akpm@linux-foundation.org, wangkefeng.wang@huawei.com, rppt@kernel.org,
 david@redhat.com, wangborong@cdjrlc.com, twd2.me@gmail.com,
 seanjc@google.com, alex@ghiti.fr, petr.pavlu@suse.com, atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jianghuaming.jhm@alibaba-inc.com, guoren@kernel.org, stable@kernel.org
References: <20220512060910.601832-1-xianting.tian@linux.alibaba.com>
 <e32a2228-2e2f-0da2-87e8-e364c0450dcd@linux.alibaba.com>
 <2e62621a-1fb8-5de7-8d0e-e6c4019931a1@microchip.com>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <910efc8b-5d6f-820e-3b89-97c668e78cd8@linux.alibaba.com>
Date: Mon, 16 May 2022 17:10:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2e62621a-1fb8-5de7-8d0e-e6c4019931a1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_021048_055437_D1E7F85C 
X-CRM114-Status: GOOD (  14.71  )
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

CuWcqCAyMDIyLzUvMTYg5LiL5Y2INTowMywgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20g5YaZ
6YGTOgo+IE9uIDE2LzA1LzIwMjIgMDk6NTAsIFhpYW50aW5nIFRpYW4gd3JvdGU6Cj4+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+Pgo+PiBIaQo+Pgo+PiBDb3VsZCBJIGdldCBh
bnkgY29tbWVudHMgZm9yIHRoZSB2MiBwYXRjaCwgdGhhbmtzCj4gTG9va3MgbGlrZSB5b3UgaGF2
ZSAzIFJldmlld2VkLWJ5cyBhbHJlYWR5ICYgdGhlcmUncyBvbmx5IGJlZW4gb25lIGZ1bGwKPiB3
b3JraW5nIGRheSBzaW5jZSB5b3Ugc2VudCB0aGUgcGF0Y2gsIHByb2JhYmx5IGp1c3Qgd29ydGgg
d2FpdGluZyBhIGxpdHRsZQo+IGZvciBQYWxtZXIgdG8gZ2V0IGFyb3VuZCB0byBwaWNraW5nIGl0
IHVwIDopCj4gVGhhbmtzLAo+IENvbm9yLgoKdGhhbmtzIDopCgpJIGp1c3Qgc2F3IEhlaWtvIFN0
dWVibmVyIGdhdmVkIFJldmlldy1ieSBvbiBwYXRjaHdvcmsua2VybmVsLm9yZywgYnV0IEkgCmRp
ZG4ndCByZWNlaXZlZCB0aGUgbWFpbC4KCkxldCdzIHdhaXQgUGFsbWVyIHRvIHBpY2sgdXAuCgo+
PiDlnKggMjAyMi81LzEyIOS4i+WNiDI6MDksIFhpYW50aW5nIFRpYW4g5YaZ6YGTOgo+Pj4gQ29t
bWl0IDAwYWIwMjdhM2I4MiAoIlJJU0MtVjogQWRkIGtlcm5lbCBpbWFnZSBzZWN0aW9ucyB0byB0
aGUgcmVzb3VyY2UgdHJlZSIpCj4+PiBtYXJrZWQgSU9SRVNPVVJDRV9CVVNZIGZvciByZXNlcnZl
ZCBtZW1vcnksIHdoaWNoIGNhc3VlZCByZXNvdXJjZSBtYXAKPj4+IGZhaWxlZCBpbiBzdWJzZXF1
ZW50IG9wZXJhdGlvbnMgb2YgcmVsYXRlZCBkcml2ZXIsIHNvIHJlbW92ZSB0aGUKPj4+IElPUkVT
T1VSQ0VfQlVTWSBmbGFnLiBJbiBvcmRlciB0byBwcm9oaWJpdCB1c2VybGFuZCBtYXBwaW5nIHJl
c2VydmVkCj4+PiBtZW1vcnksIG1hcmsgSU9SRVNPVVJDRV9FWENMVVNJVkUgZm9yIGl0Lgo+Pj4K
Pj4+IFRoZSBjb2RlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUsCj4+PiBkdHM6Cj4+PiAgwqDCoMKg
wqDCoMKgwqDCoCBtZW0wOiBtZW1vcnlAYTAwMDAwMDAgewo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHhhMDAwMDAwMCAwIDB4MTAwMDAwMD47Cj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm8tbWFwOwo+Pj4gIMKgwqDCoMKgwqDC
oMKgwqAgfTsKPj4+Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoCAmdGVzdCB7Cj4+PiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbW9yeS1yZWdpb24gPSA8Jm1lbTA+Owo+Pj4gIMKgwqDC
oMKgwqDCoMKgwqAgfTsKPj4+Cj4+PiBjb2RlOgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgbnAgPSBv
Zl9wYXJzZV9waGFuZGxlKHBkZXYtPmRldi5vZl9ub2RlLCAibWVtb3J5LXJlZ2lvbiIsIDApOwo+
Pj4gIMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gb2ZfYWRkcmVzc190b19yZXNvdXJjZShucCwgMCwg
JnIpOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgYmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgm
cGRldi0+ZGV2LCAmcik7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoCAvLyBiYXNlID0gLUVCVVNZCj4+
Pgo+Pj4gRml4ZXM6IDAwYWIwMjdhM2I4MiAoIlJJU0MtVjogQWRkIGtlcm5lbCBpbWFnZSBzZWN0
aW9ucyB0byB0aGUgcmVzb3VyY2UgdHJlZSIpCj4+PiBSZXBvcnRlZC1ieTogSHVhbWluZyBKaWFu
ZyA8amlhbmdodWFtaW5nLmpobUBhbGliYWJhLWluYy5jb20+Cj4+PiBSZXZpZXdlZC1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+PiBSZXZpZXdlZC1ieTogTmljayBLb3NzaWZpZGlz
IDxtaWNrQGljcy5mb3J0aC5ncj4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW50aW5nIFRpYW4gPHhp
YW50aW5nLnRpYW5AbGludXguYWxpYmFiYS5jb20+Cj4+PiAtLS0KPj4+ICDCoCBhcmNoL3Jpc2N2
L2tlcm5lbC9zZXR1cC5jIHwgNCArKy0tCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4+IGluZGV4IDgzNGVi
NjUyYTdiOS4uZTBhMDA3MzliZDEzIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c2V0dXAuYwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+Pj4gQEAgLTE4OSw3
ICsxODksNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaW5pdF9yZXNvdXJjZXModm9pZCkKPj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMgPSAmbWVtX3Jlc1tyZXNfaWR4LS1dOwo+Pj4K
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMtPm5hbWUgPSAiUmVzZXJ2ZWQiOwo+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9NRU0g
fCBJT1JFU09VUkNFX0JVU1k7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+Zmxh
Z3MgPSBJT1JFU09VUkNFX01FTSB8IElPUkVTT1VSQ0VfRVhDTFVTSVZFOwo+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+c3RhcnQgPSBfX3Bmbl90b19waHlzKG1lbWJsb2NrX3Jl
Z2lvbl9yZXNlcnZlZF9iYXNlX3BmbihyZWdpb24pKTsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXMtPmVuZCA9IF9fcGZuX3RvX3BoeXMobWVtYmxvY2tfcmVnaW9uX3Jlc2VydmVk
X2VuZF9wZm4ocmVnaW9uKSkgLSAxOwo+Pj4KPj4+IEBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGlj
IHZvaWQgX19pbml0IGluaXRfcmVzb3VyY2VzKHZvaWQpCj4+Pgo+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseShtZW1ibG9ja19pc19ub21hcChyZWdpb24pKSkgewo+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMtPm5hbWUg
PSAiUmVzZXJ2ZWQiOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVzLT5mbGFncyA9IElPUkVTT1VSQ0VfTUVNIHwgSU9SRVNPVVJDRV9CVVNZOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzLT5mbGFncyA9IElPUkVT
T1VSQ0VfTUVNIHwgSU9SRVNPVVJDRV9FWENMVVNJVkU7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfSBlbHNlIHsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmVzLT5uYW1lID0gIlN5c3RlbSBSQU0iOwo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9TWVNURU1f
UkFNIHwgSU9SRVNPVVJDRV9CVVNZOwo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
