Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBC4E81BB1
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6kblcxi4riPrXM+Yt3Ef5tnq2Jp/4exUhZWnJF+O1g=; b=LWbidjkknMHF/t
	5aG26CdCwqRQz2akgBH9B1BGsPM8toTeDu22OwTV9fgXUlX/Tiq5V58ao4AaONDyOpXD3D9iFaH2O
	EopXh8VnSo4vV+uCs/HI3mFuiWFGXwldv8gPjk+JPvcVgSh75+25rUpCb8RhdZzVWRcTaRvZosbxU
	LI7LHISV5y8leZfy5DCCKEb3qvZzSKXc90f3aYbu/n8HVEoMFFE6/U9ZMWq7OEh2G4a7Q4mOR7pzC
	dLMUfgIVXUx0Z3CFK6XkMM2XG89eb+5Lz4tN288pTmpiQlJmkxBMSUwRG4bT9pYONo+siwoDYgs6B
	PiJIMnh/QR6yrBHfQt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQuo-0000000FOyS-0UIO;
	Mon, 09 Feb 2026 13:02:58 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQul-0000000FOy7-0piF
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 13:02:56 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2ba76e80509so29666eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Feb 2026 05:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770642174; cv=none;
        d=google.com; s=arc-20240605;
        b=QJsv9tIH3yMHtA9jim9Ly7vIYi0zO6fFfXFtOV759RicA7S+xma+nuSagp++UlkTUQ
         G7wNPyccudSjZbc7NrUPten0ZI97N2+7m8tJKvhh8WQAzMDgzYYpm9BlS2vedtIAkhxP
         CQjQ/VeVMQz6Ax91oHS+2eH66+slTos5JFgsIrYWr9K4iviogtxRFh0B170cdrM8Q3oP
         82YjmHELutqMoSzOQlMyth3bxH7OoEX/drtjMWOxPe7otTkgJIGGD5SALXxAEpTLNFUI
         n8SThFfMrDrO5R4F9Qg0xvyWXQocm9owSp7BugTB5SrfN0J+uuTjzmsf9vq/8yEY4bKw
         /VLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=khoFsSTVz4b1i11FJkTbeTmQEtUujLgmVbgw/XgwjGg=;
        fh=dd472ELr3eS33iUY5rkdBKLsVwn3IbSQXKOPLH1w2ko=;
        b=BtxjoSJLodAuMxLKAD/Bcf8Bk+NXYpxpUwPGMX2jNj/M+IYWz+jcRNMKcO+xTU1iAh
         PcKeEnm88hw4s6Hwkk4qPJxgwHxg6otb/ZwgBj9wMjdUok2yc3l3RRZeq7FDFBWmXQ5I
         TMsLo1eR9T3ZupeeK/zbRXi2w88Di449SNlBP667MuaBccLyghJEVQIfwTrWcmnEFjQ2
         o2ucffmMpXOoVERAm0S6F9kt6UbATB96kpYdCzufLxIFt/X9lced8s9+t9M8XdSU4trd
         hrPT2J6LfUF9b6a8PqZt9Pqn5gliSgwwNA4TiZgJkBV17I9TrGfoonzaR0juAubBGVwd
         EtDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770642174; x=1771246974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khoFsSTVz4b1i11FJkTbeTmQEtUujLgmVbgw/XgwjGg=;
        b=C6hppZM1WAHTiMg+pJqaAv1c3jdX610WxRsk96/KQkwFsgbfQBXMX1zpvId1hZhz14
         pWdVXjkoyJ6ih+ku4WUIjSZpso/skp1mnVaOLVCaWzx4uYOItJF1Rk9kzq7sBnjH3JlZ
         Oflpdrxfu+uzuFxC9o8ES3+8+kwCpl1/aOXUeg7k9MEP2IF32z7HVQqdxahdjWknt3kJ
         tMcINoSC9lB/ghvf8eNyOlgvTkT4Xh/uCvQjMYRiwJ2LA5BBhNSgiIjFsw3oDknEOiK+
         RIMMbgeQyGGJX2nn6LS16OZkI5e4LiJRtthABWNEygX3qhfMsj0IlzHkTcI0QBSBSZVg
         M5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770642174; x=1771246974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=khoFsSTVz4b1i11FJkTbeTmQEtUujLgmVbgw/XgwjGg=;
        b=PI2lpHAn6y2aPE/6a1XzDojLnOVLqfNhc3a/YuUIEb22AtVZiyU1rDH0pk7gua5jw6
         CR0+lQO+O1eXC4blA2Vegd6bogMOrzHfHA34I2mCjZscuM4Yw+SYpAFO7/GHLPYEASXp
         kW5kz/nf94Z0f57V1kB2LY6manVSQK5/iW64D3ZohSxCspZU8rbTzyRM0/fkKzsILfD3
         M1lMWn4UGsBIMFO1G99tw8Seeu5m1cfpTfbdF9Bm5ove+ZS/WRyUE/8o1Mo4+qAkYdYX
         KiDjzFKF0N7lF0U9QS1oQHgKc7mWrHlWJEyqDaVmZWE2LdltN/P8n3liZH5s2ss3A/ka
         UVZA==
X-Forwarded-Encrypted: i=1; AJvYcCVWVxSsa3E3ajYqxcjUIpSVnILDlnRI5n6YZGYk20bz9R8qnnW/lqFphuD0OCm497SoCGg+1U9A8kE4cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEciLsDUCHzfk2TfHhNFeuUJAekaIMvShu/ux71jV0XE8t5xVq
	GURQRjHyC27tUy5rOoSioyHt+UQqwDfxK2p/W28iBfBudxf6gkU02Nr9Kq9cvr6Fz29L8bfI4cH
	MjbXfhnPJTCBSzU/Esq8J13W+TJskttA=
X-Gm-Gg: AZuq6aJsjv2YD4cgeTGpiBxVSQMkiIw7bOB4dVVuJEw8wx9XXPzguGYPAUqfxYpElD8
	55pJKnsErgtv2NMBXp/2WCFms9DEdaZEgz9ErmXbEGF+b+YJfSpP197HJRsGFNUuZKNAOiEp8Pt
	4I3t40dawM1igvjflFLL78g2UXiC4YTzZDbi/opnLPvTSIUsNxZBcdG9pf80R9ZFXHeLhhN2IIL
	74x2DZhj3coR4tZL1pLkYyQ4zu0h69o8JG4qZShS32+ZfnUxL97iQ7b/9xlS36B9InJI2oTlCxo
	9zoeVjvWGaDo0SK4V55cTvn/jZJ7/Sc8+Gy7XuQiHvaCujfbUptnb4OkAWEj2J8RtGjpbtBZIp9
	9GxX1oPvn4kG9
X-Received: by 2002:a05:7300:e607:b0:2ba:75f5:72cd with SMTP id
 5a478bee46e88-2ba75f5830fmr502025eec.9.1770642173699; Mon, 09 Feb 2026
 05:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org> <aYmgjEWaLrdsubKM@monoceros>
In-Reply-To: <aYmgjEWaLrdsubKM@monoceros>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 14:02:41 +0100
X-Gm-Features: AZwV_QiSCxvsBPMPbdvLVQ6n5PFjHBckpVSND2cAYzso4jDes2NZlheZfkl0_H0
Message-ID: <CANiq72mMS2EeU9ayDpm+xCz3xQyRBgRyWW8KKvJLAuCC64Xi3g@mail.gmail.com>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_050255_363162_CDC074D6 
X-CRM114-Status: GOOD (  10.53  )
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

T24gTW9uLCBGZWIgOSwgMjAyNiBhdCA5OjU24oCvQU0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gTG9va3MgZ29vZCB0byBtZS4gSSds
bCB3YWl0IGZvciBNaWNoYWwgdG8gYWRkIGhpcyBibGVzc2luZyBhbmQgdGhlbiB3aGVuCj4gcGlj
a2luZyBpdCB1cCB0ZW5kIHRvIGRyb3AgdGhlIEZpeGVzIGxpbmUuIE9yIGRvIHdlIGFsc28gY2Fy
ZSBhYm91dAo+IENMSVBQWS1jbGVhbm5lc3MgaW4gc3RhYmxlPwoKWWVhaCwgc28gZmFyIHdlIGRv
LiBBdCBsZWFzdCwgYmFjayB0aGVuIHdlIGRlY2lkZWQgd2Ugd291bGQgdHJ5IG91cgpiZXN0IHRv
IGtlZXAgdGhlbSBjbGVhbiwgYW5kIEkgYnVpbGQgdGhlIHN0YWJsZSBhbmQgTFRTIGtlcm5lbHMg
d2l0aApDbGlwcHkgZW5hYmxlZCAoYW5kIEkgdGhpbmsgc29tZSBkb3duc3RyZWFtIHVzZXJzIG1h
eSBkbyBkZXZlbG9wbWVudApiYXNlZCBvbiB0aG9zZSwgc28gSSBob3BlIHRoYXQgZWZmb3J0IGhl
bHBzKS4KCldvcnN0IGNhc2UsIHdlIGNhbiBhbHdheXMgZHJvcCB0aGF0IHJlcXVpcmVtZW50LgoK
SW4gYW55IGNhc2UsIHNvbWUgb2YgdGhlc2UgcGF0Y2hlcywgZXZlbiBpZiBub3QgY29uc2lkZXJl
ZCBGaXhlcyAoZS5nLgphIG5ldyBsaW50KSwgc29tZXRpbWVzIHRoZXkgbWF5IG5lZWQgdG8gZ28g
InVyZ2VudGx5IiBpbnRvIGAtZml4ZXNgCmJyYW5jaGVzIHJhdGhlciB0aGFuIGAtbmV4dGAgb25l
cywgaS5lLiBldmVuIHdpdGhvdXQgc3VjaCBhIHRhZzsgYW5kCndlIGNhbiBhbHNvIHN0aWxsIHNl
bmQgdGhlbSB0byBzdGFibGUgLS0gd2hhdCBJIHVzdWFsbHkgZ2l2ZSB0aGUKc3RhYmxlIHRlYW0g
aXMgYSBsaW5lIGxpa2U6CgogICAgQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyBOZWVkZWQg
aW4gNi4xMi55IGFuZCBsYXRlciAoUnVzdCBpcwpwaW5uZWQgaW4gb2xkZXIgTFRTcykuCgpJIGhv
cGUgdGhhdCBoZWxwcyEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
