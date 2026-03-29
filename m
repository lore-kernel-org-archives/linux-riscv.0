Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D171061B2A
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 00:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fXSjygwGbKlCpjRutLG4ZJXJPbi2OvlQc7GZeow9Y4=; b=Wsru0KIFtc51x1
	kgDbHD+HzHsVk+LhQBuAwV7DaUllXPXnackzszG77Qf0MeYKAzYoIolYqmkBp8hyV+EgRlEB2Qzz+
	YnjEjwQL0+aGMCWsbT661IjZB6VLO/rycxrgk/fwFN/IEfnc1lzAPmPlvDnYg/EnTXSIIxXF1PZ1b
	VSnCw0NTYsQVyqmDyOgdEcuhNpxEJbACzl41fAa9bh7uVumrTMwku0HQZxwFlA50g0iBvT3vuHWcQ
	GrG0jVdKkwzBc1FVaLazbpsjzESysUSqBCiXcvFRE1L1YKYTWptoVBP1UMZf4S38jrMCuqNMUIttZ
	nv4iJz3uJRx8hOyfLK9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7MuY-0000000C41u-2VjR;
	Tue, 31 Mar 2026 00:24:50 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6ndm-00000009qPX-3Her
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 10:45:12 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fk9xm0pPYz5BNS0;
	Sun, 29 Mar 2026 18:45:00 +0800 (CST)
Received: (from root@localhost)
	by mse-fl2.zte.com.cn id 62TAiv5H081340;
	Sun, 29 Mar 2026 18:44:57 +0800 (+08)
	(envelope-from guo.wenjia23@zte.com.cn)
Message-Id: <202603291044.62TAiv5H081340@mse-fl2.zte.com.cn>
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl2.zte.com.cn with SMTP id 62TARphR075539;
	Sun, 29 Mar 2026 18:27:51 +0800 (+08)
	(envelope-from guo.wenjia23@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid202;
	Sun, 29 Mar 2026 18:27:53 +0800 (CST)
X-Zmail-TransId: 2aff69c8fea9ced-ace99
X-Mailer: Zmail v1.0
In-Reply-To: <20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org>
References: 20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org,20260128-ssqosid-cbqri-v2-8-dca586b091b9@kernel.org
Date: Sun, 29 Mar 2026 18:27:53 +0800 (CST)
Mime-Version: 1.0
From: <guo.wenjia23@zte.com.cn>
To: <fustini@kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBSRkMgdjIgMDgvMTddIFJJU0MtVjogUW9TOiBhZGQgcmVzY3RybCBpbnRlcmZhY2UgZm9yIENCUVJJIGNvbnRyb2xsZXJz?=
X-MAIL: mse-fl2.zte.com.cn 62TAiv5H081340
X-MSS: AUDITRELEASE@mse-fl2.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: guo.wenjia23@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Sun, 29 Mar 2026 18:45:00 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69C902AC.000/4fk9xm0pPYz5BNS0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_034511_138224_B3DE4CEE 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: fustini@kernel.org, atish.patra@linux.dev, aricciardi@baylibre.com, atishp@rivosinc.com, conor+dt@kernel.org, npitre@baylibre.com, devicetree@vger.kernel.org, zhiwei_liu@linux.alibaba.com, linux-riscv@lists.infradead.org, robh@kernel.org, peternewman@google.com, x86@kernel.org, acpica-devel@lists.linux.dev, robert.moore@intel.com, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, ben.horgan@arm.com, james.morse@arm.com, rkrcmar@ventanamicro.com, Dave.Martin@arm.com, lenb@kernel.org, fenghua.yu@intel.com, cp0613@linux.alibaba.com, aou@eecs.berkeley.edu, mindal@semihalf.com, babu.moger@amd.com, liwei1518@gmail.com, cuiyunhui@bytedance.com, paul.walmsley@sifive.com, ved@rivosinc.com, reinette.chatre@intel.com, vasu@rivosinc.com, tony.luck@intel.com, alex@ghiti.fr, linux-kernel@vger.kernel.org, samuel.holland@sifive.com, krzk+dt@kernel.org, palmer@dabbelt.com, rafael@kernel.org, pjw@kernel.org
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
b3JnPgo+IC0tLQo+IGFyY2gvcmlzY3Yva2VybmVsL3Fvcy9xb3NfcmVzY3RybC5jIHwgMTE5MiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IDEgZmlsZSBjaGFuZ2VkLCAxMTky
IGluc2VydGlvbnMoKykKPgo+IC4uLgo+Cj4gKwo+ICtpbnQgcmVzY3RybF9hcmNoX3VwZGF0ZV9v
bmUoc3RydWN0IHJkdF9yZXNvdXJjZSAqciwgc3RydWN0IHJkdF9jdHJsX2RvbWFpbiAqZCwKPiAr
IHUzMiBjbG9zaWQsIGVudW0gcmVzY3RybF9jb25mX3R5cGUgdCwgdTMyIGNmZ192YWwpCj4gK3sK
PiArIHN0cnVjdCBjYnFyaV9jb250cm9sbGVyICpjdHJsOwo+ICsgc3RydWN0IGNicXJpX3Jlc2N0
cmxfZG9tICpkb207Cj4gKyBzdHJ1Y3QgY2JxcmlfY29uZmlnIGNmZzsKPiArIGludCBlcnIgPSAw
Owo+ICsKPiArIGRvbSA9IGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgY2JxcmlfcmVzY3RybF9kb20s
IHJlc2N0cmxfY3RybF9kb20pOwo+ICsgY3RybCA9IGRvbS0+aHdfY3RybDsKPiArCj4gKyBpZiAo
IXItPmFsbG9jX2NhcGFibGUpCj4gKyByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyBzd2l0Y2ggKHIt
PnJpZCkgewo+ICsgY2FzZSBSRFRfUkVTT1VSQ0VfTDI6Cj4gKyBjYXNlIFJEVF9SRVNPVVJDRV9M
MzoKPiArIGNmZy5jYm0gPSBjZmdfdmFsOwo+ICsgZXJyID0gY2JxcmlfYXBwbHlfY2FjaGVfY29u
ZmlnKGRvbSwgY2xvc2lkLCB0LCAmY2ZnKTsKPiArIGJyZWFrOwo+ICsgY2FzZSBSRFRfUkVTT1VS
Q0VfTUJBOgo+ICsgLyogY292ZXJ0IGZyb20gcGVyY2VudGFnZSB0byBiYW5kd2lkdGggYmxvY2tz
ICovCj4gKyBjZmcucmJ3YiA9IGNmZ192YWwgKiBjdHJsLT5iYy5uYndibGtzIC8gMTAwOwoKU2hv
dWxkIHVzZSBiYy5tcmJ3YiB0byBjYWxjdWxhdGUgcmJ3Yj8KSSB0aGluayBiYy5uYndibGtzIHJl
cHJlc2VudCB0aGUgYXZhaWxhYmxlIGJ3IGJsa3MgaW4gdGhlIGNvbnRyb2xsZXIuIEl0IHNob3Vs
ZCBzaG91bGQgZGVjcmVhc2UgYXMgdGhleSBhcmUgYWxsb2NhdGVkLgoKPiArIGVyciA9IGNicXJp
X2FwcGx5X2J3X2NvbmZpZyhkb20sIGNsb3NpZCwgdCwgJmNmZyk7Cj4gKyBicmVhazsKPiArIGRl
ZmF1bHQ6Cj4gKyByZXR1cm4gLUVJTlZBTDsKPiArIH0KPiArCj4gKyByZXR1cm4gZXJyOwo+ICt9
Cj4KPiAuLi4KPgo+ICt1MzIgcmVzY3RybF9hcmNoX2dldF9jb25maWcoc3RydWN0IHJkdF9yZXNv
dXJjZSAqciwgc3RydWN0IHJkdF9jdHJsX2RvbWFpbiAqZCwKPiArIHUzMiBjbG9zaWQsIGVudW0g
cmVzY3RybF9jb25mX3R5cGUgdHlwZSkKPiArewo+ICsgc3RydWN0IGNicXJpX3Jlc2N0cmxfZG9t
ICpod19kb207Cj4gKyBzdHJ1Y3QgY2JxcmlfY29udHJvbGxlciAqY3RybDsKPiArIGludCByZWdf
b2Zmc2V0Owo+ICsgdTMyIHBlcmNlbnQ7Cj4gKyB1MzIgcmJ3YjsKPiArIHU2NCByZWc7Cj4gKyBp
bnQgZXJyOwo+ICsKPiArIGh3X2RvbSA9IGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgY2JxcmlfcmVz
Y3RybF9kb20sIHJlc2N0cmxfY3RybF9kb20pOwo+ICsKPiArIGN0cmwgPSBod19kb20tPmh3X2N0
cmw7Cj4gKwo+ICsgaWYgKCFyLT5hbGxvY19jYXBhYmxlKQo+ICsgcmV0dXJuIHJlc2N0cmxfZ2V0
X2RlZmF1bHRfY3RybChyKTsKPiArCj4gKyBzd2l0Y2ggKHItPnJpZCkgewo+ICsgY2FzZSBSRFRf
UkVTT1VSQ0VfTDI6Cj4gKyBjYXNlIFJEVF9SRVNPVVJDRV9MMzoKPiArIC8qIENsZWFyIGNjX2Js
b2NrX21hc2sgYmVmb3JlIHJlYWQgbGltaXQgb3BlcmF0aW9uICovCj4gKyBjYnFyaV9zZXRfY2Jt
KGN0cmwsIDApOwo+ICsKPiArIC8qIENhcGFjaXR5IHJlYWQgbGltaXQgb3BlcmF0aW9uIGZvciBS
Q0lEIChjbG9zaWQpICovCj4gKyBlcnIgPSBjYnFyaV9jY19hbGxvY19vcChjdHJsLCBDQlFSSV9D
Q19BTExPQ19DVExfT1BfUkVBRF9MSU1JVCwgdHlwZSwgY2xvc2lkKTsKPiArIGlmIChlcnIgPCAw
KSB7Cj4gKyBwcl9lcnIoIiVzKCk6IG9wZXJhdGlvbiBmYWlsZWQ6IGVyciA9ICVkIiwgX19mdW5j
X18sIGVycik7Cj4gKyByZXR1cm4gcmVzY3RybF9nZXRfZGVmYXVsdF9jdHJsKHIpOwo+ICsgfQo+
ICsKPiArIC8qIFJlYWQgY2FwYWNpdHkgYmxvY2sgbWFzayBmb3IgUkNJRCAoY2xvc2lkKSAqLwo+
ICsgcmVnX29mZnNldCA9IENCUVJJX0NDX0JMT0NLX01BU0tfT0ZGOwo+ICsgcmVnID0gaW9yZWFk
NjQoY3RybC0+YmFzZSArIHJlZ19vZmZzZXQpOwo+ICsKPiArIC8qIFVwZGF0ZSB0aGUgY29uZmln
IHZhbHVlIGZvciB0aGUgY2xvc2lkIGluIHRoaXMgZG9tYWluICovCj4gKyBod19kb20tPmN0cmxf
dmFsW2Nsb3NpZF0gPSByZWc7Cj4gKyByZXR1cm4gaHdfZG9tLT5jdHJsX3ZhbFtjbG9zaWRdOwo+
ICsKPiArIGNhc2UgUkRUX1JFU09VUkNFX01CQToKPiArIC8qIENhcGFjaXR5IHJlYWQgbGltaXQg
b3BlcmF0aW9uIGZvciBSQ0lEIChjbG9zaWQpICovCj4gKyBlcnIgPSBjYnFyaV9iY19hbGxvY19v
cChjdHJsLCBDQlFSSV9DQ19BTExPQ19DVExfT1BfUkVBRF9MSU1JVCwgY2xvc2lkKTsKPiArIGlm
IChlcnIgPCAwKSB7Cj4gKyBwcl9lcnIoIiVzKCk6IG9wZXJhdGlvbiBmYWlsZWQ6IGVyciA9ICVk
IiwgX19mdW5jX18sIGVycik7Cj4gKyByZXR1cm4gcmVzY3RybF9nZXRfZGVmYXVsdF9jdHJsKHIp
Owo+ICsgfQo+ICsKPiArIGh3X2RvbS0+Y3RybF92YWxbY2xvc2lkXSA9IGNicXJpX2dldF9yYndi
KGN0cmwpOwo+ICsKPiArIC8qIENvbnZlcnQgZnJvbSBiYW5kd2lkdGggYmxvY2tzIHRvIHBlcmNl
bnQgKi8KPiArIHJid2IgPSBod19kb20tPmN0cmxfdmFsW2Nsb3NpZF07Cj4gKyByYndiICo9IDEw
MDsKPiArIHBlcmNlbnQgPSByYndiIC8gY3RybC0+YmMubmJ3YmxrczsKPiArIGlmIChyYndiICUg
Y3RybC0+YmMubmJ3YmxrcykKClNhbWUgUXVlc3Rpb24uCgo+ICsgcGVyY2VudCsrOwo+ICsgcmV0
dXJuIHBlcmNlbnQ7Cj4gKwo+ICsgZGVmYXVsdDoKPiArIHJldHVybiByZXNjdHJsX2dldF9kZWZh
dWx0X2N0cmwocik7Cj4gKyB9Cj4gK30KClNvcnJ5IGZvciBteSBwcmV2aW91cyByZXBseSBvbiBv
bGQgcGF0Y2guIFBsZWFzZSBpZ25vcmUgaXQuIEnigJltIHJlLXNlbmRpbmcgdGhpcyBjb21tZW50
IG9uIHYyLgoKVGhhbmssCldlbmppYQoKCgoKCumDreaWh+S9szEwMTU4OTcxCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
