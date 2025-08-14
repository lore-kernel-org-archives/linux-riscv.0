Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AB9C87FCF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 03:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDyAbjuRFyD8xZpQMWAgdkmzY3eP9oz3T97zMTbyVNU=; b=46HEHmY80f+XlH
	uTeklBzXQPqk0dukD6S+EpXP1bZNi87mkJSBY9+VFgIC8pSArNUVipmHp/Rfm4gR34S5oKwOIqY6I
	eWJB8PmxsfFQUlHUcfLGVrqkf3zF6rarzziVSX8EWynQcKoykekMaP+dqTRcrpyBgi7YEirhU60/l
	KGVHH/M31SjThAP81HnbtmlhUjz4Rk5QUWRbQOFdoDI9yK/2GmoQMhPpNdP4YylMrHto17KhC4tUD
	Wpp+YxVyw/6CeETQLwBmhxX0fnEnaDObesUXzb3MgY40PoVeh6jFkR+QUTaSS8JYyrr3G9RJhRNrm
	WsnMBh11c4ZkKDr143qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umOKi-0000000FdI2-1F1c;
	Thu, 14 Aug 2025 03:08:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umOKg-0000000FdHc-0Aye
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 03:08:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17A8B45CAB
	for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 03:08:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC33BC4CEF7
	for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 03:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755140929;
	bh=XMoDAuCN1ioFag0z3tig59rfJ/M/O4cipfIwE477rSU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o8IIJGvTiYTrLUfAiII30d6SgzYwkSVpXwPMgFtHgHlwGrmo0bAesHhiKMAaOYZfq
	 Gut42r0slDm/dLdTKSN9HZrepND3kAlZnWM9qr9sq0BfZdUNvnw6DEWnb1rwQMwAdn
	 W1ZzHO/54PkunKuxskcEb7NnZJk5TJIbYkC1nAFYLrVPQGHs2RK/lXhqCGFLhxRDBH
	 oic6jrAr3LDRtK4uaEGcknahxIQ8IgygFTrxfyENk2qsIumarXgMfHaIsJxxGN1E7s
	 +PYiUaeT1S/8VhE/I4bbq68YXfVpa1nTw8MGLz2VXUhIvc1ay14vcgAMPr5ev0pEHj
	 Nx1aEOresxypQ==
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9e7437908so365365f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 20:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW1mpWYgMPpfa6U/ndnsjsIVcXgV4I4fIF/e+kNbG+ApCL3xm0F/vi/vn7U+ZpC4EUsfJzZfAh/YVmfUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzakh6jqm2MxaHGKWQmCG/aaNk1fRvVHurewBT6HGqfifWzj44U
	iIU0XGxO7qKWNIt28fmfF/+e6azAvzEr7rSWfmBZycqvYcrh7r5Fa8NGspqw9icorSb5NwzRndF
	K/C8MZV8TCWb9bI3OPQMYh4Z2mx9nDh8=
X-Google-Smtp-Source: AGHT+IHGd7cgmKnfjDug7VCZOddgtHMo0WTzcqAwgWgOWT8QpHL13mPQ+EjzzmkPDFoDHnBeDEdISH57LxmKuzEzqio=
X-Received: by 2002:a05:6000:2505:b0:3b7:6828:5f71 with SMTP id
 ffacd0b85a97d-3b9edf1ad51mr1227756f8f.9.1755140927522; Wed, 13 Aug 2025
 20:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250813171136.2213309-1-uwu@icenowy.me> <20250813171136.2213309-3-uwu@icenowy.me>
In-Reply-To: <20250813171136.2213309-3-uwu@icenowy.me>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 14 Aug 2025 11:08:35 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT-ryXrM87BwvK_wp9F_ZEsqUHKJdkxKbtJmiq_07g2rA@mail.gmail.com>
X-Gm-Features: Ac12FXzVcxaStMtfbYxgXX23VvxyuR7WndlfjsAegHOeemSEsiMSjGU5Ja913-I
Message-ID: <CAJF2gTT-ryXrM87BwvK_wp9F_ZEsqUHKJdkxKbtJmiq_07g2rA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: thead: th1520-ap: fix parent of padctrl0 clock
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_200850_122261_0850083E 
X-CRM114-Status: GOOD (  14.82  )
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

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMToxMuKAr0FNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKPgo+IFRoZSBwYWRjdHJsMCBjbG9jayBzZWVtcyB0byBiZSBhIGNoaWxk
IG9mIHRoZSBwZXJpc3lzX2FwYjRfaGNsayBjbG9jaywKPiBnYXRpbmcgdGhlIGxhdGVyIG1ha2Vz
IHBhZGN0cmwwIHJlZ2lzdGVycyBzdHVjayB0b28uCj4KPiBGaXggdGhpcyByZWxhdGlvbnNoaXAu
ClNob3VsZCBpdCBhZGQgYSAiRml4ZXM6IiB0YWc/CgpPdGhlcnMsIExHVE0hCgpSZXZpZXdlZC1i
eTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogSWNlbm93
eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gLS0tCj4gIGRyaXZlcnMvY2xrL3RoZWFkL2Nsay10
aDE1MjAtYXAuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1
MjAtYXAuYyBiL2RyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAtYXAuYwo+IGluZGV4IGQwOGU3
ZmIzODdlNTAuLmY2ZjNkNjNkNTMzNTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvdGhlYWQv
Y2xrLXRoMTUyMC1hcC5jCj4gKysrIGIvZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5j
Cj4gQEAgLTg4OCwxMyArODg4LDE2IEBAIHN0YXRpYyBDQ1VfR0FURShDTEtfUEVSSVNZU19BUEIz
X0hDTEssIHBlcmlzeXNfYXBiM19oY2xrLCAicGVyaXN5cy1hcGIzLWhjbGsiLCBwCj4gICAgICAg
ICAgICAgICAgIDB4MTUwLCAxMSwgQ0xLX0lTX0NSSVRJQ0FMKTsKPiAgc3RhdGljIENDVV9HQVRF
KENMS19QRVJJU1lTX0FQQjRfSENMSywgcGVyaXN5c19hcGI0X2hjbGssICJwZXJpc3lzLWFwYjQt
aGNsayIsIHBlcmlzeXNfYWhiX2hjbGtfcGQsCj4gICAgICAgICAgICAgICAgIDB4MTUwLCAxMiwg
MCk7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIHBlcmlzeXNfYXBiNF9o
Y2xrX3BkW10gPSB7Cj4gKyAgICAgICB7IC5odyA9ICZwZXJpc3lzX2FwYjRfaGNsay5nYXRlLmh3
IH0sCj4gK307Cj4gIHN0YXRpYyBDQ1VfR0FURShDTEtfTlBVX0FYSSwgbnB1X2F4aV9jbGssICJu
cHUtYXhpIiwgYXhpX2FjbGtfcGQsIDB4MWM4LCA1LCBDTEtfSVNfQ1JJVElDQUwpOwo+ICBzdGF0
aWMgQ0NVX0dBVEUoQ0xLX0NQVTJWUCwgY3B1MnZwX2NsaywgImNwdTJ2cCIsIGF4aV9hY2xrX3Bk
LCAweDFlMCwgMTMsIENMS19JU19DUklUSUNBTCk7Cj4gIHN0YXRpYyBDQ1VfR0FURShDTEtfRU1N
Q19TRElPLCBlbW1jX3NkaW9fY2xrLCAiZW1tYy1zZGlvIiwgZW1tY19zZGlvX3JlZl9jbGtfcGQs
IDB4MjA0LCAzMCwgMCk7Cj4gIHN0YXRpYyBDQ1VfR0FURShDTEtfR01BQzEsIGdtYWMxX2Nsaywg
ImdtYWMxIiwgZ21hY19wbGxfY2xrX3BkLCAweDIwNCwgMjYsIDApOwo+ICBzdGF0aWMgQ0NVX0dB
VEUoQ0xLX1BBRENUUkwxLCBwYWRjdHJsMV9jbGssICJwYWRjdHJsMSIsIHBlcmlzeXNfYXBiX3Bj
bGtfcGQsIDB4MjA0LCAyNCwgMCk7Cj4gIHN0YXRpYyBDQ1VfR0FURShDTEtfRFNNQVJULCBkc21h
cnRfY2xrLCAiZHNtYXJ0IiwgcGVyaXN5c19hcGJfcGNsa19wZCwgMHgyMDQsIDIzLCAwKTsKPiAt
c3RhdGljIENDVV9HQVRFKENMS19QQURDVFJMMCwgcGFkY3RybDBfY2xrLCAicGFkY3RybDAiLCBw
ZXJpc3lzX2FwYl9wY2xrX3BkLCAweDIwNCwgMjIsIDApOwo+ICtzdGF0aWMgQ0NVX0dBVEUoQ0xL
X1BBRENUUkwwLCBwYWRjdHJsMF9jbGssICJwYWRjdHJsMCIsIHBlcmlzeXNfYXBiNF9oY2xrX3Bk
LCAweDIwNCwgMjIsIDApOwo+ICBzdGF0aWMgQ0NVX0dBVEUoQ0xLX0dNQUNfQVhJLCBnbWFjX2F4
aV9jbGssICJnbWFjLWF4aSIsIGF4aTRfY3B1c3lzMl9hY2xrX3BkLCAweDIwNCwgMjEsIDApOwo+
ICBzdGF0aWMgQ0NVX0dBVEUoQ0xLX0dQSU8zLCBncGlvM19jbGssICJncGlvMy1jbGsiLCBwZXJp
MnN5c19hcGJfcGNsa19wZCwgMHgyMDQsIDIwLCAwKTsKPiAgc3RhdGljIENDVV9HQVRFKENMS19H
TUFDMCwgZ21hYzBfY2xrLCAiZ21hYzAiLCBnbWFjX3BsbF9jbGtfcGQsIDB4MjA0LCAxOSwgMCk7
Cj4gLS0KPiAyLjUwLjEKPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
