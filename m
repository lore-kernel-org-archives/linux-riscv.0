Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504FCC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAnXChKTaEBzVsjkPA7M7g9Twl8wjHvcgmjaJeKKbgw=; b=tcg7ipJDPkBU9C
	eSnUX7x2EuXsPSCY+gEScaHveFF2PCwN1wbA/GbzpFhBobRNv8StG//XukwY+68qdDIggs8vnWBRQ
	Cl30skcaqPUFQnivt4/cr1KYi5sVnkK6k23osuSjpSzTkLECZndk0VeZnQKW2bvUZV2gtneqCjsRT
	8YlKmtBHqpa7reCI3nNY+kQu8SH7KGy0xUBOSvOrcvK3tii104xtyuDwW499jR7XRZ01Uqhd4Puz5
	PiOmrCIelWMZ+yd2piuHTB+VYSigSYOIxhTImSZMhf01h9y4Siz4hRCJwxuFGcJwZ4yLqEViayNMh
	cfqW58oRRJImoSnOJ1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxyB-00G3fQ-0K;
	Fri, 19 May 2023 11:08:23 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzxy7-00G3ec-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 11:08:21 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id CF7CAE000B;
	Fri, 19 May 2023 11:08:12 +0000 (UTC)
Message-ID: <6fc7f0e1-0dde-9b41-0d60-6b0bd65bb630@ghiti.fr>
Date: Fri, 19 May 2023 13:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
Content-Language: en-US
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <87wn1h5nne.fsf@igel.home>
 <4adb27d2-325d-3ce0-23b1-ec69a973b4bf@ghiti.fr> <87ttwi91g0.fsf@igel.home>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <87ttwi91g0.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_040819_983904_E73979B0 
X-CRM114-Status: GOOD (  13.34  )
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

T24gNS8xMS8yMyAyMDoxOCwgQW5kcmVhcyBTY2h3YWIgd3JvdGU6Cj4gT24gTWFpIDA5IDIwMjMs
IEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPgo+PiBPbiA1LzkvMjMgMjE6MDcsIEFuZHJlYXMgU2No
d2FiIHdyb3RlOgo+Pj4gVGhhdCBkb2VzIG5vdCB3b3JrIHdpdGggVUVGSSBib290aW5nOgo+Pj4K
Pj4+IExvYWRpbmcgTGludXggNi40LjAtcmMxLTEuZzY2ODE4N2QtZGVmYXVsdCAuLi4KPj4+IExv
YWRpbmcgaW5pdGlhbCByYW1kaXNrIC4uLgo+Pj4gVW5oYW5kbGVkIGV4Y2VwdGlvbjogSW5zdHJ1
Y3Rpb24gYWNjZXNzIGZhdWx0Cj4+PiBFUEM6IGZmZmZmZmZmODAwMTZkNTYgUkE6IDAwMDAwMDAw
ODAyMDMzNGUgVFZBTDogMDAwMDAwN2Y4MDAxNmQ1Ngo+Pj4gRVBDOiBmZmZmZmZmZjAwMmQxZDU2
IFJBOiAwMDAwMDAwMDAwNGJlMzRlIHJlbG9jIGFkanVzdGVkCj4+PiBVbmhhbmRsZWQgZXhjZXB0
aW9uOiBMb2FkIGFjY2VzcyBmYXVsdAo+Pj4gRVBDOiAwMDAwMDAwMGZmZjQ2MmQ0IFJBOiAwMDAw
MDAwMGZmZjQ2MmQwIFRWQUw6IGZmZmZmZmZmODAwMTZkNTYKPj4+IEVQQzogMDAwMDAwMDA4MDIw
MTJkNCBSQTogMDAwMDAwMDA4MDIwMTJkMCByZWxvYyBhZGp1c3RlZAo+Pj4KPj4+IENvZGU6IGM4
MjUgOGUwZCAwNWIzIDQwYjQgZDBlZiAwNjM2IDc0OTMgZmZlNCAoZDc4MyAwMDA0KQo+Pj4gVUVG
SSBpbWFnZSBbMHgwMDAwMDAwMGZlNjVlMDAwOjB4MDAwMDAwMDBmZTZlM2ZmZl0gJy9lZmlcYm9v
dFxib290cmlzY3Y2NC5lZmknCj4+PiBVRUZJIGltYWdlIFsweDAwMDAwMDAwZGFhODIwMDA6MHgw
MDAwMDAwMGRjYzJhZmZmXQo+Pj4KPj4gSSBuZWVkIG1vcmUgZGV0YWlscyBwbGVhc2UsIGFzIEkg
aGF2ZSBhIFVFRkkgYm9vdGZsb3cgYW5kIGl0IHdvcmtzIGdyZWF0Cj4+IChLQVNMUiBpcyBiYXNl
ZCBvbiBhIHJlbG9jYXRhYmxlIGtlcm5lbCBhbmQgd29ya3MgZmluZSBpbiBVRUZJIHRvbykuCj4g
SXQgYWxzbyBjcmFzaGVzIHdpdGhvdXQgVUVGSS4gIERpc2FibGluZyBDT05GSUdfUkVMT0NBVEFC
TEUgZml4ZXMgdGhhdC4KPiBUaGlzIHdhcyB0ZXN0ZWQgb24gdGhlIEhpRml2ZSBVbm1hdGNoZWQg
Ym9hcmQuCj4gVGhlIGtlcm5lbCBpbWFnZSBJIHRlc3RlZCBpcyBhdmFpbGFibGUgZnJvbQo+IDxo
dHRwczovL2Rvd25sb2FkLm9wZW5zdXNlLm9yZy9yZXBvc2l0b3JpZXMvS2VybmVsOi9IRUFEL1JJ
U0NWLz4uICBUaGUKPiBzYW1lIGtlcm5lbCB3aXRoIENPTkZJR19SRUxPQ0FUQUJMRSBkaXNhYmxl
ZCBpcyBhdmFpbGFibGUgZnJvbQo+IDxodHRwczovL2Rvd25sb2FkLm9wZW5zdXNlLm9yZy9yZXBv
c2l0b3JpZXMvaG9tZTovQW5kcmVhc19TY2h3YWI6L3Jpc2N2Oi9rZXJuZWwvc3RhbmRhcmQvPi4K
PgoKSSBoYXZlIHRlc3RlZCB0aGUgZm9sbG93aW5nIHBhdGNoIHN1Y2Nlc3NmdWxseSwgY2FuIHlv
dSBnaXZlIGl0IGEgdHJ5IAp3aGlsZSBJIG1ha2Ugc3VyZSB0aGlzIGlzIHRoZSBvbmx5IHBsYWNl
IEkgZm9yZ290IHRvIGFkZCB0aGUgLWZuby1waWUgZmxhZz8KCmRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCmluZGV4IGZi
ZGNjYzIxNDE4YS4uMTUzODY0ZTRmMzk5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9N
YWtlZmlsZQorKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQpAQCAtMjMsNiArMjMsMTAg
QEAgaWZkZWYgQ09ORklHX0ZUUkFDRQogwqBDRkxBR1NfUkVNT1ZFX2FsdGVybmF0aXZlLm8gPSAk
KENDX0ZMQUdTX0ZUUkFDRSkKIMKgQ0ZMQUdTX1JFTU9WRV9jcHVmZWF0dXJlLm8gPSAkKENDX0ZM
QUdTX0ZUUkFDRSkKIMKgZW5kaWYKK2lmZGVmIENPTkZJR19SRUxPQ0FUQUJMRQorQ0ZMQUdTX2Fs
dGVybmF0aXZlLm8gKz0gLWZuby1waWUKK0NGTEFHU19jcHVmZWF0dXJlLm8gKz0gLWZuby1waWUK
K2VuZGlmCiDCoGlmZGVmIENPTkZJR19LQVNBTgogwqBLQVNBTl9TQU5JVElaRV9hbHRlcm5hdGl2
ZS5vIDo9IG4KIMKgS0FTQU5fU0FOSVRJWkVfY3B1ZmVhdHVyZS5vIDo9IG4KClRoYW5rcwoKQWxl
eAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
