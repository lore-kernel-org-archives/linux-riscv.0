Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D027BC25B6B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 23:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHcN8/Qq1g3r+8T5FNeiVkwFMTJHGi38tO4oT/gOLhg=; b=0tYoZ/DpaY+Wnq
	qKaQ3pe4EiBncKydCQ7OIG2QhSxz1yBFFxTE2MZQwUaAyrSxgmua6JPfzlwTSgleSb6zPHLWiE0eN
	3KKNDaIYOrkjdzeaVZ9AfGGEe/gV/B6msvtJ7c7RUfngtlK0Eba1VzcpvvRRcLq269xLxfpyx+9j1
	KXiwpJ1tB9l9bzIJlZGgamiRxfoFivxiJjjgu6uZQILsuEm9Okvov/UAxZIep0pyRGfduCW0gFsqs
	8PF5V0phqRCyj8kOGnvirz0peqXsYbd8Kmf/nSrzN/X4pz92yzPhHOj0q4YU/f4lYBxlU9K2J6eEU
	YTae9ZAHQCuUITMyhIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw9bg-00FJAY-0L;
	Thu, 26 Oct 2023 23:17:40 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw9bd-00FJA8-1n
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 23:17:38 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698362255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ji0rxsrrUJ/U9e1go4W2U1EcYfM74rww2vhMKnZSaYY=;
	b=zZeew86GlfyaUrKTsUEV8Tw0wcY4T2j4QK2UrK2yIEaeQJi80ZUmXSdX+suyCn9UHz9+VZ
	VTz3XL7nVMuxw83X46QgyFLlvQ3awd25jKj5rYTZeswj81GMXtSg6pLXMjkBlHTxOtAYyy
	KsRn9vVT3Gd8ma1cCSDFS+aHZpIZj63fL6on8Gr/JcACoiN8yW3ehQGlP05aqLkxls/W0K
	r5cfUZxIanVwM7pkf8D3+m6LAX87fApoVOQ7Vz3HVcd7GIEtdcsohEQs4NLfKwwr8l/Iha
	yvlZdQFHX/HvexKQ4cI4RyfuGueGc5baJeGWVNiX73ytu1RDsIh2dWqeU28MlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698362255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ji0rxsrrUJ/U9e1go4W2U1EcYfM74rww2vhMKnZSaYY=;
	b=waxRLRDT/+QlgX3bLjkj5z8GR+W2cbNcroPWuIxAWPOUkhJIT3p2I9l/fabXaL4v6S/7EA
	nCiMEpUDM01VbtBw==
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Anup Patel
 <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH] genirq/matrix: Dynamic bitmap allocation
In-Reply-To: <87a5s5z44x.fsf@all.your.base.are.belong.to.us>
References: <20231026101957.320572-1-bjorn@kernel.org>
 <CAK9=C2Vcbq_ReGcK51uOYp+M2hakz=9=RNHaHFMbfxhth_4cnA@mail.gmail.com>
 <87a5s5z44x.fsf@all.your.base.are.belong.to.us>
Date: Fri, 27 Oct 2023 01:17:34 +0200
Message-ID: <87fs1x3re9.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_161737_737004_0F9EB2E9 
X-CRM114-Status: UNSURE (   8.56  )
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

T24gVGh1LCBPY3QgMjYgMjAyMyBhdCAxOToyNiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBOb3Rl
IHRoYXQgdGhlIHBlci1kZXZpY2UgZG9tYWluIHN1cHBvcnQgaXMgYWxyZWFkeSB1cHN0cmVhbSwg
aXQncyBvbmx5Cj4gdGhlIEFSTSBjbGVhbnVwcyB0aGF0IGFyZSBub3QuCj4KPiBJT1csIHRoZXJl
J3Mgbm8gbmVlZCB0byB3YWl0IGZvciB0aGUgQVJNIGNsZWFudXBzLiA6LSkKCkNvcnJlY3QuIFRo
ZSAmKkBeQCMlJCBkZWxheWVkIEFSTSBsaW5rIHdhcyBvbmx5IG1lYW50IGFzIGEgcmVmZXJlbmNl
IG9uCmhvdyB0aGlzIGlzIGltcGxlbWVudGVkIGFuZCBvYnZpb3VzbHkgYXMgYSByZW1pbmRlciB0
byB0aGUgQVJNIGZvbGtzIHRvCmdldCB0aGlzIGZpbmFsbHkgZG9uZS4uLgoKVGhlIG1haW4gcG9p
bnQgaXMgbm90IHRvIGludHJvZHVjZSBuZXcgdXNlcnMgb2YgdGhpcyBmYWlsZWQgcHJvZ3JhbW1p
bmcKbW9kZWwgYW5kIGluc3RlYWQgbWFrZSB0aGVtIHVzZSB0aGUgbW9yZSBmdXR1cmUgcHJvb2Yg
aW1wbGVtZW50YXRpb24KcmlnaHQgYXdheSAtIHdoaWNoIG9mIGNvdXJzZSBtaWdodCB0byB0dXJu
IG91dCB0byBiZSBjb21wbGV0ZWx5IHdyb25nCjUtMTAgeWVhcnMgZnJvbSBub3cgOikKClRoYW5r
cywKCiAgICAgICAgdGdseAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
