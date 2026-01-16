Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731F6C982C3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 20:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqSQUnzcTxG6kFSSApGbdU13JVY2jdAhN6xzZviiHgU=; b=zOWkV/quQC2j/N
	NcP5Q+REgnXtZSO13BkcKjYqp0qp4dXESlXGZtj+1LEja7D+wSHt6NRKT//Jp6tsF+e0sLH/9qipm
	UVQ3YZSZMtMqg33rlfZZNx8wbrUleB7bGER7umhHlcxC9PZUPGlbTlkekNG9jJ3xYf8yj5+BE/KPO
	ubmjayGV+MJCGYBrMit78QyT4iXlX7xrFGiYa3ZnOFk6XEgztpRdU6niznLaPffVo6C/S1F7SXExB
	CUZQevB0j1YqtyqOK1SJY4q9FrAhdP8uJMnSoi/tqMYpb44vppFDfYeFlgP13LRdtTjZFZRKg73Xf
	mOzBrACGB1nAOiPMUGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqUl-0000000Eotr-1CO2;
	Fri, 16 Jan 2026 20:32:35 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqUj-0000000EotW-1m6k
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 20:32:34 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-6467ac59e16so1961623d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 12:32:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768595552; cv=none;
        d=google.com; s=arc-20240605;
        b=If2tuXJBGrMilpUYMSp9qT+2QzILtMId7jD9/fkzEgQZ4xEAKQDYH2vIYs/QoDiqqZ
         wq/9GaaXtzGGwLMjVWNpP6Uy8VJ9yQZmZoClplY1eWr3w4jh2VWdlHYnYf3BB5zc4oSh
         rBZn7OLHQGgNUVZr4q/lPJxWl9Btohoy/4dhIkNvk3IfWCaCymOLgaWTKaaKkqp+P78C
         jvhi/40g7Af9CGDWdpYEg53E/G1BTpqMFoTGaxTZ58QvAQhLfEoQaojx0IzfAEhG1pvz
         PZ3lU9iiQ/HKmjbiupJ0TjV0Ws3cuE1CzrR+3+1gKJeNiJ93LPPfH8SJJGrJibn/PJVx
         VAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PpmlZ4hHWamCBSa4D0DoiFTzgcXHGWRBgeeQ73UEY7c=;
        fh=Ib0vNPQzWC0x55hWRjUEpG3j5SEPtb9OJCmyH9uF7f4=;
        b=H3tGk77g/Dbw3clVzY7fmtO4QFDBZW51VpanRw4sk6ixCmQWUqqpbK4kwg/hLTCKy3
         SWwIQTzlwOJFBc2j5r9TpKWCB+UQH1m+gv6N0x/IfFU06H/oPoCiDd+2YI8MlIzy4p/3
         lUxY5TYGuIp72KAMOWAdsI+cPVGsumCWJ4vthJaIJaJVH1PbmbsHgbJgXbYsrCCFnAHc
         SyBObJHMO/1mAlErnua528UKmRv/NONdmwYbYSwBv8yMUou11eADTWq6KKLf/OrbPdgP
         hLYCHceCF5B7N21YGbzINE/UJ3S8ce0t8Vh98iKB6Rfw95MitFBqTt9ipnon5yB7okKs
         si3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768595552; x=1769200352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpmlZ4hHWamCBSa4D0DoiFTzgcXHGWRBgeeQ73UEY7c=;
        b=doVvwsQBE9ACbm0A61Btxt75GiUcTAfhWdcY+TNlOMXut+WGUCGuHytLzSg/SZikSe
         z8NNbZsLrw8Jos3ABQTHMEuZdpE9bWetARLMmk1lxWlWtOB+PJoZUpjH5ftD0bIhiJzL
         FjdodGl9lbaKXTVdKp41QmIZF/spQezTV8nPbZzrairEuEeMUWHlA8SNzGyi+NWKPtkD
         RrdliPJMiapSxILUGp4hCEcyVar5Qx8RiIPuv0o09rq4JLzviBkWgS3YECO2RQ81c3Sy
         AIIF4I10oYMdF+Kbuba2PGFFPWF8dNdMz1Yxf1GE3GYx30onE1Gqw822xqZ7xbbAtRg7
         xQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768595552; x=1769200352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PpmlZ4hHWamCBSa4D0DoiFTzgcXHGWRBgeeQ73UEY7c=;
        b=WY1bF9yeTwygcURBw6/Cu+fT/lc6Phi5+nLHofKy+x4Xx8mADv2Q0PBbJqgi3pOM1W
         xqi1R32+OQgL9sxsMv+980k7pIJO8XIqsRQ5Jtvba2fpCSKUnuJLZtJ8ESV2Rj1RV1EC
         YdW3UME8kKhMXRQ6axRJzsMyNSBiJd+fAFEzNmLnRyZuXqfABFopJnzp2Tr6aPsxi5+b
         dvNUbqaRTd6ccereM5pyPcrk7mgemsx+oA676VVQ3kxpjbLZ8ty9uIy0h6VOqMlg2Mko
         TcZGiTSKhG1+2KPic9entemTTuXyX/WbAKkYj8B3Cw4nmtlJ+Y5+qhsNyM6W6dV52ovl
         CDmg==
X-Forwarded-Encrypted: i=1; AJvYcCW/olSNOZ/+m+V8Wvh8YECeANcVt1MydLctxicHRonomRUsXhq5HdI03MjtS/IMdK+XCIl+NP+tfFsxuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOjLKhXMqNjTrgOUAM2BF6v9P078FoJRXxMpfF40onkVWpSkuC
	tRSgYCUdzVuIUrr0/KRXkMiTAhqNdkhSSsET+Pf3FWD9MGePeJofz7sy9itdLSEDUXOAZ3GOpQQ
	6d6zm52+f/oPLu5nmctbn5jCuMD4w1jmpdpisv7FlBQ==
X-Gm-Gg: AY/fxX5eGSHywAY0q9Qb8r/Q1SD+HpC1cApiQZpSm65r4ugtExGPAebVGeJo6peya4p
	qcz7gu4T/Itw5eOb0AKDlSOkkkqoyYNpf87VvvhAEmdE4nEleEHd62qlm4VLTZkw4kBG4ulL40W
	qO5bh3ZGu3r7DNqqLxN/K9mIL27sD+FyuNOQKzUqHZa2/di2z27lIjMHU6m+WVN9bfve1hJcG3W
	8qU7QnTRR2AeRgGCDPbwH6e10DJeIAlqOi+0CsGHO203sBukf816t/1frgi3vHj3m2K7MnkZOWm
	pCpze1v7mugNVySn6+edNRb0W0dJdepd9/45LEe18FKvvrSCVQcRRKMQ2XKc
X-Received: by 2002:a05:690e:4008:b0:644:4f94:c534 with SMTP id
 956f58d0204a3-649177115d0mr2857181d50.53.1768595552016; Fri, 16 Jan 2026
 12:32:32 -0800 (PST)
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
 <aWmc73irBAM8DZwF@redhat.com> <20260116-frisky-heavenly-pig-953fa4@quoll>
In-Reply-To: <20260116-frisky-heavenly-pig-953fa4@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 14:32:21 -0600
X-Gm-Features: AZwV_QjleAtHG0gb6HDBCsnDqxotEfpJ-YdV_J7Ve07OakGedKmM_eqvYI7Qzqg
Message-ID: <CAEev2e_4RfHChkyvj=X8XFXC8-Tk_=SLJsMCR1M+v6sC+urxsQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_123233_469958_13E091E5 
X-CRM114-Status: GOOD (  12.17  )
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

SGVsbG8gQnJpYW4gYW5kIEtyenlzenRvZiwKCk9uIEZyaSwgSmFuIDE2LCAyMDI2IGF0IDM6MDDi
gK9BTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24g
VGh1LCBKYW4gMTUsIDIwMjYgYXQgMDk6MDU6MzVQTSAtMDUwMCwgQnJpYW4gTWFzbmV5IHdyb3Rl
Ogo+ID4KPiA+IEFyZSB0aGVzZSBhYnN0cmFjdGlvbnMgcmVhbGx5IG5lZWRlZD8gV2h5IG5vdCBq
dXN0IGNhbGwgc3Bpbl9sb2NrL3VubG9jawo+ID4gZGlyZWN0bHk/Cj4KPiBUaGV5IGFyZSBhY3R1
YWxseSBoYXJtZnVsIC0gbWFrZSBjb2RlIGxlc3MgcmVhZGFibGUgYW5kIGludHJvZHVjZSB2ZXJ5
Cj4gcG9vciAobG9zZSkgQVBJIGFjY2VwdGluZyB3aGF0ZXZlciBwb2ludGVyLi4uIFRoaXMgaXMg
ZXhhY3RseSBjb2RlIHdoaWNoCj4gc2hvdWxkIG5vdGJlIGhlcmUuCgpTb21lIG9mIHRoZSBjbG9j
a3MgdXNlIGEgcmVnbWFwIGZvciByZWdpc3RlciBhY2Nlc3Nlcywgd2hpbGUgdGhlCm90aGVycyB1
c2UgdGhlIGRldm1fY2xrX2h3X3JlZ2lzdGVyX3h4eCBmdW5jdGlvbnMgd2hpY2ggcmVxdWlyZSBh
CnBvaW50ZXIgdG8gdGhlIGNvbnRyb2wgcmVnaXN0ZXIgYW5kIGEgbG9jay4gTXkgYWJvdmUgaW1w
bGVtZW50YXRpb24Kc2V0cyB0aGUgcmVnbWFwJ3MgbG9jayBhbmQgZW5zdXJlcyB0aGF0IHRoZSBz
YW1lIGxvY2sgaXMgdXNlZCBhY3Jvc3MKYm90aCB0eXBlcyBvZiBjbG9ja3MuCgpJIHRyaWVkIHNl
dHRpbmcgdGhlIHJlZ21hcF9sb2NrL3VubG9jayBmdW5jdGlvbnMgdG8Kc3Bpbl9sb2NrL3NwaW5f
dW5sb2NrIGxpa2UgeW91IHN1Z2dlc3RlZCBCcmlhbiwgYnV0IHRoYXQgdGhyb3dzIGEKY29tcGls
ZSB0aW1lIGVycm9yCgplcnJvcjogaW5pdGlhbGl6YXRpb24gb2YgJ3ZvaWQgKCopKHZvaWQgKikn
IGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIKdHlwZSAndm9pZCAoKikoc3BpbmxvY2tfdCAqKScg
e2FrYSAndm9pZCAoKikoc3RydWN0IHNwaW5sb2NrICopJ30KWy1XaW5jb21wYXRpYmxlLXBvaW50
ZXItdHlwZXNdCgpUaGlzIHBhdHRlcm4gaXMgdXNlZCBieSBvdGhlciBkcml2ZXJzIHdoZW4gdGhl
eSB3YW50IHRvIG92ZXJyaWRlIHRoZQpyZWdtYXAncyBsb2NrIFsxXSBbMl0gWzNdLiBTaG91bGQg
SSBiZSBkb2luZyB0aGlzIGluIGEgZGlmZmVyZW50Cm1hbm5lcj8gUGxlYXNlIGxldCBtZSBrbm93
LgoKWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE4LjUvc291cmNlL2Ry
aXZlcnMvc29jL3N1bnhpL3N1bnhpX3NyYW0uYyNMMzM4ClsyXSBodHRwczovL2VsaXhpci5ib290
bGluLmNvbS9saW51eC92Ni4xOC41L3NvdXJjZS9kcml2ZXJzL21mZC9hdGMyNjB4LWNvcmUuYyNM
NDcKWzNdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE4LjUvc291cmNlL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L21pY3JvY2hpcC9lbmN4MjRqNjAwLXJlZ21hcC5jI0w0NgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
