Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65890EB48E6
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+yR9YkU0iPQoug1OP0tP2+wCTfkjHI0DLqdfnX6Y74=; b=39aoP45tYHT2s8
	mfe5fSW5ziXl3trR6dLJBpmiDiFe6AN06AVrERDgf9k/zDfOemDkOEs8bdtBO8E8OPegI+4/AJCKE
	B2796MUiOPO0j2jsOzZA4hiTvHNNYaUW5BuMnftRMTI3rDsOevgWcj0mCDEnr98R5Eos0m96J0JU/
	PHO05CrAhRxzW81homHFq7/wvkyzjX0gNTNTozmnxaBjPphzod+qOHyY+JCezxdUy/4VN9GxkteMR
	al9PShu2ufVL2z4b2KgN8ae0xp7viOhB8Yueqe7hrfV/o9VH1icMUohE9dslRF0h9PIJStw0H2R6W
	6u0NQKLl0prlUQEurwmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSRl-00000001mOZ-229k;
	Thu, 12 Feb 2026 08:53:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSRh-00000001mOA-2uG7
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 08:53:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48068127f00so27847785e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 00:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770886388; cv=none;
        d=google.com; s=arc-20240605;
        b=Cj/1i+4D6L9QpwagLOA+H7yyqFNeLQP13R4y2z8ecPINtoFeXu8Iz3lFDUGDh4//59
         UjA+oagSCo8BQIRBdFA8ILuOnwcNK2cCCmPmnC7+hipNbYROdkgOJ2PRHjwMf03ZYuEb
         yGk6clA+D13BFAw7HoMBWimkegqgmW/9uCYuz9dkOyjPG+EYGV0v9AZmX1LOSmyObBnM
         OHD5E5y8zbDKpsLhdhKn/RFshbi3UO1T4BRiXA5VO5cRYg8e0DFTSt4H12BuP2OtcBRm
         CLam+xAh7pZ9KqiOXVX1VIwBeAgh+UqOLWGkSCdlLz6oc1ox0Rky92KsUrezLD6QAHlR
         XOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
        fh=npTx6VvgPYbRpwpZxuQqtMSfGrGYfHuPYT3R2RNmY20=;
        b=cTRsWLn0YlmX54w0WLgdpFVHJtnyS938RUJ2nvh8k64eGPCalB/14zytEKgg+kbO6Y
         OlmLoq7upmNxQs+my8tFsnOY5yNEQQ6ubfO/TzzwV7KKp0eyawUdchEOQRuSiGcWZ+QN
         e+ozFiTGGcNCtJ0bQgLTXb5Ukr1rds2LbuWTPTTMqKn15cC3ADhBQFEjvj2Z1HvkxdFO
         Vs577wn6I68CnPLtY10ibzchiSy0YQiffJMuRAkF3wcss07fUP77S3QAjv8GyNlQgHj/
         C8EQ0sUr6OvmGhRGK4c/3/H7ZPoPh6fdZqAUl6xf1Nek/TzSXeEMvND2oPpLrO+hCxKw
         5JyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770886388; x=1771491188; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
        b=lkEfwlEdTiJycgEPwuMM3nrgs6E0x4zCQZCjpWPXbSCBu2uMH9Tv1/2t/zn1wfIKxF
         DRkJAdiJtX+QuWjnF2Vc+P4S3KXXVn5oiqw48vbAY38o6mkLvwNbh39seF72IS0YJcW3
         PPB2f1YYxJDYZDN1rP1CMFhRG0Dw1w+lmBfVEsKEoDQinWIxlnHjZxhNK8um0gmrx3aC
         8b6g28jrU/tGdcOAZU/acOBbX1MGsBihjhyeGn5j59DrfkXx/gTYrZWrNycMjinTYver
         LPp5e7UQz/JF0GYxa6KufkLfv0qztHPmlsFIFqWgGg+o5Vzita2aDu2FHr7i9HUWRCGx
         RrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770886388; x=1771491188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TjJc1hC/5UC/8qaSpl2SUPNI7E36+gR+pLp/bXphh9g=;
        b=ehJuUh1FR4sPVAUWJ5HQ3oMfmC2G/unrEpjNa6OwvuYFEnsUxOqJegJlDnI1Irv90V
         j3E4mWffd2RDY3o7GmzJ6+98WzNruh0zx8ehm+WL2kIwXF4R5o3KI7TET8gfGeHAypKv
         lYmJSziZfY51/cM73tt8hv7JHBUT/sNFNI8WbVxY690cxKTLHWItPK7eJBCur4kAAmha
         lDQbYJL68v8HFbTi8jDRYIFJmBmXlz7F8HxMM4wWONXS7qo4h1Bjk6hP2e8UK2X8VQPH
         VcCusYQri9Mjz7lstoM+ougjfGHqIBxLHoxxC/yRRtLIAdhjidrhuEK/BgbLppP4guN7
         lvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU94iU7EfR95kmYn29xDbb3OPy3Yq8Fjp8avVSJCec55wlMSlR1rWTVlSXYvq6jOXFWUKnCjp6PHIHqPA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9HoPqTJnzldmuRlSwreQvcK93b3o0bvixL4j7pRYjfPC5/MYB
	QYq4W4XgXy6iSYeADeRiFTQSlKjqBQZq7CS1Eyp3y58t15gw3ezfKsAUk4ZkcpusbHf8JMeBskP
	QFD7yhPa6F4mLSzvksEWat3mvF3Q45IRi9M8nnhw5
X-Gm-Gg: AZuq6aKqcglZ1Hygr/VJpddkGdMjAT8s0hfaij8bjFg7nmhRyYo1YoMdGb1HFvNIQAS
	mCNHk2aIkJkZzTHQpIHmUEMeI71C4V4RypTaiidTPA2/jkc3QOKOkIDugQT1V1zsPpZ2F+i2Lp8
	lmjYozN5AluhkthYtAXbZsOwXp1sHE6+hYnt0vovBl2y7cC8ThLcBKJJhG7yQ/a2ctxWXcrZpV/
	mADViL5nYs6YjBb8lIz7+lpoVmoDXobYgYXjHwGmY8/lc9y0kiI/blANGs2OFGxgIujB4xZKgts
	x9bMsOEDDTZiRaRaBtCPzNYTb1RQxkvLTh0jCg==
X-Received: by 2002:a05:600c:a0c:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-4836715615bmr17466765e9.22.1770886387455; Thu, 12 Feb 2026
 00:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org> <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com> <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com> <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora> <20260211-flawless-feathered-boar-0b87ad@houat>
 <DGCAAE4YEDLO.299F5M641E90B@kernel.org> <20260212-obedient-faithful-koel-d8aaf6@houat>
In-Reply-To: <20260212-obedient-faithful-koel-d8aaf6@houat>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 09:52:55 +0100
X-Gm-Features: AZwV_QhgJnsuH1kZOi2k-I_YfnetcmGyr_LHt3UuVnGbxnKyOqJh-xBICfTM86Q
Message-ID: <CAH5fLggWdQ04fVjmcNcNYvUTx1zTqU10usFbypPV+fe3OpwbkA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_005309_772951_75ED521A 
X-CRM114-Status: GOOD (  13.63  )
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

T24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgODo1OeKAr0FNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gSXQgd29ya3MgKnRvZGF5Ki4KClRoZSBjb2RlIHdlIGhhdmUg
dG9kYXkgaXMgYm90aCBzYWZlIGFuZCB1bnNvdW5kLiBUaGF0IGlzIGEgYnVnLCBhbmQgaXQKKm11
c3QqIGJlIGZpeGVkLgoKPiBBbmQgdGhlICJvaCBidXQgZHJpdmVyIGlzIHVzaW5nIHRoZSBBUEki
IGlzIGtpbmQgb2YgaXJvbmljIGluIHRoZQo+IGNvbnRleHQgb2YgdGhlIFJ1c3QgYmluZGluZ3Mg
d2hpY2ggaGF2ZSBnbG9iYWxseSBiZWVuIGluIHRoYXQgc2l0dWF0aW9uCj4gZm9yIHllYXJzLiBZ
b3UgY2FuJ3QgYXJndWUgaXQgYm90aCB3YXlzLgoKSSBkb24ndCByZWFsbHkga25vdyB3aGF0IGlz
IG1lYW50IGJ5IHRoaXMuIFRoaXMgQVBJIGlzIGZvciByZWFsIFJ1c3QKZHJpdmVycyB0aGF0IGhh
dmUgYWxyZWFkeSBzdGFydGVkIGxhbmRpbmcgdXBzdHJlYW0uIFNvbWV0aW1lcyB3ZSBtZXJnZQpB
UElzICpiZWZvcmUqIHRoZWlyIHVzZXIgbGFuZHMsIGJ1dCBub3Qgd2l0aG91dCBhIHVzZXIuIFdl
IGdlbmVyYWxseQphcmUgcXVpdGUgY29uc2lzdGVudCB0aGF0IFJ1c3QgQVBJcyBtdXN0IGhhdmUg
YSByZWFsIFJ1c3QgZHJpdmVyIHRoYXQKdXNlcyBpdC4gSXQncyB0aGUgdXN1YWwgbm8tZGVhZC1j
b2RlIHJ1bGUgaW4gdGhlIGtlcm5lbC4KCj4gRWl0aGVyIHdheSwgSSdtIG5vdCBzdXJlIHdoYXQg
dGhlIHBvaW50IG9mIHRoYXQgc3VibWlzc2lvbiB3YXMgaWYgeW91Cj4gd2lsbCBqdXN0IGRpc21p
c3MgZGl2ZXJnaW5nIG9waW5pb25zLCBpbmNsdWRpbmcgYXR0ZW1wdHMgdG8gY29tcHJvbWlzZS4K
Ckl0IGlzIHRydWUgdGhhdCB3ZSBhcmUgdW53aWxsaW5nIHRvIGNvbXByb21pc2Ugb24gdGhlIHJl
cXVpcmVtZW50IHRoYXQKQVBJcyBtdXN0IGJlIHNvdW5kLiBJdCByZWFsbHkgZG9lcyBub3QgbWF0
dGVyIGhvdyBjb252ZW5pZW50IHRoZSBBUEkKaXMgd2hlbiBpdCdzIHRoaXMgZWFzeSB0byBnZXQg
aXQgd3JvbmcgYW5kIGRlY3JlbWVudCB0aGUgcmVmY291bnQgd2hlbgp5b3UgZGlkIG5vdCBpbmNy
ZW1lbnQgaXQuIEknbSBzb3JyeSwgYnV0IHRoYXQncyB0aGUgd2F5IGl0IGlzLgoKSW4geW91ciBs
YXRlc3QgZW1haWwsIHRoZSBzdWdnZXN0aW9uIGNhbWUgdXAgdG8gbWFrZSB0aGUgQVBJIHVuc2Fm
ZS4KVGhhdCdzIG1vcmUgYWNjZXB0YWJsZSwgYnV0IHNlZSBteSBvdGhlciBlbWFpbCBmcm9tIGhh
bGYgYW4gaG91ciBhZ28uCgpBbGljZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
