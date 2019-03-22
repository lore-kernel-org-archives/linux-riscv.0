Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AEAC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 14:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 212BC20883
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 14:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A2aAZNJI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 212BC20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gn8NXPtJR6zdl3uixFD+zxwVldnb6bqldGRpUigT6Gg=; b=A2aAZNJIWaiXFjRfQg1+CnwYT
	Tvwo4b5kz8JgPcR1ZASTFywaLlGK4wBW3vB+j/0Lpqz7J6M71cC8caHZQKo55onNrj1EkPPV8ZNeX
	6UKf+rRN3VvZQ540Jz/HDV7MpKoIZjEct5338kQ8G0CUdGc7cHvNVI7stXrPBJ75cIgWaG9CJgvOd
	5ILlT9zZvj993tx8agSvVKwMJRiR6T39eTXzu31EJN98VYK+8XZBqLmaPCfzCRFxQKa/MLfX9DHgL
	Rd9TUP8gG3Lzdjqk20wePU+O+EVaW4lBDlbsI5vAUva35lvWIp+O/Ty5vkO9BOpyO4nSMY3R6b6P3
	paUQf8Yew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7LWe-0004Qx-RH; Fri, 22 Mar 2019 14:52:04 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7LWZ-0004Pu-Va; Fri, 22 Mar 2019 14:52:03 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x2MEpZXZ018840; Fri, 22 Mar 2019 14:51:37 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-82-5c94f676563f
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 8D.19.09052.676F49C5; Fri, 22 Mar 2019 16:51:35 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x2MEpXQv022466; Fri, 22 Mar 2019 16:51:33 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 22 Mar 2019 16:51:33 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
Organization: FORTH
In-Reply-To: <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
Message-ID: <06e2cd9f9dbaf01fec2f910ebb402c2d@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LpjmZU1i3/NiXGoOUDi8X5aafYLN4v62G0
 uP7tDaPFpsfXWC22fW5hs2h+d47dYvOEBawWbbP4LT7s+Mts8fLjCRYHLo8189YweuycdZfd
 4+GmS0weT65MZ/LYvKTe48bvXnaPS83X2QPYo7hsUlJzMstSi/TtErgyHv6bxVowWbTiyMcf
 rA2M9wS6GDk5JARMJO69eM/SxcjFISRwhFHi+6mvTBDOIUaJKUfWMEFUmUrM3tvJCGLzCghK
 nJz5hAXEZhawkJh6ZT8jhC0v0bx1NjOIzSKgKrHpfAc7iM0moCkx/9JBsHoRAR2JeSsOsIEs
 YBb4wCTRdewwWIOwgKzEobd3wYr4BYQlPt29yApicwp4SPz9O4EV4qJ1zBKzOmcwQ1zhItE2
 sY8F4joViQ+/H4BtExVQlnhxYjrrBEahWUiOnYXk2FlIjl3AyLyKUSCxzFgvM7lYLy2/qCRD
 L71oEyM4gub67mA8t8D+EKMAB6MSD++KGf0xQqyJZcWVucCg4WBWEuG19wQK8aYkVlalFuXH
 F5XmpBYfYpTmYFES5z38IjxISCA9sSQ1OzW1ILUIJsvEwSnVwBjY6RI7686Zd2eW/9xe+Mhd
 2TOlr1t/5h6tJ9fmMQZkrM2Q8O6tW6NdfFG2U2l34WfOjO3ny5omnWiof5u66cu2L/KTYu1f
 OOxNnsJby8xYKiwnPvUQx2FXV1dljSM9vXtE1vd+itk7jVmp8dLPrgVMNQuKeSaItvxs7gqM
 M+1+UnIr1nW7nhJLcUaioRZzUXEiAFTfnzGcAgAA
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Fri, 22 Mar 2019 14:51:37 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Fri, 22 Mar 2019 14:51:37 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_075200_391396_610C4287 
X-CRM114-Status: GOOD (  17.47  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 catalin.marinas@arm.com, Nick Kossifidis <mick@ics.forth.gr>,
 Christopher Lameter <cl@linux.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAxOS0wMy0xMSAxNzoyNiwgUGF1bCBXYWxtc2xleSDOrc6zz4HOsc+IzrU6Cj4g
KyB0aGUgQVJNNjQgZ3V5cyBhbmQgbGFrbWwKPiAKPiBPbiBNb24sIDExIE1hciAyMDE5LCBCasO2
cm4gVMO2cGVsIHdyb3RlOgo+IAo+PiBPbiBNb24sIDExIE1hciAyMDE5IGF0IDE1OjU2LCBDaHJp
c3RvcGhlciBMYW1ldGVyIDxjbEBsaW51eC5jb20+IAo+PiB3cm90ZToKPj4gPgo+PiA+IE9uIE1v
biwgMTEgTWFyIDIwMTksIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+ID4KPj4gPiA+ID4gVGhhbmtz
IGEgYnVuY2ghICBJIGZlZWwgbGlrZSB0aGUgYmVzdCBvcHRpb24gaGVyZSBpcyB0byBqdXN0IHVz
ZSB0aGUgQU1Pcwo+PiA+ID4gPiB3aXRob3V0IGRpc2FibGluZyBwcmVlbXB0aW9uIGFuZCBlbnN1
cmluZyB0aGF0IGFsbCBvdGhlciBhY2Nlc3NlcyBhcmUgYXRvbWljCj4+ID4gPiA+ICh2aWEgQU1P
cyBvciBMUi9TQykuICBUaGUgb25seSByZWFzb24gSSBjYW4gc2VlIHRoYXQgd291bGRuJ3QgYmUg
dGhlIHdheSB0byBnbwo+PiA+ID4gPiB3b3VsZCBiZSBpZiBpdCByZXF1aXJlcyBub24tYXJjaCBt
b2RpZmljYXRpb25zLCBhcyBpZiB3ZSBnbyBkb3duIHRoYXQgcGF0aAo+PiA+ID4gPiB3ZSdsbCBi
ZSBhYmxlIHRvIGhhbmRsZSB0aGUgcGVyZm9ybWFuY2UgZWRnZSBjYXNlcyBpbiB0aGUgaW1wbGVt
ZW50YXRpb24uCj4+ID4gPiA+Cj4+ID4gPgo+PiA+ID4gSG1tLCB5b3UgbWVhbiBBTU8gKndpdGgq
IHByZWVtcHRfe2Rpcyxlbn1hYmxlLCByaWdodD8gKE5vLCBpbnRlcnJ1cHQKPj4gPiA+IGRpc2Fi
bGUsIG9ubHkgcHJlZW1wdGlvbi4pCj4+ID4KPj4gPiBJZiB5b3UgZGlzYWJsZSBwcmVlbXB0aW9u
IHRoZW4geW91IGRvbnQgbmVlZCBBTU8gYW55bW9yZS4gSW4gZmFjdCB0aGF0IGlzCj4+ID4gdGhl
IGRlZmF1bHQgZmFsbGJhY2sgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbi4gSnVzdCBkb250IGRvIGFu
eXRoaW5nIGFuZCB5b3UKPj4gPiBhbHJlYWR5IGhhdmUgdGhhdCBzb2x1dGlvbi4KPj4gCj4+IEJ1
dCB0aGUgZ2VuZXJpYyBvbmUgZGlzYWJsZXMgaW50ZXJydXB0cywgcmlnaHQ/Cj4+IAo+PiBJIGJl
bGlldmUgdGhlIHJhdGlvbmFsIGZvciBSViBpcyBzaW1pbGFyIHRvIEFSTSdzOyBBTU8rcHJlZW1w
dGlvbgo+PiBkaXNhYmxlIHJlZ2lvbnMgaXMgKnNsaWdodGx5KiBiZXR0ZXIgdGhhbiB0aGUgZ2Vu
ZXJpYywgYnV0IG5vdCBhcyBnb29kCj4+IGFzIHRoZSBJQSBvbmUuIE9yIGFtIEkgbWlzc2luZyBz
b21ldGhpbmc/Cj4gCj4gVGhlcmUncyBiZWVuIGEgZGlzY3Vzc2lvbiBnb2luZyBvbiBpbiBhIHBy
aXZhdGUgdGhyZWFkIGFib3V0IHRoaXMgdGhhdCAKPiBJCj4gdW5mb3J0dW5hdGVseSBkaWRuJ3Qg
YWRkIHlvdSB0by4gIFRoZSBkaXNjdXNzaW9uIGlzIHN0aWxsIG9uZ29pbmcsIGJ1dCAKPiBJCj4g
dGhpbmsgQ2hyaXN0b3BoIGFuZCBteXNlbGYgYW5kIGEgZmV3IG90aGVyIGZvbGtzIGhhdmUgYWdy
ZWVkIHRoYXQgdGhlCj4gcHJlZW1wdF9kaXNhYmxlL2VuYWJsZSBpcyBub3QgbmVlZGVkIGZvciB0
aGUgYW1vYWRkIGFwcHJvYWNoLiAgVGhpcyBpcwo+IHNpbmNlIHRoZSBhcHBhcmVudCBpbnRlbnRp
b24gb2YgdGhlIHByZWVtcHRpb24gZGlzYWJsZS9lbmFibGUgaXMgdG8gCj4gZW5zdXJlCj4gdGhl
IGNvcnJlY3RuZXNzIG9mIHRoZSBjb3VudGVyIGluY3JlbWVudDsgaG93ZXZlciB0aGVyZSBpcyBu
byByaXNrIG9mCj4gaW5jb3JyZWN0bmVzcyBpbiBhbiBhbW9hZGQgc2VxdWVuY2Ugc2luY2UgdGhl
IGF0b21pYyBhZGQgaXMgbG9ja2VkIAo+IGFjcm9zcwo+IGFsbCBvZiB0aGUgY2FjaGUgY29oZXJl
bmN5IGRvbWFpbi4gIENocmlzdG9waCwgd291bGQgeW91IGRpc2FncmVlIHdpdGgKPiB0aGF0IGNo
YXJhY3Rlcml6YXRpb24/Cj4gCgpTb21lIGZ1cnRoZXIgaW5wdXQgb24gdGhpcy4uLgoKaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9wcmVlbXB0LWxvY2tpbmcudHh0Cgoi
Tm90ZSB0aGF0IHlvdSBkbyBub3QgbmVlZCB0byBleHBsaWNpdGx5IHByZXZlbnQgcHJlZW1wdGlv
biBpZiB5b3UgYXJlIApob2xkaW5nCmFueSBsb2NrcyBvciBpbnRlcnJ1cHRzIGFyZSBkaXNhYmxl
ZCwgc2luY2UgcHJlZW1wdGlvbiBpcyBpbXBsaWNpdGx5IApkaXNhYmxlZAppbiB0aG9zZSBjYXNl
cy4KCkJ1dCBrZWVwIGluIG1pbmQgdGhhdCAnaXJxcyBkaXNhYmxlZCcgaXMgYSBmdW5kYW1lbnRh
bGx5IHVuc2FmZSB3YXkgb2YKZGlzYWJsaW5nIHByZWVtcHRpb24gLSBhbnkgY29uZF9yZXNjaGVk
KCkgb3IgY29uZF9yZXNjaGVkX2xvY2soKSBtaWdodCAKdHJpZ2dlcgphIHJlc2NoZWR1bGUgaWYg
dGhlIHByZWVtcHQgY291bnQgaXMgMC4gQSBzaW1wbGUgcHJpbnRrKCkgbWlnaHQgdHJpZ2dlciAK
YQpyZXNjaGVkdWxlLiBTbyB1c2UgdGhpcyBpbXBsaWNpdCBwcmVlbXB0aW9uLWRpc2FibGluZyBw
cm9wZXJ0eSBvbmx5IGlmIAp5b3UKa25vdyB0aGF0IHRoZSBhZmZlY3RlZCBjb2RlcGF0aCBkb2Vz
IG5vdCBkbyBhbnkgb2YgdGhpcy4gQmVzdCBwb2xpY3kgaXMgCnRvIHVzZQp0aGlzIG9ubHkgZm9y
IHNtYWxsLCBhdG9taWMgY29kZSB0aGF0IHlvdSB3cm90ZSBhbmQgd2hpY2ggY2FsbHMgbm8gCmNv
bXBsZXgKZnVuY3Rpb25zLiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
