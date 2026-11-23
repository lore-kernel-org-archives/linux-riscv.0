Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CCA606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 19:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tFO5j+v5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=hfnOA7I2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WV+ddfLj0/iD1KoAqq/GOrtsJOiYGEoqvyUMEB9AGNk=; b=tFO5j+v5nsUt9bGQE55dWx5j6Z
	7euT/qsvx5m//l3tvDLu3N+faV+WTmz0civXbMfbru/AyN9G3bcadknKzV8RJ6drdPES9OJHwxezj
	Rcms6kdDSHuHj7zYBSe0NV4Dd2eCF1mTo+egKhbKjMooV5J/awPLnJM+1GlGYIlFIcliPaPj/lHct
	1UrjhVn9i5zDcRzNnOoHdJQkNezposZn8jhkzk3O6xHWjUAj9SjOVREEYqc6ApufgPeX/IwYxp/i3
	j22SeqpErL+uhZ9LPDIVnjuXqu9ckBtVQzwXSiFxxsY2XXphVl/FBnOhgQAPduj5c3/XEO+XqiLHo
	bh1920pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZdU-00000004eNR-2STs;
	Mon, 23 Nov 2026 19:23:32 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZdR-00000004eMS-1jcs
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 19:23:31 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8b531cd9bbaso26439777b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 11:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461807; cv=none;
        d=google.com; s=arc-20260327;
        b=HRs8+vyRss8YhWnXDYU2eTGmSyKg6i8K4nPMlak00fRx1/T5SAAfDHmVrMo9BakHYq
         mRdGDNjhkGN6zFnHwxYwagogy32XyGnymO0F47WTtWLMPa/6hRLzoEd9U9Cx9pkw6i0E
         Pes9nn3xDL6l3F9KbNYmLeQ9kWlc4MK34aV5u9A/OJbHgzMx+wB3PihaWswwH16RF4Hu
         qSJXARvDlUPTiKEy1F90Q2K7yLRh2bdx0+oyByIviJwZu9V3OI5qU5FjrT7l4LLKiBEl
         m5O92qgUYI7mYgO2bzn0TDXU5/r+H4IAw+JA5QqdyFeXDnmKI1Q6N63MpLLElmqQiqCf
         WUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
        fh=YISGAqmuSldDKxE15skhyo6thF7C2XPkkSEfv6cBNVw=;
        b=QSASarlekpRQIyCF0L3WSawBbYYGn1GSXP6Ft4eojxlx8eUcnPdiIrxzPSLjahSRBw
         rPDxVxRhS2UQisjn2tsJZ6JRL6S6rLv1RVsC1Q58M9pgkHbLPBSPK3Y0NEU9aCb4GVSk
         ALrL5Zhyw7yBsfRY+cMvU3KgIMpLR74+d7OjpvMMml9IO2LL1zuPxZZkxJ7ES7Nbk7IK
         /GCTI+rbLrmTgBoUa6MV5Q38phEd1BVcI1yV62RsfBUWPjdgX8zlK8OXDaWAJF0ZEKeO
         llkYI5FGWQ+EnUayJfEzP4W3ik3b2cPbW3BqK32YH2S9H2Jja90LUD6/78xfKhOJFMbP
         CsCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795461807; x=1796066607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
        b=hfnOA7I2TXgry2TbWzAa46KJKi6wVuCpEz4/WYfvJ3PjHXOLJQ4wNIWoSfG+p/hGOx
         nt88AVZYEvvvRvlWPYD2uLQIXSsnA630yig0KbawMdJhpJ7LQ8Cz5m8q34ldWtRExcpS
         LXzNU9wYTe0dnOm8NkfLYAekmQO4XHtARQP97Q64kN6IeXXtgFL1k+8bHOQrddUG/PFu
         Z7PE1CjUQRWY5ulVeCQOoFiZEXGXLgNOAOcwFag0nf5Kix3yoPX96/j4iY2TOW7vB8Vj
         tmCZgY6B+hcGj4QeBLly0DaBpNnPybhw7pNGAXM13Nlx0JFEWXhmpt0fqHlveZ0PaqwM
         t+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461807; x=1796066607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
        b=M++TrKf3J4DdA20Myo710jSgGwf0+BB08agIVYP/yjpY+eM2oWTCZkdgucSGCLYhJn
         f1V57v2S42d3s0kw3rDwbWnnExbaLZyK7inAJgwPt60ZRML/eQloDwldBdX/FqRs2fLk
         RonSDBMiO2xMZf/QYJ/M2MGrYB311Tb38XEWkmSy+D7iWmaus31r7tO0R+HjlHEyk7Ut
         WFY9nAJ8DLMWSEE69KrnkESq/bNaD91hGITfeicURiJUijJr34TC2F+wwz6A6CRfoIzQ
         ZuuaA5hPXO8IKe9NA8GJ07HM1AXudzwAjonbAkN90HnS8tUgbJPtugvQWT1aGM4YRD1I
         YCCQ==
X-Forwarded-Encrypted: i=1; AL+hErG25F6YZtJtYcglbQCr1nh9UH9iQwiyxVf9SfQrw9baXw5WDq3DHUZHDkmrJJ4KMkbDYMLadqZPegZ59Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/sSnOC8II76lUXodv5XcGwbtw8KDQkLJduaANT77zD36im7di2
	boTFMujvca7eUJWNryIyHCW+nqel8spxlIi2jO/oPm3evYcnAXFDv+zSFWWoMk2+5RTi/7JyeU5
	rNYRGKWGKH5jg2WEg9RBc8/fVHrB5SHTh2RL3e8CchQ==
X-Gm-Gg: AZFdTZdWyR4mihEJ9Ex1+A+80V7gjoRzCxD/kLeuyvlAs9V4Yhv6x7v1zbbZOJHe2cd
	GhSwC4O2+KmIM+ogELhPxogPX+UibL5nSEC2w9jg+EqG4zY7Kok6MD0/OqwReSz4/iacu41Qouy
	5ut2HRMEvFvPEgb7nBmw4XX0wE0c6f1NGIbpoc/WoqkDhWKkljyx9pEqojuYqPUXBkl7M3T7E8A
	A7rHS6M9YptPv/JnU8+I64mmfVO+gLACvA1+iHr7EegLc+4FJpQdt2B403vAt5eY4/As57nPfnz
	B6RmQDQpM/cUI93HW2yT553R9Obwg1yCxBr/YjIHE/L63q/ozo2eZl5dFGyng4KqpFmgWWABVZM
	SsUwjIB1KjMcSYVY8aqt3r8hP5mD0eiZsxSKWaVL3BDVFBIzLqfjJ6yRs/ArQt+03eNfojhaUbS
	0tdJjec02YidSl2uGBqSDiYNbRqA==
X-Received: by 2002:a05:690e:47c7:20b0:67d:bbf9:11d5 with SMTP id
 956f58d0204a3-67df443ce21mr4010766d50.55.1795461807055; Mon, 23 Nov 2026
 11:23:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123164834.3330320-1-lee@kernel.org> <20261123164834.3330320-9-lee@kernel.org>
In-Reply-To: <20261123164834.3330320-9-lee@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 23 Nov 2026 13:23:16 -0600
X-Gm-Features: Aa3M54rXx5AsI23DPhI8Gl_apOGxLaDoOy7tWbjmJE6RhLCtQ26K-zDZRMPyVoM
Message-ID: <CAEev2e8KMaN+Vw7usWTiQk=dyOcV5n9PEHB1o7K=cQw=fyoBZg@mail.gmail.com>
Subject: Re: [PATCH 08/10] clk: tenstorrent: Poll atomically in atlantis_clk_pll_enable()
To: Lee Jones <lee@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_112329_468201_A3D691C9 
X-CRM114-Status: GOOD (  12.43  )
X-Spam-Score: -2.0 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTGVlLAoKT24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgMTA6NDnigK9BTSBMZWUgSm9uZXMgPGxl
ZUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFRoZSBDb21tb24gQ2xvY2sgRnJhbWV3b3JrIGludm9r
ZXMgLmVuYWJsZSBjYWxsYmFja3MgaW4gYXRvbWljIGNvbnRleHQKPiB3aXRoIGludGVycnVwdHMg
ZGlzYWJsZWQgYW5kIGVuYWJsZV9sb2NrIGhlbGQuICBJbiBhdGxhbnRpc19jbGtfcGxsX29wcywK
PiBhdGxhbnRpc19jbGtfcGxsX2VuYWJsZSgpIGlzIHJlZ2lzdGVyZWQgYXMgdGhlIC5lbmFibGUg
Y2FsbGJhY2sgeWV0Cj4gd2FpdHMgZm9yIFBMTCBsb2NrIHVzaW5nIHJlZ21hcF9yZWFkX3BvbGxf
dGltZW91dCgpIHdpdGggYSA1MDAgdXMgc2xlZXAKPiBpbnRlcnZhbCwgdHJpZ2dlcmluZyBhIHNs
ZWVwLWluLWF0b21pYyBidWcgdmlhIHVzbGVlcF9yYW5nZSgpLgo+Cj4gU2luY2UgdGhlIFBSQ00g
cmVnbWFwIGlzIGJhY2tlZCBieSBNTUlPLCB1c2UKPiByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXRf
YXRvbWljKCkgaW5zdGVhZC4KPgo+IEZpeGVzOiAyM2M4ZWJjOTUyODQgKCJjbGs6IHRlbnN0b3Jy
ZW50OiBBZGQgQXRsYW50aXMgY2xvY2sgY29udHJvbGxlciBkcml2ZXIiKQo+IENsb3NlczogaHR0
cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC05ODAzOTVhNi1mMjgyLTQ3OGEtYmYxOC1iNTY5
NWE3MjU3MzUKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExl
ZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvY2xrL3RlbnN0b3JyZW50
L2F0bGFudGlzLXByY20uYyB8IDkgKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpUaGFua3MsIEkgd2FzIGFibGUgdG8gcmVwcm9kdWNl
IHRoZSBidWcgb24gdGhlIHR0LWF0bGFudGlzIHFlbXUKbWFjaGluZSBieSB1c2luZyBhIGtlcm5l
bCBidWlsdCB3aXRoIENPTkZJR19ERUJVR19BVE9NSUNfU0xFRVA9eSwKQ09ORklHX0RFQlVHX1BS
RUVNUFQ9eSwgIENPTkZJR19QUk9WRV9MT0NLSU5HPXkuCgpbICAgIDEuODk1NDE3XSBCVUc6IHNs
ZWVwaW5nIGZ1bmN0aW9uIGNhbGxlZCBmcm9tIGludmFsaWQgY29udGV4dCBhdApkcml2ZXJzL2Ns
ay90ZW5zdG9ycmVudC9hdGxhbnRpcy1wcmNtLmM6MzI5ClsgICAgMS44OTYwOTNdIGluX2F0b21p
YygpOiAxLCBpcnFzX2Rpc2FibGVkKCk6IDEsIG5vbl9ibG9jazogMCwgcGlkOgoxLCBuYW1lOiBz
d2FwcGVyLzAKWyAgICAxLjg5NjYxNl0gcHJlZW1wdF9jb3VudDogMSwgZXhwZWN0ZWQ6IDAKWyAg
ICAxLjg5Njk5MF0gMyBsb2NrcyBoZWxkIGJ5IHN3YXBwZXIvMC8xOgpbICAgIDEuODk3MjUxXSAg
IzA6IGZmNjAwMDAxODA4YTc5MzggKCZkZXYtPm11dGV4KXsuLi4ufS17NDo0fSwgYXQ6Cl9fZHJp
dmVyX2F0dGFjaCsweDY4LzB4MTFlClsgICAgMS44OTg1NjFdICAjMTogZmZmZmZmZmY4MWQ3MGJi
OCAocHJlcGFyZV9sb2NrKXsrLisufS17NDo0fSwgYXQ6CmNsa19wcmVwYXJlX2xvY2srMHgxYy8w
eDgwClsgICAgMS44OTkxMzRdICAjMjogZmZmZmZmZmY4MWQ3MGIzMCAoZW5hYmxlX2xvY2spey4u
Li59LXszOjN9LCBhdDoKY2xrX2VuYWJsZV9sb2NrKzB4YjAvMHhkOApbICAgIDEuODk5NzUwXSBp
cnEgZXZlbnQgc3RhbXA6IDI1OTc4ClsgICAgMS44OTk5NjhdIGhhcmRpcnFzIGxhc3QgIGVuYWJs
ZWQgYXQgKDI1OTc3KTogWzxmZmZmZmZmZjgwZDEyMjU0Pl0KX3Jhd19zcGluX3VubG9ja19pcnFy
ZXN0b3JlKzB4NGUvMHg3MApbICAgIDEuOTAwNTUyXSBoYXJkaXJxcyBsYXN0IGRpc2FibGVkIGF0
ICgyNTk3OCk6IFs8ZmZmZmZmZmY4MDc2N2QwMD5dCmNsa19lbmFibGVfbG9jaysweGEwLzB4ZDgK
WyAgICAxLjkwMTE5NV0gc29mdGlycXMgbGFzdCAgZW5hYmxlZCBhdCAoMjU3MjQpOiBbPGZmZmZm
ZmZmODAwNTNlNzI+XQpoYW5kbGVfc29mdGlycXMrMHg1NGUvMHg1OTAKWyAgICAxLjkwMTc5OF0g
c29mdGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoMjU3MTcpOiBbPGZmZmZmZmZmODAwNTQxMzI+XQpf
X2lycV9leGl0X3JjdSsweDFmMC8weDI1YwpbICAgIDEuOTAyNDIyXSBQcmVlbXB0aW9uIGRpc2Fi
bGVkIGF0OgpbICAgIDEuOTAyNDQ3XSBbPGZmZmZmZmZmODA3NjdkMTA+XSBjbGtfZW5hYmxlX2xv
Y2srMHhiMC8weGQ4ClsgICAgMS45MDMzNzVdIENQVTogMCBVSUQ6IDAgUElEOiAxIENvbW06IHN3
YXBwZXIvMCBOb3QgdGFpbnRlZAo3LjIuMC0wMDA3MS1nOWEwNTE4ZDRkNzBkICMzIFBSRUVNUFRM
QVpZClsgICAgMS45MDM1NThdIEhhcmR3YXJlIG5hbWU6IFRlbnN0b3JyZW50IEF0bGFudGlzIFJJ
U0MtViBNYWNoaW5lIChEVCkKWyAgICAxLjkwMzY0M10gQ2FsbCBUcmFjZToKWyAgICAxLjkwMzY4
N10gWzxmZmZmZmZmZjgwMDE5MjdhPl0gZHVtcF9iYWNrdHJhY2UrMHgxYy8weDI0ClsgICAgMS45
MDM3MThdIFs8ZmZmZmZmZmY4MDAwMjRiYT5dIHNob3dfc3RhY2srMHgyOC8weDM0ClsgICAgMS45
MDM3MzRdIFs8ZmZmZmZmZmY4MDAxMTI2Mj5dIGR1bXBfc3RhY2tfbHZsKzB4NjAvMHg4OApbICAg
IDEuOTAzNzUwXSBbPGZmZmZmZmZmODAwMTEyOWU+XSBkdW1wX3N0YWNrKzB4MTQvMHgxYwpbICAg
IDEuOTAzNzY2XSBbPGZmZmZmZmZmODAwODRiNzY+XSBfX21pZ2h0X3Jlc2NoZWQrMHgyM2EvMHgy
NmMKWyAgICAxLjkwMzc4Nl0gWzxmZmZmZmZmZjgwMDg0YmU2Pl0gX19taWdodF9zbGVlcCsweDNl
LzB4NjIKWyAgICAxLjkwMzgwMV0gWzxmZmZmZmZmZjgwNzdmYjAyPl0gYXRsYW50aXNfY2xrX3Bs
bF9lbmFibGUrMHhkMC8weDFhYQpbICAgIDEuOTAzODE4XSBbPGZmZmZmZmZmODA3NmQxMGE+XSBj
bGtfY29yZV9lbmFibGUrMHg5Mi8weDJmZQpbICAgIDEuOTAzODM1XSBbPGZmZmZmZmZmODA3NmUx
MzA+XSBfX2Nsa19yZWdpc3RlcisweDVjNC8weDg3NApbICAgIDEuOTAzODUxXSBbPGZmZmZmZmZm
ODA3NmU1NTg+XSBkZXZtX2Nsa19od19yZWdpc3RlcisweDQ0LzB4OTYKWyAgICAxLjkwMzg2N10g
WzxmZmZmZmZmZjgwNzdmODEyPl0gYXRsYW50aXNfcHJjbV9wcm9iZSsweGJlLzB4MThjClsgICAg
MS45MDM4ODNdIFs8ZmZmZmZmZmY4MDgwNmVkYT5dIHBsYXRmb3JtX3Byb2JlKzB4NDYvMHg3OApb
ICAgIDEuOTAzODk5XSBbPGZmZmZmZmZmODA4MDQ5NDY+XSByZWFsbHlfcHJvYmUrMHg4Ni8weDIz
NApbICAgIDEuOTAzOTE0XSBbPGZmZmZmZmZmODA4MDRiNTg+XSBfX2RyaXZlcl9wcm9iZV9kZXZp
Y2UrMHg2NC8weDEwNApbICAgIDEuOTAzOTMwXSBbPGZmZmZmZmZmODA4MDRjYmE+XSBkcml2ZXJf
cHJvYmVfZGV2aWNlKzB4MmMvMHg5OApbICAgIDEuOTAzOTQ2XSBbPGZmZmZmZmZmODA4MDRlMjI+
XSBfX2RyaXZlcl9hdHRhY2grMHg3MC8weDExZQpbICAgIDEuOTAzOTYxXSBbPGZmZmZmZmZmODA4
MDI5MDg+XSBidXNfZm9yX2VhY2hfZGV2KzB4NjAvMHhhZQpbICAgIDEuOTAzOTc2XSBbPGZmZmZm
ZmZmODA4MDQ0ODg+XSBkcml2ZXJfYXR0YWNoKzB4MWEvMHgyMgpbICAgIDEuOTAzOTkxXSBbPGZm
ZmZmZmZmODA4MDNjMzY+XSBidXNfYWRkX2RyaXZlcisweGNlLzB4MWQ2ClsgICAgMS45MDQwMDZd
IFs8ZmZmZmZmZmY4MDgwNWE1YT5dIGRyaXZlcl9yZWdpc3RlcisweDNlLzB4ZDgKWyAgICAxLjkw
NDAyMl0gWzxmZmZmZmZmZjgwODA2YzBjPl0gX19wbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIrMHgx
ZS8weDI2ClsgICAgMS45MDQwMzhdIFs8ZmZmZmZmZmY4MGUzMWJjOD5dIGF0bGFudGlzX3ByY21f
ZHJpdmVyX2luaXQrMHgyMi8weDJhClsgICAgMS45MDQwNTddIFs8ZmZmZmZmZmY4MDAxMjk2ZT5d
IGRvX29uZV9pbml0Y2FsbCsweDc2LzB4MzlhClsgICAgMS45MDQwNzNdIFs8ZmZmZmZmZmY4MGUw
MTQxNj5dIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MmI0LzB4MzNlClsgICAgMS45MDQwODhdIFs8
ZmZmZmZmZmY4MGQwNjVkND5dIGtlcm5lbF9pbml0KzB4MWUvMHgxM2EKWyAgICAxLjkwNDEwM10g
WzxmZmZmZmZmZjgwMDE0NDBlPl0gcmV0X2Zyb21fZm9ya19rZXJuZWwrMHgyMC8weDNiMApbICAg
IDEuOTA0MTE5XSBbPGZmZmZmZmZmODBkMTNjMjI+XSByZXRfZnJvbV9mb3JrX2tlcm5lbF9hc20r
MHgxNi8weDE4CgpUaGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZS4KClJldmlld2VkLWJ5OiBBbmly
dWRoIFNyaW5pdmFzYW4gPGFzcmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+CgpSZWdhcmRz
CkFuaXJ1ZGggU3Jpbml2YXNhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
