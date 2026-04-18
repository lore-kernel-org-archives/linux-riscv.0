Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3B0F99C9A
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Apr 2026 22:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTo/z1Af4kF+aWpd2D/+8k1vfwitbaZlfqZ0buMSEHU=; b=omuElXGHfboDGY
	fDdQ5iYJ1eq+vejc7VdfCJ88GIITM8kn139SNzVi6Y3PMSKe8tfIMzDgBiz8EZhBcxKpuUhCfZ1O/
	b+o9V/o0zmNJbjT1YQ/PKFwS8+uC3tZ4vMQ6tPlS87FXj39Tb3hcSBSY4zIyzxcYMuY9fOWivXxN2
	p7+ySocZ9hjvZZ2dXh4XQKVKlWBxmUdTZ2DoVWIJzunuMY8RdQQmC6KcTe/34w9wNk14v+sAS9RNP
	GEtbioNVKbuH72RSR1FVGEUQam3i4lcaQkNQqBOGRl9zQANXFLdoH9B+KS1GA/QfcWF6Fw47GG2PW
	55kTI+ZfKxjlHDLFJvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEDj8-00000005EfA-1nzI;
	Sat, 18 Apr 2026 22:01:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEDj6-00000005Ef4-3bPd
	for linux-riscv@lists.infradead.org;
	Sat, 18 Apr 2026 22:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D366460138;
	Sat, 18 Apr 2026 22:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0758C19424;
	Sat, 18 Apr 2026 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776549677;
	bh=A5nAfY0NCQpH7+XTQGibmLwo/DHt2HJgZy3T+nc98RQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ov6I0C9WO+pvVeHHF8+eA1mVy/+nfpXNloSzyhX3q7T0ksZvQ8V1V3A63tcjeaDnY
	 /bFBmlsemI4DRs1nKLBBXsmeVlYp1t2d96Uy6e04cwlpKK4Firh3X6VRDNIMszsVnn
	 Kv7DSmLdGRXNK6envCiqUlGHxk9k6VHlnMc8gFSpsPtxYr4W4tNOI4RkTs1GU65LQI
	 6/7Antf6xdT9gPXzY97fNCOsspL70XTzbTiwmtpFD+cdjR4Wcr2ldzoNkRsCKxQnGH
	 //Pt9Pt60iTtFp6f8R4dKTd6jMGXq93OMWOlwaJKQOqNs6lMf+UwDwCAnGCcx02voi
	 Bb/kPWTBSpApw==
Date: Sat, 18 Apr 2026 15:01:12 -0700
From: Drew Fustini <fustini@kernel.org>
To: guo.wenjia23@zte.com.cn
Subject: Re: [PATCH RFC v3 06/11] RISC-V: QoS: add resctrl setup and domain
 management
Message-ID: <aeP_KJz07WnkqVTP@gen8>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-6-b3b2e7e9847a@kernel.org>
 <202604180028.63I0Svo8029922@mse-fl1.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202604180028.63I0Svo8029922@mse-fl1.zte.com.cn>
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
Cc: x86@kernel.org, atish.patra@linux.dev, aricciardi@baylibre.com, atishp@rivosinc.com, conor+dt@kernel.org, npitre@baylibre.com, linux-kernel@vger.kernel.org, gong.shuai@sanechips.com.cn, zhiwei_liu@linux.alibaba.com, krzk+dt@kernel.org, linux-riscv@lists.infradead.org, robh@kernel.org, alex@ghiti.fr, rafael@kernel.org, acpica-devel@lists.linux.dev, robert.moore@intel.com, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, ben.horgan@arm.com, james.morse@arm.com, rkrcmar@ventanamicro.com, Dave.Martin@arm.com, lenb@kernel.org, gsh517@gmail.com, fenghua.yu@intel.com, cp0613@linux.alibaba.com, aou@eecs.berkeley.edu, mindal@semihalf.com, babu.moger@amd.com, liwei1518@gmail.com, cuiyunhui@bytedance.com, paul.walmsley@sifive.com, ved@rivosinc.com, reinette.chatre@intel.com, vasu@rivosinc.com, tony.luck@intel.com, peternewman@google.com, conor.dooley@microchip.com, samuel.holland@sifive.com, palmer@dabbelt.com, pjw@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBcHIgMTcsIDIwMjYgYXQgMDY6NTI6MjdQTSArMDgwMCwgZ3VvLndlbmppYTIzQHp0
ZS5jb20uY24gd3JvdGU6Cj4gSGkgRHJldywKPiAKPiBPbiBXZWQsIEFwciAxNSwgMjAyNiBhdCA5
OjU34oCvQU0gRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+ID4g
QWRkIHRoZSBzZXR1cCBhbmQgZG9tYWluIG1hbmFnZW1lbnQgbGF5ZXI6IGRvbWFpbiBhbGxvY2F0
aW9uCj4gPiAocW9zX25ld19kb21haW4pLCBjb250cm9sbGVyIHZhbHVlIGluaXRpYWxpemF0aW9u
Cj4gPiAocW9zX2luaXRfZG9tYWluX2N0cmx2YWwpLCByZXNvdXJjZSBzdHJ1Y3QgaW5pdGlhbGl6
YXRpb24gZm9yIGNhY2hlIGFuZAo+ID4gYmFuZHdpZHRoIHJlc291cmNlcywgZG9tYWluIHJlZ2lz
dHJhdGlvbiB3aXRoIHRoZSByZXNjdHJsIGZpbGVzeXN0ZW0KPiA+IChxb3NfcmVzY3RybF9hZGRf
Y29udHJvbGxlcl9kb21haW4pLCBhbmQgdGhlIHRvcC1sZXZlbCBzZXR1cCBmdW5jdGlvbgo+ID4g
KHFvc19yZXNjdHJsX3NldHVwKSB0aGF0IHByb2JlcyBhbGwgY29udHJvbGxlcnMgYW5kIGNhbGxz
IHJlc2N0cmxfaW5pdCgpLgo+ID4KPiA+IEFsc28gYWRkIHFvc19yZXNjdHJsX29ubGluZV9jcHUo
KSBhbmQgcW9zX3Jlc2N0cmxfb2ZmbGluZV9jcHUoKSBmb3IgQ1BVCj4gPiBob3RwbHVnIGludGVn
cmF0aW9uLgo+ID4KPiA+IENvLWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2Np
YXJkaUBiYXlsaWJyZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxh
cmljY2lhcmRpQGJheWxpYnJlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8
ZnVzdGluaUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcW9zL3Fv
c19yZXNjdHJsLmMgfCAyOTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDI5NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcW9zL3Fvc19yZXNjdHJsLmMKPiA+IGluZGV4IGE0YTEyMGY4OTg0MC4u
OGQ3ZTNiMGFiYjc1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcW9zL3Fvc19y
ZXNjdHJsLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jCj4g
PiBAQCAtNjc1LDcgKzY3NSwyMyBAQCB2b2lkIHJlc2N0cmxfYXJjaF9yZXNldF9ybWlkX2FsbChz
dHJ1Y3QgcmR0X3Jlc291cmNlICpyLCBzdHJ1Y3QgcmR0X2wzX21vbl9kb21haQo+ID4gIAo+ID4g
IHZvaWQgcmVzY3RybF9hcmNoX3Jlc2V0X2FsbF9jdHJscyhzdHJ1Y3QgcmR0X3Jlc291cmNlICpy
KQo+ID4gIHsKPiA+IC0gICAgLyogbm90IGltcGxlbWVudGVkIGZvciB0aGUgUklTQy1WIHJlc2N0
cmwgaW1wbGVtZW50YXRpb24gKi8KPiA+ICsgICAgc3RydWN0IGNicXJpX3Jlc2N0cmxfcmVzICpo
d19yZXM7Cj4gPiArICAgIHN0cnVjdCByZHRfY3RybF9kb21haW4gKmQ7Cj4gPiArICAgIGVudW0g
cmVzY3RybF9jb25mX3R5cGUgdDsKPiA+ICsgICAgdTMyIGRlZmF1bHRfY3RybDsKPiA+ICsgICAg
aW50IGk7Cj4gPiArCj4gPiArICAgIGxvY2tkZXBfYXNzZXJ0X2NwdXNfaGVsZCgpOwo+ID4gKwo+
ID4gKyAgICBod19yZXMgPSBjb250YWluZXJfb2Yociwgc3RydWN0IGNicXJpX3Jlc2N0cmxfcmVz
LCByZXNjdHJsX3Jlcyk7Cj4gPiArICAgIGRlZmF1bHRfY3RybCA9IHJlc2N0cmxfZ2V0X2RlZmF1
bHRfY3RybChyKTsKPiA+ICsKPiA+ICsgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShkLCAmci0+Y3Ry
bF9kb21haW5zLCBoZHIubGlzdCkgewo+ID4gKyAgICAgICAgZm9yIChpID0gMDsgaSA8IGh3X3Jl
cy0+bWF4X3JjaWQ7IGkrKykgewo+ID4gKyAgICAgICAgICAgIGZvciAodCA9IDA7IHQgPCBDRFBf
TlVNX1RZUEVTOyB0KyspCj4gPiArICAgICAgICAgICAgICAgIHJlc2N0cmxfYXJjaF91cGRhdGVf
b25lKHIsIGQsIGksIHQsIGRlZmF1bHRfY3RybCk7Cj4gCj4gRm9yIHRoZSBidyBjb250cm9sbGVy
LCBkZWZhdWx0X2N0cmwgPSBtYXhfYncsIGFuZAo+IHJlc2N0cmxfYXJjaF91cGRhdGVfb25lIHdp
bGwgc2V0IHRoZSByYndiIG9mIGFsbCBSQ0lEcyB0byBtYXhfYncuCj4gQWNjb3JkaW5nIHRvIHRo
ZSBzcGVjOiBUaGUgc3VtIG9mIFJid2IgYWxsb2NhdGVkIGFjcm9zcyBhbGwgcmNpZHMgbXVzdAo+
IG5vdCBleGNlZWQgTVJCV0IgdmFsdWUuIAo+IAo+IERvZXMgdGhpcyBjb25mbGljdCB3aXRoIHRo
ZSBzcGVjPwoKR29vZCBwb2ludC4gWWVhaCwgdGhpcyBpcyBub3QgYmVpbmcgZG9uZSBjb3JyZWN0
bHkuIEkgaGFkIGJlZW4gZG9pbmcKc2ltaWxhciB0byB3aGF0IGlzIGRvbmUgb24geDg2IGJ1dCB0
aGUgYmlnIGRpZmZlcmVuY2UgaXMgdGhhdCBDQlFSSSBpcwpyZXNlcnZhdGlvbiBiYXNlZC4KCkVh
Y2ggUkNJRCBtdXN0IGhhdmUgYXQgbGVhc3QgMSBSYndiLCBhbmQgdGhlIHJlbWFpbmRlciBzaG91
bGQgYmUKYXNzaWduZWQgdG8gZGVmYXVsdCBncm91cCwgUkNJRCAwLiBJdCdsbCB1cGRhdGUgdGhl
IGltcGxlbWVudGF0aW9uLgoKVGhhbmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
