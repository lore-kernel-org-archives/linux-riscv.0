Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9E9C636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 09:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gukCkWn22D2Jsyh88mcv6IEvMMFCAT4pFzAxl78Fbc=; b=AS+FARzdj70QiK
	zl2+EBIj3tGIHPHC7r+JTcZ+DpUjvhsygO23SmG2uILQnpe0U4FTnU2ufMh9ueRBxBN8toEyPBfUC
	YiUBMexGemQ2BCj9dci/gL7L0ZapY14U4yXYfZKzGXb3cpLSLinvZhNwFQsZw8rm6yDVDXWEE+sMv
	o0Hef9kmW+Z39gyzD6nl77hi88HDMMTYC9ObXH4o6kxKhkrw0q/A6F3V3cAej/lu/ZiD8VR8X2r5p
	cNBaPam4GYs8nrFaGBW3mqWE0Kpx1GexKUFomR4UQmjpYiyt3NZylx7AD9M2FbfwijmU7BWfz4WaX
	Znw4dADmYDN/qwUO1EPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSb0h-009Pnm-Ld; Thu, 16 Feb 2023 09:57:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSb0d-009Pjd-MH
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 09:57:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 204C4B8222A;
	Thu, 16 Feb 2023 09:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475D7C433EF;
	Thu, 16 Feb 2023 09:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676541412;
	bh=DUg3YOeKnzjay7egaWmLgW5mZl9+u14ElLFt8uiDPNQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s1tmRVfnx92JRM7mIPYIcWP4TGf7u0UFD2RnL7Yw1ZuQnMFty8PoUbRPkenE+GRHS
	 xVxRX4LzYVhIhunIPQZ4fmj2XSgjQBFWyjXZFxv1t52mQ6dugSjfZ5T1aFOa+ch5GK
	 2lN+O/xYDeoeLnPQD/TZUtNK2EsA9TIW3WDHWD3rj7oepJoC4j43ZIDKnxHgHPFvSZ
	 iIJ667+hzuYaIrcYfwj6MQmyAFes9rUCJUU3Z+mD8QIzm/131ww3nqAHBOUVRDqttV
	 bDsS30ipKqU3hIpYiLpKmVgw3BBUHfYTdIfYUaaUxWUCsT4dm/PZNf6qYLF65lI6VW
	 rg+MJvRP7qpvw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren
 <guoren@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang
 <xi.wang@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next v1 0/4] Support bpf trampoline for RV64
In-Reply-To: <20230215135205.1411105-1-pulehui@huaweicloud.com>
References: <20230215135205.1411105-1-pulehui@huaweicloud.com>
Date: Thu, 16 Feb 2023 10:56:49 +0100
Message-ID: <8735763pcu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_015659_908180_B77480D5 
X-CRM114-Status: GOOD (  14.11  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IEJQRiB0cmFtcG9s
aW5lIGlzIHRoZSBjcml0aWNhbCBpbmZyYXN0cnVjdHVyZSBvZiB0aGUgYnBmCj4gc3Vic3lzdGVt
LCBhY3RpbmcgYXMgYSBtZWRpYXRvciBiZXR3ZWVuIGtlcm5lbCBmdW5jdGlvbnMKPiBhbmQgQlBG
IHByb2dyYW1zLiBOdW1lcm91cyBpbXBvcnRhbnQgZmVhdHVyZXMsIHN1Y2ggYXMKPiB1c2luZyBl
YnBmIHByb2dyYW0gZm9yIHplcm8gb3ZlcmhlYWQga2VybmVsIGludHJvc3BlY3Rpb24sCj4gcmVs
eSBvbiB0aGlzIGtleSBjb21wb25lbnQuIFdlIGNhbid0IHdhaXQgdG8gc3VwcG9ydCBicGYKPiB0
cmFtcG9saW5lIG9uIFJWNjQuIFNpbmNlIFJWNjQgZG9lcyBub3Qgc3VwcG9ydCBmdHJhY2UKPiBk
aXJlY3QgY2FsbCB5ZXQsIHRoZSBjdXJyZW50IFJWNjQgYnBmIHRyYW1wb2xpbmUgaXMgb25seQo+
IHVzZWQgaW4gYnBmIGNvbnRleHQuCj4KPiBBcyBtb3N0IG9mIHJpc2N2IGNwdSBzdXBwb3J0IHVu
YWxpZ25lZCBtZW1vcnkgYWNjZXNzZXMsCj4gd2UgdGVtcG9yYXJpbHkgdXNlIHBhdGNoIFsxXSB0
byBmYWNpbGl0YXRlIHRlc3RpbmcuIFRoZQo+IHRlc3QgcmVzdWx0cyBhcmUgYXMgZm9sbG93LCBh
bmQgdGVzdF92ZXJpZmllciB3aXRoIG5vCj4gbmV3IGZhaWx1cmUgY2VzZXMuCj4KPiAtIGZleGl0
X2JwZjJicGY6T0sKPiAtIGR1bW15X3N0X29wczpPSwo+IC0geGRwX2JwZjJicGY6T0sKPgo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIxMDkxNjEzMDg1NS40MDU0
OTI2LTItY2hlbmh1YW5nNUBodWF3ZWkuY29tLwo+Cj4gdjE6Cj4gLSBSZW1vdmUgdGhlIGxvZ2lj
IG9mIGJwZl9hcmNoX3RleHRfcG9rZSBzdXBwb3J0ZWQgZm9yCj4gICBrZXJuZWwgZnVuY3Rpb25z
LiAoS3VvaGFpIGFuZCBCasO2cm4pCj4gLSBFeHRlbmQgcGF0Y2hfdGV4dCBmb3IgbXVsdGlwbGUg
aW5zdHJ1Y3Rpb25zLiAoQmrDtnJuKQo+IC0gRml4IE9PQiBpc3N1ZSB3aGVuIGltYWdlIHRvbyBi
aWcuIChCasO2cm4pCgpUaGlzIHNlcmllcyBpcyByZWFkeSB0byBnbyBpbiBhcyBpcy4KCkBQYWxt
ZXIgSSdkIGxpa2UgdG8gdGFrZSB0aGlzIHNlcmllcyB2aWEgdGhlIGJwZi1uZXh0IHRyZWUgKGFz
IHVzdWFsKSwKYnV0IG5vdGUgdGhhdCB0aGVyZSBhcmUgc29tZSBub24tQlBGIGNoYW5nZXMgYXMg
d2VsbCwgcmVsYXRlZCB0byB0ZXh0CnBva2luZy4KCkBMZWh1aSBJJ2QgbGlrZSB0byBzZWUgdHdv
IGZvbGxvdy11cCBwYXRjaGVzOgoKMS4gRW5hYmxlIGtmdW5jIGZvciBSVjY0LCBieSBhZGRpbmc6
CiB8IGJvb2wgYnBmX2ppdF9zdXBwb3J0c19rZnVuY19jYWxsKHZvaWQpCiB8IHsKIHwgICAgICAg
ICByZXR1cm4gdHJ1ZTsKIHwgfQoKMi4gUmVtb3ZlIHRoZSBjaGVja3BhdGNoIHdhcm5pbmcgb24g
cGF0Y2ggNDoKIHwgV0FSTklORzoga2ZyZWUoTlVMTCkgaXMgc2FmZSBhbmQgdGhpcyBjaGVjayBp
cyBwcm9iYWJseSBub3QgcmVxdWlyZWQKIHwgIzMxMzogRklMRTogYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYzo5ODQ6CiB8ICsJaWYgKGJyYW5jaGVzX29mZikKIHwgKwkJa2ZyZWUoYnJh
bmNoZXNfb2ZmKTsKCgpGb3IgdGhlIHNlcmllczoKClRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3Np
bmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
