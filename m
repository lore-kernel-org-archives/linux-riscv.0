Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569C2C46CA0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnkVPcYhZ9xQlBmrttKKsM8gsgr3NsEbH5TvzgDR29E=; b=vlqDlfBW0ZHUok
	EHNRf+cK9VKwTE0mfuMh60a6sMqs3RmltlORaZPVdlR81Q+CUCE+uO9nG5YDymN1CY4ucAG3alfWh
	ORQ6PEAjXBGCDiQZZbikSrRjk1fHuG+8qtZY2aTjtJlFc8TYIsJsrTHxgOuOv665sxVOQicS9/2wo
	zRAQqDxFUL/UezSCDE1nWr4Ee6hJxXdfq8wSldF/5IX3WdjDict5nBPsn1hPXqsIYAV3wCvEJ1LYb
	hCwKoZ2I9NLkDTeztsJfeCKnZmXsDj50ZP00xRqTo4nFzMh1fFcKiPH+OWD83JWnJRpuFDHOoLVB0
	2/rroVgUDvjA+KLwsWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NGb-008raa-1n;
	Wed, 29 Nov 2023 16:18:25 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NEJ-008qMO-2H
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 16:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9nN6oik6II8sOQ1UNPbsvRq7CVPCG/jUOq68+fl6qwM=; b=V8YbwTrXLLXE+TGQ0d0I8cNmMt
	AaCeij18XBV3+sVLGacs0vxyfJnG5e17jBufvLrO93KC2Qx9SY4ijOTl2K4BAECoUBh0qKwz0MtZY
	ZkzeKo3mjzP22OV9UPX36IZRsWOQ64sg/fP371OBe6mT6oPFvr901y59c3HAMdw2vG0Y7OFZpcBsl
	e7cld42tos2Mp2N2+tDHZuNB/BbzbL39pViVrNv+iU0Evc0FYr8Y2f9ABYheEoRHnfaBBw9W3jWwF
	xeZA+KSqORU4+OvFoWt5jiD7Vpo7y8lZoiTdbzA2x/yz4tlBE1JLFdCCBe/HF6nH88h+grVWFhhah
	9cHt7dUw==;
Received: from [63.135.74.212] (helo=[192.168.1.184])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1r8NEA-007yrK-97; Wed, 29 Nov 2023 16:15:55 +0000
Message-ID: <2feb3ff4-3d26-41f7-83f5-6440393d6e43@codethink.co.uk>
Date: Wed, 29 Nov 2023 16:15:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: Implement archrandom when Zkr is available
Content-Language: en-GB
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Samuel Ortiz <sameo@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231129160325.1119803-1-cleger@rivosinc.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20231129160325.1119803-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_081603_827140_3B7E5240 
X-CRM114-Status: GOOD (  23.97  )
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

T24gMjkvMTEvMjAyMyAxNjowMywgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IEZyb206IFNhbXVl
bCBPcnRpeiA8c2FtZW9Acml2b3NpbmMuY29tPgo+IAo+IEZyb206IFNhbXVlbCBPcnRpeiA8c2Ft
ZW9Acml2b3NpbmMuY29tPgo+IAo+IFRoZSBaa3IgZXh0ZW5zaW9uIGlzIHJhdGlmaWVkIGFuZCBw
cm92aWRlcyAxNiBiaXRzIG9mIGVudHJvcHkgc2VlZCB3aGVuCj4gcmVhZGluZyB0aGUgU0VFRCBD
U1IuCj4gCj4gV2UgY2FuIGltcGxlbWVudCBhcmNoX2dldF9yYW5kb21fc2VlZF9sb25ncygpIGJ5
IGRvaW5nIG11bHRpcGxlIGNzcnJ3IHRvCj4gdGhhdCBDU1IgYW5kIGZpbGxpbmcgYW4gdW5zaWdu
ZWQgbG9uZyB3aXRoIHZhbGlkIGVudHJvcHkgYml0cy4KPiAKPiBBY2tlZC1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwg
T3J0aXogPHNhbWVvQHJpdm9zaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gCj4gLS0tCj4gCj4gVGhpcyBzZXJpZXMgZGVwZW5k
cyBvbiAicmlzY3Y6IHJlcG9ydCBtb3JlIElTQSBleHRlbnNpb25zIHRocm91Z2gKPiBod3Byb2Jl
IiBzZXJpZXMgWzFdLgo+IAo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAy
MzExMTQxNDEyNTYuMTI2NzQ5LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8gWzFdCj4gLS0tCj4gICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FyY2hyYW5kb20uaCB8IDY5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgICAgICB8ICA5
ICsrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXJjaHJhbmRvbS5oCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXJjaHJhbmRvbS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9hcmNocmFuZG9tLmgKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uNzk1ODM3Y2NiNTgzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vYXJjaHJhbmRvbS5oCj4gQEAgLTAsMCArMSw2OSBAQAo+ICsvKiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+ICsvKgo+ICsgKiBLZXJuZWwgaW50ZXJm
YWNlIGZvciB0aGUgUklTQ1YgYXJjaF9yYW5kb21fKiBmdW5jdGlvbnMKPiArICoKPiArICogQ29w
eXJpZ2h0IChjKSAyMDIzIGJ5IFJpdm9zIEluYy4KPiArICoKPiArICovCj4gKwo+ICsjaWZuZGVm
IEFTTV9SSVNDVl9BUkNIUkFORE9NX0gKPiArI2RlZmluZSBBU01fUklTQ1ZfQVJDSFJBTkRPTV9I
Cj4gKwo+ICsjaW5jbHVkZSA8YXNtL2Nzci5oPgo+ICsKPiArI2RlZmluZSBTRUVEX1JFVFJZX0xP
T1BTIDEwMAo+ICsKPiArc3RhdGljIGlubGluZSBib29sIF9fbXVzdF9jaGVjayBjc3Jfc2VlZF9s
b25nKHVuc2lnbmVkIGxvbmcgKnYpCj4gK3sKPiArCXVuc2lnbmVkIGludCByZXRyeSA9IFNFRURf
UkVUUllfTE9PUFMsIHZhbGlkX3NlZWRzID0gMDsKPiArCWNvbnN0IGludCBuZWVkZWRfc2VlZHMg
PSBzaXplb2YobG9uZykgLyBzaXplb2YodTE2KTsKPiArCXUxNiAqZW50cm9weSA9ICh1MTYgKil2
Owo+ICsKPiArCWRvIHsKPiArCQkvKgo+ICsJCSAqIFRoZSBTRUVEIENTUiBtdXN0IGJlIGFjY2Vz
c2VkIHdpdGggYSByZWFkLXdyaXRlIGluc3RydWN0aW9uLgo+ICsJCSAqLwo+ICsJCXVuc2lnbmVk
IGxvbmcgY3NyX3NlZWQgPSBjc3Jfc3dhcChDU1JfU0VFRCwgMCk7Cj4gKwo+ICsJCXN3aXRjaCAo
Y3NyX3NlZWQgJiBTRUVEX09QU1RfTUFTSykgewo+ICsJCWNhc2UgU0VFRF9PUFNUX0VTMTY6Cj4g
KwkJCWVudHJvcHlbdmFsaWRfc2VlZHMrK10gPSBjc3Jfc2VlZCAmIFNFRURfRU5UUk9QWV9NQVNL
Owo+ICsJCQlpZiAodmFsaWRfc2VlZHMgPT0gbmVlZGVkX3NlZWRzKQo+ICsJCQkJcmV0dXJuIHRy
dWU7Cj4gKwkJCWJyZWFrOwo+ICsKPiArCQljYXNlIFNFRURfT1BTVF9ERUFEOgo+ICsJCQlwcl9l
cnJfb25jZSgiYXJjaHJhbmRvbTogVW5yZWNvdmVyYWJsZSBlcnJvclxuIik7Cj4gKwkJCXJldHVy
biBmYWxzZTsKPiArCj4gKwkJY2FzZSBTRUVEX09QU1RfQklTVDoKPiArCQljYXNlIFNFRURfT1BT
VF9XQUlUOgo+ICsJCWRlZmF1bHQ6Cj4gKwkJCWNvbnRpbnVlOwoKaXMgaXQgd29ydGggYWRkaW5n
IGEgY3B1X3JlbGF4KCkgaGVyZT8KCj4gKwkJfQo+ICsJfSB3aGlsZSAoLS1yZXRyeSk7Cj4gKwo+
ICsJcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHNpemVfdCBfX211c3Rf
Y2hlY2sgYXJjaF9nZXRfcmFuZG9tX2xvbmdzKHVuc2lnbmVkIGxvbmcgKnYsIHNpemVfdCBtYXhf
bG9uZ3MpCj4gK3sKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHNpemVf
dCBfX211c3RfY2hlY2sgYXJjaF9nZXRfcmFuZG9tX3NlZWRfbG9uZ3ModW5zaWduZWQgbG9uZyAq
diwgc2l6ZV90IG1heF9sb25ncykKPiArewo+ICsJaWYgKCFtYXhfbG9uZ3MpCj4gKwkJcmV0dXJu
IDA7Cj4gKwo+ICsJLyoKPiArCSAqIElmIFprciBpcyBzdXBwb3J0ZWQgYW5kIGNzcl9zZWVkX2xv
bmcgc3VjY2VlZHMsIHdlIHJldHVybiBvbmUgbG9uZwo+ICsJICogd29ydGggb2YgZW50cm9weS4K
PiArCSAqLwo+ICsJaWYgKHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRf
WktSKSAmJiBjc3Jfc2VlZF9sb25nKHYpKQo+ICsJCXJldHVybiAxOwoKSSdtIGFzc3VtaW5nIHRo
ZSBjb2RlIHdpbGwgcmV0cnkgaWYgbWF4X2xvbmdzID4gMSA/CgoKCj4gKwlyZXR1cm4gMDsKPiAr
fQo+ICsKPiArI2VuZGlmIC8qIEFTTV9SSVNDVl9BUkNIUkFORE9NX0ggKi8KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3NyLmgKPiBpbmRleCAzMDZhMTlhNTUwOWMuLjUxMDAxNDA1MWY1ZCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jc3IuaAo+IEBAIC00MTEsNiArNDExLDE1IEBACj4gICAjZGVmaW5lIENTUl9WVFlQRQkJMHhj
MjEKPiAgICNkZWZpbmUgQ1NSX1ZMRU5CCQkweGMyMgo+ICAgCj4gKy8qIFNjYWxhciBDcnlwdG8g
RXh0ZW5zaW9uIC0gRW50cm9weSAqLwo+ICsjZGVmaW5lIENTUl9TRUVECQkweDAxNQo+ICsjZGVm
aW5lIFNFRURfT1BTVF9NQVNLCQlfQUMoMHhDMDAwMDAwMCwgVUwpCj4gKyNkZWZpbmUgU0VFRF9P
UFNUX0JJU1QJCV9BQygweDAwMDAwMDAwLCBVTCkKPiArI2RlZmluZSBTRUVEX09QU1RfV0FJVAkJ
X0FDKDB4NDAwMDAwMDAsIFVMKQo+ICsjZGVmaW5lIFNFRURfT1BTVF9FUzE2CQlfQUMoMHg4MDAw
MDAwMCwgVUwpCj4gKyNkZWZpbmUgU0VFRF9PUFNUX0RFQUQJCV9BQygweEMwMDAwMDAwLCBVTCkK
PiArI2RlZmluZSBTRUVEX0VOVFJPUFlfTUFTSwlfQUMoMHhGRkZGLCBVTCkKPiArCj4gICAjaWZk
ZWYgQ09ORklHX1JJU0NWX01fTU9ERQo+ICAgIyBkZWZpbmUgQ1NSX1NUQVRVUwlDU1JfTVNUQVRV
Uwo+ICAgIyBkZWZpbmUgQ1NSX0lFCQlDU1JfTUlFCgotLSAKQmVuIERvb2tzCQkJCWh0dHA6Ly93
d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJvdmlk
aW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
