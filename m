Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F10BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 May 2022 08:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AM8CJ1jLr9ojr9pMcJT6Cx8wvhsxYynZdXrz7qEXNpk=; b=D6FMSD1/ebhrFc
	3jKJDUfvzQDtfT0uInUvaAMXytX0HMdnTCItCvYtby6DGp6dDh//nuRrNKo/4fGXzsgRXb1mKamEV
	x53KfOU/0PiPovg8NCQPW/57jNl7FaVZ0YhadHdREnIR1gfETdQjOVwwieq0cCaP79dZaGorbbOiP
	Ap0dq2tqPvEb8lVZUP+Kf+UFPIJujrNJ8eyREGdYVC8P2KJI9RQxa4FaDEJmjIFleFEbbhUl7yD7C
	OXF27USTBmr9X/oNGdfeMhiv99M15oHeOCmgiFPHWZNqeGzZSGFM8uowZj7XjrXH4BqMEb7f5WHvc
	tBC7z3x5G0FL+ZWJOGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nurQC-001iN9-C8; Sat, 28 May 2022 08:03:40 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nurQ8-001iM4-8V
	for linux-riscv@lists.infradead.org; Sat, 28 May 2022 08:03:38 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id DCC9E24000A;
	Sat, 28 May 2022 08:03:23 +0000 (UTC)
Message-ID: <fcb6d1aa-78bb-cfad-7655-cbab59f8d5c3@ghiti.fr>
Date: Sat, 28 May 2022 10:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [syzbot] riscv/fixes test error: lost connection to test machine
Content-Language: en-US
To: Dmitry Vyukov <dvyukov@google.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 syzbot <syzbot+2c5da6a0a16a0c4f34aa@syzkaller.appspotmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
References: <000000000000d0437b05dffdd1de@google.com>
 <CACT4Y+Y8DOKJtwhRsyNT7G26C3Fx_oeibpXn43Ks0RtYYdZG3g@mail.gmail.com>
 <36f4745f-0e47-4f49-8f4e-ff7544f163d8n@googlegroups.com>
 <CACT4Y+Zy7wLdeRCa+ZH-swo9ut=U6pEk4rP461QE1m-gT6s-uQ@mail.gmail.com>
 <a55430c3-a0bc-4af6-b7e2-20f2e0d091b2n@googlegroups.com>
 <CACT4Y+ar18tcxx0tOthV0JBrmWsLXtXAjXVFX4sac5k1UGJ7Lw@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CACT4Y+ar18tcxx0tOthV0JBrmWsLXtXAjXVFX4sac5k1UGJ7Lw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_010336_615997_CF92C4C1 
X-CRM114-Status: GOOD (  16.24  )
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

T24gNS8yNy8yMiAxOTowNCwgRG1pdHJ5IFZ5dWtvdiB3cm90ZToKPiBPbiBGcmksIDI3IE1heSAy
MDIyIGF0IDE2OjAxLCBBbGV4YW5kcmUgR2hpdGkKPiA8YWxleGFuZHJlLmdoaXRpQGNhbm9uaWNh
bC5jb20+IHdyb3RlOgo+PiBPbiBGcmlkYXksIE1heSAyNywgMjAyMiBhdCAzOjU1OjI0IFBNIFVU
QysyIERtaXRyeSBWeXVrb3Ygd3JvdGU6Cj4+PiBPbiBGcmksIDI3IE1heSAyMDIyIGF0IDE1OjUw
LCBBbGV4YW5kcmUgR2hpdGkKPj4+IDxhbGV4YW5kLi4uQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+
Pj4+IE9uIEZyaWRheSwgTWF5IDI3LCAyMDIyIGF0IDM6MDI6MDEgUE0gVVRDKzIgRG1pdHJ5IFZ5
dWtvdiB3cm90ZToKPj4+Pj4gT24gRnJpLCAyNyBNYXkgMjAyMiBhdCAxNDo1NSwgc3l6Ym90Cj4+
Pj4+IDxzeXpib3QrMmM1ZGE2Li4uQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20+IHdyb3RlOgo+
Pj4+Pj4gSGVsbG8sCj4+Pj4+Pgo+Pj4+Pj4gc3l6Ym90IGZvdW5kIHRoZSBmb2xsb3dpbmcgaXNz
dWUgb246Cj4+Pj4+Pgo+Pj4+Pj4gSEVBRCBjb21taXQ6IGM5MzJlZGVhZjZkNiByaXNjdjogZHRz
OiBtaWNyb2NoaXA6IGZpeCBncGlvMSByZWcgcHJvcGVydHkuLgo+Pj4+Pj4gZ2l0IHRyZWU6IGdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eC5n
aXQgZml4ZXMKPj4+Pj4+IGNvbnNvbGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90
LmNvbS94L2xvZy50eHQ/eD0xNDE4YWRkNWYwMDAwMAo+Pj4+Pj4ga2VybmVsIGNvbmZpZzogaHR0
cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC8uY29uZmlnP3g9YWE2YjU3MDJiZGYxNGExNwo+
Pj4+Pj4gZGFzaGJvYXJkIGxpbms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9l
eHRpZD0yYzVkYTZhMGExNmEwYzRmMzRhYQo+Pj4+Pj4gY29tcGlsZXI6IHJpc2N2NjQtbGludXgt
Z251LWdjYyAoRGViaWFuIDEwLjIuMS02KSAxMC4yLjEgMjAyMTAxMTAsIEdOVSBsZCAoR05VIEJp
bnV0aWxzIGZvciBEZWJpYW4pIDIuMzUuMgo+Pj4+Pj4gdXNlcnNwYWNlIGFyY2g6IHJpc2N2NjQK
Pj4+Pj4+Cj4+Pj4+PiBJTVBPUlRBTlQ6IGlmIHlvdSBmaXggdGhlIGlzc3VlLCBwbGVhc2UgYWRk
IHRoZSBmb2xsb3dpbmcgdGFnIHRvIHRoZSBjb21taXQ6Cj4+Pj4+PiBSZXBvcnRlZC1ieTogc3l6
Ym90KzJjNWRhNi4uLkBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+Pj4+IFRoZSBDT05GSUdf
S0FTQU5fVk1BTExPQyBhbGxvd3MgcmlzY3Yga2VybmVsIHRvIGJvb3QsIGJ1dCBub3cgR28KPj4+
Pj4gcHJvY2Vzc2VzIHN0YXJ0ZWQgY3Jhc2hpbmcgd2l0aDoKPj4+Pj4KPj4+Pj4gMTk3MC8wMS8w
MSAwMDowNjo1NSBmdXp6ZXIgc3RhcnRlZAo+Pj4+PiBydW50aW1lOiBsZnN0YWNrLnB1c2ggaW52
YWxpZCBwYWNraW5nOiBub2RlPTB4ZmZmZmZmNTkwOGE5NDAgY250PTB4MQo+Pj4+PiBwYWNrZWQ9
MHhmZmZmNTkwOGE5NDAwMDAxIC0+IG5vZGU9MHhmZmZmNTkwOGE5NDAKPj4+Pj4gZmF0YWwgZXJy
b3I6IGxmc3RhY2sucHVzaAo+Pj4+PiBydW50aW1lIHN0YWNrOgo+Pj4+PiBydW50aW1lLnRocm93
KHsweDMwODg0YywgMHhjfSkKPj4+Pj4gL3Vzci9sb2NhbC9nby9zcmMvcnVudGltZS9wYW5pYy5n
bzoxMTk4ICsweDYwCj4+Pj4+IHJ1bnRpbWUuKCpsZnN0YWNrKS5wdXNoKDB4ZGIzODUwLCAweGZm
ZmZmZjU5MDhhOTQwKQo+Pj4+PiAvdXNyL2xvY2FsL2dvL3NyYy9ydW50aW1lL2xmc3RhY2suZ286
MzAgKzB4MWE4Cj4+Pj4+Cj4+Pj4+IEdvIHJ1bnRpbWUgdHJpZXMgdG8gc2hvdmUgc29tZSBkYXRh
IGludG8gdGhlIHVwcGVyIDE2IGJpdHMgb2YgcG9pbnRlcnMKPj4+Pj4gYXNzdW1pbmcgdGhleSBh
cmUgdW51c2VkLgo+Pj4+PiBIb3dldmVyLCB0aGUgb3JpZ2luYWwgcG9pbnRlciBub2RlPTB4ZmZm
ZmZmNTkwOGE5NDAgc3VnZ2VzdCByaXNjdiBub3cKPj4+Pj4gaGFzIDU2LWJpdCB1c2Vycy1zcGFj
ZSBhZGRyZXNzIHNwYWNlPwo+Pj4+Cj4+Pj4gWWVzLCBzdjU3IHdhcyBtZXJnZWQgcmVjZW50bHku
Cj4+Pj4KPj4+Pj4gRG9jdW1lbnRhdGlvbi9yaXNjdi92bS1sYXlvdXQucnN0IGNsYWltcyA0OC1i
aXQgcG9pbnRlcnM6Cj4+Pj4+ICIKPj4+Pj4gVGhlIFJJU0MtViBwcml2aWxlZ2VkIGFyY2hpdGVj
dHVyZSBkb2N1bWVudCBzdGF0ZXMgdGhhdCB0aGUgNjRiaXQgYWRkcmVzc2VzCj4+Pj4+ICJtdXN0
IGhhdmUgYml0cyA2M+KAkzQ4IGFsbCBlcXVhbCB0byBiaXQgNDcsIG9yIGVsc2UgYSBwYWdlLWZh
dWx0IGV4Y2VwdGlvbiB3aWxsCj4+Pj4+IG9jY3VyLiI6Cj4+Pj4KPj4+PiBUaGFua3MgZm9yIHBv
aW50aW5nIHRoYXQsIEkgZXh0cmFjdGVkIHRoYXQgZnJvbSB0aGUgc3BlY2lmaWNhdGlvbiBiZWZv
cmUgc3Y1NyB3YXMgc3BlY2lmaWVkLCBJJ2xsIGZpeCB0aGF0Lgo+Pj4+Cj4+Pj4gVGhlIGN1cnJl
bnQga2VybmVsIGNvZGUgd2lsbCB1c2Ugc3Y1NyBhcyBpdCBpcyBzdXBwb3J0ZWQgYW5kIGFkdmVy
dGlzZWQgYnkgcWVtdSwgYW5kIHRvIG15IGtub3dsZWRnZSwgeW91IGNhbid0IGRvd25ncmFkZSB0
byBzdjQ4IHVubGVzcyBieSByZS1jb21waWxpbmcgcWVtdSB1c2luZyB0aGUgZm9sbG93aW5nOgo+
Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9jc3IuYyBiL3RhcmdldC9yaXNjdi9j
c3IuYwo+Pj4+IGluZGV4IDZkYmU5YjU0MWYuLmE2NGI1MGVkNzUgMTAwNjQ0Cj4+Pj4gLS0tIGEv
dGFyZ2V0L3Jpc2N2L2Nzci5jCj4+Pj4gKysrIGIvdGFyZ2V0L3Jpc2N2L2Nzci5jCj4+Pj4gQEAg
LTYzNyw3ICs2MzcsNyBAQCBzdGF0aWMgY29uc3QgY2hhciB2YWxpZF92bV8xXzEwXzY0WzE2XSA9
IHsKPj4+PiBbVk1fMV8xMF9NQkFSRV0gPSAxLAo+Pj4+IFtWTV8xXzEwX1NWMzldID0gMSwKPj4+
PiBbVk1fMV8xMF9TVjQ4XSA9IDEsCj4+Pj4gLSBbVk1fMV8xMF9TVjU3XSA9IDEKPj4+PiArIFtW
TV8xXzEwX1NWNTddID0gMAo+Pj4+IH07Cj4+Pj4KPj4+PiAvKiBNYWNoaW5lIEluZm9ybWF0aW9u
IFJlZ2lzdGVycyAqLwo+Pj4+Cj4+Pj4+IC4uLgo+Pj4+PiAwMDAwMDAwMDAwMDAwMDAwIHwgMCB8
IDAwMDAwMDNmZmZmZmZmZmYgfCAyNTYgR0IgfAo+Pj4+PiB1c2VyLXNwYWNlIHZpcnR1YWwgbWVt
b3J5LCBkaWZmZXJlbnQgcGVyIG1tCj4+Pj4+ICIKPj4+IFRoZXJlIGlzIG5vIGtlcm5lbCBjb25m
aWcgdG8gZm9yY2UgU1Y0OC8zOSwgcmlnaHQ/Cj4+Cj4+IE5vLCB3ZSByZWx5IG9uIHdoYXQgdGhl
IGhhcmR3YXJlIGFkdmVydGlzZXMsIGlmIGl0IHN1cHBvcnRzIHN2NTcsIHdlJ2xsIGdvIGZvciBz
djU3LCBpZiBub3QsIHdlJ2xsIHRyeSBzdjQ4Li4uZXRjLiBJIGhhZCBzb21lIHBhdGNoZXMgdG8g
Zm9yY2UgdGhlIGRvd25ncmFkZSBieSB1c2luZyB0aGUgZGV2aWNlIHRyZWUgYnV0IHRoZXkgbmV2
ZXIgZ290IG1lcmdlZCB0aG91Z2guCj4gK29yaWdpbmFsIENDIGxpc3QKPgo+IEZUUiBzZW50IEdv
IHJ1bnRpbWUgY2hhbmdlIHRvIHN1cHBvcnQgU1Y1NzoKPiBodHRwczovL2dvLXJldmlldy5nb29n
bGVzb3VyY2UuY29tL2MvZ28vKy80MDkwNTUKCgpUaGFuayB5b3UgZm9yIHRoYXQsIEknbGwgcHVs
bCB0aGF0IGludG8gVWJ1bnR1IHdoZW4gbWVyZ2VkLiBEbyB5b3Uga25vdyAKaWYgYW55IG90aGVy
IHByb2dyYW1taW5nIGxhbmd1YWdlIGRvZXMgdGhlIHNhbWUgYW5kIHdvdWxkIG5lZWQgYSBmaXgg
dG9vPwoKCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
