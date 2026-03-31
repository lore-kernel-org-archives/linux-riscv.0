Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6D6FF60C8
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 05:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IdheHVOoYf/cI8Qr797hLwIOA3hcPwf/1kNVstUuWc=; b=EX+z5wAVxkObBY
	A4dFflgaQEpwzmmkuoT6KWSppb3ZtIn8gqNbTXP8OMHueHejs15hQbUp/cG428h7QzHIGfaBBTQOh
	hm3JyHdxSH7C6voFZFXnvvGd7VEK9hR1KWbMHX4ypEZHLYSkriCdMwc6eTix22njv8Nd+IMojyen8
	qFHwTsu+McA/dPb5cz6iC8Zx79op7Zy27eLCPm9uSzyBRizMNlvW3YiMPB6fyPhFaAEPVjqGTqIW9
	AXxldsFFIJEpFMvicfoIeCEQZ5TeLmFmty3q/MnCHKV8j1N/Jmt5pOBXCHA8COJc9vsNNrOCEVYdn
	NnKbsO4MOAeePY9Bu1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7S6y-0000000CKS1-0Xyv;
	Tue, 31 Mar 2026 05:58:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7S6v-0000000CKRS-42Ej
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 05:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89DDF409EB;
	Tue, 31 Mar 2026 05:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE5CC19423;
	Tue, 31 Mar 2026 05:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774936676;
	bh=5hADumHSBXCjIT1+LmAVrQVfEhe+8GDNiqeARvyfA+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIyEdRjMgpcYCfx8c2wkR1g9VBqLaIM+JUvM94CrucqM8dJfEWLApjrIuG5eqArjg
	 QorgFLXDc6ZfIpx7w254FmJvjd01xC6pC7lMhDgaf6fuUDhUM/sRpCv+1AtfEn49Gz
	 ems2dTvkV+doldKZL09o+HBJ3cIncReLiFwIG8KKbIcCDzBJMhEHJJAhTJj6nICM48
	 kHAGWQ/MTlrcniA/NcP3wMs2DOnN1+VpqCKRoyyXGUnWFc8TCnZRduI6DtNBYySZft
	 VOOmZEM5sNsGsXdH1kCX1imhiqJg9AS1s53HKHLn5KWxbVRfd69xa6gIk4QdZKELRC
	 B2WhVDvepMeqQ==
Date: Mon, 30 Mar 2026 22:57:54 -0700
From: Drew Fustini <fustini@kernel.org>
To: guo.wenjia23@zte.com.cn
Subject: Re: [PATCH RFC 08/19] RISC-V: QoS: add resctrl interface for CBQRI
 controllers
Message-ID: <actiYi6ACcOrvz9J@gen8>
References: <20260119-ssqosid-cbqri-v1-8-aa2a75153832@kernel.org>
 <202603261113.62QBDn8T007047@mse-db.zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202603261113.62QBDn8T007047@mse-db.zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_225758_067623_86CD8288 
X-CRM114-Status: GOOD (  16.68  )
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
Cc: x86@kernel.org, atish.patra@linux.dev, aricciardi@baylibre.com, atishp@rivosinc.com, cp0613@linux.alibaba.com, cuiyunhui@bytedance.com, zhiwei_liu@linux.alibaba.com, linux-riscv@lists.infradead.org, vasu@rivosinc.com, robh@kernel.org, alex@ghiti.fr, rafael@kernel.org, acpica-devel@lists.linux.dev, robert.moore@intel.com, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, ben.horgan@arm.com, palmer@dabbelt.com, rkrcmar@ventanamicro.com, dave.martin@arm.com, lenb@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, mindal@semihalf.com, babu.moger@amd.com, liwei1518@gmail.com, npitre@baylibre.com, paul.walmsley@sifive.com, ved@rivosinc.com, reinette.chatre@intel.com, pjw@kernel.org, tony.luck@intel.com, peternewman@google.com, linux-kernel@vger.kernel.org, fenghua.yu@intel.com, samuel.holland@sifive.com, james.morse@arm.com, krzk+dt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgMjYsIDIwMjYgYXQgMDc6MDU6NDhQTSArMDgwMCwgZ3VvLndlbmppYTIzQHp0
ZS5jb20uY24gd3JvdGU6Cj4gSGkgRHJldywKPiAKPiBPbiBUaHUsIEphbiAyOSwgMjAyNiBhdCA0
OjI44oCvQU0gRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+IHdyb3RlOj4KPiA+IEFk
ZCBpbnRlcmZhY2UgZm9yIENCUVJJIGNvbnRyb2xsZXIgZHJpdmVycyB0byBtYWtlIHVzZSBvZiB0
aGUgcmVzY3RybAo+ID4gZmlsZXN5c3RlbS4KPiA+Cj4gPiBDby1kZXZlbG9wZWQtYnk6IEFkcmll
biBSaWNjaWFyZGkgPGFyaWNjaWFyZGlAYmF5bGlicmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTog
QWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJyZS5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gIGFyY2gv
cmlzY3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jIHwgMTE5MiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMTkyIGluc2VydGlvbnMoKykK
PiA+Cj4gPiAuLi4KPiA+Cj4gPiArCj4gPiAraW50IHJlc2N0cmxfYXJjaF91cGRhdGVfb25lKHN0
cnVjdCByZHRfcmVzb3VyY2UgKnIsIHN0cnVjdCByZHRfY3RybF9kb21haW4gKmQsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGNsb3NpZCwgZW51bSByZXNjdHJsX2NvbmZfdHlw
ZSB0LCB1MzIgY2ZnX3ZhbCkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBjYnFyaV9jb250cm9s
bGVyICpjdHJsOwo+ID4gKyAgICAgICBzdHJ1Y3QgY2JxcmlfcmVzY3RybF9kb20gKmRvbTsKPiA+
ICsgICAgICAgc3RydWN0IGNicXJpX2NvbmZpZyBjZmc7Cj4gPiArICAgICAgIGludCBlcnIgPSAw
Owo+ID4gKwo+ID4gKyAgICAgICBkb20gPSBjb250YWluZXJfb2YoZCwgc3RydWN0IGNicXJpX3Jl
c2N0cmxfZG9tLCByZXNjdHJsX2N0cmxfZG9tKTsKPiA+ICsgICAgICAgY3RybCA9IGRvbS0+aHdf
Y3RybDsKPiA+ICsKPiA+ICsgICAgICAgaWYgKCFyLT5hbGxvY19jYXBhYmxlKQo+ID4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAgICBzd2l0Y2ggKHItPnJp
ZCkgewo+ID4gKyAgICAgICBjYXNlIFJEVF9SRVNPVVJDRV9MMjoKPiA+ICsgICAgICAgY2FzZSBS
RFRfUkVTT1VSQ0VfTDM6Cj4gPiArICAgICAgICAgICAgICAgY2ZnLmNibSA9IGNmZ192YWw7Cj4g
PiArICAgICAgICAgICAgICAgZXJyID0gY2JxcmlfYXBwbHlfY2FjaGVfY29uZmlnKGRvbSwgY2xv
c2lkLCB0LCAmY2ZnKTsKPiA+ICsgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgY2Fz
ZSBSRFRfUkVTT1VSQ0VfTUJBOgo+ID4gKyAgICAgICAgICAgICAgIC8qIGNvdmVydCBmcm9tIHBl
cmNlbnRhZ2UgdG8gYmFuZHdpZHRoIGJsb2NrcyAqLwo+ID4gKyAgICAgICAgICAgICAgIGNmZy5y
YndiID0gY2ZnX3ZhbCAqIGN0cmwtPmJjLm5id2Jsa3MgLyAxMDA7Cj4gCj4gU2hvdWxkIHVzZSBi
Yy5tcmJ3YiB0byBjYWxjdWxhdGUgcmJ3Yj8gCj4gSSB0aGluayBiYy5uYndibGtzIHJlcHJlc2Vu
dCB0aGUgYXZhaWxhYmxlIGJ3IGJsa3MgaW4gdGhlIGNvbnRyb2xsZXIuCj4gSXQgc2hvdWxkIHNo
b3VsZCBkZWNyZWFzZSBhcyB0aGV5IGFyZSBhbGxvY2F0ZWQuCgpUaGUgcmVzY3RybCBNQkEgcmVz
b3VyY2UgaXMgc3VwcG9zZWQgdG8gYmUgdGhlIHBlcmNlbnRhZ2Ugb2YgdG90YWwKbWVtb3J5IGJh
bmR3aWR0aC4gbmJ3YmxrcyBpcyB0aGUgdG90YWwgbnVtYmVyIG9mIGJhbmR3aWR0aCBibG9ja3Ms
IHNvIEkKdGhpbmsgdGhlIGV4aXN0aW5nIGNhbHVjYXRpb24gaXMgY29ycmVjdC4KCkZyb20gdGhl
IGV4YW1wbGUgU29DIGNvbmZpZ3VyYXRpb24sIHRoZSBudW1iZXIgb2YgYmFuZHdpZHRoIGJsb2Nr
cyBpcwoxMDI0LCBhbmQgbXJid2IgaXMgbWVhbnQgdG8gYmUgODAlIG9mIG5id2Jsa3Mgd2hpY2gg
aXMgODE5LgoKU2V0dGluZyBNQiB0byA4MCUgaW4gc2NoZW1hdGEgd291bGQgeWllbGQ6IDgwICog
MTAyNCAvIDEwMCA9IDgxOQoKVGhhbmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
