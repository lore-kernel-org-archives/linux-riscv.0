Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C96C8303F
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 19:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3UvmRZusic4FNjpGmUBwE9J7MvUw1Lps0/G7TGq9h3M=; b=nvRzHPhglIEz9K
	wgv22X0YYem5Ld5UTj+6X2FzsiIL72NHbxYeis3TU/N2TQzCHhohm5Iy18Ryk8kMExsAUq20Us3qH
	k1viCNGXDNgZUuW75VNXKmRmczp94tDg4pjOA9jQ7NL/r2XwFXA01vlTVWDAgjz6wGycIrO4gMWAk
	MKF/qdo4UqFlmyuYneM0zIu7AIP/wjcEDXWcrMSQOOWeDzd+Kc+imtzY2ksbVgRN+VpBpH6mX6pLa
	KO41MaNg0X0tU9IC41iFSe5QQl/9kmBlquzIk1RhOj9Tg7ZRs44GNqjM/o/L/x18tZ6uKpIbW2S6b
	QyfJXWw6EqcriO2KzLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcYQ-00000009BAU-35EA;
	Mon, 25 Aug 2025 19:08:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqavs-00000008pOj-1Z4v
	for linux-riscv@bombadil.infradead.org;
	Mon, 25 Aug 2025 17:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+ORHuStfojgrwK2UdFk3EZ3mv0VOd3rvM8MRoO+GpXI=; b=KjCp6lUqNBdY4j8dXibjEIVDOy
	H4saZfY4X0vwl0zeuhPCGLSk7TQi5/9x/sTjYADL3Gra9cXCvt2vyM4PaPL4fGHqjB8icsBxLYOiR
	sIhaAYZgbggGLlGXmHjGCQ0bTAgLm7Y5HxnGLN5J9uIi0FCBAmEAHfoJGZL1LAqx1IktutoNRNriC
	wgbDwfbHFE5rgVITENrWBoS1XH80L+GyPB5CZLCf6CzQ05IdqDc8KWnS9NZVS3ruuyzi7xad9in6Y
	nm+IYI7UH0Edy+wAeCLtUI/ztDcIht1tEVjmEwObYQC6LsfC8xaMbBtbuBtGD9C3DQWi+s2Q41UFi
	y5U5BNpQ==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqavp-00000001xlj-0xW2
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 17:24:35 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-24611734e18so11475ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756142670; x=1756747470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ORHuStfojgrwK2UdFk3EZ3mv0VOd3rvM8MRoO+GpXI=;
        b=BDa/QgzM6vtb/ybquDqXevz7UsyyAp2uPBwdeYytiK6Jjy4/j9dg5wjcq2oBrPjz+T
         lA303RrnDB7iRR/VZUpHtJTniReRCtYTXw3LUUEw/pNizeYMAGHAByWMXrY0SOTt4W8F
         ErR/fXQGmdP7N/JgpuoFyB6jhtNLVq4tZpbDf3aQBDhdWHIx73steT9QxI6fPoUakXWv
         mCezo9POZaT4sddxaMu+8HnMCSBULCELulnKY+3hkCtxYTXRb7HxSVhUMDJkL9eoUkMX
         v/HTWxWe0oitve2yVShcemSoiyA8yoU9KKCMyumZopzDW1916ZUZjQ30KTdEo+TRovf8
         R5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142670; x=1756747470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ORHuStfojgrwK2UdFk3EZ3mv0VOd3rvM8MRoO+GpXI=;
        b=WNEL7uBirp32sYx7b6PjxVbS9uLhiDXG7zmV2D+t3Q9to514Xcxs72difWnTfJsU4E
         ChB8IIWifPYnI/F4LU6NkGL7djaNPnBT+iDcgw20SUBhfPqiJsXr4UclKh+fQjQkZ2SB
         Ul8II5qILyvnv8QisEfvWm3Ek5SBJyqkdLl1/ThUizEmmTqE7f2jJBCdBqpUdslHez0r
         8Os26RoX6WBnZAiAa/P0/iCRswKoD/BpX46IgvvvBi8iJgfL9+kI1iywqb90tasoFXvQ
         mzbMZrdxds9bdjuN1AY/GunN/U1afCB1XTz9XhMCBIztDCoJU2YlX7tkNpMFySecSB2K
         J8vg==
X-Forwarded-Encrypted: i=1; AJvYcCXEHb4WdugQnMfLU8tYNYztgeu4d1CL7yVxa8L9xeOls6UEdZT6czVqkIXclp4zVAaJmV45CUACWCvwZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKMMS9Tkv3W3gIfF890AFIArGabRyoit4KpFJjdEl25JgIZjUn
	7yL5Q7QnCfhvkJlhN6ko3H2rsFP/0ETjqCPCUHmt+zcmSkt2HYzkWlf4WfcgxfcBw7OVpmb5lTS
	Nh1QFo/4gs7XcnX/pvQcr4jCx1bpOdmH6Udyhbyx+
X-Gm-Gg: ASbGncvdSo46atSMkUCdP6Bl0aO6U+f+1kgL/t7l1YQdRqZwTMLGz2lWx2kqJ7BUbwD
	qjXeTVOto5Y7iJQPYMEuTbC16B9Xcj9cKlS8gOEe/a+fKSGU9nje9eUWTWFioH7KRtyUw1ME3Y9
	mh25EYxQG/bMVokrFPwqWXRws8RAhb9G76ZuBWW1LwFagjSTN8CX6D8c5AA2Eo8TVnbOokHcxbo
	Bg1QENN1UMGvax5iIJ6SVoxu0kLcYbyPw6dQ0fUv1X8
X-Google-Smtp-Source: AGHT+IFDSFCq0edWCtHzT5OvxvY5tWpWD1aTjc3Lol46yrNUvieLKtXYNl0Pa+8dgZxjSHXFJ/lZHYpA827qlGdI904=
X-Received: by 2002:a17:902:e548:b0:240:6076:20cd with SMTP id
 d9443c01a7336-2467a3cf14fmr5726415ad.15.1756142669923; Mon, 25 Aug 2025
 10:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
 <aJ-ScOp3ZCG6PQmD@google.com> <CAO9wTFj7S7G2bqbiuKbR+o7Y0u1EkYY5GsHasJZLmAo5ZuCx9w@mail.gmail.com>
 <CAO9wTFiJmi7YzeukT0VtnpqcJcE3sSueO3owYUAd+H4wjcYZeQ@mail.gmail.com>
In-Reply-To: <CAO9wTFiJmi7YzeukT0VtnpqcJcE3sSueO3owYUAd+H4wjcYZeQ@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 25 Aug 2025 10:24:18 -0700
X-Gm-Features: Ac12FXxRIuAN942liX6eW3sy6FarCbSuSJ3avU2MB-V3vtAsi5N_-7cGnerDC44
Message-ID: <CAP-5=fWCGa+R1O2sL1anJGznkprQyP2RrsUZfzmrPJ2y-WsEvA@mail.gmail.com>
Subject: Re: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>, Namhyung Kim <namhyung@kernel.org>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_182433_377928_C8CEB156 
X-CRM114-Status: GOOD (  15.23  )
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

T24gTW9uLCBBdWcgMjUsIDIwMjUgYXQgNzoxN+KAr0FNIFN1Y2hpdCBLYXJ1bmFrYXJhbgo8c3Vj
aGl0a2FydW5ha2FyYW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgMTYgQXVnIDIwMjUg
YXQgMTI6MTYsIFN1Y2hpdCBLYXJ1bmFrYXJhbgo+IDxzdWNoaXRrYXJ1bmFrYXJhbkBnbWFpbC5j
b20+IHdyb3RlOgo+ID4KPiA+IEhpIE5hbWh5dW5nLAo+ID4gVGhhbmtzIGZvciByZXZpZXdpbmcg
dGhlIHBhdGNoLiBJJ2QgbGlrZSB0byBhc2sgaWYgdGhlcmUncyBhbnl0aGluZwo+ID4gZWxzZSBJ
IHNob3VsZCBkbyByZWdhcmRpbmcgdGhpcyBwYXRjaCwgZ2l2ZW4gdGhhdCBpdCdzIHN1cHBvcnRl
ZCBvbmx5Cj4gPiBmb3IgeDg2IGFuZCBwb3dlcnBjPwo+ID4KPiA+IFRoYW5rcywKPiA+IFN1Y2hp
dAo+Cj4KPiBIaSBOYW1oeXVuZywKPiBGb2xsb3dpbmcgdXAgb24gdGhpcyBwYXRjaC4gSSB3b3Vs
ZCBhcHByZWNpYXRlIGFueSBndWlkYW5jZSBvbiBmdXJ0aGVyCj4gYWN0aW9ucyBuZWVkZWQsIGNv
bnNpZGVyaW5nIGl0cyBjdXJyZW50IHN1cHBvcnQgaXMgb25seSBmb3IgeDg2IGFuZAo+IFBvd2Vy
UEMuCgpDYW4gd2UganVzdCBtYWtlICBUWVBFX1NUQVRFX01BWF9SRUdTIDMyPyBUaGVyZSdzIG5v
IHJlYXNvbiB0byBhc3N1bWUKdGhlIGFyY2hpdGVjdHVyZSB0aGUgcGVyZiBiaW5hcnkgaXMgYnVp
bHQgb24gbWF0Y2hlcyB0aGUgcGVyZi5kYXRhCmZpbGUgYmVpbmcgcHJvY2Vzc2VkIGJ5IHBlcmYg
YW5ub3RhdGUuIEdpdmVuIDMyIGlzIGJpZ2dlciB0aGFuIDE2IHRoZW4KdGhpcyBjYW4ganVzdCBi
ZSBhIG1heGltdW0gdmFsdWUgKGEgY29tbWVudCB0byB0aGlzIGVmZmVjdCBpbiB0aGUgY29kZQp3
b3VsZCBiZSBncmFuZCkuIEluIGdlbmVyYWwsIHRoZSB1c2Ugb2YgdGhlIGFyY2ggZGlyZWN0b3J5
IGFuZCB0aGluZ3MKbGlrZSAiI2lmZGVmIF9fcG93ZXJwY19fIiBhcmUgY29kZSBzbWVsbHMgdGhh
dCBhcmUgZ29pbmcgdG8gYnJlYWsgd2l0aApjcm9zcy1hcmNoaXRlY3R1cmUgcHJvZmlsaW5nLgoK
VGhhbmtzLApJYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
