Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BD5C71122
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 06:12:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DE320877
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 06:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sUSct4a3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DE320877
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kot-begemot.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C8hvsEs66wwsuJwws5OpC78zHVoKTWJD0mcSYsSRr/k=; b=sUSct4a3UAKrmYV4E59KmU7lQ
	WYvzMnKQo5MpxYdkj2juLdiAY++BsDQV5bhGPBiDFYyFgZLTSxeWBjZI9di8Ua21thkmOOnuioayv
	ZsGjS1W6//pW7NowG4T4z2h3fOYvQ4diYlJ/AlqjKIlDxejosbLo7bJLECowOJTAaaxkjDdsWX+Fy
	OYWA1z/rIWKZ6vcMjU+LJOKs55bTLkux7XlacJr+lzPrkdIatu9hXQ8gHs74NxkFBN1jYGmcasKYj
	vPULnldHTkoi/rwvq57pEWVAv5Mhp3sp9wOXkMGvzYlFDpI/QhdcJdMuQXFAc1b88SsgPyaqk9K3G
	iIC4YrwBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gBD9v-00005d-Br; Sat, 13 Oct 2018 06:12:19 +0000
Received: from ivanoab6.miniserver.com ([5.153.251.140]
 helo=www.kot-begemot.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBD9o-0008Ux-LK; Sat, 13 Oct 2018 06:12:15 +0000
Received: from [192.168.17.6] (helo=smaug.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <anton.ivanov@kot-begemot.co.uk>)
 id 1gBD8b-00065c-TA; Sat, 13 Oct 2018 06:10:57 +0000
Received: from wyvern.kot-begemot.co.uk ([192.168.3.72])
 by smaug.kot-begemot.co.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <anton.ivanov@kot-begemot.co.uk>)
 id 1gBD8b-0006dA-6n; Sat, 13 Oct 2018 07:10:57 +0100
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <9ed82f9e-88c4-8e4f-8c45-3ef153469603@kot-begemot.co.uk>
 <20181012143728.t42uvr6etg7gp7fh@kshutemo-mobl1>
 <4dd52e22-5b51-9b30-7178-fde603a08f88@kot-begemot.co.uk>
 <97cb3fe1-7bc1-12ff-d602-56c72a5496c5@kot-begemot.co.uk>
 <20181012214008.jj7vhh76vte7xj7i@kshutemo-mobl1>
From: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Message-ID: <4e3d560b-afce-7d87-bbdb-9701d87ef44e@kot-begemot.co.uk>
Date: Sat, 13 Oct 2018 07:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181012214008.jj7vhh76vte7xj7i@kshutemo-mobl1>
Content-Language: en-US
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_231212_862167_7FEADDEE 
X-CRM114-Status: GOOD (  21.30  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 mhocko@kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, kvmarm@lists.cs.columbia.edu,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 linux-xtensa@linux-xtensa.org, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 pantin@google.com, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Ley Foon Tan <lftan@altera.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181013061056.U7XvDU3JIUr2phJ8lQMDti1s5zXq9QGaYRgOJTDWOjg@z>

T24gMTIvMTAvMjAxOCAyMjo0MCwgS2lyaWxsIEEuIFNodXRlbW92IHdyb3RlOgo+IE9uIEZyaSwg
T2N0IDEyLCAyMDE4IGF0IDA1OjQyOjI0UE0gKzAxMDAsIEFudG9uIEl2YW5vdiB3cm90ZToKPj4g
T24gMTAvMTIvMTggMzo0OCBQTSwgQW50b24gSXZhbm92IHdyb3RlOgo+Pj4gT24gMTIvMTAvMjAx
OCAxNTozNywgS2lyaWxsIEEuIFNodXRlbW92IHdyb3RlOgo+Pj4+IE9uIEZyaSwgT2N0IDEyLCAy
MDE4IGF0IDAzOjA5OjQ5UE0gKzAxMDAsIEFudG9uIEl2YW5vdiB3cm90ZToKPj4+Pj4gT24gMTAv
MTIvMTggMjozNyBBTSwgSm9lbCBGZXJuYW5kZXMgKEdvb2dsZSkgd3JvdGU6Cj4+Pj4+PiBBbmRy
b2lkIG5lZWRzIHRvIG1yZW1hcCBsYXJnZSByZWdpb25zIG9mIG1lbW9yeSBkdXJpbmcKPj4+Pj4+
IG1lbW9yeSBtYW5hZ2VtZW50Cj4+Pj4+PiByZWxhdGVkIG9wZXJhdGlvbnMuIFRoZSBtcmVtYXAg
c3lzdGVtIGNhbGwgY2FuIGJlIHJlYWxseQo+Pj4+Pj4gc2xvdyBpZiBUSFAgaXMKPj4+Pj4+IG5v
dCBlbmFibGVkLiBUaGUgYm90dGxlbmVjayBpcyBtb3ZlX3BhZ2VfdGFibGVzLCB3aGljaCBpcyBj
b3B5aW5nIGVhY2gKPj4+Pj4+IHB0ZSBhdCBhIHRpbWUsIGFuZCBjYW4gYmUgcmVhbGx5IHNsb3cg
YWNyb3NzIGEgbGFyZ2UgbWFwLgo+Pj4+Pj4gVHVybmluZyBvbiBUSFAKPj4+Pj4+IG1heSBub3Qg
YmUgYSB2aWFibGUgb3B0aW9uLCBhbmQgaXMgbm90IGZvciB1cy4gVGhpcyBwYXRjaAo+Pj4+Pj4g
c3BlZWRzIHVwIHRoZQo+Pj4+Pj4gcGVyZm9ybWFuY2UgZm9yIG5vbi1USFAgc3lzdGVtIGJ5IGNv
cHlpbmcgYXQgdGhlIFBNRCBsZXZlbAo+Pj4+Pj4gd2hlbiBwb3NzaWJsZS4KPj4+Pj4+Cj4+Pj4+
PiBUaGUgc3BlZWQgdXAgaXMgdGhyZWUgb3JkZXJzIG9mIG1hZ25pdHVkZS4gT24gYSAxR0IgbXJl
bWFwLCB0aGUgbXJlbWFwCj4+Pj4+PiBjb21wbGV0aW9uIHRpbWVzIGRyb3BzIGZyb20gMTYwLTI1
MCBtaWxsZXNjb25kcyB0byAzODAtNDAwCj4+Pj4+PiBtaWNyb3NlY29uZHMuCj4+Pj4+Pgo+Pj4+
Pj4gQmVmb3JlOgo+Pj4+Pj4gVG90YWwgbXJlbWFwIHRpbWUgZm9yIDFHQiBkYXRhOiAyNDIzMjEw
MTQgbmFub3NlY29uZHMuCj4+Pj4+PiBUb3RhbCBtcmVtYXAgdGltZSBmb3IgMUdCIGRhdGE6IDE5
Njg0MjQ2NyBuYW5vc2Vjb25kcy4KPj4+Pj4+IFRvdGFsIG1yZW1hcCB0aW1lIGZvciAxR0IgZGF0
YTogMTY3MDUxMTYyIG5hbm9zZWNvbmRzLgo+Pj4+Pj4KPj4+Pj4+IEFmdGVyOgo+Pj4+Pj4gVG90
YWwgbXJlbWFwIHRpbWUgZm9yIDFHQiBkYXRhOiAzODU3ODEgbmFub3NlY29uZHMuCj4+Pj4+PiBU
b3RhbCBtcmVtYXAgdGltZSBmb3IgMUdCIGRhdGE6IDM4ODk1OSBuYW5vc2Vjb25kcy4KPj4+Pj4+
IFRvdGFsIG1yZW1hcCB0aW1lIGZvciAxR0IgZGF0YTogNDAyODEzIG5hbm9zZWNvbmRzLgo+Pj4+
Pj4KPj4+Pj4+IEluY2FzZSBUSFAgaXMgZW5hYmxlZCwgdGhlIG9wdGltaXphdGlvbiBpcyBza2lw
cGVkLiBJIGFsc28gZmx1c2ggdGhlCj4+Pj4+PiB0bGIgZXZlcnkgdGltZSB3ZSBkbyB0aGlzIG9w
dGltaXphdGlvbiBzaW5jZSBJIGNvdWxkbid0IGZpbmQgYSB3YXkgdG8KPj4+Pj4+IGRldGVybWlu
ZSBpZiB0aGUgbG93LWxldmVsIFBURXMgYXJlIGRpcnR5LiBJdCBpcyBzZWVuIHRoYXQgdGhlIGNv
c3Qgb2YKPj4+Pj4+IGRvaW5nIHNvIGlzIG5vdCBtdWNoIGNvbXBhcmVkIHRoZSBpbXByb3ZlbWVu
dCwgb24gYm90aAo+Pj4+Pj4geDg2LTY0IGFuZCBhcm02NC4KPj4+Pj4+Cj4+Pj4+PiBDYzogbWlu
Y2hhbkBrZXJuZWwub3JnCj4+Pj4+PiBDYzogcGFudGluQGdvb2dsZS5jb20KPj4+Pj4+IENjOiBo
dWdoZEBnb29nbGUuY29tCj4+Pj4+PiBDYzogbG9rZXNoZ2lkcmFAZ29vZ2xlLmNvbQo+Pj4+Pj4g
Q2M6IGRhbmNvbEBnb29nbGUuY29tCj4+Pj4+PiBDYzogbWhvY2tvQGtlcm5lbC5vcmcKPj4+Pj4+
IENjOiBraXJpbGxAc2h1dGVtb3YubmFtZQo+Pj4+Pj4gQ2M6IGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmcKPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvZWwgRmVybmFuZGVzIChHb29nbGUpIDxqb2Vs
QGpvZWxmZXJuYW5kZXMub3JnPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgwqDCoCBtbS9tcmVtYXAuYyB8
IDYyCj4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+Pj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKPj4+
Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvbW0vbXJlbWFwLmMgYi9tbS9tcmVtYXAuYwo+Pj4+Pj4g
aW5kZXggOWU2OGEwMmE1MmIxLi5kODJjNDg1ODIyZWYgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9tbS9t
cmVtYXAuYwo+Pj4+Pj4gKysrIGIvbW0vbXJlbWFwLmMKPj4+Pj4+IEBAIC0xOTEsNiArMTkxLDU0
IEBAIHN0YXRpYyB2b2lkIG1vdmVfcHRlcyhzdHJ1Y3QKPj4+Pj4+IHZtX2FyZWFfc3RydWN0ICp2
bWEsIHBtZF90ICpvbGRfcG1kLAo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRyb3Bfcm1h
cF9sb2Nrcyh2bWEpOwo+Pj4+Pj4gIMKgwqAgfQo+Pj4+Pj4gK3N0YXRpYyBib29sIG1vdmVfbm9y
bWFsX3BtZChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4+Pj4+IHVuc2lnbmVkIGxvbmcg
b2xkX2FkZHIsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbmV3X2Fk
ZHIsIHVuc2lnbmVkIGxvbmcgb2xkX2VuZCwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgcG1k
X3QgKm9sZF9wbWQsIHBtZF90ICpuZXdfcG1kLCBib29sICpuZWVkX2ZsdXNoKQo+Pj4+Pj4gK3sK
Pj4+Pj4+ICvCoMKgwqAgc3BpbmxvY2tfdCAqb2xkX3B0bCwgKm5ld19wdGw7Cj4+Pj4+PiArwqDC
oMKgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gdm1hLT52bV9tbTsKPj4+Pj4+ICsKPj4+Pj4+ICvC
oMKgwqAgaWYgKChvbGRfYWRkciAmIH5QTURfTUFTSykgfHwgKG5ld19hZGRyICYgflBNRF9NQVNL
KQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHx8IG9sZF9lbmQgLSBvbGRfYWRkciA8IFBNRF9TSVpF
KQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+Pj4+ICsKPj4+Pj4+ICvC
oMKgwqAgLyoKPj4+Pj4+ICvCoMKgwqDCoCAqIFRoZSBkZXN0aW5hdGlvbiBwbWQgc2hvdWxkbid0
IGJlIGVzdGFibGlzaGVkLCBmcmVlX3BndGFibGVzKCkKPj4+Pj4+ICvCoMKgwqDCoCAqIHNob3Vs
ZCBoYXZlIHJlbGVhc2UgaXQuCj4+Pj4+PiArwqDCoMKgwqAgKi8KPj4+Pj4+ICvCoMKgwqAgaWYg
KFdBUk5fT04oIXBtZF9ub25lKCpuZXdfcG1kKSkpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIGZhbHNlOwo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCAvKgo+Pj4+Pj4gK8KgwqDCoMKgICog
V2UgZG9uJ3QgaGF2ZSB0byB3b3JyeSBhYm91dCB0aGUgb3JkZXJpbmcgb2Ygc3JjIGFuZCBkc3QK
Pj4+Pj4+ICvCoMKgwqDCoCAqIHB0bG9ja3MgYmVjYXVzZSBleGNsdXNpdmUgbW1hcF9zZW0gcHJl
dmVudHMgZGVhZGxvY2suCj4+Pj4+PiArwqDCoMKgwqAgKi8KPj4+Pj4+ICvCoMKgwqAgb2xkX3B0
bCA9IHBtZF9sb2NrKHZtYS0+dm1fbW0sIG9sZF9wbWQpOwo+Pj4+Pj4gK8KgwqDCoCBpZiAob2xk
X3B0bCkgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHBtZF90IHBtZDsKPj4+Pj4+ICsKPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBuZXdfcHRsID0gcG1kX2xvY2twdHIobW0sIG5ld19wbWQpOwo+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChuZXdfcHRsICE9IG9sZF9wdGwpCj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2tfbmVzdGVkKG5ld19wdGwsIFNJTkdMRV9ERVBUSF9O
RVNUSU5HKTsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBDbGVhciB0aGUgcG1k
ICovCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcG1kID0gKm9sZF9wbWQ7Cj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgcG1kX2NsZWFyKG9sZF9wbWQpOwo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIFZNX0JVR19PTighcG1kX25vbmUoKm5ld19wbWQpKTsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCAvKiBTZXQgdGhlIG5ldyBwbWQgKi8KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBz
ZXRfcG1kX2F0KG1tLCBuZXdfYWRkciwgbmV3X3BtZCwgcG1kKTsKPj4+Pj4gVU1MIGRvZXMgbm90
IGhhdmUgc2V0X3BtZF9hdCBhdCBhbGwKPj4+PiBFdmVyeSBhcmNoaXRlY3R1cmUgZG9lcy4gOikK
Pj4+IEkgdHJpZWQgdG8gYnVpbGQgaXQgcGF0Y2hpbmcgdnMgNC4xOS1yYyBiZWZvcmUgSSBtYWRl
IHRoaXMgc3RhdGVtZW50IGFuZAo+Pj4gcmFuIGludG8gdGhhdC4KPj4+Cj4+PiBQcmVzZW50bHkg
aXQgZG9lcyBub3QuCj4+Pgo+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjQu
MTktcmM3L2lkZW50L3NldF9wbWRfYXQgLSBVTUwgaXMgbm90Cj4+PiBvbiB0aGUgbGlzdC4KPj4g
T25jZSB0aGlzIHByb2JsZW0gYXMgd2VsbCBhcyB0aGUgb21pc3Npb25zIGluIHRoZSBpbmNsdWRl
IGNoYW5nZXMgZm9yIFVNTCBpbgo+PiBwYXRjaCBvbmUgaGF2ZSBiZWVuIGZpeGVkIGl0IGFwcGVh
cnMgdG8gYmUgd29ya2luZy4KPj4KPj4gV2hhdCBpdCBuZWVkcyBpcyBhdHRhY2hlZC4KPiBXZWxs
LCB0aGUgb3B0aXphdGlvbiBpcyBvbmx5IHN1aXRhYmxlIGZvciBhcmNoIHRoYXQgaGFzIDMgb3Ig
bW9yZSBsZXZlbHMKPiBvZiBwYWdlIHRhYmxlcy4gT3RoZXJ3aXNlIGl0IHdpbGwgbm90IGhhdmUg
W25vbi1mb2xkZWRdIHBtZC4KPgo+IEFuZCBpbiB0aGlzIGNhc2UgYXJjaC91bSBhbHJlYWR5IHNo
b3VsZCBoYXZlIHNldF9wbWRfYXQoKSwgc2VlCj4gM19MRVZFTF9QR1RBQkxFUy4KPgo+IFRvIHBv
cnQgb24gMi1sZXZlbCBwYWdpbmcsIGl0IGhhcyB0byBiZSBoYW5kbGVkIG9uIHBnZCBsZXZlbC4g
SXQKPiBjb21wbGljYXRlcyB0aGUgY29kZSBhbmQgd2lsbCBub3QgYnJpbmcgbXVjaCB2YWx1ZS4K
PgpVTUwgaGFzIDMgbGV2ZWwgcGFnZSB0YWJsZXMgb24gNjQgYml0LgoKQS4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
