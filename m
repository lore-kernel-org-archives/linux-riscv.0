Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4799EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 18:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CumJdOTNLcOwFbu94bu50hoM+tP2A0cn14BiCb4kX8g=; b=1S8MXHexe8rvNS
	801V5bG7B1GTZ91JZ58bNUkKiznoNPMyxrHOmFWLvb6HniblLora9L0BHVfnbKEoHn3REjlLuWK+2
	jlHjxG47wjyHY487eyV4c3wGWfa7LX5vT+2zVkf9CUGC3hGpLkLG7KkGJ/7u6nLYuEEFg0wq8jPUn
	+0E1M6+si7KDRl7IuP8Zhn9ey2qLu0uRuUaScS1hDr1qeXh2G1toXvGYTDNDsmA+mvN8a65QJqWlr
	0FaHHHTj8+BbWQCJM/bdzlEsdU1z7xiW/EDUwC5qU8Io06u2mQligO2iIlabu5gdkswGCF/hgbgTw
	0ABcaYsSqHnjcUTmVxjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeJ1-000rT3-0h;
	Wed, 12 Jul 2023 18:11:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeIz-000rSN-0K
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 18:11:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C7D8618BB;
	Wed, 12 Jul 2023 18:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8820C433CC;
	Wed, 12 Jul 2023 18:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689185471;
	bh=md16UXiz1GpqNsTJoRJ0ef7Vy1yKmHuNjtAKI4WEaXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mhFFHJgPREKia8kCFwCEiKafU251CX5GYE5LqijBDg+dm+e72t5vAmLdYnHsl9XKc
	 SFQlLgzU8RWnx/4PoEjdq6iSLFjYHHDR3SLRXQ/stR2bVu4CihWqET20bWwiVb4alP
	 rKZfvOdQMmDyEiSqEaVSAewxP93NSMZ4Dr4DAXd8mZrYMpgSf38vtiQwgNj3g/5LGD
	 Rb8OgSZvyJr7yreNyql42EjQ9YqGu+zEAjUtvdlSfdBPGgRzLrXNnyOX5M/s86l6W7
	 5w8yW3OeqXI8FaD1ZEx6sgthc2drs4aS7AWR5gtTAe8S525qiMVA071l/kXAh3ng1x
	 gkbtcsPXVyMFw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, guoren@kernel.org,
 suagrfillet@gmail.com, bjorn@rivosinc.com, jszhang@kernel.org,
 conor.dooley@microchip.com, Pu Lehui <pulehui@huawei.com>,
 palmer@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, songshuaishuai@tinylab.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH V11 0/5] riscv: Optimize function trace
In-Reply-To: <20230627111612.761164-1-suagrfillet@gmail.com>
References: <20230627111612.761164-1-suagrfillet@gmail.com>
Date: Wed, 12 Jul 2023 20:11:08 +0200
Message-ID: <87jzv5q9tv.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_111113_243763_3567439C 
X-CRM114-Status: UNSURE (   9.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiB3cml0ZXM6CgpbLi4uXQoKPiBBZGQg
V0lUSF9ESVJFQ1RfQ0FMTFMgc3VwcG9ydCBbM10gKHBhdGNoIDMsIDQpCj4gPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKV2UndmUgaGFkIHNvbWUgb2ZmbGlz
dCBkaXNjdXNzaW9ucywgc28gaGVyZSdzIHNvbWUgaW5wdXQgZm9yIGEgd2lkZXIKYXVkaWVuY2Uh
IE1vc3QgaW1wb3J0YW50bHksIHRoaXMgaXMgZm9yIFBhbG1lciwgc28gdGhhdCB0aGlzIHNlcmll
cyBpcwpub3QgbWVyZ2VkIHVudGlsIGEgcHJvcGVyIEJQRiB0cmFtcG9saW5lIGZpeCBpcyBpbiBw
bGFjZS4KCk5vdGUgdGhhdCB3aGF0J3MgY3VycmVudGx5IHVzYWJsZSBmcm9tIEJQRiB0cmFtcG9s
aW5lICp3b3JrcyouIEl0J3MKd2hlbiB0aGlzIHNlcmllcyBpcyBhZGRlZCB0aGF0IGl0IGJyZWFr
cy4KClRMO0RSIFRoaXMgc2VyaWVzIGFkZHMgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FM
TFMsIHdoaWNoIGVuYWJsZXMKZmVudHJ5L2ZleGl0IEJQRiB0cmFtcG9saW5lIHN1cHBvcnQuIFVu
Zm9ydHVuYXRlbHkgdGhlCmZleGl0L0JQRl9UUkFNUF9GX1NLSVBfRlJBTUUgcGFydHMgb2YgdGhl
IFJWIEJQRiB0cmFtcG9saW5lIGJyZWFrcwp3aXRoIHRoaXMgYWRkaXRpb24sIGFuZCBuZWVkIHRv
IGJlIGFkZHJlc3NlZCAqcHJpb3IqIG1lcmdpbmcgdGhpcwpzZXJpZXMuIEFuIGVhc3kgd2F5IHRv
IHJlcHJvZHVjZSwgaXMganVzdCBjYWxsaW5nIGFueSBvZiB0aGUga3NlbGZ0ZXN0CnRlc3RzIHRo
YXQgdXNlcyBmZXhpdCBwYXRjaGluZy4KClRoZSBpc3N1ZSBpcyBhcm91bmQgdGhlIG5vcCBzZWxk
LCBhbmQgaG93IGEgY2FsbCBpcyBkb25lOyBUaGUgbm9wIHNsZWQKKHBhdGNoYWJsZS1mdW5jdGlv
bi1lbnRyeSkgc2l6ZSBjaGFuZ2VkIGZyb20gMTZCIHRvIDhCIGluIGNvbW1pdAo2NzI0YTc2Y2Zm
ODUgKCJyaXNjdjogZnRyYWNlOiBSZWR1Y2UgdGhlIGRldG91ciBjb2RlIHNpemUgdG8gaGFsZiIp
LCBidXQKQlBGIGNvZGUgc3RpbGwgdXNlcyB0aGUgb2xkIDE2Qi4gU28gaXQnbGwgd29yayBmb3Ig
QlBGIHByb2dyYW1zLCBidXQgbm90CmZvciByZWd1bGFyIGtlcm5lbCBmdW5jdGlvbnMuCgpBbiBl
eGFtcGxlOgoKICB8IGZmZmZmZmZmODBmYTQxNTAgPGJwZl9mZW50cnlfdGVzdDE+OgogIHwgZmZm
ZmZmZmY4MGZhNDE1MDogICAgICAgMDAwMSAgICAgICAgICAgICAgICAgICAgbm9wCiAgfCBmZmZm
ZmZmZjgwZmE0MTUyOiAgICAgICAwMDAxICAgICAgICAgICAgICAgICAgICBub3AKICB8IGZmZmZm
ZmZmODBmYTQxNTQ6ICAgICAgIDAwMDEgICAgICAgICAgICAgICAgICAgIG5vcAogIHwgZmZmZmZm
ZmY4MGZhNDE1NjogICAgICAgMDAwMSAgICAgICAgICAgICAgICAgICAgbm9wCiAgfCBmZmZmZmZm
ZjgwZmE0MTU4OiAgICAgICAxMTQxICAgICAgICAgICAgICAgICAgICBhZGQgICAgIHNwLHNwLC0x
NgogIHwgZmZmZmZmZmY4MGZhNDE1YTogICAgICAgZTQyMiAgICAgICAgICAgICAgICAgICAgc2Qg
ICAgICBzMCw4KHNwKQogIHwgZmZmZmZmZmY4MGZhNDE1YzogICAgICAgMDgwMCAgICAgICAgICAg
ICAgICAgICAgYWRkICAgICBzMCxzcCwxNgogIHwgZmZmZmZmZmY4MGZhNDE1ZTogICAgICAgNjQy
MiAgICAgICAgICAgICAgICAgICAgbGQgICAgICBzMCw4KHNwKQogIHwgZmZmZmZmZmY4MGZhNDE2
MDogICAgICAgMjUwNSAgICAgICAgICAgICAgICAgICAgYWRkdyAgICBhMCxhMCwxCiAgfCBmZmZm
ZmZmZjgwZmE0MTYyOiAgICAgICAwMTQxICAgICAgICAgICAgICAgICAgICBhZGQgICAgIHNwLHNw
LDE2CiAgfCBmZmZmZmZmZjgwZmE0MTY0OiAgICAgICA4MDgyICAgICAgICAgICAgICAgICAgICBy
ZXQKCmlzIHBhdGNoZWQgdG86CgogIHwgZmZmZmZmZmY4MGZhNDE1MDogIGY3MGMwMjk3ICAgICAg
ICAgICAgICAgICAgICAgYXVpcGMgICB0MCwtMTUwMjA4NTEyCiAgfCBmZmZmZmZmZjgwZmE0MTU0
OiAgZWIwMjgyZTcgICAgICAgICAgICAgICAgICAgICBqYWxyICAgIHQwLHQwLC0zMzYKClRoZSBy
ZXR1cm4gYWRkcmVzcyB0byBicGZfZmVudHJ5X3Rlc3QxIGlzIHN0b3JlZCBpbiB0MCBhdCBCUEYK
dHJhbXBvbGluZSBlbnRyeS4gUmV0dXJuIHRvIHRoZSAqcGFyZW50KiBpcyBpbiByYS4gVGhlIHRy
YW1wbGluZSBoYXMKdG8gZGVhbCB3aXRoIHRoaXMuCgpGb3IgQlBGX1RSQU1QX0ZfU0tJUF9GUkFN
RS9DQUxMX09SSUcsIHRoZSBCUEYgdHJhbXBvbGluZSB3aWxsIHNraXAgdG9vCm1hbnkgYnl0ZXMs
IGFuZCBub3QgY29ycmVjdGx5IGhhbmRsZSBwYXJlbnQgY2FsbHMuCgpGdXJ0aGVyOyBUaGUgQlBG
IHRyYW1wb2xpbmUgY3VycmVudGx5IGhhcyBhIGRpZmZlcmVudCB3YXkgb2YgcGF0Y2hpbmcKdGhl
IG5vcHMgZm9yIEJQRiBwcm9ncmFtcywgdGhhbiB3aGF0IGZ0cmFjZSBkb2VzLiBUaGF0IHNob3Vs
ZCBiZSBjaGFuZ2VkCnRvIG1hdGNoIHdoYXQgZnRyYWNlIGRvZXMgKGF1aXBjL2phbHIgdDApLgoK
VG8gc3VtbWFyaXplOgogKiBBbGlnbiBCUEYgbm9wIHNsZWQgd2l0aCBwYXRjaGFibGUtZnVuY3Rp
b24tZW50cnk6IDhCLgogKiBBZGFwdCBCUEYgdHJhbXBvbGluZSBmb3IgOEIgbm9wIHNsZWRzLgog
KiBBZGFwdCBCUEYgdHJhbXBvbGluZSB0MCByZXR1cm4sIHJhIHBhcmVudCBzY2hlbWUuCiAKCkNo
ZWVycywKQmrDtnJuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
