Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF82FC53214
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCfQdv0tRdtms4Ti16L0yCt6rwPuyjzdrphCQUTSR2Y=; b=nndMsnSWKc5nJ5
	Jm5dm7f2d1lq2DK/l2YB+1oyQDgetepGcL6kAKpRX4fXR8Y6yhlGVqkgjjb67FqwVpIQo0OKZZsZ1
	w8PFf4qYLPeSZDpKKwSZziJruU9u8vv2R1UEovmQF8gTo1Ud8sEGv/nY3P5LXBEPx/xSuso52/c/I
	1Bd9y/H/d4x0+j1rjf25pO+27FbhClcxNF55rOYRsxMl0D6IERmVr+59mFvdpVK/vToBJAyW73TcD
	MnUp57qvKjQJv83GkC+jMswX5BVgOys1Xwb0wSIxdIa8z4NwY0k51wwV8JndoJIOKWP1D3d+M7FU5
	VC6K/Bx/bvSzMrt3pHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHr3-0000000DCgT-09Ed;
	Fri, 20 Feb 2026 04:11:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqt-0000000DCSz-0NBg
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 04:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5535660054;
	Fri, 20 Feb 2026 04:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215C2C116D0;
	Fri, 20 Feb 2026 04:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560650;
	bh=lEDphkNfF/wAgNK1oaGZmspeVX/R9zMsEPgz0V/STnY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mS91MNvuIqqLzou99GQPnJOtxPbp7TFCM4hnhUPz8WRCLO676Lugl0BDU9+4oEmk+
	 p6NI7jfQpy8JDW1fs6AyX+94muIDzlzhr9XswIwJ5d+FGCg4iIzvrvoEoGGOkf3OIL
	 FuQt8DOqUOCkllkSt9jxSrgvQGqsrZ5z5Vh9/RUc9K0iH5+yD7wmYLrHLjkfcwFKiZ
	 55cIHDO9RvjTrRSynKAtJuGuD0Nc9blXkNt90go8xyLe5IXZBFMAgOwS12mFwavrh1
	 lvHX4uAmKSanqIRkqiYOJjOXwvCxfcBrTIlaVblBD5skCTd2qyaiWbwRBZj7js+05E
	 V8t+h/RAzbQPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1EB3809A88;
	Fri, 20 Feb 2026 04:10:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] Re: Typo in pinctrl-th1520.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156065829.189817.12382540253108472501.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:58 +0000
References: <20260119152004.166749-1-thomas.gerner@muenchen-mail.de>
In-Reply-To: <20260119152004.166749-1-thomas.gerner@muenchen-mail.de>
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Cc: linux-riscv@lists.infradead.org, linusw@kernel.org, fustini@kernel.org,
 guoren@kernel.org, wefu@redhat.com
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

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIHJpc2N2L2xpbnV4LmdpdCAoZml4ZXMp
CmJ5IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPjoKCk9uIE1vbiwgMTkgSmFuIDIw
MjYgMTY6MjA6MDIgKzAxMDAgeW91IHdyb3RlOgo+IE9uIDE5LjAxLjI2IGF0IDE1OjMyIExpbnVz
IFdhbGxlaWogd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAxOSwgMjAyNiBhdCAyOjU24oCvUE0gVGhv
bWFzIEdlcm5lcgo+ID4gPHRob21hcy5nZXJuZXJAbXVlbmNoZW4tbWFpbC5kZT4gd3JvdGU6Cj4g
Pj4gT24gTW9uLCAxOSBKYW4gMjAyNiBhdCAxMDowMDowNiArMDEwMCBMaW51cyBXYWxsZWlqIHdy
b3RlCj4gPj4KPiA+Pj4gT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgODoxNiBUaG9tYXMgR2VybmVy
Cj4gPj4+IDx0aG9tYXMuZ2VybmVyQG11ZW5jaGVuLW1haWwuZGU+IHdyb3RlOgo+ID4+Pgo+ID4+
Pj4gSSdtIG5ldyBpbiB3b3JraW5nIG9uIHRoZSBMaW51eCBrZXJuZWwgYmVjYXVzZSBvZiBteSBC
ZWFnbGVWLUFoZWFkLiBOZXh0Cj4gPj4+PiB0aW1lIHdoZW4gSSBzZW5kIGEgcGF0Y2ggSSB3aWxs
IHVzZSBnaXQgc2VuZC1lbWFpbC4KPiA+Pj4KPiA+Pj4gV2lsbCB5b3Ugc2VuZCBhIHByb3BlciBw
YXRjaCBmb3IgdGhpcz8KPiA+Pj4KPiA+Pj4gT3RoZXJ3aXNlIHBlcmhhcHMgRHJldyBjYW4gc2Vu
ZCBhIHByb3BlciBwYXRjaCB0byBmaXggdGhpcyBidWcKPiA+Pj4gc28gSSBjYW4gYXBwbHkgaXQ/
Cj4gPj4KPiA+PiBJIGhvcGUgdGhpcyB0aW1lIHRoZSBwYXRjaCBpcyBwcm9wZXIgZm9ybWF0dGVk
Lgo+ID4KPiA+IE5haCBpdCBkb2Vzbid0IHdvcmsuLi4gYnV0IEkgY291bGQgZml4IHRoYXQgdXAg
aWYgeW91IHNlbmQgaXQgYWdhaW4KPiA+IGFuZCBwcm92aWRlIHlvdXIgIlNpZ25lZC1vZmYtYnki
IGJlY2F1c2Ugb3RoZXJ3aXNlIEkgY2Fubm90IGxlZ2FsbHkKPiA+IGFwcGx5IGl0Lgo+ID4KPiAK
PiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gUmU6IFR5cG8gaW4g
cGluY3RybC10aDE1MjAuYwogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9yaXNjdi9jLzMwNGMz
ZWJjYWZmMwoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJ
IGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5o
dG1sCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
