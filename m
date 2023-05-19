Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35579C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AdfUEOGv8uHoluQMbDYeulRoybOEe2Wir2xUTQ/L9U0=; b=OMionvHg0Cmq0F
	oL3JwmrARmr9hKRcbfIbRBxdZA6Y/NQI/4xX9K+okj/4PWnIwcLh3fB4xp9I2UH3zOkuK8QMpERWT
	BRKy+21Z7g7FbFv1CNtBKnGlkftwQdCZ6rtTtOAsABun8C0AZ0j0Ygco55LXqithm2g/8DSk5Smdi
	5NsHBMpTx0gl90nkCSaUt78W0ijMz+wZ4JV1IqqHR/8ApqqAl8y6FrvCaOCnCLHIYI/lduovKw7VA
	kaEUnmdx0/j5k7vWv61dBoDRKNLhglsI0SxNp7xyEz5tcI3fS8byzy/BoAbPGEBSUmBI+s0sJqQAs
	1Xv1vHi0pniic1rtKKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q03Mh-00GmAA-0L;
	Fri, 19 May 2023 16:54:03 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q03Md-00Gm8V-39
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 16:54:01 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id C366F5C0096;
	Fri, 19 May 2023 12:53:57 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 19 May 2023 12:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1684515237; x=1684601637; bh=yhZY0s/47MOrcmNsSFhuJoECsMYmmsbPIqp
	0mRoiHMk=; b=bmwkQjhbHOWz5dV5Cd6mu/m1Neq0V0I8nt1NOZCDWzG5SRkJ7bj
	P68sMNZ1n2l+nY1r9MAUb1Qjku3q93PCLHKXv+K7IE8q6bhUeFiY1i5kpand7kjc
	ojYi3fDh5X0LikoQ8VmE4g6FzhYGPwLPDguwcol0BIEdrBKhwZECKa533dwog1tR
	0Nfp6RB1q+JkmYzufde6dET3U5w2gRAFC5L8bmKWFR5jyt20wB/s5DXZP/l/e8fi
	jXi1jjDcLp3xUIIQ2q/vkvOX6iRGi75+ILf14+HoEI9SyJmE/WWqUQFWmKngM1fV
	KVvpvSOm2oaFxHBNNRsxceKvI26Si1OlNHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684515237; x=1684601637; bh=yhZY0s/47MOrcmNsSFhuJoECsMYmmsbPIqp
	0mRoiHMk=; b=F/0hcqq3GiXxzveFwLkngpTXJrLwBoVWdcv09xFv0ZX1dnxfv+y
	n02DKYYcVysDM2IOCJu2W3bszb3AqbxenpZjIo8GLvM+wHb9LaaCSCS6vEq6EJbj
	70EZzC0OP2uK6ursqDFKVlgGQx+mKlp8jP+aTAF5vEWKVRlo8tUgv9SqIyjyQoEp
	g+5p3mhRKa9KJrAcIxmsCxcLG0WlSqdT3Wf5hf7NWGmQaYr7Gt2K5DjIf/RLWhtZ
	uEvHq0qz2UtPL3cVtwN4/KrgjzbwFWyUvhPaKiZ4sUzTjNf7NWL/QZhy0esXi8Zi
	2QPBNg4ihcPjrO1NBN5kNwXL3m7Res3pZ8w==
X-ME-Sender: <xms:pKlnZCsKXBbX9H4L8l8SHtogv6ii6vS30a0u8eCH6Lz1ex4fb2X-Jg>
    <xme:pKlnZHcS7SeVLxk4boyMugJhzY0NCSoYUoQHR2z21JdcRox37Ynz8Kd1xEiiPwlYo
    wExlK4RVo_S1c9PX9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeihedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:pKlnZNwenC2zJcSOrrTY2u7bmCAtug-BuVNWhdGMFXVY_oXUsrfRXA>
    <xmx:pKlnZNM35i5RBk3sYR4mdXrapO59bM1e3WLlV0juzyqDQMaEqpufcA>
    <xmx:pKlnZC8b9XqAgA5BkwPs-vM-_W3fRY5c1FuMBRVRid5HaiENG-srKw>
    <xmx:palnZBeehye73N8PsLdavUwIa4rA3f8ZFvaEZq2vbHa1CT6TCMNo7A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ED0CCB6008D; Fri, 19 May 2023 12:53:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-431-g1d6a3ebb56-fm-20230511.001-g1d6a3ebb
Mime-Version: 1.0
Message-Id: <a9fcf1ad-a387-42a7-957a-e5a6a36fb3d7@app.fastmail.com>
In-Reply-To:  <CAJF2gTRO8Qcz2EXz-ZAczpTj=Lm=GPO-UQMPqCRdqrfjg8sXbA@mail.gmail.com>
References: <mhng-24855381-7da8-4c77-bcaf-a3a53c8cb38b@palmer-ri-x1c9>
 <556bebad-3150-4fd5-8725-e4973fd6edd1@app.fastmail.com>
 <CAJF2gTRO8Qcz2EXz-ZAczpTj=Lm=GPO-UQMPqCRdqrfjg8sXbA@mail.gmail.com>
Date: Fri, 19 May 2023 18:53:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>
Cc: "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Jisheng Zhang" <jszhang@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Anup Patel" <apatel@ventanamicro.com>,
 "Atish Patra" <atishp@atishpatra.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Anup Patel" <anup@brainfault.org>, shihua@iscas.ac.cn,
 jiawei@iscas.ac.cn, liweiwei@iscas.ac.cn, luxufan@iscas.ac.cn,
 chunyu@iscas.ac.cn, tsu.yubo@gmail.com, wefu@redhat.com,
 wangjunqiang@iscas.ac.cn, kito.cheng@sifive.com,
 "Andy Chiu" <andy.chiu@sifive.com>,
 "Vincent Chen" <vincent.chen@sifive.com>,
 "Greentime Hu" <greentime.hu@sifive.com>,
 "Jonathan Corbet" <corbet@lwn.net>, wuwei2016@iscas.ac.cn,
 "Jessica Clarke" <jrtc27@jrtc27.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Guo Ren" <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH 00/22] riscv: s64ilp32: Running 32-bit Linux kernel on 64-bit
 supervisor mode
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_095400_347577_9CE77135 
X-CRM114-Status: GOOD (  27.57  )
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

T24gRnJpLCBNYXkgMTksIDIwMjMsIGF0IDE3OjMxLCBHdW8gUmVuIHdyb3RlOgo+IE9uIEZyaSwg
TWF5IDE5LCAyMDIzIGF0IDI6MjnigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3
cm90ZToKPj4gT24gVGh1LCBNYXkgMTgsIDIwMjMsIGF0IDE3OjM4LCBQYWxtZXIgRGFiYmVsdCB3
cm90ZToKPj4gPiBPbiBUaHUsIDE4IE1heSAyMDIzIDA2OjA5OjUxIFBEVCAoLTA3MDApLCBndW9y
ZW5Aa2VybmVsLm9yZyB3cm90ZToKPj4KPj4gSWYgZm9yIHNvbWUgY3JhenkgcmVhc29uIHlvdSdk
IHN0aWxsIHdhbnQgdGhlIDY0aWxwMzIgQUJJIGluIHVzZXIKPj4gc3BhY2UsIHJ1bm5pbmcgdGhl
IGtlcm5lbCB0aGlzIHdheSBpcyBwcm9iYWJseSBzdGlsbCBhIGJhZCBpZGVhLAo+PiBidXQgdGhh
dCBvbmUgaXMgbGVzcyBjbGVhci4gVGhlcmUgaXMgY2xlYXJseSBhIHNtYWxsIG1lbW9yeQo+PiBw
ZW5hbHR5IG9mIHJ1bm5pbmcgYSA2NC1iaXQga2VybmVsIGZvciBsYXJnZXIgZGF0YSBzdHJ1Y3R1
cmVzCj4+IChwYWdlLCBpbm9kZSwgdGFza19zdHJ1Y3QsIC4uLikgYW5kIHZtbGludXgsIGFuZCB0
aGVyZSBpcyBubwo+IEkgZG9uJ3QgdGhpbmsgaXQncyBhIHNtYWxsIG1lbW9yeSBwZW5hbHR5LCBv
dXIgbWVhc3VyZW1lbnQgaXMgYWJvdXQKPiAxNiUgd2l0aCBkZWZjb25maWcsIHNlZSAiV2h5IDMy
LWJpdCBMaW51eD8iIHNlY3Rpb24uCj4KPiBUaGlzIHBhdGNoIHNlcmllcyBkb2Vzbid0IGFkZCA2
NGlscDMyIHVzZXJzcGFjZSBhYmksIGJ1dCBpdCBzZWVtcyB5b3UKPiBhbHNvIGRvbid0IGxpa2Ug
dG8gcnVuIDMyLWJpdCBMaW51eCBrZXJuZWwgb24gNjQtYml0IGhhcmR3YXJlLCByaWdodD8KCk9r
LCBJJ20gc29ycnkgZm9yIG1pc3NpbmcgdGhlIGltcG9ydGFudCBiaXQgaGVyZS4gU28gaWYgdGhp
cyBjYW4Kc3RpbGwgdXNlIHRoZSBub3JtYWwgMzItYml0IHVzZXIgc3BhY2UsIHRoZSBjb3N0IG9m
IHRoaXMgcGF0Y2ggc2V0CmlzIG5vdCBodWdlLCBhbmQgaXQncyBzb21ldGhpbmcgdGhhdCBjYW4g
YmUgYmVuZWZpY2lhbCBpbiBhIGZldwpjYXNlcywgdGhvdWdoIEkgc3VzcGVjdCBtb3N0IHVzZXJz
IGFyZSBzdGlsbCBiZXR0ZXIgb2ZmIHJ1bm5pbmcKNjQtYml0IGtlcm5lbHMuCgo+IFRoZSBtb3Rp
dmF0aW9uIG9mIHM2NGlscDMyIChydW5uaW5nIDMyLWJpdCBMaW51eCBrZXJuZWwgb24gNjQtYml0
IHMtbW9kZSk6Cj4gIC0gVGhlIHRhcmdldCBoYXJkd2FyZSAoQ2FuYWFuIEtlbmRyeXRlIGsyMzAp
IG9ubHkgc3VwcG9ydHMgTVhMPTY0LAo+IFNYTD02NCwgVVhMPTY0LzMyLgo+ICAtIFRoZSA2NC1i
aXQgTGludXggKyBjb21wYXQgMzItYml0IGFwcCBjYW4ndCBzYXRpc2Z5IHRoZSA2NC8xMjhNQiBz
Y2VuYXJpb3MuCj4KPj4gaHVnZSBhZGRpdGlvbmFsIG1haW50ZW5hbmNlIGNvc3Qgb24gdG9wIG9m
IHRoZSBBQkkgaXRzZWxmCj4+IHRoYXQgeW91J2QgbmVlZCBlaXRoZXIgd2F5LCBidXQgdXNpbmcg
YSA2NC1iaXQgYWRkcmVzcyBzcGFjZQo+PiBpbiB0aGUga2VybmVsIGhhcyBzb21lIGltcG9ydGFu
dCBhZHZhbnRhZ2VzIGV2ZW4gd2hlbiBydW5uaW5nCj4+IDMyLWJpdCB1c2VybGFuZDogcHJvY2Vz
c2VzIGNhbiB1c2UgdGhlIGVudGlyZSA0R0IgdmlydHVhbAo+PiBzcGFjZSwgd2hpbGUgdGhlIGtl
cm5lbCBjYW4gYWRkcmVzcyBtb3JlIHRoYW4gNzY4TUIgb2YgbG93bWVtLAo+PiBhbmQgS0FTTFIg
aGFzIG1vcmUgYml0cyB0byB3b3JrIHdpdGggZm9yIHJhbmRvbWl6YXRpb24uIE9uCj4+IFJJU0NW
LCBzb21lIGFkZGl0aW9uYWwgZmVhdHVyZXMgKFZNQVBfU1RBQ0ssIEtBU0FOLCBLRkVOQ0UsCj4+
IC4uLikgZGVwZW5kIG9uIDY0LWJpdCBrZXJuZWxzIGV2ZW4gdGhvdWdoIHRoZXkgZG9uJ3QKPj4g
c3RyaWN0bHkgbmVlZCB0aGF0Lgo+Cj4gSSBhZ3JlZSB0aGF0IHRoZSA2NC1iaXQgbGludXgga2Vy
bmVsIGhhcyBtb3JlIGZ1bmN0aW9uYWxpdGllcywgYnV0Ogo+ICAtIFdoYXQgZG8geW91IHRoaW5r
IGFib3V0IGxpbnV4IG9uIGEgNjQvMTI4TUIgU29DPyBDb3VsZCBpdCBiZQo+IGFmZm9yZGFibGUg
dG8gVk1BUF9TVEFDSywgS0FTQU4sIEtGRU5DRT8KCkkgd291bGQgZGVmaW5pdGVseSByZWNvbW1l
bmQgVk1BUF9TVEFDSywgYnV0IHRoYXQgY2FuIGJlIGltcGxlbWVudGVkCmFuZCBpcyB1c2VkIG9u
IG90aGVyIDMyLWJpdCBhcmNoaXRlY3R1cmVzIChwcGMzMiwgYXJtMzIpIHdpdGhvdXQgYQpodWdl
IGNvc3QuIFRoZSBsYXJnZXIgdmlydHVhbCB1c2VyIGFkZHJlc3Mgc3BhY2UgY2FuIGhlbHAgZXZl
biBvbgptYWNoaW5lcyB3aXRoIDEyOE1CLCB0aG91Z2ggbW9zdCBhcHBsaWNhdGlvbnMgcHJvYmFi
bHkgZG9uJ3QgY2FyZSBhdAp0aGF0IHBvaW50LgoKPiAgLSBJIHRoaW5rIDMyLWJpdCBMaW51eCAm
IFJUT1MgaGF2ZSBtb25vcG9saXplZCB0aGlzIG1hcmtldCAoNjQvMTI4TUIKPiBzY2VuYXJpb3Mp
LCByaWdodD8KClRoZSBtaW5pbXVtIGFtb3VudCBvZiBSQU0gdGhhdCBtYWtlcyBhIHN5c3RlbSB1
c2FibGUgZm9yIExpbnV4IGlzCmNvbnN0YW50bHkgZ29pbmcgdXAsIHNvIEkgdGhpbmsgd2l0aCA2
NE1CLCBtb3N0IG5ldyBwcm9qZWN0cyBhcmUKYWxyZWFkeSBiZXR0ZXIgb2ZmIHJ1bm5pbmcgc29t
ZSBSVE9TIGtlcm5lbCBpbnN0ZWFkIG9mIExpbnV4LgpUaGUgb25lcyB0aGF0IGFyZSBzdGlsbCB1
c2FibGUgdG9kYXkgcHJvYmFibHkgd29uJ3QgbGFzdCBhIGxvdApvZiBkaXN0cm8gdXBncmFkZXMg
YmVmb3JlIHRoZSBibG9hdCBjYXRjaGVzIHVwIHdpdGggdGhlbSwgYnV0IEkKY2FuIHNlZSBob3cg
eW91ciBwYXRjaCBzZXQgY2FuIGdpdmUgdGhlbSBhIGZldyBleHRyYSB5ZWFycyBvZgp1cGRhdGVz
LgoKRm9yIHRoZSAyNTZNQisgc3lzdGVtcywgSSB3b3VsZCBleHBlY3QgdGhlIHNlbnNpdGl2ZSBr
ZXJuZWwKYWxsb2NhdGlvbnMgdG8gYmUgc21hbGwgZW5vdWdoIHRoYXQgdGhlIHNlcmllcyBtYWtl
cyBsaXR0bGUKZGlmZmVyZW5jZS4gVGhlIDEyOE1CIHN5c3RlbXMgYXJlIHRoZSBtb3N0IGludGVy
ZXN0aW5nIG9uZXMKaGVyZSwgYW5kIEknbSBjdXJpb3VzIHRvIHNlZSB3aGVyZSB5b3Ugc3BvdCBt
b3N0IG9mIHRoZQptZW1vcnkgdXNhZ2UgZGlmZmVyZW5jZXMsIEknbGwgYWxzbyByZXBseSB0byB5
b3VyIGluaXRpYWwKbWFpbCBmb3IgdGhhdC4KCiAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
