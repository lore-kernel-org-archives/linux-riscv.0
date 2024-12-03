Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E483E64A85
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKDVRs2FeC7VWbyFZ461kxzC9OV26icFyyb1Vaa13Xw=; b=SL3HTZ9RP9K21j
	cu0CoSdRPa2x/CgZdZNjSzOYDppR2fs0bBgPkzrO4tqe0uzxmJFWukQ2GSPOFwLcHjZ5nCtBJKxJO
	4h7Uad3hOsW26kPf7528eVeuRF+FncKSR8Q5o9yLclYwO6I4O6adMoI4kdAR7PGtX645vjWfxCO07
	a0ZV/i5ytKqxcJCAxc2qL9zPfp/s6H5DV/+YMR6hzmCWy1Zn5MZK2ETVhFO3tb9BEulur+ucW36kV
	JGVCHAIqzyZjT+HmTTzBu0xWQKy6e4CkzhRhzB9t1hDn4ATOpbRIn+1q6IE7w9fc1PoY53qxoahny
	rsq4Env/PbPj1GdcjL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRyb-00000009QIy-1keQ;
	Tue, 03 Dec 2024 12:26:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRra-00000009Ot8-2XGV
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 12:18:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8244EA40C49;
	Tue,  3 Dec 2024 12:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7AFBC4CECF;
	Tue,  3 Dec 2024 12:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733228325;
	bh=IEtpKOaFTNjK4bo/3qCtbbXfWyGOChEHYH6Pc2ZfG2k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VkKRXHfpGU9lQpEUTyPA4wwKD+7pb6cX+nCRssjT7tViAi+XrfMbWeVHP3/qIn4nu
	 uATX5WESQIyruzZZ40JVQWrokQU8Bq2g/SKKPEqR4wm9YdXhgMpx34d9WxzTQpDtA4
	 3oEEc58NlRjDKTBsV+oDoLCHpqytjw4JjCWdN9rvm4bbQwIDlooCULFl1ZSbemfJfE
	 6oOjOoHXieUrgo6AVAsWFVoxqFkgEoNZyktOxMCamPq5l7Aw5KP3o5O2GQkQhyXcCv
	 ptW59TlXfcy882dXBtvoJADOOhsYgKmTQCqpWsFE0xwG4QBFipU7xpgubPIWRfc85s
	 gdWZh6VoU5wNg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andybnac@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, bjorn@rivosinc.com, puranjay12@gmail.com,
 alexghiti@rivosinc.com, yongxuan.wang@sifive.com, greentime.hu@sifive.com,
 nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com,
 eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com,
 samuel.holland@sifive.com
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt
 improvements
In-Reply-To: <20241127172908.17149-1-andybnac@gmail.com>
References: <20241127172908.17149-1-andybnac@gmail.com>
Date: Tue, 03 Dec 2024 13:18:41 +0100
Message-ID: <87ldwxot7i.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_041846_706748_280FEFE0 
X-CRM114-Status: UNSURE (   6.19  )
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

QW5keSEKCiJhdG9taWMiIHNwZWxsaW5nIGluIHRoZSBTdWJqZWN0IGxpbmUuCgpBbmR5IENoaXUg
PGFuZHlibmFjQGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBDaGFuZ2VzIGluIHYzOgo+IC0gQWRkIGEg
Zml4IHRhZyBmb3IgcGF0Y2ggMQo+IC0gQWRkIGEgZGF0YSBmZW5jZSBiZWZvcmUgc2VuZGluZyBv
dXQgcmVtb3RlIGZlbmNlLmkgKDYpCj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNDA2MjgtZGV2LWFuZHljLWR5bi1mdHJhY2UtdjQtdjItMC0xZTVmNGNiMWYw
NDlAc2lmaXZlLmNvbS8KCkhtbSwgdGhlIGZpeGVzIHRhZyB3YXMgbm90IGluY2x1ZGVkLgoKQWxz
bywgdGhlcmUgd2FzIGEgbG90IG9mIGNvbW1lbnRzIGZyb20gdjIgdGhhdCB3YXMgbm90IGFkZHJl
c3NlZDoKCiAqIE1pbm9yIHNwZWxsaW5nIG5pdHMKICogQnJlYWtpbmcgRElSRUNUX0NBTEwsIGFu
ZCBpbmNsdWRlIFB1cmFuamF5J3MgQ0FMTF9PUFMgd29yayBpbiB0aGUKICAgc2FtZSBzZXJpZXMg
Zm9yIERJUkVDVF9DQUxMLCB0byBhdm9pZCBicmVha2FnZS4KCkknbGwgaGF2ZSBhIGxvb2sgYXQg
dGhlIGJhcnJpZXJzICh3aGljaCBjYW1lIHVwIGF0IHBsdW1iZXJzKSEKCgpDaGVlcnMsCkJqw7Zy
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
