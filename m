Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A4ECD5BC8
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 12:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bl4AFCGTjHWweZxult7bDcczFC1Ne2WMjjGfFpo7u+E=; b=02LqGoAxsd+gnt
	XLo+rIOEbw5YhL3cOogpGwXF6LOYjymazwPZD39BVs9WFSvKdVg6ivUOefs/8B+IdQJxp67a4gwT5
	6ckEx7pp8OKFg/hLRJNz2tzs0VcmBglaYJHIg7sBZ1K6bf2CJxc5SKk99LSJLSS1v7T2PFN9BXspU
	UyPQUcWGUWbXJlCTHZ9Cl/ETeWoETCMKB/DR7qlcx0F5zkYLGy2TuR/MwVucVXXz9UkQp1ETJJ70w
	iHLOyh44m0Ssfr6X5P/xoigPg1JwFAt9EDLerOHaACFR/rWtDAairjyHhA9O9guntX6ym42AUoLHy
	Yi/IAnr5qmlW1qWFf48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrH4-00000001ydE-0rOt;
	Tue, 26 May 2026 12:52:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrH3-00000001ycz-2Bzd
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 12:52:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BCFB601F3
	for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 12:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447031F00A3D
	for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779799964;
	bh=ZBXzqv/om0l+TyYWbq+zzUuQed/AxeNEWTs8z4A3i7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F/1EExE1Ik6T+4iQV6Ae/Wo6jTNMjl53q0EPL61rJRStbgn+h1SiyNdG3UFZG27vt
	 OkBgILLIh+XSnjyBhfys0mv5zsZiAnRMnlj23Yup++3+CycTyOZ9eKkkBRXfvYvZ/2
	 A1z9JFJLVrY1U0n3CLfQ3zITRVTs/brbAmIpRJmGuN5NY/kUMIZSvB178ZzKSreiVy
	 H3ROtr9c+DWV2VWqcIKUwUzwj+b5zJ6KHcoLSLDiDdIRNNsn+lic60XbgZEWDFQ6JX
	 os43uSGYpNBJj4p64rQ+dQAbpSWCCFEPsogmeUV3vLxNQ3xqS9Q+2LvHJoO+kKSxqz
	 XJkfxheFQLQFw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8dc2606a0so10707752e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 05:52:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9m+Wn1aoxjwbr/xEGF4GrdRJI1xPXSssKs8zrhGTka/QlwMCUZrIMq1+j+qRPb/zvaWENfP4l6rvQhZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiFMHkQI2i/b+buOD5A69NHPbKlCp9KtV9/MqfYZRgJw/Rb9Mq
	L6CkOOZom/bYsxTF6+D4XlpEweMZhfm1QRx5RI9H3SIfOwwmb67X07qiH/UvtemEjddtuqTabJL
	dK5ar3BzpudAZ7R7V7nPvRB+XUFYV4MI=
X-Received: by 2002:ac2:511b:0:b0:5a8:9bb6:230a with SMTP id
 2adb3069b0e04-5aa3234cbb9mr4007664e87.18.1779799962931; Tue, 26 May 2026
 05:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260519-germinate-ageless-631033d22797@spud>
In-Reply-To: <20260519-germinate-ageless-631033d22797@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 26 May 2026 14:52:30 +0200
X-Gmail-Original-Message-ID: <CAD++jL=p2RS4BHawQ2msprbmCu=4n92QWeFXgo9fRmTFcxraCg@mail.gmail.com>
X-Gm-Features: AVHnY4JgF2dwXSt4EuMCwBggSUmrP5Z_ATVf9jxCtANBQRza98t4Opi_-QI2VLg
Message-ID: <CAD++jL=p2RS4BHawQ2msprbmCu=4n92QWeFXgo9fRmTFcxraCg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] generic pinmux dt_node_to_map implementation/spacemit
 driver converted to use it
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMTE6MzfigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBIZXJlJ3MgYSByZWFsIHZlcnNpb24gb2YgbXkgZ2VuZXJpYyBw
aW5tdXggZHRfbm9kZV90b19tYXAKPiBpbXBsZW1lbnRhdGlvbi4gSSB0ZXN0ZWQgdGhpcyBvbiBt
eSBicGlmMyBidXQgdGhlIGR0cyBpbiBtYWlubGluZSBpcwo+IHZlcnkgbGltaXRlZCBpbiB0ZXJt
cyBvZiBwaW5jdHJsIHVzZSBzbyBJIHdvdWxkIHJlYWxseSBhcHByZWNpYXRlIGFueQo+IHRlc3Rp
bmcgdGhhdCBjb3VsZCBiZSBkb25lIHdpdGggYSBtb3JlIGNvbXBsZXRlIHNldHVwLgo+Cj4gSWYg
eW91IHRyeSB0byBhcHBseSB0aGlzLCBpdCdzIG9uIHRvcCBvZiBGcmFuaydzIG11eCBzZXJpZXMu
IEl0J3MgYWxzbwo+IGhlcmUgaWYgYW55IG9mIHRoZSBzcGFjZW1pdC10ZXJzIHdhbnQgdG8gbG9v
ayBhdCB3aGF0IEkgZGlkIHRvIHRoZWlyCj4gZHJpdmVyOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Nvbm9yL2xpbnV4LmdpdC9sb2cvP2g9c3BhY2Vt
aXQtcGluY3RybAoKSSBqdXN0IGFwcGxpZWQgaXQgYW5kIGl0IHNlZW1zIHRvIHdvcmssIGF0IGxl
YXN0IGl0IGNvbXBpbGVzIQoKTm8gcG9pbnQgaW4gd2FpdGluZyBmb3IgbW9yZSByZXZpZXcgY29t
bWVudHMsIGxldCdzIHNoaXAgaXQgYW5kIHNlZQp3aGF0IGhhcHBlbnMuCgpZb3VycywKTGludXMg
V2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
