Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEB4FF5126
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 17:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oH/wkKgtGq9tpE5gCS8Y8XYxxUmi4d55/Ve7zzc0SM8=; b=C9zofYoiwMih46
	/UV02szx+5yrHIUHA5298ceJ7wZvsy1whwNFzLbk6ImF6pcCSox1bvIpL+OQukOU/U2xYFAhcxRy5
	V24VPlCAIS0OOBgnRj4kxPJuRCzkdvnzdiagoQqcqE/Uat54sQL9JTJcPC7t2PGXSQFxljEmxIuq8
	QfZC+EB4ViJvCHqi+z/AxRhuPyaoOtg+yhqIIGgZIT7UYgym2AFbsjcZRjdOGfGQsSDgPrUbiSZpr
	37p/pDPZD7BjkjmrRPKeAlr42sFyy9VAC9AyHWrr6G/LLwEILBp+10Uuz7S4UR+6AKgdSMvjSNB9P
	yGPDb/DfFD8IGgKBjsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAA4F-00000006qg6-0Goq;
	Tue, 07 Apr 2026 17:18:23 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UKX-0000000CZVA-1ydl
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 08:20:12 +0000
Received: from mse-db.zte.com.cn (unknown [10.5.228.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4flLdX5pdsz8Xs79;
	Tue, 31 Mar 2026 16:20:00 +0800 (CST)
Received: (from root@localhost)
	by mse-db.zte.com.cn id 62V8JvQH035753;
	Tue, 31 Mar 2026 16:19:57 +0800 (+08)
	(envelope-from guo.wenjia23@zte.com.cn)
Message-Id: <202603310819.62V8JvQH035753@mse-db.zte.com.cn>
Received: from njb2app07.zte.com.cn ([10.55.22.95])
	by mse-fl2.zte.com.cn with SMTP id 62V8Ema8051473;
	Tue, 31 Mar 2026 16:14:48 +0800 (+08)
	(envelope-from guo.wenjia23@zte.com.cn)
Received: from mapi (njb2app05[null])
	by mapi (Zmail) with MAPI id mid202;
	Tue, 31 Mar 2026 16:14:50 +0800 (CST)
X-Zmail-TransId: 2afd69cb827ad7e-fe1e5
X-Mailer: Zmail v1.0
In-Reply-To: <actiYi6ACcOrvz9J@gen8>
References: 20260119-ssqosid-cbqri-v1-8-aa2a75153832@kernel.org,202603261113.62QBDn8T007047@mse-db.zte.com.cn,actiYi6ACcOrvz9J@gen8
Date: Tue, 31 Mar 2026 16:14:50 +0800 (CST)
Mime-Version: 1.0
From: <guo.wenjia23@zte.com.cn>
To: <fustini@kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBSRkMgMDgvMTldIFJJU0MtVjogUW9TOiBhZGQgcmVzY3RybCBpbnRlcmZhY2UgZm9yIENCUVJJIGNvbnRyb2xsZXJz?=
X-MAIL: mse-db.zte.com.cn 62V8JvQH035753
X-MSS: AUDITRELEASE@mse-db.zte.com.cn
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: guo.wenjia23@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.131 unknown Tue, 31 Mar 2026 16:20:00 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69CB83B0.002/4flLdX5pdsz8Xs79
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_012009_827114_49C015CD 
X-CRM114-Status: GOOD (  19.26  )
X-Mailman-Approved-At: Tue, 07 Apr 2026 10:18:21 -0700
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

SGkgRHJldywKCj4gT24gVGh1LCBNYXIgMjYsIDIwMjYgYXQgMDc6MDU6NDhQTSArMDgwMCwgZ3Vv
LndlbmppYTIzQHp0ZS5jb20uY24gd3JvdGU6Cj4gPiBIaSBEcmV3LAo+ID4gCj4gPiBPbiBUaHUs
IEphbiAyOSwgMjAyNiBhdCA0OjI44oCvQU0gRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5v
cmc+IHdyb3RlOj4KPiA+ID4gQWRkIGludGVyZmFjZSBmb3IgQ0JRUkkgY29udHJvbGxlciBkcml2
ZXJzIHRvIG1ha2UgdXNlIG9mIHRoZSByZXNjdHJsCj4gPiA+IGZpbGVzeXN0ZW0uCj4gPiA+Cj4g
PiA+IENvLWRldmVsb3BlZC1ieTogQWRyaWVuIFJpY2NpYXJkaSA8YXJpY2NpYXJkaUBiYXlsaWJy
ZS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmllbiBSaWNjaWFyZGkgPGFyaWNjaWFyZGlA
YmF5bGlicmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlA
a2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9xb3MvcW9zX3Jl
c2N0cmwuYyB8IDExOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxMTkyIGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gLi4uCj4gPiA+
Cj4gPiA+ICsKPiA+ID4gK2ludCByZXNjdHJsX2FyY2hfdXBkYXRlX29uZShzdHJ1Y3QgcmR0X3Jl
c291cmNlICpyLCBzdHJ1Y3QgcmR0X2N0cmxfZG9tYWluICpkLAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdTMyIGNsb3NpZCwgZW51bSByZXNjdHJsX2NvbmZfdHlwZSB0LCB1MzIg
Y2ZnX3ZhbCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgICBzdHJ1Y3QgY2JxcmlfY29udHJvbGxlciAq
Y3RybDsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgY2JxcmlfcmVzY3RybF9kb20gKmRvbTsKPiA+ID4g
KyAgICAgICBzdHJ1Y3QgY2JxcmlfY29uZmlnIGNmZzsKPiA+ID4gKyAgICAgICBpbnQgZXJyID0g
MDsKPiA+ID4gKwo+ID4gPiArICAgICAgIGRvbSA9IGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgY2Jx
cmlfcmVzY3RybF9kb20sIHJlc2N0cmxfY3RybF9kb20pOwo+ID4gPiArICAgICAgIGN0cmwgPSBk
b20tPmh3X2N0cmw7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoIXItPmFsbG9jX2NhcGFibGUp
Cj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gKwo+ID4gPiArICAg
ICAgIHN3aXRjaCAoci0+cmlkKSB7Cj4gPiA+ICsgICAgICAgY2FzZSBSRFRfUkVTT1VSQ0VfTDI6
Cj4gPiA+ICsgICAgICAgY2FzZSBSRFRfUkVTT1VSQ0VfTDM6Cj4gPiA+ICsgICAgICAgICAgICAg
ICBjZmcuY2JtID0gY2ZnX3ZhbDsKPiA+ID4gKyAgICAgICAgICAgICAgIGVyciA9IGNicXJpX2Fw
cGx5X2NhY2hlX2NvbmZpZyhkb20sIGNsb3NpZCwgdCwgJmNmZyk7Cj4gPiA+ICsgICAgICAgICAg
ICAgICBicmVhazsKPiA+ID4gKyAgICAgICBjYXNlIFJEVF9SRVNPVVJDRV9NQkE6Cj4gPiA+ICsg
ICAgICAgICAgICAgICAvKiBjb3ZlcnQgZnJvbSBwZXJjZW50YWdlIHRvIGJhbmR3aWR0aCBibG9j
a3MgKi8KPiA+ID4gKyAgICAgICAgICAgICAgIGNmZy5yYndiID0gY2ZnX3ZhbCAqIGN0cmwtPmJj
Lm5id2Jsa3MgLyAxMDA7Cj4gPiAKPiA+IFNob3VsZCB1c2UgYmMubXJid2IgdG8gY2FsY3VsYXRl
IHJid2I/IAo+ID4gSSB0aGluayBiYy5uYndibGtzIHJlcHJlc2VudCB0aGUgYXZhaWxhYmxlIGJ3
IGJsa3MgaW4gdGhlIGNvbnRyb2xsZXIuCj4gSXQgc2hvdWxkIHNob3VsZCBkZWNyZWFzZSBhcyB0
aGV5IGFyZSBhbGxvY2F0ZWQuCj4gCj4gVGhlIHJlc2N0cmwgTUJBIHJlc291cmNlIGlzIHN1cHBv
c2VkIHRvIGJlIHRoZSBwZXJjZW50YWdlIG9mIHRvdGFsCj4gbWVtb3J5IGJhbmR3aWR0aC4gbmJ3
YmxrcyBpcyB0aGUgdG90YWwgbnVtYmVyIG9mIGJhbmR3aWR0aCBibG9ja3MsIHNvIEkKPiB0aGlu
ayB0aGUgZXhpc3RpbmcgY2FsdWNhdGlvbiBpcyBjb3JyZWN0Lgo+IAo+IEZyb20gdGhlIGV4YW1w
bGUgU29DIGNvbmZpZ3VyYXRpb24sIHRoZSBudW1iZXIgb2YgYmFuZHdpZHRoIGJsb2NrcyBpcwo+
IDEwMjQsIGFuZCBtcmJ3YiBpcyBtZWFudCB0byBiZSA4MCUgb2YgbmJ3YmxrcyB3aGljaCBpcyA4
MTkuCj4gCj4gU2V0dGluZyBNQiB0byA4MCUgaW4gc2NoZW1hdGEgd291bGQgeWllbGQ6IDgwICog
MTAyNCAvIDEwMCA9IDgxOQo+IAoKQWNjb3JkaW5nIHRvIHRoZSBzcGVjaWZpY2F0aW9uCjEuIFRo
ZSBNUkJXQiBmaWVsZCByZXBvcnRzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBiYW5kd2lkdGggYmxv
Y2tzIHRoYXQgY2FuIGJlIHJlc2VydmVkLgoyLiBUaGUgc3VtIG9mIFJid2IgYWxsb2NhdGVkIGFj
cm9zcyBhbGwgcmNpZHMgbXVzdCBub3QgZXhjZWVkIE1SQldCIHZhbHVlLgoKQmFzZWQgb24gdGhl
IHNwZWNpZmljYXRpb24gYW5kIHRoZSBleGFtcGxlIHlvdSBtZW50aW9uZWQsIGNhbiB0aGlzIGJl
IHVuZGVyc3Rvb2QgYXMgZm9sbG93czoKCk1SQldCIGlzIGEgZml4ZWQgdmFsdWUgZGV0ZXJtaW5l
ZCBieSB0aGUgU29DIGNvbmZpZ3VyYXRpb24sIHJlcHJlc2VudGluZyB0aGUgZWZmZWN0aXZlIGJh
bmR3aWR0aCBjYXBhY2l0eSBvZiB0aGUgYmFuZHdpZHRoIGNvbnRyb2xsZXIuIApBbmQgdGhlIE1S
QldCIHZhbHVlIGl0c2VsZiBzaG91bGQgcmVtYWluIGNvbnN0YW50IGFuZCBtdXN0IG5vdCB2YXJ5
IGFmdGVyIHRoZSBiYW5kd2lkdGggYWxsb2NhdGlvbnMgYXNzaWduZWQgdG8gUkNJRHMuCgoKVGhh
bmtzLApXZW5qaWEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
