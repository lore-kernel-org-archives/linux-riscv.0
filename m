Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E22C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 03:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F1yBBdkNG9AD6kxBsSZHFvtZXCrWu5rBRiRVFOVa0Tc=; b=z56OJRSdRqhmHe
	VanSCaIbxGu+Nl5hCbVw0nAXudNsGr0ZagESgdruz8+2PFRjEupMHzYXyZFIWv3uIWqXcPJzXS6n0
	3INCXc4EIaOBR10riGXyxIzRrut/E+zMfuvjg6xJezJG6VTQ3KpdX4iSO8DDMnCaxgK9W4RkKCxZn
	5ZMrzYa9o0P1zuhwUdzSv1L/X0KlueT++zFZWpD+nEz47921oK5zsM9IQns8784CE/iisHIg8wiI+
	tDDGJigp8ZePDhUFm+8QGtWGuJRRg7nQSLl/FQ6C5P9HhlDbPYLvy8y+vxZubpUm9eD5oaY9Pjzvb
	rmsg6PcUgsJiEH9NLmiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmS39-00Dl7q-DI; Thu, 05 May 2022 03:21:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmS31-00Dl2u-5I
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 03:21:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55A5D6194D
 for <linux-riscv@lists.infradead.org>; Thu,  5 May 2022 03:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6186C385AC
 for <linux-riscv@lists.infradead.org>; Thu,  5 May 2022 03:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651720856;
 bh=8W4kBn4cvHk6r3+lwf/6ButOTrWe/kiGQICQ5Hzrtlw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FsKAEPNukmcvqs1jSJKvHbv0ZcUg2sRA7g2/5ePhk6FUORuSb5R+6Kv1ZzjkQN1lF
 NL+2PW4NWGt8Urhl4tDWPb2A4QEBnDQr9qKChZuNY8a/y+/jLAJj2FhS8OUMctGDaZ
 8E9en/rFsjlglnVgjSzG5PR8EUt/2+vNazHFaHb5gZJpqSAWpXLPGCOtBmQt3zIhxG
 eTXW/k409sC/4FnULBm6v1x3Tui1dawnbHHopmQwb3zMtZ4X8Q7B885mN7BbSm5473
 dvVTtMfB8M5V+2JqFU0K5/Ot4JV/Jvi2qKdSfUIOI2T8qYITyk5wy5127scbHKdOm6
 654/AwanSztVg==
Received: by mail-vk1-f181.google.com with SMTP id b81so1527020vkf.1
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 20:20:56 -0700 (PDT)
X-Gm-Message-State: AOAM531YW1+C/u/fLA5XMtQsE46LPlpIhNCDK8XWxSfACOPqK2IDow5+
 GgbDv/J+F2BFc//bV86+dT0KY6EuzhcDN3OY3ys=
X-Google-Smtp-Source: ABdhPJyJZejNzSZk8O7z5JR3mWL5/1Sv673cZFpbPSQ+7GqKCT9F24kk4CFIyITIIwUZE190BgkA/I9p6RX4tzvx38w=
X-Received: by 2002:a1f:1856:0:b0:34e:be86:97b4 with SMTP id
 83-20020a1f1856000000b0034ebe8697b4mr5873966vky.8.1651720855656; Wed, 04 May
 2022 20:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220430153626.30660-1-palmer@rivosinc.com>
 <20220430153626.30660-7-palmer@rivosinc.com>
 <3100713.5fSG56mABF@diego>
In-Reply-To: <3100713.5fSG56mABF@diego>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 5 May 2022 11:20:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRspLiaSExBMOXODTokhBofUXrF7sKAT8wp-XnKf3VJ=g@mail.gmail.com>
Message-ID: <CAJF2gTRspLiaSExBMOXODTokhBofUXrF7sKAT8wp-XnKf3VJ=g@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] RISC-V: Move to queued RW locks
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
X-CRM114-CacheID: sfid-20220504_202059_329302_4F750EF9 
X-CRM114-Status: GOOD (  12.55  )
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
MjAyMiBhdCA4OjAzIFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+
Cj4gQW0gU2Ftc3RhZywgMzAuIEFwcmlsIDIwMjIsIDE3OjM2OjI1IENFU1Qgc2NocmllYiBQYWxt
ZXIgRGFiYmVsdDoKPiA+IEZyb206IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
Pgo+ID4KPiA+IE5vdyB0aGF0IHdlIGhhdmUgZmFpciBzcGlubG9ja3Mgd2UgY2FuIHVzZSB0aGUg
Z2VuZXJpYyBxdWV1ZWQgcndsb2NrcywKPiA+IHNvIHdlIG1pZ2h0IGFzIHdlbGwgZG8gc28uCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+
Cj4KPiBvbiByaXNjdjY0K3Jpc2N2MzIgcWVtdSwgYmVhZ2xldiBhbmQgZDEtbmV6aGEKPgo+IFRl
c3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPgo+CgoKLS0gCkJlc3Qg
UmVnYXJkcwogR3VvIFJlbgoKTUw6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
