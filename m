Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8417C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 14:05:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BB4023A22
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 14:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BB4023A22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=41XEq9f7C+WN1wQOEOoyv/urzHFyR3O/Zz8foTT9VBM=; b=EPc2gvdRJQpJykICYC5MXFeWY
	KzaDBrKY4jNiIJKqnmyCZOMvvqYbAW4KKqavFxyuFAzgLU0DDRnO8suPovZMP8lACq+B7wnp5FpOn
	WfI4TTUqkV0J2iL3dUJJ/u+T6HfkkFMTG1VPI1VvDa+dPwp00tLHvwN7qYVAGnnDCfWm0xi4YVskC
	MascU0SO1MNcMjGUY0w3hqHD7+HzZAYOBkaam/tfESw9Ewigiq1EvAk3eUN1zdaOxDTtaJbZTJiu3
	EFy7qNEhlgpGxJ96EABQewTSXa9Q43WHcjzlLhxVe8noWNjlkN0HlOvsJBrXwrICirjYB1rQrKsD0
	vy9DYarKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmdcJ-0002c8-7V; Tue, 08 Dec 2020 14:05:23 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmdcG-0002Zq-QP
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 14:05:22 +0000
Received: from [192.168.1.155] ([95.117.39.192]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mzhax-1jzus61WUL-00viD2; Tue, 08 Dec 2020 15:05:07 +0100
Subject: Re: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
 <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <51d3efb7-b7eb-83d7-673a-308dd51616d3@metux.net>
Date: Tue, 8 Dec 2020 15:04:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb4R4yHcUV2KbGEC_RkU+QmH6Xg7X+qee8sEa9TURGr8A@mail.gmail.com>
Content-Language: tl
X-Provags-ID: V03:K1:G4pb0xE5H22ojPKBimkPJ8QHTZy9Ztkg67vq+dnwAqAyIP7Owjp
 PtM4xLyYwEOsOB5Jeky7p0oHn4OV0smr3NYA6ZBFzuAz8Wj154fwdKeJAA7RKqTpXhphJ0A
 KZ+KK0E+bN0KXeCyh8zH7Zs4RpyqkMmgg1F2DoLmutar7t2c9swfhYmzbPPLxZS31ACp14U
 zhqcJNgYORsE2qZ0/AFTw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a0Ff9jNvXYo=:mUVNahr6lKpBJFzi+wLba2
 BTDIDBHKoHwdSkhKUdoqJmrbqtF3ZYCKFqGIgJUBJmegkGz/SOcu3pd2KOd4s2s3/QuXaNdk0
 uguRGeRDIcNPst62WfMtiwo4Iw/Vunm5FNmfJFeatXDqWazimqqDCanpscLSdrblTa20JB1VW
 c7kuVDEz155jDxAxRrlCHa4xGdgZYPY0yAQaS4Dv3uUFDVLnMUFpMkDRsUEKPq4noO6+ucdvE
 SRzQXp3T1n3zUjTN8U0oP43qsyQntWyl1RTCSoXTQO9xSgs89oOoNRoJT2rv1BUKKBfwqnqmI
 LpZWwaBmU/uSsj4PGpYC4o/F9bS7XDbzC7/lddp5AyIn8cCAKy4qL8gpxMSWZ9sTqpjvl4Hqq
 945/WLdlpTWKQh+Nbd0YlPUVBPRRhnU8HM133F3fS5h9vHMLhveOWfk66rqfG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_090521_088972_A57D55CA 
X-CRM114-Status: GOOD (  13.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jonathan Corbet <corbet@lwn.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-riscv@lists.infradead.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDguMTIuMjAgMTA6MzgsIExpbnVzIFdhbGxlaWogd3JvdGU6CgpIaSwKCj4gVGhpcyBpcyBC
YXJ0b3N6IHRlcnJpdG9yeSwgYnV0IHRoZSBncGlvLW1vY2t1cC5jIGRyaXZlciB3aWxsIGluc2Vy
dAo+IElSUXMgaW50byB0aGUgc3lzdGVtLCBoZSB3ZW50IGFuZCBhZGRlZCByZWFsbHkgY29yZSBz
dHVmZgo+IGludG8ga2VybmVsL2lycSB0byBtYWtlIHRoaXMgaGFwcGVuLiBOb3RpY2UgdGhhdCBp
biBLY29uZmlnCj4gaXQgZG9lczoKPiAKPiBzZWxlY3QgSVJRX1NJTQo+IAo+IFRoZW4gdGhpcyBp
cyB1c2VkOgo+IGluY2x1ZGUvbGludXgvaXJxX3NpbS5oCj4gCj4gVGhpcyBpcyBpbnRlbmRlZCBm
b3Igc2ltdWxhdGluZyBJUlFzIGFuZCBib3RoIEdQSU8gYW5kIElJTyB1c2UgaXQuCj4gSSB0aGlu
ayB0aGlzIGluc2VydHMgSVJRcyBmcm9tIGRlYnVnZnMgYW5kIEkgaGF2ZSBubyBpZGVhIGhvdwo+
IGZsZXhpYmxlIHRoYXQgaXMuCgpPaCwgdGh4LgoKSXQgc2VlbXMgdG8gaW1wbGVtZW50IGEgcHNl
dWRvLWlycWNoaXAgZHJpdmVyLiBJJ3ZlIGFscmVhZHkgdGhvdWdoIGFib3V0CmRvaW5nIHRoYXQs
IGJ1dCBkaWRuJ3QgdGhpbmsgaXRzIHdvcnRoIGl0LCBqdXN0IGZvciBteSBkcml2ZXIgYWxvbmUu
CkkndmUgaW1wbGVtZW50ZWQgYSBmZXcgaXJxIGhhbmRsaW5nIGNiJ3MgZGlyZWN0bHkgdGhlIGRy
aXZlci4gQnV0IHNpbmNlCndlIGFscmVhZHkgaGF2ZSBpdCwgSSdsbCByZWNvbnNpZGVyIDopCgpC
VVQ6IHRoaXMgd2Fzbid0IGV4YWN0bHkgbXkgcXVlc3Rpb24gOnAKCkkndmUgYmVlbiBsb29raW5n
IGZvciBzb21lIG1vcmUgZGlyZWN0IG5vdGlmaWNhdGlvbiBjYWxsYmFjayBmb3IgZ3Bpbwpjb25z
dW1lcnM6IGhlcmUgdGhlIGNvbnN1bWVyIHdvdWxkIHJlZ2lzdGVyIGl0c2VsZiBhcyBhIGxpc3Rl
bmVyIG9uCnNvbWUgZ3Bpb19kZXNjIGFuZCBjYWxsZWQgYmFjayB3aGVuIHNvbWV0aGluZyBjaGFu
Z2VzICh3aXRoIGRhdGEgd2hhdApleGFjdGx5IGNoYW5nZWQsIGVnLiAiZ3BpbyAjMyBpbnB1dCBz
d2l0Y2hlZCB0byBoaWdoIikuCgpTZWVtcyB3ZSBjdXJyZW50bHkganVzdCBoYXZlIHRoZSBpbmRp
cmVjdCBwYXRoIHZpYSBpbnRlcnJ1cHRzLgoKLS1tdHgKCi0tIAotLS0KSGlud2VpczogdW52ZXJz
Y2hsw7xzc2VsdGUgRS1NYWlscyBrw7ZubmVuIGxlaWNodCBhYmdlaMO2cnQgdW5kIG1hbmlwdWxp
ZXJ0CndlcmRlbiAhIEbDvHIgZWluZSB2ZXJ0cmF1bGljaGUgS29tbXVuaWthdGlvbiBzZW5kZW4g
U2llIGJpdHRlIGlocmVuCkdQRy9QR1AtU2NobMO8c3NlbCB6dS4KLS0tCkVucmljbyBXZWlnZWx0
LCBtZXR1eCBJVCBjb25zdWx0CkZyZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVkZGVkIGVuZ2lu
ZWVyaW5nCmluZm9AbWV0dXgubmV0IC0tICs0OS0xNTEtMjc1NjUyODcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
