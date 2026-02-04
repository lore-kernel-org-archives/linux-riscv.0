Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BBBE8B389
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 02:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:Mime-Version:From:
	References:To:In-Reply-To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SB5ebGyMeZPRYv1dFUl4MauTOSyvM5kt0ZtbzF6H+rI=; b=Q5bQ1VFygat/4U
	wt7hIMawIVBvsKqdy4mE/XA8RktpQXiEhCCCmtdFXeRiXC1ma+OS06blT+VVDerD3SMDl8JYfwSQQ
	pes4eV/qJHPnNkvz+nfw62oD8vnwoM82nY+DnhFoQ3VPQ/zJiQ5l2Lk2dTNM8b3jyRPnMAlTLrGNs
	jYMqIiviXYJRGCrywH6CY/H0btZJCmmVJPqQlCkMUvVe77hZ5xJ9QBdeFFxkrMr/mFANlbakc7QjH
	v0F2nPdCT0wz7mtDRDEpXuLhAf/xhsCA7B4GFBxoIF+0kPtB43trnhnKF85i2mUN0DiskLJEMeW4W
	KNnYClBAPLil6SBEgS1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSBY-00000007jfE-3okf;
	Wed, 04 Feb 2026 02:00:04 +0000
Received: from sg-1-13.ptr.blmpb.com ([118.26.132.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSBU-00000007jcq-0AQx
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 02:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2506131828; d=riscv-computing.com; t=1770170388;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=3FQkGOV+NC5ox+buWoMpx+RVNOee1LQbTe8Icg3qZGQ=;
 b=IptItgTkCbbttbiLPvv6+8WmBOYzuI0lTB2qKS5ZIL/NIhurOuMJXEHIje0LPLPE/7Vz/J
 XbFJFr/TAQAxffwx2s17q1UyACcd8DDDFzrk26u7HJCKi4gA5LsKqPrHARAkldJb66549q
 mZySXB4HtoCZCOOS+lNXPWEMikX+YRmwx7gzHAjSGn3/Y0SmFexEFlCxk93s8LMU19Qzwn
 nsP6P71H37Ig8AOA4fMSoUm7MNRLV7cRgwE3yuReCD3JpIoEAYAKKokDVERZJhhPiKcAqV
 EcphXIECdsHDqO9AXKZK97bGPEceHBSDb065LwJySs9us+49f6u0X/vIy/bGxA==
Message-Id: <39cbfcdf-db96-4e2a-bcca-ef10298492fd@riscv-computing.com>
In-Reply-To: <87ecn23q6e.ffs@tglx>
To: "Thomas Gleixner" <tglx@kernel.org>, <anup@brainfault.org>, 
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<alex@ghiti.fr>
X-Original-From: Yingjun Ni <yingjun.ni@riscv-computing.com>
References: <20260203080256.9401-2-yingjun.ni@riscv-computing.com> <87ecn23q6e.ffs@tglx>
From: "Yingjun Ni" <yingjun.ni@riscv-computing.com>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix irq migration failure issue when cpu hotplug.
Date: Wed, 4 Feb 2026 09:59:43 +0800
X-Lms-Return-Path: <lba+26982a812+376fa2+lists.infradead.org+yingjun.ni@riscv-computing.com>
Received: from [192.168.102.222] ([14.127.203.227]) by smtp.feishu.cn with ESMTPS; Wed, 04 Feb 2026 09:59:45 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_180000_773107_CC6CAF64 
X-CRM114-Status: GOOD (  24.01  )
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

PiBPbiBUdWUsIEZlYiAwMyAyMDI2IGF0IDE2OjAyLCBZaW5nanVuIE5pIHdyb3RlOgo+PiBBZGQg
YSBudWxsIHBvaW50ZXIgY2hlY2sgZm9yIGlycV93cml0ZV9tc2lfbXNnIHRvIGZpeCBOVUxMIHBv
aW50ZXIKPj4gZGVyZWZlcmVuY2UgaXNzdWUgd2hlbiBtaWdyYXRpbmcgaXJxLgo+Pgo+PiBNb2Rp
ZnkgdGhlIHJldHVybiB2YWx1ZSBvZiBpbXNpY19pcnFfc2V0X2FmZmluaXR5IHRvIGxldCB0aGUg
c3ViZG9tYWluCj4+IFBDSS1NU0lYIG1pZ3JhdGUgdGhlIGlycSB0byBhIG5ldyBjcHUgd2hlbiBj
cHUgaG90cGx1Zy4KPj4KPj4gRG9uJ3Qgc2V0IHZlYy0+bW92ZV9uZXh0IGluIGltc2ljX3ZlY3Rv
cl9tb3ZlX3VwZGF0ZSB3aGVuIHRoZSBjcHUgaXMKPj4gb2ZmbGluZSwgYmVjYXVzZSBpdCB3aWxs
IG5ldmVyIGJlIGNsZWFyZWQuCj4gWW91IGNvbXBsZXRlbHkgZmFpbCB0byBleHBsYWluIHRoZSBh
Y3R1YWwgcHJvYmxlbSBhbmQgdGhlIHJvb3QKPiBjYXVzZS4gU2VlCj4KPiBodHRwczovL3d3dy5r
ZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL21haW50YWluZXItdGlwLmh0bWwjY2hh
bmdlbG9nCj4KPj4gICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMg
fCA4ICsrKysrKy0tCj4+ICAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5j
ICAgIHwgNSArKysrKwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW1zaWMtcGxhdGZvcm0uYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZv
cm0uYwo+PiBpbmRleCA2NDNjOGU0NTk2MTEuLjEzMWU0ZjJiNTQzMSAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4+ICsrKyBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+PiBAQCAtOTMsOSArOTMsMTMg
QEAgc3RhdGljIHZvaWQgaW1zaWNfaXJxX2NvbXBvc2VfbXNnKHN0cnVjdCBpcnFfZGF0YSAqZCwg
c3RydWN0IG1zaV9tc2cgKm1zZykKPj4gICBzdGF0aWMgdm9pZCBpbXNpY19tc2lfdXBkYXRlX21z
ZyhzdHJ1Y3QgaXJxX2RhdGEgKmQsIHN0cnVjdCBpbXNpY192ZWN0b3IgKnZlYykKPj4gICB7Cj4+
ICAgCXN0cnVjdCBtc2lfbXNnIG1zZyA9IHsgfTsKPj4gKwlzdHJ1Y3QgaXJxX2NoaXAgKmlycV9j
aGlwID0gaXJxX2RhdGFfZ2V0X2lycV9jaGlwKGQpOwo+PiArCj4+ICsJaWYgKCFpcnFfY2hpcC0+
aXJxX3dyaXRlX21zaV9tc2cpCj4+ICsJCXJldHVybjsKPiBJIGhhdmUgbm8gaWRlYSBob3cgdGhp
cyBldmVyIHdvcmtlZC4gVGhlIGlycV9kYXRhIHBvaW50ZXIgYmVsb25ncyB0byB0aGUKPiBJTVNJ
QyBiYXNlIGRvbWFpbiwgd2hpY2ggZGVmaW5pdGVseSBkb2VzIG5vdCBoYXZlIGEgaXJxX3dyaXRl
X21zaV9tc2coKQo+IGNhbGxiYWNrIGFuZCBuZXZlciBjYW4gaGF2ZSBvbmUuCj4KPiBUaGUgd3Jp
dGUgbWVzc2FnZSBjYWxsYmFjayBpcyBhbHdheXMgaW1wbGVtZW50ZWQgYnkgdGhlIHRvcCBtb3N0
IGRvbWFpbiwKPiBpbiB0aGlzIGNhc2UgdGhlIFBDSS9NU0lbeF0gcGVyIGRldmljZSBkb21haW4u
Cj4KPiBTbyB0aGlzIGNvZGUgaXMgc2ltcGx5IGJyb2tlbiBhbmQgeW91ciBOVUxMIHBvaW50ZXIg
Y2hlY2sganVzdCBtYWtlcyBpdAo+IGRpZmZlcmVudGx5IGJyb2tlbi4KU29ycnksIG15IG1pc3Rh
a2UsIHRoZSBOVUxMIHBvaW50ZXIgaXNzdWUgaGFzIGJlZW4gZml4ZWQgYnkgY29tbWl0IAooYzQ3
NWMwYjcxMzE0IGlycWNoaXAvcmlzY3YtaW1zaWM6IFJlbW92ZSByZWR1bmRhbnQgaXJxX2RhdGEg
bG9va3VwcykKPj4gICAJaW1zaWNfaXJxX2NvbXBvc2VfdmVjdG9yX21zZyh2ZWMsICZtc2cpOwo+
PiAtCWlycV9kYXRhX2dldF9pcnFfY2hpcChkKS0+aXJxX3dyaXRlX21zaV9tc2coZCwgJm1zZyk7
Cj4+ICsJaXJxX2NoaXAtPmlycV93cml0ZV9tc2lfbXNnKGQsICZtc2cpOwo+PiAgIH0KPj4gICAK
Pj4gICBzdGF0aWMgaW50IGltc2ljX2lycV9zZXRfYWZmaW5pdHkoc3RydWN0IGlycV9kYXRhICpk
LCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqbWFza192YWwsCj4+IEBAIC0xNzMsNyArMTc3LDcgQEAg
c3RhdGljIGludCBpbXNpY19pcnFfc2V0X2FmZmluaXR5KHN0cnVjdCBpcnFfZGF0YSAqZCwgY29u
c3Qgc3RydWN0IGNwdW1hc2sgKm1hc2sKPj4gICAJLyogTW92ZSBzdGF0ZSBvZiB0aGUgb2xkIHZl
Y3RvciB0byB0aGUgbmV3IHZlY3RvciAqLwo+PiAgIAlpbXNpY192ZWN0b3JfbW92ZShvbGRfdmVj
LCBuZXdfdmVjKTsKPj4gICAKPj4gLQlyZXR1cm4gSVJRX1NFVF9NQVNLX09LX0RPTkU7Cj4+ICsJ
cmV0dXJuIElSUV9TRVRfTUFTS19PSzsKPiBIYXZlIHlvdSBhY3R1YWxseSBsb29rZWQgYXQgdGhl
IGNvbnNlcXVlbmNlcyBvZiB0aGlzIGNoYW5nZT8KPgo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMg
dm9pZCBpbXNpY19pcnFfZm9yY2VfY29tcGxldGVfbW92ZShzdHJ1Y3QgaXJxX2RhdGEgKmQpCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgYi9k
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPj4gaW5kZXggYjZjZWJmZWU5
NDYxLi5jZDFiZjk1MTY4NzggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlz
Y3YtaW1zaWMtc3RhdGUuYwo+PiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2lj
LXN0YXRlLmMKPj4gQEAgLTM2Miw2ICszNjIsMTAgQEAgc3RhdGljIGJvb2wgaW1zaWNfdmVjdG9y
X21vdmVfdXBkYXRlKHN0cnVjdCBpbXNpY19sb2NhbF9wcml2ICpscHJpdiwKPj4gICAJLyogVXBk
YXRlIGVuYWJsZSBhbmQgbW92ZSBkZXRhaWxzICovCj4+ICAgCWVuYWJsZWQgPSBSRUFEX09OQ0Uo
dmVjLT5lbmFibGUpOwo+PiAgIAlXUklURV9PTkNFKHZlYy0+ZW5hYmxlLCBuZXdfZW5hYmxlKTsK
Pj4gKwo+PiArCWlmICghY3B1X29ubGluZSh2ZWMtPmNwdSkgJiYgaXNfb2xkX3ZlYykKPj4gKwkJ
Z290byBvdXQ7Cj4gVGhpcyBpcyBkZWZpbml0ZWx5IG5vdCBjb3JyZWN0IGFzIHRoaXMgc2hvdWxk
IHN0aWxsIGNsZWFudXAgc29mdHdhcmUKPiBzdGF0ZSwgbm8/CgppZiB2ZWMtPm1vdmVfbmV4dCBp
cyBub3QgY2xlYXJlZCB3aGVuIHRoZSBjcHUgaXMgb2ZmbGluZSwgdGhlIGZvbGxvd2luZyAKaXNz
dWUgd2lsbCBvY2N1ci4KCmNhdCAvcHJvYy9pbnRlcnJ1cHRzCiDCoCDCoCBDUFUwwqAgQ1BVMcKg
IENQVTIgQ1BVMwoyMzrCoCDCoDDCoCDCoCDCoCDCoDDCoCDCoCDCoCDCoCDCoDDCoCDCoCDCoCDC
oDY2wqAgwqBQQ0ktTVNJWC0wMDAwOjAwOjAxLjAgZXRoMC1yeC0wCgplY2hvIDAgPiAvc3lzL2J1
cy9jcHUvZGV2aWNlcy9jcHUzL29ubGluZQoKY2F0IC9wcm9jL2ludGVycnVwdHMKIMKgIMKgIENQ
VTDCoCBDUFUxwqAgQ1BVMgoyMzrCoCDCoDDCoCDCoCDCoCDCoDDCoCDCoCDCoCDCoCDCoDY2wqAg
wqBQQ0ktTVNJWC0wMDAwOjAwOjAxLjAgZXRoMC1yeC0wCgplY2hvIDAgPiAvc3lzL2J1cy9jcHUv
ZGV2aWNlcy9jcHUyL29ubGluZQpbwqAgwqAzNS42OTczODBdIElSUTIzOiBzZXQgYWZmaW5pdHkg
ZmFpbGVkKC0xNikuClvCoCDCoDM1LjY5ODM4MV0gQ1BVMjogb2ZmCgo+IFRoYW5rcywKPgo+ICAg
ICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
