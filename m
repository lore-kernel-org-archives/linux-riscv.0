Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED795C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 03:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTGAD71lYGfbsQGHdiXzViHxb+DC0I4Qk2L5wHxH6dw=; b=acIg/i0RyWIw6N
	sVeg6O8p6jCpToozdtP3jKidF/+ERND9h4EQENRxWA9QvnThXzNBsHpZNQrQNP1HHZoAtjiQp67A6
	p943Zmz7zgDVfH6c8WCEWz5RLpY/kebJPA/Gawz9QRZewrQuQxqrE86cLWATsc9uRwFnYx/Agjh5I
	K+B+mSMTLbIUaIBJ+YVq1EvUsLKlA/dQEC/jmpoJOzSQR8tTYxGkJEsZVkxHph8TNWrF6DId9Ldr5
	KslRMh9wXiyLzD47Ln0d/SJf8luJXqhh3Y9jIaDNtaE7FMyKckfKyjbPQmwYfGLOBctiMo+zSqyr0
	7WqWZnqoVzIhioe5l85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmS3l-00DlXX-BN; Thu, 05 May 2022 03:21:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmS3h-00DlU4-QA
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 03:21:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 95BE5B82B24
 for <linux-riscv@lists.infradead.org>; Thu,  5 May 2022 03:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A28C385B5
 for <linux-riscv@lists.infradead.org>; Thu,  5 May 2022 03:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651720897;
 bh=WI76IzBl5E+DVGCHLZoWTBt/u6JBPeoGf/8qPZFcVao=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dD8GAhv1JedQ8m+DwFkBY7KL0AYcMUyju8/h+Wd1qK/l8GGy/ThsplwdZRal1beO0
 FWmDAzketLrU8KsCO7XLtzf4ghKg5Kl5rsFUVgmWp0aSWrk0IXL6n7iolctNNr86Ym
 wlYxAx02eGzHs4u6aTi0pTLuG5UhDWuaPgdu5TWBE+vspZ3iW4niDtqADKKTENHeYx
 PSWLz/H/FyqKeOB/rxN5Y9L4CqXxsUSU7iTc1QBNsjUrpPubrh++9Oohta/OxF2g/s
 dfRCn0NOviMP3K90DhKmWPIEURG0G/JD5K2bGRTf5T+5Ynf4cgcVOZRStTvPxWhvnx
 TfVnA4bXUlCLg==
Received: by mail-ua1-f45.google.com with SMTP id i16so1220096uat.5
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 20:21:37 -0700 (PDT)
X-Gm-Message-State: AOAM5337Tac0UcIOag8M32eSfHtdT/uG1JUT5cBzsdl6uCBeZO1grARD
 YpgN3smHP65tQODmo0l7AXXgkZk3Jvk919vNDlE=
X-Google-Smtp-Source: ABdhPJz7HX2dmfOkhWZMgS9lfnbrZYrBU9XtWlH/KZSbKdZYqPn9l6+QzwX4PKswK0JznE1x6+YJtNZui3FYrsicNLI=
X-Received: by 2002:a9f:23c2:0:b0:365:958:e807 with SMTP id
 60-20020a9f23c2000000b003650958e807mr7073593uao.114.1651720896690; Wed, 04
 May 2022 20:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-6-palmer@rivosinc.com>
 <3428595.iIbC2pHGDl@diego>
In-Reply-To: <3428595.iIbC2pHGDl@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 5 May 2022 11:21:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSAbjTOjG+BhR-NW4i=Zqtb4eJ=5dTfxU1bU2Oc8V=2Wg@mail.gmail.com>
Message-ID: <CAJF2gTSAbjTOjG+BhR-NW4i=Zqtb4eJ=5dTfxU1bU2Oc8V=2Wg@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] RISC-V: Move to generic spinlocks
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, macro@orcam.me.uk, jszhang@kernel.org, 
 linux-csky@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 linux-arch <linux-arch@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_202142_175129_759AB44A 
X-CRM114-Status: GOOD (  18.10  )
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

UmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gV2VkLCBNYXkgNCwg
MjAyMiBhdCA4OjAyIFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+
Cj4gQW0gU2Ftc3RhZywgMzAuIEFwcmlsIDIwMjIsIDE3OjM2OjI0IENFU1Qgc2NocmllYiBQYWxt
ZXIgRGFiYmVsdDoKPiA+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
Pgo+ID4KPiA+IE91ciBleGlzdGluZyBzcGlubG9ja3MgYXJlbid0IGZhaXIgYW5kIHJlcGxhY2lu
ZyB0aGVtIGhhcyBiZWVuIG9uIHRoZQo+ID4gVE9ETyBsaXN0IGZvciBhIGxvbmcgdGltZS4gIFRo
aXMgbW92ZXMgdG8gdGhlIHJlY2VudGx5LWludHJvZHVjZWQgdGlja2V0Cj4gPiBzcGlubG9ja3Ms
IHdoaWNoIGFyZSBzaW1wbGUgZW5vdWdoIHRoYXQgdGhleSBhcmUgbGlrZWx5IHRvIGJlIGNvcnJl
Y3QKPiA+IGFuZCBmYXN0IG9uIHRoZSB2YXN0IG1ham9yaXR5IG9mIGV4dGFudCBpbXBsZW1lbnRh
dGlvbnMuCj4gPgo+ID4gVGhpcyBpbnRyb2R1Y2VzIGEgaG9ycmlibGUgaGFjayB0aGF0IGFsbG93
cyB1cyB0byBzcGxpdCBvdXQgdGhlIHNwaW5sb2NrCj4gPiBjb252ZXJzaW9uIGZyb20gdGhlIHJ3
bG9jayBjb252ZXJzaW9uLiAgV2UgaGF2ZSB0byBkbyB0aGUgc3BpbmxvY2tzCj4gPiBmaXJzdCBi
ZWNhdXNlIHFyd2xvY2sgbmVlZHMgZmFpciBzcGlubG9ja3MsIGJ1dCB3ZSBkb24ndCB3YW50IHRv
IHBvbGx1dGUKPiA+IHRoZSBhc20tZ2VuZXJpYyBjb2RlIHRvIHN1cHBvcnQgdGhlIGdlbmVyaWMg
c3BpbmxvY2tzIHdpdGhvdXQgcXJ3bG9ja3MuCj4gPiBUaHVzIHdlIHBvbGx1dGUgdGhlIFJJU0Mt
ViBjb2RlLCBidXQganVzdCB1bnRpbCB0aGUgbmV4dCBjb21taXQgYXMgaXQncwo+ID4gYWxsIGdv
aW5nIGF3YXkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBy
aXZvc2luYy5jb20+Cj4KPiBvbiByaXNjdjY0K3Jpc2N2MzIgcWVtdSwgYmVhZ2xldiBhbmQgZDEt
bmV6aGEKPgo+IFRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPgo+
CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LWNza3kvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
