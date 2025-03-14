Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65727C35FF1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfpRdI87cekidbmdptLr1ovNyBbJ6aNbeyF7ZpJ6Wrc=; b=pB6LjHs1i1peFF
	1jkqw0Lmj0QYGWTF4tcwlUS9v4rOZnGQWNoecazE2J7VWNgRKaNEEb3wuV7qyQjVdGQzxsFc/K30F
	8TmkUpeAHKKFp/x7YyHUXX7htHN1q8WzIfGIg/Vv4s3FGFstaYiuPG/p7BllaO4S3Q8vVwiwcpEp1
	GpstqvswMmwq7+VGbXArpvhQrB8t2v1EUL6ctmL5O9QMW1+5PrgH5LzBTkhJbh+XQjoHENBGL0pHV
	19ydjZEVz19OMA+n2XLi1RfTHn8uT7mY+YKrzFSxtohbV51lbPS3lRaxLg1igOi4b3ZKUbG21410S
	pmwnS6//mtua/T6Z1itQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5RS-0000000EKR4-2PMG;
	Fri, 14 Mar 2025 13:51:14 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5Po-0000000EK83-13lx
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 13:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1zBOojnIvZ6+0aG++WWMyXS/rfcD8EpeSnNyagPabZA=; b=dvYvFpA8UnpGdxdYqfIk3Hn2bq
	kRfEwDRz/JVd5J/I5aE1/4/1mDwoXNE1uilin4Ik4A3Nlhpr92dl0AZQiixjRwC3qhHOUrsKeJn/3
	id9gl1xSGrtWPPb35b1sblc3+39OU4liSavBrca919M/5YhkZEo6hDAJStd+EPgKkEdJqzCKJAfoJ
	+nBNeY6Cid7WbG0M/hq92LeKtqBnaqq+PHNKICKm58sBpcuQpDA8mP6Ceukm6AE8AtQx0iMtMEGn3
	cUqgYAEyy3GAhh/uMmWDvgrv55CVPJ9xsBmI/jpr2uyWriZGymPIbrlSQTY+yHcda3pRBSmSDtcw5
	da55XW1g==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tt5Pe-00FJws-Mx; Fri, 14 Mar 2025 13:49:22 +0000
Message-ID: <5a81a72d-550d-42b4-8549-176f2b27ffc9@codethink.co.uk>
Date: Fri, 14 Mar 2025 13:49:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] riscv: uaccess: optimizations
To: Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 charlie@rivosinc.com, jrtc27@jrtc27.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 jszhang@kernel.org
References: <20250221000924.734006-1-cyrilbur@tenstorrent.com>
 <4f6c83c0-39f6-467d-83c6-13d37440fb20@ghiti.fr>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <4f6c83c0-39f6-467d-83c6-13d37440fb20@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_064932_378698_8F535D82 
X-CRM114-Status: GOOD (  31.44  )
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

T24gMTQvMDMvMjAyNSAxMzoyOCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIEN5cmlsLAo+
IAo+IE9uIDIxLzAyLzIwMjUgMDE6MDksIEN5cmlsIEJ1ciB3cm90ZToKPj4gVGhpcyBzZXJpZXMg
dHJpZXMgdG8gb3B0aW1pemUgcmlzY3YgdWFjY2VzcyBieSBhbGxvd2luZyB0aGUgdXNlIG9mCj4+
IHVzZXJfYWNjZXNzX2JlZ2luKCkgYW5kIHVzZXJfYWNjZXNzX2VuZCgpIHdoaWNoIHBlcm1pdHMg
Z3JvdXBpbmcgdXNlciAKPj4gYWNjZXNzZXMKPj4gYW5kIGF2b2lkaW5nIHRoZSBDU1Igd3JpdGUg
cGVuYWx0eSBmb3IgZWFjaCBhY2Nlc3MuCj4+Cj4+IFRoZSBlcnJvciBwYXRoIGNhbiBhbHNvIGJl
IG9wdGltaXNlZCB1c2luZyBhc20gZ290byB3aGljaCBwYXRjaGVzIDMgYW5kIDQKPj4gYWNoaWV2
ZS4gVGhpcyB3aWxsIHNwZWVkIHVwIGp1bXBpbmcgdG8gbGFiZWxzIGJ5IGF2b2lkaW5nIHRoZSBu
ZWVkIG9mIGFuCj4+IGludGVybWVkaWFyeSBlcnJvciB0eXBlIHZhcmlhYmxlIHdpdGhpbiB0aGUg
dWFjY2VzcyBtYWNyb3MKPj4KPj4gSSBkaWQgcmVhZCB0aGUgZGlzY3Vzc2lvbiB0aGlzIHNlcmll
cyBnZW5lcmF0ZWQuIEl0IGlzbid0IGNsZWFyIHRvIG1lCj4+IHdoaWNoIGRpcmVjdGlvbiB0byB0
YWtlIHRoZSBwYXRjaGVzLCBpZiBhbnkuCj4+Cj4+IFYyOgo+PiBJJ3ZlIHRha2VuIG9uIHRoaXMg
c2VyaWVzIGFzIHRoZXJlIGlzbid0IGFueSByZXNwb25zZSBmcm9tIEppc2hlbmcuIE5vCj4+IHNp
Z25pZmljYW50IGNoYW5nZXMgb3RoZXIgdGhhbiBidWlsZCBmaXhlcy4KPj4gLSBGaXhlcyBidWls
ZCBicmVha2FnZSBpbiBwYXRjaCAzIHRvIGRvIHdpdGggbm90IGhhdmluZyB1c2VkICdnb3RvJyAK
Pj4ga2V5d29yZC4KPj4gLSBGaXhlcyBidWlsZCBicmVha2FnZSBpbiBwYXRjaCA0IG9uIDMyYml0
IG5vdCBoYXZpbmcgZGVsY2FyZWQgX19wdHIgCj4+IGluIHRoZQo+PiDCoMKgIG1hY3JvLgo+Pgo+
PiBWMzoKPj4gU2lnbmlmaWNhbnQgY29tbWl0IG1lc3NhZ2UgcmV3cml0ZXMuCj4+IMKgIC0gQ29y
cmVjdGVkIHRoZSBqdXN0aWZpY2F0aW9uIGZvciBwYXRjaCAyCj4+IMKgIC0gQmV0dGVyIGV4cGxh
aW5lZC9qdXN0aWZpZWQgcGF0Y2hlcyAzIGFuZCA0Cj4+IE1pbm9yIGNvZGUgY2hhbmdlcyBmb3Ig
bGVnaWJpbGl0eSBhbmQgbW9yZSBjb21tZW50cy4KPj4KPj4gSmlzaGVuZyBaaGFuZyAoNCk6Cj4+
IMKgwqAgcmlzY3Y6IGltcGxlbWVudCB1c2VyX2FjY2Vzc19iZWdpbigpIGFuZCBmYW1pbGllcwo+
PiDCoMKgIHJpc2N2OiB1YWNjZXNzOiB1c2UgaW5wdXQgY29uc3RyYWludHMgZm9yIHB0ciBvZiBf
X3B1dF91c2VyKCkKPj4gwqDCoCByaXNjdjogdWFjY2VzczogdXNlICdhc20gZ290bycgZm9yIHB1
dF91c2VyKCkKPj4gwqDCoCByaXNjdjogdWFjY2VzczogdXNlICdhc21fZ290b19vdXRwdXQnIGZv
ciBnZXRfdXNlcigpCj4+Cj4+IMKgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwg
MjA1ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDE1MiBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkKPj4KPiBGb2xsb3dpbmcgdXAgb24g
QmVuJ3MgY29tbWVudCBoZXJlIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LyAK
PiBiNDVhYWIxZS02ZDM3LTQwMjctOWExNS00ZmE5MTdkODA2YjlAY29kZXRoaW5rLmNvLnVrLwo+
IAo+IFRoZSBwcm9ibGVtIHRoYXQgQmVuIG1lbnRpb25zIGlzIGNhdXNlZCBieSB0aGUgdXNlIG9m
ICptYWNyb3MqIHdoaWNoIAo+IHVzZWQgdG8gbWFrZSB0aGUgZXZhbHVhdGlvbiBvZiB0aGUgcGFy
YW1ldGVyIGluc2lkZSB0aGUgdXNlci1hY2Nlc3NpYmxlIAo+IHNlY3Rpb24sIGFuZCBzaW5jZSB0
aGlzIHBhcmFtZXRlciBjb3VsZCBiZSBhIHNsZWVwaW5nIGZ1bmN0aW9uLCB3ZSBjb3VsZCAKPiBz
Y2hlZHVsZSBhbm90aGVyIHByb2Nlc3Mgd2l0aCB0aGUgU1VNIGJpdCBzZXQsIHdoaWNoIGNvdWxk
IGJlIGNsZWFyZWQgYnkgCj4gdGhpcyBwcm9jZXNzLCB3aGljaCB3b3VsZCBtYWtlIHRoZSBmaXJz
dCBwcm9jZXNzIGZhdWx0IHdoZW4gdHJ5aW5nIHRvIAo+IGFjY2VzcyB1c2VyIG1lbW9yeS4gSSBk
aWQgbm90IGZpbmQgYW55IG1hY3JvIHVzaW5nIHVuc2FmZV9YWFgoKSAKPiBmdW5jdGlvbnMgd2hp
Y2ggY291bGQgY2F1c2UgYSBwcm9ibGVtIHJpZ2h0IG5vdywgYnV0IEkgbWF5IGhhdmUgbWlzc2Vk
IAo+IG9uZSBhbmQgbmV3IGNvdWxkIGNvbWUgdXAgbGF0ZXIsIHNvIHdlIGhhdmUgbXVsdGlwbGUg
c29sdXRpb25zIGhlcmU6Cj4gCj4gLSBzdXBwb3NlIHRoYXQgYSBtYWNybyB1c2luZyB1bnNhZmVf
Z2V0L3B1dF91c2VyKCkgYW5kIHBhc3NpbmcgYSAKPiBzbGVlcGluZyBmdW5jdGlvbiBhcyBhcmd1
bWVudCB3b24ndCBoYXBwZW4gYW5kIHRoZW4gZG8gbm90aGluZwo+IC0gb3Igc2F2ZS9yZXN0b3Jl
IENTUiBzc3RhdHVzIHdoZW4gc3dpdGNoaW5nIHByb2Nlc3Nlcwo+IC0gb3Igc2ltcGx5IGNoZWNr
IHRoYXQgU1VNIGlzIG5vdCBzZXQgd2hlbiBzd2l0Y2hpbmcgcHJvY2Vzc2VzCj4gCj4gTGV0IG1l
IGtub3cgd2hhdCB5b3UgdGhpbmsuCgpJJ20gb24gdGhlIHNhdmUgdGhlIGZsYWcgc2lkZSwgZm9y
IHRoZXNlIHJlYXNvbnM6CgojMSBzbGVlcGluZyBmdW5jdGlvbnMgY2FuIGhhcHBlbiBtb3JlIG9m
dGVuIHdoZW4gdmFyaW91cyBjaGVja3MKICAgIGdldCBlbmFibGVkIGluIHRoZSBrZXJuZWwgKHRo
aXMgd2FzIHdoeSB0aGUgb3JpZ2luYWwgZmF1bHQKICAgIHdhcyBmb3VuZCkuICBBZGRpbmcgbGFy
Z2VyIHNlY3Rpb25zIGlzIGp1c3QgZ29pbmcgdG8gbWFrZQogICAgdGhlIGZhdWx0IHBvcCB1cCBh
Z2FpbiBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUuCgojMiB0aGUgc2F2ZS9yZXN0b3JlIGlz
IGEgc21hbGwgYWRkaXRpb24gdG8gdGhlIHN3YXAgcmVnaXN0ZXJzCgojMyBzYXZpbmcgU1VNIG92
ZXIgYSByZWdzIHN3YXAgaXMgYWx3YXlzIGdvaW5nIHRvIG1ha2Ugc3VyZSB3ZQogICAgbmV2ZXIg
c2VlIHRoaXMgZ3JlbWxpbiB0dXJuIHVwIGFnYWluCgpGWUksIEkgdGhpbmsgSSBtYXkgaGF2ZSBw
b3N0ZWQgb3VyIG9yaWdpbmFsIHRlc3QgdGhyZWFkIGF0IHNvbWUKcG9pbnQsIGJ1dCBJIGNvdWxk
IGRvIHNvIGFnYWluLgoKPiAKPiBUaGFua3MsCj4gCj4gQWxleAo+IAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiAKCgotLSAKQmVuIERv
b2tzCQkJCWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29k
ZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3By
aXZhY3kuaHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
