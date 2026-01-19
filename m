Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DFAD29C2E
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XoGE3C7tkAipt13/kuE8hSnx1IqLJDu/g2TFT27l+28=; b=rllKBbnBWBwhfN
	6ChrKF5Jod4KBWmFOtaPk0a8ZfgBDpKGobm2Hfi/fFTBDHNV/yNRygC6Un2IgDuZugdzxiYetn4eQ
	nGidWji1m29AYCcQvmVuBJkCSFkEKdQ63Hw49a6EikouqzwsC0+K5R1pHyF9+QWcrL3zJsuMn5nYk
	TQfr72P3/I68fcRKFBKPZ1mI4DVjaEJWOZ2+wozVUmQbV86YeH9DJ90jhpegocLjNL86fqSLwi/PM
	yW8lz7Qcxn0zz6z3sq+gE0iuns06zqxpUtbimt/CmYz4CzIhn1kKgtinIm2zgBgW/sdoCfBeKESMZ
	p1oE4YiXOqVNCX6+hUxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr5x-00000002LL6-3lOa;
	Mon, 19 Jan 2026 15:23:14 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr5o-00000002LJS-20cK
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 15:23:08 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-12339e20a87so169282c88.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 07:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768836175; cv=none;
        d=google.com; s=arc-20240605;
        b=LRjLFti/MBUWlDBsr4O098Eqk0wb+foTXUuzjraXUqq9Gi8xj56GajTEPnxEpc2xzN
         2KxDO8NCh/BzX+25npy3iT+ePmDlkh6BiwdOpjqzJd3EYxiQkp140muv1bocSuEk7LXR
         DC5NtHILU5rTPVGYjbqxD5ylcOcEf4y0BHQ3xx925KG0IWdsP/6ziVIoED8JAH6nkI4s
         kX5OjmoEXufEKxD6FzbFadbzujMIuHtNchmvyIEj8qOxxdkTsMG45jeYszZxHYlUJQSu
         s23do7rngp1xbUvh1/Gw92OVafq6p6/QULW6LYeXFyiKtyGkzWfeW9GDIgtkqAxrUcv6
         5E8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
        fh=Ab53t6nScjzgKc5rAXQ2dSjuI7/+01COJSlr+VAVARo=;
        b=c//tZeQdbqJG0VZM5Osbk1TkwGPU6X951dHNuI4foBeUeaGRt0vgf5lre+cVp5Sqo8
         2czrZ8UxPpVjKqkxoeozJNy5FjQYUt+EGnGpKtmZ1qIvUgdpXVB29c2as9wseHf9Id9o
         1nvc1gmckjU7ALRhhNkWFYZaodWr83szP0AUwlCjMsSk9zJDq7T+m+k2AcZlmPrIG9VF
         E8V1tgAKjvygF7XdUlg6MEpgpfTHEl2HE/ov5dnEqkXahZZST4u5LK+16OL36XBwZOBW
         CGd+s6L7XJl9XA5JJi4RVkunFxV+p+1FFuOq2k+fim9aAgbrkJUdIy5xa0LAZZlbqYbF
         OB6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768836175; x=1769440975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
        b=gE7dJE9kRpd0sd62oUDJXx+pj+Q4f4eJKF2sCIFOH5n6Iz7zln1BnSuXuL5qHRZ03D
         dnZxa6fs/YY7hCNwNOxE9LK+mTII+sl38/a2i2PTkGjRIn+tL+tbWSTaeqKboEScIvg/
         k0AFvsATDqbzSWaTXTkEYfnpZ6yBtH+6N0l/N8xEnUjsu3s796zvmK7X1soTOHVmLjkK
         NNwt4a2NAfTi7gx2nIZ64z/2Lr6rVVNMDjENcVtt8mQLvkL+EgblZJUJBASuhko8QWfx
         pDjJnKrEuhd4Qjt+Io/aEssGuwJbgKNpAqedbJ0isrWuAF8j1YYkVQ+CcIop9WfZ5HHw
         ORBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836175; x=1769440975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tR0gCtypqd1iX1iRkqWIYioksTf/njgA2aZ4h6BcDxM=;
        b=JBCmz0NT6OGhSyWnKOY+QfWX/cHQ54BU9VdPDJ/QEzeLA9h3kdiY4oDvwJxrZpXkS3
         01pS9hALdZZaNSpI6Kxt8Z/BPPXEbPa0x1eGAtnB8KYj8G+OD8Dstzjwd+LPNVP05kh6
         /LuywuHG2LFAD6BLmydVR0syDN1XoLSqNzvrHUbrbsi1eohSlhsHAQu2+hqHIey1KCWE
         jqbzDuhdI1LLN96CqxPu/4te7elB6aAmdrCCKGkLpwqIUHQk8H4hXxBWZjbgYYvW1jjq
         LzKSFK1RtOCE8niXL8KCtQzdN4XLyAsG5OgQ+5V3BcDBCR94qIMx2ZTxZT0/1V02fsBa
         VEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxrE07veVst/PBo7mATB3rL5CZiayR+5RU1zRLeOrdbB0sqitn+6ApMyJt4yxvZ7j3X6EDz7w4L8Hk/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBwMqRRxcNiSSSFiiAnfZnV9cL2c41kHLFHyE1ovqZibYxpDDs
	9VsCUvKJffJfKV9Hvggtsf3cwrxIfbvdvgKXlloUlmm4X5N29VuVsLEeHpuerHbNj+8l2H9RSIb
	iJRct8uin+yDl58bcDm3COJaer6EoAbM=
X-Gm-Gg: AZuq6aLAPaTd81+HGcYAhk4evX7OIVrXFSOZk2ftqnx+ztE5FzY7/KxbMuQQ8HpFq0W
	YVKBnnmByeJexi87GXSKZrmvhCJcF8u4iXUujUkt7lbkf+79wj2LEcHTab6UK6XjsceJyR3ifor
	b/Z1oBm4FZpioH+sW/bRDsKvavfpHxXFEMDuaD0kpFkEvKWeQc2Gy5LO4MAMIjRR+gmfz6o5+kp
	MjPQVBhlI34hurwzVQOcbRsufmQzB/tpPK2uD2oEaWZqIjsuJwfm/r8ETy7dHAiUdXyDfkmcPcr
	pzm9Vpv2QPX0L+7v5H7drc61RpZxEx71MhKe74uLcHwqKou84FG83iZzw7PfOwJiaeTLyu95BYd
	DoydCQvgwkE5T
X-Received: by 2002:a05:7301:228e:b0:2b6:f613:74e6 with SMTP id
 5a478bee46e88-2b6f613797fmr27366eec.4.1768836173425; Mon, 19 Jan 2026
 07:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
In-Reply-To: <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 16:22:40 +0100
X-Gm-Features: AZwV_QgNN_SRIlYoHUy-qlXXeVjMEAqzZugkTtOGHbXvqJ3qT7hNtgfXtF3Q8KU
Message-ID: <CANiq72kcRQShDgMJKZ+ekUEdP1T6Jr=4PDiMJCqnQjgCQEK_eA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_072301_015608_18C6B689 
X-CRM114-Status: GOOD (  10.74  )
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgMzoyMOKAr1BNIEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8u
bmV0PiB3cm90ZToKPgo+IEkgZ3Vlc3MgaXQncyB0aW1lIGZvciBtZSB0byB3b3JrIG9uIGEgYCNb
c2VhbGVkXWAgbWFjcm8uLi4KCi4uLmFuZCBwZXJoYXBzIHBpbmdpbmcgdXBzdHJlYW0gZm9yIHRo
ZSBsYW5ndWFnZSBmZWF0dXJlLi4uIDopIEkgYWRkZWQKaHR0cHM6Ly9naXRodWIuY29tL3J1c3Qt
bGFuZy9ydXN0L2lzc3Vlcy8xMDUwNzcgdG8gb3VyIHVzdWFsIGxpc3Qgb2YKd2lzaGVzIGF0IGh0
dHBzOi8vZ2l0aHViLmNvbS9SdXN0LWZvci1MaW51eC9saW51eC9pc3N1ZXMvMzU0LgoKRG8geW91
IHRoaW5rIHVzaW5nIHRoZSBsaW5rZWQgY3JhdGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHdvdWxk
IG1ha2UKc2Vuc2U/IEl0IHNlZW1zIHRvIGJlIGEgY291cGxlIHBhZ2VzIG9mIGNvZGUsIHVzaW5n
IGBzeW5gIDIuMCwgd2hpY2gKc2hvdWxkIGJlIGZpbmUgbm93LgoKQW5vdGhlciBvcHRpb24gaXMg
YSAiZ29vZCBmaXJzdCBpc3N1ZSIgb2YgbWVkaXVtIGRpZmZpY3VsdHkgaWYgeW91IHdpc2guCgo+
IEkgd29uZGVyIGlmIGl0IG1ha2VzIHNlbnNlIHRvIGFkZCBhIGdlbmVyYWwgYEVycm9yV2l0aGAg
dHlwZSBmb3IgZXJyb3JzIHRoYXQKPiBjYXJyaWVzIGVycm9yIGNvZGUgKyBkYXRhLgoKU291bmRz
IHJlYXNvbmFibGUuLi4KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
