Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF1BC02187
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jan 2025 19:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJsDReNf3c7yU7OpApPvEjBObtNRQPpQrK+uGQzF7zE=; b=Ofoa1cZfaCuE6a
	v/1txmgbsVgaPwkoHTRsUgaiFBEJLnNhJp+mwHMe/bwVmXEZLvVzohNZOgETrwhjU/rEAky9gz+mN
	jZMJsiooOImGadnBIymmJ5jffzsiSycQSsL3NfJxsDP/k/FfZoCslausiW/nrlwr5sjSPLOIpBbMO
	N0yC/lHTxwYVvJO+7L7YWCoB30S+IV2bPsNN/UlTOpDJE+KQqsClijD3zq5miIUIK7OnSZ362mhHZ
	wJs9R8PrMtH0iv4QU1uCp0qXo0KQnsrEDs1flet7Kbr/zZjUmbIaJzOjfTnfGU61yr3w6M4XGxzzl
	H11++1VTmLrM1e5D02fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZEWY-00000002rGx-1kiU;
	Sat, 18 Jan 2025 19:30:26 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZEWW-00000002rGZ-1Uu1
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jan 2025 19:30:25 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-2a7ccb2c618so1790573fac.2
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jan 2025 11:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737228623; x=1737833423; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XudhSWAvZ4YT/KhxY2io+bn4N8i8bH3pRXDmhdFc2NE=;
        b=QuFZpjnmGmAh0zfmPbhqDHbuwZZRmoLx7P1whwGqmJ9uJC1IVSyI33JlK385QLEr1h
         y3NmTpe1/w01HYdjfp9gkJ/j+47+iG9ni/iqu5V9iN2xid81HMnWqTODXwtnPOB1OsPp
         MAoJQxeBPXD30H09VGZpB1HqKaGIuPtx8pmX5Xr/wKgztQBK6uA9lHvCdCWRgOqyK+TM
         gWXp2afX/vbvMwcc5qfasf15LjUYj8IKfhvuzW/vuIckB9b6WGIOSS4qdr0kUeF3R765
         +btqjmEnV3PkVo34hygF6jpYnj3NpRZvS7uUkuZ7u89KjXZs7iQjXsEaWe4ARLIINPcC
         y1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737228623; x=1737833423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XudhSWAvZ4YT/KhxY2io+bn4N8i8bH3pRXDmhdFc2NE=;
        b=TmEA8HVeZTZLswfjAi6M+EN9b/hZAXyVy5lFB3KY0nosyJgMDoVe4GhTHl4t0w6Y2l
         WbgI0WIS8w3dzTNoHWZXE7XuMfHwvEeAstdrpaYPiNfCUs0AINw2J2wzQAuh8K6tNfTJ
         d7bQDRXB/oTIK6DDVlFIWaSwxHOlC5xkYhXtuPyQN6BfoJf5XL+KlVBwDrEKU8iLNw0t
         sogMZJFFTwUrd0zXHXis9/bWBsiIaKW80fhrLJgY++sI9wPV41FLhv/g1mbUxkaRDfHf
         5aGE2uVjGRkVSLZDvbHcjDtJe2mghS+p7+1khqhbXpIJ/icWtZBoLKD7g3Izry2M9jO/
         3gZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV46vb3yUnry+OBaUq17PVpCw/ZuwX3Z9mzMatKR9P+wY12jkq0ooTqjN84fVVxN5bSrbp2U4E4aUabQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1PyC980Tq4HcfKJTZTA0KbNJlF9g5Y7qrdzeVU/r7jk7kCHuR
	DP15N5XL8eMwe6WaTXJbNmXjdmOAa04JyKcS95Wu3MMtoBoyjSIXD/OnfvncntyIZNO+xyUwKXW
	YY/9WQjyp9b9TnXpxvMBViRygaKQ=
X-Gm-Gg: ASbGncuRbHeelMCnP4zfEia+c1t/OK8H86AyT2nL0a/LWEPzthCEj4eafxvRA/l2Utu
	JMC5UCaAvhGcXwO97Id8FjuEP2zCSROjCRqaeJQvjlhyOGEniJXSd
X-Google-Smtp-Source: AGHT+IGIxxyum97lVqsJU2JiSg8rzYC1MVpm8fLVP8yghfw6kIc2WHm92XgTWytYi9Vp9+cRbh6IKucq7BjDBje3DKw=
X-Received: by 2002:a05:6871:2005:b0:296:dded:7c14 with SMTP id
 586e51a60fabf-2b1c0c7f64amr4567904fac.36.1737228622853; Sat, 18 Jan 2025
 11:30:22 -0800 (PST)
MIME-Version: 1.0
References: <20241125191009.28535-1-advaitdhamorikar@gmail.com>
In-Reply-To: <20241125191009.28535-1-advaitdhamorikar@gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 18 Jan 2025 13:30:11 -0600
X-Gm-Features: AbW1kvaJmwoPluO4VJQNW-d_9KVjwgBigTV-rAOuldu12HByoZfGH9FIQ-tAmOs
Message-ID: <CABb+yY3Qc9G0RZQ8aX8SJhWiWEjOVcAgmB9HKQ9vVN+Lm0=HNA@mail.gmail.com>
Subject: Re: [PATCH-next] mailbox: th1520: Fix out of bounds write
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>, m.wilczynski@samsung.com
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_113024_401885_A920A1C9 
X-CRM114-Status: GOOD (  15.83  )
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

T24gTW9uLCBOb3YgMjUsIDIwMjQgYXQgMToxMOKAr1BNIEFkdmFpdCBEaGFtb3Jpa2FyCjxhZHZh
aXRkaGFtb3Jpa2FyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgbG9vcCBpbiB0aGUgZnVuY3Rp
b24gaXRlcmF0ZXMgdXAgdG8gYFRIXzE1MjBfTUJPWF9DSEFOU2AsCj4gYnV0IHRoZSBgY3R4LT5p
bnRyX21hc2tgIGFycmF5IG9ubHkgaGFzIDMgZWxlbWVudHMuIFdoZW4KPiBgVEhfMTUyMF9NQk9Y
X0NIQU5TYCBpcyBzZXQgdG8gYSB2YWx1ZSBsYXJnZXIgdGhhbiAzLCB0aGlzCj4gY2F1c2VzIGFu
IG91dC1vZi1ib3VuZHMgd3JpdGUgYXQgYGN0eC0+aW50cl9tYXNrWzNdYC4KPiBUaGlzIGNvdWxk
IGNhdXNlIGFuIGltbWVkaWF0ZSBjcmFzaCBvciBpbmNvcnJlY3QgY29tcHV0YXRpb25zLgo+Cj4g
U2lnbmVkLW9mZi1ieTogQWR2YWl0IERoYW1vcmlrYXIgPGFkdmFpdGRoYW1vcmlrYXJAZ21haWwu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL21haWxib3gvbWFpbGJveC10aDE1MjAuYyB8IDMgKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21haWxib3gvbWFpbGJveC10aDE1MjAuYyBiL2RyaXZlcnMvbWFpbGJveC9tYWlsYm94LXRoMTUy
MC5jCj4gaW5kZXggNGU4NDY0MGFjM2I4Li43NTk2MzRhNGZiNzIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tYWlsYm94L21haWxib3gtdGgxNTIwLmMKPiArKysgYi9kcml2ZXJzL21haWxib3gvbWFp
bGJveC10aDE1MjAuYwo+IEBAIC01MzIsNiArNTMyLDkgQEAgc3RhdGljIGludCBfX21heWJlX3Vu
dXNlZCB0aDE1MjBfbWJveF9zdXNwZW5kX25vaXJxKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgICAg
ICAgICAqIElORk8gZGF0YSBhbGwgYXNzdW1lZCB0byBiZSBsb3N0Lgo+ICAgICAgICAgICovCj4g
ICAgICAgICBmb3IgKGkgPSAwOyBpIDwgVEhfMTUyMF9NQk9YX0NIQU5TOyBpKyspIHsKPiArICAg
ICAgICAgICAgICAgaWYgKGkgPj0gQVJSQVlfU0laRShjdHgtPmludHJfbWFzaykpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKwpNYXliZSBzaW1wbHkgcmVkdWNlIHRoZSBsb29w
IGJ5IG9uZSBPUiBpdGVyYXRlIGZvcgpBUlJBWV9TSVpFKGN0eC0+aW50cl9tYXNrKSwgaGVyZSBh
bmQgZWxzZXdoZXJlPwpJIGhhdmUgYSBndXQgZmVlbGluZyB0aGF0IGludHJfbWFzayBpcyBkZWNs
YXJlZCBvbmUgZWxlbWVudCBzaG9ydC4KQ0MnaW5nIHRoZSBhdXRob3IuCgpUaGFua3MKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
