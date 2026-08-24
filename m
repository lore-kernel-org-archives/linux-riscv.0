Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C18C5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsOk0PB4+DqUksvuPZSwieCZITbq2TqXlGODq4KjQkc=; b=hYJOcuzAb9K9mV
	YYrU6R4JvmAQjnou0vdIWORpMCctWaCqsjqViZKK8Gw9VQY9EW94brwF6BATDjAnsAN17h+FecMuJ
	HiiZMfEtdwA0Xe0ogb88rLHWrt9KAnBbSc0XiQNUa0rOrNKDGfHk4GLpo91WlF3DIcqDxrTavxoKD
	C1b5cobkd89e6ewSi8UIjjb9lFLkRFXS6aLqst/nQZGqc6zY3HTeNPQ0HrtHOUmIrFFswvJ/ljxxn
	p4liV0Joxz6jltmnahLwxe7oGPVmDOy0YA0RiNKP0QpdPjySfu0PinA9Z1eGUrFh88YggQL5G/7wc
	MSbvMjV2kmVbJouoHQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybqI-0000000HO80-34mW;
	Mon, 24 Aug 2026 21:04:30 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybqE-0000000HO7T-307k
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 21:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=8Sz3WqkTSXrjfECQs9syX3OabIkTQfaoXng/2r3y3YI=; b=iN4IZpg94uQW7Qq71fa8RM3vEW
	kYkZAE7Go3UMAHPCbMam59vi5F2G4bm4hWXaQvDe+IlXyYEvE3ysOyCUtZqscnptJn7q2InbNaFyu
	soOubYTTGaNo34QYmi9ty2VVZJpRy9sTLLWPw/LK3yUGKpUbS/U50cLhVIERjuM4Ft+aoWfPy9dJE
	gK9eUfYGXhRTBPX+kELcjgSnMYflg6ghgE0MkoYvLv42MzvqNcu61ANFS228b1Ien6EVqp3z8FXTb
	NuEjADHZt8gwoX1gXWGgh+2+Dm/yjJ9PlQHQ27wXDkIEUhwmsrSPlTWDbQQk59YiDr1KX9MY2E47t
	G2P9q0Eg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wybpt-008hfh-DY; Mon, 24 Aug 2026 23:04:05 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wybps-003b3A-2i; Mon, 24 Aug 2026 23:04:05 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wybps-00000003RKa-04eN;
	Mon, 24 Aug 2026 23:04:03 +0200
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 18:04:03 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, kernel-dev@igalia.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 fsverity@lists.linux.dev, keyrings@vger.kernel.org, bpf@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
 lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-sctp@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
 bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com,
 virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
In-Reply-To: <aotteDcc588iwC6g@monoceros>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>
 <aomlfGJM61qZKxx2@monoceros> <4e3eaf1d3419e808be046035f114bf6c@igalia.com>
 <aotteDcc588iwC6g@monoceros>
Message-ID: <4aa22e41e8ff4bab6638cf0baaa9d07b@igalia.com>
X-Sender: mfo@igalia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_140426_758866_A196DFCC 
X-CRM114-Status: GOOD (  30.02  )
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

T24gMjAyNi0wOC0yMyAxOToxMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gTWF1
cmljaW8sCj4gCj4gT24gU2F0LCBBdWcgMjIsIDIwMjYgYXQgMDE6NTc6MjRQTSAtMDMwMCwgTWF1
cmljaW8gRmFyaWEgZGUgT2xpdmVpcmEgd3JvdGU6Cj4+IE9uIDIwMjYtMDgtMjIgMTA6NDEsIFV3
ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+PiA+IE9uIFdlZCwgQXVnIDE5LCAyMDI2IGF0IDAzOjE2
OjE2UE0gLTAzMDAsIE1hdXJpY2lvIEZhcmlhIGRlIE9saXZlaXJhIHdyb3RlOgo+PiA+PiBUaGUg
TU9EVUxFX1NZU0NUTF9UQUJMRSBtYWNybyBlbWl0cyBhIHN0cnVjdCBtb2R1bGVfc3lzY3RsX3Rh
YmxlIHZhcmlhYmxlCj4+ID4+IHdpdGggcG9pbnRlcnMgdG8gYSBzeXNjdGwgdGFibGUncyBwYXRo
IGFuZCBlbnRyaWVzLCBhbmQgdGFibGUvZW50cnkgc2l6ZXMuCj4+ID4gCj4+ID4gVGhhdCBuZXcg
c3RydWN0IGRvZXNuJ3Qgc2VlbSB0byBjb250YWluIGFueSBwb2ludGVyPwo+PiAKPj4gVGhlIHN0
cnVjdCBtb2R1bGVfc3lzY3RsX3RhYmxlIGZpZWxkcyAucGF0aCBhbmQgLnRhYmxlIGFyZSBwb2lu
dGVycywKPj4gYWx0aG91Z2ggd2l0aCBrZXJuZWxfdWxvbmdfdCB0eXBlIHNvIHRoYXQgdGhlIHNh
bWUgMzIvNjQtYml0IHNpemUgaXMKPj4gdXNlZCBpbiBmaWxlMmFsaWFzLmMgYmFzZWQgb24gS0VS
TkVMX0VMRkNMQVNTIChhbmQgbm90IG9uIHRoZSBob3N0LAo+PiB3aGljaCBtaWdodCBkaWZmZXIg
d2l0aCBDUk9TU19DT01QSUxFKS4KPiAKPiBDcm9zcyBjb21waWxhdGlvbiBpc24ndCBhbiBpc3N1
ZSBmb3IgdGhlIGFscmVhZHkgZXhpc3RpbmcgZGV2aWNlIGlkCj4gc3RydWN0dXJlczsgbWFueSBv
ZiB0aGVtIGFsc28gY29udGFpbiBwb2ludGVycy4KPiAoV2hpbGUgbW9kcG9zdCBkb2Vzbid0IHVz
ZSB0aGUgcG9pbnRlcnMsIHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3R1cmVzIG11c3QKPiBiZSBrbm93
biB0byBjb3JyZWN0bHkgaW50ZXJwcmV0IHRoZSBhcnJheXMuKQoKSW5kZWVkLiBJIG1pc3NlZCBz
b21lIGRldmljZV9pZCBzdHJ1Y3R1cmVzIHdpdGggcG9pbnRlcnMsIGFuZCB0aGF0CmRldmljZXRh
YmxlLW9mZnNldHMuYyBpcyBjcm9zcy1jb21waWxlZCB0byBnZW5lcmF0ZQpkZXZpY2V0YWJsZS1v
ZmZzZXRzLmggZm9yIGZpbGUyYWxpYXMuYyB0byB1c2Ugb2Zmc2V0cyBhbmQgc2l6ZXMgb2YgdGhl
CnRhcmdldCBhcmNoaXRlY3R1cmUuCgpJJ2xsIGNoYW5nZSAucGF0aCBhbmQgLnRhYmxlIHRvIHBv
aW50ZXJzIGluIHRoZSBuZXh0IHZlcnNpb24uCgo+IEFsc28gc2l6ZW9mKGxvbmcpIGRpZmZlcnMg
YmV0d2VlbiBhcmNoaXRlY3R1cmVzIGFuZCBJIGNhbiBjb21waWxlIGZvcgo+IGFybSgzMikganVz
dCBmaW5lIG9uIGFtZDY0Lgo+IAo+IEFkZGl0aW9uYWxseSB0aGVyZSBpcyBoYXJkd2FyZSBvdXQg
dGhlcmUgdGhhdCBoYXMgc2l6ZW9mKHZvaWQgKikgPSAxNgo+IGJ1dCBzaXplb2YobG9uZykgPSA4
LiBVcCB1bnRpbCByZWNlbnRseSBJIHdvcmtlZCBvbiBtYWlubGluaW5nIHRoYXQgKGFuZAo+IGl0
IGhhcyBidXNpbmVzcyByZWFzb25zIG9ubHkgSSBzdG9wcGVkLCBzbyBJIGd1ZXNzIGFuZCBob3Bl
IEkgd2lsbAo+IGNvbnRpbnVlIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZSkuIFNlZQo+IGh0
dHBzOi8vbHduLm5ldC9BcnRpY2xlcy8xMDM3OTc0LyBmb3Igc29tZSBkZXRhaWxzIGlmIHlvdSdy
ZSBpbnRlcmVzdGVkLgoKQ29vbC4KCj4gCj4gSSB3b3VsZCBiZSBncmVhdCBpZiB5b3VyIHNlcmll
cyBkaWRuJ3QgaW50cm9kdWNlIGEgbmV3IG9ic3RhY2xlIGZvcgo+IHRoYXQuCgpBYnNvbHV0ZWx5
LiBJJ2xsIGJlIGhhcHB5IHRvIGFkanVzdCB0aGUgc2VyaWVzIGFuZCB0ZXN0aW5nIGZvciB0aGF0
LgoKQ291bGQgeW91IHBsZWFzZSBjb25maXJtIG9uZSBzaG91bGQganVzdCBmb2xsb3cgWzFdLCB3
aGljaCB1c2VzIFsyXSB0bwpidWlsZCB0aGUgTExWTSB0b29sY2hhaW4sIGFuZCB1c2UgaXQgdG8g
YnVpbGQgdGhlIGtlcm5lbCBbM10/CgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2NoZXJpLWxpbnV4
I2J1aWxkaW5nLWFuZC1ydW5uaW5nClsyXSBodHRwczovL2dpdGh1Yi5jb20vY2hlcmktbGludXgv
YnVpbGRyb290ClszXSBodHRwczovL2dpdGh1Yi5jb20vQ0hFUkktQWxsaWFuY2UvbGludXgvdHJl
ZS9jb2Rhc2lwLWNoZXJpLXJpc2N2LTcuMQoKPj4gPj4gVGhhdCBzeW1ib2wgd2lsbCBiZSBoYW5k
bGVkIGJ5IGZpbGUyYWxpYXMuYyAobW9kcG9zdCkgd2l0aCB0aGUgY2hhbmdlcyBpbgo+PiA+PiBt
b2RfZGV2aWNldGFibGUuaCBhbmQgZGV2aWNldGFibGUtb2Zmc2V0cy5jLgo+PiA+PiAKPj4gPj4g
VGhlIG9wdGlvbiBtYWNyb3MgTU9EVUxFX1NZU0NUTF9UQUJMRV97RElTQUJMRSxVTklRVUVfSUR9
IGNhbiBiZSB1c2VkIG9uCj4+ID4+IGEgcGVyLWZpbGUgYmFzaXMgdG8gZGlzYWJsZSB0aGUgbWFj
cm8gYW5kIGNoYW5nZSB0aGUgc3ltYm9sIG5hbWUgcGF0dGVybi4KPj4gPj4gCj4+ID4+IFNpZ25l
ZC1vZmYtYnk6IE1hdXJpY2lvIEZhcmlhIGRlIE9saXZlaXJhIDxtZm9AaWdhbGlhLmNvbT4KPj4g
Pj4gLS0tCj4+ID4+ICBpbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oICAgfCAgNyArKysr
KysrCj4+ID4+ICBpbmNsdWRlL2xpbnV4L3N5c2N0bC5oICAgICAgICAgICAgfCA0MiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gPj4gIHNjcmlwdHMvbW9kL2Rldmlj
ZXRhYmxlLW9mZnNldHMuYyB8ICA2ICsrKysrKwo+PiA+PiAgMyBmaWxlcyBjaGFuZ2VkLCA1NSBp
bnNlcnRpb25zKCspCj4+ID4gCj4+ID4gUGxlYXNlIHB1dCB0aGUgbmV3IHN0cnVjdCBpbiBhIHNl
cGFyYXRlIGhlYWRlci4gQXBhcnQgZnJvbSBub3QgYmVpbmcKPj4gPiBhYm91dCBhIGRldmljZSB0
YWJsZSwgSSdtIGN1cnJlbnRseSB3b3JrIG9uIHJlbW92aW5nCj4+ID4gPGxpbnV4L21vZF9kZXZp
Y2V0YWJsZS5oPi4gU2VlIGNvbW1pdAo+PiA+IGFkNDI4ZjU4MTFiZDdmYjNkOTFmYTAwMjE3NGRl
NTMzZjlkYTk0ZDcgZm9yIG1vcmUgZGV0YWlscy4KPj4gCj4+IFN1cmU7IEkgbG9va2VkIGF0IHRo
YXQgZWFybGllciAodGhhbmtzIGZvciB0aGUgaW5zdHJ1Y3RpdmUgY29tbWl0Cj4+IG1lc3NhZ2Us
IGJ5IHRoZSB3YXkpIGFuZCBmb3VuZCB0aGUgbmV3IHN0cnVjdCB0byBiZSBzaW1pbGFyIHRvICJz
dHJ1Y3QKPj4gY3B1X2ZlYXR1cmUgaXNuJ3QgcmVhbGx5IGEgZGV2aWNlX2lkIHN0cnVjdCIgKG5v
dCBtb3ZlZCksIGJ1dCBhcHBhcmVudGx5Cj4+IG1pc3NlZCB0aGUgdHJhaWxpbmcgImZvdyBub3ci
LCB3aGljaCBpcyBjbGVhcmVyIG5vdy4gRml4ZWQgZm9yIHY0Lgo+IAo+IFllYWgsIEkgZGlkbid0
IG1vdmUgdGhhdCBiZWNhdXNlIGl0IHdhcyBhbiBvdXRsaWVyIGluIHRoZSBoZWFkZXIgYXMgaXQn
cwo+IG5vdCBhIGRldmljZSBpZC4gSU1ITyBpdCBzaG91bGQgZ28gdG8gc29tZXRoaW5nIGxpa2UK
PiBpbmNsdWRlL2xpbnV4L2NwdV9mZWF0dXJlLmguCgpBY2suCgpjaGVlcnMsCgo+IAo+IEJlc3Qg
cmVnYXJkcwo+IFV3ZQoKLS0gCk1hdXJpY2lvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
