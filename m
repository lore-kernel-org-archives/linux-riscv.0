Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052D606A338
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 21:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11gGBlIO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JyAb+PES
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wTE71LRXEeNUhM2btnvOY7R+7VQDmZrzYTI4ib3mOJw=; b=11gGBlIOYgfHtxaolTOOIsoPtW
	lNDLWD1gZvh+r2h2D0HyZqMDK/TFv2qXmWfobilkEGJi5NcHqOLzw4GiKupdvHRxWv3CmOwd1CjbK
	B3OLuuPtza8hSoveKTBzyRnFJCcNlMJqiB/vXaQ+qCD6CxicJmNxzlnsAystCsiLriRca6Th9JgZY
	kuZpyz2XIv6/7JYddMXPKuOH4loW0IQdfsbhsefexqEL9/VYzzgApw04Mj6dx+6nk44oc5pxBCKlk
	rJTnsF2Z8iKvIxhIeSwzZdIriAi6RDru14D3uK/3wOqI2eJ4D0Ih01qHHPxywLFQSLjwusEwHVMDV
	3uPqsiCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWCx-0000000GJPs-1CY3;
	Fri, 20 Nov 2026 21:31:47 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUWCp-0000000GJPK-3iwZ
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 21:31:45 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3adfb744fa6so1226521fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2026 13:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795210297; cv=none;
        d=google.com; s=arc-20260327;
        b=PtINDydfVZ8m+aL6MH63BsOs5lgkBjAz7RFxdeInYRISEVkLd2MNmb5+u7c7stATCJ
         ZDMEl5QS3rRSm8GM2xKa+ld8n4Y8Dn/uOdJ+lugGP3dnM0Q4H8ZMwp+hcjk+B42m35Xz
         D8MIQKFlFX/sCvBM2bj2tPiOUhu5hEvfj+do/Ppx5zsyJtn2OvpNgDVRWX4zZFgGneKl
         +mHn5HRhVq1/JsXjYAnZscKVPArr9S574vYEOf1wDcKk62AhxsQRYsOn1EdAVoRbWIcV
         yBNqorCTh+OfRziXM2fGwVO9qk/YhKYPvqv85M8Th0UjEpVzBflKUik1+kCIB3X9hENN
         dlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        fh=o3nudNmIrELhQY7BNPRZRc1OKyYOZLDI0NBr7b7tleQ=;
        b=q4Z69CaJuvE8wvLpyC1bV2HR4T0DM5wBlaxmXqWdz1BguYS9Ad5gnonhWgk8GHZ1LK
         4emsSB0XuItvoYbnrIDyGKFMs+sFGupB+4d1BWEwTrFYNgIzAtkbfGSXMiuaixFc2Rl3
         ez57IuZgyihgclXwfL659rUums0GEsEr+OjCUb29bUpVisqAOohzRLah2V46AuwLi1Pd
         A5SBrcyhmj6ledEYCwXrtNAa+tdcIfuZw17Q03I1P89F/koKTwKVUaXuT7TjEsu7U+B+
         2SYWCVDTgFkm1Tx71X8UhPNMN03ZXHlYAd0/35a853emayR/moSOu01c9gTprCiyZf7H
         6Rgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795210297; x=1795815097; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        b=JyAb+PESY0sFuhsecx1KMqTrNWZmOsWm9ker2DP6YaRZvlAb4mm+dYM9c0HdLxr2yi
         K64498s8Uj5Z43MiL9037DP+GblhaQsEHhRz1di6l23PKtywb6+dFN+7sJkT3i/qQUv7
         LwN/DpzYt4tvbD3ARiYhspbqAMrSiYMRX2dqIXlySqmRn/AMv4Ni9imCNAlLyKFdlN64
         J53p0SjQGypPsIKOPjNPtWYIL5H+ubGeKDGCSgk4wui4nhjsvCib+h3UUgyn7OOeAaDK
         AVFB/l4x/ZqIwzit7yZuYSG9JG0y/JVfm7vu9NhR/WY4WC9g/8a67NOXYGxdlbem7vAg
         nzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795210297; x=1795815097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26y+of0VW/d3qa/IzkivZULa62OBHde+4TVDHu/Ebbs=;
        b=Df4UVJlLca02h8TPfWK6NpbCoctO2L5yBoxTuF6i1e6RZLprMUDq2E1AOXNaaSD6SF
         y6PUmkHZpj7b8cLjwubra3gePhZdsqTbIWtgyFy/uVdEGWxObjcSeWdNhZj+QaR/J4tm
         1dVqupFBUIiQ1ZJHF1Te4thBqW/WuP8ucqgd1X97Z92sAYFlAEwJSjKasdKe24XRwJQY
         5ibd98OSwhRQueP038OZgrmbP6rOUVxmD14N3mMnyBI2nOKGejwxjRTJ7rhvXktM/kwm
         101Wx+3dNoh7eY61LiyJlaZO+fNturyRg1VGB3c6m/VHkfyiL6X8qiDNJOLCgjiDfbzd
         J+eQ==
X-Forwarded-Encrypted: i=1; AL+hErGRiV1WOcRn03h0CZFgxNZLIsDoLysaes0qK/hzs/io6nmvxKFf9Q2dRhFJR5gLV2ErmVseTuxIZ7b0+A==@lists.infradead.org
X-Gm-Message-State: APuU4Z88svImqtSUFYVukvpXj3+iGU7kl2bU6NIfP0C6TrxjOpIwPpD8
	5YjN6d+d55umquWP4GrReOA7ymdpbe21WHAPBb6bk/vlW3vOkttQyRC2L1ik8Cj11kkyJ2OYSXw
	BVLUSimsABcx+ON7tQrt2wwdkyevC1bo=
X-Gm-Gg: AZFdTZf/kzbGw6sb3g70eDDLNNsgiLOWvTUWav4LtyhocyQX1u1Lh1FlFwG1nR1P+1A
	6H0R/TzkWSWx2XOmPeBfoQE3/mau22r0E/Pz/8rG3Z3rlzl3pUT449QJTFPK3dLywVVRn+7ddtF
	+m85ZTvmqqfR+0qT3JSqfxtNa/mafJS6ELoDXVijXNKu6rf5h5Ypiw8Mwx2tT70u9shsqXQ3myW
	zXkCBkx0cuguTnLrZCDyrvWS48B4YTrAiw90lwqM3kqhDHsDrirWSWsRZfoGmpWoB+4cLvLvqrp
	1lwhSUc8PG5PAgk588T7EzMc+sdghrQSWhQowFEHBSTqLQwMx/hzgtsWIln41cJu4gxVkAMceOX
	6vv1HXZ+wcP5TfcSakgaP+NDPoAuUlFPiA5jwE1e9kIsZUuy5BQ79ALEEXxfob+6E7AcapZz3YH
	ahvLwz8CKFwdBKg3ntBwqkEjobTIBKWdWkfkYBjj6uVjkZMStF3N927AfiVc+XfpjO6BqYmut3M
	CMOWd2Pdv4zJwo+hKi0qBLUoXiWczMl9FQsX1lhYoTu6vLpeHOkgeUki+0A3oFt5TRf9F45
X-Received: by 2002:a05:6512:1320:b0:5bf:cf6d:ef1 with SMTP id
 2adb3069b0e04-5c1bc5767fdmr1687437e87.0.1795210296624; Fri, 20 Nov 2026
 13:31:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261013-clk-type-state-v6-0-a5e9977b3509@collabora.com>
 <1a1cb87df11.2c57f9fa237371.844135553238709982@collabora.com> <179519331840.3795820.8047048832159165355.b4-reply@b4>
In-Reply-To: <179519331840.3795820.8047048832159165355.b4-reply@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 22:31:25 +0100
X-Gm-Features: Aa3M54o4i_zALBjbkgtOxZes0dCWZ4jiHPCTwn8GOTMZ7mrp5N06gIycRXOv0PA
Message-ID: <CANiq72nOKrAtct_eb7tjc9JFFpOQrN0=5bOyOZo1p4C+4U5bsw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Clk improvements
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, linux-pm <linux-pm@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-pwm <linux-pwm@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Boris Brezillon <boris.brezillon@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Maurice Hieronymus <mhi@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_133142_419372_80AD387C 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMjAsIDIwMjYgYXQgNTo0OeKAr1BNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEkgd2FzIHdvbmRlcmluZyBob3cgdGhlIHJ1c3QgZm9s
a3MgZXhwZWN0IHRoZXNlIGNoYW5nZXMgdG8gYmUgaGFuZGxlZCBzaW5jZSB0aGV5Cj4gdG91Y2gg
dGhlIHJ1c3QvIGRpci4gU2hvdWxkIHRoZSBjbG9jayBjaGFuZ2VzIGdvIHRocm91Z2ggdGhlIGNs
b2NrIHRyZWUgb3IgdGhlCj4gcnVzdCBvbmUgPyBpdCBpcyBmaW5lIHdpdGggbWUgZWl0aGVyIHdh
eS4KClRoZSBjbG9jayB0cmVlIHdvdWxkIGJlIGlkZWFsLCBpLmUuIGEgbG90IG9mIHN1YmZvbGRl
cnMgb2YgYHJ1c3QvYApiZWxvbmcgdG8gZGlmZmVyZW50IHN1YnN5c3RlbXMgKHRoZSBmaWxlIGlz
IGFscmVhZHkgdW5kZXIgIkNPTU1PTiBDTEsKRlJBTUVXT1JLIiBpbiBgTUFJTlRBSU5FUlNgKS4g
VGhlICJ0cmVld2lkZSIgUnVzdCB0cmVlIGNhbiBhY3QgYXMgYQpmYWxsYmFjayB0cmVlIGZvciBm
aWxlcyB0cmFja2VkIGVsc2V3aGVyZSBpZiBuZWVkZWQsIGJ1dCBpdCBpcyBtZWFudAp0byBiZSBl
eGNlcHRpb25hbC4KCihUaGUgZmlsZXMgd2lsbCBiZSBhYmxlIHRvIG1vdmUgdG8gZS5nLiBgZHJp
dmVycy9jbGsvYCBldmVudHVhbGx5LAp3aGVuIHdlIGxpZnQgdGhlIGxpbWl0YXRpb25zIG9mIHRo
ZSBidWlsZCBzeXN0ZW0gcmVnYXJkaW5nIHRoYXQuKQoKSSBob3BlIHRoYXQgY2xhcmlmaWVzIQoK
Q2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
