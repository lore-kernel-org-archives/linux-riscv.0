Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7BCC27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fwQd8zYCyN975o5vG3edH4iJS35V5RCUD23kOQsywvk=; b=Zwl2lljL7nZn4w
	XLezxBYv2qLjXq7gcfmcPyDrtkZP1pqk5ZT6I8Vqt1AiVVhP1jl9/HkqOBnOQriOkUbNIIDKGY30u
	CZi/AwoalX/csVkScH7sDxpcdZh8H+6t0Sz+eQ/qyYhZjBXPLqbvDqHuRGSQCCucnm0zF1i07arvz
	rqHvIK+Fjt9NcnSkUDVD6JF0BzZ8UmCtLa8NFh+Fnl/HhpAgREAVe4GkBcGZdXdjwMUg7vhIcMVBL
	dAhw6Jry1IHQwsJQ6UX4qaoBxs36kqBzBcUlSzOjHWLygmblM81dL2o1VqXXUJxMPAI1kK6aY/wmr
	cK9wV9KQFwwT/gcj0teQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnjb-0000000HQOA-27hs;
	Thu, 13 Jun 2024 16:55:35 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnjZ-0000000HQMv-0CrY
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 16:55:34 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-375bb80e5b8so159165ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 09:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718297729; x=1718902529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWJSlhXJZjDMSCMnTQA00bSbjWncOwR7ylrZc7+pEaA=;
        b=rgsGR99ZL6Vja0CNcBm81sG/pzNqVx58aYMoNcgMPgBu84j741WSaOG7qUDtaG7mDt
         6iRnHMloLCIJpmbSPCqagdftUjMupuCFL7U18PjtOAfCnujODUB5v+L4VNMXyQACB9EU
         IPDk7L7x+LE8/7u9zVCOqIYSvb/2NgtqF6z5RFZrLMp/D7YaHgcaWgHILKxzZpHwf3k9
         g41tR6lC7mx37lbYFk8Qjl4u6Pc3QulA1cce2NWvZVjaXUmo1NDW8e02gfvGTeITET+5
         DE51ZKIiUid3H1I3FAL9Rq1keqDbw5Y8vWAYXz7qyZaBCqSyvwKFM+3eqv2i4Mah2DJp
         8QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297729; x=1718902529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWJSlhXJZjDMSCMnTQA00bSbjWncOwR7ylrZc7+pEaA=;
        b=UDKSohPUYHaxr78yQ20DakVzAgpDDaavct9WZzdYrAHc4uKb8QaCamXqUgrz5YL9y6
         cTSXDDdOpDYlps4PBxqYJMTzXaJ85YJ1xhBP9SD8YFQbZvKnUMsIorDQIquFWr52grrf
         8G2B4tVG6foD3zdOt4Za1mK/OVNEBXPKIjI6ajHj92DW3IEqII9cl2nuVv8bp1oQRG7z
         ztvOEfnanWAEMpCIjrRgVcSwgasDX8203u9QH3VQbij3KEJ/M5xPNUpO2rVTDQ6kRjTw
         urumXB/5wmHVEbii9PNW+mz/DnR4nld+HM20hj11VFNvFo1fG/+xsuQAZQ7EoHcvM8nj
         8jUg==
X-Forwarded-Encrypted: i=1; AJvYcCXozohrbwU63DmGp4e1MpTZPeIfDTjmzo5sh65G0AwknVlyvc9GgPVbb7YL0OM7AV2ZwsBioHwJSZPP8pz+fj2/2sgwUYzMLr3y0/rJy/Ty
X-Gm-Message-State: AOJu0YxyHgiy3yy78T47CEBBSPogbntuXzLiP+GdhFP9SowwcVPNq1vq
	oxn//EhBrlThq1ugJ/Dg2dMste598ZtYd6bEQQrpndMbl0MkmvKm8ICyvjjvRCzfDXl5SmKAyq5
	6CR0vLakVhlD1U1H6SZyvwXHM1FHTfAMwtAdf
X-Google-Smtp-Source: AGHT+IEbV5W9YTxiRK3k2IN1ZbR6jqHOarV+ilqCrXqD33J5SW1vK2cChNhC77IN9rseAhu6xuSDZG9NUZAelZRNrZU=
X-Received: by 2002:a05:6e02:2689:b0:375:bb49:930d with SMTP id
 e9e14a558f8ab-375d73f700fmr2575015ab.23.1718297729092; Thu, 13 Jun 2024
 09:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240612183205.3120248-1-irogers@google.com> <bdf1ab6e-b887-4182-a0ae-7653bd835907@arm.com>
 <Zmr_CfhYsvKePZFt@x1> <9814866a-8f9d-4d82-ad2d-4b36203aa196@arm.com>
In-Reply-To: <9814866a-8f9d-4d82-ad2d-4b36203aa196@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 13 Jun 2024 09:55:17 -0700
Message-ID: <CAP-5=fV9DW0X+BD0qZEkHJg4-JrLD+yttqQm1mw2NKAY19rPZA@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] Refactor perf python module build
To: James Clark <james.clark@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Terrell <terrelln@fb.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Kees Cook <keescook@chromium.org>, 
	Andrei Vagin <avagin@google.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Ze Gao <zegao2021@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, coresight@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_095533_142700_356F63EB 
X-CRM114-Status: GOOD (  18.32  )
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

T24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgODoxMOKAr0FNIEphbWVzIENsYXJrIDxqYW1lcy5jbGFy
a0Bhcm0uY29tPiB3cm90ZToKWy4uLl0KPiA+PiBSZXZpZXdlZC1ieTogSmFtZXMgQ2xhcmsgPGph
bWVzLmNsYXJrQGFybS5jb20+Cj4gPj4KPiA+PiBJdCBkb2VzIHJlcXVpcmUgYSBjbGVhbiBidWls
ZCB0byBhdm9pZCBzb21lIC1mUElDIGVycm9ycyBwcmVzdW1hYmx5Cj4gPj4gYmVjYXVzZSBub3Qg
ZXZlcnl0aGluZyB0aGF0IHJlcXVpcmVzIGl0IGdldHMgcmVidWlsdCwgZm9yIGFueW9uZSB3aG8K
PiA+PiBnZXRzIHN0dWNrIG9uIHRoYXQuCj4gPgo+ID4gV2UgbmVlZCB0byBmaW5kIGEgd2F5IHRv
IGF2b2lkIHJlcXVpcmluZyB0aGUgJ21ha2UgY2xlYW4nIDotLwo+ID4KPiA+IC0gQXJuYWxkbwo+
ID4KPgo+IERvIHdlIG5lZWQgdG8gbWFrZSBpdCBzbyB0aGF0IGlmIGFueSBvZiB0aGUgTWFrZWZp
bGVzIGFyZSB0b3VjaGVkIGl0Cj4gZG9lcyBhIGNsZWFuPyBJJ20gYXNzdW1pbmcgdGhhdCB3YXMg
dGhlIGNhdXNlIG9mIHRoZSBpc3N1ZSBJIGV4cGVyaWVuY2VkCj4gaGVyZSBhbmQgdGhhdCB0aGUg
TWFrZWZpbGUgYW5kL29yIEJ1aWxkIGZpbGVzIGFyZW4ndCBtZW50aW9uZWQgYXMKPiBkZXBlbmRl
bmNpZXMgb2YgYW55IHRhcmdldC4KClBlcmhhcHMgd2UgY2FuIGRvIHNvbWV0aGluZyB3aXRoIHRo
ZSBGRUFUVVJFX0RVTVAuIEl0J2QgYmUgbmljZSB0bwpkZXRlY3QgYnVpbGQgYXJndW1lbnQgY2hh
bmdlcyBhbmQgcmVidWlsZCB3aGVuIHRoYXQgb2NjdXJzLiBJJ20gdXNlZAp0byBkb2luZyBsb3Rz
IG9mIGBtYWtlIGNsZWFuYCBkdWUgdG8gc2FuaXRpemVyIGJ1aWxkcywgc29tZXRoaW5nIHdlCnNo
b3VsZCBwcm9iYWJseSBjYXB0dXJlIHRocm91Z2ggZmVhdHVyZXMgYW5kL29yIGBwZXJmIHZlcnNp
b24KLS1idWlsZC1vcHRpb25zYC4gQW55d2F5LCBvdXQtb2Ytc2NvcGUgZm9yIHRoZXNlIHBhdGNo
ZXMuCgpJIG5lZWQgdG8gY3V0IGEgdjIgZHVlIHRvIGZhaWxpbmcgdG8gYWRkIHRoZSBuZXcgYC5h
YCBmaWxlcyB0byB0aGUgY2xlYW4gdGFyZ2V0LgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LApJYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
