Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54B6C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 12:06:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5150660F4B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 12:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5150660F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATMIovVN6Am8Im7ag+Rc/pyPp7lIDP4EpXl0aagoLOw=; b=E63D+x7ImZmgxJ
	L/LxvdTZ4+3CQkF/0X2RdaaBtS33PmbQi0ybekVB8X1TBGEj6ye7oRr3OAMEhJAn3ai5qVKdXh+HJ
	3Noqt0Xc+W9wQkZ+vinXt1kVlY2XKm4JCPp3D3AGfU9cCTZyPNwvqL0/F/7+tnvrncXt2vJ70uO8Q
	NU5H8TmHIL1Su00bGuhAVFIEOCUSOGAXj8lEa4SPx1wK7JLOMu7zyfObAZqp4Fj12wdeh5dRqMLPq
	iE1dRRG3Z93P0YdtoJG1jfb5O7p1NaXJ1JG/OBIaiCPQ15fEnw+csPTgac4b+tKKYuy4+vNlcmE4c
	CoTLCM8mV/25f5ec3Aiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNUR-00BDfq-Mb; Thu, 23 Sep 2021 12:06:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNUM-00BDdw-CN
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 12:06:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id u18so16530979wrg.5
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rPN5T8McA7k2kKqTy/pX4dMxB3JbwuoA2CsK4OIX2IU=;
 b=b/i2Clm8A/XY3P2W28k7FN2YuIBtKZ7tcWOwVYykFI9EdNgZjPR/Ivgd5zKs5gsI6E
 g1iO6MXP9quXi+Ekq/k/GGaKKCoLTafSgD1HaX5efKOAa3x1R9uuR3rdE9UsZMy+j3YI
 Gb6G2YdgHGmvhGWRuC/dRRcCXCdkXRRqMWbp6k1rEtJVtPZr0LcsqDG/lsP87YnbUZnG
 pQ2arww96S6GsmcZsT7bjvIZDq9xJ2YHXExnS8K9UM9mPT1ZzFo04qla3UCnG22JXacq
 MXvjr/A1IcK15HIQ7iq+4EHLfRgyXCO8JZRQULJ928R/hCaBqxaaRy2UiGRp8WSz1PvX
 SlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rPN5T8McA7k2kKqTy/pX4dMxB3JbwuoA2CsK4OIX2IU=;
 b=BaNo8yqsc4P8zSmYUymCQhVSeOwhnQjj4syF29aftDL8roRHu5/jVKdaCTnFX+0Fcz
 cLeQY5iA1s0Mfq6+frx7XfeYcrWphY487Px26K0bIUwhSJVdf+DFAbk7T8JKirROxCfC
 cW6EiezcSMxGWC6WYJkblpiAzFJS6AVqJTmueW4HZUiBUX0cNOfpdDqc67T3LJmF4Kog
 XOCuABxGzB6HbzBTOOTJFDX7kalqRXtdCD73EKnqRFmr1zDDpqkaKFe4/FS+mbN5PBfu
 uBZWmabSjCUdwkmWBuUVsj0nsYiDlrVmuUrApKrOpeXFtbEONQovPK8mdKOaWKfKQS45
 2eag==
X-Gm-Message-State: AOAM533xGHJOeQAhGqIsw49ZaRIpq9+fk8Zj2zhEqaVLg1sNLU1ma5wz
 wy4aoBHkexGa0W8/KdL3oh3Tv3+LEXVSxhMVkz8HiA==
X-Google-Smtp-Source: ABdhPJztAa9QV5a3smRdCo5yzpkoWiLnhcXejcYMcH6FG+eEnDoOBG6Oa9aE0D4i69HYDPtOL5YRtHruqzti1svHBmM=
X-Received: by 2002:a7b:c20f:: with SMTP id x15mr4163615wmi.59.1632398764412; 
 Thu, 23 Sep 2021 05:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210923072716.913826-1-guoren@kernel.org>
 <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
 <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
 <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
 <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
 <CAAeLtUDu0yaDBcuC06nX1WUQC9k4eNuWjvAFrpkP_h0nf5BZAw@mail.gmail.com>
 <88696248a0c19a5dff660354b837514d@mailhost.ics.forth.gr>
 <CA+zEjCsO2CyhrfGGA4ceAH=LBOyqWF4U7F91VheTdr6wEJj1pw@mail.gmail.com>
In-Reply-To: <CA+zEjCsO2CyhrfGGA4ceAH=LBOyqWF4U7F91VheTdr6wEJj1pw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 17:35:52 +0530
Message-ID: <CAAhSdy3C8LQNm=Jby1BcMU-xLXB-GiW076QO3QqRVvDQh7zPkA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add RISC-V svpbmt extension
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Nick Kossifidis <mick@ics.forth.gr>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Guo Ren <guoren@kernel.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_050606_510498_96050DBF 
X-CRM114-Status: GOOD (  24.49  )
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

T24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgNToyMSBQTSBBbGV4YW5kcmUgR2hpdGkKPGFsZXhhbmRy
ZS5naGl0aUBjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgU2VwIDIzLCAyMDIxIGF0
IDEyOjExIFBNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+ID4K
PiA+IM6jz4TOuc+CIDIwMjEtMDktMjMgMTM6MDQsIFBoaWxpcHAgVG9tc2ljaCDOrc6zz4HOsc+I
zrU6Cj4gPiA+Cj4gPiA+IEhvdyBpZiB3ZSBleHBhbmQgdGhpcyB0byBhIG1tdSBzdWJub2RlIGlu
IGNwdUB4IGFuZCBhZGQgYSBib29sZWFucyBmb3IKPiA+ID4gYWRvcm5tZW50cyBsaWtlIHN2bmFw
b3QgYW5kIHN2cGJtdD8KPiA+ID4gVGhlIG9sZGVyIG1tdS10eXBlIGNvdWxkIHRoZW4gdHJlYXRl
ZCB0byBpbmRpY2F0ZSBhIG1tdSB3L28gYW55Cj4gPiA+IGFkb3JubWVudHMgc3BlY2lmaWVkLiAg
SSBhbSBhd2FyZSB0aGF0IHRoaXMgZ2VuZXJhdGVzIGFuIGFkZGl0aW9uYWwKPiA+ID4gcGFyc2lu
Zy1wYXRoIHRoYXQgd2lsbCBiZSBtYWludGFpbmVkLCBidXQgaXQgd2lsbCBhbGxvdyBmdXR1cmUK
PiA+ID4gcHJvcGVydGllcyB0byBiZSBncm91cGVkLgo+ID4gPgo+ID4gPiBjcHVAMCB7Cj4gPiA+
IC4uLgo+ID4gPiBtbXUgewo+ID4gPiB0eXBlID0gInJpc2N2LHN2MzkiOwo+ID4gPiBzdXBwb3J0
cy1zdnBibXQ7Cj4gPiA+IH0KPiA+ID4gLi4uCj4gPiA+IH0KPiA+Cj4gPiBJIHdhcyBhYm91dCB0
byBwcm9wb3NlIHRoZSBzYW1lIHRoaW5nLCB3ZSBjYW4gZG8gdGhpcyBub3cgd2l0aG91dAo+ID4g
YnJlYWtpbmcgYmFja3dhcmRzIGNvbXBhdGliaWxpdHksIHdlIGRvbid0IHJlYWxseSB1c2UgbW11
LXR5cGUgcHJvcGVydHkKPiA+IGF0IHRoaXMgcG9pbnQsIHdlIGFyZSBlaXRoZXIgc3YzOSBvciBu
b21tdS4KPgo+IEluZGVlZCwgdGhpcyBwcm9wZXJ0eSBpcyBvbmx5IGluZm9ybWF0aXZlIGFuZCBu
b3QgdXNlZnVsIHNpbmNlIHdlIGNhbgo+IGRpcmVjdGx5ICJhc2siIHRoZSBodyB3aGF0IGl0IHN1
cHBvcnRzIChjZiBzdjQ4IHBhdGNoc2V0KS4gQW5kIGl0Cj4gY2Fubm90IGFjdHVhbGx5IGJlIHVz
ZWQgdG8gZm9yY2UgYSBjZXJ0YWluIHN2WFggc2luY2UgcmVhZGluZyB0aGUKPiBkZXZpY2UgdHJl
ZSBoYXBwZW5zIHdheSB0b28gbGF0ZSBpbiB0aGUgYm9vdCBwcm9jZXNzIChJIGhhdmUgdGhpcwo+
IGlzc3VlIHdpdGggbXkgc3Y0OCBwYXRjaHNldCB3aGVyZSBJIHVzZWQgdG8gcmVhZCB0aGUgZGV2
aWNlIHRyZWUgdG8KPiBzZXQgdGhlIHNpemUgb2YgdGhlIGFkZHJlc3Mgc3BhY2UsIGJ1dCBpdCBh
Y3R1YWxseSBicmVha3MgS0FTQU4pLgo+Cj4gSXNuJ3QgdGhlcmUgYSB3YXkgdG8ga25vdyBpZiBp
dCBzdXBwb3J0cyBzdlBCTVQgYXQgcnVudGltZT8KClVuZm9ydHVuYXRlbHksIHdlIGNhbid0IGRl
dGVjdCBTdnBtYnQgdGhyb3VnaCBDU1IgcmVhZC93cml0ZQpvciB0cmFwcy4KCkEgRFQgcHJvcGVy
dHkgc2VlbXMgdG8gYmUgdGhlIG9ubHkgd2F5IGZvciBTdnBtYnQuCgpSZWdhcmRzLApBbnVwCgo+
Cj4gQWxleAo+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
