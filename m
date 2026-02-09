Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3066BE78D44
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Feb 2026 08:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HUKQPhVPCLRCCWuTUk/72u9Q8MGUFd/ew+58C06ZgM=; b=ZOko1FohI8tnWg
	uz9AvEH5JTkRSeboxFAT0fJhmftsmo++TFdFPiyqWTE9OimoRYiJZ6fduVRNmSryNMHWCqn2lry1M
	3bCcom4YNnpv/Hg7PG9pgcSn2D99XYxZPivT84Natus6EYQ6rpjfsU7PM/uZqBXy2znwDb/iducYD
	w8g/PNeqP5VDqqpyzQOGfB2tVTp0lFJCaVejTsKPuRD0MzbRzfQFQ2MAQZTbnBBV5RxeyH/jlPWa9
	VQhKwPKBW+M07EFAVcNAkIZQMjYSWe3f3MM6H+MSumMFJ918doSK/qEXJadPFvQ04gZf5lQ7of10m
	dOV3IXucMamdU8yPH6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpN6R-0000000F4f9-2TJb;
	Mon, 09 Feb 2026 08:58:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpN6O-0000000F4eX-1Ksc
	for linux-riscv@lists.infradead.org;
	Mon, 09 Feb 2026 08:58:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-437711e9195so334427f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Feb 2026 00:58:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770627518; cv=none;
        d=google.com; s=arc-20240605;
        b=RJ2tbbUZRZgErZK40YEdSXao5nmUnfQxUacfTXwbJcWJskkwWSY4dPkKHj0KfZ+dOY
         pdW3Ow5pghDY62LmsLMwMyXyLrd/FonDsm9h9m/bNiM2MUHq8ct1hp7XUuE2IUYXEK1E
         jjKI3w07Yh3Vp4+XyFJOiEru1oVSIkgjtkSV7d7dKiEp2/wWXWuJullrsAFQz/YedHxd
         s/jkoULAjNYO5PjJSmk2MF/GpsA8LsZEYrJ1mEV5hEfVnpFqjxRjk9XAJQCLfYJAjxtq
         BAWaghDw9ud5kuWSlXWTlpwxJvo8iOSQaFTEFGBZcnwzNNrj9DFHOxsgovusf/ndcHwJ
         Cf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ep1Ke8qT73X8duJEqzvT5xFlLYeklNidWaAFB1OordM=;
        fh=lbyW2XzMRtUrRTjevlLrGKE+4Nr6Jp0HjOKfj8iyT0Q=;
        b=bp4k2Wgr+jV9G4Ol6JwmJ+4GYzrB5hrxyBOHo5D+EWMzmdOSyb96T+PFA2ueHFAxD3
         L1EHZAhQI1AJyt2S2PBxfw2A0IZ+a4a/ZxRbLivgnOAotzEpvqgWjZZxx1bD0UbDan/A
         ksqwF1RSgWvwLzJW6ldKbzrv/cqNFVBrag9ZUX91SacFfwsKp63qPxDWmcQGhC5CnQW5
         t9fK901BKJGP+Kgx3O5/7vsQ3gqyIMgwFJSvtm88eQRFsh7xhgRRu+mUJk1W/0V0MEkg
         gIHpFlxIqc930XxhbxtOL+CKbk31s65I4SRG7LFltSQTcTd98FLCRDN48Lu38A9+lTIR
         WpZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770627518; x=1771232318; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep1Ke8qT73X8duJEqzvT5xFlLYeklNidWaAFB1OordM=;
        b=yLXztsvkQiiBfqe24DiiT7UirKUS5SEZI7dUPkozDucQ/zFeKwG+ASfBhf1gBLYjLa
         tD1iVGOxt7YuG+I6RS7RcuMCXGqLd7F5uB5LelL7Wc3oPgLHIkOj7x3Zv8444iL4B9PD
         2rIvB1qbaudnT2/eVZuwiPQSn9TnzJJzOoNxbG6KoGYFCsJB8LUSDWzPNob5/p9IKwDy
         4Bpt6sLiZKa0aQUQfjc5vIzDgV3gR8OiV/prw74Xg1LEq+poTsRc1RX0uzBXRaZw5qOh
         juUr6wo7hfq73dHNfHnkZr4TB0XtjubuGfc6sHcOFo2LHwv9Br2jusAHWE0RSwVIl+jc
         O5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770627518; x=1771232318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ep1Ke8qT73X8duJEqzvT5xFlLYeklNidWaAFB1OordM=;
        b=Lkey8+GSbqFc+AH6Wf2s1lfeTWGwXb3++mIEwVQbFiTpRaLLC/+MmsU2qrJFNLzaLx
         LYMjidLA7V/V7nLJfv58md4bgtjtY7IUWm2gHbXGgdrho2+A403CdXo3fHgj6kcdFnN0
         fIJRdSA1a/eoelgOgv8wB1mjJNyBVs8nKg+3D4VRJdPa1c3Evx5I6TvJ4Jskt6w+wQAd
         r7/uEUcUSJL6LUSsEPyHw5Ziqt8aU0C58ttG3wNJSS3+pQYznT8YL0BktVLEF1I7TN+8
         61DETheq+s006MICxe7Kn38XzJ6QADT3ZcctEwlUEPNi0nbSiifZLVT4YNuYQg4MN83l
         KfaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiywk9opZ2tttciFwqVBgKtuXVa1OKfsWQc1u8TJBvZuWz/RC+PpDxKSqb5whNc16CyiNFrvU/CV4Nlg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7Yhx2QDMgNt7tkb/m5nYU9g07/4ISsiiDCytF5nnap+WGnj+F
	qMoer9C+gHTraQULhK6h+S3ALeJ+EYMSlPsBYxezsWY8WjU7I+8jzOzgkWoCWgxNx4m+DsEnREq
	Iy+/BkL2Pqi9vdhzsEbsWFjAhwBpfPiOqhYQOfx7c
X-Gm-Gg: AZuq6aJRtMWthboMARz4P+klkaQ2qu0i+vgDwtfoD7abVJfcdZO+Gjzcs/2Hm8al94l
	LiP865SXvbBCFhLJARKxpHkX4JIjqVltqD4Ood+5Jwj2k/+ge7QbjP5L1POL+kMKLQpPILjQ6hO
	nHR2Wr+pP+yz115ZWPWfRSDLWtHo+mjX/kJPBBEX2Fd2BxS87qCPWuOeGWX3sx33w+FaHx2zFO6
	8JbyEBsANUzEqye+EQZ9hvKdcwqRMqT88dRoebMXG6TWOTAL+WuTA3EqixeRr/p8nZvyRdCjGbk
	6LZlxzorqlLy85fLFZAMVJyuvYJkOEuF0X4hzpPEG+crqicH4dnwVPJTIA==
X-Received: by 2002:a05:6000:2889:b0:436:1116:fea0 with SMTP id
 ffacd0b85a97d-436293b267dmr13879681f8f.59.1770627517365; Mon, 09 Feb 2026
 00:58:37 -0800 (PST)
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org> <aYmgjEWaLrdsubKM@monoceros>
In-Reply-To: <aYmgjEWaLrdsubKM@monoceros>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Feb 2026 09:58:24 +0100
X-Gm-Features: AZwV_QhznCYpnYoMY4YW_2SZsrqqWinsdT88yHc01cus7270kufkaww3dM4cdl8
Message-ID: <CAH5fLghHM7Wfe6n0FsOyEm2oHLUdLOf+OpZiXWnS+yRH4kJdCg@mail.gmail.com>
Subject: Re: [PATCH] pwm: th1520: fix `CLIPPY=1` warning
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_005840_408433_E38A09A4 
X-CRM114-Status: GOOD (  14.65  )
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
aW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gTWlndWVsLAo+Cj4gT24g
V2VkLCBKYW4gMjEsIDIwMjYgYXQgMDc6Mzc6MTlQTSArMDEwMCwgTWlndWVsIE9qZWRhIHdyb3Rl
Ogo+ID4gVGhlIFJ1c3Qga2VybmVsIGNvZGUgc2hvdWxkIGJlIGtlcHQgYENMSVBQWT0xYC1jbGVh
biBbMV0uCj4gPgo+ID4gQ2xpcHB5IHJlcG9ydHM6Cj4gPgo+ID4gICAgIGVycm9yOiB0aGlzIHBh
dHRlcm4gcmVpbXBsZW1lbnRzIGBPcHRpb246OnVud3JhcF9vcmAKPiA+ICAgICAgIC0tPiBkcml2
ZXJzL3B3bS9wd21fdGgxNTIwLnJzOjY0OjUKPiA+ICAgICAgICB8Cj4gPiAgICAgNjQgfCAvICAg
ICAobWF0Y2ggbnMuY2hlY2tlZF9tdWwocmF0ZV9oeikgewo+ID4gICAgIDY1IHwgfCAgICAgICAg
IFNvbWUocHJvZHVjdCkgPT4gcHJvZHVjdCwKPiA+ICAgICA2NiB8IHwgICAgICAgICBOb25lID0+
IHU2NDo6TUFYLAo+ID4gICAgIDY3IHwgfCAgICAgfSkgLyBOU0VDX1BFUl9TRUNfVTY0Cj4gPiAg
ICAgICAgfCB8X19fX19fXiBoZWxwOiByZXBsYWNlIHdpdGg6IGBucy5jaGVja2VkX211bChyYXRl
X2h6KS51bndyYXBfb3IodTY0OjpNQVgpYAo+ID4gICAgICAgIHwKPiA+ICAgICAgICA9IGhlbHA6
IGZvciBmdXJ0aGVyIGluZm9ybWF0aW9uIHZpc2l0IGh0dHBzOi8vcnVzdC1sYW5nLmdpdGh1Yi5p
by9ydXN0LWNsaXBweS9ydXN0LTEuOTIuMC9pbmRleC5odG1sI21hbnVhbF91bndyYXBfb3IKPiA+
ICAgICAgICA9IG5vdGU6IGAtRCBjbGlwcHk6Om1hbnVhbC11bndyYXAtb3JgIGltcGxpZWQgYnkg
YC1EIHdhcm5pbmdzYAo+ID4gICAgICAgID0gaGVscDogdG8gb3ZlcnJpZGUgYC1EIHdhcm5pbmdz
YCBhZGQgYCNbYWxsb3coY2xpcHB5OjptYW51YWxfdW53cmFwX29yKV1gCj4gPgo+ID4gQXBwbHlp
bmcgdGhlIHN1Z2dlc3Rpb24gdGhlbiB0cmlnZ2VyczoKPiA+Cj4gPiAgICAgZXJyb3I6IG1hbnVh
bCBzYXR1cmF0aW5nIGFyaXRobWV0aWMKPiA+ICAgICAgIC0tPiBkcml2ZXJzL3B3bS9wd21fdGgx
NTIwLnJzOjY0OjUKPiA+ICAgICAgICB8Cj4gPiAgICAgNjQgfCAgICAgbnMuY2hlY2tlZF9tdWwo
cmF0ZV9oeikudW53cmFwX29yKHU2NDo6TUFYKSAvIE5TRUNfUEVSX1NFQ19VNjQKPiA+ICAgICAg
ICB8ICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eIGhlbHA6
IGNvbnNpZGVyIHVzaW5nIGBzYXR1cmF0aW5nX211bGA6IGBucy5zYXR1cmF0aW5nX211bChyYXRl
X2h6KWAKPiA+ICAgICAgICB8Cj4gPiAgICAgICAgPSBoZWxwOiBmb3IgZnVydGhlciBpbmZvcm1h
dGlvbiB2aXNpdCBodHRwczovL3J1c3QtbGFuZy5naXRodWIuaW8vcnVzdC1jbGlwcHkvcnVzdC0x
LjkyLjAvaW5kZXguaHRtbCNtYW51YWxfc2F0dXJhdGluZ19hcml0aG1ldGljCj4gPiAgICAgICAg
PSBub3RlOiBgLUQgY2xpcHB5OjptYW51YWwtc2F0dXJhdGluZy1hcml0aG1ldGljYCBpbXBsaWVk
IGJ5IGAtRCB3YXJuaW5nc2AKPiA+ICAgICAgICA9IGhlbHA6IHRvIG92ZXJyaWRlIGAtRCB3YXJu
aW5nc2AgYWRkIGAjW2FsbG93KGNsaXBweTo6bWFudWFsX3NhdHVyYXRpbmdfYXJpdGhtZXRpYyld
YAo+ID4KPiA+IFRodXMgZml4IGl0IGJ5IHVzaW5nIHNhdHVyYXRpbmcgYXJpdGhtYXRpYywgd2hp
Y2ggc2ltcGxpZmllcyB0aGUgY29kZQo+ID4gYXMgd2VsbC4KPiA+Cj4gPiBMaW5rOiBodHRwczov
L3J1c3QtZm9yLWxpbnV4LmNvbS9jb250cmlidXRpbmcjc3VibWl0LWNoZWNrbGlzdC1hZGRlbmR1
bSBbMV0KPiA+IEZpeGVzOiBlMDM3MjRhYWM3NTggKCJwd206IEFkZCBSdXN0IGRyaXZlciBmb3Ig
VC1IRUFEIFRIMTUyMCBTb0MiKQo+ID4gU2lnbmVkLW9mZi1ieTogTWlndWVsIE9qZWRhIDxvamVk
YUBrZXJuZWwub3JnPgo+ID4gLS0tCj4KPiBMb29rcyBnb29kIHRvIG1lLiBJJ2xsIHdhaXQgZm9y
IE1pY2hhbCB0byBhZGQgaGlzIGJsZXNzaW5nIGFuZCB0aGVuIHdoZW4KPiBwaWNraW5nIGl0IHVw
IHRlbmQgdG8gZHJvcCB0aGUgRml4ZXMgbGluZS4gT3IgZG8gd2UgYWxzbyBjYXJlIGFib3V0Cj4g
Q0xJUFBZLWNsZWFubmVzcyBpbiBzdGFibGU/CgpJIHRoaW5rIHdlIGRvIGNhcmUgYWJvdXQgdGhh
dC4KCkFsaWNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
