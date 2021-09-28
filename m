Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82076C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 03:51:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C07A60ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 03:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C07A60ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUHeyugo1SAu7Ri0tHN+tm0Vy5lGMjNVgcx842qk98w=; b=zI6KGo0DAOX2Ds
	4ZiA7rnbDzVkjb3i6DnZv+YpSkXuKv3IfjLQBGJbzQ8RAGG0fPW3I93J8eGokYdpk2F5P8iZaHDgf
	7tiDJ08O5oSGwf6XX9gzeh3LhbCri2PflsSgsMm05llIjWXLbyHp/PrhP0s2sMvsgvqQLvTZsTayC
	sSWb+aQRI04ssUifUfLRGmaK7jaOF8lsAmEmu1+NsPeicH31zXmXqlkEMGzrF6ivFJlvFL+EmPQUq
	AUCQpnNpeENvnDZsMxjJHodCgPfc2BA9AxNcTDlWrzAQDnf3jAvYdwZkE+A/IkegI6357qfc8SbNp
	NVL+BOdhhlen81vBR+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV48Z-005TQ0-8m; Tue, 28 Sep 2021 03:50:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV48V-005TPP-VD
 for linux-riscv@lists.infradead.org; Tue, 28 Sep 2021 03:50:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id u18so55510969wrg.5
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 20:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GGTQElJtl5mpUB6QPkkm10aMhOfJ7ChPo3DKsQZG/IM=;
 b=4aWrxSP5DQIFQrbo7iVY+qyKl54ratZ5R+7yXw+fPvYcfNqzMl3s23B/z5fi6lRMtd
 vTolleMK8gGQ4xj/0he5l4aSkQ0H0ADrEYwH3H5NzAYGolhhk/aGH+rvA8+rpQ8PFpj8
 8qM//UJieTlE4u4+M8R/VftCz66yydY211gYotIjtuYPlZs20/3sAuiIFRcSk26dfUon
 KILFOsFkep1l5Traig1MFsXSR1KlCkQgHIFpyAFg2zbHKDzQdwtTju2/9Y2L/QafDH7D
 199sh+G7yNaZO1CaDeQFs6+9ZxvXWvku/Fip17hsOiRlEuBaJ7N0+j8nRMs/yFGoKhao
 dMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GGTQElJtl5mpUB6QPkkm10aMhOfJ7ChPo3DKsQZG/IM=;
 b=bU+Zcyh4Xsms5H3TSAERqjw6cxKpaaIEGjNVKAJ7MBLAo9hFxKumdbwdSMox4W2Csx
 Nhoy6v/hXAJWHGlRnLGvFIzzhQ508YebqgjY3oTEJTCUiEy2vSrByXtmR0kCMnNlYWhB
 OJAKurdUE72wSUQZeGzgQQL0+XBWVH6J0/Yo/Q6gipZeHnDWxxha/j21r/2tcySO4Lw8
 eG3605DVXR+ozsQuTWn0lkRtxz67/pLDF4OUFDRRdbAdVSyqTvHF87KokcJQgGKmb7zr
 QCpqB4qZ9E1JUF47BXmmrAc44QMRkHpOHIEeegL5WcPt0IXow+Kpa/hLblnra/XgPE7k
 IkRw==
X-Gm-Message-State: AOAM531mdvgF1XRTAAjVkCitDnRQ0SrT1iJleyPSgks/Wg9HzK1oCslT
 rW0FZxSHFepewbz15FdziFyhYTxdvFCkCH3UmrgZeA==
X-Google-Smtp-Source: ABdhPJwnzhJ7dz9dy7GqwipLDzQCfNNWTpOdzNdjAj6Zbro5+DmRqN7N0viMMGaHqBhkAtmFU5ZygFM7uTlEHTwVlUY=
X-Received: by 2002:adf:e387:: with SMTP id e7mr3941847wrm.199.1632801029905; 
 Mon, 27 Sep 2021 20:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172107.1117604-1-guoren@kernel.org>
 <CAOnJCUJWnDB+uRxDh=YSbGW4bf5RQvke03iCTYMYHPsw3cwnHQ@mail.gmail.com>
 <CAOnJCULrE595ex3gBTnu4GnPazO4mg8Tkrtbv6j8iLWe+sKJSA@mail.gmail.com>
 <0790abcfa1174e0e9b5e7b185f87ced9@mailhost.ics.forth.gr>
In-Reply-To: <0790abcfa1174e0e9b5e7b185f87ced9@mailhost.ics.forth.gr>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Sep 2021 09:20:18 +0530
Message-ID: <CAAhSdy2-y4xpM9PCrS0vgCN9ngFiBygeDOWcbgsX6Myb4XjDQg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] riscv: Add RISC-V svpbmt extension
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
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
X-CRM114-CacheID: sfid-20210927_205032_096265_DC1500F5 
X-CRM114-Status: GOOD (  25.30  )
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

T24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgNjozMiBBTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IM6jz4TOuc+CIDIwMjEtMDktMjcgMjM6MTMsIEF0aXNoIFBh
dHJhIM6tzrPPgc6xz4jOtToKPiA+PiBXZSBuZWVkIHRvIGRlY2lkZSB3aGV0aGVyIHdlIHNob3Vs
ZCBzdXBwb3J0IHRoZSB1cHN0cmVhbSBrZXJuZWwgZm9yCj4gPj4gRDEuIEZldyB0aGluZ3MgdG8g
Y29uc2lkZXIuCj4gPj4g4oCTIENhbiBpdCBiZSBjb25zaWRlcmVkIGFzIGFuIGVycmF0YSA/Cj4K
PiBJdCdzIG9uZSB0aGluZyB0byBmb2xsb3cgdGhlIHNwZWMgYW5kIGhhdmUgYW4gZXJyb3IgaW4g
dGhlCj4gaW1wbGVtZW50YXRpb24sIGFuZCBhbm90aGVyIHRvIG5vdCBmb2xsb3cgdGhlIHNwZWMu
Cj4KPiA+PiDigJMgRG9lcyBpdCBzZXQgYSBiYWQgcHJlY2VkZW50IGFuZCBvcGVuIGNhbiBvZiB3
b3JtcyBpbiBmdXR1cmUgPwo+Cj4gSU1ITyB5ZXMsIEknbSB0aGlua2luZyBvZiBLZW5kcnl0ZSAy
MTAgZGV2cyBmb3IgZXhhbXBsZSBjb21pbmcgdXAgYW5kCj4gYXNraW5nIGZvciBNTVUgc3VwcG9y
dCwgdGhleSAndmUgYWxzbyBzaGlwcGVkIG1hbnkgY2hpcHMgYWxyZWFkeS4gSSBjYW4KPiBhbHNv
IGltYWdpbmUgb3RoZXIgdmVuZG9ycyBpbiB0aGUgZnV0dXJlIGNvbWluZyB1cCB3aXRoIGltcGxl
bWVudGF0aW9ucwo+IHRoYXQgdmlvbGF0ZSB0aGUgc3BlYyBpbiB3aGljaCBjYXNlIGhhbmRsaW5n
IHRoZSBzdGFuZGFyZCBzdHVmZiB3aWxsCj4gYmVjb21lIG1lc3N5IGFuZCBjb21wbGV4LCBhbmQg
aHVydCBwZXJmb3JtYW5jZS9zZWN1cml0eS4gV2UnbGwgZW5kIHVwCj4gZmlsbGluZyB0aGUgY29k
ZSB3aXRoIGV4Y2VwdGlvbnMgYW5kIHR3ZWFrcyBhbGwgb3ZlciB0aGUgcGxhY2UuIFdlIG5lZWQK
PiB0byBiZSBzdHJpY3QgYWJvdXQgd2hhdCBpcyAicmlzY3YiIGFuZCB3aGF0J3MgImRyYWZ0IHJp
c2N2IiBvciAicmlzY3YKPiBpbnNwaXJlZCIsIGFuZCB3aGF0IHdlIGFyZSB3aWxsaW5nIHRvIHN1
cHBvcnQgdXBzdHJlYW0uIEkgY2FuIHVuZGVyc3RhbmQKPiBzdXBwb3J0aW5nIHZlbmRvciBleHRl
bnNpb25zIHVwc3RyZWFtIGJ1dCB0aGV5IG5lZWQgdG8gZml0IHdpdGhpbiB0aGUKPiBzdGFuZGFy
ZCBzcGVjLCB3ZSBjYW4ndCBoYXZlIGZvciBleGFtcGxlIGV4dGVuc2lvbnMgdGhhdCB1c2UgZW5j
b2RpbmcKPiBzcGFjZS9jc3JzL2ZpZWxkcyBldGMgcmVzZXJ2ZWQgZm9yIHN0YW5kYXJkIHVzZSwg
dGhleSBtYXkgb25seSB1c2UKPiB3aGF0J3MgcmVzZXJ2ZWQgZm9yIGN1c3RvbS92ZW5kb3IgdXNl
LiBBdCBsZWFzdCBsZXQncyBhZ3JlZSBvbiB0aGF0LgoKVG90YWxseSBhZ3JlZSB3aXRoIE5pY2sg
aGVyZS4gSXQncyBhIHNsaXBwZXJ5IHNsb3BlLgoKSW5jbHVkaW5nIEQxIFBURSBiaXRzIChvciBL
ZW5kcnl0ZSBLMjEwIE1NVSkgcGFydCBvZiB0aGUgTGludXggUklTQy1WCm1lYW5zIGZ1dHVyZSBo
YXJkd2FyZSB3aGljaCBpbnRlbnRpb25hbGx5IHZpb2xhdGVzIHNwZWNzIHdpbGwgYWxzbyBoYXZl
IHRvCmJlIG1lcmdlZCBhbmQgdGhlIFJJU0MtViBwYXRjaCBhY2NlcHRhbmNlIHBvbGljeSB3aWxs
IGhhdmUgbm8gc2lnbmlmaWNhbmNlLgoKPgo+ID4+IOKAkyBDYW4gd2UganVzdCBpZ25vcmUgRDEg
Z2l2ZW4gdGhlIG1hc3Mgdm9sdW1lID8KPiA+Pgo+Cj4gSU1ITyBubywgd2UgbmVlZCB0byBmaW5k
IGEgd2F5IHRvIHN1cHBvcnQgaXQgdXBzdHJlYW0gYnV0IEkgYmVsaWV2ZQo+IHRoZXJlIGlzIGFu
b3RoZXIgcXVlc3Rpb24gdG8gYW5zd2VyOgo+Cj4gRG8gd2UgYWxzbyBndWFyYW50ZWUgIm9uZSBp
bWFnZSB0byBydWxlIHRoZW0gYWxsIiBhcHByb2FjaCwgcmVxdWlyZWQgYnkKPiBiaW5hcnkgZGlz
dHJvcywgZm9yIGltcGxlbWVudGF0aW9ucyB0aGF0IHZpb2xhdGUgdGhlIHNwZWMgPyBBcmUgd2Ug
b2sKPiBmb3IgZXhhbXBsZSB0byBzdXBwb3J0IEFsbHdpbm5lciBEMSB1cHN0cmVhbSBidXQgcmVx
dWlyZSBhIGN1c3RvbQo+IGNvbmZpZ3VyYXRpb24vYnVpbGQgaW5zdGVhZCBvZiBzdXBwb3J0aW5n
IGl0IHdpdGggdGhlICJnZW5lcmljIiBpbWFnZSA/Cj4gSW4gb25lIGNhc2Ugd2UgbmVlZCB0byBo
YW5kbGUgdGhlIHZpb2xhdGlvbiBhdCBydW50aW1lIGFuZCBpbnRyb2R1Y2UKPiBvdmVyaGVhZCBm
b3IgZXZlcnlvbmUgKGxpa2UgbG9va2luZyB1cCBfX3Jpc2N2X3N2cGJtdCBldmVyeSB0aW1lIHdl
IHNldAo+IGEgUFRFIGluIHRoaXMgY2FzZSksIGluIHRoZSBvdGhlciBpdCdzIGFuICNpZmRlZi4K
CkF0IGxlYXN0LCB3ZSBzaG91bGQgbm90IGhhdmUgaGFyZHdhcmUgdmlvbGF0aW5nIHNwZWNzIGFz
IHBhcnQgb2YgdGhlCnVuaWZpZWQga2VybmVsIGltYWdlIGluc3RlYWQgaGF2ZSB0aGVzZSBpbnRl
bnRpb25hbCBkZXZpYXRpb25zL3Zpb2xhdGlvbnMKdW5kZXIgc2VwYXJhdGUga2NvbmZpZyB3aGlj
aCB3aWxsIG5vdCBiZSBlbmFibGVkIGJ5IGRlZmF1bHQuIFRoaXMgbWVhbnMKdmVuZG9ycyAob2Yg
c3VjaCBoYXJkd2FyZSkgYW5kIGRpc3Ryb3Mgd2lsbCBoYXZlIHRvIGV4cGxpY2l0bHkgZW5hYmxl
CnN1cHBvcnQgZm9yIHN1Y2ggdmlvbGF0aW9ucy9kZXZpYXRpb25zLgoKUmVnYXJkcywKQW51cAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
