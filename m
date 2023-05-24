Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B69BC7EE2D
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 20:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wZAVlOPMjaS7kq7lv2zfowmFwsUTHKELteu0n6r4uM=; b=QVKfNGspYNU4zS
	A6gkglrhqadPEnVBNExKAkp+SmeeqFALa2Bn3hVbTbs9W5U0I/7MFlCCb6XKfY8jM7VjtldUOnrIz
	zIUE9tUhTWhFv0fLnmS3cRKCIAXGTrAcL3yyz60jBf9hpoGEUvr9SPN6TNQBTvCGdmzJYfxsw90JT
	9Y+jUy7ZbK8dpVwXANvXZgtb5zWZSOFfqe31tjDsYq7I/eUEJCtpFzPk1Z6xMfDhrLZwQ3xMyWxCH
	BXhc3LURJt+xmZ0kCMZg8U/iLBaayymTVwpTOminYlS+DZS8x8OYoSFZaMpE7g0NZaSeTSQW3b+pd
	SGCugHBVfdeK+O2UBXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1v14-00Ebby-0f;
	Wed, 24 May 2023 20:23:26 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1v11-00Ebb0-1W
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 20:23:25 +0000
Date: Wed, 24 May 2023 22:23:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1684959801; bh=KBR+D5DkiEabYDakDmSuQC67ISME1Q3hgqDEWVsqjMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0YLG6pn5tmEp6NyVYaG5HAAlcAJ4N1aXkQRyvb6/j4CVevfkuOWmme/cGz97ViEB
	 z5J56HrqK9kMm3mS7OKFM014cOWiVWQq2ZDgcyF8qy1qrg+uY/W1rjc/MiWNioAmEF
	 MORGw0mDiOZlyHMpoTk5kgOMXGrWssNzXauX2XeM=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com
Subject: Re: [PATCH 03/13] selftests/nolibc: print name instead of number for
 EOVERFLOW
Message-ID: <aece1813-e20a-4645-b86e-b1d9e2ae9934@t-8ch.de>
References: <cover.1684949267.git.falcon@tinylab.org>
 <e3c9bf5ccdae920f0609486256c52de8233aecb6.1684949267.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3c9bf5ccdae920f0609486256c52de8233aecb6.1684949267.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_132323_662998_810560CD 
X-CRM114-Status: GOOD (  10.47  )
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

T24gMjAyMy0wNS0yNSAwMTo0Njo1NCswODAwLCBaaGFuZ2ppbiBXdSB3cm90ZToKPiBFT1ZFUkZM
T1cgd2lsbCBiZSB1c2VkIGluIHRoZSBjb21pbmcgdGltZTY0IHN5c2NhbGxzIHN1cHBvcnQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4KClJldmll
d2VkLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8bGludXhAd2Vpc3NzY2h1aC5uZXQ+Cgo+IC0tLQo+
ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYyB8IDEgKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYwo+IGluZGV4IGM1NzBiYjg0OGMxYS4uMjI3ZWYyYTNl
YmJhIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL25vbGliYy9ub2xpYmMt
dGVzdC5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0
LmMKPiBAQCAtMTA2LDYgKzEwNiw3IEBAIGNvbnN0IGNoYXIgKmVycm9ybmFtZShpbnQgZXJyKQo+
ICAJQ0FTRV9FUlIoRURPTSk7Cj4gIAlDQVNFX0VSUihFUkFOR0UpOwo+ICAJQ0FTRV9FUlIoRU5P
U1lTKTsKPiArCUNBU0VfRVJSKEVPVkVSRkxPVyk7Cj4gIAlkZWZhdWx0Ogo+ICAJCXJldHVybiBp
dG9hKGVycik7Cj4gIAl9Cj4gLS0gCj4gMi4yNS4xCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
