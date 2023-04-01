Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBE5C76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPUTc4AP1EcOO/AFIszNB81CfvQUy/M21UBcZYF4Feg=; b=uPQpOaHgeih/Ic
	IAzfbezZCuZZaVIQi7/bTo23aUtd7JV1V4LdmHiVSZg0v/aJdTv8z/ojAOCeSkcwlcOlVJmtL3pYW
	KfthB8tRDZL3MJMWz1D3rqWPbnyUcHAx1u5dzoBLRi5oz7rQvUwVe+aQ9Yekr4LhrXLw9Hi2Y2U4D
	kADVikO8YUbNfg4u4qqMaI2TMTlDB2sEC83A+DTGJSywaB8tKviEVPUAUEEs4TU09rs6zq289DkYj
	o+1M6QF5elCl4PW4ECfeo7N82KIfwLGShweUOVLFBzegIl6LTWbzCqhALoZC+q8o/ZILHlFh1R9jK
	ZkZfNvsKxZlqId28I90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pibMv-00AcCe-1X;
	Sat, 01 Apr 2023 13:34:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pibMq-00AcB7-1C
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 13:34:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C401AB80B4B;
	Sat,  1 Apr 2023 13:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032FEC433EF;
	Sat,  1 Apr 2023 13:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680356040;
	bh=d+f3cZTfNN9Huus228jMdP54g991a3RxHdxwXg0GzFU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FWdWT7/Ek7cR5J0WDX/zZowJ9GOaVlKItTb8+HVThYHp4itMzaWmk4F/anWCVtHQh
	 VRHjR85k5sWiGYxO+hV1dxx+bvvTTTil5wFkIBSn9DmHlxE61fKQIVuO1AEOAWKem0
	 sx12G/2Z82xBwxeNKoPlfTpNH++ftc7tMX4QevZ7lZKJM2ChDlYXC6ERO6XnX9s0e1
	 r2wOafRlaTXdXM4DT2fgqYnNSYaqL03H0wFS0agwwFIHNwTttY8EQSpt6eXeKSS3Ot
	 VB/ChVBgE/DXGRbo7ILLJpmAXU+G2S9OR+4P3QPZkjigtec3yUBsKCC4Ce68D7LtJg
	 xvgosWhvvP8dA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Guo Ren
 <guoren@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, palmer@rivosinc.com,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Yipeng Zou
 <zouyipeng@huawei.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
In-Reply-To: <87mt3rloyr.fsf@all.your.base.are.belong.to.us><
References: <20230222033021.983168-1-guoren@kernel.org>
 <23668656.ouqheUzb2q@diego>
 <CAJF2gTSWETHhQFuE19H+RVX6Jbue+UAu8o94QoBFx65NABas1Q@mail.gmail.com>
 <2587778.7s5MMGUR32@diego> <87mt3rloyr.fsf@all.your.base.are.belong.to.us>
Date: Sat, 01 Apr 2023 15:33:57 +0200
Message-ID: <87edp3loai.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_063406_345589_76988962 
X-CRM114-Status: GOOD (  12.36  )
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

KE5hcnJvd2luZyB0aGUgQ2MgbGlzdC4pCgpCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3Jn
PiB3cml0ZXM6Cgo+Pj4gPiA+ID4gVGhpcyBoYXMgdW5mb3J0dW5hdGVseSBicm9rZW4gYm9vdGlu
ZyBteSB1c3VhbCBORlMgcm9vdGZzIG9uIGJvdGggbXkgRDEKPj4+ID4gPiA+IGFuZCBJY2ljbGUu
IEl0J3Mgb25lIG9mIHRoZSBGZWRvcmEgaW1hZ2VzIGZyb20gRGF2aWQsIEkgdGhpbmsgdGhpcyBv
bmU6Cj4+PiA+ID4gPiBodHRwOi8vZmVkb3JhLnJpc2N2LnJvY2tzL2tvamlmaWxlcy93b3JrL3Rh
c2tzLzM5MzMvMTMxMzkzMy8KPj4+ID4gPiA+Cj4+PiA+ID4gPiBJdCBnZXRzIHByZXR0eSBmYXIg
aW50byB0aGluZ3MsIGl0J3Mgb25jZSBzeXN0ZW1kIGlzIG9wZXJhdGlvbmFsIHRoYXQKPj4+ID4g
PiA+IHRoaW5ncyBnbyBwZWFyIHNoYXBlZDoKPj4+ID4gPgo+Pj4gPiA+IFNob3VsZGEgc2FpZCwg
Y2FuIHNoYXJlIHRoZSBmdWxsIGxvZ3MgaWYgcmVxdWlyZWQgb2YgY291cnNlLCBidXQgdGhleSdy
ZQo+Pj4gPiA+IHF1aXRlIHZlcmJvc2UgY29zIHN5c3RlbWQgZXRjLgo+Pj4gPgo+Pj4gPiBJIHdh
cyBqdXN0IGludmVzdGlnYXRpbmcgdGhlIHNhbWUgdGhpbmcganVzdCBub3cuIFNvIHRoYXQgc2F2
ZXMgbWUgc29tZQo+Pj4gPiB0cmFja2luZyBkb3duIHRoZSBjdWxwcml0IDotKSAuCj4+PiA+Cj4+
PiA+IE15IG1haW4gcWVtdSBpcyBsaXZpbmcgYXMgYSAiYm9hcmQiIGluIG15IGJvYXJkZmFybSAo
YWxzbyBkb2luZyBuZnNyb290KQo+Pj4gPiBhcyB3ZWxsIGFzIG15IGQxIG5lemhhIHdpdGggbmZz
cm9vdCB3YXMgYWZmZWN0ZWQuCj4+PiBDYW4geW91IHJlcHJvZHVjZSBpdCB3aXRoIHFlbXU/IENv
dWxkIGdpdmUgbWUgc29tZSB0aXBzIGFuZCBsZXQgbWUKPj4+IHJlcHJvZHVjZSBpdCBvbiBxZW11
Pwo+Cj4gRldJVywgSSdtIGdldHRpbmcgdGhlIHN5c3RlbWQgaXNzdWUgdy9vIE5GUywgb24gYSBy
ZWd1bGFyIDlwIHZpcnRmcy4KPgo+IHwgJCBzdWRvIG1tZGVic3RyYXAgLS1hcmNoaXRlY3R1cmU9
cmlzY3Y2NCBsdW5hciBydi1yb290ZnMgaHR0cDovL3BvcnRzLnVidW50dS5jb20KPgo+IGFuZCB0
aGUgcm9vdGZzIHFlbXUgY29uZmlnOgo+ICB8ICAtZnNkZXYgbG9jYWwsaWQ9cm9vdCxwYXRoPS9w
YXRoL3RvL3J2LXJvb3Rmcy8sc2VjdXJpdHlfbW9kZWw9bm9uZSBcCj4gIHwgIC1kZXZpY2Ugdmly
dGlvLTlwLXBjaSxmc2Rldj1yb290LG1vdW50X3RhZz0vZGV2L3Jvb3QgXAo+ICB8ICAtYXBwZW5k
ICJyb290PS9kZXYvcm9vdCBydyByb290ZnN0eXBlPTlwIHJvb3RmbGFncz12ZXJzaW9uPTlwMjAw
MC5MLHRyYW5zPXZpcnRpbyxjYWNoZT1tbWFwLGFjY2Vzcz1hbnkgc2VjdXJpdHk9bm9uZSBlYXJs
eWNvbiBjb25zb2xlPXR0eTAgY29uc29sZT10dHlTMCIKCkkgdG9vayBhIGNvdXBsZSBvZiBkaWZm
ZXJlbnQgdmVyc2lvbnMgb2YgdGhlIHNlcmllcyBmb3IgYSBzcGluLCBhbmQgZm9yCm1lIGl0IHN0
b3BzIHdvcmtpbmcgYmV0d2VlbiB0aGVzZSB2ZXJzaW9ucy4KCiQgZ2l0IGZldGNoIGh0dHBzOi8v
Z2l0aHViLmNvbS9ndW9yZW44My9saW51eC5naXQgZ2VuZXJpY19lbnRyeV92MTI6Z2UtdjEyCiQg
Z2l0IGZldGNoIGh0dHBzOi8vZ2l0aHViLmNvbS9ndW9yZW44My9saW51eC5naXQgZ2VuZXJpY19l
bnRyeV92MTM6ZzItdjEzCgp2MTIgaXMgaGFwcHkgd2l0aCBzeXN0ZW1kLCB2MTMgaXMgbm90LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
