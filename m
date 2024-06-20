Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E04C2BA18
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 00:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JBP5+/V94CRJRtraZOdZV80gAh6RTya2srei2o3QTE=; b=2/6wZqv4oZpqtv
	l/Rv1kGZDGlSM/I+ee5A2fyTFgkMm6sEkpUdVDaqcAOSCY/jO1RwvCtoKaeq9mxXwrajkk2MGu4vf
	xCvensH9gbOu3D79z5DjXFYAld81RkaOSfWrf3nsU2DInDRNBInzMJUkQLDDDfpp4vMF1Ac5QLb3w
	37QCt7NLpDWRDF0zB00CHvjzryB9F96S2rfM5JAniaM+noDo8cdRnFud24q4G6Va8ZfvGIpao7JcB
	77zXltXSx2AcWu7N9et6U0hCTldcLocqiHA2bn6HgYsGdyajfEPNc1dzE22+j+n5NzjltPUFSIr7X
	H682PrzBH33ZqbZpqawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKRrq-00000007BqK-08kJ;
	Fri, 21 Jun 2024 00:11:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKRrn-00000007BpO-1H39
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 00:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A364FCE1D33;
	Fri, 21 Jun 2024 00:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7A5C2BD10;
	Fri, 21 Jun 2024 00:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718928655;
	bh=DVc+oZ8IpmajrWn8uMMOY6RL2NOLHfDxJNeCdHePKgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWUZpZhkar/bqgnu5QJIUR2WDZmrEDCqDQl/Wt9gCmNpuMJLA8RZ7aFzGwtt6L6lU
	 X7/5/EvkILpOcBMSMR8MmL77N5k+UcTmddkUN998iHeaxqq/0byRHWYbIZ+XpYsN+c
	 DEW/vRk9M0Z/yRExKwYEvfxTwndWbskG9LwaDC0zAqptY3Y+d2BInEYenQ2ul33HWF
	 /un6QR868O/pDMl5JRnh0qbCtPygFX+30BM9qnZIRbat6ekFDNveQH7HK6tfgun0g6
	 DlpLrcuAbNwWctRWfbk0kvmyAib6nuI/G05ioQ84d6s9DGxnWIq2bHu8JrYWsu10tr
	 ZYh4Ylb90JT7g==
Date: Fri, 21 Jun 2024 07:56:56 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Cyril Bur <cyrilbur@tenstorrent.com>, Deepak Gupta <debug@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] riscv: convert bottom half of exception handling to C
Message-ID: <ZnTByNTDWnVdtiDr@xhacker>
References: <20240616170553.2832-1-jszhang@kernel.org>
 <20240616170553.2832-4-jszhang@kernel.org>
 <ZnMPhcaTKFRbbE1i@debug.ba.rivosinc.com>
 <CANtDSipXbYSuz6NakbXw-8k0_ZN5hdT7VWMushXvQ5VB0Am_Ng@mail.gmail.com>
 <95a081a9-2307-4e5b-8ae2-082be16b327e@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95a081a9-2307-4e5b-8ae2-082be16b327e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_171059_715535_B6DBCA8B 
X-CRM114-Status: GOOD (  24.78  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMTA6MDY6MTVBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2Vy
IHdyb3RlOgo+IAo+IAo+IE9uIDIwLzA2LzIwMjQgMDI6MDIsIEN5cmlsIEJ1ciB3cm90ZToKPiA+
IE9uIFRodSwgSnVuIDIwLCAyMDI0IGF0IDM6MDTigK9BTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBNb24sIEp1biAxNywgMjAyNCBhdCAwMTow
NTo1MEFNICswODAwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4+PiBGb3IgcmVhZGFiaWxpdHks
IG1haW50YWluYWJpbGl0eSBhbmQgZnV0dXJlIHNjYWxhYmlsaXR5LCBjb252ZXJ0IHRoZQo+ID4+
PiBib3R0b20gaGFsZiBvZiB0aGUgZXhjZXB0aW9uIGhhbmRsaW5nIHRvIEMuCj4gPj4+Cj4gPj4+
IE1vc3RseSB0aGUgYXNzZW1ibHkgY29kZSBpcyBjb252ZXJ0ZWQgdG8gQyBpbiBhIHJlbGF0aXZl
bHkKPiA+Pj4gc3RyYWlnaHRmb3J3YXJkIG1hbm5lci4KPiA+Pj4KPiA+Pj4gSG93ZXZlciwgdGhl
cmUgYXJlIHR3byBtb2RpZmljYXRpb25zIEkgbmVlZCB0byBtZW50aW9uOgo+ID4+Pgo+ID4+PiAx
LiB0aGUgQ1NSX0NBVVNFIHJlZyByZWFkaW5nIGFuZCBzYXZpbmcgaXMgbW92ZWQgdG8gdGhlIEMg
Y29kZQo+ID4+PiBiZWNhdXNlIHdlIG5lZWQgdGhlIGNhdXNlIHRvIGRpc3BhdGNoIHRoZSBleGNl
cHRpb24gaGFuZGxpbmcsCj4gPj4+IGlmIHdlIGtlZXAgdGhlIGNhdXNlIHJlYWRpbmcgYW5kIHNh
dmluZywgd2UgZWl0aGVyIHBhc3MgaXQgdG8KPiA+Pj4gZG9fdHJhcHMoKSB2aWEuIDJuZCBwYXJh
bSBvciBnZXQgaXQgZnJvbSBwdF9yZWdzIHdoaWNoIGFuIGV4dHJhCj4gPj4+IG1lbW9yeSBsb2Fk
IGlzIG5lZWRlZCwgSSBkb24ndCBsaWtlIGFueSBvZiB0aGUgdHdvIHNvbHV0aW9ucyBiZWNhc2UK
PiA+Pj4gdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyBzaXRzIGluIGhvdCBjb2RlIHBhdGgsIGV2ZXJ5
IGluc3RydWN0aW9uCj4gPj4+IG1hdHRlcnMuCj4gPj4KPiA+PiBDQzogQ2xlbWVudC4KPiA+Pgo+
ID4+IEkgdGhpbmsgaXRzIGJldHRlciB0byBzYXZlIGF3YXkgY2F1c2UgaW4gcHRfcmVncyBwcmlv
ciB0byBjYWxsaW5nCj4gPj4gYGRvX3RyYXBzYC4gT25jZSBjb250cm9sIGlzIHRyYW5zZmVycmVk
IHRvIEMgY29kZSBpbiBgZG9fdHJhcHNgLAo+ID4+IGFub3RoZXIgdHJhcCBjYW4gaGFwcGVuLiBJ
dCdzIGEgcHJvYmxlbSBhbnl3YXlzIHRvZGF5IHdpdGhvdXQgQ1BVIHN1cHBvcnQuCj4gPj4KPiA+
PiBBbHRob3VnaCB3aXRoIFNzZGJsdHJwIFsxXSBleHRlbnNpb24gYW5kIGl0IGtlcm5lbCBzdXBw
b3J0IFsyXSBmb3IgaXQsCj4gPj4gSSBleHBlY3QgYXNtIGNvZGUgd291bGQgY2xlYXIgdXAgYFNE
VGAgYml0IGluIG1zdGF0dXMuIFdoZW5ldmVyIGBTc2RibHRycGAgbGFuZHMsCgpIaSBEZWVwYWss
IENsw6ltZW50LAoKQ3VycmVudGx5LCBTUl9JRSBiaXQgaXMgaXMgc2V0KHNldHRpbmcgbWVhbnMg
ZW5hYmxlIGlycSkgaW4gYywgY291bGQgdGhlCidTRFQnIGJpdCBiZSBjbGVhcmVkIGluIGMgYXMg
d2VsbCB3aGVuIFNzZGJsdHJwIGxhbmRzPwoKVGhhbmtzCj4gPj4gSSB0aGluayBgZG9fdHJhcHNg
IHNob3VsZCBleHBlY3QgbmVzdGluZyBvZiB0cmFwcyBhbmQgdGh1cyBjYXVzZSBzaG91bGQgYmUg
c2F2ZWQKPiA+PiBhd2F5IGJlZm9yZSBpdCBnZXRzIGNvbnRyb2wgc28gdGhhdCBzYWZlbHkgdHJh
cHMgY2FuIGJlIG5lc3RlZC4KPiAKPiBIaSwKPiAKPiBJbmRlZWQsIGV2ZXJ5IHJlZ2lzdGVyIHRo
YXQgaXMgInVuaXF1ZSIgdG8gYSB0cmFwIGFuZCB0aGFuIGNhbiBiZQo+IG92ZXJ3cml0dGVuIGJ5
IGEgc2Vjb25kIHRyYXAgc2hvdWxkIGJlIHNhdmVkIGJlZm9yZSByZWVuYWJsaW5nIHRoZW0gd2hl
bgo+IHVzaW5nIFNzZGJsdHJwLiBTbyB0aGF0IHdvdWxkIGJlIG5pY2UgdG8gcHJlc2VydmUgdGhh
dC4KPiAKPiA+Pgo+ID4gCj4gPiBJcyBhIHBvc3NpYmxlIHNvbHV0aW9uIHRvIGRvIGJvdGggb3B0
aW9ucyBKaXNoZW5nIHN1Z2dlc3RlZD8gU2F2ZSB0aGUKPiA+IGNhdXNlIGJlZm9yZQo+ID4gY2Fs
bGluZyBkb190cmFwcyBidXQgYWxzbyBwYXNzIGl0IHZpYSBzZWNvbmQgcGFyYW0/Cj4gCj4gSSBn
dWVzcyBzbyBpZiBpdCBmaXRzIHlvdXIgcGVyZm9ybWFuY2UgcmVxdWlyZW1lbnRzLgo+IAo+IFRo
YW5rcywKPiAKPiBDbMOpbWVudAo+IAo+ID4gCj4gPj4gWzFdIC0gaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2L3Jpc2N2LWRvdWJsZS10cmFwL3JlbGVhc2VzL2Rvd25sb2FkL3YxLjAtcmMxL3Jpc2N2
LWRvdWJsZS10cmFwLnBkZgo+ID4+IFsyXSAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI0MDQxODEzMzkxNi4xNDQyNDcxLTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8KPiA+Pgo+ID4+Pgo+
ID4+PiAyLlRvIGNvcGUgd2l0aCBTSUZJVkVfQ0lQXzQ1MyBlcnJhdGEsIGl0IGxvb2tzIGxpa2Ug
d2UgZG9uJ3QgbmVlZAo+ID4+PiBhbHRlcm5hdGl2ZSBtZWNoYW5pc20gYW55IG1vcmUgYWZ0ZXIg
dGhlIGFzbS0+YyBjb252ZXJ0aW9uLiBKdXN0Cj4gPj4+IHJlcGxhY2UgdGhlIGV4Y3BfdmVjdF90
YWJsZSB0d28gZW50cmllcy4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFu
ZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4+Cj4gPj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiA+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
