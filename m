Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D337C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARzj+XEVc3cbRQjLp6/T7/yXUXK4NibyvoeDqkDksuY=; b=RuwACRBjDYY1/q
	1SABGPYu9rXzR4NCChZwDpvfoZrJbxUBidiNXDeZ7rG+ad6dfUAQZYqSvTVR2Ghqy8sXJyeUtJWIt
	8278EWF3u/oVjx0UTKBdfyeSag8mZV02Mv82Rb3k2QCVZO0RExxQU7ty/IV8a2te8nx6xoiYOXP1K
	2ccz8xaa8/0U6UpXc9F3qVLAe5A71gNqmDfvRXsOZZ4QRRJQVQVCq2OgdzbVtYvp/WaqWc9Mkya5z
	Dest+FqE++JbtTv3xdIsLwqxT1TkfLHQwf3I7XUjj9VKbLzMvcGchNWjC+mYZLVkS+pVVfqJv8pIu
	//6ie9uekS8f7VtsMvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts10A-000000062sF-2bAr;
	Tue, 11 Mar 2025 14:54:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts0zF-000000062jw-48Rq
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 14:53:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1BF3BA4571B;
	Tue, 11 Mar 2025 14:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7FEC4CEEA;
	Tue, 11 Mar 2025 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741704820;
	bh=24VDDfQsgP85KV3cgCbdJbgcSlm+eoXqCV9vCMXqR1Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rcSzep9x06fUWbwUl+77589WNOmhHHgQIJJzO/rKqYyfWH+N65/fzTWpxaY36Xx3F
	 q9emmywvjCWbTl2Hdyjr8TP9UJwFd2FQYafqLJxLzkL91VSdDSFQokqRjd+yhOVj3B
	 U/7BBCawjfqvYyJTv5hNF07GNNhTX+WCFE2839LnlHrtw2CL6POCJ23aYq1XFvcnRe
	 l8mJazkW1FZIYxdG8lcl9r+2I4O1XLWDvAKleJN5fwTNblpLEmdbXY9ZDyahQylSrk
	 DgjcJteJOPGgUAHTdoXkpX/kYff42nlxJZDdG0gbw5gEtWfp1RpbxTrGAq8WoZpmvA
	 7Oah9Q6t8THEA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Andy Chiu <andybnac@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bjorn@rivosinc.com, puranjay12@gmail.com,
 alexghiti@rivosinc.com, yongxuan.wang@sifive.com, greentime.hu@sifive.com,
 nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com,
 eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com,
 samuel.holland@sifive.com
Subject: Re: [PATCH v3 6/7] riscv: add a data fence for CMODX in the kernel
 mode
In-Reply-To: <Z9AwF5hwF0ES9Grl@andrea>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <20241127172908.17149-7-andybnac@gmail.com>
 <87ldtck8k0.fsf@all.your.base.are.belong.to.us> <Z9AwF5hwF0ES9Grl@andrea>
Date: Tue, 11 Mar 2025 15:53:36 +0100
Message-ID: <87ldtbwrdb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_075342_090580_008CD8AA 
X-CRM114-Status: UNSURE (   7.63  )
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

QW5kcmVhIFBhcnJpIDxwYXJyaS5hbmRyZWFAZ21haWwuY29tPiB3cml0ZXM6Cgo+PiBGV0lXLCB0
aGUgZm9yIFMtSU1TSUMgdGhlIHdyaXRlIGlzIGFscmVhZHkgd3JpdGVsKCksIHNvIHdlJ2xsIGhh
dmUgdGhlCj4+IHRleHQgcGF0Y2hpbmcgYW5kIElQSSBvcmRlcmVkLiBSZWdhcmRsZXNzLCB0aGVy
ZSdzIG1vcmUgdGhhbiBvbmUgZmxhdm9yCj4+IG9mIElQSSBvbiBSSVNDLVYhCj4KPiBBRkFJVSwg
dGhpcyB3cml0ZWwoKSBpcyBpbnRlbmRlZCB0byBvcmRlciB0aGUgaW5zZXJ0aW9uIChhbmQgdGhl
IGluaXRpYWxpemF0aW9uKQo+IG9mIHRoZSBDU0Qgb2JqZWN0IGJlZm9yZSB0aGUgTU1JTyB3cml0
ZXM7IHNvLCB0aGUgInJpZ2h0IGZpeCIgc2VlbXMgdG8gdHVybiB0aGUKPiAib3RoZXIgZmxhdm9y
cyIgaW50byB1c2luZyBhIHdyaXRlbCgpIG9yIHByb3ZpZGluZyBhIHNpbWlsYXIgb3JkZXJpbmcg
Z3VhcmFudGVlLgoKWWVzLCB0aGF0J3MgcHJvYmFibHkgdGhlIHJpZ2h0IGFwcHJvYWNoLCBvciBt
YXliZSBmb2xsb3ctdXAhCgo+IEFzIGEgYm9udXMsIHN1Y2ggY2hhbmdlIHNob3VsZCBhZGRyZXNz
L2ZpeCBhbGwgY3VycmVudCBhbmQgZnV0dXJlIG9jY3VycmVuY2VzIG9mCj4gdGhlIG1lc3NhZ2Ut
cGFzc2luZyBzY2VuYXJpbyBpbiBxdWVzdGlvbiAodGhlIHBhdGNoIGFkZHJlc3NlZCB0aGUgb2Nj
dXJyZW5jZSBpbgo+IGZsdXNoX2ljYWNoZV9hbGwoKSwgYnV0IHRoZXJlIGFwcGVhcnMgdG8gYmUg
YSBzaW1pbGFyIG9uZSBpbiBmbHVzaF9pY2FjaGVfbW0oKSkuCgpJbmRlZWQuIEkgd29uZGVyIGlm
IHRoZSBTQkkgcmVtb3RlIGZlbmNlLmkgbmVlZHMgaXQ/CgoKQ2hlZXJzLApCasO2cm4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
