Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEA8EB48F8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VSKDQc2A0uLbX3VTVdai0VpHB8vjOTVmMoT4F16VmE=; b=dPrT83MbYknDpr
	fUb7JDJG+ajLKSVW0otFlKXBJzBx53NRH7giPmZRfiVY0MPijh5gcnLtKg+PAoYHJpizcv0E1lPv9
	YZ7qK86oxlO0YqmYxJmaMLzml93ZrOT/xMANnBb3N26Ea703roS7QAZdvdBld2SCmiU22vlrLPFF/
	y84s2KjroFfdTr2qsv7Ncr5UOwi7w1FJ9f8Ov03ZYeHgz/x0BvNRaAKSf5ro7dsMZ8yxkNAEqnWt3
	6X4ertsJ+o5YO60yLUKizh2RYcOrqwtKJm68IWolVkhk/mS8cLpxFKI7oo77vEDv0nlsRMw8QcnXq
	d9wAYN8AxJiWfbwzZ7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV8i-000000021O9-49lj;
	Thu, 12 Feb 2026 11:45:44 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqV8f-000000021Nh-49AK
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 11:45:43 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-124a2dc92dbso518184c88.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 03:45:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770896741; cv=none;
        d=google.com; s=arc-20240605;
        b=DmwcN1DqzBpr+C45uWlvS4IyiXWVS24XIsX//zbl2uYMumZn1VZz7ABMRO8sHklARo
         jarWouWM1ranp0fkRK01psEqrQWYWT6d71yWoE5xJNEVIZ7fZ4a86m9xFwlJ+h3EEe1E
         eB8QGEyCxIJ6JZh8R5ODAeY0/MyeIMSYGTQKiNnQ/xlzH7oDrwx7L6TgCIXMMChRDgh/
         LVTjipaLjjXui0A6MxV2dRI89Et4DinoRLnITRjL2m+myU1TZXbbLUNndwMc2YPIPO+d
         mixB/gt2oF7Le36U5r6uC0pJHG2viWEzUmehmuixM5rxUORjKGfpUKUCrqafnj0yP0dx
         F0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
        fh=GMArI+Ryi0mHGNOSCUUsBNAS0whapEEMdhsps3psyRM=;
        b=chRA4HSyEXyBOcHFExvRAfYUu6sn78LSPcIKD2Aj+9WE6vdIsRPqFdU7QYj0VU+Isx
         CjOO8eYbAQ35jkS/6tOLi/Z+py3vf/ipy+zlcdNDgtmACHmWUBeMQAwHqiCRzjlo8JMN
         phNifvL4lTTtdGcS8sj0i3dq1bA15McFhzh+pBWmhcE11xlBIZlOeSMU+eXpmyzqkODN
         pV6rNo5yvBL4uhiassRSW628W9WnA5hmBNEUaWxVvjLO1Xkfbc6k6oXEr/uU6mih+G8A
         KOifDiFuXE1tAFmVyY7KLec58QbyNzbtjBglJn2gAr0YMYuwM9hpncj+5cvdq+6BSC45
         tXFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770896741; x=1771501541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
        b=gIveVRXYrQ7797dK0kn9vKpdrH3NnpHVGNGYvGP0tqDkHJ8rhb6qz16ZIu7ifrS5Vn
         Ri9aGtpuSuavqlZ7JQsZhZSYshylWyu5VXTgw1/JiCbYEny1b8jT6na+PeykmdjVPDGr
         l2GrR0Xo0r1bY/nj8iulxs06cWeEDg1KWFtzDkjlRcFs+m6M8Nn14m5Mv16Hcs63R+zw
         zdzXfgn36/oyq7EZ95XzAQlSKTaJdWzNsdcF4VP4WLtQAp+b5py2fAgOmgTre1WeXGh/
         ynxmLcv1CIrle3Dd3EDAZxCEQxUvtVSiDmpPMCT3DUFqA4DHldqTmFbxN9kx5IRj7jkV
         s8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896741; x=1771501541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGVkLIr22yJ6JQpgXmUzvygoH7/3iICzBNHCpv+ndoI=;
        b=fejeCgAlmZX5MiQMMvKfTdnQ8l5TbXm+dp9fn7qEQiUJCMhqKyiCsFhp0MvvIgQcgC
         fuWbaQfricxw8nWBUNEhIbqGgM5m+bKN64WOBXQ/JDGWoafHUaZDNhoN5vZ0VcRujxD8
         M5gepu0sRYspKj7LexnLGVeOvwxOG31mUPBoKRKc5MnDTLELCX92wqa3QVLX5vmErE+7
         4jtVPEq7t/HtapHBnQvMuJ2pdNawFoxu9+YOEgCgYsFy5+9cXdfuUnWL1ymigbGQsHUp
         HV4nlJKxcvvtOtlMgJBFb08bNjAIZWhba0HkhakQ54Mzd2O0dGWmnS+VskPJQv92vLZm
         Owpw==
X-Forwarded-Encrypted: i=1; AJvYcCWSTArEfdpd/qeL/MfO4Khvf+JId5j+o38nFwxBlDnsOmxZ2kG1uXA2i+wtZY4ESdrtSfXl/GeT8M9sEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUXc8ywbKF8qwPsAMBmKO0NqhzUlyUMKcIWV0j/0+Fa7A9/ccq
	NNY6s4mCFSY4GVRZrEWxPs4YkaAQFnZRfDxwxv8GnNvYk72b/djrnJ9hspeGyqLw1RI3znJu3gi
	WdrZeMeozMkvXy0+4j4QiT+esd+zRbdQ=
X-Gm-Gg: AZuq6aIL0QOUYVLFxtoVdy5qUidodAvyDhBjwoFfcGvLN/nOCTucYLKmSrFmxMWRHxm
	P+8vyAcGfNWFMiTcpoYf6hUgMbTxIL71Q2SMc1vXaSW6kbmrMKNFsb/CVhbvKvvBv0cmhgyBJrJ
	usmQldZGAeW35aLKxfbv1iuG1qqWJqVgZnaH3nRLJ9RS/QFjDxYiH56yBvm1N+07R0ru+pnJzJi
	yCh4Hr/gRdsMDbIsxa+nC7Llr30i9uoESuARKnRpcY4/tovPEaew0HMGMpl3+GyaNp4Qj3drD95
	6AZWKBlSVG86Ons1W66nEWvJ0xo07nSl/I5GTxtuwD5W27wAAPoNniglfENMiNzKNdaoR2m56Ri
	q/wQN9KquGtMZkoKm3+yyIa2y
X-Received: by 2002:a05:7300:aca6:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2baa806e40bmr507989eec.8.1770896740603; Thu, 12 Feb 2026
 03:45:40 -0800 (PST)
MIME-Version: 1.0
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org> <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com> <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com> <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora> <20260211-flawless-feathered-boar-0b87ad@houat>
 <DGCAAE4YEDLO.299F5M641E90B@kernel.org> <20260212-obedient-faithful-koel-d8aaf6@houat>
In-Reply-To: <20260212-obedient-faithful-koel-d8aaf6@houat>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 12:45:28 +0100
X-Gm-Features: AZwV_Qgkz-xkhnIAg7JBqdav3KKnsGWyI0KDQ-RkibJi23X0-5wEzPLcw-SuW5I
Message-ID: <CANiq72m67XpoE-M2eiJn7RF3LvxRLKZ17YExJJFOFw+H0Bw39A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
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
X-CRM114-CacheID: sfid-20260212_034542_060730_B5E3E9F4 
X-CRM114-Status: GOOD (  12.97  )
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
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBBbmQgdGhlICJvaCBidXQgZHJpdmVyIGlzIHVzaW5nIHRo
ZSBBUEkiIGlzIGtpbmQgb2YgaXJvbmljIGluIHRoZQo+IGNvbnRleHQgb2YgdGhlIFJ1c3QgYmlu
ZGluZ3Mgd2hpY2ggaGF2ZSBnbG9iYWxseSBiZWVuIGluIHRoYXQgc2l0dWF0aW9uCj4gZm9yIHll
YXJzLiBZb3UgY2FuJ3QgYXJndWUgaXQgYm90aCB3YXlzLgoKSSBkb24ndCB0aGluayB0aGlzIGlz
IHRydWUsIGlmIEkgdW5kZXJzdGFuZCB5b3UgY29ycmVjdGx5LgoKVG8gZ2l2ZSBzb21lIGNvbnRl
eHQsIHdoZW4gUnVzdCB3YXMgY2xvc2UgdG8gbGFuZCBpbiBtYWlubGluZSwgd2Ugd2VyZQpleHBs
aWNpdGx5IGFza2VkIHRvIGN1dCBkb3duIHdoYXQgd2UgaGFkIG91dC1vZi10cmVlIHRvIGEgbWlu
aW11bSBvZgpBUElzLCB3aGljaCB3YXMgZmFpci4gU28gSSBkaWQgZXhhY3RseSB0aGF0LCB0byBh
IHBvaW50IHdoZXJlIHlvdQpjb3VsZCBlc3NlbnRpYWxseSBvbmx5IGRlY2xhcmUgYSBtb2R1bGUg
Zm9yIHg4Nl82NCBhbmQgdXNlIGBwcl9pbmZvIWAKaW4gaXQgKHByZXR0eSBtdWNoKS4gSSBldmVu
IGNvbnNpZGVyZWQgZHJvcHBpbmcgdGhlIGBwcl9pbmZvIWAgdG9vLi4uCjopCgpUaGVuIHdlIHN0
YXJ0ZWQgdXBzdHJlYW1pbmcgYml0cyBwaWVjZSBieSBwaWVjZSwgZ2V0dGluZyBhZ3JlZW1lbnQg
YW5kCmlucHV0IGZyb20gdGhlIHJlbGV2YW50IG1haW50YWluZXJzIGZvciBlYWNoIGJpdCwgYW5k
IHNvIG9uLCB3aGljaAp0b29rIHllYXJzIGZvciBzZXZlcmFsIHJlYXNvbnMsIG9uZSBvZiB3aGlj
aCB3YXMgcHJlY2lzZWx5IHdhaXRpbmcgZm9yCmFjdHVhbCB1c2VycyBmb3IgQVBJcy4KClsgT3Ro
ZXJzIHdlcmUgZ2V0dGluZyBtYWludGFpbmVycyBlbmdhZ2VkIGFuZCBpbnZvbHZlZCBmb3Igc29t
ZSBvZiB0aGUKY29yZSBBUElzL3N1YnN5c3RlbXMsIGdldHRpbmcgYXV0aG9ycyBvZiB0aGUgb3Jp
Z2luYWwgY29kZSB0byBzdWJtaXQKaXQgdXBzdHJlYW0gdmlhIHBhdGNoZXMgd2FzIHlldCBhbm90
aGVyLCByZXdvcmtpbmcgYW5kIGNsZWFuaW5nIHRoZQpjb2RlIHdpdGggdGhlIG5ldywgYmV0dGVy
IGFwcHJvYWNoZXMgd2UgZm91bmQgbWVhbndoaWxlIChsaWtlCnBpbi1pbml0KSwgYW5kIHNvIG9u
IGFuZCBzbyBmb3J0aC4gXQoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
