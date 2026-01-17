Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2580C9831C
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Y1txf1vPWRUs3oOETAdqyLIgA1ikkskpFOfjtdPu7Q=; b=lTVh+7gwy6Owv8
	+Ld3v00R2R1HQQ4hejRh/dO09h61EXpJPcBg4lJjzcPi54iltqUJT7+1BA/x87UsLnhBh4qRO309r
	WU1mIIxwLqhCu7TrTVLLy1ofMLNPWUD8+v6sDa6tK3+sV4s/rWz0dlrSCdXbSrgKb3I+vY9BMnUND
	SLsKcce7eyMMMdeFJZ4sVUG7vGh6Gg1ooQ5lVJwP8UbNN729CVkX3n6iyQJaURric72Au7MC7HUKh
	72tlwDjf3RLEHt07kY88vmJTsjMRYsWEiYs6hlowNli6KO2Zi4MrykuxWTaDQskGYxtvvfOrAB5Kl
	UHbpfh6dyPGOdRQvhvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh3tP-0000000FSWl-2urP;
	Sat, 17 Jan 2026 10:50:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh3tN-0000000FSW2-2NlE
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 10:50:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3082040C13;
	Sat, 17 Jan 2026 10:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1372AC4CEF7;
	Sat, 17 Jan 2026 10:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768647053;
	bh=LMrV5uJq4E3Sp1sfqsXqWIGgun1SVSry3nZMyxNxbR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t84eFbMHiKLSC9OTH7EQMp3vfX1v//d7gmU/3lKUuaQhFFzUEcvVARCnmH1KKbRGx
	 5502FZmdP4EVv+rDSF812iRaNpcCUWZhm2kmIqAZkCRa7RJ875L6MzXNCa+UQ48RDL
	 mYMk27sMtOArr7F2P2/dtvtaTdyLKBmy+tlxAz3qRKVaOQm0lKkSFzxyQu1lnJGqOo
	 kh+LRfJLUGzgxtDG1ANcmOiijBFb8MsLTkThp+ddj2JYUz7vmC9MVGB/2DZ7TF9fui
	 scKObzkjueLtiJ8L0ZLXuJLE6gifQz89/DOdIXPEnFjCPYMcvs8PDWZBpPZ/c7TCO6
	 ImXnbyUjl701Q==
Message-ID: <1aede324-67d7-4fd0-8d16-19e889ef650d@kernel.org>
Date: Sat, 17 Jan 2026 11:50:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] dt-bindings: soc: tenstorrent: Add atlantis resets
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au,
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com,
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-4-7356e671f28b@oss.tenstorrent.com>
 <20260116-unique-devious-elephant-e9de6d@quoll>
 <1ef5317a-93d0-4357-bfc3-ce780002734d@kernel.org>
 <CAEev2e8i_4Dud-OdghjN+1Sp7n_9yNThwgDbirkREBJHChwscw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAEev2e8i_4Dud-OdghjN+1Sp7n_9yNThwgDbirkREBJHChwscw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_025053_646279_30CF58C2 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

T24gMTYvMDEvMjAyNiAyMjoyNSwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+IEhpIEtyenlz
enRvZiwKPiAKPiBPbiBGcmksIEphbiAxNiwgMjAyNiBhdCAzOjAz4oCvQU0gS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gT24gMTYvMDEvMjAyNiAxMDow
MiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gQWgsIGJlY2F1c2UgeW91IGp1c3QgYWRk
ZWQgaXQgaW4gb3RoZXIgcGF0Y2guIFRoZW4gb2J2aW91c2x5IHRoaXMgbXVzdAo+PiBiZSBzcXVh
c2hlZC4gV2h5IHdvdWxkIHlvdSBwb3N0IGFuIGluY29tcGxldGUgcGF0Y2ggYW5kIGZpeCBpdCB1
cAo+PiBpbW1lZGlhdGVseT8KPj4KPj4gUGxlYXNlIHJlYWQgd3JpdGluZyBiaW5kaW5ncyBkb2N1
bWVudCAtIGl0IGNvdmVycyB0aGlzIGNhc2UuCj4+IFdoeSBhcmVuJ3QgeW91IHBvc3RpbmcgQ09N
UExFVEUgYmluZGluZ3Mgb24gZmlyc3QgcG9zdGluZz8gVGhpcyBpcyBub3cKPj4gQUJJIGJyZWFr
IGZvciBubyBnb29kIHJlYXNvbnMgLSB5b3Uga25ldyB5b3VyIGRldmljZSBoYXMgcmVzZXRzLgo+
IAo+IEkgd2lsbCBzcXVhc2ggZG93biB0aGUgY29tbWl0cyBzbyB0aGF0IHRoZXJlIGlzIGp1c3Qg
b25lIGNvbW1pdCB3aXRoIGJpbmRpbmdzLgoKSSBjb21wbGV0ZWx5IG1pc3Mgd2hhdCBpcyB0aGUg
Y29udGV4dCBoZXJlLiBXaGF0IGRpZCBJIHJlcGx5IHRvPyBXaXRoIDUwCnJlcGxpZXMgcGVyIGRh
eSBJIGFtIG5vdCB0cmFja2luZyB3aGF0IGlzIHdoYXQgaGVyZS4gUHJvdmlkZSByZWFzb25hYmxl
CmFtb3VudCBvZiBjb250ZXh0LgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
