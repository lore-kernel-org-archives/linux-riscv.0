Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D26C05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOR9nzaYKbdWoUF1sn/I0TQ4MBcQMVdmjSGl0YEhTMg=; b=hz5KjCRK+c0+T5
	IRrUT4vvxaFVOC7cfcQct/2649eczgGQaG9is5MchbdnZ+WIfgWGeA89ehSYvBSW08SKeoO2gC7yy
	33yxoOUylv8C1WOtzWWXgx93Atl/VKXsKajzGvroUhO8RBtE6VMqWBq8EPo2Jo4pVn9eznIVNfdr6
	xvoRVtMB5gECvbZAe6TAFdgiDDMW/qE4X7DaEdv2WBydficSQDRWr4I3qZVRttWnVsWzEyH/n2nL6
	Y2wj1uaCWVG7niZyuKgox4GoWCmk4Ym29rh3Bz67u3iFoC/9uOgWlAXHhngcIBx/YCXSTrZuVziDW
	qS5d89Pc+2bRq0/mvVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOwZL-007f8r-PX; Mon, 06 Feb 2023 08:09:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOwZI-007f8C-No
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 08:09:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A8514B80D7D
	for <linux-riscv@lists.infradead.org>; Mon,  6 Feb 2023 08:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42D9C433D2;
	Mon,  6 Feb 2023 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675670977;
	bh=0e2t2VJGfkYzEm3gu2N4AcZY9QZnrun4j1+8q9HXSmY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ypv1NamsXLZ+Y9UOoBZChDwjgstsmR9jZdCQ7AGQ6a6kmtowuuVA9J4kArfLbxlS5
	 oS9BFhVzAQKDCDt8pTiom5/qLx+36aaUVoAx7geXfDom64UkDEfU7J0ew1J9Xnlled
	 Wpdz42rVRs6/bMfNtuuyZ50HCdtBCOhBEGftpbCeFK3oZ37VsItzxp1hjZKZZgk6dx
	 BVDz4m5kN8fAqEF1J+xHEN9CIU5Cc/ujZW/Kf0yDCqsdYJ3AHfeaITZb3k8Mqe2Pw5
	 qR6lu8f+ayzkc+lUUFge3tPpCz0Lcgf3lFgR9TrWKXynErDqdoCDL32aQ+cnZoacKk
	 CAzYMs4fW5xag==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next V3 1/2] riscv: jump_label: Fixup unaligned
 arch_static_branch function
In-Reply-To: <CAJF2gTS3s6EANWGSeykAGes=+MFbCAFxy5d0NFS+ynwRoQcCRA@mail.gmail.com>
References: <20230126170607.1489141-1-guoren@kernel.org>
 <20230126170607.1489141-2-guoren@kernel.org>
 <87357sjkv8.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTS3s6EANWGSeykAGes=+MFbCAFxy5d0NFS+ynwRoQcCRA@mail.gmail.com>
Date: Mon, 06 Feb 2023 09:09:34 +0100
Message-ID: <87pmangqpt.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_000940_959193_EF69623B 
X-CRM114-Status: GOOD (  10.03  )
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

VHJpbW1pbmcgQ2MuCgpHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPj4gQEd1
byBJIGRvbid0IHNlZSB0aGUgcG9pbnQgb2YgZG9pbmcgYSBzZXJpZXMgZm9yIHRoaXMsIGFuZCBh
c2tpbmcgdGhlCj4+IG1haW50YWluZXJzIHRvICJwaWNrIHRoaXMgcGF0Y2ggdG8gc3RhYmxlLCBh
bmQgdGhlIG90aGVyIGZvcgo+PiBuZXh0Ii4gSXNuJ3QgdGhhdCBqdXN0IG1vcmUgd29yayBmb3Ig
dGhlIG1haW50YWluZXJzL3Jldmlld2Vycz8KPiBJZiB0aGVzZSB0d28gcGF0Y2hlcyBhcmUgc2Vw
YXJhdGVkLCB0aGV5IGFyZSBhbGwgZml4dXAgdGhhdCBpc3N1ZSBhbmQKPiBjb21wZXRlZCB3aXRo
IGVhY2ggb3RoZXIuIE1ha2luZyBteSBwYXRjaCBhbiBvcHRpbWl6YXRpb24gcGF0Y2ggbXVzdAo+
IGRlcGVuZCBvbiBpdC4gVGhhdCdzIHdoeSBJIHB1dCB0aGVtIGluIG9uZSBzZXJpZXMuCgpUaGV5
IGFyZSBub3QgZGVwZWRlbnQgYXQgYWxsLCBhbmQgbm90ICJmaXh1cCIuIFRoZSBmaXJzdCBpcyBh
IGZpeCwgYW5kCnNob3VsZCBnbyBpbnRvIC1maXhlcyBBU0FQLiBUaGUgb3RoZXIgcGF0Y2ggaXMg
Y29tcGxldGVseSBzdGFuZC1hbG9uZSwKYW5kIGFuIG9wdGltaXphdGlvbiAobWF5YmUpLiBJZiB0
aGF0IGdvIGluLCBpdCdzIGZvciAtbmV4dC4KCkhhdmluZyB0aGVtIGFzIHNlcGFyYXRlIHBhdGNo
ZXMsIG1ha2VzIGl0IGVhc2llciBmb3IKcmV2aWV3ZXJzL21haW50YWluZXJzLiBOb3csIHdpdGgg
eW91ciBhcHByb2FjaCB0aGVyZSdzIG1vcmUgd29yawooY29nbml0aXZlLCBhbmQgbWFudWFsKSBm
b3Igb3RoZXJzLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
