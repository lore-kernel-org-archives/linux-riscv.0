Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCD2CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 22:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oi0dckk+205NJBnyAWoKwt+2nVOy5Gwr426kWNysjrM=; b=Szov98ts8ZYxjm
	3BIGi7JuhwMPibU7TSwbg1RJuqrzGRPRxfZtj4KaH/9uMQ5tTweHE1c9d9Aib1KtKmU4kpsInBgfS
	lPSpNWfXGuV20K+Qt+nu+5DBCN19rluo0p01rYnFIFiza6VSCggZe5O6yh4PmShxpV/sUlx8PAszv
	lccw7pBYzS7sEqW3A3IKfDSQPpQ38GIDhm6ncE4n8txcF2FTT7MQbngPZ8JMMy5b20XoKUtsgUCWr
	G+Y9S7zleUAaB3Yh/9SMgwRdV9GAKuc2lagpx0Ead7ivOpqAfzBFccyo8tpLhzBCjbIzEK8R/Hzxa
	iccS67+gEeTOlPaVc1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGmEg-0000000EaOs-12sz;
	Wed, 05 Nov 2025 22:44:14 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGmEd-0000000EaOV-144Z
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 22:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Rcz9OHWqrkXIvtIUBV6foEU7yY/XR+LTCfFnMpPJAWE=; b=JcyOecmsyvuctmYcsfL2VURPJK
	ARZA57NqLJM1Ls3zX/oV0/jnhV3xqV+9A9+AobFBMu59TamRLLipjY2jBF3lD6gmQbInegLZgpyqu
	tlr9NXjnD35fCY3OLg1rNI/UQLcoWFVCJ45WI2DheKW8eVjmJFjvirLCoFoHEwf2MIqYqpkR5zQSH
	QkParKIUeN3oBmYzXuuJE67Q3UJ3i2yPy9JqWQoLyeQCyFIs53aEmri0981o+Ggw3BmTq/E9JBsge
	xi1GRtVCPhTbr/5sjrAtlCodfVSifq8FI3wJ25vkOkXK2VGJSb6PQ2/9MIL5bhdVpn4H0icoBpcI/
	SRvJiNXQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vGmES-0000000AfjF-2E3C;
	Wed, 05 Nov 2025 23:44:00 +0100
Date: Wed, 5 Nov 2025 23:44:00 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: fix detect issue
Message-ID: <aQvTMM0S16gOdiAN@aurel32.net>
Mail-Followup-To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251103-fix-k1-detect-failure-v1-1-bb07a8d7de7c@linux.spacemit.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_144411_297691_DD096EBD 
X-CRM114-Status: GOOD (  24.41  )
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

SGksCgpPbiAyMDI1LTExLTAzIDE1OjA2LCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+IFRoaXMgY29t
bWl0IGFkZHJlc3NlcyB0d28gaXNzdWVzIGNhdXNpbmcgaTJjIGRldGVjdCB0byBmYWlsLgo+IAo+
IFRoZSBpZGVudGlmaWVkIGlzc3VlcyBhcmU6Cj4gCj4gMS4gSW5jb3JyZWN0IGVycm9yIGhhbmRs
aW5nIGZvciBCRUQgKEJ1cyBFcnJvciBObyBBQ0svTkFLKToKPiAgICBCZWZvcmUgdGhpcyBjb21t
aXQsIEJvdGggQUxEIChBcmJpdHJhdGlvbiBMb3NzIERldGVjdGVkKSBhbmQKPiAgICBCRUQgcmV0
dXJuZWQgLUVBR0FJTi4KPiAyLiBNaXNzaW5nIGludGVycnVwdCBzdGF0dXMgY2xlYXIgYWZ0ZXIg
aW5pdGlhbGl6YXRpb24gaW4geGZlcigpOgo+ICAgIE9uIHRoZSBLMSBTb0MsIHNpbXBseSBmaXhp
bmcgdGhlIGZpcnN0IGlzc3VlIGNoYW5nZWQgdGhlIGVycm9yCj4gICAgZnJvbSAtRUFHQUlOIHRv
IC1FVElNRU9VVC4gVGhyb3VnaCB0cmFjaW5nLCBpdCB3YXMgZGV0ZXJtaW5lZCB0aGF0Cj4gICAg
dGhpcyBpcyBsaWtlbHkgZHVlIHRvIE1TRCAoTWFzdGVyIFN0b3AgRGV0ZWN0ZWQpIGxhdGVuY3kg
aXNzdWVzLgo+IAo+ICAgIFRoYXQgbWVhbnMgdGhlIE1TRCBiaXQgaW4gdGhlIElTUiBtYXkgc3Rp
bGwgYmUgc2V0IG9uIHRoZSBuZXh0IHRyYW5zZmVyLgo+ICAgIEFzIGEgcmVzdWx0LCB0aGUgY29u
dHJvbGxlciB3b24ndCB3b3JrIOKAlCB3ZSBjYW4gc2VlIGZyb20gdGhlIHNjb3BlIHRoYXQKPiAg
ICBpdCBkb2Vzbid0IGlzc3VlIGFueSBzaWduYWwuCj4gICAgKFRoaXMgb25seSBvY2N1cnMgZHVy
aW5nIHJhcGlkIGNvbnNlY3V0aXZlIEkyQyB0cmFuc2ZlcnMuCj4gICAgVGhhdCBleHBsYWlucyB3
aHkgdGhlIGlzc3VlIG9ubHkgc2hvd3MgdXAgd2l0aCBpMmNkZXRlY3QuKQo+IAo+IFdpdGggdGhl
c2UgdHdvIGZpeGVzLCBpMmMgZGV2aWNlIGRldGVjdGlvbiBub3cgZnVuY3Rpb25zIGNvcnJlY3Rs
eSBvbiB0aGUgSzEgU29DLgo+IAo+IEZpeGVzOiA1ZWE1NTg0NzNmYTMxICgiaTJjOiBzcGFjZW1p
dDogYWRkIHN1cHBvcnQgZm9yIFNwYWNlbWlUIEsxIFNvQyIpCj4gU2lnbmVkLW9mZi1ieTogVHJv
eSBNaXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Cj4gLS0tCj4gSSBj
aGVja2VkIHRoZSB2ZW5kb3IgdmVyc2lvbiBkcml2ZXIgYW5kIHRyaWVkIGNvbW1lbnRpbmcgb3V0
Cj4gc3BhY2VtaXRfaTJjX2NsZWFyX2ludF9zdGF0dXMoKSB0aGF0IHJ1bnMgYmVmb3JlIHhmZXIg
c3RhcnRzLgo+IFN1cnByaXNpbmdseSwgaTJjZGV0ZWN0IHN0b3BwZWQgd29ya2luZyBhcyB3ZWxs
Lgo+IC0tLQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMgfCA1ICsrKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1rMS5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1r
MS5jCj4gaW5kZXggNmI5MTg3NzBlNjEyZTA5OGI4YWQxNzQxOGY0MjBkODdjOTRkZjE2Ni4uMzc4
MjgzMjMzMTc3NzBhZTJmMDUyMmQyMTNkY2E2NzM0MmFlMTY2ZiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLWsxLmMKPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWsx
LmMKPiBAQCAtMTYwLDcgKzE2MCw4IEBAIHN0YXRpYyBpbnQgc3BhY2VtaXRfaTJjX2hhbmRsZV9l
cnIoc3RydWN0IHNwYWNlbWl0X2kyY19kZXYgKmkyYykKPiAgCj4gIAlpZiAoaTJjLT5zdGF0dXMg
JiAoU1BBQ0VNSVRfU1JfQkVEIHwgU1BBQ0VNSVRfU1JfQUxEKSkgewo+ICAJCXNwYWNlbWl0X2ky
Y19yZXNldChpMmMpOwo+IC0JCXJldHVybiAtRUFHQUlOOwo+ICsJCWlmIChpMmMtPnN0YXR1cyAm
IFNQQUNFTUlUX1NSX0FMRCkKPiArCQkJcmV0dXJuIC1FQUdBSU47Cj4gIAl9CgpUaGlzIG1ha2Vz
IHRoZSByZXN1bHRpbmcgY29kZSwgd2hpbGUgY29ycmVjdCwgY29tcGxleCB0byB1bmRlcnN0YW5k
IGFzIAppdCBpcyBub3cgdHdvIHJlYWxseSBkaWZmZXJlbnQgZXJyb3JzLCBhcyB5b3UgZXhwbGFp
bmVkIHdlbGwgaW4gdGhlIApjb21taXQgbWVzc2FnZS4KCkkgdGhlcmVmb3JlIHN1Z2dlc3QgdG8g
b3JnYW5pemUgdGhlIGNvZGUgYXM6CgoJLyogQXJiaXRyYXRpb24gTG9zcyBEZXRlY3RlZCAqLwoJ
aWYgKGkyYy0+c3RhdHVzICYgU1BBQ0VNSVRfU1JfQUxEKSB7CgkJc3BhY2VtaXRfaTJjX3Jlc2V0
KGkyYyk7CgkJcmV0dXJuIC1FQUdBSU47Cgl9CgoJLyogQnVzIEVycm9yIE5vIEFDSy9OQUsgKi8K
CWlmIChpMmMtPnN0YXR1cyAmIFNQQUNFTUlUX1NSX0JFRCkgewoJCXNwYWNlbWl0X2kyY19yZXNl
dChpMmMpOwoJfQoKCj4gIAlyZXR1cm4gaTJjLT5zdGF0dXMgJiBTUEFDRU1JVF9TUl9BQ0tOQUsg
PyAtRU5YSU8gOiAtRUlPOwo+IEBAIC00OTEsNiArNDkyLDggQEAgc3RhdGljIGludCBzcGFjZW1p
dF9pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXB0LCBzdHJ1Y3QgaTJjX21zZyAqbXNn
cywgaW4KPiAgCj4gIAlzcGFjZW1pdF9pMmNfaW5pdChpMmMpOwo+ICAKPiArCXNwYWNlbWl0X2ky
Y19jbGVhcl9pbnRfc3RhdHVzKGkyYywgU1BBQ0VNSVRfSTJDX0lOVF9TVEFUVVNfTUFTSyk7Cj4g
KwoKVGhpcyBzb3VuZHMgZ29vZCB0byBzdGFydCB0aGUgdHJhbnNmZXIgd2l0aCBhIGNsZWFuIGlu
dGVycnVwdCBzdGF0ZS4gSSAKanVzdCB3b25kZXIgaWYgaXQgc2hvdWxkIGJlIG1vdmVkIHRvIHNw
YWNlbWl0X2kyY19pbml0KCksIGllIHdoZXJlIHRoZSAKY29ycmVzcG9uZGluZyBpbnRlcnJ1cHRz
IGFyZSBlbmFibGVkLgoKPiAgCXNwYWNlbWl0X2kyY19lbmFibGUoaTJjKTsKPiAgCj4gIAlyZXQg
PSBzcGFjZW1pdF9pMmNfd2FpdF9idXNfaWRsZShpMmMpOwoKQW55d2F5OgoKVGVzdGVkLWJ5OiBB
dXJlbGllbiBKYXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+CgoKUmVnYXJkcwpBdXJlbGllbgoK
LS0gCkF1cmVsaWVuIEphcm5vICAgICAgICAgICAgICAgICAgICAgICAgICBHUEc6IDQwOTZSLzFE
REQ4QzlCCmF1cmVsaWVuQGF1cmVsMzIubmV0ICAgICAgICAgICAgICAgICAgICAgaHR0cDovL2F1
cmVsMzIubmV0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
