Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA59C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 16:37:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5E6C65006
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 16:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5E6C65006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vO7Y0vIQ+zHugRHF8a/ZIXyi8BFKV4atG6QP5e6FhX0=; b=b6rXE+vd0NdTgRehO/ASguegO
	8LMHTzMZPJYxd0oJKYRJS4m56ZRH2FfP8kZsYgsmDBJUqMfsdsudLlfNoniLykwHaDpnugiibGYqw
	qPXgJcROcV95w08ro0216oThleBhJbIpi0TKidbsmvAOljyKxKAct9kx1L3WnTghUbaT973LjGRo4
	Jdtv+k0MfANyf4xlY+ecC1kCG0miNxWeBElSnfUPiYdJNLhC0HpomGUfc46PpmO2MiYhQioE4ao1I
	ZxhpQ+oCGpNu44I/10i53su++Fr8FpqCADnhpTV+/G2Q/J2CsLiGAE7C7ET7JiS2CRTIgtlCqxdaN
	f9jOYD+ew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKkmj-00C1Ng-8Q; Fri, 12 Mar 2021 16:37:09 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKkmd-00C1Ls-Ho
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 16:37:06 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lKkmR-0002cL-MC; Fri, 12 Mar 2021 16:36:51 +0000
Subject: Re: [syzbot] BUG: unable to handle kernel access to user memory in
 schedule_tail
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: syzbot <syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Benjamin Segall <bsegall@google.com>, dietmar.eggemann@arm.com,
 Juri Lelli <juri.lelli@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <000000000000b74f1b05bd316729@google.com>
 <CACT4Y+ZHMYijYAkeLMX=p9jx6pBivJz06h_1rGt-k9=AgfkWQg@mail.gmail.com>
 <84b0471d-42c1-175f-ae1d-a18c310c7f77@codethink.co.uk>
 <CACT4Y+ZsSRdQ5LzYMsgjrBAukgP-Vv8WSQsSoxguYjWvB1QnrA@mail.gmail.com>
 <aa801bc7-cf6f-b77a-bbb0-28b0ff36e8ba@codethink.co.uk>
 <816870e9-9354-ffbd-936b-40e38e4276a4@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <4ce57c7e-6e5d-d136-0a81-395a4207ba44@codethink.co.uk>
Date: Fri, 12 Mar 2021 16:36:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <816870e9-9354-ffbd-936b-40e38e4276a4@codethink.co.uk>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_163704_166911_A0FC1AB1 
X-CRM114-Status: GOOD (  28.35  )
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

T24gMTIvMDMvMjAyMSAxNjozNCwgQmVuIERvb2tzIHdyb3RlOgo+IE9uIDEyLzAzLzIwMjEgMTY6
MzAsIEJlbiBEb29rcyB3cm90ZToKPj4gT24gMTIvMDMvMjAyMSAxNToxMiwgRG1pdHJ5IFZ5dWtv
diB3cm90ZToKPj4+IE9uIEZyaSwgTWFyIDEyLCAyMDIxIGF0IDI6NTAgUE0gQmVuIERvb2tzIDxi
ZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPiAKPj4+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMTAvMDMv
MjAyMSAxNzoxNiwgRG1pdHJ5IFZ5dWtvdiB3cm90ZToKPj4+Pj4gT24gV2VkLCBNYXIgMTAsIDIw
MjEgYXQgNTo0NiBQTSBzeXpib3QKPj4+Pj4gPHN5emJvdCtlNzRiOTRmZTYwMWFiOTU1MmQ2OUBz
eXprYWxsZXIuYXBwc3BvdG1haWwuY29tPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBIZWxsbywKPj4+
Pj4+Cj4+Pj4+PiBzeXpib3QgZm91bmQgdGhlIGZvbGxvd2luZyBpc3N1ZSBvbjoKPj4+Pj4+Cj4+
Pj4+PiBIRUFEIGNvbW1pdDrCoMKgwqAgMGQ3NTg4YWIgcmlzY3Y6IHByb2Nlc3M6IEZpeCBubyBw
cm90b3R5cGUgZm9yIAo+Pj4+Pj4gYXJjaF9kdXBfdGFzLi4KPj4+Pj4+IGdpdCB0cmVlOiAKPj4+
Pj4+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNjdi9s
aW51eC5naXQgZml4ZXMKPj4+Pj4+IGNvbnNvbGUgb3V0cHV0OiAKPj4+Pj4+IGh0dHBzOi8vc3l6
a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTEyMTJjNmU2ZDAwMDAwCj4+Pj4+PiBrZXJu
ZWwgY29uZmlnOiAKPj4+Pj4+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZp
Zz94PWUzYzU5NTI1NWZiMmQxMzYKPj4+Pj4+IGRhc2hib2FyZCBsaW5rOiAKPj4+Pj4+IGh0dHBz
Oi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1lNzRiOTRmZTYwMWFiOTU1MmQ2OQo+
Pj4+Pj4gdXNlcnNwYWNlIGFyY2g6IHJpc2N2NjQKPj4+Pj4+Cj4+Pj4+PiBVbmZvcnR1bmF0ZWx5
LCBJIGRvbid0IGhhdmUgYW55IHJlcHJvZHVjZXIgZm9yIHRoaXMgaXNzdWUgeWV0Lgo+Pj4+Pj4K
Pj4+Pj4+IElNUE9SVEFOVDogaWYgeW91IGZpeCB0aGUgaXNzdWUsIHBsZWFzZSBhZGQgdGhlIGZv
bGxvd2luZyB0YWcgdG8gCj4+Pj4+PiB0aGUgY29tbWl0Ogo+Pj4+Pj4gUmVwb3J0ZWQtYnk6IHN5
emJvdCtlNzRiOTRmZTYwMWFiOTU1MmQ2OUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+Pj4+
Cj4+Pj4+ICtyaXNjdiBtYWludGFpbmVycwo+Pj4+Pgo+Pj4+PiBUaGlzIGlzIHJpc2N2NjQtc3Bl
Y2lmaWMuCj4+Pj4+IEkndmUgc2VlbiBzaW1pbGFyIGNyYXNoZXMgaW4gcHV0X3VzZXIgaW4gb3Ro
ZXIgcGxhY2VzLiBJdCBsb29rcyBsaWtlCj4+Pj4+IHB1dF91c2VyIGNyYXNoZXMgaW4gdGhlIHVz
ZXIgYWRkcmVzcyBpcyBub3QgbWFwcGVkL3Byb3RlY3RlZCAoPykuCj4+Pj4KPj4+PiBJJ3ZlIGJl
ZW4gaGF2aW5nIGEgbG9vaywgYW5kIHRoaXMgc2VlbXMgdG8gYmUgZG93biB0byBhY2Nlc3Mgb2Yg
dGhlCj4+Pj4gdHNrLT5zZXRfY2hpbGRfdGlkIHZhcmlhYmxlLiBJIGFzc3VtZSB0aGUgZnV6emlu
ZyBoZXJlIGlzIHRvIHBhc3MgYQo+Pj4+IGJhZCBhZGRyZXNzIHRvIGNsb25lPwo+Pj4+Cj4+Pj4g
wqAgRnJvbSBsb29raW5nIGF0IHRoZSBjb2RlLCB0aGUgcHV0X3VzZXIoKSBjb2RlIHNob3VsZCBo
YXZlIHNldCB0aGUKPj4+PiByZWxldmFudCBTUl9TVU0gYml0ICh0aGUgdmFsdWUgZm9yIHRoaXMs
IHdoaWNoIGlzIDE8PDE4IGlzIGluIHRoZQo+Pj4+IHMyIHJlZ2lzdGVyIGluIHRoZSBjcmFzaCBy
ZXBvcnQpIGFuZCBmcm9tIGxvb2tpbmcgYXQgdGhlIGNvbXBpbGVyCj4+Pj4gb3V0cHV0IGZyb20g
bXkgZ2NjLTEwLCB0aGUgY29kZSBsb29rcyB0byBiZSBkb25nIHRoZSByZWxldmFudCBjc3JzCj4+
Pj4gYW5kIHRoZW4gY3NyYyBhcm91bmQgdGhlIHB1dF91c2VyCj4+Pj4KPj4+PiBTbyBjdXJyZW50
bHkgSSBkbyBub3QgdW5kZXJzdGFuZCBob3cgdGhlIGFib3ZlIGNvdWxkIGhhdmUgaGFwcGVuZWQK
Pj4+PiBvdmVyIHRoYW4gc29tZXRoaW5nIHJlLXRyaWVkIHRoZSBjb2RlIHNlcWV1bmNlIGFuZCBl
bmRlZCB1cCByZXRyeWluZwo+Pj4+IHRoZSBmYXVsdGluZyBpbnN0cnVjdGlvbiB3aXRob3V0IHRo
ZSBTUl9TVU0gYml0IHNldC4KPj4+Cj4+PiBJIHdvdWxkIG1heWJlIGJsYW1lIHFlbXUgZm9yIHJh
bmRvbWx5IHJlc2V0dGluZyBTUl9TVU0sIGJ1dCBpdCdzCj4+PiBzdHJhbmdlIHRoYXQgOTklIG9m
IHRoZXNlIGNyYXNoZXMgYXJlIGluIHNjaGVkdWxlX3RhaWwuIElmIGl0IHdvdWxkIGJlCj4+PiBx
ZW11LCB0aGVuIHRoZXkgd291bGQgYmUgbW9yZSBldmVubHkgZGlzdHJpYnV0ZWQuLi4KPj4+Cj4+
PiBBbm90aGVyIG9ic2VydmF0aW9uOiBsb29raW5nIGF0IGEgZG96ZW4gb2YgY3Jhc2ggbG9ncywg
aW4gbm9uZSBvZgo+Pj4gdGhlc2UgY2FzZXMgZnV6emVyIHdhcyBhY3R1YWxseSB0cnlpbmcgdG8g
ZnV6eiBjbG9uZSB3aXRoIHNvbWUgaW5zYW5lCj4+PiBhcmd1bWVudHMuIFNvIGl0IGxvb2tzIGxp
a2UgY29tcGxldGVseSBub3JtYWwgY2xvbmUncyAoZS4uZyBjb21pbmcKPj4+IGZyb20gcHRocmVh
ZF9jcmVhdGUpIHJlc3VsdCBpbiB0aGlzIGNyYXNoLgo+Pj4KPj4+IEkgYWxzbyB3b25kZXIgd2h5
IHRoZXJlIGlzIHJldF9mcm9tX2V4Y2VwdGlvbiwgaXMgaXQgbm9ybWFsPyBJIHNlZQo+Pj4gaGFu
ZGxlX2V4Y2VwdGlvbiBkaXNhYmxlcyBTUl9TVU06Cj4+PiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92NS4xMi1yYzIvc291cmNlL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMjTDcz
IAo+Pj4KPj4KPj4gU28gSSB0aGluayBpZiBTUl9TVU0gaXMgc2V0LCB0aGVuIGl0IGZhdWx0cyB0
aGUgYWNjZXNzIHRvIHVzZXIgbWVtb3J5Cj4+IHdoaWNoIHRoZSBfdXNlcigpIHJvdXRpbmVzIGNs
ZWFyIHRvIGFsbG93IHRoZW0gYWNjZXNzLgo+Pgo+PiBJJ20gdGhpbmtpbmcgdGhlcmUgaXMgYXQg
bGVhc3Qgb25lIGlzc3VlIGhlcmU6Cj4+Cj4+IC0gdGhlIHRlc3QgaW4gZmF1bHQgaXMgdGhlIHdy
b25nIHdheSBhcm91bmQgZm9yIGRpZSBrZXJuZWwKPj4gLSB0aGUgaGFuZGxlciBvbmx5IGNhdGNo
ZXMgdGhpcyBpZiB0aGUgcGFnZSBoYXMgeWV0IHRvIGJlIG1hcHBlZC4KPj4KPj4gU28gSSB0aGlu
ayB0aGUgdGVzdCBzaG91bGQgYmU6Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKCF1c2VyX21v
ZGUocmVncykgJiYgYWRkciA8IFRBU0tfU0laRSAmJgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5saWtlbHkocmVncy0+c3RhdHVzICYgU1JfU1VN
KQo+Pgo+PiBUaGlzIHRoZW4gc2hvdWxkIGNvbnRpbnVlIG9uIGFuZCBhbGxvdyB0aGUgcmVzdCBv
ZiB0aGUgaGFuZGxlciB0bwo+PiBjb21wbGV0ZSBtYXBwaW5nIHRoZSBwYWdlIGlmIGl0IGlzIG5v
dCB0aGVyZS4KPj4KPj4gSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIGNyZWF0ZSBhIHZlcnkgc2ltcGxl
IGNsb25lIHRlc3QsIGJ1dCBzbyBmYXIgaXQKPj4gaGFzIHlldCB0byBhY3R1YWxseSB0cmlnZ2Vy
IGFueXRoaW5nLgo+IAo+IEkgc2hvdWxkIGhhdmUgYWRkZWQgdGhlcmUgZG9lc24ndCBzZWVtIHRv
IGJlIGEgZ29vZCB3YXkgdG8gdXNlIG1tYXAoKQo+IHRvIGFsbG9jYXRlIG1lbW9yeSBidXQgbm90
IGluc2VydCBhIHZtLW1hcHBpbmcgcG9zdCB0aGUgbW1hcCgpLgo+IAo+IAoKSG93IGRpZmZpY3Vs
dCBpcyBpdCB0byB0cnkgYnVpbGRpbmcgYSBicmFuY2ggd2l0aCB0aGUgYWJvdmUgdGVzdAptb2Rp
ZmllZD8KCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlv
ciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5j
b2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
