Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1111EC5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTt41wByaD+zrkFFh7nNGhSJ34ycw9C5zsKM62igmNg=; b=Blv5kFhZzybFJn
	v2ktmPHctQsX+NP2fbEiR38zcf0Lh3Ard2USUHcACiHzbmRxqGZ8T8ORwR3pxA31wQ1dIM770fIyA
	ryyXrTxTG6GhxESF0Xh9gU5PgULlcp12xXmGUfnXtgncmDEZ6A2GmFTGefBnVcROdLji5Otk8SXab
	xwrZpeqS09dsJc82yBqgp6za5K78InZ6fl8EHYS3XFo7L1f+mpV4yTyDWQiQ90q6vkOEaIrKPZpZp
	4oUJ9/ZomHdPgpya9+i7ta5SSnU4/+uCU5A7nxIYP0tA0sgGFFqi7lLFlyBXspnEpOOIhfCfqDHLW
	BvG2GfL+hAu/GGxUOHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrbf-00000000Rfn-1eX2;
	Wed, 06 Mar 2024 13:46:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrbc-00000000Rf6-2MOy
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 13:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BE2F61788
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 13:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51837C433C7
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 13:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709732807;
	bh=HKOrEEH9HqpMNSYfotIGkrk7ePXe6ymoHU7kWVrk5c4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A4nM8yYk8QOWrEiI04Wd8IFrFQewXY+yIIPRCoEJGo2P/t5gQn60gj5qh3T1eafHs
	 LXOjbNUo04fIGUUMWWJonxlP5BCymt0wvPrVePX2mLidb5II3xxKQygK/SuBCAqxKR
	 KYx4i40t5r5SlEuobe91Fu3wHH+nSs2ElWmOjLjbz0gxoxghjJzQNPcTDtZmt+x225
	 JSzGyyOpM4stb8eeqtiIGRd3iGRc7xPpPYTrOeIhgkuPG1PHAFiVf40FA9kkT3cQ5Y
	 3AUmJr/uheeK822Kd21Epk7hNfnL2pn2OenOaOKNs7XcBHgd4MOqZ1XXZ/cft6sCmD
	 0nLLmF5QFLj1Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51336ab1fb7so5866173e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 05:46:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX0gQVTg/F8l6lsQ2Ufob0JylHyKjPx6Arvsbjujb10TsrbZvbmvUZCAgork27iUCpy5U04azOryrqSJtPki5NtSiEvSnsurtdDyJnMtN5u
X-Gm-Message-State: AOJu0YyI43V5tSk1T7gmClgqPZUgKbhDiUmFNiZMiC27Py94AFlMIBtb
	DkFeVNlttIGdIRdmfQeMNnZxK7Tw7X0a6V2IYgxcx2POpHbSG7sJZB7aJZGhEsgjSkhy7NrwjT+
	OVTK4Ki2kyJZlPpW0a8ju7jzMWUw=
X-Google-Smtp-Source: AGHT+IFtd6kyUyl/aaek2FXgMbPkbqLOm5F/X0tZjj45RQazeU+AuLjGUh5Wem8ANBIR/WKbUTh65kg8KWPii9/GDMc=
X-Received: by 2002:ac2:58d9:0:b0:513:40e8:d4fc with SMTP id
 u25-20020ac258d9000000b0051340e8d4fcmr3092686lfo.28.1709732805470; Wed, 06
 Mar 2024 05:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
 <26f3e99c-8f57-4779-a679-2085e469d9cd@siemens.com> <CAEEQ3wnDKdhCH4yz+MY+Xks21jLnuFiyx-xxa7CFczokG2shvQ@mail.gmail.com>
 <CAMj1kXFxzFRQz0BUVw27xdOj+xAVtX9jPjwaLHsEOYDUSqXMOw@mail.gmail.com> <CAEEQ3wnvTN5nGWAibjKKdMe4P3j3wPgghKn2HbOF1Xg56G=0kQ@mail.gmail.com>
In-Reply-To: <CAEEQ3wnvTN5nGWAibjKKdMe4P3j3wPgghKn2HbOF1Xg56G=0kQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 6 Mar 2024 14:46:34 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFtDyxsEvjN+Cg+HzSu_UmfES5mnpSM+LRcC3DuDoroAQ@mail.gmail.com>
Message-ID: <CAMj1kXFtDyxsEvjN+Cg+HzSu_UmfES5mnpSM+LRcC3DuDoroAQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/3] Revert "riscv/efistub: Ensure
 GP-relative addressing is not used"
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, bp@alien8.de, xiao.w.wang@intel.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_054648_727415_6087B20B 
X-CRM114-Status: GOOD (  16.39  )
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

T24gV2VkLCA2IE1hciAyMDI0IGF0IDE0OjI3LCB5dW5odWkgY3VpIDxjdWl5dW5odWlAYnl0ZWRh
bmNlLmNvbT4gd3JvdGU6Cj4KPiBIaSBBcmQsCj4KPiBPbiBXZWQsIE1hciA2LCAyMDI0IGF0IDk6
MTHigK9QTSBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBP
biBXZWQsIDYgTWFyIDIwMjQgYXQgMTQ6MDgsIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBieXRlZGFu
Y2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgSmFuLAo+ID4gPgo+ID4gPiBPbiBXZWQsIE1h
ciA2LCAyMDI0IGF0IDg6NTLigK9QTSBKYW4gS2lzemthIDxqYW4ua2lzemthQHNpZW1lbnMuY29t
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIDA2LjAzLjI0IDA5OjU2LCBZdW5odWkgQ3VpIHdy
b3RlOgo+ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCBhZmIyYTRmYjg0NTU1ZWY5ZTYxMDYx
ZjZlYTYzZWQ3MDg3YjI5NWQ1Lgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgY29tZXMg
d2l0aG91dCBhIHJlYXNvbiAtIHdoaWNoIGlzIGxpa2VseSBzb21ldGhpbmcgYXJvdW5kICJ3aWxs
IGZpeAo+ID4gPiA+IHRoaXMgcHJvcGVybHkgbGF0ZXIiLiBCdXQgdGhlbiB5b3UgcmVncmVzcyBm
aXJzdCBhbmQgb25seSBmaXgKPiA+ID4gPiBhZnRlcndhcmRzLiBDYW4ndCB0aGF0IGJlIGRvbmUg
dGhlIG90aGVyIHdheSBhcm91bmQ/Cj4gPiA+Cj4gPiA+IFNvcnJ5LCBJIGRvbid0IHF1aXRlIHVu
ZGVyc3RhbmQgd2hhdCB5b3UgbWVhbi4gQ2FuIHlvdSBoZWxwIGV4cGxhaW4gaXQKPiA+ID4gbW9y
ZSBjbGVhcmx5PyBEbyB5b3UgbWVhbiAiZGVsZXRlIG1uby1yZWxheCBpbnN0ZWFkIG9mIHJldmVy
dAo+ID4gPiBkaXJlY3RseT8iCj4gPiA+Cj4gPgo+ID4gWW91IHNob3VsZCBvcmRlciB5b3VyIHBh
dGNoZXMgaW4gYSB3YXkgdGhhdCBkb2VzIG5vdCBjcmVhdGUKPiA+IGludGVybWVkaWF0ZSBzdGF0
ZXMgKGJldHdlZW4gMS0yIG9yIGJldHdlZW4gMi0zKSB3aGVyZSB0aGUgb3JpZ2luYWwKPiA+IHBy
b2JsZW0gaXMgYmVpbmcgcmVjcmVhdGVkLgo+ID4KPiA+IFNvIGluIHRoaXMgY2FzZSwgeW91IHNo
b3VsZAo+ID4gYSkgZml4IHRoZSBpc3N1ZQo+ID4gYikgcmV2ZXJ0IHRoZSBleGlzdGluZyBwYXRj
aGVzIGluICpvcHBvc2l0ZSogb3JkZXIKPiBTaW1wbHksIEkgcGxhbiB0byByZW1vdmUgIi1tbm8t
cmVsYXgiIGFuZAo+ICJcfFJfUklTQ1ZfJChCSVRTKVx8Ul9SSVNDVl9SRUxBWCIgaW4gdGhlIHRo
aXJkIHBhdGNoIChmaXggcGF0Y2gpLgo+CgpXaHkgaXMgdGhhdCBiZXR0ZXIgdGhhbiB0aGUgY3Vy
cmVudCBhcHByb2FjaD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
