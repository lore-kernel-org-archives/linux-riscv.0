Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43955C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 06:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7uyIDVmDhp99NmCaxayZ6r5/O8bQFP4YGr5HIOoTa4=; b=AW7ktDgImv4zuJkdVNi6zFczeq
	ivHr0EAVcHEpSr0MQFOjUK+S5g5HRwE/TKJFf/fzK3i4We/fL0VWnyygACrNcSw5BbWMpytgEHprX
	a2L9dWVYbtTIqFTkcFI9mMG1G7uI0leLOLTtFpIvSSYoz0nbZB79iVrdIGALbRUCkB1jX2ej6SCqK
	tD5aMWkyd8xB956DeZe7oN3anozPMsL8s1HeIl3N/vE06OiDLe5AfvA7QkpTqkqy5yyFN8H1cX9ma
	FiO6os+sZBIALcPcMk1QEpnLf+nfFEbgemEdhKyW9fsY3ym9Exl0CSbkcoQR/Uw8awE8i20yB97jy
	hSmK9SJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweRk-001lRn-Ux; Thu, 02 Jun 2022 06:36:40 +0000
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweRg-001lOr-9N
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 06:36:38 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0VF9JFIl_1654151783;
Received: from 192.168.1.5(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VF9JFIl_1654151783)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 02 Jun 2022 14:36:25 +0800
Subject: Re: [PATCH v3] RISC-V: Mark IORESOURCE_EXCLUSIVE for reserved mem
 instead of IORESOURCE_BUSY
To: Palmer Dabbelt <palmer@dabbelt.com>, guoren@kernel.org
Cc: mick@ics.forth.gr, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, anup@brainfault.org, akpm@linux-foundation.org,
 wangkefeng.wang@huawei.com, rppt@kernel.org, david@redhat.com,
 wangborong@cdjrlc.com, twd2.me@gmail.com, seanjc@google.com, alex@ghiti.fr,
 petr.pavlu@suse.com, Atish Patra <atishp@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jianghuaming.jhm@alibaba-inc.com, heiko@sntech.de
References: <mhng-d1f0bf41-82a3-4e76-98a0-c787ebcd0799@palmer-ri-x1c9>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
Message-ID: <a5470d2b-9706-b89d-b6ca-8e18ab812c40@linux.alibaba.com>
Date: Thu, 2 Jun 2022 14:36:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <mhng-d1f0bf41-82a3-4e76-98a0-c787ebcd0799@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_233636_547716_FB625C07 
X-CRM114-Status: GOOD (  17.73  )
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

CuWcqCAyMDIyLzYvMiDkuIvljYgxOjU3LCBQYWxtZXIgRGFiYmVsdCDlhpnpgZM6Cj4gT24gU3Vu
LCAyOSBNYXkgMjAyMiAxOTo0Nzo1MSBQRFQgKC0wNzAwKSwgZ3VvcmVuQGtlcm5lbC5vcmcgd3Jv
dGU6Cj4+IEhpIFBhbG1lciwKPj4KPj4gUGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoaXMgcGF0Y2gg
d2hpY2ggaXMgYSBjcml0aWNhbCBmaXh1cC4gT3VyCj4+IGN1cnJlbnQgcmlzY3YgaW1wbGVtZW50
YXRpb24gaGFzIGJyb2tlbiB0aGUgcmVzZXJ2ZWQgbWVtb3J5Lgo+Cj4gUHV0dGluZyAiZml4IiBz
b21ld2hlcmUgaW4gdGhlIHN1YmplY3QgaXMgZ2VuZXJhbGx5IHRoZSBiZXN0IHdheSB0byBkbyAK
PiB0aGF0LCB0aGlzIG9uZSBqdXN0IGxvb2tlZCBsaWtlIGEgZmVhdHVyZSBhbmQgSSBzdHVtYmxl
ZCBpbnRvIGl0IHdoZW4gCj4gZ29pbmcgdGhyb3VnaCBzdHVmZiBmb3IgdGhpcyBtZXJnZSB3aW5k
b3cuCgpUaGFua3MgZm9yIHRoZSBhZHZpY2UuCgpDb3VsZCB5b3UgYWxzbyBrZWVwIGFuIGV5ZSBv
biB0aGlzIHBhdGNoPyAKaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjIvNS8xNS8xNDAgPGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDIyLzUvMTUvMTQwPgoKPgo+IEl0J3MgaW4gZm9yLW5leHQsIHdo
aWNoIGlzIHN0aWxsIGFpbWVkIGF0IDUuMTkuCj4KPiBUaGFua3MhCj4KPj4KPj4gT24gV2VkLCBN
YXkgMTgsIDIwMjIgYXQgOTozNCBBTSBYaWFudGluZyBUaWFuCj4+IDx4aWFudGluZy50aWFuQGxp
bnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPj4+Cj4+PiBDb21taXQgMDBhYjAyN2EzYjgyICgiUklT
Qy1WOiBBZGQga2VybmVsIGltYWdlIHNlY3Rpb25zIHRvIHRoZSAKPj4+IHJlc291cmNlIHRyZWUi
KQo+Pj4gbWFya2VkIElPUkVTT1VSQ0VfQlVTWSBmb3IgcmVzZXJ2ZWQgbWVtb3J5LCB3aGljaCBj
YXVzZWQgcmVzb3VyY2UgbWFwCj4+PiBmYWlsZWQgaW4gc3Vic2VxdWVudCBvcGVyYXRpb25zIG9m
IHJlbGF0ZWQgZHJpdmVyLCBzbyByZW1vdmUgdGhlCj4+PiBJT1JFU09VUkNFX0JVU1kgZmxhZy4g
SW4gb3JkZXIgdG8gcHJvaGliaXQgdXNlcmxhbmQgbWFwcGluZyByZXNlcnZlZAo+Pj4gbWVtb3J5
LCBtYXJrIElPUkVTT1VSQ0VfRVhDTFVTSVZFIGZvciBpdC4KPj4+Cj4+PiBUaGUgY29kZSB0byBy
ZXByb2R1Y2UgdGhlIGlzc3VlLAo+Pj4gZHRzOgo+Pj4gwqDCoMKgwqDCoMKgwqAgbWVtMDogbWVt
b3J5QGEwMDAwMDAwIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8
MHgwIDB4YTAwMDAwMDAgMCAweDEwMDAwMDA+Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG5vLW1hcDsKPj4+IMKgwqDCoMKgwqDCoMKgIH07Cj4+Pgo+Pj4gwqDCoMKgwqDCoMKg
wqAgJnRlc3Qgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJv
a2F5IjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1vcnktcmVnaW9uID0g
PCZtZW0wPjsKPj4+IMKgwqDCoMKgwqDCoMKgIH07Cj4+Pgo+Pj4gY29kZToKPj4+IMKgwqDCoMKg
wqDCoMKgIG5wID0gb2ZfcGFyc2VfcGhhbmRsZShwZGV2LT5kZXYub2Zfbm9kZSwgIm1lbW9yeS1y
ZWdpb24iLCAwKTsKPj4+IMKgwqDCoMKgwqDCoMKgIHJldCA9IG9mX2FkZHJlc3NfdG9fcmVzb3Vy
Y2UobnAsIDAsICZyKTsKPj4+IMKgwqDCoMKgwqDCoMKgIGJhc2UgPSBkZXZtX2lvcmVtYXBfcmVz
b3VyY2UoJnBkZXYtPmRldiwgJnIpOwo+Pj4gwqDCoMKgwqDCoMKgwqAgLy8gYmFzZSA9IC1FQlVT
WQo+Pj4KPj4+IEZpeGVzOiAwMGFiMDI3YTNiODIgKCJSSVNDLVY6IEFkZCBrZXJuZWwgaW1hZ2Ug
c2VjdGlvbnMgdG8gdGhlIAo+Pj4gcmVzb3VyY2UgdHJlZSIpCj4+PiBSZXBvcnRlZC1ieTogSHVh
bWluZyBKaWFuZyA8amlhbmdodWFtaW5nLmpobUBhbGliYWJhLWluYy5jb20+Cj4+PiBSZXZpZXdl
ZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4+PiBSZXZpZXdlZC1ieTogSGVpa28g
U3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPj4+IFRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIg
PGhlaWtvQHNudGVjaC5kZT4KPj4+IENvLWRldmVsb3BlZC1ieTogTmljayBLb3NzaWZpZGlzIDxt
aWNrQGljcy5mb3J0aC5ncj4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW50aW5nIFRpYW4gPHhpYW50
aW5nLnRpYW5AbGludXguYWxpYmFiYS5jb20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgZnJvbSB2MjoK
Pj4+IC0gRml4IHR5cG8gaW4gY29tbWl0IG1lc3NhZ2U6IGNhc3VlZCAtPiBjYXVzZWQKPj4+IC0g
UmVtb3ZlIFJldmlld2VkLWJ5IG9mIE5pY2sgS29zc2lmaWRpcywgd2hvIGRpZG4ndCBnaXZlIFJl
dmlld2VkLWJ5IAo+Pj4gYWN0dWFsbHkKPj4+IC0gQWRkIENvLWRldmVsb3BlZC1ieSBvZiBOaWNr
Cj4+Pgo+Pj4gQ2hhbmdlcyBmcm9tIHYxOgo+Pj4gLSBNYXJrIHJlc2VydmVkIG1lbW9yeSBhcyBJ
T1JFU09VUkNFX0VYQ0xVU0lWRSwgc3VnZ2VzdGVkIGJ5IE5pY2sKPj4+IC0tLQo+Pj4gwqBhcmNo
L3Jpc2N2L2tlcm5lbC9zZXR1cC5jIHwgNCArKy0tCj4+PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+PiBpbmRleCA4
MzRlYjY1MmE3YjkuLmUwYTAwNzM5YmQxMyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3NldHVwLmMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4+IEBAIC0x
ODksNyArMTg5LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGluaXRfcmVzb3VyY2VzKHZvaWQpCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzID0gJm1lbV9yZXNbcmVzX2lkeC0t
XTsKPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzLT5uYW1lID0gIlJl
c2VydmVkIjsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+ZmxhZ3MgPSBJ
T1JFU09VUkNFX01FTSB8IElPUkVTT1VSQ0VfQlVTWTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJlcy0+ZmxhZ3MgPSBJT1JFU09VUkNFX01FTSB8IElPUkVTT1VSQ0VfRVhDTFVT
SVZFOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+c3RhcnQgPSAKPj4+
IF9fcGZuX3RvX3BoeXMobWVtYmxvY2tfcmVnaW9uX3Jlc2VydmVkX2Jhc2VfcGZuKHJlZ2lvbikp
Owo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+ZW5kID0gCj4+PiBfX3Bm
bl90b19waHlzKG1lbWJsb2NrX3JlZ2lvbl9yZXNlcnZlZF9lbmRfcGZuKHJlZ2lvbikpIC0gMTsK
Pj4+Cj4+PiBAQCAtMjE0LDcgKzIxNCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3Jlc291
cmNlcyh2b2lkKQo+Pj4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodW5s
aWtlbHkobWVtYmxvY2tfaXNfbm9tYXAocmVnaW9uKSkpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzLT5uYW1lID0gIlJlc2VydmVkIjsKPj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXMtPmZsYWdz
ID0gSU9SRVNPVVJDRV9NRU0gfCBJT1JFU09VUkNFX0JVU1k7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzLT5mbGFncyA9IElPUkVTT1VSQ0VfTUVN
IHwgCj4+PiBJT1JFU09VUkNFX0VYQ0xVU0lWRTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB9IGVsc2Ugewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXMtPm5hbWUgPSAiU3lzdGVtIFJBTSI7Cj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcy0+ZmxhZ3MgPSBJT1JFU09VUkNFX1NZ
U1RFTV9SQU0gfCAKPj4+IElPUkVTT1VSQ0VfQlVTWTsKPj4+IC0tIAo+Pj4gMi4xNy4xCj4+PgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
