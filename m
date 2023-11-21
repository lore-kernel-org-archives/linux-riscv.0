Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81955C61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 16:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OJHuGc8XXCJauerZo5sg7pcZF/6BpI9lvHu/69EPB8o=; b=rp257o01Fes9b3
	TjEfc9AZrww9E3u3g0nY4cMfVkjCKrXpqhuhzqBQ8hFwM96BQW4kU1juDEjwUSlTOM1jJspyuTSgh
	EwNMsPlHl7ugIDQO65lhRjMmDfMiMG+TcHhyF6W+yEz1lNgCenSeifS/ZYBB1TKXH8WaGNHEQFWfZ
	GKJU5uWBnhuBRJ9YPSI79atT+Zyj6nl6aQSEHJuSjxUDVqysG4/0brzPRdlIMsL5paYE16kYvjomX
	YlyKmnMhBmop01AZT+TE7zqTcsYlWPVzJiuNIlf0Yc2UWOTg3f+Mk63nXyplr7GN9dvm7qlVTDNs0
	WhkRDwdwsNx9mDoZvV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5U2z-00HL1r-0j;
	Tue, 21 Nov 2023 16:56:25 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5U2v-00HKzw-29
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 16:56:24 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E75F224DCA6;
	Wed, 22 Nov 2023 00:55:35 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Nov
 2023 00:55:36 +0800
Received: from localhost.localdomain (202.188.176.82) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 22 Nov
 2023 00:55:30 +0800
From: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
To: <irogers@google.com>
CC: <acme@kernel.org>, <adrian.hunter@intel.com>,
	<alexander.shishkin@linux.intel.com>, <aou@eecs.berkeley.edu>,
	<jisheng.teoh@starfivetech.com>, <jolsa@kernel.org>,
	<leyfoon.tan@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<mark.rutland@arm.com>, <mingo@redhat.com>, <n.shubin@yadro.com>,
	<namhyung@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<peterz@infradead.org>
Subject: Re: [PATCH v3] perf vendor events riscv: add StarFive Dubhe-90 JSON file
Date: Wed, 22 Nov 2023 00:53:39 +0800
Message-ID: <20231121165339.2177083-1-jisheng.teoh@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAP-5=fVgD7sc1uP5G-Q_bo8bf82rncFt=LLTA725csAT7g63rA@mail.gmail.com>
References: <CAP-5=fVgD7sc1uP5G-Q_bo8bf82rncFt=LLTA725csAT7g63rA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_085622_005526_7F4165A5 
X-CRM114-Status: GOOD (  21.73  )
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

T24gVHVlLCAyMSBOb3YgMjAyMyAwNzoyNToyMSAtMDgwMApJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+IHdyb3RlOgoKPiBPbiBXZWQsIE5vdiA4LCAyMDIzIGF0IDExOjUx4oCvUE0gSmkg
U2hlbmcgVGVvaAo+IDxqaXNoZW5nLnRlb2hAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gU3RhckZpdmUncyBEdWJoZS05MCBzdXBwb3J0cyByYXcgZXZlbnQgaWQgMHgwMCAtIDB4MjIu
Cj4gPiBUaGUgcmF3IGV2ZW50cyBhcmUgZW5hYmxlZCB0aHJvdWdoIFBNVSBub2RlIG9mIERUIGJp
bmRpbmcuCj4gPiBCZXNpZGVzIHJhdyBldmVudCwgYWRkIHN0YW5kYXJkIFJJU0MtViBmaXJtd2Fy
ZSBldmVudHMgdG8KPiA+IHN1cHBvcnQgbW9uaXRvcmluZyBvZiBmaXJtd2FyZSBldmVudC4KPiA+
Cj4gPiBFeGFtcGxlIG9mIFBNVSBEVCBub2RlOgo+ID4gcG11IHsKPiA+ICAgICAgICAgY29tcGF0
aWJsZSA9ICJyaXNjdixwbXUiOwo+ID4gICAgICAgICByaXNjdixyYXctZXZlbnQtdG8tbWhwbWNv
dW50ZXJzID0KPiA+ICAgICAgICAgICAgICAgICAvKiBFdmVudCBJRCAxLTMxICovCj4gPiAgICAg
ICAgICAgICAgICAgPDB4MDAgMHgwMCAweEZGRkZGRkZGIDB4RkZGRkZGRTAgMHgwMDAwN0ZGOD4s
Cj4gPiAgICAgICAgICAgICAgICAgLyogRXZlbnQgSUQgMzItMzMgKi8KPiA+ICAgICAgICAgICAg
ICAgICA8MHgwMCAweDIwIDB4RkZGRkZGRkYgMHhGRkZGRkZGRSAweDAwMDA3RkY4PiwKPiA+ICAg
ICAgICAgICAgICAgICAvKiBFdmVudCBJRCAzNCAqLwo+ID4gICAgICAgICAgICAgICAgIDwweDAw
IDB4MjIgMHhGRkZGRkZGRiAweEZGRkZGRjIyIDB4MDAwMDdGRjg+Owo+ID4gfTsKPiA+Cj4gPiBQ
ZXJmIHN0YXQgb3V0cHV0Ogo+ID4gW3Jvb3RAdXNlcl0jIHBlcmYgc3RhdCAtYSBcCj4gPiAgICAg
ICAgIC1lIGFjY2Vzc19tbXVfc3RsYiBcCj4gPiAgICAgICAgIC1lIG1pc3NfbW11X3N0bGIgXAo+
ID4gICAgICAgICAtZSBhY2Nlc3NfbW11X3B0ZV9jIFwKPiA+ICAgICAgICAgLWUgcm9iX2ZsdXNo
IFwKPiA+ICAgICAgICAgLWUgYnRiX3ByZWRpY3Rpb25fbWlzcyBcCj4gPiAgICAgICAgIC1lIGl0
bGJfbWlzcyBcCj4gPiAgICAgICAgIC1lIHN5bmNfZGVsX2ZldGNoX2cgXAo+ID4gICAgICAgICAt
ZSBpY2FjaGVfbWlzcyBcCj4gPiAgICAgICAgIC1lIGJwdV9icl9yZXRpcmUgXAo+ID4gICAgICAg
ICAtZSBicHVfYnJfbWlzcyBcCj4gPiAgICAgICAgIC1lIHJldF9pbnNfcmV0aXJlIFwKPiA+ICAg
ICAgICAgLWUgcmV0X2luc19taXNzIFwKPiA+ICAgICAgICAgLS0gb3BlbnNzbCBzcGVlZCByc2Ey
MDQ4Cj4gPiBEb2luZyAyMDQ4IGJpdHMgcHJpdmF0ZSByc2EncyBmb3IgMTBzOiAzOSAyMDQ4IGJp
dHMgcHJpdmF0ZSBSU0EncyBpbgo+ID4gMTAuMDNzCj4gPiBEb2luZyAyMDQ4IGJpdHMgcHVibGlj
IHJzYSdzIGZvciAxMHM6IDE0NjkgMjA0OCBiaXRzIHB1YmxpYyBSU0EncyBpbgo+ID4gOS40N3MK
PiA+IHZlcnNpb246IDMuMC4xMAo+ID4gYnVpbHQgb246IFR1ZSBBdWcgIDEgMTM6NDc6MjQgMjAy
MyBVVEMKPiA+IG9wdGlvbnM6IGJuKDY0LDY0KQo+ID4gQ1BVSU5GTzogTi9BCj4gPiAgICAgICAg
ICAgICAgICAgICBzaWduICAgIHZlcmlmeSAgICBzaWduL3MgdmVyaWZ5L3MKPiA+IHJzYSAyMDQ4
IGJpdHMgMC4yNTcxNzlzIDAuMDA2NDQ3cyAgICAgIDMuOSAgICAxNTUuMQo+ID4KPiA+ICBQZXJm
b3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAnc3lzdGVtIHdpZGUnOgo+ID4KPiA+ICAgICAgICAg
ICAgMzExMjg4MiAgICAgIGFjY2Vzc19tbXVfc3RsYgo+ID4gICAgICAgICAgICAgIDEwNTUwICAg
ICAgbWlzc19tbXVfc3RsYgo+ID4gICAgICAgICAgICAgIDE4MjUxICAgICAgYWNjZXNzX21tdV9w
dGVfYwo+ID4gICAgICAgICAgICAgMjc0NzY1ICAgICAgcm9iX2ZsdXNoCj4gPiAgICAgICAgICAg
MjI0NzA1NjAgICAgICBidGJfcHJlZGljdGlvbl9taXNzCj4gPiAgICAgICAgICAgIDMwMzU4Mzkg
ICAgICBpdGxiX21pc3MKPiA+ICAgICAgICAgIDY0MzU0OTA2MCAgICAgIHN5bmNfZGVsX2ZldGNo
X2cKPiA+ICAgICAgICAgICAgIDEzMzAxMyAgICAgIGljYWNoZV9taXNzCj4gPiAgICAgICAgICAg
NjI5ODI3OTYgICAgICBicHVfYnJfcmV0aXJlCj4gPiAgICAgICAgICAgICAyODc1NDggICAgICBi
cHVfYnJfbWlzcwo+ID4gICAgICAgICAgICA4OTM1OTEwICAgICAgcmV0X2luc19yZXRpcmUKPiA+
ICAgICAgICAgICAgICAgODMwOCAgICAgIHJldF9pbnNfbWlzcwo+ID4KPiA+ICAgICAgIDIwLjY1
NjE4MjYwMCBzZWNvbmRzIHRpbWUgZWxhcHNlZAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEppIFNo
ZW5nIFRlb2ggPGppc2hlbmcudGVvaEBzdGFyZml2ZXRlY2guY29tPgo+ID4gUmV2aWV3ZWQtYnk6
IExleSBGb29uIFRhbiA8bGV5Zm9vbi50YW5Ac3RhcmZpdmV0ZWNoLmNvbT4KPiA+IC0tLQo+ID4g
Q2hhbmdlbG9nOgo+ID4gdjIgLT4gdjM6Cj4gPiAtIEFkZCBzdGFuZGFyZCBSSVNDLVYgZmlybXdh
cmUgZXZlbnQKPiA+IC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlIHRvIHJlZmxlY3QgYWRkaXRpb24g
b2Ygc3RhbmRhcmQKPiA+ICAgUklTQy1WIGZpcm13YXJlIGV2ZW50Lgo+ID4gdjEgLT4gdjI6Cj4g
PiAtIFJlbmFtZSAnU3RhcmZpdmUgRHViaGUnIHRvICdTdGFyRml2ZSBEdWJoZS05MCcgaW4gY29t
bWl0IG1lc3NhZ2UuCj4gPiAtIFJlbmFtZSAnc3RhcmZpdmUvZHViaGUnIHBtdS1ldmVudHMgZm9s
ZGVyIHRvICdzdGFyZml2ZS9kdWJoZS05MCcKPiA+IC0gVXBkYXRlIE1BUkNISUQgdG8gMHg4MDAw
MDAwMGRiMDAwMDkwIGluIG1hcGZpbGUuY3N2Cj4gPiAtLS0KPiA+ICB0b29scy9wZXJmL3BtdS1l
dmVudHMvYXJjaC9yaXNjdi9tYXBmaWxlLmNzdiAgfCAgIDEgKwo+ID4gIC4uLi9hcmNoL3Jpc2N2
L3N0YXJmaXZlL2R1YmhlLTkwL2NvbW1vbi5qc29uICB8IDE3Mgo+ID4gKysrKysrKysrKysrKysr
KysrIC4uLi9yaXNjdi9zdGFyZml2ZS9kdWJoZS05MC9maXJtd2FyZS5qc29uICAgICB8Cj4gPiA2
OCArKysrKysrIDMgZmlsZXMgY2hhbmdlZCwgMjQxIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQKPiA+IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3N0YXJmaXZl
L2R1YmhlLTkwL2NvbW1vbi5qc29uCj4gPiBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+IHRvb2xzL3Bl
cmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3N0YXJmaXZlL2R1YmhlLTkwL2Zpcm13YXJlLmpzb24K
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFw
ZmlsZS5jc3YKPiA+IGIvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5j
c3YgaW5kZXgKPiA+IGM2MWIzZDZlZjYxNi4uNWI3NWVjZmUyMDZkIDEwMDY0NCAtLS0KPiA+IGEv
dG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YgKysrCj4gPiBiL3Rv
b2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L21hcGZpbGUuY3N2IEBAIC0xNSwzICsxNSw0
IEBACj4gPiAgIwo+ID4gICNNVkVORE9SSUQtTUFSQ0hJRC1NSU1QSUQsVmVyc2lvbixGaWxlbmFt
ZSxFdmVudFR5cGUKPiA+ICAweDQ4OS0weDgwMDAwMDAwMDAwMDAwMDctMHhbWzp4ZGlnaXQ6XV0r
LHYxLHNpZml2ZS91NzQsY29yZQo+ID4gKzB4NjdlLTB4ODAwMDAwMDBkYjAwMDA5MC0weFtbOnhk
aWdpdDpdXSssdjEsc3RhcmZpdmUvZHViaGUtOTAsY29yZQo+ID4gIAo+IAo+IEkndmUgbm8gcHJv
YmxlbSB3aXRoIHRoaXMgYXBwcm9hY2gsIGJ1dCBkdWJoZS05MCdzIGpzb24gZmlsZXMgbWF0Y2gK
PiBkdWJoZS04MHMuIFRob3NlIGZpbGVzIGFyZSBhdmFpbGFibGUgaW4gcGVyZi10b29scy1uZXh0
Ogo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYv
cGVyZi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2
L3N0YXJmaXZlL2R1YmhlLTgwP2g9cGVyZi10b29scy1uZXh0Cj4gSXQgY291bGQgYmUgdXNlZnVs
IHRvIHJlYmFzZSB0aGUgcGF0Y2ggb24gdGhhdCBicmFuY2ggdG8gbWFrZSBpdAo+IGVhc2llciB0
byBtZXJnZS4gQXMgdGhlIGZpbGVzIG1hdGNoIHlvdSBjb3VsZCBtYWtlIHRoZSByZWd1bGFyCj4g
ZXhwcmVzc2lvbiBmb3IgZHViaGUtODAgbWF0Y2ggYm90aCBvZiB0aGVtIGxpa2U6Cj4gCj4gMHg2
N2UtMHg4MDAwMDAwMGRiMDAwMFs4OV0wLTB4W1s6eGRpZ2l0Ol1dKyx2MSxzdGFyZml2ZS9kdWJo
ZS04MCxjb3JlCj4gCj4gVGhhbmtzLAo+IElhbgoKVGhhbmtzIElhbi4gVGhlIHN1Z2dlc3Rpb24g
bWFrZXMgc2Vuc2UsIHdpbGwgdGFrZSBpdCBpbiBhbmQgcmViYXNlIGluCnY0LgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
