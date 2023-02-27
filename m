Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651B4C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vE4hTTH2ceI4vj1A121oNNEtBRcL9pcva/VkDnIwqE=; b=Dabnows3Ir7O1m
	orc8T5SF99rFffY2HA3mMegHzouiQq/5ZrPJ4hiAC2PMieGhAo5avChV3iS4oWx3zVPVv25svN5I0
	bMGRevz1d/P18DhpbAgA2798KnkDJ2DimoNZQYm+aajW2JjUGr7UAPLz9ZtKohOzEbRs//QN5+RZr
	0dDOOS2xrHpg9tOLMumo1thEEJpyQPQ9fmYKt5n7wnI4UEmKlTqgHZwjR4N8SV/3OTkaXy+nl/MzB
	dIoZwcNZAHtnsTNhxBOc+UTg7z7WLNw+8Awj9RDZj7n4Jst0DHmMjkLflh4yth8VdfNItGXFjLYX6
	8MOOVlhL1FXp8AFtjCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdXM-009l3H-HZ; Mon, 27 Feb 2023 13:27:28 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdXH-009l0e-Q6
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 13:27:26 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 275B3E0006;
	Mon, 27 Feb 2023 13:27:11 +0000 (UTC)
Message-ID: <6bd8012a-7311-7956-b0ae-966b8534a64a@ghiti.fr>
Date: Mon, 27 Feb 2023 14:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/1] riscv: Allow to downgrade paging mode from the
 command line
To: Ard Biesheuvel <ardb@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, nathan@kernel.org, llvm@lists.linux.dev,
 ndesaulniers@google.com
References: <20230224100218.1824569-1-alexghiti@rivosinc.com>
 <20230224100218.1824569-2-alexghiti@rivosinc.com> <Y/yilORflGv3vXjX@wendy>
 <CAMj1kXGCkqpHY7rHZv0EFKhPNk6jpbh1OfG_Jm3vSW8c5Y+9_A@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAMj1kXGCkqpHY7rHZv0EFKhPNk6jpbh1OfG_Jm3vSW8c5Y+9_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_052724_187557_0AE5FBF6 
X-CRM114-Status: GOOD (  22.59  )
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

Ck9uIDIvMjcvMjMgMTM6NTYsIEFyZCBCaWVzaGV1dmVsIHdyb3RlOgo+IE9uIE1vbiwgMjcgRmVi
IDIwMjMgYXQgMTM6MzIsIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
IHdyb3RlOgo+PiBIZXkgQWxleCwgY2xhbmcvbGx2bSBmb2xrLAo+Pgo+PiBPbiBGcmksIEZlYiAy
NCwgMjAyMyBhdCAxMTowMjoxOEFNICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+PiBB
ZGQgMiBlYXJseSBjb21tYW5kIGxpbmUgcGFyYW1ldGVycyB0aGF0IGFsbG93IHRvIGRvd25ncmFk
ZSBzYXRwIG1vZGUKPj4+ICh1c2luZyB0aGUgc2FtZSBuYW1pbmcgYXMgeDg2KToKPj4+IC0gIm5v
NWx2bCI6IHVzZSBhIDQtbGV2ZWwgcGFnZSB0YWJsZSAoZG93biBmcm9tIHN2NTcgdG8gc3Y0OCkK
Pj4+IC0gIm5vNGx2bCI6IHVzZSBhIDMtbGV2ZWwgcGFnZSB0YWJsZSAoZG93biBmcm9tIHN2NTcv
c3Y0OCB0byBzdjM5KQo+Pj4KPj4+IE5vdGUgdGhhdCBnb2luZyB0aHJvdWdoIHRoZSBkZXZpY2Ug
dHJlZSB0byBnZXQgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUKPj4+IHdvcmtzIHdpdGggQUNQSSB0
b28gc2luY2UgdGhlIGVmaSBzdHViIGNyZWF0ZXMgYSBkZXZpY2UgdHJlZSBhbnl3YXkgd2l0aAo+
Pj4gdGhlIGNvbW1hbmQgbGluZS4KPj4+Cj4+PiBJbiBLQVNBTiBrZXJuZWxzLCB3ZSBjYW4ndCB1
c2UgdGhlIGxpYmZkdCB0aGF0IGVhcmx5IGluIHRoZSBib290IHByb2Nlc3MKPj4+IHNpbmNlIHdl
IGFyZSBub3QgcmVhZHkgdG8gZXhlY3V0ZSBpbnN0cnVtZW50ZWQgZnVuY3Rpb25zLiBTbyBpbnN0
ZWFkIG9mCj4+PiB1c2luZyB0aGUgImdlbmVyaWMiIGxpYmZkdCwgd2UgY29tcGlsZSBvdXIgb3du
IHZlcnNpb25zIG9mIHRob3NlIGZ1bmN0aW9ucwo+Pj4gdGhhdCBhcmUgbm90IGluc3RydW1lbnRl
ZCBhbmQgdGhhdCBhcmUgcHJlZml4ZWQgc28gdGhhdCB0aGV5IGRvIG5vdAo+Pj4gY29uZmxpY3Qg
d2l0aCB0aGUgZ2VuZXJpYyBvbmVzLiBXZSBhbHNvIG5lZWQgdGhlIG5vbi1pbnN0cnVtZW50ZWQg
dmVyc2lvbnMKPj4+IG9mIHRoZSBzdHJpbmcgZnVuY3Rpb25zIGFuZCB0aGUgcHJlZml4ZWQgdmVy
c2lvbnMgb2YgbWVtY3B5L21lbW1vdmUuCj4+Pgo+Pj4gVGhpcyBpcyBsYXJnZWx5IGluc3BpcmVk
IGJ5IGNvbW1pdCBhYWNkMTQ5YjYyMzggKCJhcm02NDogaGVhZDogYXZvaWQKPj4+IHJlbG9jYXRp
bmcgdGhlIGtlcm5lbCB0d2ljZSBmb3IgS0FTTFIiKSBmcm9tIHdoaWNoIEkgcmVtb3ZlZCBjb21w
aWxhdGlvbgo+Pj4gZmxhZ3MgdGhhdCB3ZXJlIG5vdCByZWxldmFudCB0byBSSVNDLVYgYXQgdGhl
IG1vbWVudCAoTFRPLCBTQ1MsIHBpZSkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Pj4gVGVzdGVkLWJ5OiBCasO2cm4gVMO2
cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+PiBSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+Pj4gLS0tCj4+PiAgIC4uLi9hZG1pbi1ndWlkZS9rZXJuZWwt
cGFyYW1ldGVycy50eHQgICAgICAgICB8ICA1ICstCj4+PiAgIGFyY2gvcmlzY3Yva2VybmVsL01h
a2VmaWxlICAgICAgICAgICAgICAgICAgICB8ICAyICsKPj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwv
cGkvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgMzcgKysrKysrKysrKysKPj4+ICAgYXJjaC9y
aXNjdi9rZXJuZWwvcGkvY21kbGluZV9lYXJseS5jICAgICAgICAgIHwgNjIgKysrKysrKysrKysr
KysrKysrKwo+PiArICAgICAgNCBsZC5sbGQ6IHdhcm5pbmc6IHZtbGludXguYShhcmNoL3Jpc2N2
L2tlcm5lbC9waS9zdHJpbmcucGkubyk6KC5pbml0LnNkYXRhKSBpcyBiZWluZyBwbGFjZWQgaW4g
Jy5pbml0LnNkYXRhJwo+Pgo+PiBJJ20gZ2V0dGluZyA0IG5ldyBsaW5rZXIgd2FybmluZ3Mgd2l0
aCBMTFZNPTEgY2xhbmctMTUgYWxsbW9kY29uZmlnCj4+IGJ1aWxkcyAtIGJ1dCBJIGRvbid0IHJl
YWxseSB1bmRlcnN0YW5kIHRoaXMgaXNzdWUuCj4+IElzIHRoaXMgc3B1cmlvdXMsIGFuZCBhIGp1
c3QgY29uc2VxdWVuY2Ugb2YuLi4KPj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9waS9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlCj4+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi40MDAyZWQ5NGI2ZDMKPj4+IC0t
LSAvZGV2L251bGwKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlCj4+PiBA
QCAtMCwwICsxLDM3IEBACj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+
Pj4gKyMgVGhpcyBmaWxlIHdhcyBjb3BpZWQgZnJvbSBhcm02NC9rZXJuZWwvcGkvTWFrZWZpbGUu
Cj4+PiArCj4+PiArS0JVSUxEX0NGTEFHUyAgICAgICAgOj0gJChzdWJzdCAkKENDX0ZMQUdTX0ZU
UkFDRSksLCQoS0JVSUxEX0NGTEFHUykpIFwKPj4+ICsgICAgICAgICAgICAgICAgLU9zIC1ERElT
QUJMRV9CUkFOQ0hfUFJPRklMSU5HICQoRElTQUJMRV9TVEFDS0xFQUtfUExVR0lOKSBcCj4+PiAr
ICAgICAgICAgICAgICAgICQoY2FsbCBjYy1vcHRpb24sLW1icmFuY2gtcHJvdGVjdGlvbj1ub25l
KSBcCj4+PiArICAgICAgICAgICAgICAgIC1JJChzcmN0cmVlKS9zY3JpcHRzL2R0Yy9saWJmZHQg
LWZuby1zdGFjay1wcm90ZWN0b3IgXAo+Pj4gKyAgICAgICAgICAgICAgICAtRF9fRElTQUJMRV9F
WFBPUlRTIC1mZnJlZXN0YW5kaW5nIFwKPj4+ICsgICAgICAgICAgICAgICAgLWZuby1hc3luY2hy
b25vdXMtdW53aW5kLXRhYmxlcyAtZm5vLXVud2luZC10YWJsZXMgXAo+Pj4gKyAgICAgICAgICAg
ICAgICAkKGNhbGwgY2Mtb3B0aW9uLC1mbm8tYWRkcnNpZykKPj4+ICsKPj4+ICtDRkxBR1NfY21k
bGluZV9lYXJseS5vICs9IC1EX19OT19GT1JUSUZZCj4+PiArQ0ZMQUdTX2xpYi1mZHRfcm8ubyAr
PSAtRF9fTk9fRk9SVElGWQo+Pj4gKwo+Pj4gK0dDT1ZfUFJPRklMRSA6PSBuCj4+PiArS0FTQU5f
U0FOSVRJWkUgICAgICAgOj0gbgo+Pj4gK0tDU0FOX1NBTklUSVpFICAgICAgIDo9IG4KPj4+ICtV
QlNBTl9TQU5JVElaRSAgICAgICA6PSBuCj4+PiArS0NPVl9JTlNUUlVNRU5UICAgICAgOj0gbgo+
Pj4gKwo+Pj4gKyQob2JqKS8lLnBpLm86IE9CSkNPUFlGTEFHUyA6PSAtLXByZWZpeC1zeW1ib2xz
PV9fcGlfIFwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS1yZW1vdmUtc2VjdGlv
bj0ubm90ZS5nbnUucHJvcGVydHkgXAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAt
LXByZWZpeC1hbGxvYy1zZWN0aW9ucz0uaW5pdAo+PiAuLi50aGlzPwo+Pgo+IFllcy4gaWYgdGhl
IGlucHV0IG9iamVjdCBoYXMgYSAuc2RhdGEgc2VjdGlvbiwgdGhlIG91dHB1dCAucGkubyBvYmpl
Y3QKPiB3aWxsIGhhdmUgYSAuaW5pdC5zZGF0YSBzZWN0aW9uLCBhbmQgaWYgdGhlIGNvbW1vbiBs
aW5rZXIgc2NyaXB0IGRvZXMKPiBub3QgcGxhY2UgaXQgZXhwbGljaXRseSwgeW91IHdpbGwgZ2V0
IGEgd2FybmluZy4gTm90ZSB0aGF0IHdlIHN3aXRjaGVkCj4gdG8gLS1vcnBoYW4taGFuZGxpbmc9
ZXJyb3Igb24gb3RoZXIgYXJjaGVzLCBhcyB0aGUgbGlua2VyIHNvbWV0aW1lcwoKCkl0IHNlZW1z
IG9ycGhhbi1oYW5kbGluZyBpcyBzZXQgdG8gImVycm9yIiBvbmx5IHdoZW4gV0VSUk9SIGlzIHNl
dCAoc2VlIApDT05GSUdfTERfT1JQSEFOX1dBUk5fTEVWRUwpLgoKCj4gZG9lcyB1bmV4cGVjdGVk
IHRoaW5ncyB3aXRoIHNlY3Rpb25zIGl0IGRvZXNuJ3Qga25vdyBhYm91dC4KPgo+IEknZCBpbWFn
aW5lIHRoaXMgbmVlZHMgdG8gYmUgY29tYmluZWQgd2l0aCAuaW5pdC5kYXRhCgoKWWVzLCBnY2Mg
ZG9lcyBub3QgcHJvZHVjZSB0aGlzIHNlY3Rpb24gYnV0IG90aGVycyB0aGF0IEkgcGxhY2VkIGlu
IGEgbmV3IApzZWN0aW9uIGNhbGxlZCAuaW5pdC5waWRhdGE6IEkgZGlkIG5vdCB3YW50IHRvIGV4
cGFuZCBJTklUX0RBVEFfU0VDVElPTiAKbWFjcm8gYmVjYXVzZSB3ZSB3b24ndCBuZWVkIHRoYXQg
YW55bW9yZSB3aGVuIHdlIGltcGxlbWVudCBhbGwgdGhlIApzdHJpbmcgZnVuY3Rpb25zLgoKU28g
SSdsbCBhZGQgdGhpcyBuZXcgLmluaXQuc2RhdGEgc2VjdGlvbiB0byAuaW5pdC5waWRhdGEgaW4g
dGhlIHY4IQoKVGhhbmtzLAoKCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
