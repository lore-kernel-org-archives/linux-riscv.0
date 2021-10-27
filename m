Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F140C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:35:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD346023B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CD346023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0+FB9dP9FcWeIOCfknPzK/11+dyuwY5ZiIO0LYnuHM=; b=sqz0lq1b5sejNP
	gI5mX/KUgrP9pFvSeEhdI77B4lGXuRaxaYiGD/n9/uoaJ5G5/N4EL9lqL099hnpq4DqtNEjx0VyhL
	IhRbGfshPuXly0zDP2loRbUnsI2Dos6Opoo3WdYSGtfFkYdgQQDGjyRRBPUQuP7Zs1YSaqTijVzES
	kw87FY/WOnvuY6OKguWFgO1nMpYXMsQ6HcUGAiwcjlIN2Iy/0nhXkI281425RyfKJQsn5e8JgBs+3
	j1rbN/K7qOh4qyFgZB70MuW2TFuA1OpLLnHPXh/LmAEtKA0sc0rsnDOPC++xBfP2yJtF5EKPqux/A
	gH94V5GE9FaiZ++MOTXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfsRa-006V7a-VA; Wed, 27 Oct 2021 23:34:54 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfsRA-006V0u-Jc
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 23:34:30 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id v138so5016543ybb.8
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 16:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oz3la9qDxujtDqexpAw2x+f60dyey4m7gnEBfsN5KGo=;
 b=TVQOUdZVVzlisn93Q+LsaGBEr2IstMf9+JFWH6dH1goJYJF/2/8r9e7/AIhv3vv5e5
 rGoIpe8uW+u4FYE3T5uF7fe8ndRXSSxdwV/LyJsSPCTGfgGiZI8rkDjp9eIiU4nwYfD9
 wzS/5hWEjqyhdnRQ8lELiKBSM/ZbP+HE/vWM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oz3la9qDxujtDqexpAw2x+f60dyey4m7gnEBfsN5KGo=;
 b=vL4mxa6H0HZJyBWtvqWJm9bhi2Gzgr8O/Xt19AoSzFfDqTpmmu6kKqbA+OVKA/frqx
 K8AHIXzbIVRmKfczzzybirxuJYncritHGHqsOa8dIRAC5dOaYFz/K3M8QvmwTA8TG5Gy
 PYQatj9FaKr45vPh7gpstbG+qjkX2/y7kVTwSuyqlRspYB7rDVc2MVR8EKnzO8k2Wyxv
 0atCzgaWjtT2SxyGDTJwlSiyOeTvdFMtk+tAeKa9W8GN3N1PeFSPHSVU7o5sWxqX4qSz
 fvGMGcURhhSXthhZV3SlbRDM6LtKOgenUS/SKLg+d81TQ8g7+qTNLlUIn1nX74rybFdj
 PYNw==
X-Gm-Message-State: AOAM5323RNQ2M/qKAs91OLgl/R2MNbacXNLhE5r7IMUVoZ8Hjm5m7F25
 aQ1NY/AlrRtluJDefZmdAiRO/eyUFpLTKg8Hi3JJ
X-Google-Smtp-Source: ABdhPJwhrNSWpRUm5Dd6OwK81WlAR7RS5KdtONsXjCmoK9nBs/HUgokkoMs+qszLWig8f/mg7j6YIiURyecYTovIUio=
X-Received: by 2002:a25:324d:: with SMTP id y74mr810941yby.526.1635377666261; 
 Wed, 27 Oct 2021 16:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUPWOjJfJohxLJefHOrJBtXZ0xfHQt4=hXpUXnasiN+AQ@mail.gmail.com>
 <2328512.Zi2KH1A685@diego>
 <CAMuHMdW7NCC3siVp6avaTRffrdFr+OMXvLeGzdHZJOg+B5aGJw@mail.gmail.com>
 <1714720.9tEa3Li8Nu@diego>
In-Reply-To: <1714720.9tEa3Li8Nu@diego>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 27 Oct 2021 16:34:15 -0700
Message-ID: <CAOnJCU+MSP1QdpRRGYUpen8xZU+kn3PcSMJnZnRQw-iATs8JgQ@mail.gmail.com>
Subject: Re: Out-of-bounds access when hartid >= NR_CPUS
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, re@w6rz.net, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_163428_722033_327B210A 
X-CRM114-Status: GOOD (  30.35  )
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

T24gVHVlLCBPY3QgMjYsIDIwMjEgYXQgMjozNCBBTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIERpZW5zdGFnLCAyNi4gT2t0b2JlciAyMDIxLCAxMDo1Nzoy
NiBDRVNUIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOgo+ID4gSGkgSGVpa28sCj4gPgo+ID4g
T24gVHVlLCBPY3QgMjYsIDIwMjEgYXQgMTA6NTMgQU0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNu
dGVjaC5kZT4gd3JvdGU6Cj4gPiA+IEFtIERpZW5zdGFnLCAyNi4gT2t0b2JlciAyMDIxLCAwODo0
NDozMSBDRVNUIHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOgo+ID4gPiA+IE9uIFR1ZSwgT2N0
IDI2LCAyMDIxIGF0IDI6MzcgQU0gUm9uIEVjb25vbW9zIDxyZUB3NnJ6Lm5ldD4gd3JvdGU6Cj4g
PiA+ID4gPiBPbiAxMC8yNS8yMSA4OjU0IEFNLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4g
PiA+ID4gPiA+IFdoZW4gYm9vdGluZyBhIGtlcm5lbCB3aXRoIENPTkZJR19OUl9DUFVTPTQgb24g
TWljcm9jaGlwIFBvbGFyRmlyZSwKPiA+ID4gPiA+ID4gdGhlIDR0aCBDUFUgZWl0aGVyIGZhaWxz
IHRvIGNvbWUgb25saW5lLCBvciB0aGUgc3lzdGVtIGNyYXNoZXMuCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IFRoaXMgaGFwcGVucyBiZWNhdXNlIFBvbGFyRmlyZSBoYXMgNSBDUFUgY29yZXM6IGhh
cnQgMCBpcyBhbiBlNTEsCj4gPiA+ID4gPiA+IGFuZCBoYXJ0cyAxLTQgYXJlIHU1NHMsIHdpdGgg
dGhlIGxhdHRlciBiZWNvbWluZyBDUFVzIDAtMyBpbiBMaW51eDoKPiA+ID4gPiA+ID4gICAgLSB1
bnVzZWQgY29yZSBoYXMgaGFydGlkIDAgKHNpZml2ZSxlNTEpLAo+ID4gPiA+ID4gPiAgICAtIHBy
b2Nlc3NvciAwIGhhcyBoYXJ0aWQgMSAoc2lmaXZlLHU3NC1tYyksCj4gPiA+ID4gPiA+ICAgIC0g
cHJvY2Vzc29yIDEgaGFzIGhhcnRpZCAyIChzaWZpdmUsdTc0LW1jKSwKPiA+ID4gPiA+ID4gICAg
LSBwcm9jZXNzb3IgMiBoYXMgaGFydGlkIDMgKHNpZml2ZSx1NzQtbWMpLAo+ID4gPiA+ID4gPiAg
ICAtIHByb2Nlc3NvciAzIGhhcyBoYXJ0aWQgNCAoc2lmaXZlLHU3NC1tYykuCj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IEkgYXNzdW1lIHRoZSBzYW1lIGlzc3VlIGlzIHByZXNlbnQgb24gdGhlIFNp
Rml2ZSBmdTU0MCBhbmQgZnU3NDAKPiA+ID4gPiA+ID4gU29DcywgYnV0IEkgZG9uJ3QgaGF2ZSBh
Y2Nlc3MgdG8gdGhlc2UuICBUaGUgaXNzdWUgaXMgbm90IHByZXNlbnQKPiA+ID4gPiA+ID4gb24g
U3RhckZpdmUgSkg3MTAwLCBhcyBwcm9jZXNzb3IgMCBoYXMgaGFydGlkIDEsIGFuZCBwcm9jZXNz
b3IgMSBoYXMKPiA+ID4gPiA+ID4gaGFydGlkIDAuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGFy
Y2gvcmlzY3Yva2VybmVsL2NwdV9vcHMuYyBoYXM6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAg
ICAgdm9pZCAqX19jcHVfdXBfc3RhY2tfcG9pbnRlcltOUl9DUFVTXSBfX3NlY3Rpb24oIi5kYXRh
Iik7Cj4gPiA+ID4gPiA+ICAgICAgdm9pZCAqX19jcHVfdXBfdGFza19wb2ludGVyW05SX0NQVVNd
IF9fc2VjdGlvbigiLmRhdGEiKTsKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gICAgICB2b2lkIGNw
dV91cGRhdGVfc2Vjb25kYXJ5X2Jvb3RkYXRhKHVuc2lnbmVkIGludCBjcHVpZCwKPiA+ID4gPiA+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0YXNrX3N0
cnVjdCAqdGlkbGUpCj4gPiA+ID4gPiA+ICAgICAgewo+ID4gPiA+ID4gPiAgICAgICAgICAgICAg
aW50IGhhcnRpZCA9IGNwdWlkX3RvX2hhcnRpZF9tYXAoY3B1aWQpOwo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiAgICAgICAgICAgICAgLyogTWFrZSBzdXJlIHRpZGxlIGlzIHVwZGF0ZWQgKi8KPiA+
ID4gPiA+ID4gICAgICAgICAgICAgIHNtcF9tYigpOwo+ID4gPiA+ID4gPiAgICAgICAgICAgICAg
V1JJVEVfT05DRShfX2NwdV91cF9zdGFja19wb2ludGVyW2hhcnRpZF0sCj4gPiA+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHRhc2tfc3RhY2tfcGFnZSh0aWRsZSkgKyBUSFJFQURfU0la
RSk7Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgICBXUklURV9PTkNFKF9fY3B1X3VwX3Rhc2tfcG9p
bnRlcltoYXJ0aWRdLCB0aWRsZSk7Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoZSBhYm92ZSB0
d28gd3JpdGVzIGNhdXNlIG91dC1vZi1ib3VuZCBhY2Nlc3NlcyBiZXlvbmQKPiA+ID4gPiA+ID4g
X19jcHVfdXBfe3N0YWNrLHBvaW50ZXJ9X3BvaW50ZXJbXSBpZiBoYXJ0aWQgPj0gQ09ORklHX05S
X0NQVVMuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgICAgfQo+ID4KPiA+ID4gPiBodHRwczov
L3Jpc2N2Lm9yZy93cC1jb250ZW50L3VwbG9hZHMvMjAxNy8wNS9yaXNjdi1wcml2aWxlZ2VkLXYx
LjEwLnBkZgo+ID4gPiA+IHNheXM6Cj4gPiA+ID4KPiA+ID4gPiAgICAgSGFydCBJRHMgbWlnaHQg
bm90IG5lY2Vzc2FyaWx5IGJlIG51bWJlcmVkIGNvbnRpZ3VvdXNseSBpbiBhCj4gPiA+ID4gICAg
IG11bHRpcHJvY2Vzc29yIHN5c3RlbSwgYnV0IGF0IGxlYXN0IG9uZSBoYXJ0IG11c3QgaGF2ZSBh
IGhhcnQKPiA+ID4gPiAgICAgSUQgb2YgemVyby4KPiA+ID4gPgo+ID4gPiA+IFdoaWNoIG1lYW5z
IGluZGV4aW5nIGFycmF5cyBieSBoYXJ0IElEIGlzIGEgbm8tZ28/Cj4gPiA+Cj4gPiA+IElzbid0
IHRoYXQgYWxzbyBzaW1pbGFyIG9uIGFhcmNoNjQ/Cj4gPiA+Cj4gPiA+IE9uIGEgcmszMzk5IHlv
dSBnZXQgMC0zIGFuZCAxMDAtMTAxIGFuZCB3aXRoIHRoZSBwYXJhZ3JhcGggYWJvdmUKPiA+ID4g
c29tZXRoaW5nIGxpa2UgdGhpcyBjb3VsZCB2ZXJ5IHdlbGwgZXhpc3Qgb24gc29tZSByaXNjdiBj
cHUgdG9vIEkgZ3Vlc3MuCj4gPgo+ID4gWWVzLCBpdCBsb29rcyBsaWtlIGhhcnQgSURzIGFyZSBz
aW1pbGFyIHRvIE1QSURScyBvbiBBUk0uCj4KPiBhbmQgdGhleSBoYXZlIHRoZSBzZXRfY3B1X2xv
Z2ljYWxfbWFwIGNvbnN0cnVjdCB0byBtYXAgaHdpZHMKPiB0byBhIGNvbnRpbnVvdXMgbGlzdCBv
ZiBjcHUtaWRzLgo+Cj4gU28gd2l0aCBoYXJ0aWRzIG5vdCBiZWluZyBuZWNlc3NhcmlseSBjb250
aW51b3VzIHRoaXMgbG9va3MgbGlrZQo+IHJpc2N2IHdvdWxkIG5lZWQgYSBzaW1pbGFyIG1lY2hh
bmlzbS4KPgoKUklTQy1WIGFscmVhZHkgaGFzIGEgc2ltaWxhciBtZWNoYW5pc20gY3B1aWRfdG9f
aGFydGlkX21hcC4gTG9naWNhbApjcHUgaWRzIGFyZSBjb250aW51b3VzCndoaWxlIGhhcnRpZCBj
YW4gYmUgc3BhcnNlLgoKVGhlIGlzc3VlIGhlcmUgaXMgdGhhdCBfX2NwdV91cF9zdGFjay90YXNr
X3BvaW50ZXIgYXJlIHBlciBoYXJ0IGJ1dAphcnJheSBzaXplIGRlcGVuZHMgb24gdGhlIE5SX0NQ
VXMKd2hpY2ggcmVwcmVzZW50cyB0aGUgbG9naWNhbCBDUFUuCgpUaGF0J3Mgd2h5LCBoYXZpbmcg
YSBtYXhpbXVtIG51bWJlciBvZiBoYXJ0aWRzIGRlZmluZWQgaW4gY29uZmlnIHdpbGwKYmUgaGVs
cGZ1bC4KCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKCgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
