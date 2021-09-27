Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55ECBC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 23:06:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C961060F4B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 23:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C961060F4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMdj6AI/sPiRUOpogXlqU4k2IDI8h08CgHwFlP+/tSQ=; b=ApoQFyvP932j58
	gOp62Ia00so7Ke8M/5ymXadgZcTIzZywwIOeiu689qosJEVWfbQKsYl3+PksazgjmUQ8WHA1MorGI
	DT8K0wCyv9jAoUsVRdEpaK3tRhwX4Yvnior4U6zCwxa4DTgVGoCerJ49xVRk4zpukwHuaxmwfnjo+
	of/EKSOlNElbPGJPP6HyeNJ64dkJ8cHpSusnh52ceD3eENBXyIH918z3CyKSQHH13LYiC4lDkCLfW
	tLiieN3R82cIiXz517h2t7zBaHGm7Ebe6bVopJjxkS7+Ig+Tok33M1gVdhIqADKBgMjbwA7xdEklm
	Q4LkHUIMrbz0BJhQMbHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUzhC-004qTf-0x; Mon, 27 Sep 2021 23:06:02 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUzh9-004qT5-JB
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 23:06:01 +0000
Received: by mail-yb1-xb33.google.com with SMTP id v10so27593800ybq.7
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 16:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=te3ufbbhdLYzLpKReFSUnhdYPCC2UOLB8sm0ImQvwSg=;
 b=tNVc7cvyLru14b2J2DjRw5M7+f0Vzr9bnjoC8qr9Yj/j57ncp7ve6/9lPPOqy7Go6u
 hJd0SUmECBMfaKUTi51ak+Ha0jxqIFJx59rUJpFe0QEpvJKAwAnc5gbjxmcXfS93crs0
 jg0ho6LXbTNK6AaR4dp3FkJfB5XtEKDN7ObrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=te3ufbbhdLYzLpKReFSUnhdYPCC2UOLB8sm0ImQvwSg=;
 b=v85EAIlPabhJ8q7m3y/2xId4ooFZ5tLBH6VczkdqnGu2fl4KuiVU0blhtQ+6QQw/9S
 mWCH+0RmJTzGQ0DlnAVY3vCVTi25gO7dqrc8/Uup8vB5+dH8VouTy4laaJCukho1Pw/E
 3jqAY6Wv1AfebcyNAUyVLy0YqS2TlgsjthnYHsHyCtSc9jxt/Gc922SemngQqOxtOyXj
 zTD0jPwBWzBkTPbRzal9Ra54cWGRLSc2tXylJE2g1WpFXkuEguwVLCXoDOwrCm9xTfR+
 ThPkiY8BvBZ4zkOgvtOOWf7/naqiLYOvxA6k00FCeIWTifnNE9eZWFEKFlBmENby1+ym
 6W2w==
X-Gm-Message-State: AOAM532DM3YUo8l2SvJGiQoDkmMQK1eqsv2eZ+2/IEVU7CzxDerT6/ev
 J/S8TnRhBzMlsXZ6htgcrcWvXllbTHEdNQw2KyEl
X-Google-Smtp-Source: ABdhPJznvZBPCpgBv8Jgcg/OQuqyDWj+Q8Gey0hZLrv3MRRacKbPCtHWdja625jSae5btgDes2J7CcmXcNdir+qyoQM=
X-Received: by 2002:a25:7ec4:: with SMTP id z187mr2751056ybc.35.1632783958580; 
 Mon, 27 Sep 2021 16:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
 <CA+Qh7T=kud8AM-6JjuWNwJY0r_gkmnP6SmzVXqeE2VYxViLUoQ@mail.gmail.com>
In-Reply-To: <CA+Qh7T=kud8AM-6JjuWNwJY0r_gkmnP6SmzVXqeE2VYxViLUoQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 27 Sep 2021 16:05:47 -0700
Message-ID: <CAOnJCUJp9UatyReA8-Jq=WGY_QgV4CbL4Qs2F9rXJzOHsXeW5Q@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
To: Greg Favor <gfavor@ventanamicro.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>, Guo Ren <guoren@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, 
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_160559_732408_19F967F9 
X-CRM114-Status: GOOD (  22.95  )
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

T24gTW9uLCBTZXAgMjcsIDIwMjEgYXQgMTo1MyBQTSBHcmVnIEZhdm9yIDxnZmF2b3JAdmVudGFu
YW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBXaXRoIHRoZSBiaWcgY2F2ZWF0IHRoYXQgSSBoYXZlbid0
IGJlZW4gaW4gdGhlIG1pZGRsZSBvZiB0aGlzIGRpc2N1c3Npb24sIGl0IHNlZW1zIGxpa2UgQWxs
d2lubmVyIEQxJ3MgY2hhbmdlcyByZXByZXNlbnQgYSBjdXN0b20gKGFuZCBub25jb25mb3JtaW5n
KSBleHRlbnNpb24uCgpBcyBwZXIgdGhlIHYxLjEyIHByaXZpbGVnZSBzcGVjaWZpY2F0aW9uLCBi
aXQgNjMgaXMgcmVzZXJ2ZWQgZm9yClN2bmFwb3QgZXh0ZW5zaW9uIHdoaWxlIGJpdCA2MOKAkzU0
IGFyZSByZXNlcnZlZCBmb3IgZnV0dXJlIHN0YW5kYXJkCnVzZS4KRDEncyBpbXBsZW1lbnRhdGlv
biB1c2VzIGJvdGggNjAgYW5kIDYzIGJpdCBmb3IgdGhlaXIgY3VzdG9tICJQQk1UIgpleHRlbnNp
b24gaW4gYWRkaXRpb24gdG8gYml0IDYxICYgNjIgWzFdLgoKPiBJc24ndCB0aGlzIGp1c3QgYSBt
YXR0ZXIgb2YgdGhlIHBhdGNoIG5lZWRpbmcgdG8gYmUgdHJlYXRlZCBhcyBmb3IgYSBSSVNDLVYg
Y3VzdG9tIGV4dGVuc2lvbiBwZXIgdGhlIHJlY2VudGx5IGNsYXJpZmllZCBwb2xpY3kgZm9yIGhh
bmRsaW5nIHVwc3RyZWFtaW5nL2V0Yy4gb2YgY3VzdG9tIGV4dGVuc2lvbnM/ICAoUGhpbGlwcCBj
YW4gPiBzcGVhayB0byB0aGlzIGNsYXJpZmllZCBwb2xpY3kuKSAgT3Igd2hhdCBhbSBJIG1pc3Np
bmc/CgpMaW51eCBrZXJuZWwgdXBzdHJlYW0gcG9saWN5IGlzIHlldCB0byBhZG9wdCB0aGF0IGNs
YXJpZmljYXRpb24gYXMgaXQKd2FzIHJlY2VudGx5IGRpc2N1c3NlZCBhdCBSVkkgbWVldGluZ3Mu
IElzIHRoZXJlIGEgd3JpdHRlbiBkZWZpbml0aW9uCm9mIG5vbi1jb25mb3JtaW5nL2N1c3RvbS9p
bmNvbXBhdGlibGUgPwpNb3Jlb3ZlciwgYXMgcGVyIHRoZSBwbGF0Zm9ybSBzcGVjaWZpY2F0aW9u
WzJdLAoKQSBub24tY29uZm9ybWluZyBleHRlbnNpb24gdGhhdCBjb25mbGljdHMgd2l0aCBhIHN1
cHBvcnRlZCBzdGFuZGFyZApleHRlbnNpb25zIG11c3Qgc2F0aXNmeSBhdCBsZWFzdCBvbmUgb2Yg
dGhlIGZvbGxvd2luZzoKICAtLS0gSXQgbXVzdCBiZSBkaXNhYmxlZCBieSBkZWZhdWx0LgogIC0t
LSBUaGUgc3VwcG9ydGVkIHN0YW5kYXJkIGV4dGVuc2lvbiBtdXN0IGJlIGRlY2xhcmVkIGFzIHVu
c3VwcG9ydGVkCmluIGFsbCBmZWF0dXJlIGRpc2NvdmVyeSBzdHJ1Y3R1cmVzIHVzZWQgYnkgc29m
dHdhcmUuCiAgICAgIFRoaXMgb3B0aW9uIGlzIGFsbG93ZWQgb25seSBpZiB0aGUgc3RhbmRhcmQg
ZXh0ZW5zaW9uIGlzIG5vdCByZXF1aXJlZC4KCkluIHRoaXMgY2FzZSwgdGhlIGN1c3RvbSBub24t
Y29uZm9ybWluZyBpbXBsZW1lbnRhdGlvbiBjYW4gbm90IGJlCmRpc2FibGVkIG9yIG1hcmtlZCB1
bnN1cHBvcnRlZCBhcyBpdCBpcyBjcml0aWNhbCBmb3IgYWxsIHRoZSBuZWNlc3NhcnkKSS9PIGRl
dmljZXMgKHVzYiwgbW1jLCBldGhlcm5ldCkuCldpdGhvdXQgdGhpcyBjdXN0b20gaW1wbGVtZW50
YXRpb24gc3VwcG9ydCBpbiB1cHN0cmVhbSwgd2UgY2FuIG5vdApyZWFsbHkgdXNlIHRoZSBtYWlu
bGluZSBrZXJuZWwgZm9yIEFsbHdpbm5lciBEMS4KClsxXSBodHRwczovL2xpbnV4cGx1bWJlcnNj
b25mLm9yZy9ldmVudC8xMS9jb250cmlidXRpb25zLzExMDAvYXR0YWNobWVudHMvODQxLzE2MDcv
V2hhdCVFMiU4MCU5OXMlMjB0aGUlMjBwcm9ibGVtJTIwd2l0aCUyMEQxJTIwTGludXglMjB1cHN0
cmVhbS0ucGRmClsyXSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtcGxhdGZvcm0tc3Bl
Y3MvYmxvYi9tYWluL3Jpc2N2LXBsYXRmb3JtLXNwZWMuYWRvYyMyMTEyLWdlbmVyYWwKCj4KPiBH
cmVnCj4KPiBPbiBNb24sIFNlcCAyNywgMjAyMSBhdCAxOjE0IFBNIEF0aXNoIFBhdHJhIDxhdGlz
aHBAYXRpc2hwYXRyYS5vcmc+IHdyb3RlOgo+Pgo+PiA+IEBQYWxtZXIgRGFiYmVsdCBAR3VvIFJl
bgo+PiA+Cj4+ID4gQ2FuIHdlIGZpcnN0IGRlY2lkZSB3aGF0IHRvIGRvIHdpdGggRDEncyB1cHN0
cmVhbWluZyBwbGFuID8gSSBoYWQgYSBzbGlkZVsxXSB0byBkaXNjdXNzIHRoYXQgZHVyaW5nIFJJ
U0MtViBCb0YuCj4+ID4gQnV0IHdlIHJhbiBvdXQgb2YgdGltZS4gTGV0J3MgY29udGludWUgdGhl
IGRpc2N1c3Npb24gaGVyZS4KPj4gPgo+PiA+IFdlIGFsbCBhZ3JlZSB0aGF0IEFsbHdpbm5lciBE
MSBoYXMgaW5jb21wYXRpYmxlIGNoYW5nZXMgd2l0aCBwcml2aWxlZ2Ugc3BlY2lmaWNhdGlvbiBi
ZWNhdXNlIGl0IHVzZXMgdHdvIHJlc2VydmVkIGJpdHMgZXZlbiBhZnRlciBTdnBibXQgaXMgbWVy
Z2VkLgo+PiA+IExldCdzIG5vdCBhcmd1ZSBvbiB0aGUgcmVhc29uaW5nIGJlaGluZCB0aGlzIGNo
YW5nZS4gVGhlIHNpbGljb24gaXMgYWxyZWFkeSBvdXQgYW5kIHRoZSBzcGVjaWZpY2F0aW9uIGp1
c3QgZ290IGZyb3plbi4KPj4gPiBVbmZvcnR1bmF0ZWx5LCB3ZSBkb24ndCBoYXZlIGEgdGltZSBz
dG9uZSB0byBjaGFuZ2UgdGhlIHBhc3QgOykuCj4+ID4KPj4gPiBXZSBuZWVkIHRvIGRlY2lkZSB3
aGV0aGVyIHdlIHNob3VsZCBzdXBwb3J0IHRoZSB1cHN0cmVhbSBrZXJuZWwgZm9yIEQxLiBGZXcg
dGhpbmdzIHRvIGNvbnNpZGVyLgo+PiA+IOKAkyBDYW4gaXQgYmUgY29uc2lkZXJlZCBhcyBhbiBl
cnJhdGEgPwo+PiA+IOKAkyBEb2VzIGl0IHNldCBhIGJhZCBwcmVjZWRlbnQgYW5kIG9wZW4gY2Fu
IG9mIHdvcm1zIGluIGZ1dHVyZSA/Cj4+ID4g4oCTIENhbiB3ZSBqdXN0IGlnbm9yZSBEMSBnaXZl
biB0aGUgbWFzcyB2b2x1bWUgPwo+PiA+Cj4+ID4gT25lIHNvbHV0aW9uIEkgY2FuIHRoaW5rIG9m
IGlzIHRoYXQgd2UgYWxsb3cgdGhpcyBhcyBhbiBleGNlcHRpb24gdG8gdGhlIHBhdGNoIGFjY2Vw
dGFuY2UgcG9saWN5Lgo+PiA+IFdlIG5lZWQgdG8gZXhwbGljaXRseSBzcGVjaWZ5IHRoaXMgYm9h
cmQgYXMgYW4gZXhjZXB0aW9uIGJlY2F1c2UgdGhlIHBvbGljeSB3YXMgbm90IGluIHBsYWNlIGR1
cmluZyB0aGUgZGVzaWduIHBoYXNlIG9mIHRoZSBoYXJkd2FyZS4KPj4gPiBBdCBsZWFzdCwgaXQg
cHJvdGVjdHMgdXMgZnJvbSBhY2NlcHRpbmcgdGhlIGluY29tcGF0aWJsZSBjaGFuZ2VzIGluIHRo
ZSBmdXR1cmUuIEFueSBvdGhlciBpZGVhcyA/Cj4+ID4KPj4gPiBbMV0gaHR0cHM6Ly9saW51eHBs
dW1iZXJzY29uZi5vcmcvZXZlbnQvMTEvY29udHJpYnV0aW9ucy8xMTI4L2F0dGFjaG1lbnRzLzg0
Ni8xNzU3L1JJU0MtViUyMEJvZi5wZGYKCgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
