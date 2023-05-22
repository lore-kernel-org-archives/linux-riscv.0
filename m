Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48BBC7EE26
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVbjXPUbC6BvSF+MqT3bMB1kDSYKi4Fy6nQsWOgkGyQ=; b=d5s41RaOMJsLAN
	ph3/e1wxcijCOFbodBAOOm3Tqf47UwzMfDUyYDRFPrRRbbaX6HP183S/G1JkGdOppJpMv8Sxc0inw
	iw6oCFDNrKCd5cTNzysXv7X2+nQx1ui811TzD0DReyfOD7YJX01C1ohtbjJt76fK4s1CMh9g9Xl5U
	xST535an2znMrK8ENYDhnpny4JnACBNcPUUdv490HcvP6TsOqSjo+lqXOqkrlxQtbjF2GWe6a+3l1
	BhJ9cDfu7FzeMWCnrC2zRDlYzqFkxM3nojp5axN1KNHjyPkduCeuB4KRrzlk4X2AqTrUauioyKznq
	KNJVPSR83Hf8aqNr7i5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q135f-0066TV-1A;
	Mon, 22 May 2023 10:48:35 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q135b-0066Lo-36
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 10:48:33 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 7904B1BF204;
	Mon, 22 May 2023 10:48:20 +0000 (UTC)
Message-ID: <3022ab59-02f8-6f95-c7a1-b4c271729120@ghiti.fr>
Date: Mon, 22 May 2023 12:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, schwab@linux-m68k.org
Cc: alexghiti@rivosinc.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <mhng-d3720bcf-5eda-46da-b640-0606ef3a60e2@palmer-ri-x1c9a>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mhng-d3720bcf-5eda-46da-b640-0606ef3a60e2@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_034832_171174_CBBB828E 
X-CRM114-Status: GOOD (  12.40  )
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

Ck9uIDE5LzA1LzIwMjMgMjM6NTUsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIEZyaSwgMTkg
TWF5IDIwMjMgMTQ6NDg6NTkgUERUICgtMDcwMCksIHNjaHdhYkBsaW51eC1tNjhrLm9yZyB3cm90
ZToKPj4gT24gTWFpIDE5IDIwMjMsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4KPj4+IEkgaGF2
ZSB0ZXN0ZWQgdGhlIGZvbGxvd2luZyBwYXRjaCBzdWNjZXNzZnVsbHksIGNhbiB5b3UgZ2l2ZSBp
dCBhIHRyeQo+Pj4gd2hpbGUgSSBtYWtlIHN1cmUgdGhpcyBpcyB0aGUgb25seSBwbGFjZSBJIGZv
cmdvdCB0byBhZGQgdGhlIC1mbm8tcGllCj4+PiBmbGFnPwo+Pj4KPj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4+
PiBpbmRleCBmYmRjY2MyMTQxOGEuLjE1Mzg2NGU0ZjM5OSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL01ha2VmaWxlCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmls
ZQo+Pj4gQEAgLTIzLDYgKzIzLDEwIEBAIGlmZGVmIENPTkZJR19GVFJBQ0UKPj4+IMKgQ0ZMQUdT
X1JFTU9WRV9hbHRlcm5hdGl2ZS5vID0gJChDQ19GTEFHU19GVFJBQ0UpCj4+PiDCoENGTEFHU19S
RU1PVkVfY3B1ZmVhdHVyZS5vID0gJChDQ19GTEFHU19GVFJBQ0UpCj4+PiDCoGVuZGlmCj4+PiAr
aWZkZWYgQ09ORklHX1JFTE9DQVRBQkxFCj4+PiArQ0ZMQUdTX2FsdGVybmF0aXZlLm8gKz0gLWZu
by1waWUKPj4+ICtDRkxBR1NfY3B1ZmVhdHVyZS5vICs9IC1mbm8tcGllCj4+PiArZW5kaWYKPj4+
IMKgaWZkZWYgQ09ORklHX0tBU0FOCj4+PiDCoEtBU0FOX1NBTklUSVpFX2FsdGVybmF0aXZlLm8g
Oj0gbgo+Pj4gwqBLQVNBTl9TQU5JVElaRV9jcHVmZWF0dXJlLm8gOj0gbgo+Pgo+PiBJIGNhbiBj
b25maXJtIHRoYXQgdGhpcyBmaXhlcyB0aGUgY3Jhc2guCj4KPiBUaGFua3MuwqAgQWxleDogY2Fu
IHlvdSBzZW5kIGEgcGF0Y2g/CgoKSSBkb24ndCB0aGluayB0aGlzIHBhdGNoIGFsb25lIHdpbGwg
d29yaywgYWxsIHRoZSBjb2RlIGluIGVhcmx5IAphbHRlcm5hdGl2ZXMgbXVzdCBiZSBjb21waWxl
ZCB3aXRoIC1mbm8tcGllLCBidXQgSSdtIGEgYml0IHNjYXJlZCB0aGF0J3MgCmEgImJpZyIgY29u
c3RyYWludC4gRm9yIG5vdywgSSBzZWUgMiBzb2x1dGlvbnM6CgotIERvY3VtZW50IHNvbWV3aGVy
ZSB0aGUgZmFjdCB0aGF0IGFueXRoaW5nIGNhbGxlZCBmcm9tIGVhcmx5IAphbHRlcm5hdGl2ZXMg
bXVzdCBiZSBjb21waWxlZCB3aXRoIC1mbm8tcGllCi0gT3IgcmVsb2NhdGUgb25jZSB3aXRoIHBo
eXNpY2FsIGFkZHJlc3MsIGNhbGwgZWFybHkgYWx0ZXJuYXRpdmVzLCBhbmQgCnRoZW4gZG8gdGhl
IGZpbmFsIHZpcnR1YWwgcmVsb2NhdGlvbgoKQm90aCBvcHRpb25zIGNhbiBiZSBjdW1iZXJzb21l
IGluIHRoZWlyIG93biB3YXksIGlmIGFueW9uZSBoYXMgYW4gCm9waW5pb24sIEknZCBiZSBoYXBw
eSB0byBkaXNjdXNzIHRoYXQgOikKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
