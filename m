Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506851061B28
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 00:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FX/OnHF8D7mgV/uwD1KdUWv8Lc8OYbcv4W1j0kyVXGI=; b=pdupYkIRDNtIEY
	wCRO9OKR/4e/G5BpGy5SC4GBC7qNB32cdpAXiHaVoucY82/WTuWF6EpSWWcKFZQ0NJC2GWi7LXz1a
	8EBVY7tDnJjqZya44MdokYV5C6CSNDfIp6lFbuzE1V8pVz61+3Zn09YT9ALHUxEx62Cfr5Ghk1SII
	D5SH82tcUfKLdse09Qa7ZVj7XQV7qKSV2qgI5TSX4UBfF1cDybXVzq26ExdpqExPSTeCNcCdj98ES
	mwiShnujFOTEajDhDKPLLGfe2Bq14HL7chHh7UcFnfIP8SxLjUbWHZiyfxtsx2mkmehlTZnkvrIG3
	wOkgyIux8zVpXh1e4knA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7MuX-0000000C41E-0IAZ;
	Tue, 31 Mar 2026 00:24:49 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5if4-00000005KhR-457V
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 11:14:04 +0000
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fhLkS4GSDz8Xs71;
	Thu, 26 Mar 2026 19:13:52 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 62QBDn8T007047;
	Thu, 26 Mar 2026 19:13:49 +0800 (+08)
	(envelope-from guo.wenjia23@zte.com.cn)
Message-Id: <202603261113.62QBDn8T007047@mse-db.zte.com.cn>
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl2.zte.com.cn with SMTP id 62QB5kdA005832;
	Thu, 26 Mar 2026 19:05:46 +0800 (+08)
	(envelope-from guo.wenjia23@zte.com.cn)
Received: from mapi (njy2app08[null])
	by mapi (Zmail) with MAPI id mid202;
	Thu, 26 Mar 2026 19:05:48 +0800 (CST)
X-Zmail-TransId: 2b0069c5130c527-f477b
X-Mailer: Zmail v1.0
In-Reply-To: <20260119-ssqosid-cbqri-v1-8-aa2a75153832@kernel.org>
References: 20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org,20260119-ssqosid-cbqri-v1-8-aa2a75153832@kernel.org
Date: Thu, 26 Mar 2026 19:05:48 +0800 (CST)
Mime-Version: 1.0
From: <guo.wenjia23@zte.com.cn>
To: <fustini@kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBSRkMgMDgvMTldIFJJU0MtVjogUW9TOiBhZGQgcmVzY3RybCBpbnRlcmZhY2UgZm9yIENCUVJJIGNvbnRyb2xsZXJz?=
X-MAIL: mse-db.zte.com.cn 62QBDn8T007047
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: guo.wenjia23@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.131 unknown Thu, 26 Mar 2026 19:13:52 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69C514F0.001/4fhLkS4GSDz8Xs71
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_041403_319935_F92A2579 
X-CRM114-Status: GOOD (  14.87  )
X-Mailman-Approved-At: Mon, 30 Mar 2026 17:24:46 -0700
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
Cc: x86@kernel.org, atish.patra@linux.dev, aricciardi@baylibre.com, atishp@rivosinc.com, cp0613@linux.alibaba.com, cuiyunhui@bytedance.com, zhiwei_liu@linux.alibaba.com, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, vasu@rivosinc.com, robh@kernel.org, alex@ghiti.fr, rafael@kernel.org, acpica-devel@lists.linux.dev, robert.moore@intel.com, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, ben.horgan@arm.com, palmer@dabbelt.com, rkrcmar@ventanamicro.com, dave.martin@arm.com, lenb@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, mindal@semihalf.com, babu.moger@amd.com, liwei1518@gmail.com, npitre@baylibre.com, paul.walmsley@sifive.com, ved@rivosinc.com, reinette.chatre@intel.com, pjw@kernel.org, tony.luck@intel.com, peternewman@google.com, linux-kernel@vger.kernel.org, fenghua.yu@intel.com, samuel.holland@sifive.com, james.morse@arm.com, krzk+dt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRHJldywKCk9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Pgo+IEFkZCBpbnRlcmZhY2UgZm9yIENCUVJJIGNv
bnRyb2xsZXIgZHJpdmVycyB0byBtYWtlIHVzZSBvZiB0aGUgcmVzY3RybAo+IGZpbGVzeXN0ZW0u
Cj4KPiBDby1kZXZlbG9wZWQtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFyaWNjaWFyZGlAYmF5bGli
cmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFyaWNjaWFyZGlAYmF5
bGlicmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwu
b3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9xb3MvcW9zX3Jlc2N0cmwuYyB8IDExOTIg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEx
OTIgaW5zZXJ0aW9ucygrKQo+Cj4gLi4uCj4KPiArCj4gK2ludCByZXNjdHJsX2FyY2hfdXBkYXRl
X29uZShzdHJ1Y3QgcmR0X3Jlc291cmNlICpyLCBzdHJ1Y3QgcmR0X2N0cmxfZG9tYWluICpkLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgY2xvc2lkLCBlbnVtIHJlc2N0cmxfY29u
Zl90eXBlIHQsIHUzMiBjZmdfdmFsKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgY2JxcmlfY29udHJv
bGxlciAqY3RybDsKPiArICAgICAgIHN0cnVjdCBjYnFyaV9yZXNjdHJsX2RvbSAqZG9tOwo+ICsg
ICAgICAgc3RydWN0IGNicXJpX2NvbmZpZyBjZmc7Cj4gKyAgICAgICBpbnQgZXJyID0gMDsKPiAr
Cj4gKyAgICAgICBkb20gPSBjb250YWluZXJfb2YoZCwgc3RydWN0IGNicXJpX3Jlc2N0cmxfZG9t
LCByZXNjdHJsX2N0cmxfZG9tKTsKPiArICAgICAgIGN0cmwgPSBkb20tPmh3X2N0cmw7Cj4gKwo+
ICsgICAgICAgaWYgKCFyLT5hbGxvY19jYXBhYmxlKQo+ICsgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiArCj4gKyAgICAgICBzd2l0Y2ggKHItPnJpZCkgewo+ICsgICAgICAgY2FzZSBS
RFRfUkVTT1VSQ0VfTDI6Cj4gKyAgICAgICBjYXNlIFJEVF9SRVNPVVJDRV9MMzoKPiArICAgICAg
ICAgICAgICAgY2ZnLmNibSA9IGNmZ192YWw7Cj4gKyAgICAgICAgICAgICAgIGVyciA9IGNicXJp
X2FwcGx5X2NhY2hlX2NvbmZpZyhkb20sIGNsb3NpZCwgdCwgJmNmZyk7Cj4gKyAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSBSRFRfUkVTT1VSQ0VfTUJBOgo+ICsgICAgICAgICAg
ICAgICAvKiBjb3ZlcnQgZnJvbSBwZXJjZW50YWdlIHRvIGJhbmR3aWR0aCBibG9ja3MgKi8KPiAr
ICAgICAgICAgICAgICAgY2ZnLnJid2IgPSBjZmdfdmFsICogY3RybC0+YmMubmJ3YmxrcyAvIDEw
MDsKClNob3VsZCB1c2UgYmMubXJid2IgdG8gY2FsY3VsYXRlIHJid2I/IApJIHRoaW5rIGJjLm5i
d2Jsa3MgcmVwcmVzZW50IHRoZSBhdmFpbGFibGUgYncgYmxrcyBpbiB0aGUgY29udHJvbGxlci4g
SXQgc2hvdWxkIHNob3VsZCBkZWNyZWFzZSBhcyB0aGV5IGFyZSBhbGxvY2F0ZWQuCgo+ICsgICAg
ICAgICAgICAgICBlcnIgPSBjYnFyaV9hcHBseV9id19jb25maWcoZG9tLCBjbG9zaWQsIHQsICZj
ZmcpOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGRlZmF1bHQ6Cj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVy
biBlcnI7Cj4gK30KPgo+IC4uLgo+Cj4gK3UzMiByZXNjdHJsX2FyY2hfZ2V0X2NvbmZpZyhzdHJ1
Y3QgcmR0X3Jlc291cmNlICpyLCBzdHJ1Y3QgcmR0X2N0cmxfZG9tYWluICpkLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1MzIgY2xvc2lkLCBlbnVtIHJlc2N0cmxfY29uZl90eXBlIHR5
cGUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBjYnFyaV9yZXNjdHJsX2RvbSAqaHdfZG9tOwo+ICsg
ICAgICAgc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgKmN0cmw7Cj4gKyAgICAgICBpbnQgcmVnX29m
ZnNldDsKPiArICAgICAgIHUzMiBwZXJjZW50Owo+ICsgICAgICAgdTMyIHJid2I7Cj4gKyAgICAg
ICB1NjQgcmVnOwo+ICsgICAgICAgaW50IGVycjsKPiArCj4gKyAgICAgICBod19kb20gPSBjb250
YWluZXJfb2YoZCwgc3RydWN0IGNicXJpX3Jlc2N0cmxfZG9tLCByZXNjdHJsX2N0cmxfZG9tKTsK
PiArCj4gKyAgICAgICBjdHJsID0gaHdfZG9tLT5od19jdHJsOwo+ICsKPiArICAgICAgIGlmICgh
ci0+YWxsb2NfY2FwYWJsZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJlc2N0cmxfZ2V0X2Rl
ZmF1bHRfY3RybChyKTsKPiArCj4gKyAgICAgICBzd2l0Y2ggKHItPnJpZCkgewo+ICsgICAgICAg
Y2FzZSBSRFRfUkVTT1VSQ0VfTDI6Cj4gKyAgICAgICBjYXNlIFJEVF9SRVNPVVJDRV9MMzoKPiAr
ICAgICAgICAgICAgICAgLyogQ2xlYXIgY2NfYmxvY2tfbWFzayBiZWZvcmUgcmVhZCBsaW1pdCBv
cGVyYXRpb24gKi8KPiArICAgICAgICAgICAgICAgY2Jxcmlfc2V0X2NibShjdHJsLCAwKTsKPiAr
Cj4gKyAgICAgICAgICAgICAgIC8qIENhcGFjaXR5IHJlYWQgbGltaXQgb3BlcmF0aW9uIGZvciBS
Q0lEIChjbG9zaWQpICovCj4gKyAgICAgICAgICAgICAgIGVyciA9IGNicXJpX2NjX2FsbG9jX29w
KGN0cmwsIENCUVJJX0NDX0FMTE9DX0NUTF9PUF9SRUFEX0xJTUlULCB0eXBlLCBjbG9zaWQpOwo+
ICsgICAgICAgICAgICAgICBpZiAoZXJyIDwgMCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHByX2VycigiJXMoKTogb3BlcmF0aW9uIGZhaWxlZDogZXJyID0gJWQiLCBfX2Z1bmNfXywgZXJy
KTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmVzY3RybF9nZXRfZGVmYXVsdF9j
dHJsKHIpOwo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiBSZWFk
IGNhcGFjaXR5IGJsb2NrIG1hc2sgZm9yIFJDSUQgKGNsb3NpZCkgKi8KPiArICAgICAgICAgICAg
ICAgcmVnX29mZnNldCA9IENCUVJJX0NDX0JMT0NLX01BU0tfT0ZGOwo+ICsgICAgICAgICAgICAg
ICByZWcgPSBpb3JlYWQ2NChjdHJsLT5iYXNlICsgcmVnX29mZnNldCk7Cj4gKwo+ICsgICAgICAg
ICAgICAgICAvKiBVcGRhdGUgdGhlIGNvbmZpZyB2YWx1ZSBmb3IgdGhlIGNsb3NpZCBpbiB0aGlz
IGRvbWFpbiAqLwo+ICsgICAgICAgICAgICAgICBod19kb20tPmN0cmxfdmFsW2Nsb3NpZF0gPSBy
ZWc7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBod19kb20tPmN0cmxfdmFsW2Nsb3NpZF07Cj4g
Kwo+ICsgICAgICAgY2FzZSBSRFRfUkVTT1VSQ0VfTUJBOgo+ICsgICAgICAgICAgICAgICAvKiBD
YXBhY2l0eSByZWFkIGxpbWl0IG9wZXJhdGlvbiBmb3IgUkNJRCAoY2xvc2lkKSAqLwo+ICsgICAg
ICAgICAgICAgICBlcnIgPSBjYnFyaV9iY19hbGxvY19vcChjdHJsLCBDQlFSSV9DQ19BTExPQ19D
VExfT1BfUkVBRF9MSU1JVCwgY2xvc2lkKTsKPiArICAgICAgICAgICAgICAgaWYgKGVyciA8IDAp
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICBwcl9lcnIoIiVzKCk6IG9wZXJhdGlvbiBmYWls
ZWQ6IGVyciA9ICVkIiwgX19mdW5jX18sIGVycik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIHJlc2N0cmxfZ2V0X2RlZmF1bHRfY3RybChyKTsKPiArICAgICAgICAgICAgICAgfQo+
ICsKPiArICAgICAgICAgICAgICAgaHdfZG9tLT5jdHJsX3ZhbFtjbG9zaWRdID0gY2JxcmlfZ2V0
X3Jid2IoY3RybCk7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiBDb252ZXJ0IGZyb20gYmFuZHdp
ZHRoIGJsb2NrcyB0byBwZXJjZW50ICovCj4gKyAgICAgICAgICAgICAgIHJid2IgPSBod19kb20t
PmN0cmxfdmFsW2Nsb3NpZF07Cj4gKyAgICAgICAgICAgICAgIHJid2IgKj0gMTAwOwo+ICsgICAg
ICAgICAgICAgICBwZXJjZW50ID0gcmJ3YiAvIGN0cmwtPmJjLm5id2Jsa3M7Cj4gKyAgICAgICAg
ICAgICAgIGlmIChyYndiICUgY3RybC0+YmMubmJ3YmxrcykKClNhbWUgcHJvYmxlbS4KCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcGVyY2VudCsrOwo+ICsgICAgICAgICAgICAgICByZXR1cm4g
cGVyY2VudDsKPiArCj4gKyAgICAgICBkZWZhdWx0Ogo+ICsgICAgICAgICAgICAgICByZXR1cm4g
cmVzY3RybF9nZXRfZGVmYXVsdF9jdHJsKHIpOwo+ICsgICAgICAgfQo+ICt9CgoKVGhhbmssCldl
bmppYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
