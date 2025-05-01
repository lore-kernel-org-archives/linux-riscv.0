Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63535C369DC
	for <linux-riscv@archiver.kernel.org>; Thu,  1 May 2025 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uajMHHevjJBZJpD/OiJ6ORTOzUhdhEE0jNUlzgHmq9Y=; b=tnhAsLeLqjRH/E
	zS2pbRPR1YI9PCftBr0ZzvlsktFa35D+0Qv9WBB5u3+WUF461iLjDj1BimP24YRPDV3YS+HYcvZoh
	NGOTTMgPzOmHsZxg40uZXLVJ+sVbXT/14kXpeKz6yMZNtHUbHG5iJOWass3erP6HmvtMxfD4LgPN1
	xC4H30NrFeevhJm7E6exvN9JLlC4XZMCNYpDb3FWU+DgIFxUoWaSWWxeX7SDxGOzC88KOU+XndqJz
	NnUdX1d9gvT3QZmyhSHAW2hILCv6tcS62lT1+ClMX42VgabIc0fZ5P7enU8zeiXAcOrmKoZoQFNAD
	IbtSmx2/DuyarNI6aw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQ8b-0000000F6ts-0ajR;
	Thu, 01 May 2025 09:23:25 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQ8Z-0000000F6tS-0Y3w
	for linux-riscv@lists.infradead.org;
	Thu, 01 May 2025 09:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1746091397;
	bh=Afd/qagLKI/fX+0RGz5E2Ib/ep+ALL7XK8CbKf8SgZ8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=WC5PUHBpzf/Bq7qfABvB68s996X+KfIVkxXtnqWlzFu6ZE1F9tPrgFtZTAApIeEah
	 Td6zPENp9j3EAxeWDDIck+n9YbS/THiOkDHcW1tTj6/GFUMuFgv/YSPY92ZbiyyQLl
	 yNoKEPyWyHpDIUJD7IZtBA0mycpOVKxxpLINqk4A=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 4D8E365F64;
	Thu,  1 May 2025 05:23:16 -0400 (EDT)
Message-ID: <7249b7dfdfa5fc56d321c9b69affa17b325d1e4a.camel@xry111.site>
Subject: Re: [PATCH v2] riscv: vdso.lds.S: Do not export __vdso_getrandom
 when building a 32-bit vDSO
From: Xi Ruoyao <xry111@xry111.site>
To: Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt
 <palmer@rivosinc.com>,  Alexandre Ghiti	 <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, Linux Kernel Functional Testing <lkft@linaro.org>
Date: Thu, 01 May 2025 17:23:14 +0800
In-Reply-To: <20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org>
References: <20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_022323_188229_D55FCBC6 
X-CRM114-Status: GOOD (  16.49  )
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

T24gV2VkLCAyMDI1LTA0LTIzIGF0IDEzOjAzIC0wNzAwLCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90
ZToKPiBsZC5sbGQgZGVmYXVsdHMgdG8gJy0tbm8tdW5kZWZpbmVkLXZlcnNpb24nLCB3aGljaCBj
YXVzZXMgdGhlIGNvbXBhdAo+IHZEU08gZm9yIDY0LWJpdCBidWlsZHMgYW5kIHRoZSByZWd1bGFy
IHZEU08gZm9yIDMyLWJpdCBidWlsZHMgdG8gYnJlYWsKPiBhZnRlciB3aXJpbmcgdXAgdGhlIHZE
U08gZ2V0cmFuZG9tKCkgY2FsbCBiZWNhdXNlIF9fdmRzb19nZXRyYW5kb20gaXMKPiB1bmNvbmRp
dGlvbmFsbHkgZXhwb3J0ZWQsIGV2ZW4gdGhvdWdoIGl0IGlzIG5vdCBhbHdheXMgcHJlc2VudC4K
PiAKPiDCoCBsZC5sbGQ6IGVycm9yOiB2ZXJzaW9uIHNjcmlwdCBhc3NpZ25tZW50IG9mICdMSU5V
WF80LjE1JyB0byBzeW1ib2wgJ19fdmRzb19nZXRyYW5kb20nIGZhaWxlZDogc3ltYm9sIG5vdCBk
ZWZpbmVkCj4gCj4gTW92ZSB0aGUgZXhwb3J0IG9mIF9fdmRzb19nZXRyYW5kb20oKSB1bmRlciBh
biBpZmRlZiB0byBvbmx5IGluY2x1ZGUgaXQKPiB3aGVuIENPTkZJR19WRFNPX0dFVFJBTkRPTSBp
cyBkZWZpbmVkICh0byBleGNsdWRlIDMyLWJpdCBidWlsZHMpIGFuZAo+IENPTVBBVF9WRFNPIGlz
IG5vdCBkZWZpbmVkICh0byBleGNsdWRlIHRoZSAzMi1iaXQgdkRTTyBvbiA2NC1iaXQgYnVpbGRz
KQo+IHRvIHJlc29sdmUgdGhlIGVycm9yLgo+IAo+IEZpeGVzOiA4OTA3OTUyMGNlZjYgKCJSSVND
LVY6IHZEU086IFdpcmUgdXAgZ2V0cmFuZG9tKCkgdkRTTyBpbXBsZW1lbnRhdGlvbiIpCj4gUmVw
b3J0ZWQtYnk6IExpbnV4IEtlcm5lbCBGdW5jdGlvbmFsIFRlc3RpbmcgPGxrZnRAbGluYXJvLm9y
Zz4KPiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL0NBK0c5Zll0TjJpZStZdEszSDlt
clE1UXFyU0NGR0dqVmJ0SmNmaVlYMG9ITVZXTW45d0BtYWlsLmdtYWlsLmNvbS8KPiBTaWduZWQt
b2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1i
eTogWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+CgpJIGRpZG4ndCBleHBlY3QgbXkgcGF0
Y2ggdG8gbWFrZSBpdCB3YXkgaW50byAtbmV4dCBhcyBpdCBhbHJlYWR5IGZhaWxlZAp0aGUgQ0ku
ICBJIHdhcyBqdXN0IHRvbyBidXN5IG9uICRvdGhlcl9zdHVmZiBhbmQgdGhpbmtpbmcgImhleSBs
ZXQgbWUKcmV3b3JrIHRoZSBwYXRjaCB3aGVuIEkgZ2V0IHNvbWUgdGltZSIgOiguCgo+IC0tLQo+
IENoYW5nZXMgaW4gdjI6Cj4gLSBJbmNsdWRlIGEgY2hlY2sgZm9yIENPTkZJR19WRFNPX0dFVFJB
TkRPTSB0byBmaXggYnJlYWthZ2Ugb24KPiDCoCBydjMyX2RlZmNvbmZpZy4gSW5jbHVkZSB0aGUg
dGFncyBmb3IgdGhlIHJlcG9ydCB0aGF0IGhlbHBlZCBoaWdobGlnaHQKPiDCoCB0aGlzIGlzc3Vl
Lgo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDQyMy1yaXNj
di1maXgtY29tcGF0X3Zkc28tbGxkLXYxLTEtODIwZGU1Y2FkNjA1QGtlcm5lbC5vcmcKPiAtLS0K
PiDCoGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5sZHMuUyB8IDIgKysKPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvdmRzby92ZHNvLmxkcy5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92ZHNvLmxkcy5TCj4g
aW5kZXggYWJjNjljZGEwNDQ1Li43YzE1YjBmNGVlM2IgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvdmRzby92ZHNvLmxkcy5TCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92
ZHNvLmxkcy5TCj4gQEAgLTgwLDcgKzgwLDkgQEAgVkVSU0lPTgo+IMKgI2lmbmRlZiBDT01QQVRf
VkRTTwo+IMKgCQlfX3Zkc29fcmlzY3ZfaHdwcm9iZTsKPiDCoCNlbmRpZgo+ICsjaWYgZGVmaW5l
ZChDT05GSUdfVkRTT19HRVRSQU5ET00pICYmICFkZWZpbmVkKENPTVBBVF9WRFNPKQo+IMKgCQlf
X3Zkc29fZ2V0cmFuZG9tOwo+ICsjZW5kaWYKPiDCoAlsb2NhbDogKjsKPiDCoAl9Owo+IMKgfQo+
IAo+IC0tLQo+IGJhc2UtY29tbWl0OiBiYWZhNDUxYTk2ZDBmMTQwNGFhMWE1YTI2N2Y3ODc2N2E1
NWZhYzcxCj4gY2hhbmdlLWlkOiAyMDI1MDQyMy1yaXNjdi1maXgtY29tcGF0X3Zkc28tbGxkLWUx
YjgwYjMyNGQ5Nwo+IAo+IEJlc3QgcmVnYXJkcywKCi0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkx
MTEuc2l0ZT4KU2Nob29sIG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRp
YW4gVW5pdmVyc2l0eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
