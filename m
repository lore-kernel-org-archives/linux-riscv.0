Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1DBC531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 19:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjCXb0p1T/LvwLDivISMhzANfEhnY7PVlHUtEZD5LKQ=; b=BmKqhVjfUr+a26
	exUp2Or/5gHhw/OFPOtznct+Yt/cH1XrtJR+2E/fFqNmQKetQTxtUdBCLnrq/IYjJjFokwbQdV/fZ
	NeOBGKN5XBQT9x7D17dMwNpt0F7h+U+PjU4UEwQ7Yftp9xj6R3gEe3Ev0mqaK2mWd1DATAPboUBjT
	6+9qG9LQgy7vMMfwH4BMjXiLK57J+E+DAEsmoSfqbOCCVplFoAg3yNK2SeOg82Hibq8ccJPUyS5/3
	chTNTg/EXiWa6Yv5EFAhx3ejNjX4490i70eNxNkPqTmMm1N4dsRmkgv6jHRqP2HQ1Me04/lCJkdoP
	jfpB2EQAsdx7O/8UthVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLwh-0000000HC2z-3xST;
	Fri, 24 Jul 2026 19:52:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLwg-0000000HC2l-3P2H
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 19:52:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F320F60A7E;
	Fri, 24 Jul 2026 19:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263391F000E9;
	Fri, 24 Jul 2026 19:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784922753;
	bh=BvkOFAgW7KVB9mqXAbR0plG+x6ThYtwEmmSS6Tc6Ayk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LPNT8J6PKD17BwukgbJI2D1uGD7aOUu+vQ4fWZFDJs6QfjqpH9zrup9FGB4G8f7px
	 7/urGY2EC1v8w/e0eM0YwQQsxJWfKqO6v/N/7mv3NcUuprJxwLWY4lomqC6C8tWD5D
	 0lXmQf0C6bMobWbHWL5t0BAIGWz7OzTc/IrEBoss/YPv9dML7WeanAGJSg4AluOFC5
	 n+PTr8y1XRv3JSSwMclepxapnmJ8p8vw/u62hWEGCrLnj7hosoKvFXQXZUhHB6W8I9
	 YyCTmjfRE1kNxhmBuq8mvDPxUGGjAthsW3EINjNIUtCZpTagh+AFhx7+/fhUzmqOuR
	 tGgTTsTU29ygA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song
 Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Pu Lehui
 <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan
 <shuah@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Feng Jiang
 <jiangfeng@kylinos.cn>
Subject: Re: [PATCH bpf-next v5 0/3] bpf, riscv: add timed may_goto support
In-Reply-To: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
References: <20260723-riscv-bpf-timed-may-goto-v5-0-86acb54e5642@kylinos.cn>
Date: Fri, 24 Jul 2026 21:52:31 +0200
Message-ID: <8733x8qi68.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

RmVuZyBKaWFuZyA8amlhbmdmZW5nQGt5bGlub3MuY24+IHdyaXRlczoKCj4gVGhpcyBzZXJpZXMg
YWRkcyBSSVNDLVYgSklUIHN1cHBvcnQgZm9yIHRoZSB0aW1lZCBtYXlfZ290byBsb29wIGJvdW5k
Lgo+Cj4gUGF0Y2ggMSBpbXBsZW1lbnRzIGFyY2hfYnBmX3RpbWVkX21heV9nb3RvKCkgYW5kIGVu
YWJsZXMKPiBicGZfaml0X3N1cHBvcnRzX3RpbWVkX21heV9nb3RvKCkgc28gdGhlIHZlcmlmaWVy
IHVzZXMgdGhlIHRpbWVkCj4gZXhwYW5zaW9uIHBhdGguCj4KPiBQYXRjaCAyIGFkZHMgYSB0ZXN0
IHRoYXQgY2hlY2tzIFIwLVI1IGFyZSBwcmVzZXJ2ZWQgYWNyb3NzCj4gYXJjaF9icGZfdGltZWRf
bWF5X2dvdG8oKSBjYWxscy4KPgo+IFBhdGNoIDMgZW5hYmxlcyB0aGUgdmVyaWZpZXJfbWF5X2dv
dG9fMSwgc3RyZWFtX2NvbmRfYnJlYWssIGFuZAo+IG1heV9nb3RvX2ludGVyYWN0aW9uIGZhc3Rj
YWxsIHRlc3RzIG9uIHJpc2N2NjQuCj4KPiBUZXN0ZWQgb24gcmlzY3Y2NCBRRU1VIChydmEyM3M2
NCk6IG1heV9nb3RvIHByb2dyYW1zIGxvYWQgYW5kIEpJVAo+IGNvcnJlY3RseSwgYW5kIHRoZSAy
NTBtcyB0aW1lb3V0IHBhdGggd29ya3MgYXMgZXhwZWN0ZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBG
ZW5nIEppYW5nIDxqaWFuZ2ZlbmdAa3lsaW5vcy5jbj4KCk5pY2UhCgpSZXZpZXdlZC1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJq
b3JuQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
