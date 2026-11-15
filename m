Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EBE606A329
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 21:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1RneW0JO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8vh/Cdp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S9O+ewVinemU/6/c3GjMVMRYhXkQVv6WG7M1F1/M7x4=; b=1RneW0JOF5Zn6Uyp6EbIqQTCey
	tJhxr2zwa5t/FDK0ZxwaSVXhqSMk+bIbVsj/iTZeIYeLRlbdSMSAYOyeKupyylQJYeTI42kO8QHfM
	YuqD/9Yo2IC+6PNSIQNVyMOnSM4a+yCtFHFbQsTnZWRRMfVXXYdmFA0g5I6fQQ9OyTBX2jgULqims
	ucuSbduGOCszQoXawDUSQGrU9X6a4xJBAWDe5wRE48LVYrq7WtcmOLvB2XBKYh32FCdpmzwQNnY4v
	MrDp8oFbR3jeMDtWoI/6T18cV/psyBmIzLGBeGbSsm5hAyuAR2+BAkaswDeNxZgX8FjUt0XbROR6I
	4+c7QZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShOh-00000000TTl-0n4m;
	Sun, 15 Nov 2026 21:04:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xShOg-00000000TTc-1V6t
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 21:04:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E2D962519;
	Sun, 15 Nov 2026 21:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511531F000D0;
	Sun, 15 Nov 2026 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794776661;
	bh=PibRXBXiLpEoEbrOvo9EmvvXD/tNRe86o7ZaehpKWYs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K8vh/CdpYRyzwm0mUWnyI8gQ53va8B51wGcaknHqxStrbFH0AOJs/yiYVXL8vwuAI
	 u6ABzUdt4hA0NXAYqXMRhgUWePQEbxOpKsqtu1SRm7kQ8/TVz7YwkvaKQuxaa+t03w
	 /RJuvOkbtP6Z6Kh3pQ07oLA3OqYC988MO2xVJkt+FysoJKxi1B5XengvfhtdMX01vq
	 oQ/fska3x/C8swtUp9rdcujdL+wX9aeijnkgbB9bp0jm76EuQkC+WslEp4M6SpyHoY
	 tRJO8ISjjwlNp8WigaBXH3QYsUqBEopsfTUu2vh/TyNo5mMsKbiAj3bhFuKpbTyyTt
	 MwQAMkhSGpAxw==
Subject: Re: [PATCH net] net: macb: limit jumbo frames to the RX buffer size
From: netdev-bot+sashiko@kernel.org
To: gaohan@iscas.ac.cn
Cc: theo.lebrun@bootlin.com, conor.dooley@microchip.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 punnaia@xilinx.com, harini.katakam@xilinx.com,
 linux-riscv@lists.infradead.org, rabenda.cn@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhengjingkun@iscas.ac.cn
Date: Sun, 15 Nov 2026 21:04:19 +0000
Message-ID: <179477665987.3136.1735758740648548604@kernel.org>
In-Reply-To: <20261114-macb-jumbo-jml-v1-1-f501395eaf9e@iscas.ac.cn>
References: <20261114-macb-jumbo-jml-v1-1-f501395eaf9e@iscas.ac.cn>
X-sashiko-severity: Medium
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUocykgdG8gY29uc2lkZXIuCgpDcml0aWNhbDogMCDCtyBIaWdoOiAw
IMK3IE1lZGl1bTogMSDCtyBMb3c6IDAKCklmIHlvdSBiZWxpZXZlIG5vbmUgb2YgdGhlIGlzc3Vl
cyBhcmUgbGVnaXRpbWF0ZSwgcGxlYXNlIHJlcGx5IHRvIGVhY2gKaXNzdWUgb2YgTWVkaXVtIHNl
dmVyaXR5IG9yIGhpZ2hlciBhbmQgZXhwbGFpbiB3aHkgdGhlIEFJIGlzIHdyb25nLgpJZiBhbnkg
b2YgdGhlbSBhcmUgbGVnaXRpbWF0ZSBhbmQgeW91IHBsYW4gdG8gcmVzcGluLCBwbGVhc2UgbGV0
IHBhdGNod29yawprbm93IGJ5IGluY2x1ZGluZyAicHctYm90OiBjciIgYXMgYSBzZXBhcmF0ZSBs
aW5lIGF0IHRoZSBlbmQgb2YgeW91ciByZXBseQoob25lIHN1Y2ggcmVwbHkgcGVyIHNlcmllcyBp
cyBlbm91Z2gpLgoKLSBbTWVkaXVtXSBJbiBkcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21h
Y2JfbWFpbi5jLAogIGdlbV9qdW1ib19tYXhfbGVuKCkgc2V0cyB0aGUgR0VNIEpNTCByZWdpc3Rl
ciB0byByeF9idWZmZXJfc2l6ZSAt4oCmCgotLQoKbmV0OiBtYWNiOiBsaW1pdCBqdW1ibyBmcmFt
ZXMgdG8gdGhlIFJYIGJ1ZmZlciBzaXplCgpUaGlzIGNvbW1pdCBtb3ZlcyB0aGUgSk1MIHJlZ2lz
dGVyIHdyaXRlIGZyb20gbWFjYl9pbml0X2h3KCkgaW50bwptYWNiX2NvbmZpZ3VyZV9kbWEoKS4g
SXQgbm93IGRlcml2ZXMgdGhlIEpNTCB2YWx1ZSBmcm9tIHRoZSBSWCBidWZmZXIKc2l6ZSByYXRo
ZXIgdGhhbiBmcm9tIGp1bWJvX21heF9sZW4uIFdpdGggdGhpcywgdGhlIE1BQyBkcm9wcyBmcmFt
ZXMgdGhhdAp3b3VsZCBvdGhlcndpc2UgYmUgc3BsaXQgb3ZlciBzZXZlcmFsIFJYIGRlc2NyaXB0
b3JzIGFuZCB0aGVuIHJlamVjdGVkCmJ5IGdlbV9yeCgpLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L2NhZGVuY2UvbWFjYl9tYWluLmMKPiBpbmRleCA1YWQwZTMyZTJiNDAwLi5lN2M5YmIyNGMzNzdi
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NhZGVuY2UvbWFjYl9tYWluLmMK
PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2JfbWFpbi5jCj4gQEAgLTMy
NDAsNiArMzI0MCwxOCBAQCBzdGF0aWMgdTMyIG1hY2JfZGJ3KHN0cnVjdCBtYWNiICpicCkKPiAg
CX0KPiAgfQo+ICAKPiArLyogTG9uZ2VzdCBmcmFtZSB0aGF0IGZpdHMgaW4gYSBzaW5nbGUgUlgg
YnVmZmVyICovCj4gK3N0YXRpYyB1MzIgZ2VtX2p1bWJvX21heF9sZW4oc3RydWN0IG1hY2IgKmJw
KQo+ICt7Cj4gKwl1MzIgbGVuID0gYnAtPmN0eC0+cnhfYnVmZmVyX3NpemU7Cj4gKwo+ICsJLyog
RnJhbWUgZGF0YSBzdGFydHMgTkVUX0lQX0FMSUdOIGJ5dGVzIGludG8gdGhlIGJ1ZmZlciB3aXRo
b3V0IFJTQyAqLwo+ICsJaWYgKCEoYnAtPmNhcHMgJiBNQUNCX0NBUFNfUlNDKSkKPiArCQlsZW4g
LT0gTkVUX0lQX0FMSUdOOwo+ICsKPiArCXJldHVybiBtaW4obGVuLCBicC0+anVtYm9fbWF4X2xl
bik7Cj4gK30KCltTZXZlcml0eTogTWVkaXVtXQpJcyB0aGUgdmFsdWUgcmV0dXJuZWQgaGVyZSA0
IGJ5dGVzIHNtYWxsZXIgdGhhbiB0aGUgbG9uZ2VzdCBmcmFtZSB0aGF0CmFjdHVhbGx5IGZpdHMg
aW4gb25lIFJYIGJ1ZmZlcj8KCm1hY2JfaW5pdF9odygpIGFsd2F5cyBzZXRzIERSRkNTLiBUaGUg
TUFDIHN0cmlwcyB0aGUgRkNTIGJlZm9yZSBETUEsIHNvCnRoZSBGQ1MgbmV2ZXIgdGFrZXMgdXAg
c3BhY2UgaW4gdGhlIFJYIGJ1ZmZlcjoKCgljb25maWcgfD0gTUFDQl9CSVQoRFJGQ1MpOwkJLyog
RGlzY2FyZCBSeCBGQ1MgKi8KClRoZSByZXN0IG9mIHRoZSBkcml2ZXIgdHJlYXRzIGp1bWJvX21h
eF9sZW4sIGFuZCBzbyBKTUwsIGFzIGFuIG9uLXdpcmUKbGVuZ3RoIHRoYXQgaW5jbHVkZXMgdGhl
IEZDUy4gRm9yIGV4YW1wbGUsIG1hY2JfcHJvYmUoKSBkb2VzOgoKCW5ldGRldi0+bWF4X210dSA9
IE1JTihicC0+anVtYm9fbWF4X2xlbiwgUlhfQlVGRkVSX01BWCkgLQoJCQkJRVRIX0hMRU4gLSBF
VEhfRkNTX0xFTjsKCldpdGhvdXQgUlNDLCB0aGF0IG1ha2VzIHRoZSBsYXJnZXN0IHdpcmUgZnJh
bWUgdGhhdCBmaXRzIGluIG9uZQpkZXNjcmlwdG9yIHJ4X2J1ZmZlcl9zaXplIC0gTkVUX0lQX0FM
SUdOICsgRVRIX0ZDU19MRU4uIFdpcmUgZnJhbWVzIGZyb20KcnhfYnVmZmVyX3NpemUgLSAxIHRv
IHJ4X2J1ZmZlcl9zaXplICsgMiBieXRlcyBmaXQgaW4gYSBzaW5nbGUgYnVmZmVyCmFuZCB3ZXJl
IHJlY2VpdmVkIGJlZm9yZSB0aGlzIHBhdGNoLiBXaXRoIHRoZSBKTUwgcHJvZ3JhbW1lZCBieQpt
YWNiX2NvbmZpZ3VyZV9kbWEoKSwgdGhlIE1BQyBub3cgZHJvcHMgdGhlbS4KClNvbWUgY29uY3Jl
dGUgY2FzZXM6CgpPbiBwaWM2NGhwc2MgKGp1bWJvX21heF9sZW4gPSAxNjM4MyksIG1heF9tdHUg
aXMKTUlOKDE2MzgzLCAxNjMyMCkgLSAxOCA9IDE2MzAyLiBtYWNiX3J4X2J1ZmZlcl9zaXplKCkg
cmV0dXJucwpNSU4oMTYzMDIgKyAyMCwgUlhfQlVGRkVSX01BWCkgPSAxNjMyMCwgc28gSk1MIGJl
Y29tZXMgMTYzMTguIEEKZnVsbC1zaXplIHVudGFnZ2VkIGZyYW1lIGF0IE1UVSAxNjMwMiBpcyAx
NjMyMCBieXRlcyBvbiB0aGUgd2lyZSwgc28gdGhlCk1BQyBkcm9wcyBpdC4gWWV0IGl0cyAxNjMx
NiBzdG9yZWQgYnl0ZXMgcGx1cyB0aGUgMiBieXRlIG9mZnNldCBmaXQgaW4KdGhlIGJ1ZmZlci4g
TVRVIDE2MzAxIGZhaWxzIHRoZSBzYW1lIHdheS4KCm1hY2JfcnhfYnVmZmVyX3NpemUoKSBkb2Vz
IG5vdCByZXNlcnZlIFZMQU5fSExFTi4gQXQgTVRVIDE1MTMtMTUxNiwKcnhfYnVmZmVyX3NpemUg
aXMgMTUzNiBhbmQgSk1MIGlzIDE1MzQuIE1UVS1zaXplZCBWTEFOIHRhZ2dlZCBmcmFtZXMKKDE1
MzUtMTUzOCBieXRlcyBvbiB0aGUgd2lyZSkgYXJlIHRoZXJlZm9yZSBkcm9wcGVkLCBldmVuIHRo
b3VnaCB0aGV5CmZpdCBpbiB0aGUgYnVmZmVyLiBNVFUgOTAwMS05MDA0IGhhcyB0aGUgc2FtZSBw
cm9ibGVtLgoKV2l0aCBRaW5RIGF0IE1UVSA5MDAwLCBhIDkwMjYgYnl0ZSBmcmFtZSBpcyBsYXJn
ZXIgdGhhbiBKTUwgOTAyMiBhbmQgaXMKZHJvcHBlZC4gSXRzIDkwMjIgc3RvcmVkIGJ5dGVzIHBs
dXMgMiBmaXQgaW4gdGhlIDkwMjQgYnl0ZSBidWZmZXIuCgpTaG91bGQgdGhpcyBhZGQgRVRIX0ZD
U19MRU4sIHJlbHlpbmcgb24gRFJGQ1MgYWx3YXlzIGJlaW5nIHNldCwgYmVmb3JlCmNsYW1waW5n
IHRvIGp1bWJvX21heF9sZW4/IFRoZSByZXBvcnRlZCBGVTc0MCBkZWZhdWx0IE1UVSBjYXNlIHdv
dWxkCnN0aWxsIGJlIGZpeGVkIHdpdGggdGhhdCBjaGFuZ2UuCgpbIC4uLiBdCgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9uZXRkZXYtYWkuYm90cy5saW51eC5kZXYvc2FzaGlrby8j
L3BhdGNoc2V0LzIwMjYxMTE0LW1hY2ItanVtYm8tam1sLXYxLTEtZjUwMTM5NWVhZjllJTQwaXNj
YXMuYWMuY24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
