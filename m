Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEB3C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 15:29:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF6082081D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 15:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bYG/RljU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CXgwzmY0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF6082081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VKIRxD4O7Z4hkmC+noFLqGe8IK3zCKa7YliLa5D/N6o=; b=bYG/RljUaYlGTE/bPmKa7fboQ
	hroATGwls0auqjQOVoIb1iT2RI56IF3x6GAQ1heD3SZOx9z4DVDlVcSTH1rhRLJJq/o5Mk0jLsJ5M
	0ozx6fRIZmeN4Rx5FkdR5yjEUlztFyW2SsEl4HDl83cGkXDAXxjRqu/YkMb6CmK1jxEV0zRd47THT
	bUWHtvLaHUHT7Wx4bvicPeeTv5gNL2zlxZz00/KzVBOjurIzlyp3ASoYDc64d+vx0OlfjZBrBe9mr
	LgBsVmRoeZkUyU7Uztf728IRGIBOEdikktp6Ton8ediHM7O6VK9UPdUZDWFhFmhy7N5RU7xMzgGPk
	myX2XYPzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gK3Hr-00054p-9Q; Tue, 06 Nov 2018 15:29:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK3Hn-00053v-TJ
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 15:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pr2uZz/eE7wTXz11dlbficn7Nqf5c8MJvEkbZSFnzXE=; b=CXgwzmY094BE0BkHjKg3T8hr+b
 U2F4RNvkg1J+ql1/aah1To268Q75ACn1ceW4PvqyRGRL+FTOCX+dmO+unw4O0k8dWQTSFAi+2qCJ8
 4uxfLuF4MNwNtAXu2X10cPc/rR4iWtPvP15xzleQineCe6EyjhN8QAr8nXwDPgfdjwa5lAFNNeJku
 fIpzpr8w9VWjK9odQejBUfRVtqKq48+e1r9sB/QotSxdMoIlQqlYeYgKDk/9ZvNXKJDURpgU5A4yD
 Qu3s/MLJEKHl+qPLjelv11X2NSBzA9S45YC1mKLq+7Z2RPasfUm6dshM7B/Qd0gIwQP6WSv0EdIYC
 PMDjXZ8Q==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK3H7-00083z-VY
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 15:28:20 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wA6FQ49I057756; Tue, 6 Nov 2018 17:26:06 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-c8-5be1b28b8872
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 98.49.03682.B82B1EB5; Tue,  6 Nov 2018 17:26:03 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wA6FQ1r4031576; Tue, 6 Nov 2018 17:26:01 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 06 Nov 2018 17:26:01 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Organization: FORTH
In-Reply-To: <20181106141331.GA28458@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <20181106141331.GA28458@e107155-lin>
Message-ID: <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsXSHc2orNuz6WG0wd0ci21LVrNatHx4x2qx
 aMV3FovW9m9MFvOPnGO1OD1hEZPF5V1z2Cy2fW5hs1h6/SKTRfO7c+wWmycsYLVo3XuE3WL5
 qR0sFps3TWW2eL6yl82B32PP6VnMHmvmrWH0mPr7DIvHw02XmDw2r9Dy2LSqk83j3blz7B6b
 l9R7XGq+zu7xeZOcR/uBbqYA7igum5TUnMyy1CJ9uwSujI2L4gqey1b8OanVwPhKvIuRk0NC
 wETiy6l2NhBbSOAIo8S2C9pdjFxA9kFGidkX+5ghikwlZu/tZASxeQUEJU7OfMICYjMLWEhM
 vbKfEcKWl2jeOhusnkVAVeLO1SZ2EJtNQFNi/qWDYPUiAuoSS85uYQRZwCzQyyyxd9NNsCJh
 AT2Jpg03WUFsfgFhiU93L4LZnAKGEk82z2eEuGgpo0TnqudADgfQFS4Sj7dxQBynIvHh9wOw
 OaICyhIvTkxnncAoNAvJrbOQ3DoLya0LGJlXMQoklhnrZSYX66XlF5Vk6KUXbWIEx+Nc3x2M
 5xbYH2IU4GBU4uHlKHgQLcSaWFZcmXuIUYKDWUmE9/Tqh9FCvCmJlVWpRfnxRaU5qcWHGKU5
 WJTEeQ+/CA8SEkhPLEnNTk0tSC2CyTJxcEo1MLq2OM4pfsvSeuDDBdbOSt+ZDG/krfNOrz9S
 ptm7OX1W6adbi5J4xD/Ucp19WdY4t+yf/87Ad5OX6HhLRMzInfF0EUuikpwDi4ipSPAD7jAD
 RZaTd1iOv4yWOF/1bvKDB+s33tX+5WP5N/VZe5lx3Nvd/NtOfr7wcW3gwY0yN8UFH620zT53
 dqUSS3FGoqEWc1FxIgBlESQSwwIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_152818_227082_486DF9C9 
X-CRM114-Status: GOOD (  28.44  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 alankao@andestech.com, hch@infradead.org, anup@brainfault.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, zong@andestech.com,
 Atish Patra <atish.patra@wdc.com>, robh+dt@kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106152601.gsiSPTXnCH--jYnJ8FHyg5KERPLBK6gPxBs-wF8p4TQ@z>

zqPPhM65z4IgMjAxOC0xMS0wNiAxNjoxMywgU3VkZWVwIEhvbGxhIM6tzrPPgc6xz4jOtToKPiBP
biBGcmksIE5vdiAwMiwgMjAxOCBhdCAwODo1ODozOVBNICswMjAwLCBOaWNrIEtvc3NpZmlkaXMg
d3JvdGU6Cj4+IEhlbGxvIEFsbCwKPj4gCj4+IM6jz4TOuc+CIDIwMTgtMTEtMDIgMDE6MDQsIEF0
aXNoIFBhdHJhIM6tzrPPgc6xz4jOtToKPj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHRoZSBj
cHUgdG9wb2xvZ3kgZm9yIFJJU0MtVi4gSXQgY29udGFpbnMKPj4gPiBib3RoIHRoZSBEVCBiaW5k
aW5nIGFuZCBhY3R1YWwgc291cmNlIGNvZGUuIEl0IGhhcyBiZWVuIHRlc3RlZCBvbgo+PiA+IFFF
TVUgJiBVbmxlYXNoZWQgYm9hcmQuCj4+ID4KPj4gPiBUaGUgaWRlYSBpcyBiYXNlZCBvbiBjcHUt
bWFwIGluIEFSTSB3aXRoIGNoYW5nZXMgcmVsYXRlZCB0byBob3cKPj4gPiB3ZSBkZWZpbmUgU01U
IHN5c3RlbXMuIFRoZSByZWFzb24gZm9yIGFkb3B0aW5nIGEgc2ltaWxhciBhcHByb2FjaAo+PiA+
IHRvIEFSTSBhcyBJIGZlZWwgaXQgcHJvdmlkZXMgYSB2ZXJ5IGNsZWFyIHdheSBvZiBkZWZpbmlu
ZyB0aGUKPj4gPiB0b3BvbG9neSBjb21wYXJlZCB0byBwYXJzaW5nIGNhY2hlIG5vZGVzIHRvIGZp
Z3VyZSBvdXQgd2hpY2ggY3B1cwo+PiA+IHNoYXJlIHRoZSBzYW1lIHBhY2thZ2Ugb3IgY29yZS4g
IEkgYW0gb3BlbiB0byBhbnkgb3RoZXIgaWRlYSB0bwo+PiA+IGltcGxlbWVudCBjcHUtdG9wb2xv
Z3kgYXMgd2VsbC4KPj4gPgo+PiAKPj4gSSB3YXMgYWxzbyBhYm91dCB0byBzdGFydCBhIGRpc2N1
c3Npb24gYWJvdXQgQ1BVIHRvcG9sb2d5IG9uIFJJU0MtVgo+PiBhZnRlciB0aGUgbGFzdCBzd3Rv
b2xzIGdyb3VwIG1lZXRpbmcuIFRoZSBnb2FsIGlzIHRvIHByb3ZpZGUgdGhlCj4+IHNjaGVkdWxl
ciB3aXRoIGhpbnRzIG9uIGhvdyB0byBkaXN0cmlidXRlIHRhc2tzIG1vcmUgZWZmaWNpZW50bHkK
Pj4gYmV0d2VlbiBoYXJ0cywgYnkgcG9wdWxhdGluZyB0aGUgc2NoZWR1bGluZyBkb21haW4gdG9w
b2xvZ3kgbGV2ZWxzCj4+IChodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NC4xOS9p
ZGVudC9zY2hlZF9kb21haW5fdG9wb2xvZ3lfbGV2ZWwpLgo+PiBXaGF0IHdlIHdhbnQgdG8gZG8g
aXMgZGVmaW5lIGNwdSBncm91cHMgYW5kIGFzc2lnbiB0aGVtIHRvCj4+IHNjaGVkdWxpbmcgZG9t
YWlucyB3aXRoIHRoZSBhcHByb3ByaWF0ZSBTRF8gZmxhZ3MKPj4gKGh0dHBzOi8vZ2l0aHViLmNv
bS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9pbmNsdWRlL2xpbnV4L3NjaGVkL3RvcG9sb2d5
LmgjTDE2KS4KPj4gCj4gCj4gT0sgYXJlIHdlIGRlZmluaW5nIGEgQ1BVIHRvcG9sb2d5IGJpbmRp
bmcgZm9yIExpbnV4IHNjaGVkdWxlciA/Cj4gTkFDSyBmb3IgYWxsIHRoZSBhcHByb2FjaGVzIHRo
YXQgYXNzdW1lcyBhbnkga25vd2xlZGdlIG9mIE9TIHNjaGVkdWxlci4KPiAKCklzIHRoZXJlIGFu
eSBzdGFuZGFyZCByZWdhcmRpbmcgQ1BVIHRvcG9sb2d5IG9uIHRoZSBkZXZpY2UgdHJlZSBzcGVj
ID8gCkFzIGZhciBhcwpJIGtub3cgdGhlcmUgaXMgbm9uZS4gV2UgYXJlIHRhbGtpbmcgYWJvdXQg
YSBMaW51eC1zcGVjaWZpYyBEZXZpY2UgVHJlZSAKYmluZGluZwpzbyBJIGRvbid0IHNlZSB3aHkg
ZGVmaW5pbmcgYSBiaW5kaW5nIGZvciB0aGUgTGludXggc2NoZWR1bGVyIGlzIG91dCBvZiAKc2Nv
cGUuCkRvIHlvdSBoYXZlIGNwdS1tYXAgb24gb3RoZXIgT1NlcyBhcyB3ZWxsID8KCj4+IFNvIHRo
ZSBjb3JlcyB0aGF0IGJlbG9uZyB0byBhIHNjaGVkdWxpbmcgZG9tYWluIG1heSBzaGFyZToKPj4g
Q1BVIGNhcGFjaXR5IChTRF9TSEFSRV9DUFVDQVBBQ0lUWSAvIFNEX0FTWU1fQ1BVQ0FQQUNJVFkp
Cj4+IFBhY2thZ2UgcmVzb3VyY2VzIC1lLmcuIGNhY2hlcywgdW5pdHMgZXRjLSAoU0RfU0hBUkVf
UEtHX1JFU09VUkNFUykKPj4gUG93ZXIgZG9tYWluIChTRF9TSEFSRV9QT1dFUkRPTUFJTikKPj4g
Cj4gCj4gVG9vIExpbnV4IGtlcm5lbC9zY2hlZHVsZXIgc3BlY2lmaWMgdG8gYmUgcGFydCBvZiAk
c3ViamVjdAo+IAoKQWxsIGxpc3RzIG9uIHRoZSBjYyBsaXN0IGFyZSBMaW51eCBzcGVjaWZpYywg
YWdhaW4gSSBkb24ndCBzZWUgeW91ciAKcG9pbnQgaGVyZQphcmUgd2UgdGFsa2luZyBhYm91dCBk
ZWZpbmluZyBhIHN0YW5kYXJkIENQVSB0b3BvbG9neSBzY2hlbWUgZm9yIHRoZSAKZGV2aWNlIHRy
ZWUKc3BlYyBvciBhIExpbnV4LXNwZWNpZmljIENQVSB0b3BvbG9neSBiaW5kaW5nIHN1Y2ggYXMg
Y3B1LW1hcCA/CgpFdmVuIG9uIHRoaXMgY2FzZSB5b3VyIHBvaW50IGlzIG5vdCB2YWxpZCwgdGhl
IGluZm9ybWF0aW9uIG9mIHR3byBoYXJ0cyAKc2hhcmluZwphIGNvbW1vbiBwb3dlciBkb21haW4g
b3IgaGF2aW5nIHRoZSBzYW1lIG9yIG5vdCBjYXBhY2l0eS9tYXggZnJlcXVlbmN5IAoob3IgbWF5
YmUKY2FwYWJpbGl0aWVzL2V4dGVuc2lvbnMgaW4gdGhlIGZ1dHVyZSksIGlzIG5vdCBMaW51eCBz
cGVjaWZpYy4gSSBqdXN0IAp1c2VkIHRoZQpMaW51eCBzcGVjaWZpYyBtYWNyb3MgdXNlZCBieSB0
aGUgTGludXggc2NoZWR1bGVyIHRvIHBvaW50IG91dCB0aGUgY29kZSAKcGF0aC4KRXZlbiBvbiBv
dGhlciBPU2VzIHdlIHN0aWxsIG5lZWQgYSB3YXkgdG8gaW5jbHVkZSB0aGlzIGluZm9ybWF0aW9u
IG9uIAp0aGUgQ1BVCnRvcG9sb2d5LCBhbmQgY3VycmVudGx5IGNwdS1tYXAgZG9lc24ndC4gQWxz
byB0aGUgTGludXggaW1wbGVtZW50YXRpb24gCm9mIGNwdS1tYXAKaWdub3JlcyBtdWx0aXBsZSBs
ZXZlbHMgb2Ygc2hhcmVkIHJlc291cmNlcywgd2Ugb25seSBnZXQgb25lIGxldmVsIGZvciAKU01U
IGFuZApvbmUgbGV2ZWwgZm9yIE1DIGxhc3QgdGltZSBJIGNoZWNrZWQuCgo+PiBJbiB0aGlzIGNv
bnRleHQgSSBiZWxpZXZlIHVzaW5nIHdvcmRzIGxpa2UgImNvcmUiLCAicGFja2FnZSIsCj4+ICJz
b2NrZXQiIGV0YyBjYW4gYmUgbWlzbGVhZGluZy4gRm9yIGV4YW1wbGUgdGhlIHNhbXBsZSB0b3Bv
bG9neSB5b3UKPj4gdXNlIG9uIHRoZSBkb2N1bWVudGF0aW9uIHNheXMgdGhhdCB0aGVyZSBhcmUg
NCBjb3JlcyB0aGF0IGFyZSBwYXJ0Cj4+IG9mIGEgcGFja2FnZSwgaG93ZXZlciAicGFja2FnZSIg
aGFzIGEgZGlmZmVyZW50IG1lYW5pbmcgdG8gdGhlCj4+IHNjaGVkdWxlci4gQWxzbyB3ZSBkb24n
dCBzYXkgYW55dGhpbmcgaW4gY2FzZSB0aGV5IHNoYXJlIGEgcG93ZXIKPj4gZG9tYWluIG9yIGlm
IHRoZXkgaGF2ZSB0aGUgc2FtZSBjYXBhY2l0eSBvciBub3QuIFRoaXMgbWFwcGluZyBkZWFscwo+
PiBvbmx5IHdpdGggY2FjaGUgaGllcmFyY2h5IG9yIG90aGVyIHNoYXJlZCByZXNvdXJjZXMuCj4+
IAo+IAo+IHtVbix9Zm9ydHVuYXRlbHkgdGhvc2UgYXJlIHRlcm1zIHVzZWQgYnkgaGFyZHdhcmUg
cGVvcGxlLgo+IAoKQW5kIHRoZXkgYXJlIHdyb25nLCBob3cgdGhlIGhhcnRzIGFyZSBwaHlzaWNh
bGx5IHBhY2tlZCBkb2Vzbid0IGltcGx5IAp0aGVpcgphY3R1YWwgdG9wb2xvZ3kuIEluIGdlbmVy
YWwgdGhlICJ0cmFuc2xhdGlvbiIgaXMgbm90IGFsd2F5cyBzdHJhaWdodCAKZm9yd2FyZCwKdGhl
cmUgYXJlIGFzc3VtcHRpb25zIGluIHBsYWNlLiBXZSBjb3VsZCB1c2UgImNsdXN0ZXIiIG9mIGhh
cnRzIG9yIAoiZ3JvdXAiIG9mCmhhcnRzIGluc3RlYWQsIHRoZXkgYXJlIG1vcmUgYWJzdHJhY3Qu
CgpSZWdhcmRzLApOaWNrCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
