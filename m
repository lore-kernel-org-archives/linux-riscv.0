Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C5CC5DF8C
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbFlRiM53ktVLx4fjDLC4J1pF/0+LrImxRXcNvGEPTU=; b=XTbylTviGI9X1+
	VzxulW79iD56TAcZGIBZ3lBCQ3PRKjuVAC7z89i9DNqkq/FHpVnarEAWzN50J/JdzI6+S1pHhpFND
	8G9Ya0zy7aBWeoA1W6mVhjpo3tje7hV65C7oVpPnEWJA0+UBzaG+go6UjYecXpTJoNqXpL6Fq3prj
	lb91ze3f4oHPFgZZR31VgAFxe+TZyuRNJSFNNj6NDWJfmkah8DoOcprH0OgEH7rOpIfNeXqilSef0
	pBfUDmISJilaAon/VhZ+53Sj6SAzvVsrB+lwz1CtQV60yBMDhhE0LPRhki18KAlOgNYFG39V3F6lL
	mjZz6wlN0l7zvFEVt8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxp2W-0000000Efxe-2ZTy;
	Sat, 22 Aug 2026 16:57:52 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxp2T-0000000EfxG-2W1s
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 16:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=yYKcqboW2hgBCm128jlsW+fEFCrg/+/6fC0pPe2118M=; b=ZbJz80fFfEN7nkrQcV8gZZ+oUE
	hK4b5lCtnutJj1yjrMLG1BeMt0eRSLfkdrmKM4eHnKGLezlJuWTp5PE4Yk5I8WwkhFUD/NLwoWW4n
	Kgoi6umxhGYQrdvfuOl1eQJfSB2LqC2y7kE7ojq4xPJnthVMSJ1B/QHaWoEf/g77lioyDCXJrLvb/
	oQl5Mf6I5KIUU5NF4+0OK4F/1HCTyG3AyKjVGEAWQTKkqOyLofBPXDv5TiWlXFVXOhetvM/QCUWOj
	m7wOT9QmpBgbf2IXG+RYeBlApw4DIxLHSB8HUlP5n8fh+hpB0Atv0lItGBl1gr+NsfEKmAfTF0dcm
	tc6UfpYw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wxp25-007Utx-Ae; Sat, 22 Aug 2026 18:57:25 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wxp24-0013TF-9m; Sat, 22 Aug 2026 18:57:25 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wxp24-00000002uHU-0yE7;
	Sat, 22 Aug 2026 18:57:24 +0200
MIME-Version: 1.0
Date: Sat, 22 Aug 2026 13:57:24 -0300
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
In-Reply-To: <aomlfGJM61qZKxx2@monoceros>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>
 <aomlfGJM61qZKxx2@monoceros>
Message-ID: <4e3eaf1d3419e808be046035f114bf6c@igalia.com>
X-Sender: mfo@igalia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_095749_933369_2E9DE2BF 
X-CRM114-Status: GOOD (  14.78  )
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

T24gMjAyNi0wOC0yMiAxMDo0MSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCgpI
ZXksCgo+IAo+IE9uIFdlZCwgQXVnIDE5LCAyMDI2IGF0IDAzOjE2OjE2UE0gLTAzMDAsIE1hdXJp
Y2lvIEZhcmlhIGRlIE9saXZlaXJhIHdyb3RlOgo+PiBUaGUgTU9EVUxFX1NZU0NUTF9UQUJMRSBt
YWNybyBlbWl0cyBhIHN0cnVjdCBtb2R1bGVfc3lzY3RsX3RhYmxlIHZhcmlhYmxlCj4+IHdpdGgg
cG9pbnRlcnMgdG8gYSBzeXNjdGwgdGFibGUncyBwYXRoIGFuZCBlbnRyaWVzLCBhbmQgdGFibGUv
ZW50cnkgc2l6ZXMuCj4gCj4gVGhhdCBuZXcgc3RydWN0IGRvZXNuJ3Qgc2VlbSB0byBjb250YWlu
IGFueSBwb2ludGVyPwoKVGhlIHN0cnVjdCBtb2R1bGVfc3lzY3RsX3RhYmxlIGZpZWxkcyAucGF0
aCBhbmQgLnRhYmxlIGFyZSBwb2ludGVycywKYWx0aG91Z2ggd2l0aCBrZXJuZWxfdWxvbmdfdCB0
eXBlIHNvIHRoYXQgdGhlIHNhbWUgMzIvNjQtYml0IHNpemUgaXMKdXNlZCBpbiBmaWxlMmFsaWFz
LmMgYmFzZWQgb24gS0VSTkVMX0VMRkNMQVNTIChhbmQgbm90IG9uIHRoZSBob3N0LAp3aGljaCBt
aWdodCBkaWZmZXIgd2l0aCBDUk9TU19DT01QSUxFKS4KCj4gCj4+IFRoYXQgc3ltYm9sIHdpbGwg
YmUgaGFuZGxlZCBieSBmaWxlMmFsaWFzLmMgKG1vZHBvc3QpIHdpdGggdGhlIGNoYW5nZXMgaW4K
Pj4gbW9kX2RldmljZXRhYmxlLmggYW5kIGRldmljZXRhYmxlLW9mZnNldHMuYy4KPj4gCj4+IFRo
ZSBvcHRpb24gbWFjcm9zIE1PRFVMRV9TWVNDVExfVEFCTEVfe0RJU0FCTEUsVU5JUVVFX0lEfSBj
YW4gYmUgdXNlZCBvbgo+PiBhIHBlci1maWxlIGJhc2lzIHRvIGRpc2FibGUgdGhlIG1hY3JvIGFu
ZCBjaGFuZ2UgdGhlIHN5bWJvbCBuYW1lIHBhdHRlcm4uCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBN
YXVyaWNpbyBGYXJpYSBkZSBPbGl2ZWlyYSA8bWZvQGlnYWxpYS5jb20+Cj4+IC0tLQo+PiAgaW5j
bHVkZS9saW51eC9tb2RfZGV2aWNldGFibGUuaCAgIHwgIDcgKysrKysrKwo+PiAgaW5jbHVkZS9s
aW51eC9zeXNjdGwuaCAgICAgICAgICAgIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+ICBzY3JpcHRzL21vZC9kZXZpY2V0YWJsZS1vZmZzZXRzLmMgfCAgNiAr
KysrKysKPj4gIDMgZmlsZXMgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygrKQo+IAo+IFBsZWFzZSBw
dXQgdGhlIG5ldyBzdHJ1Y3QgaW4gYSBzZXBhcmF0ZSBoZWFkZXIuIEFwYXJ0IGZyb20gbm90IGJl
aW5nCj4gYWJvdXQgYSBkZXZpY2UgdGFibGUsIEknbSBjdXJyZW50bHkgd29yayBvbiByZW1vdmlu
Zwo+IDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4uIFNlZSBjb21taXQKPiBhZDQyOGY1ODExYmQ3
ZmIzZDkxZmEwMDIxNzRkZTUzM2Y5ZGE5NGQ3IGZvciBtb3JlIGRldGFpbHMuCgpTdXJlOyBJIGxv
b2tlZCBhdCB0aGF0IGVhcmxpZXIgKHRoYW5rcyBmb3IgdGhlIGluc3RydWN0aXZlIGNvbW1pdApt
ZXNzYWdlLCBieSB0aGUgd2F5KSBhbmQgZm91bmQgdGhlIG5ldyBzdHJ1Y3QgdG8gYmUgc2ltaWxh
ciB0byAic3RydWN0CmNwdV9mZWF0dXJlIGlzbid0IHJlYWxseSBhIGRldmljZV9pZCBzdHJ1Y3Qi
IChub3QgbW92ZWQpLCBidXQgYXBwYXJlbnRseQptaXNzZWQgdGhlIHRyYWlsaW5nICJmb3cgbm93
Iiwgd2hpY2ggaXMgY2xlYXJlciBub3cuIEZpeGVkIGZvciB2NC4KClRoYW5rIHlvdSwKCj4gCj4g
QmVzdCByZWdhcmRzCj4gVXdlCgotLSAKTWF1cmljaW8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
