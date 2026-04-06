Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE4DFB5164
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 21:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=svnFTxB4o76Tyua91VXMa7yiCx9uMWjDBl9wyy64fEE=; b=hS9OSXamIljP0w
	mv7im9x5PfsiYRe4WKtf2Ls5/+droTISFBvXdjC09cm4VTAucQ/JMIw1ipKAa3eDfsBUwf3/Z6Phc
	kb4UVYjdaM4VAZhGZxFPTeEdLO+q6XByuh3ulHmlH2hWhtJn+AamnAUEbOEPKyBpYLByzsJ55nLSo
	yY4fGGl17hMDRHABrIDh2uZg6NvwjTLbG5w2qPScIWSfHIIi5AyhSb/5s1AEwGn3XwqL8wBRbcRR4
	TrXdZsTMKl1RAXKKsCZNpi3Ebfv3Lkyeaf5WgvsnsAx0JNcFYrOU93wGuxOOtrMjmYjffwDLsy+pV
	c25a2K/e3mGELZDHwjfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rv4-00000005Xod-3kCX;
	Mon, 06 Apr 2026 21:55:42 +0000
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9rv1-00000005XoJ-3SRt
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 21:55:42 +0000
Received: from [10.0.0.2] (unknown [82.65.243.93])
	(Authenticated sender: legoll@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id D19895FFA3;
	Mon,  6 Apr 2026 23:55:25 +0200 (CEST)
Message-ID: <bbd2e57f-3107-46cc-a8a7-ee717e577d6e@online.fr>
Date: Mon, 6 Apr 2026 23:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND][PATCH v5] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
To: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20260401165437.1048786-3-aurelien@aurel32.net>
 <b7e182f9-8bd8-40e6-acaa-dc6e556f2a53@online.fr>
 <adPUTRAlzGBs2wQG@aurel32.net>
Content-Language: en-US
From: Vincent Legoll <legoll@online.fr>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Aurelien Jarno <aurelien@aurel32.net>
In-Reply-To: <adPUTRAlzGBs2wQG@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_145540_008057_4DF3D416 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

SGkgQXVyZWxpZW4sCgpPbiA0LzYvMjYgMTc6NDIsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+IE9u
IDIwMjYtMDQtMDYgMTE6NDYsIFZpbmNlbnQgTGVnb2xsIHdyb3RlOgo+PiBUZWxsIG1lIGlmIHRo
ZXJlJ3MgYSBuZXcgaXRlcmF0aW9uIHRvIHRlc3QsIGFuZC9vciBpZiB5b3Ugd2FudCBtZSB0ZXN0
aW5nIGl0Cj4+IGluIGEgZGlmZmVyZW50IHdheS4KPiBZZXMsIGFzIHdyaXR0ZW4gaW4gdGhlIG9y
aWdpbmFsIG1haWwsIHRoaXMgcGF0Y2hzZXQgZGVwZW5kcyBvbiBQSU8KPiBzdXBwb3J0IGluIHRo
ZSBzcGFjZW1pdCBJMkMgZHJpdmVyOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAy
NjAyMDctYjQtazMtaTJjLXBpby12Ny0yLTYyNjk0MmQ5NGQ5MUBsaW51eC5zcGFjZW1pdC5jb20v
Cj4KPiBXaXRob3V0IGl0LCB5b3UgbWlnaHQgZ2V0IHRoaXMgd2FybmluZyBtZXNzYWdlIGFuZCBy
ZWJvb3QgaXMgbm90IDEwMCUKPiByZWxpYWJsZS4gSSBzdGlsbCBiZWxpZXZlIGl0J3MgYmV0dGVy
IHRoYW4gbm8gcmVib290IHN1cHBvcnQgYXQgYWxsLgoKCk9LLCBJIHRlc3RlZCBhIG5ldyBzdGFj
azogbmV4dC0yMDI2MDQwNiwgUElPIHBhdGNoc2V0LCByZXNldMKgcGF0Y2hzZXTCoCYgClVTQsKg
cGF0Y2hzZXQ6CgoKJCBnaXQgbG9nIC0tb25lbGluZQo1MDMwMzY5YjMyYzQgKEhFQUQgLT4gb3Bp
cnYyLXBpby1yZXNldC11c2IpIHJpc2N2OiBkdHM6IHNwYWNlbWl0OiBFbmFibGUgClVTQjMuMC9Q
Q0llIG9uIE9yYW5nZVBpIFJWMgo3MzI3NGNlMzc0NDEgcmlzY3Y6IGR0czogc3BhY2VtaXQ6IERl
ZmluZSB0aGUgUDEgUE1JQyByZWd1bGF0b3JzIGZvciAKT3JhbmdlUGkgUlYyCmNkYTEyYjhiZGJm
ZSByaXNjdjogZHRzOiBzcGFjZW1pdDogRW5hYmxlIGkyYzggYWRhcHRlciBmb3IgT3JhbmdlUGkg
UlYyCjY4Y2U0MDkzNTFjNiAob3BpcnYyLXBpby1yZXNldCkgbWZkOiBzaW1wbGUtbWZkLWkyYzog
YWRkIGEgcmVib290IGNlbGwgCmZvciB0aGUgU3BhY2VtaVQgUDEgY2hpcAoyNDVlMGI4ZThhOTEg
aTJjOiBzcGFjZW1pdDogaW50cm9kdWNlIHBpbyBmb3IgazEKYTU4OGQ3NTY2MjFkIGkyYzogc3Bh
Y2VtaXQ6IG1vdmUgaTJjX3hmZXJfbXNnKCkKODE2ZjE5M2RkMGQ5ICh0YWc6IG5leHQtMjAyNjA0
MDYsIG5leHQvbWFzdGVyLCBuZXh0L0hFQUQpIEFkZCBsaW51eC1uZXh0IApzcGVjaWZpYyBmaWxl
cyBmb3IgMjAyNjA0MDYKClRoaXMgYm9vdHMgYW5kIHJlc2V0IHByb3Blcmx5IHdpdGhvdXQgdGhl
IHByZXZpb3VzIFdBUk4uCgpTbyBpZiBhbnkgb2YgdGhvc2UgdGhvc2Ugc2VyaWVzIG5lZWQgYWRk
ZWQgVC1CcywgdGhlbiBoZXJlJ3MgbWluZToKClRlc3RlZC1ieTogVmluY2VudCBMZWdvbGw8bGVn
b2xsQG9ubGluZS5mcj4gIyBPcmFuZ2VQaS1SVjIKCkkgYWxzbyBiZWxpZXZlIHRoaXMgaXMgYmV0
dGVyIHRoYW4gbm90aGluZzogcmVib290ICsgKGhhcm1sZXNzKSBXQVJOIGluc3RlYWQgb2YgaGFu
Zy4KClBTOiBJIGFkZGVkIHJlY2lwaWVudHMgZm9yIHRoZSBQSU8gcGF0Y2hzZXQgYXMgQ0MgaGVy
ZSwgZm9yIHRoZSBULUIsIGhvcGUgdGhpcyBpcyBub3QgYm90aGVyaW5nLgoKVGhhbmtzCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
