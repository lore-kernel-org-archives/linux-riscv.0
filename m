Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02F9C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEUPqpcCkQDmgxrHZtsXw1eNA8cehjdYsRj22NuHCEI=; b=GQG484Ful7yqBv
	ccPDp29fjyH+0D6eRWjPpqa3zxZLDM3nr3ILX1e1CvmciCGU3MQx7cg5j2qQKS8gat2XJPgB0RVVM
	ySlQUbTXF/gEgWhS3uwnXkXB2z98t2nZNgU8KcnQPuBMKbPH1h2E9vA/EBwok+LqNi56IW6csKzkx
	tR8iWgbedHLPIrcPRDT7vuOteZ7MRJ7w9VG/5DX30zAuxbP/tSEuTRoqc+lpzr8kyM/71rPltCFQt
	1o+z39bJ4OcEfc8Bhy921b8T0wmQrfwylz6IH7hF7p2D63ThutrKeeZphz18xZCHMxI5jByAbf9Jn
	RSqyK9PQQx8gY7SNuk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwLIk-0036Ts-0E;
	Tue, 09 May 2023 11:14:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwLIh-0036TH-0y;
	Tue, 09 May 2023 11:14:36 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pwLIa-0003Kj-NG; Tue, 09 May 2023 13:14:28 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v19 20/24] riscv: Add prctl controls for userspace vector
 management
Date: Tue, 09 May 2023 13:14:26 +0200
Message-ID: <2629220.BddDVKsqQX@diego>
In-Reply-To: <20230509103033.11285-21-andy.chiu@sifive.com>
References:  <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-21-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_041435_345554_9C465669 
X-CRM114-Status: GOOD (  18.93  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Joey Gouly <joey.gouly@arm.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, greentime.hu@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, Stefan Roesch <shr@devkernel.io>, vineetg@rivosinc.com, Josh Triplett <josh@joshtriplett.org>, Paul Walmsley <paul.walmsley@sifive.com>, Jordy Zomer <jordyzomer@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, Vincent Chen <vincent.chen@sifive.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Andy Chiu <andy.chiu@sifive.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpuZWVkIHRvIHBva2UgdGhpcyBtb3JlLCBidXQgb25lIGlzc3VlIHBvcHBlZCB1cCBhdCBm
aXJzdCBjb21waWxlLgoKQW0gRGllbnN0YWcsIDkuIE1haSAyMDIzLCAxMjozMDoyOSBDRVNUIHNj
aHJpZWIgQW5keSBDaGl1Ogo+IFRoaXMgcGF0Y2ggYWRkIHR3byByaXNjdi1zcGVjaWZpYyBwcmN0
bHMsIHRvIGFsbG93IHVzZXNwYWNlIGNvbnRyb2wgdGhlCj4gdXNlIG9mIHZlY3RvciB1bml0Ogo+
IAo+ICAqIFBSX1JJU0NWX1ZfU0VUX0NPTlRST0w6IGNvbnRyb2wgdGhlIHBlcm1pc3Npb24gdG8g
dXNlIFZlY3RvciBhdCBuZXh0LAo+ICAgIG9yIGFsbCBmb2xsb3dpbmcgZXhlY3ZlIGZvciBhIHRo
cmVhZC4gVHVybmluZyBvZmYgYSB0aHJlYWQncyBWZWN0b3IKPiAgICBsaXZlIGlzIG5vdCBwb3Nz
aWJsZSBzaW5jZSBsaWJyYXJpZXMgbWF5IGhhdmUgcmVnaXN0ZXJlZCBpZnVuYyB0aGF0Cj4gICAg
bWF5IGV4ZWN1dGUgVmVjdG9yIGluc3RydWN0aW9ucy4KPiAgKiBQUl9SSVNDVl9WX0dFVF9DT05U
Uk9MOiBnZXQgdGhlIHNhbWUgcGVybWlzc2lvbiBzZXR0aW5nIGZvciB0aGUKPiAgICBjdXJyZW50
IHRocmVhZCwgYW5kIHRoZSBzZXR0aW5nIGZvciBmb2xsb3dpbmcgZXhlY3ZlKHMpLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+CgoKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+
IGluZGV4IDk2MGEzNDM3OTljNi4uMTZjY2IzNTYyNWE5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiBA
QCAtOSw2ICs5LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3NjaGVkLmg+Cj4gICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9wcmN0bC5oPgo+ICAKPiAgI2luY2x1ZGUgPGFzbS90aHJlYWRfaW5mby5oPgo+ICAjaW5j
bHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+IEBAIC0xOSw2ICsyMCw4IEBACj4gICNpbmNsdWRlIDxh
c20vcHRyYWNlLmg+Cj4gICNpbmNsdWRlIDxhc20vYnVnLmg+Cj4gIAo+ICtzdGF0aWMgYm9vbCBy
aXNjdl92X2ltcGxpY2l0X3VhY2MgPSAhSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfVl9ESVNBQkxF
KTsKPiArCj4gIHVuc2lnbmVkIGxvbmcgcmlzY3Zfdl92c2l6ZSBfX3JlYWRfbW9zdGx5Owo+ICBF
WFBPUlRfU1lNQk9MX0dQTChyaXNjdl92X3ZzaXplKTsKPiAgCj4gQEAgLTkxLDExICs5NCw1MSBA
QCBzdGF0aWMgaW50IHJpc2N2X3ZfdGhyZWFkX3phbGxvYyh2b2lkKQo+ICAJcmV0dXJuIDA7Cj4g
IH0KPiAgCj4gKyNkZWZpbmUgVlNUQVRFX0NUUkxfR0VUX0NVUih4KSAoKHgpICYgUFJfUklTQ1Zf
Vl9WU1RBVEVfQ1RSTF9DVVJfTUFTSykKPiArI2RlZmluZSBWU1RBVEVfQ1RSTF9HRVRfTkVYVCh4
KSAoKCh4KSAmIFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxfTkVYVF9NQVNLKSA+PiAyKQo+ICsjZGVm
aW5lIFZTVEFURV9DVFJMX01BS0VfTkVYVCh4KSAoKCh4KSA8PCAyKSAmIFBSX1JJU0NWX1ZfVlNU
QVRFX0NUUkxfTkVYVF9NQVNLKQo+ICsjZGVmaW5lIFZTVEFURV9DVFJMX0dFVF9JTkhFUklUKHgp
ICghISgoeCkgJiBQUl9SSVNDVl9WX1ZTVEFURV9DVFJMX0lOSEVSSVQpKQo+ICtzdGF0aWMgaW5s
aW5lIGludCByaXNjdl92X2dldF9jdXJfY3RybChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykKPiAr
ewo+ICsJcmV0dXJuIFZTVEFURV9DVFJMX0dFVF9DVVIodHNrLT50aHJlYWQudnN0YXRlX2N0cmwp
Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGludCByaXNjdl92X2dldF9uZXh0X2N0cmwoc3Ry
dWN0IHRhc2tfc3RydWN0ICp0c2spCj4gK3sKPiArCXJldHVybiBWU1RBVEVfQ1RSTF9HRVRfTkVY
VCh0c2stPnRocmVhZC52c3RhdGVfY3RybCk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgYm9v
bCByaXNjdl92X3Rlc3RfY3RybF9pbmhlcml0KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKQo+ICt7
Cj4gKwlyZXR1cm4gVlNUQVRFX0NUUkxfR0VUX0lOSEVSSVQodHNrLT50aHJlYWQudnN0YXRlX2N0
cmwpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3Zfdl9zZXRfY3RybChzdHJ1
Y3QgdGFza19zdHJ1Y3QgKnRzaywgaW50IGN1ciwgaW50IG54dCwKPiArCQkJCSAgICBib29sIGlu
aGVyaXQpCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgY3RybDsKPiArCj4gKwljdHJsID0gY3VyICYg
UFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9DVVJfTUFTSzsKPiArCWN0cmwgfD0gVlNUQVRFX0NUUkxf
TUFLRV9ORVhUKG54dCk7Cj4gKwlpZiAoaW5oZXJpdCkKPiArCQljdHJsIHw9IFBSX1JJU0NWX1Zf
VlNUQVRFX0NUUkxfSU5IRVJJVDsKPiArCXRzay0+dGhyZWFkLnZzdGF0ZV9jdHJsID0gY3RybDsK
PiArfQo+ICsKPiArYm9vbCByaXNjdl92X3VzZXJfYWxsb3dlZCh2b2lkKQo+ICt7Cj4gKwlyZXR1
cm4gcmlzY3Zfdl9nZXRfY3VyX2N0cmwoY3VycmVudCkgPT0gUFJfUklTQ1ZfVl9WU1RBVEVfQ1RS
TF9PTjsKPiArfQoKRVhQT1JUX1NZTUJPTChyaXNjdl92X3VzZXJfYWxsb3dlZCk7Cgprdm0gaXMg
YWxsb3dlZCB0byBiZSBidWlsdCBhcyBtb2R1bGUsIHNvIHlvdSBjb3VsZCBlbmQgdXAgd2l0aDoK
CkVSUk9SOiBtb2Rwb3N0OiAicmlzY3Zfdl91c2VyX2FsbG93ZWQiIFthcmNoL3Jpc2N2L2t2bS9r
dm0ua29dIHVuZGVmaW5lZCEKbWFrZVsyXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLm1vZHBv
c3Q6MTM2OiBNb2R1bGUuc3ltdmVyc10gRmVobGVyIDEKbWFrZVsxXTogKioqIFsvaG9tZS9kZXZl
bC9oc3R1ZWJuZXIvMDBfZ2l0LXJlcG9zL2xpbnV4LXJpc2N2L01ha2VmaWxlOjE5Nzg6IG1vZHBv
c3RdIEZlaGxlciAyCm1ha2VbMV06IFZlcnplaWNobmlzIOKAni9ob21lL2RldmVsL2hzdHVlYm5l
ci8wMF9naXQtcmVwb3MvbGludXgtcmlzY3YvX2J1aWxkLXJpc2N2NjTigJwgd2lyZCB2ZXJsYXNz
ZW4KbWFrZTogKioqIFtNYWtlZmlsZToyMjY6IF9fc3ViLW1ha2VdIEZlaGxlciAyCgoKSGVpa28K
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
