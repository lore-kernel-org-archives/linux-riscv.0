Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52580D39410
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+olXFpTxqDygnAlVK1lfJmopu4AYYAiXhrKFatMXiOc=; b=pNiqz2bhKKR+D8
	Q22faxO30BpLutFBK3zR4Td2cuMC8xzZFb0QfmrYPdZIGPmChUqBOqT3hpXFqDJniZtcp2QonNza8
	5Zx8ANzAj3eeXgzWdxES4LGqhk4jPaQ3USRcIkm5L75a7b6b36rREpUiXKGUHRtHe/yi//89N4S8q
	0Ldp20LFKJmCs0CIOq3F5bgCX9wMrwCJdJEsriyGA/Wwj6L4FnPH2/cbo07eP87QAOOE0IyUMTWJV
	I2mwcn0fyPwJioD9hZAk3/aWKNuTcaRMc564povdZAP/jMtnUO5CgHG+t6nL2/qbz0l2BIXzZE/fL
	zor6Iju2QMZhA7RUq2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8G8O-0000000HV7m-25kT;
	Thu, 02 Apr 2026 11:22:48 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8G8L-0000000HV5p-1yYY
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 11:22:47 +0000
X-QQ-mid: esmtpgz11t1775128897tbf21170d
X-QQ-Originating-IP: kxlUxpWpaYTKTqzcSIXGMtW5WoW7m1TS67JGq45OFYc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 02 Apr 2026 19:21:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4623887784994959119
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Mime-Version: 1.0
Date: Thu, 02 Apr 2026 19:21:34 +0800
Message-Id: <DHIMOCFZSFXX.2XZEQBRXLISKN@linux.dev>
Cc: "Ulf Hansson" <ulf.hansson@linaro.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Adrian Hunter" <adrian.hunter@intel.com>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Javier Martinez Canillas"
 <javierm@redhat.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Anand Moon"
 <linux.amoon@gmail.com>, "Trevor Gamblin" <tgamblin@baylibre.com>
Subject: Re: [PATCH v5 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>, "Troy Mitchell"
 <troy.mitchell@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
 <20260330-orangepi-sd-card-uhs-v5-5-bd853604322d@gmail.com>
 <aco9oLumPh4OZtIo@kernel.org>
 <CABdCQ=MFcDPnzcYUEkbQyu_0qZt=aDD04p1kyxCMuVt7Av_P1Q@mail.gmail.com>
In-Reply-To: <CABdCQ=MFcDPnzcYUEkbQyu_0qZt=aDD04p1kyxCMuVt7Av_P1Q@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M+A7tMXGEwPSuXkIce/o+QKPNansc3JhWXzsUMoIhDgXQl3SK17gCqau
	pnpSt9lg4jJlQtkKtjVehs1IgjWZymBdu9gc5iaAe4b0D6XEEHV/01Wv8Ihje955Co/Dtxu
	UQu1QLsmCP7cdkg/Gu/z/xroTk2ZKKbKA+LZmbgtjcSYM5uNEtqwHhoNsjZr/43EjcbJqQV
	JMAB6A8/4CxHGKtekR2o68AGRBuIF8F6VP8Qd89v4pgrBVLh5Xi/4PJ68N/eoPoMtiXbVKH
	0NM5mu3R8Plcdl3FeEahz0LzYXRdt9RhbVWTlK1TTlVDfnBtYB2KyXgmUl+kmyijh+Fqri0
	gCKonIcu/TXS3HFmuohxXSsphcg0NP+/vtcp93fVfrI0rOJ7/0lgxdK854TdY4DdTyuvEQB
	8noyApRZfeaUZ6PXh20JFaeyn3O8PVKFvjjFd4EI6XBsxCfWN5mcaLIEsUCfk9cL8KTJFu7
	wAn72VX7uQkL3wMHFO468KeddkFRToLgAlNkiFw5/uSaO0P6GSAF7J+QjJjwtTnPa/JHFtT
	HDW9uKTk4XqWcfowQKelvLTrMA7bHoaWB3+doHRWT7BljxyCpSqsGoGg/cnNi2ejnmrsUMN
	DgC3/DUttJGpwgaEDuBJqK9rc30jZ0TzKnPwLFgmU2N4uEJERoyy/jHCEKRjzNG0+9iErnL
	KpvQTa0xxvnSszqDzm8dSnSKY9FPHaDDSOR5AEn7SOz7No9J7+XXA54zXMCfzGrypIfrPIv
	huIn4vr8wp77/IJJH8sGuEjsiXN/JOIuTJezIXVEzucnvYupfEcm3m30PhHja+/bFxwx9NR
	PaNggiK+0CURcPn4ulQWzKOWwxv4gdI3xMen5SxlE8D2o46IpNw9KKdB7lD1PQQqb9141LU
	VG/XlDOtrhh+ioPXPDPLjY1GkQIT4tD7wdDqT7bCNvSgnB+cRpuweJqdDhrLASLV1TsFPzl
	NayLtqDbv8I0vPIZOhPIW+3hAPfL2Y2tLXgFvd6xFn+oRRunTZ4pzQV0DHSgPfAz6/3tgPH
	vdvzJJDm9saTqoNfPEhKPr+CsK1DRajGjsojcfpGmbla5K/HDSKf8BlocsAEw=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_042245_886832_47A2FC9F 
X-CRM114-Status: GOOD (  19.54  )
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

T24gV2VkIEFwciAxLCAyMDI2IGF0IDQ6NTMgUE0gQ1NULCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4g
RWwgbHVuLCAzMCBtYXIgMjAyNiBhIGxhcyAxMTowOCwgVHJveSBNaXRjaGVsbAo+ICg8dHJveS5t
aXRjaGVsbEBsaW51eC5kZXY+KSBlc2NyaWJpw7M6Cj4+Cj4+IE9uIE1vbiwgTWFyIDMwLCAyMDI2
IGF0IDE2OjM4OjA2IENTVCwgSWtlciBQZWRyb3NhIHdyb3RlOgo+PiA+IEFkZCBTRCBjYXJkIGNv
bnRyb2xsZXIgaW5mcmFzdHJ1Y3R1cmUgZm9yIFNwYWNlbWlUIEsxIFNvQyB3aXRoIGNvbXBsZXRl
Cj4+ID4gcGluY3RybCBzdXBwb3J0IGZvciBib3RoIHN0YW5kYXJkIGFuZCBVSFMgbW9kZXMuCj4+
ID4KPj4gPiAtIEFkZCBzZGhjaTAgY29udHJvbGxlciBkZWZpbml0aW9uIHdpdGggY2xvY2tzLCBy
ZXNldHMgYW5kIGludGVycnVwdHMKPj4gPiAtIEFkZCBtbWMxX2NmZyBwaW5jdHJsIGZvciAzLjNW
IHN0YW5kYXJkIFNEIG9wZXJhdGlvbgo+PiA+IC0gQWRkIG1tYzFfdWhzX2NmZyBwaW5jdHJsIGZv
ciAxLjhWIFVIUyBoaWdoLXNwZWVkIG9wZXJhdGlvbgo+PiA+IC0gQ29uZmlndXJlIGFwcHJvcHJp
YXRlIGRyaXZlIHN0cmVuZ3RoIGFuZCBwb3dlci1zb3VyY2UgcHJvcGVydGllcwo+PiA+Cj4+ID4g
VGhpcyBwcm92aWRlcyBjb21wbGV0ZSBTRCBjYXJkIGluZnJhc3RydWN0dXJlIHRoYXQgSzEtYmFz
ZWQgYm9hcmRzIGNhbgo+PiA+IGVuYWJsZS4KPj4gPgo+PiA+IFRlc3RlZC1ieTogQW5hbmQgTW9v
biA8bGludXguYW1vb25AZ21haWwuY29tPgo+PiA+IFRlc3RlZC1ieTogVHJldm9yIEdhbWJsaW4g
PHRnYW1ibGluQGJheWxpYnJlLmNvbT4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBJa2VyIFBlZHJvc2Eg
PGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+Cj4+ID4gLS0tCj4+ID4gIGFyY2gvcmlzY3YvYm9vdC9k
dHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+PiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kgICAgICAgICB8
IDEzICsrKysrKysrKwo+PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykKPj4g
Pgo+PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0
cmwuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpCj4+
ID4gaW5kZXggYjEzZGNiMTBmNGQ2NjAyMmQyNzMwN2RlNzNhNmVhMzI4N2U5NzQ0MS4uOGQ4MjAx
MWYxYWY2NjZmYjc4YzI4MmEyYWJjYzBjYjg4Zjk2MjA1MyAxMDA2NDQKPj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaQo+PiA+ICsrKyBiL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpCj4+ID4gQEAgLTU3MCw0ICs1
NzAsNDQgQEAgcHdtMTQtMS1waW5zIHsKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgZHJpdmUt
c3RyZW5ndGggPSA8MzI+Owo+PiA+ICAgICAgICAgICAgICAgfTsKPj4gPiAgICAgICB9Owo+PiA+
ICsKPj4gPiArICAgICBtbWMxX2NmZzogbW1jMS1jZmcgewo+PiA+ICsgICAgICAgICAgICAgbW1j
MS1kYXRhLWNtZC1waW5zIHsKPj4gPiArICAgICAgICAgICAgICAgICAgICAgcGlubXV4ID0gPEsx
X1BBRENPTkYoMTA0LCAwKT4sICAgLyogbW1jMV9kMyAqLwo+PiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8SzFfUEFEQ09ORigxMDUsIDApPiwgICAvKiBtbWMxX2QyICovCj4+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxLMV9QQURDT05GKDEwNiwgMCk+LCAgIC8q
IG1tYzFfZDEgKi8KPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPEsxX1BBRENP
TkYoMTA3LCAwKT4sICAgLyogbW1jMV9kMCAqLwo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8SzFfUEFEQ09ORigxMDgsIDApPjsgICAvKiBtbWMxX2NtZCAqLwo+PiA+ICsgICAg
ICAgICAgICAgICAgICAgICBiaWFzLXB1bGwtdXAgPSA8MT47Cj4+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGRyaXZlLXN0cmVuZ3RoID0gPDc+Owo+PiBJJ20gYSBiaXQgY29uY2VybmVkIGFib3V0
IHRoaXMgdmFsdWUuIExvb2tpbmcgYXQgdGhlIGRvd25zdHJlYW0gNi42IGNvZGUsIDMuM1YgdXNl
cyBEUzQsCj4+IHdoaWNoIGVxdWFscyAxM21BLiBTaW5jZSA3bUEgbWFwcyB0byBEUzAsIHdoYXQn
cyB0aGUgcmVhc29uaW5nIGZvciB1c2luZyBpdCBoZXJlPwogICAgICAgICAgICAgICAgXl5eXiB3
cm9uZyBjdXJyZW50Cj4+IERvIHdlIGhhdmUgYW55IGRvY3VtZW50YXRpb24gb3IgbWVhc3VyZW1l
bnQgdG8gYmFjayB0aGlzIHVwPwo+Cj4gVGhhbmsgeW91IGZvciBjYXRjaGluZyB0aGlzISBZb3Un
cmUgYWJzb2x1dGVseSByaWdodCB0byBxdWVzdGlvbiB0aGVzZQo+IGRyaXZlIHN0cmVuZ3RoIHZh
bHVlcy4KPgo+IExvb2tpbmcgYmFjayBhdCBteSBkZXZlbG9wbWVudCBwcm9jZXNzLCBJIHJlbWVt
YmVyIGhpdHRpbmcgc2lnbmFsCj4gaW50ZWdyaXR5IGlzc3VlcyBpbiB0aGUgZWFybHkgc3RhZ2Vz
IG9mIHRoaXMgZHJpdmVyIGRldmVsb3BtZW50LiBBcyBhCj4gcXVpY2sgc29sdXRpb24sIEkgbG93
ZXJlZCB0aGUgZHJpdmUgc3RyZW5ndGggdmFsdWVzLCB3aGljaCBzZWVtZWQgdG8KPiByZXNvbHZl
IHRoZSBpbW1lZGlhdGUgcHJvYmxlbXMsIGFuZCBJIG1vdmVkIG9uIHdpdGhvdXQgcmV2aXNpdGlu
ZyB0aGUKPiBlbGVjdHJpY2FsIGNoYXJhY3RlcmlzdGljcy4KPgo+IEFmdGVyIHlvdXIgZmVlZGJh
Y2ssIEkgaW52ZXN0aWdhdGVkIHRoaXMgcHJvcGVybHkgYnkgY29tcGFyaW5nIHdpdGgKPiB0aGUg
dmVuZG9yIGtlcm5lbC4gSXQgdXNlczoKPiAtIDMuM1YgbW9kZTogUEFEXzNWX0RTNCAoMTltQSkK
PiAtIDEuOFYgVUhTIG1vZGU6IFBBRF8xVjhfRFMzICg0Mm1BKQo+Cj4gTXkgb3JpZ2luYWwgdmFs
dWVzIHdlcmUgaW5kZWVkIGJhY2t3YXJkcyBmcm9tIGJvdGggZWxlY3RyaWNhbCB0aGVvcnkKPiBh
bmQgcHJvdmVuIHZlbmRvciBpbXBsZW1lbnRhdGlvbi4gVGVzdGluZyB3aXRoIHRoZSBjb3JyZWN0
ZWQgdmFsdWVzCj4gKDE5bUEvNDJtQSkgY29uZmlybXMgU0QgY2FyZCBpcyB3b3JraW5nLgo+Cj4g
SSdsbCBzZW5kIHY2IHdpdGggdGhlIGNvcnJlY3RlZCBkcml2ZSBzdHJlbmd0aCB2YWx1ZXM6IGRy
aXZlLXN0cmVuZ3RoCj4gPSA8MTk+IGZvciAzLjNWIGFuZCBkcml2ZS1zdHJlbmd0aCA9IDw0Mj4g
Zm9yIDEuOFYgVUhTIG1vZGVzLgpZZXMsIDE5bUEgZm9yIDMuM1YgYW5kIDQybUEgZm9yIDEuOFYg
YXJlIGNvcnJlY3QuCkkgcmVhbGl6ZWQgSSBjaXRlZCBhbiBpbmNvcnJlY3QgdmFsdWUgaW4gbXkg
cHJldmlvdXMgbWVzc2FnZSAodGhlIDEzbUEpLgpQbGVhc2UgQ0MgbWUgd2hlbiB5b3Ugc2VuZCB2
Ni4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
