Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69153C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y4zqZr8vcR00pvwvElqY0YMTdOAZIDbAAhwJoCbh3+k=; b=Zf01x0Is9Fhi9F
	HCoxwSBTsmgQ4tPhSz07lgLjP7dmGjWNXmJ35iVCfGoZLrdV/v8CXtbWxY0orT4r2t945vBp8E+fy
	wsTkwnBFLbi2KsDTHlSIxTk72sXRCUT9tXPYiJvEnfLfUq9N9PNUycHA1zL1hr0K9CnyvYH205B+E
	83KegWw2VQ1hC0al8gPtU3+T5Ifp/0N1V0Op8JHt3MxVlA/Gzb0JitPMkmQnZqWaNjbYyGxLr8qrH
	2VYB2z890s66QM3utligDGvHJXa1I52X9OhxPTpE6v2enJ1cpkvWMQB9pAGqLd9t5IWMs35I0H5N3
	KFMBdipci8k0JaUJiedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzwv5-009f0z-D2; Wed, 22 Dec 2021 08:24:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzwtR-009e82-O8; Wed, 22 Dec 2021 08:22:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1DB0D61901;
 Wed, 22 Dec 2021 08:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C68C36AF3;
 Wed, 22 Dec 2021 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640161356;
 bh=2XdBX3wzyy6S5BxKK0ZicVvab6NsAf6qcGVNsQ9XyZI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G1sq2eudGh36I+DqgeCDxPCVBPk0csEMF+RkmSiqSLDvPLTgXdTaQCC+nWWXVxDNg
 AJeKqswfXL/hhfl1wkRXss3IMn9bGHW6HvFl1Uwm3prQDpuQBnIg1M8UJxY2YWmA5Z
 +NbFb1B+IVW1qyZBIkva7VVApjtELEqUasFKBL/diZe5Dy99P9WBZY7HMWJ93KkozX
 8W/C/2xRr71eywqowyaRVuxcvjx0Wb5W+/5XzMieyQBXH45BPLGBE0rJPfH96/7ywy
 2MLhEBpsdyHiYpwTeQc+h07Co0IAZXRk3xEqe0qp/6gzwnBrkpdAUhWcuCW8GM1N3H
 g2V2JsflSC8uQ==
Received: by mail-ua1-f50.google.com with SMTP id p2so2766899uad.11;
 Wed, 22 Dec 2021 00:22:36 -0800 (PST)
X-Gm-Message-State: AOAM531HQBw76bMYNQN2Mt6QtDHoBfi1jsjBdkd3dT8EIYzvqT7YlDVa
 4oNd2pASRb/2cO7HGs4csYR1kO+DkJrwaR7qJ2w=
X-Google-Smtp-Source: ABdhPJyrBN3Y+GFr2Jt9nGnwL8yvmgKGPxXYCH/BMlHDVbFRTyxSsMe3GTBWxXqMbH4bqKtfuLnOWF72/H7yGJFpaXg=
X-Received: by 2002:a05:6102:316e:: with SMTP id
 l14mr716344vsm.8.1640161355738; 
 Wed, 22 Dec 2021 00:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20211221170057.2637763-1-guoren@kernel.org>
 <20211221170057.2637763-5-guoren@kernel.org>
 <c084037b-1f30-53be-bf6b-06e3401b20e8@csgroup.eu>
 <CAJF2gTQbpVczn=Zz9rgvgNRSM9AFaoc2zVz9YaL_hWpgYSaR2w@mail.gmail.com>
 <7ce6caf5-b16d-97de-fcc3-882a9a98437a@csgroup.eu>
In-Reply-To: <7ce6caf5-b16d-97de-fcc3-882a9a98437a@csgroup.eu>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 16:22:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR5NbuVRkBWyEiCmsq4y3Ua_JMZSPcX=LQdzo2tOCFyYQ@mail.gmail.com>
Message-ID: <CAJF2gTR5NbuVRkBWyEiCmsq4y3Ua_JMZSPcX=LQdzo2tOCFyYQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] sched: powerpc: Remove unused TASK_SIZE_OF
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "will@kernel.org" <will@kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>, 
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>, 
 "juri.lelli@redhat.com" <juri.lelli@redhat.com>, 
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, "x86@kernel.org" <x86@kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "sparclinux@vger.kernel.or" <sparclinux@vger.kernel.or>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_002237_876881_9BE9CE6A 
X-CRM114-Status: GOOD (  18.62  )
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

R290IGl0LiBUaHgKCk9uIFdlZCwgRGVjIDIyLCAyMDIxIGF0IDM6MjcgUE0gQ2hyaXN0b3BoZSBM
ZXJveQo8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToKPgo+Cj4KPiBMZSAyMi8x
Mi8yMDIxIMOgIDA0OjAyLCBHdW8gUmVuIGEgw6ljcml0IDoKPiA+IE9uIFdlZCwgRGVjIDIyLCAy
MDIxIGF0IDI6NDMgQU0gQ2hyaXN0b3BoZSBMZXJveQo+ID4gPGNocmlzdG9waGUubGVyb3lAY3Nn
cm91cC5ldT4gd3JvdGU6Cj4gPj4KPiA+Pgo+ID4+Cj4gPj4gTGUgMjEvMTIvMjAyMSDDoCAxODow
MCwgZ3VvcmVuQGtlcm5lbC5vcmcgYSDDqWNyaXQgOgo+ID4+PiBGcm9tOiBHdW8gUmVuIDxndW9y
ZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPj4+Cj4gPj4+IFRoaXMgbWFjcm8gaXNuJ3QgdXNlZCBp
biBMaW51eCBzY2hlZCwgbm93LiBEZWxldGUgaW4KPiA+Pj4gaW5jbHVkZS9saW51eC9zY2hlZC5o
IGFuZCBhcmNoJ3MgaW5jbHVkZS9hc20uCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgIGFyY2gvcG93
ZXJwYy9pbmNsdWRlL2FzbS90YXNrX3NpemVfNjQuaCB8IDYgKystLS0tCj4gPj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4+Cj4gPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vdGFza19zaXplXzY0LmggYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vdGFza19zaXplXzY0LmgKPiA+Pj4gaW5kZXggYzk5MzQ4MjIz
N2VkLi43ZTJlY2E0ZmFjNGQgMTAwNjQ0Cj4gPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS90YXNrX3NpemVfNjQuaAo+ID4+PiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
dGFza19zaXplXzY0LmgKPiA+Pj4gQEAgLTQ0LDEyICs0NCwxMCBAQAo+ID4+PiAgICAgKi8KPiA+
Pj4gICAgI2RlZmluZSBUQVNLX1NJWkVfVVNFUjMyICgweDAwMDAwMDAxMDAwMDAwMDBVTCAtICgx
ICogUEFHRV9TSVpFKSkKPiA+Pj4KPiA+Pj4gLSNkZWZpbmUgVEFTS19TSVpFX09GKHRzaykgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+Pj4gLSAgICAgKHRl
c3RfdHNrX3RocmVhZF9mbGFnKHRzaywgVElGXzMyQklUKSA/IFRBU0tfU0laRV9VU0VSMzIgOiAg
ICAgIFwKPiA+Pj4gKyNkZWZpbmUgVEFTS19TSVpFICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+Pj4gKyAgICAgKHRlc3RfdHNrX3RocmVhZF9m
bGFnKGN1cnJlbnQsIFRJRl8zMkJJVCkgPyBUQVNLX1NJWkVfVVNFUjMyIDogIFwKPiA+Pj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUQVNLX1NJWkVfVVNF
UjY0KQo+ID4+Cj4gPj4gSSB0aGluayB5b3Ugc2hvdWxkIHVzZSB0ZXN0X3RocmVhZF9mbGFnKCkg
aW5zdGVhZC4KPiA+Pgo+ID4+IE9yIGV2ZW4gYmV0dGVyOiB1c2UgaXNfMzJiaXRfdGFzaygpIGFu
ZCBicmluZyBiYWNrIHRoaXMgbWFjcm8gYXMgYQo+ID4+IHNpbmdsZSBsaW5lLCBzb21ldGhpbmcg
bGlrZToKPiA+Pgo+ID4+ICNkZWZpbmUgVEFTS19TSVpFIChpc18zMmJpdF90YXNrKCkgPyBUQVNL
X1NJWkVfVVNFUjMyIDogVEFTS19TSVpFX1VTRVI2NCkKPiA+IE9rYXksIGxvb2tzIGJldHRlci4g
SSB3b3VsZCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KPgo+IE5vdGUgdGhhdCBpc18zMmJp
dF90YXNrKCkgZXhpc3RzIG9uIHBvd2VycGMsIHBhcmlzYyBhbmQgc3BhcmMuCj4KPiBGb3Igb3Ro
ZXIgb25lcyB5b3UgY2FuIHN0aWxsIHVzZSB0ZXN0X3RocmVhZF9mbGFnKCkgaW5zdGVhZCBvZgo+
IHRlc3RfdHNrX3RocmVhZF9mbGFnKGN1cnJlbnQpCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBS
ZW4KCk1MOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
