Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF830C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 07:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QF2P29jtUT8SD1QYF8NmcvrXw9uMIHiamIMswqPq0U=; b=figMymxwXlDY95
	MCTgvVZoFUZgKrZuJ3J655GTgi6iNBmG4SXlemXaABJtc08Q1Z0Rz2a7P+zs4vFyuLQP4P4bXOzD4
	EBTUR3q/il1M9yTVZ5ZpeMN3qiNSWi06JjRwFn2KT+u6ZpoJOB9nGlk9GrKiebLVzDI3BlpT9jm4h
	ExMBGLRZiBCt8qnFUYzjt26t/I3hQ8PfWYAwrgSfXMQuJyIlMZjq3ULiIK7o1gUsHHjjGc19L+f5A
	CmRZAAcu1oYJWhPcOzLSP4+AApkV6kY2oMfoBO+BV5Kz+ZO2DAMAHP+YMLDuUdsnC39MFVU8yRD0F
	59ZvZtv6BbB00PQxF3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbz4T-009MOV-AF; Tue, 14 Mar 2023 07:27:45 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbz4P-009MLw-HV
	for linux-riscv@lists.infradead.org; Tue, 14 Mar 2023 07:27:44 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 32E7R5Us098208;
	Tue, 14 Mar 2023 15:27:05 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from APC323 (10.0.12.101) by ATCPCS16.andestech.com (10.0.1.222)
 with Microsoft SMTP Server id 14.3.498.0; Tue, 14 Mar 2023 15:27:04 +0800
Date: Tue, 14 Mar 2023 15:27:28 +0800
From: Dylan Jhong <dylan@andestech.com>
To: Zong Li <zongbox@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <guoren@kernel.org>, <sergey.matyukevich@syntacore.com>,
        <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <x5710999x@gmail.com>,
        <tim609@andestech.com>, <peterlin@andestech.com>,
        <ycliang@andestech.com>, <alistair.francis@wdc.com>
Subject: Re: [PATCH v2] riscv: mm: Fix incorrect ASID argument when flushing
 TLB
Message-ID: <ZBAh4EY2RNLryzEW@APC323>
References: <20230313034906.2401730-1-dylan@andestech.com>
 <CA+ZOyahmpKXq2K-VqKkfN8t5aLDwU-OvL46oj9nNpdm6ZU3qNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+ZOyahmpKXq2K-VqKkfN8t5aLDwU-OvL46oj9nNpdm6ZU3qNQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Originating-IP: [10.0.12.101]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 32E7R5Us098208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_002742_062674_42C6D3C8 
X-CRM114-Status: GOOD (  25.01  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMTA6MjI6NDNBTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
PiBEeWxhbiBKaG9uZyA8ZHlsYW5AYW5kZXN0ZWNoLmNvbT4g5pa8IDIwMjPlubQz5pyIMTPml6Ug
6YCx5LiAIOS4i+WNiDEyOjI55a+r6YGT77yaCj4gPgo+ID4gQ3VycmVudGx5LCB3ZSBwYXNzIHRo
ZSBDT05URVhUSUQgaW5zdGVhZCBvZiB0aGUgQVNJRCB0byB0aGUgVExCIGZsdXNoCj4gPiBmdW5j
dGlvbi4gV2Ugc2hvdWxkIG9ubHkgdGFrZSB0aGUgQVNJRCBmaWVsZCB0byBwcmV2ZW50IGZyb20g
dG91Y2hpbmcKPiA+IHRoZSByZXNlcnZlZCBiaXQgZmllbGQuCj4gPgo+ID4gRml4ZXM6IDNmMWU3
ODI5OThjZCAoInJpc2N2OiBhZGQgQVNJRC1iYXNlZCB0bGJmbHVzaGluZyBtZXRob2RzIikKPiA+
IFNpZ25lZC1vZmYtYnk6IER5bGFuIEpob25nIDxkeWxhbkBhbmRlc3RlY2guY29tPgo+ID4gLS0t
Cj4gCj4gSGkgRHlsYW4sCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCBpZiBJIHJlbWVtYmVyIGNv
cnJlY3RseSwgdGhlcmUgd2FzIGEgcGF0Y2ggZnJvbQo+IEFsaXN0YWlyIEZyYW5jaXMgZGlkIHRo
ZSBzaW1pbGFyIGZpeC4gUGVyaGFwcyB3ZSBzaG91bGQgdHJhY2sgdGhhdAo+IHBhdGNoIHRvIHNl
ZSB3aHkgaXQgZG9lc24ndCBiZSBtZXJnZWQuIFRoYW5rcy4KPiAKPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9waXBlcm1haWwvbGludXgtcmlzY3YvMjAyMi1NYXJjaC8wMTM1NTguaHRtbAo+
CkhpIFpvbmcsClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLCBJIGRpZG4ndCBub3RpY2UgdGhhdCBB
bGlzdGFpciBoYWQgc2VudCB0aGUgc2FtZSBwYXRjaCBiZWZvcmUuCgpIaSBQYWxtZXIsIEFsaXN0
YWlyCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNjdi8yMDIy
LU1hcmNoLzAxMzU5Ny5odG1sClRoaXMgcGF0Y2ggZG9lcyBub3Qgc2VlbSB0byBiZSBjaGVycnkt
cGlja2VkIGJhY2sgdG8gdGhlIHJlbGVhc2VkIGxpbnV4IGtlcm5lbCwKYW5kIEkgaGF2ZSBub3Qg
c2VlbiB0aGUgdjQgcGF0Y2guIE1heSBJIGFzayBob3cgaXMgdGhlIGZvbGxvdy11cCBwcm9ncmVz
cyBvZiB0aGlzIHBhdGNoPwoKQmVzdCwKRHlsYW4KCj4gPiBDaGFuZ2VzIGZyb20gdjI6Cj4gPiAt
IFJlbW92ZSB1bnN1ZWQgRVhQT1JUX1NZTUJPTCgpCj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RsYmZsdXNoLmggfCAyICsrCj4gPiAgYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMg
ICAgICAgICAgIHwgMiArLQo+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgICAgICAgICB8
IDIgKy0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiBpbmRleCA5MDdiOWVmZDM5
YTguLjU5N2Q2ZDhhZWMyOCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dGxiZmx1c2guaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4g
PiBAQCAtMTIsNiArMTIsOCBAQAo+ID4gICNpbmNsdWRlIDxhc20vZXJyYXRhX2xpc3QuaD4KPiA+
Cj4gPiAgI2lmZGVmIENPTkZJR19NTVUKPiA+ICtleHRlcm4gdW5zaWduZWQgbG9uZyBhc2lkX21h
c2s7Cj4gPiArCj4gPiAgc3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9hbGwodm9p
ZCkKPiA+ICB7Cj4gPiAgICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICgic2ZlbmNlLnZtYSIg
OiA6IDogIm1lbW9yeSIpOwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vY29udGV4dC5j
IGIvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiA+IGluZGV4IDgwY2U5Y2FiYThkMi4uNmQxYWVi
MDYzZTgxIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiA+ICsrKyBi
L2FyY2gvcmlzY3YvbW0vY29udGV4dC5jCj4gPiBAQCAtMjIsNyArMjIsNyBAQCBERUZJTkVfU1RB
VElDX0tFWV9GQUxTRSh1c2VfYXNpZF9hbGxvY2F0b3IpOwo+ID4KPiA+ICBzdGF0aWMgdW5zaWdu
ZWQgbG9uZyBhc2lkX2JpdHM7Cj4gPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbnVtX2FzaWRzOwo+
ID4gLXN0YXRpYyB1bnNpZ25lZCBsb25nIGFzaWRfbWFzazsKPiA+ICt1bnNpZ25lZCBsb25nIGFz
aWRfbWFzazsKPiA+Cj4gPiAgc3RhdGljIGF0b21pY19sb25nX3QgY3VycmVudF92ZXJzaW9uOwo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgYi9hcmNoL3Jpc2N2
L21tL3RsYmZsdXNoLmMKPiA+IGluZGV4IGNlN2RmYzgxYmIzZi4uYmE0YzI3MTg3Yzk1IDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2
L21tL3RsYmZsdXNoLmMKPiA+IEBAIC0yNyw3ICsyNyw3IEBAIHN0YXRpYyB2b2lkIF9fc2JpX3Rs
Yl9mbHVzaF9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBzdGFydCwK
PiA+ICAgICAgICAgLyogY2hlY2sgaWYgdGhlIHRsYmZsdXNoIG5lZWRzIHRvIGJlIHNlbnQgdG8g
b3RoZXIgQ1BVcyAqLwo+ID4gICAgICAgICBicm9hZGNhc3QgPSBjcHVtYXNrX2FueV9idXQoY21h
c2ssIGNwdWlkKSA8IG5yX2NwdV9pZHM7Cj4gPiAgICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX3Vu
bGlrZWx5KCZ1c2VfYXNpZF9hbGxvY2F0b3IpKSB7Cj4gPiAtICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBhc2lkID0gYXRvbWljX2xvbmdfcmVhZCgmbW0tPmNvbnRleHQuaWQpOwo+ID4gKyAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXNpZCA9IGF0b21pY19sb25nX3JlYWQoJm1tLT5j
b250ZXh0LmlkKSAmIGFzaWRfbWFzazsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgLyoKPiA+ICAg
ICAgICAgICAgICAgICAgKiBUTEIgd2lsbCBiZSBpbW1lZGlhdGVseSBmbHVzaGVkIG9uIGhhcnRz
IGNvbmN1cnJlbnRseQo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
