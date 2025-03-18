Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A47CC28B28
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5cfEUraa9k3sIAYZ+/kM5crLyYhQ6FNJouYf/bpOtM=; b=D4Q3BAWUa5Cmhr
	KfVrHodfbfqE7rieCPfvfiVonBN6coTVlTAScndUvEZmyevSkysGXpZKPem0TvMHXtP5sPaDArdyC
	a+iL4PpdDbrOvOIE8zLBnkWdFRqrqZ/7+ud/y6x9zjRdX6cmNDushg29/foOp2FK15CfJO0iE7ViV
	tvqMPXZ28WljD+ktFhSAeAE5YY+u7vof4bAzf212nsbUT8NAYUrnOlBDvOR6UM4L0w90BHCTNcyWg
	Rr57ZlY2lXE2mWrT6ILjUdHVLTSU2+UwCsWy5nidj69NoFfFCviOvlab18baHpK+vQdzWPRB+2xHq
	ITz0YIrCJz9p2oiESQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRyg-000000055n8-0UQ2;
	Tue, 18 Mar 2025 08:07:10 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRuX-000000054sZ-0BFJ
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 08:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bVnYcV85zatttdVWEcG8loEvcr+gkH1XrFyQXfytOEI=; b=pq5bzkLi3D0CWPwuv9eCvPRhx1
	tCNPOD1necWsIdsHZ7mNeoTxY6vDKFAeCp8u+y3myCBHn53mQPwWgLffQQYp5dV+9N8fCsTGZk2+t
	aeQZsX7+tco6n03o/0wp6Q+HY9kSfhHQzHyR9srPuF8D4N0tELFdjBVDCPuLzJ3lmtUOXUx9cO1EH
	ef4QGphUwCc0fmsuGHyiehhTT+lDNAX5eH9IilBLbtjipWGd+mQ3/Cwgw0cdy9jdVWUW3VKO2ulSL
	XSr2G7USZnrEna9f8N7i9qurQ1r5SxGLYoHdG1pDGa6HJ+hRc4rgiukMauv9K+X5A9fWt0bghuKO3
	c7w6BZ7w==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tuRuL-00HYKY-Gg; Tue, 18 Mar 2025 08:02:41 +0000
Message-ID: <8ee4944a-01d3-49e7-8934-e4a866ccc628@codethink.co.uk>
Date: Tue, 18 Mar 2025 08:02:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v3 0/4] riscv: uaccess: optimizations
To: Cyril Bur <cyrilbur@tenstorrent.com>, Alexandre Ghiti <alex@ghiti.fr>,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 charlie@rivosinc.com, jrtc27@jrtc27.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
 <4f6c83c0-39f6-467d-83c6-13d37440fb20@ghiti.fr>
 <5a81a72d-550d-42b4-8549-176f2b27ffc9@codethink.co.uk>
 <ac5b93be-5b9c-4d39-bce6-a78032e43fbf@tenstorrent.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <ac5b93be-5b9c-4d39-bce6-a78032e43fbf@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_010253_163078_3A8BABC1 
X-CRM114-Status: GOOD (  28.59  )
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

T24gMTcvMDMvMjAyNSAyMzo1MiwgQ3lyaWwgQnVyIHdyb3RlOgo+IAo+IAo+IE9uIDE1LzMvMjAy
NSAxMjo0OSBhbSwgQmVuIERvb2tzIHdyb3RlOgo+PiBPbiAxNC8wMy8yMDI1IDEzOjI4LCBBbGV4
YW5kcmUgR2hpdGkgd3JvdGU6Cj4+PiBIaSBDeXJpbCwKPj4+Cj4+PiBPbiAyMS8wMi8yMDI1IDAx
OjA5LCBDeXJpbCBCdXIgd3JvdGU6Cj4+Pj4gVGhpcyBzZXJpZXMgdHJpZXMgdG8gb3B0aW1pemUg
cmlzY3YgdWFjY2VzcyBieSBhbGxvd2luZyB0aGUgdXNlIG9mCj4+Pj4gdXNlcl9hY2Nlc3NfYmVn
aW4oKSBhbmQgdXNlcl9hY2Nlc3NfZW5kKCkgd2hpY2ggcGVybWl0cyBncm91cGluZyAKPj4+PiB1
c2VyIGFjY2Vzc2VzCj4+Pj4gYW5kIGF2b2lkaW5nIHRoZSBDU1Igd3JpdGUgcGVuYWx0eSBmb3Ig
ZWFjaCBhY2Nlc3MuCj4+Pj4KPj4+PiBUaGUgZXJyb3IgcGF0aCBjYW4gYWxzbyBiZSBvcHRpbWlz
ZWQgdXNpbmcgYXNtIGdvdG8gd2hpY2ggcGF0Y2hlcyAzIAo+Pj4+IGFuZCA0Cj4+Pj4gYWNoaWV2
ZS4gVGhpcyB3aWxsIHNwZWVkIHVwIGp1bXBpbmcgdG8gbGFiZWxzIGJ5IGF2b2lkaW5nIHRoZSBu
ZWVkIAo+Pj4+IG9mIGFuCj4+Pj4gaW50ZXJtZWRpYXJ5IGVycm9yIHR5cGUgdmFyaWFibGUgd2l0
aGluIHRoZSB1YWNjZXNzIG1hY3Jvcwo+Pj4+Cj4+Pj4gSSBkaWQgcmVhZCB0aGUgZGlzY3Vzc2lv
biB0aGlzIHNlcmllcyBnZW5lcmF0ZWQuIEl0IGlzbid0IGNsZWFyIHRvIG1lCj4+Pj4gd2hpY2gg
ZGlyZWN0aW9uIHRvIHRha2UgdGhlIHBhdGNoZXMsIGlmIGFueS4KPj4+Pgo+Pj4+IFYyOgo+Pj4+
IEkndmUgdGFrZW4gb24gdGhpcyBzZXJpZXMgYXMgdGhlcmUgaXNuJ3QgYW55IHJlc3BvbnNlIGZy
b20gSmlzaGVuZy4gTm8KPj4+PiBzaWduaWZpY2FudCBjaGFuZ2VzIG90aGVyIHRoYW4gYnVpbGQg
Zml4ZXMuCj4+Pj4gLSBGaXhlcyBidWlsZCBicmVha2FnZSBpbiBwYXRjaCAzIHRvIGRvIHdpdGgg
bm90IGhhdmluZyB1c2VkICdnb3RvJyAKPj4+PiBrZXl3b3JkLgo+Pj4+IC0gRml4ZXMgYnVpbGQg
YnJlYWthZ2UgaW4gcGF0Y2ggNCBvbiAzMmJpdCBub3QgaGF2aW5nIGRlbGNhcmVkIF9fcHRyIAo+
Pj4+IGluIHRoZQo+Pj4+IMKgwqAgbWFjcm8uCj4+Pj4KPj4+PiBWMzoKPj4+PiBTaWduaWZpY2Fu
dCBjb21taXQgbWVzc2FnZSByZXdyaXRlcy4KPj4+PiDCoCAtIENvcnJlY3RlZCB0aGUganVzdGlm
aWNhdGlvbiBmb3IgcGF0Y2ggMgo+Pj4+IMKgIC0gQmV0dGVyIGV4cGxhaW5lZC9qdXN0aWZpZWQg
cGF0Y2hlcyAzIGFuZCA0Cj4+Pj4gTWlub3IgY29kZSBjaGFuZ2VzIGZvciBsZWdpYmlsaXR5IGFu
ZCBtb3JlIGNvbW1lbnRzLgo+Pj4+Cj4+Pj4gSmlzaGVuZyBaaGFuZyAoNCk6Cj4+Pj4gwqDCoCBy
aXNjdjogaW1wbGVtZW50IHVzZXJfYWNjZXNzX2JlZ2luKCkgYW5kIGZhbWlsaWVzCj4+Pj4gwqDC
oCByaXNjdjogdWFjY2VzczogdXNlIGlucHV0IGNvbnN0cmFpbnRzIGZvciBwdHIgb2YgX19wdXRf
dXNlcigpCj4+Pj4gwqDCoCByaXNjdjogdWFjY2VzczogdXNlICdhc20gZ290bycgZm9yIHB1dF91
c2VyKCkKPj4+PiDCoMKgIHJpc2N2OiB1YWNjZXNzOiB1c2UgJ2FzbV9nb3RvX291dHB1dCcgZm9y
IGdldF91c2VyKCkKPj4+Pgo+Pj4+IMKgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5o
IHwgMjA1ICsrKysrKysrKysrKysrKysrKysrKysgCj4+Pj4gKy0tLS0tLS0tCj4+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDE1MiBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4g
Rm9sbG93aW5nIHVwIG9uIEJlbidzIGNvbW1lbnQgaGVyZSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC0gCj4+PiByaXNjdi8gYjQ1YWFiMWUtNmQzNy00MDI3LTlhMTUtNGZhOTE3ZDgwNmI5
QGNvZGV0aGluay5jby51ay8KPj4+Cj4+PiBUaGUgcHJvYmxlbSB0aGF0IEJlbiBtZW50aW9ucyBp
cyBjYXVzZWQgYnkgdGhlIHVzZSBvZiAqbWFjcm9zKiB3aGljaCAKPj4+IHVzZWQgdG8gbWFrZSB0
aGUgZXZhbHVhdGlvbiBvZiB0aGUgcGFyYW1ldGVyIGluc2lkZSB0aGUgdXNlci0gCj4+PiBhY2Nl
c3NpYmxlIHNlY3Rpb24sIGFuZCBzaW5jZSB0aGlzIHBhcmFtZXRlciBjb3VsZCBiZSBhIHNsZWVw
aW5nIAo+Pj4gZnVuY3Rpb24sIHdlIGNvdWxkIHNjaGVkdWxlIGFub3RoZXIgcHJvY2VzcyB3aXRo
IHRoZSBTVU0gYml0IHNldCwgCj4+PiB3aGljaCBjb3VsZCBiZSBjbGVhcmVkIGJ5IHRoaXMgcHJv
Y2Vzcywgd2hpY2ggd291bGQgbWFrZSB0aGUgZmlyc3QgCj4+PiBwcm9jZXNzIGZhdWx0IHdoZW4g
dHJ5aW5nIHRvIGFjY2VzcyB1c2VyIG1lbW9yeS4gSSBkaWQgbm90IGZpbmQgYW55IAo+Pj4gbWFj
cm8gdXNpbmcgdW5zYWZlX1hYWCgpIGZ1bmN0aW9ucyB3aGljaCBjb3VsZCBjYXVzZSBhIHByb2Js
ZW0gcmlnaHQgCj4+PiBub3csIGJ1dCBJIG1heSBoYXZlIG1pc3NlZCBvbmUgYW5kIG5ldyBjb3Vs
ZCBjb21lIHVwIGxhdGVyLCBzbyB3ZSAKPj4+IGhhdmUgbXVsdGlwbGUgc29sdXRpb25zIGhlcmU6
Cj4+Pgo+Pj4gLSBzdXBwb3NlIHRoYXQgYSBtYWNybyB1c2luZyB1bnNhZmVfZ2V0L3B1dF91c2Vy
KCkgYW5kIHBhc3NpbmcgYSAKPj4+IHNsZWVwaW5nIGZ1bmN0aW9uIGFzIGFyZ3VtZW50IHdvbid0
IGhhcHBlbiBhbmQgdGhlbiBkbyBub3RoaW5nCj4+PiAtIG9yIHNhdmUvcmVzdG9yZSBDU1Igc3N0
YXR1cyB3aGVuIHN3aXRjaGluZyBwcm9jZXNzZXMKPj4+IC0gb3Igc2ltcGx5IGNoZWNrIHRoYXQg
U1VNIGlzIG5vdCBzZXQgd2hlbiBzd2l0Y2hpbmcgcHJvY2Vzc2VzCj4+Pgo+Pj4gTGV0IG1lIGtu
b3cgd2hhdCB5b3UgdGhpbmsuCj4+Cj4+IEknbSBvbiB0aGUgc2F2ZSB0aGUgZmxhZyBzaWRlLCBm
b3IgdGhlc2UgcmVhc29uczoKPj4KPj4gIzEgc2xlZXBpbmcgZnVuY3Rpb25zIGNhbiBoYXBwZW4g
bW9yZSBvZnRlbiB3aGVuIHZhcmlvdXMgY2hlY2tzCj4+IMKgwqDCoCBnZXQgZW5hYmxlZCBpbiB0
aGUga2VybmVsICh0aGlzIHdhcyB3aHkgdGhlIG9yaWdpbmFsIGZhdWx0Cj4+IMKgwqDCoCB3YXMg
Zm91bmQpLsKgIEFkZGluZyBsYXJnZXIgc2VjdGlvbnMgaXMganVzdCBnb2luZyB0byBtYWtlCj4+
IMKgwqDCoCB0aGUgZmF1bHQgcG9wIHVwIGFnYWluIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVy
ZS4KPj4KPj4gIzIgdGhlIHNhdmUvcmVzdG9yZSBpcyBhIHNtYWxsIGFkZGl0aW9uIHRvIHRoZSBz
d2FwIHJlZ2lzdGVycwo+Pgo+PiAjMyBzYXZpbmcgU1VNIG92ZXIgYSByZWdzIHN3YXAgaXMgYWx3
YXlzIGdvaW5nIHRvIG1ha2Ugc3VyZSB3ZQo+PiDCoMKgwqAgbmV2ZXIgc2VlIHRoaXMgZ3JlbWxp
biB0dXJuIHVwIGFnYWluCj4+Cj4+IEZZSSwgSSB0aGluayBJIG1heSBoYXZlIHBvc3RlZCBvdXIg
b3JpZ2luYWwgdGVzdCB0aHJlYWQgYXQgc29tZQo+PiBwb2ludCwgYnV0IEkgY291bGQgZG8gc28g
YWdhaW4uCj4gCj4gWWVzLCBhZnRlciBCZW4gcG9pbnRlZCBvdXQgdGhlIGlzc3VlIEkgY2FtZSB0
byB0aGUgY29uY2x1c2lvbiB3ZSAKPiBwcm9iYWJseSB3YW50IEJlbnMgcGF0Y2ggd2hpY2ggc2F2
ZXMgdGhlIGJpdC4gQXBvbG9naWVzIGlmIEkgZGlkbid0IAo+IGV4cHJlc3MgdGhpcyB0aG91Z2h0
IGluIGVtYWlsLgo+IAo+IEknbSBoYXBweSB0byB0YWtlIHRoZSBwYXRjaCBhbmQgcHV0IGl0IG9u
IHRoZSBmcm9udCBvZiB0aGlzIHNlcmllcywgCj4gYWx0aG91Z2ggcGVyaGFwcyBpdCBtYWtlcyBt
b3JlIHNlbnNlIHlvdSB0byByZXZpdmUgdGhlIHBhdGNoIHNpbmNlIAo+IHlvdSdyZSBzdGlsbCBh
cm91bmQgQmVuPwoKWWVzLCBJJ20gY3VycmVudGx5IHZlcnkgYnVzeSBzbyBoYXBweSBmb3Igc29t
ZW9uZSBlbHNlIHRvIGdldCB0aGlzCm1lcmdlZCBhbmQgdGVzdGVkLgoKV2UgY291bGQgZG8gd2l0
aCBzb21lIGJldHRlciB0ZXN0aW5nIG9uIHdoZXRoZXIgd2UgbGVhayBmbGFncyBvbgp0YXNrIHN3
aXRjaGVzIChwb3NzaWJseSksIGJ1dCB0aGF0J3MgYSBzaWRlIHF1ZXN0IGFuZCBub3QgZm9yIG5v
dy4KCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBF
bmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2Rl
dGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
