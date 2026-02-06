Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE9FEE208C
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kD2mbpkKSuDJlw3DGYDd6v1yFXdDUz5WT9zDK/N+XI=; b=STjYyXbtbwm1yF
	otZnrR3musjCiuoGlDyZvh9kZiOQU6X7amyzvh6k4SDhqBGQXetLV+WLpSvlBUr5FpWa94lwf2tzt
	pW+r1mlhjV702g6hC5KF50VXao9ObieKhvzI5sR9NAxN/qE51iMfqDLVjsSPu5CfAnTwPjd9CNoh1
	W8arUh+EMiT6L6ocN8ATpdt8DJYsw76/ysIJjMBg/+g7ef0od57kRQBeYhvpinD3LrDqdHdZjAuy3
	bP40CA7BatTwbPW64QBGfYopoP2KXuzjt5AhuxqDHR9KCRVs3WE46u30Qm51m032djmkbrry2T8S7
	XDx8ggoYuLVTfjiQaO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKf2-0000000BHj9-1dr6;
	Fri, 06 Feb 2026 12:10:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKf0-0000000BHiy-3SSK
	for linux-riscv@bombadil.infradead.org;
	Fri, 06 Feb 2026 12:10:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oANQ+phk7g8iVeelCxDqsFwg/mOvwmmphBUQWi4Vr7M=; b=jnj0U+m5HglOBbtvHJopUebHLK
	dcIq8LKiTDJaRuQbEe5BLGTWAshKnmtVW2nIVAvWHl7ifw6+PH/Z/N7Mn6O9F2tRvQnuzqRmxQ11E
	gbdA1DsMQt0xnNZMy+NSUVWoQJNJTLc+qtMdp8mkTXoV/7pqeY4EEZh6l0MMq6qj6Ye4EHvUE7f5X
	54pYnSBLi3jUZpqyTuD4Z3B6XPcC6Jr4zLOtrYAIUPjQRam2RJfUUADxAJBds++BwmmnL1I0o+QyF
	6gJ0jpfYWHahtInlAZTcU9fKa9wHv4ikg4ZlpkOKJs3vjxocYncyt6OtgpSyK2MH/vv6kmP2ExaRc
	KB/1nojA==;
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKew-00000003l7W-3aqn
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 12:10:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770379677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oANQ+phk7g8iVeelCxDqsFwg/mOvwmmphBUQWi4Vr7M=;
	b=bv5oOGtV5TZg0hz49pPOyH+7SIxct7UhGiLRc6Ueu1pX6nZ0/z3oMBXr7swFVl0SsIJOuY
	N8/yYqM9ifsY55Rw7NKXO30W+frUDXiYZ9UsJE8vpfBc4Id4goLFYqjx+/CQEO4cqIPhCe
	jQkpxpFfwj7znchmcxLggCUDGfZ1j8E=
From: Menglong Dong <menglong.dong@linux.dev>
To: Menglong Dong <menglong8.dong@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, jiang.biao@linux.dev,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/3] bpf,
 riscv: add fsession support for trampolines
Date: Fri, 06 Feb 2026 20:07:35 +0800
Message-ID: <5088614.31r3eYUQgx@7950hx>
In-Reply-To: <CAJ+HfNizNFc0j_eUNFR3_kO8diQzbjce8oLzBEOK2sWnG=rGhg@mail.gmail.com>
References: <20260203055231.1088479-1-dongml2@chinatelecom.cn>
 <20260203055231.1088479-3-dongml2@chinatelecom.cn>
 <CAJ+HfNizNFc0j_eUNFR3_kO8diQzbjce8oLzBEOK2sWnG=rGhg@mail.gmail.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_121003_670291_C9F96403 
X-CRM114-Status: UNSURE (   8.00  )
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

T24gMjAyNi8yLzYgMTk6MjIsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gT24gVHVlLCAzIEZlYiAy
MDI2IGF0IDA2OjUzLCBNZW5nbG9uZyBEb25nIDxtZW5nbG9uZzguZG9uZ0BnbWFpbC5jb20+IHdy
b3RlOgo+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMg
Yi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gPiBpbmRleCBlNGY0NWUyZTdlMmYu
LmYxMDQxOGZmNmE5YiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29t
cDY0LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiAKPiA+IEBA
IC0xMDQyLDEwICsxMDY3LDE0IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1w
b2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCj4gPiAgICAgICAgICAqICAgICAgICAg
ICAgICAgICAgWyAuLi4gICAgICAgICAgICAgICBdCj4gPiAgICAgICAgICAqIEZQIC0gYXJnc19v
ZmYgICAgWyBhcmcxICAgICAgICAgICAgICBdCj4gPiAgICAgICAgICAqCj4gPiAtICAgICAgICAq
IEZQIC0gbnJlZ3Nfb2ZmICAgWyByZWdzIGNvdW50ICAgICAgICBdCj4gPiArICAgICAgICAqIEZQ
IC0gZnVuY19tZXRhX29mZiBbIHJlZ3MgY291bnQsIGV0YyBdICBhbHdheXMKPiAKPiBOaXQ6IFBs
ZWFzZSByZW1vdmUgdGhlICJhbHdheXMiIGNvbW1lbnQuIEl0J3Mgbm90IGhlbHBmdWwuCgpBaCwg
c29ycnkgdGhhdCBJIHNlbmQgb3V0IHRoZSBWMiBiZWZvcmUgSSBzYXcgdGhpcyBlbWFpbC4gTGV0
Cm1lIHNwaW4gYSBWMy4KClRoYW5rcyEKTWVuZ2xvbmcgRG9uZwoKPiAKPiAKCgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
