Return-Path: <SRS0=D0Wc=IK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E473DC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 16:34:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A65F65006
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Mar 2021 16:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A65F65006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jUXNHmQqT+kJOYTOUN+hJTBNWMGzccBE5LjjkDHzdG0=; b=nsrHtPtbiesJbvFIJbo/yg2td
	neZXToYt4MU2sGtU656PeGA+m22CMvTkqmYE6rdTYOepjwxFClg//Nv3CtgdqQCjavU36AxRiaKHC
	XfImqZ2OwVQ2MN/FVJQMcfpe1rKizCmbqv5bApzBVWhxwibtRXGOMX/oX1lrCd9wU85gY6lxWdZ3+
	AUT4WCCe6Sy95MxseOMKrahDMoY2RGCMVEK7McsXyH6Cv4u6PgdmZqZY2/exDX5X55alAn9M5anj4
	aybzHdFT61XV1Zwq6Wlr+ViJrLRjqEiWpoRX/sTXJnUj5HNlQKsJPZzIXOu5ODqyxqdvUj2o2vMhY
	Qe+b2CGYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKkkP-00C0gs-Tb; Fri, 12 Mar 2021 16:34:46 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKkkI-00C0eV-6v
 for linux-riscv@lists.infradead.org; Fri, 12 Mar 2021 16:34:43 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lKkk5-0002Vs-5D; Fri, 12 Mar 2021 16:34:25 +0000
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
Organization: Codethink Limited.
Message-ID: <816870e9-9354-ffbd-936b-40e38e4276a4@codethink.co.uk>
Date: Fri, 12 Mar 2021 16:34:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <aa801bc7-cf6f-b77a-bbb0-28b0ff36e8ba@codethink.co.uk>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_163438_695547_18409994 
X-CRM114-Status: GOOD (  31.42  )
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

T24gMTIvMDMvMjAyMSAxNjozMCwgQmVuIERvb2tzIHdyb3RlOgo+IE9uIDEyLzAzLzIwMjEgMTU6
MTIsIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4+IE9uIEZyaSwgTWFyIDEyLCAyMDIxIGF0IDI6NTAg
UE0gQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVrPiAKPj4gd3JvdGU6Cj4+Pgo+
Pj4gT24gMTAvMDMvMjAyMSAxNzoxNiwgRG1pdHJ5IFZ5dWtvdiB3cm90ZToKPj4+PiBPbiBXZWQs
IE1hciAxMCwgMjAyMSBhdCA1OjQ2IFBNIHN5emJvdAo+Pj4+IDxzeXpib3QrZTc0Yjk0ZmU2MDFh
Yjk1NTJkNjlAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IEhl
bGxvLAo+Pj4+Pgo+Pj4+PiBzeXpib3QgZm91bmQgdGhlIGZvbGxvd2luZyBpc3N1ZSBvbjoKPj4+
Pj4KPj4+Pj4gSEVBRCBjb21taXQ6wqDCoMKgIDBkNzU4OGFiIHJpc2N2OiBwcm9jZXNzOiBGaXgg
bm8gcHJvdG90eXBlIGZvciAKPj4+Pj4gYXJjaF9kdXBfdGFzLi4KPj4+Pj4gZ2l0IHRyZWU6ICAg
ICAgIAo+Pj4+PiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
cmlzY3YvbGludXguZ2l0IGZpeGVzCj4+Pj4+IGNvbnNvbGUgb3V0cHV0OiAKPj4+Pj4gaHR0cHM6
Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTIxMmM2ZTZkMDAwMDAKPj4+Pj4g
a2VybmVsIGNvbmZpZzogIAo+Pj4+PiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94Ly5j
b25maWc/eD1lM2M1OTUyNTVmYjJkMTM2Cj4+Pj4+IGRhc2hib2FyZCBsaW5rOiAKPj4+Pj4gaHR0
cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20vYnVnP2V4dGlkPWU3NGI5NGZlNjAxYWI5NTUyZDY5
Cj4+Pj4+IHVzZXJzcGFjZSBhcmNoOiByaXNjdjY0Cj4+Pj4+Cj4+Pj4+IFVuZm9ydHVuYXRlbHks
IEkgZG9uJ3QgaGF2ZSBhbnkgcmVwcm9kdWNlciBmb3IgdGhpcyBpc3N1ZSB5ZXQuCj4+Pj4+Cj4+
Pj4+IElNUE9SVEFOVDogaWYgeW91IGZpeCB0aGUgaXNzdWUsIHBsZWFzZSBhZGQgdGhlIGZvbGxv
d2luZyB0YWcgdG8gCj4+Pj4+IHRoZSBjb21taXQ6Cj4+Pj4+IFJlcG9ydGVkLWJ5OiBzeXpib3Qr
ZTc0Yjk0ZmU2MDFhYjk1NTJkNjlAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQo+Pj4+Cj4+Pj4g
K3Jpc2N2IG1haW50YWluZXJzCj4+Pj4KPj4+PiBUaGlzIGlzIHJpc2N2NjQtc3BlY2lmaWMuCj4+
Pj4gSSd2ZSBzZWVuIHNpbWlsYXIgY3Jhc2hlcyBpbiBwdXRfdXNlciBpbiBvdGhlciBwbGFjZXMu
IEl0IGxvb2tzIGxpa2UKPj4+PiBwdXRfdXNlciBjcmFzaGVzIGluIHRoZSB1c2VyIGFkZHJlc3Mg
aXMgbm90IG1hcHBlZC9wcm90ZWN0ZWQgKD8pLgo+Pj4KPj4+IEkndmUgYmVlbiBoYXZpbmcgYSBs
b29rLCBhbmQgdGhpcyBzZWVtcyB0byBiZSBkb3duIHRvIGFjY2VzcyBvZiB0aGUKPj4+IHRzay0+
c2V0X2NoaWxkX3RpZCB2YXJpYWJsZS4gSSBhc3N1bWUgdGhlIGZ1enppbmcgaGVyZSBpcyB0byBw
YXNzIGEKPj4+IGJhZCBhZGRyZXNzIHRvIGNsb25lPwo+Pj4KPj4+IMKgIEZyb20gbG9va2luZyBh
dCB0aGUgY29kZSwgdGhlIHB1dF91c2VyKCkgY29kZSBzaG91bGQgaGF2ZSBzZXQgdGhlCj4+PiBy
ZWxldmFudCBTUl9TVU0gYml0ICh0aGUgdmFsdWUgZm9yIHRoaXMsIHdoaWNoIGlzIDE8PDE4IGlz
IGluIHRoZQo+Pj4gczIgcmVnaXN0ZXIgaW4gdGhlIGNyYXNoIHJlcG9ydCkgYW5kIGZyb20gbG9v
a2luZyBhdCB0aGUgY29tcGlsZXIKPj4+IG91dHB1dCBmcm9tIG15IGdjYy0xMCwgdGhlIGNvZGUg
bG9va3MgdG8gYmUgZG9uZyB0aGUgcmVsZXZhbnQgY3Nycwo+Pj4gYW5kIHRoZW4gY3NyYyBhcm91
bmQgdGhlIHB1dF91c2VyCj4+Pgo+Pj4gU28gY3VycmVudGx5IEkgZG8gbm90IHVuZGVyc3RhbmQg
aG93IHRoZSBhYm92ZSBjb3VsZCBoYXZlIGhhcHBlbmVkCj4+PiBvdmVyIHRoYW4gc29tZXRoaW5n
IHJlLXRyaWVkIHRoZSBjb2RlIHNlcWV1bmNlIGFuZCBlbmRlZCB1cCByZXRyeWluZwo+Pj4gdGhl
IGZhdWx0aW5nIGluc3RydWN0aW9uIHdpdGhvdXQgdGhlIFNSX1NVTSBiaXQgc2V0Lgo+Pgo+PiBJ
IHdvdWxkIG1heWJlIGJsYW1lIHFlbXUgZm9yIHJhbmRvbWx5IHJlc2V0dGluZyBTUl9TVU0sIGJ1
dCBpdCdzCj4+IHN0cmFuZ2UgdGhhdCA5OSUgb2YgdGhlc2UgY3Jhc2hlcyBhcmUgaW4gc2NoZWR1
bGVfdGFpbC4gSWYgaXQgd291bGQgYmUKPj4gcWVtdSwgdGhlbiB0aGV5IHdvdWxkIGJlIG1vcmUg
ZXZlbmx5IGRpc3RyaWJ1dGVkLi4uCj4+Cj4+IEFub3RoZXIgb2JzZXJ2YXRpb246IGxvb2tpbmcg
YXQgYSBkb3plbiBvZiBjcmFzaCBsb2dzLCBpbiBub25lIG9mCj4+IHRoZXNlIGNhc2VzIGZ1enpl
ciB3YXMgYWN0dWFsbHkgdHJ5aW5nIHRvIGZ1enogY2xvbmUgd2l0aCBzb21lIGluc2FuZQo+PiBh
cmd1bWVudHMuIFNvIGl0IGxvb2tzIGxpa2UgY29tcGxldGVseSBub3JtYWwgY2xvbmUncyAoZS4u
ZyBjb21pbmcKPj4gZnJvbSBwdGhyZWFkX2NyZWF0ZSkgcmVzdWx0IGluIHRoaXMgY3Jhc2guCj4+
Cj4+IEkgYWxzbyB3b25kZXIgd2h5IHRoZXJlIGlzIHJldF9mcm9tX2V4Y2VwdGlvbiwgaXMgaXQg
bm9ybWFsPyBJIHNlZQo+PiBoYW5kbGVfZXhjZXB0aW9uIGRpc2FibGVzIFNSX1NVTToKPj4gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTItcmMyL3NvdXJjZS9hcmNoL3Jpc2N2
L2tlcm5lbC9lbnRyeS5TI0w3MyAKPj4KPiAKPiBTbyBJIHRoaW5rIGlmIFNSX1NVTSBpcyBzZXQs
IHRoZW4gaXQgZmF1bHRzIHRoZSBhY2Nlc3MgdG8gdXNlciBtZW1vcnkKPiB3aGljaCB0aGUgX3Vz
ZXIoKSByb3V0aW5lcyBjbGVhciB0byBhbGxvdyB0aGVtIGFjY2Vzcy4KPiAKPiBJJ20gdGhpbmtp
bmcgdGhlcmUgaXMgYXQgbGVhc3Qgb25lIGlzc3VlIGhlcmU6Cj4gCj4gLSB0aGUgdGVzdCBpbiBm
YXVsdCBpcyB0aGUgd3Jvbmcgd2F5IGFyb3VuZCBmb3IgZGllIGtlcm5lbAo+IC0gdGhlIGhhbmRs
ZXIgb25seSBjYXRjaGVzIHRoaXMgaWYgdGhlIHBhZ2UgaGFzIHlldCB0byBiZSBtYXBwZWQuCj4g
Cj4gU28gSSB0aGluayB0aGUgdGVzdCBzaG91bGQgYmU6Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIGlm
ICghdXNlcl9tb2RlKHJlZ3MpICYmIGFkZHIgPCBUQVNLX1NJWkUgJiYKPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bmxpa2VseShyZWdzLT5zdGF0dXMg
JiBTUl9TVU0pCj4gCj4gVGhpcyB0aGVuIHNob3VsZCBjb250aW51ZSBvbiBhbmQgYWxsb3cgdGhl
IHJlc3Qgb2YgdGhlIGhhbmRsZXIgdG8KPiBjb21wbGV0ZSBtYXBwaW5nIHRoZSBwYWdlIGlmIGl0
IGlzIG5vdCB0aGVyZS4KPiAKPiBJIGhhdmUgYmVlbiB0cnlpbmcgdG8gY3JlYXRlIGEgdmVyeSBz
aW1wbGUgY2xvbmUgdGVzdCwgYnV0IHNvIGZhciBpdAo+IGhhcyB5ZXQgdG8gYWN0dWFsbHkgdHJp
Z2dlciBhbnl0aGluZy4KCkkgc2hvdWxkIGhhdmUgYWRkZWQgdGhlcmUgZG9lc24ndCBzZWVtIHRv
IGJlIGEgZ29vZCB3YXkgdG8gdXNlIG1tYXAoKQp0byBhbGxvY2F0ZSBtZW1vcnkgYnV0IG5vdCBp
bnNlcnQgYSB2bS1tYXBwaW5nIHBvc3QgdGhlIG1tYXAoKS4KCgotLSAKQmVuIERvb2tzCQkJCWh0
dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0g
UHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRt
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
