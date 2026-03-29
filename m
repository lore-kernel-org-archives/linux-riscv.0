Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450A9F3D5FE
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Mar 2026 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlsQZltPoyPLsTHu62SQveO9e6UZxpFdNOEIulAQpjk=; b=aJtm/DcWkbjiZA
	yFTmADwF+H+4HD0j+az8Jf1a5PqmYb9x6LABLKeJ4v8TeXwLdF2xIhaHa3zkYvnUsWRraRpAQqX6U
	RLv55dlL95mn/sG7IaQbrPFE43GGhJ1c0Wkaub8GtZx0zGe7YI3tqi0BmRIjtMYp2QH/mIB9dyK8X
	hUcHiBgGhaEMN+Oooj2WvxpI/HKjDSpv2OcDJkZNN1P8Lyuo5ILRSggFR8zXk4QQmW6GcMj83I7TG
	ZcMKcsRRH5CEx9PdZbJNnzJRMUFMz+8SWRFhLcS+UWeoPz5JN/GX8azxnIoLGHxcWyCPBMncnP9cQ
	e1GCo2csJGIORSgywCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6opx-00000009tXR-1ZAy;
	Sun, 29 Mar 2026 12:01:49 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6opu-00000009tX3-3j1q
	for linux-riscv@lists.infradead.org;
	Sun, 29 Mar 2026 12:01:48 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2c18771d582so77453eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 05:01:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774785705; cv=none;
        d=google.com; s=arc-20240605;
        b=fvaSZNpG37iDeTpQ22SqB5BsfRHwdiq9PO/kt0Sss3AG1VW/bi8B5ccQYNz7vnbX7X
         gEocIQNE5VMHmM4DkhgJtX8zdgHC2Bkjjt9U21ATGcArjFHdseOiOd2h3+5pfSxoequk
         5WKDlS4Kwh1eVxG9RVMtNHAhafXISzPNuX1sFMNFW6gq60iYgeg/0LIndJ/+g5ppSr9U
         r5SmZ14lfCQrixqichsL5x+k5RMcj+D71CWyqkHIqrReb+3QazOd8XujHI+gRc3p64ic
         JnX7WtBl1j+KctRlC4WyNZP9jy44jIuKANgWVFZS0cIPuv0LQxu69EIDI46rP5SJOmDr
         Jsww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S3RIszMlDvasNp1X3hRY0FzGfoJ2iZIuNPkp3yOr+9Y=;
        fh=BTakuwqegscfNdJtBIoMRYY4QKlHCyHuad7le8YBuK8=;
        b=WHK496R8If0/zABh2uuxkzCuvSHPndpvdeDibQdmOppiGENUXCZr1MGSggzlPURr+W
         WfJMNs/BnRGM0sP/JOvUHDUA5jTZ7Cg7SXFaEfreb81eySYPe2HvMiMNtRsUdKoBcIr0
         C+itvFwQAl+9rgr06dFma5unYwG1pR8LALlGStBfpAs5lf2Mnzhf1XIVLXaJatibDSbv
         06FZ3i82RQCcoKJIy5Lj7axaOxVHPbUESAZAWEnzhzuu/LlX41swsxbubCIcRkAYTZbi
         s23e8m8oJo5bXOEMAbo66D+xsU9buB/11P7FtuTAej08t55o7Ph7P0PwS6GAscRehDKE
         ErXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774785705; x=1775390505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3RIszMlDvasNp1X3hRY0FzGfoJ2iZIuNPkp3yOr+9Y=;
        b=fjqDUCIIQWb3xr4XIbPp0YOhzPlytcLlhiGCExDitYmSPiK9cTD+9sFbWLgIenRQsB
         t6QgNjXvrONSaaBlIlB4xMDfEiJUzvb16dMpgU4gOhwNik9BdmLq+SwmJqSKSLLwzt5s
         7woxDovJsVJJHIok9ume21P2RH4DwOwPvKGAb0YfrTmSfjIIdV04vbAoO7edfJfUxSeF
         QPh90WL5IrlmkVm9ys2ihdc+qGeel+Q52A1lQuhj7TI/AC6yiB9+0fdK7rZNTRl/NPtz
         qTXbyR3fwnNOAlw/mto/PLAxL/BBhHaKiVGAqhU4ThFHKjZBWPMbSQZP/BBspfwOT1Y7
         Le7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774785705; x=1775390505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3RIszMlDvasNp1X3hRY0FzGfoJ2iZIuNPkp3yOr+9Y=;
        b=oBiLJhsMrY8wG2tpw4YBkV2YM1nlhMN679UpPTFTBEJo2Zc3ULqLjR+fGv9DZrln4x
         lMUkEVtJUnWnF/sJ81bUvRnXgRHHtK6yK9S6x0wtd5LuGUCZVuGecBfqH2dz7YrPffcp
         lxTsAsmmHPMFSCZ8oQ8LkRpxqVlFgCjvsR6EjisZzWOW6TGyN8KsPMbMwT4V4TAP6Jyz
         a6Jqcjjyylyo3zWHfLEzQ9R+kqYHQwPzSxMO1fYTU62u55tHFVDEeHbzWoRX6+LoJ9il
         CfNFcM4laxjjJJH1ukkq2fVnKNj+HWQbDQywjpPOyXQ1QzsDZMJfHlUTxQ6FnGkThM8K
         52nw==
X-Forwarded-Encrypted: i=1; AJvYcCVdhwe7o5NWw2VSvIKjgOu5J0uN3p/WHXKrFwXt+wROuTXYBlu34oqxOfnp8LAcGcRyfoH+pr/47xLSfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQadqHACZMrb+SF6pu61wrYiTxfKWDvlZTr7txnLN57r1rNgSC
	dTIBjjGp9BAd/xcoyamoo109pW5T1e+ASZaBhMLs5up9ui+Xy5qtK/oS1017ONO7hMfXbQn52xr
	UOi9Ct2jpHfnG+RJYXXRs0KiArWyg2dY=
X-Gm-Gg: ATEYQzzS9Oj4pSkvAK7P5GjLBHCeH78FJjyYKhVp/wkQAD+ZRBHQipzhYVaj7t0rnhn
	i5VZvfuX4II5BKs+OfsnpY1PT7x6FkBsfU56ZzqHMPlIEA1ytwk4xe7nQk5PZ1ylf3y4IXiBpIs
	V+ZcVK2oXNrBqH5i17xSFgYeLgtwngGSLDyHDFIKiz7ZLPmMbr0evQT9LFxKlRfmrKeBCaIDm6Y
	+oySKLQcH5KLnjFYLLzUvw9WgCEMcKrFWPnH+uOV/m4nyE7y0ZFt3TTl7Ln37ca8Ybfqg8FASlt
	skCWZG3EBJLr/m77efIkNCWxCs76XWcNZ//H2QuTcxBny/Iu/TspHSNq5Ql/CupcaJrkNzVWiLf
	XRpaappb6bJWZYbeExSCk5Sg=
X-Received: by 2002:a05:693c:3008:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2c185edf989mr2246595eec.3.1774785705374; Sun, 29 Mar 2026
 05:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260121183719.71659-1-ojeda@kernel.org> <aYmgjEWaLrdsubKM@monoceros>
 <CANiq72kk_UJVNbQ3aKuV4_LPFm-a0xjZqZyk57ZpkHp8yX8jzQ@mail.gmail.com> <acjVGgDLnYAg1UAc@monoceros>
In-Reply-To: <acjVGgDLnYAg1UAc@monoceros>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Mar 2026 14:01:32 +0200
X-Gm-Features: AQROBzC4ArywLCQm9oPk0DTBlwHpJWFCQIFrS7hccPJYCVsbdcvLs7tOCip51GM
Message-ID: <CANiq72kWu-XmFbYEGZFgTere14WjRS6JPS2vBPLB+hizi3tbAg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260329_050146_931945_437205E5 
X-CRM114-Status: GOOD (  10.17  )
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

T24gU3VuLCBNYXIgMjksIDIwMjYgYXQgOTozNuKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEhtbSwgSSBndWVzcyBJIG1pc3Nl
ZCB0aGF0IGJlY2F1c2UgdGhhdCBwYXRjaCBpc24ndCBvbiBwYXRjaHdvcmsuIEkKPiBkb24ndCBl
dmVuIGZpbmQgaXQgaW4gdGhlIGxpc3Qgb2YgcGF0Y2hlcyB0aGF0IGRvbid0IHJlcXVpcmUgYWN0
aW9uLgo+IChlLmcuCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4
LXB3bS9saXN0Lz9zdWJtaXR0ZXI9ODM0NTcmc3RhdGU9JTJBJmFyY2hpdmU9Ym90aCwKPiBvcgo+
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1wd20vbGlzdC8/c2Vy
aWVzPSZzdWJtaXR0ZXI9JnN0YXRlPSomcT1DTElQUFklM0QxJmFyY2hpdmU9Ym90aCZkZWxlZ2F0
ZT0KPiApCgpBaCwgeWVhaCwgSSB0cmFjayB0aGluZ3MgbWFudWFsbHkgaW4gYSBzcHJlYWRzaGVl
dCAod2hpY2ggaXMgYSBiaXQKaW5zYW5lLi4uIDopLCBidXQgdGhpcyBvbmUgd2FzIG5vdGljZWFi
bGUgbW9zdGx5IGJlY2F1c2UgaXQgYXBwZWFycyBpbgpDSSBydW5zIGV0Yy4KCj4gQXBwbGllZCB3
aXRoIHMvYXJpdGhtYXRpYy9hcml0aG1ldGljLyBpbiB0aGUgY29tbWl0IGxvZyB0bwo+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3VrbGVpbmVrL2xpbnV4
LmdpdCBwd20vZm9yLW5leHQKPiBub3cuCgpUaGFua3MhCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
