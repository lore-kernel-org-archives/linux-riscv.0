Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A01EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkQdgSM6poDCY8mVjY74bRZ8c3SF/LC/Ngv7pWXAiK8=; b=cqJpUM2U3JiYwM
	Tnmhi0U7LaJ0pQCEoA4nVswEjVkrFBabZbLoMEwZ4HqOj12oh8Pd/7sZsmlbun3RNEJxtx5xhEWQI
	xBqPav+im7E5VsoDQHMIHa+gvhutF1Ngn9aRUvE0x/bbfMfyMDOeK1gSH7GtsqlRheoiPMl5FCOaP
	eBmAqYHhneIaRKhNQJoRL0bAip5hSYnax8kHCVveYl6C9KDV6n0XYSJ3cCdF2ozvaqfC7xe00xPpQ
	iM529mFEabkVsTkiNUuRPA5cNklKx5ZajDD59W1vL0DHJsj4odO5J3qm51BKUpGCY37pvvy4tn7If
	pl/hHzrXYoxtaduOJvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1zU-00FI8S-1w;
	Wed, 21 Jun 2023 17:51:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC1zD-00FHqU-0m
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 17:51:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78E906167C;
	Wed, 21 Jun 2023 17:51:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93172C433C8;
	Wed, 21 Jun 2023 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687369877;
	bh=47uIKnKw2ZmtP3m7XAXg6y/7ErK+KJP6FPCWISl4Zpw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cludjbY8A0OmOUSGdXGXEAtWaET058YOwRyqV9eSI3tF7/aL4HlSEBp+3S+QFoEkJ
	 xUpbFf+BSS2vOu0dnhAPs6zrMl+WBk9RkpKsgs7Wh0hJd1OOFL/OxAYHrMaW79jiUg
	 IufRKhp/PY3TAnGBqwlDOVKnaKqhByaoVZ5IWRXXD9tT4lQ2J8IdUm5ywK6A1gqHKr
	 ZSa/vVG4Cqt25jZgHruRoyoJ0U5cw+zeATnvPDSlHi+IhFH/ME/F6rMbk2pJmCnNc8
	 kqWTJ9HDaLsjiOHcBPygAdyYFEAU+kqdQjJfbvhrZbHNV6hyyYWeK8uIr0Ip1jaP8D
	 iIFxgfteGJUcg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: ndesaulniers@google.com, jszhang@kernel.org, llvm@lists.linux.dev, Paul
 Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann
 <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <20230621-hungrily-pancake-9e1ff5b0b02a@spud>
References: <mhng-8caf7779-aa9e-496a-b2ee-2e6d6d1d76ff@palmer-ri-x1c9a>
 <mhng-861ea8a6-c92c-4a78-a1a6-dfb4df554aee@palmer-ri-x1c9a>
 <20230621-hungrily-pancake-9e1ff5b0b02a@spud>
Date: Wed, 21 Jun 2023 19:51:15 +0200
Message-ID: <87wmzwn1po.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_105119_351746_2EC88996 
X-CRM114-Status: GOOD (  10.23  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6CgpbLi4uXQoKPj4gU28gSSdt
IG5vIGxvbmdlciBhY3R1YWxseSBzdXJlIHRoZXJlJ3MgYSBoYW5nLCBqdXN0IHNvbWV0aGluZyBz
bG93LiAgCj4+IFRoYXQncyBldmVuIG1vcmUgb2YgYSBncmV5IGFyZWEsIGJ1dCBJIHRoaW5rIGl0
J3Mgc2FuZSB0byBjYWxsIGEgMS1ob3VyIAo+PiBsaW5rIHRpbWUgYSByZWdyZXNzaW9uIC0tIHVu
bGVzcyBpdCdzIGV4cGVjdGVkIHRoYXQgdGhpcyBpcyBqdXN0IHZlcnkgCj4+IHNsb3cgdG8gbGlu
az8KPgo+IEkgZHVubm8sIGlmIGl0IHdhcyBvbmx5IGEgdGhpbmcgZm9yIGFsbHllc2NvbmZpZywg
dGhlbiB3aGF0ZXZlciAtIGJ1dAo+IGl0J3MgZ29ubmEgc2lnbmlmaWNhbnRseSBpbmNyZWFzZSBi
dWlsZCB0aW1lcyBmb3IgYW55IGxhcmdlIGtlcm5lbHMgaWYgTExECj4gaXMgdGhpcyBtdWNoIHNs
b3dlciB0aGFuIExELiBSZWdyZXNzaW9uIGluIG15IGJvb2suCj4KPiBJJ20gZ29ubmEgZ28gYW5k
IGV4cGVyaW1lbnQgd2l0aCBtaXhlZCB0b29sY2hhaW4gYnVpbGRzLCBJJ2xsIHJlcG9ydAo+IGJh
Y2suLgoKSSB0b29rIHBhbG1lci9mb3ItbmV4dCAoMWJkMjk2M2IyMTc1ICgiTWVyZ2UgcGF0Y2gg
c2VyaWVzICJyaXNjdjogZW5hYmxlCkhBVkVfTERfREVBRF9DT0RFX0RBVEFfRUxJTUlOQVRJT04i
IikpIGZvciBhIHR1eG1ha2UgYnVpbGQgd2l0aCBsbHZtLTE2OgoKICB8IH4vc3JjL3R1eG1ha2Uv
cnVuIC12IC0td3JhcHBlciBjY2FjaGUgLS10YXJnZXQtYXJjaCByaXNjdiBcCiAgfCAgICAgLS10
b29sY2hhaW49bGx2bS0xNiAtLXJ1bnRpbWUgZG9ja2VyIC0tZGlyZWN0b3J5IC4gLWsgXAogIHwg
ICAgIGFsbHllc2NvbmZpZwoKVG9vayBmb3JldmVyLCBidXQgcGFzc2VkIGFmdGVyIDIuNWguCgpD
T05GSUdfQ0NfVkVSU0lPTl9URVhUPSJEZWJpYW4gY2xhbmcgdmVyc2lvbiAxNi4wLjYgKCsrMjAy
MzA2MTAxMTMzMDcrN2NiZjFhMjU5MTUyLTF+ZXhwMX4yMDIzMDYxMDIzMzQwMi4xMDYpIgoKCkJq
w7ZybgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
