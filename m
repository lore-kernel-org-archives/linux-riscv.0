Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64DFC001DB
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 12:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8ITywqaGHo1wr4/TKNmaozCuN27U13j82iMfVYcmfk=; b=S54zrhJi51kdD5
	iSQkcMQ31xlR1W96Ga+8J29aNstSD2WYxFB4ULgc1Sla4BsM3sS3Wq5XpToy7GAQ0Fi+ec0/2CCr8
	lJ0LyZqLElofArJGPnUgg7eS15mou3bOaPy8U8w7/frGUHEJfNJAvdrLWZrTrW1+0tGiEXN64nZRz
	NoRHBuP2f+i7GLbaQHiEPPGgXh0wKB+188Wtk92IlGwwZrxQ+gk2chSQkQqae+IZvjhIG+nD7ceKF
	0KRGCAqCnCMKEVhWGttNmQyix1g32re6w5UW4VBtUqMFv1ixh2A+69rDE8onnknaf8nWkDAmYfBnV
	+hgaAh3Zl3jWXx6RxiBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qURL5-00Acql-38;
	Fri, 11 Aug 2023 12:33:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qURL3-00AcqE-2q
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 12:33:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D334365A65;
	Fri, 11 Aug 2023 12:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65AEC433C7;
	Fri, 11 Aug 2023 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691757236;
	bh=1FHav62wGjkvJfOtUkSd7cOKVq97NsYIFXy+uWXuPQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LHYfk427SN+8jcuF4CGk2ctHNHJrOyNVbxrKiyAnLNkdP8HSx8OAFvXv5wAo92046
	 R/q+eDvY+nJpxiPoTGYLEOzMPqipfJEi1VedDPSTfsauAK29sLPTgD/3seErq/9zrL
	 R+2ts+V9OJZl6OM0Gwb3AVOSQBwP8/uRIFPJgzyuwpK/XKTg1M18WwTmGWFGb/3Nd7
	 5bpp1y38+bQBDnORdZhVikVDAlzEJAFJYSPMOpI/X6umIIXpeHGd8WRRlTe7jBouA7
	 DAoYTFfeKQHEGBQKzI7pxIdhuTEnxMeSRhBe4+IrlRXI25vHOSfNwNdLR7I+RNJSiv
	 GqzwqbnkjCftg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alan Kao
 <alankao@andestech.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Bo YU <tsu.yubo@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH -fixes] riscv: uaccess: Return the number of bytes
 effectively copied
In-Reply-To: <dff5c443-bebf-9bd9-af1c-85ebfb7c2aec@ghiti.fr>
References: <20230811110304.1613032-1-alexghiti@rivosinc.com>
 <dff5c443-bebf-9bd9-af1c-85ebfb7c2aec@ghiti.fr>
Date: Fri, 11 Aug 2023 14:33:53 +0200
Message-ID: <87r0o9ahce.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_053357_987437_D17AA0A8 
X-CRM114-Status: GOOD (  11.26  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cml0ZXM6Cgo+IE9uIDExLzA4LzIwMjMg
MTM6MDMsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gSXQgd2FzIHJlcG9ydGVkIHRoYXQgdGhl
IHJpc2N2IGtlcm5lbCBoYW5ncyB3aGlsZSBleGVjdXRpbmcgdGhlIHRlc3QKPj4gaW4gWzFdLgo+
Pgo+PiBJbmRlZWQsIHRoZSB0ZXN0IGhhbmdzIHdoZW4gdHJ5aW5nIHRvIHdyaXRlIGEgYnVmZmVy
IHRvIGEgZmlsZS4gVGhlCj4+IHByb2JsZW0gaXMgdGhhdCB0aGUgcmlzY3YgaW1wbGVtZW50YXRp
b24gb2YgcmF3X2NvcHlfZnJvbV91c2VyKCkgZG9lcyBub3QKPj4gcmV0dXJuIHRoZSBudW1iZXIg
b2YgYnl0ZXMgd3JpdHRlbiB3aGVuIGFuIGV4Y2VwdGlvbiBoYXBwZW5zIGFuZCBpcyBmaXhlZAo+
PiB1cC4KPgo+Cj4gSSdsbCByZXNwaW4gYW5vdGhlciB2ZXJzaW9uIGFzIHRoZSBjaGFuZ2Vsb2cg
YW5kIHRoZSB0aXRsZSBhcmUgCj4gaW5jb3JyZWN0OiB0aGUgdWFjY2VzcyByb3V0aW5lcyBzaG91
bGQgbm90IHJldHVybiB0aGUgbnVtYmVyIG9mIGJ5dGVzIAo+IGNvcGllZCBidXQgYWN0dWFsbHkg
dGhlIG51bWJlciBvZiBieXRlcyBub3QgY29waWVkICh0aGlzIGlzIHdoYXQgdGhpcyAKPiBwYXRj
aCBpbXBsZW1lbnRzKS4KPgo+IEknbGwgd2FpdCBmb3IgZmVlZGJhY2tzIGJlZm9yZSBkb2luZyBz
byEKCllpa2VzISBOaWNlIGNhdGNoLgoKRnVuY3Rpb25zIGxpa2UgZmF1bHRfaW5fcmVhZGFibGUo
KSB3aWxsIGZhaWwgaG9ycmlibHkgdy9vIHRoaXMuIEkgd29uZGVyCndoeSB3ZSBoYXZlbid0IHNl
ZW4gdGhpcyBwcm9ibGVtIG1vcmU/CgpGZWVsIGZyZWUgdG8gYWRkIG15IFJCIHRvIHlvdXIgbmV4
dCBzcGluIQoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
