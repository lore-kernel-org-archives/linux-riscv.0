Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E35C982C0
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 21:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUFuYFFBbL3oIOSkxozwSrOSuDKIcjjs3DgSZBrY4eo=; b=U+qoRyttV090zM
	TgX9vbKfY9YBMKM+qbJ1HxzfQ/YU78sXtA538qjVKLtalZjyaltPEkA/0GkL8rqLxYXAtOHUew+AX
	NuQNqpCkHxUjgJ4WsCi8WwDxaxYD/kgQDnKH1cA2JjGoDbmDgy/Tr+PcZgOxYVF+rr5Tf7lwA8NUa
	Tk9GEASRKRB53A6kw//MSiQENO15+1rSIb0Nnvh/fisnc/6CPlxshoaUg+6YFYcOVTKc7VrD5d5dv
	IXZFMCdAKfcIUFZFW89iB9MXWkWMLp3m4qB9aWmmLTophEMKElsD6ugxn3t/Pr+Wz958R4QehvfE0
	22mhqGK5qJeA0iV7uBfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrPN-0000000EvWB-2VsA;
	Fri, 16 Jan 2026 21:31:05 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrPK-0000000EvVk-0yEC
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 21:31:03 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-64476c85854so2257920d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 13:31:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768599061; cv=none;
        d=google.com; s=arc-20240605;
        b=c1dWzv4DU0uKrLePMSrVcpZwrGTY539v7Sesr4iVPw7aTBRS0h3Kir22prm2f4R8Ua
         NLdNMItjganwvaETc3UxW8EEWNjRhBM98jrwkOPzqgOrZ1IjfQmpwIDFw6JDgDrRqE4/
         02phx+Zdi8dkIUah9jovKdlA80Bzwyq4yV6SFGwfoKfOaOxLw5XPyn8A+FArCI+qv6tX
         9jyr7v51lhALamAjDk429ojKrAdUTqCnSdfK5nEH1/9bKjWhSPWQuP0+lr1lOXGEf9YB
         JF8jmE5bHKra00RubgrJGl3b6G41hE87FaGuNM6T9roErBEUAxagAVHmWb01bMeKDLHy
         Rc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vvBMNTtYjIdNhiUtcgxPXcGSrQ3zdfmugL08dxlZpp0=;
        fh=MY0uz3hUUEYv+D2FmuvodlPyjI12JRGscJSmqgwR48o=;
        b=P6VYAAso03oJgd6qOYRu+9I3jjUs9uuIMcHPzJV11eWqB42ZqSifYtExZZLAfhC1DK
         N8ame2MKxBrARfAPtqjUnMWfJbKEQPKDarbrCVmVHthfBM3OIOj9A8KVN/nfF+oHSPNn
         hEkHnNu9ZMHHq5hqTwoU0EpxsYvTv6afnmagDe620w1XwFlLPVu/h4OQIezyGgvmgFeJ
         io3PzUDEQxkiYFbcaJitFMHUntZFnQ5Z+rZXp+N4pBLwAz2y/O+qSfA2qyvEaW+DJACh
         P87VIGFAt5xC9uvCdLJbdeLVivLEvsclzrlF+IiRjKU7rx/Ndc4S2vk87FKAsfzJNfYB
         Q2VQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768599061; x=1769203861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvBMNTtYjIdNhiUtcgxPXcGSrQ3zdfmugL08dxlZpp0=;
        b=UWuMsRlxFoYm/sKpOxQDuvGyt+WSscmliuvNLwm6S1jQV/Tl6uoTm3s01flf6JkYWO
         IgSJLKbII6S8OHZuLK/PPThkPO7ZbkzVeWcDYuNaxvpKdABEjJri6ysxqKxTYDYtiHdA
         IssuQZAWSwr2EH0ypCpv4Eliea7b8EAieCB4pdXIMO6ysbDUskCqZdsTpIEYKFzeBtjq
         LgA8JJzFXr0CWYE67eZIMf8ezVPNFBZ7imepOv9SqCoJ4v354lbxyxd4YQ0N7YnawMen
         ScI4/WvoqbDQ5EtZaZmr57LSSEx2sbeQ3A0RkQ8Yg2Jfw4IH8b7fpVjFuB5SAbxg/yKY
         xGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768599061; x=1769203861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vvBMNTtYjIdNhiUtcgxPXcGSrQ3zdfmugL08dxlZpp0=;
        b=f8b16+cAoZcIt95usw+5lq/dhV4hTvcURysthm/psm6AdO5yQepYp9IhRE9U8dvBL2
         jFLoclOtqzKOuyq7uvC/mXyrTpMParaVBnebkmTkiPPJjCIMC+j6AMyOymKDfHVbz9el
         uM/IL9v4OAYXPtHnjbLkQARwJgp3rGitCL4V6fNfwdk0tnJLMdB8bmdV4TK0nSn6s7Hj
         KD0KWRUJrbHhvB/QeYVynV2SM5P6DzGARB2bQO9K6ymSTWR3DYmEYeeEhxQyxyd4LITm
         fv8iuZAzvxWpaAzdRnPNjyTH5UttKoHPxuhDuygfLWua1VfmwzbnLSV+PBTtAuV8r2hJ
         l6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaMIvUAZl7QKQE+tOoHm1tDCiPCNsCVyIEhdmwCsA0MpqFMeBE51vp1yhbrsEpqBV9CZ99NY7UGkpSqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL0UFZZvpR7yC0ddSMp/LgtH4Qg87rmyVALYEVxbK+a3TgX0uS
	oSusVD7xsfkoAocg61Kgm5BOma9ygkUlJAqF7U1zoj9Zq59HwErYfDjKBoPA9NRDqcCpTCJ4wgb
	fw9XzH9BjjsL1T4r15n0IDI33enhbcwDFxywAF9WD/Q==
X-Gm-Gg: AY/fxX7F5RhtKWamTCCq25/fn5epEFYZvGXc8rQOYkFTbVpm8UQj9DI091k+7VVe+g2
	w3uU/iS6gLSZ0pu9lJ6fL6HJWhMzBLLZ1bm5t3CDCBIJoRD1AEfSOSIouRd2OMZP65kxKA2Xynf
	YfbIefH636io8wLJtwHEwHihlROzlHZh0VA2KiVKUng4xmysSGETEvyJ6REu54v48m9R1s3yASN
	7L4jgPk+VA9LtGpaCKYNE1K0uyCBjvbTbz2MHHkPWOMiQv//iq+Ho70BFlbA5dfNXnwTVsp6o6p
	rYEdGkLDJfmhWcrtqIB/uPIdnRFYj7VSRo002T/av1z+t27AISB2btSfFKDQqFTp268ljmM=
X-Received: by 2002:a05:690c:e3cc:b0:78f:b820:f2f3 with SMTP id
 00721157ae682-793c523ce6dmr77707577b3.12.1768599060916; Fri, 16 Jan 2026
 13:31:00 -0800 (PST)
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-8-7356e671f28b@oss.tenstorrent.com> <20260116-pretty-maize-cuscus-fd1cbf@quoll>
In-Reply-To: <20260116-pretty-maize-cuscus-fd1cbf@quoll>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:30:48 -0600
X-Gm-Features: AZwV_Qg_SKVdsBkEYiEsvS3rA5LuKeOql85INJDNfPf7p1rAcP7anRwsxzBwm-M
Message-ID: <CAEev2e_LhhN2uZvQp4r92FLZNS7qYhC=Nn6NeFwqRw5OGjv4Lw@mail.gmail.com>
Subject: Re: [PATCH 8/8] clk: tenstorrent: Add reset controller to Atlantis
 clock controller probe
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_133102_274570_BBAFD222 
X-CRM114-Status: GOOD (  10.91  )
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

SGkgS3J6eXN6dG9mLAoKT24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMzowOOKAr0FNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBDb21wbGV0ZWx5IHBvaW50
bGVzcy4gWW91IGRvIG5vdCBoYXZlIGFueSB1c2VyIG9mIHRoaXMuCj4KPiBBZGRpbmcgYSBmZXcg
dW51c2VkIGxpbmVzIGlzIG5vdCBhIGxvZ2ljYWwgY2hhbmdlIHRvIHRoZSBrZXJuZWwuIFdoeSBu
b3QKPiBhZGRpbmcgaXQgbWVtYmVyIGJ5IG1lbWJlciBsaWtlIG9uZSBwYXRjaCBmb3IgZW1wdHkg
c3RydWN0LCB0aGVuIHNlY29uZAo+IHBhdGNoIGZvciBzdHJ1Y3Qgd2l0aCBhZGV2LCB0aGVuIHRo
aXJkIHBhdGNoIGFkZGluZyByZWdtYXA/Cj4KPgo+IFlvdSBqdXN0IGFkZGVkIHRoaXMgZmlsZSEg
V2h5IGFyZSB5b3UgYWRkaW5nIGluY29tcGxldGUgb3IgZXZlbiBidWdneQo+IGNvZGUgd2hpY2gg
aW1tZWRpYXRlbHkgeW91IGZpeD8KClJlZ2FyZGluZyB5b3VyIGNvbW1lbnRzIGZyb20gcGF0Y2hl
cyA1LCA2IGFuZCA4LCBJIHdpbGwgY2xlYW4gdXAgdGhlCnBhdGNoZXMgdGhhdCBhZGQgdGhlIGF1
eGRldiBhbmQgcmVzZXQgY29udHJvbGxlciBzbyB0aGF0IHRoZXJlIGFyZSBubwptb3JlIHVubmVj
ZXNzYXJ5IGNvbW1pdHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
