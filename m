Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FC2CA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A5HN12OHt3Q3mSB8NZcGPI7ZjOebCkr2D3obtXrJjzc=; b=w4RKFIxw6Fzj6V
	eGfzX+S8CaoTWdgc/sjgK4318dnoVZToJV0Fvc9hhZzd9lRm+2m+GfSh5MCvLigPGQy7KGDAToZaW
	/QanfLbuF/19NC1DovRJk+gfoNpURfquJZAXwieXwMAJZrosyE7lmq4X3EwzoCmiEEiSLdUoL/IYc
	KjFb0EKUHMTt6+ZAQhsEXDKx3BLzPtyfkKQrnxoC4tus87kol3rHDLFc4LwB6EYnfsLlrYZYv7L2A
	V7FSyMM9bjS52tRT8zbqwowb8Potcs2mJhtn67j6/Sj3NcF2FErmDzPmxDK9VoS1QhF7+2eGHysMr
	MUo7PaPewdEEqICa5+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg21c-003Gs9-2o;
	Tue, 12 Sep 2023 11:57:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg21a-003GrJ-0s
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 11:57:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1FEA4B81ADB;
	Tue, 12 Sep 2023 11:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E1FC433C8;
	Tue, 12 Sep 2023 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694519862;
	bh=VHyiwl+Hwh6t7EN/GwQGLxr4lMrIG6rMBB4761ubg3k=;
	h=From:To:Cc:Subject:Date:From;
	b=aN/nxvG0zabDFDOHbb1qLdZ+vM/ZOP6rqkV/6vjJURcJLhYMWxD33rjkPu3s19PIR
	 13hLYBe8HXXdEj2u2b2Wl25bY7fldAThGf7ehaGORo/nflRUxCzQ/7WLbKGaKFUg5s
	 qOyXj8VvjQGvVFKLA4DV6pheW13M/SQqAfZenmpe/uXzK+/w7geY5hDm2xJlDWVgC7
	 HPiNPgTUvgBO4prGSMpuo58Gfs8+2sel6YbOBm3inzybGSrPdvREcBTynrMXxIXyL/
	 gAWgTlMeVKgBVb2NLgj4VojA725MgTvbxRdYziRSdxTKxcSsT7U/+LRRLsp+Smftw3
	 eJnedR//4hnYw==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Samuel Neves <sneves@dei.uc.pt>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/6] RISC-V BLAKE2s Vector implementation
Date: Tue, 12 Sep 2023 13:57:22 +0200
Message-Id: <20230912115728.172982-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_045746_567908_8E05D3EF 
X-CRM114-Status: GOOD (  12.28  )
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

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKSGksCgpUaGlzIGlzIEFu
ZHkncyBrZXJuZWwgbW9kZSB2ZWN0b3IgVjIgc2VyaWVzIFsxXSwgd2l0aCBteSBCTEFLRTJzCkFW
WC01MTItdG8tUklTQy1WIHRyYW5zbGF0aW9uIHBhdGNoIGFwcGVuZGVkLgoKSSd2ZSB0YWdnZWQg
aXQgYXMgUkZDLCBzaW5jZSBBbmR5J3Mgc2VyaWVzIGlzIHN0aWxsIG5vdCBpbi10cmVlIHlldC4K
Ckl0J3MgYSBmaXJzdCBzdGVwIHRvd2FyZHMgYSBWZWN0b3IgYWlkZWQgV2lyZWd1YXJkISA7LSkK
CgpDaGVlcnMsCkJqw7ZybgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjMwNzIxMTEyODU1LjEwMDYtMS1hbmR5LmNoaXVAc2lmaXZlLmNvbS8KCkFuZHkgQ2hpdSAo
Myk6CiAgcmlzY3Y6IHNjaGVkOiBkZWZlciByZXN0b3JpbmcgVmVjdG9yIGNvbnRleHQgZm9yIHVz
ZXIKICByaXNjdjogdmVjdG9yOiBkbyBub3QgcGFzcyB0YXNrX3N0cnVjdCBpbnRvCiAgICByaXNj
dl92X3ZzdGF0ZV97c2F2ZSxyZXN0b3JlfSgpCiAgcmlzY3Y6IHZlY3RvcjogYWxsb3cga2VybmVs
LW1vZGUgVmVjdG9yIHdpdGggcHJlZW1wdGlvbgoKQmrDtnJuIFTDtnBlbCAoMSk6CiAgcmlzY3Y6
IEFkZCBCTEFLRTJzIFYgaW1wbGVtZW50YXRpb24KCkdyZWVudGltZSBIdSAoMik6CiAgcmlzY3Y6
IEFkZCBzdXBwb3J0IGZvciBrZXJuZWwgbW9kZSB2ZWN0b3IKICByaXNjdjogQWRkIHZlY3RvciBl
eHRlbnNpb24gWE9SIGltcGxlbWVudGF0aW9uCgogYXJjaC9yaXNjdi9LYnVpbGQgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDIgKy0KIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgIHwgIDEwICsrCiBhcmNoL3Jpc2N2L2NyeXB0by9LY29uZmlnICAgICAgICAgICAgICB8ICAx
NiArKysKIGFyY2gvcmlzY3YvY3J5cHRvL01ha2VmaWxlICAgICAgICAgICAgIHwgICA2ICsKIGFy
Y2gvcmlzY3YvY3J5cHRvL2JsYWtlMnMtZ2x1ZS5jICAgICAgIHwgIDM5ICsrKysrKwogYXJjaC9y
aXNjdi9jcnlwdG8vYmxha2Uycy12LlMgICAgICAgICAgfCAxNjQgKysrKysrKysrKysrKysrKysr
KysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaCAgfCAgMTMgKysK
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggICAgIHwgICAyICsKIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2ltZC5oICAgICAgICAgIHwgIDUyICsrKysrKysrCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggICB8ICAgNiArCiBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oICAgICAgICB8ICA1MCArKysrKystLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS94b3IuaCAgICAgICAgICAgfCAgODIgKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwv
TWFrZWZpbGUgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNl
dHMuYyAgICAgICAgfCAgIDIgKwogYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyAgICAgICAgICAg
ICAgfCAgNDUgKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfdmVjdG9yLmMg
fCAxNDYgKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5j
ICAgICAgICAgICAgfCAgMTAgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jICAgICAgICAg
ICAgIHwgICAyICstCiBhcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYyAgICAgICAgICAgICB8ICAg
NCArLQogYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICAgICAgICAgfCAgIDUgKy0KIGFy
Y2gvcmlzY3YvbGliL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gvcmlzY3Yv
bGliL3hvci5TICAgICAgICAgICAgICAgICAgIHwgIDgxICsrKysrKysrKysrKwogY3J5cHRvL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwogZHJpdmVycy9uZXQvS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogMjQgZmlsZXMgY2hhbmdlZCwgNzI1IGluc2Vy
dGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
Y3J5cHRvL0tjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2NyeXB0by9NYWtl
ZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvY3J5cHRvL2JsYWtlMnMtZ2x1ZS5j
CiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9jcnlwdG8vYmxha2Uycy12LlMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NpbWQuaAogY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3YvbGliL3hvci5TCgoKYmFzZS1jb21taXQ6IDBiYjgwZWNjMzNhOGZiNWE2ODIy
MzY0NDNjMWU3NDBkNWM5MTdkMWQKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
