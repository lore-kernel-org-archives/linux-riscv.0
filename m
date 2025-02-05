Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC22CC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 05:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYXKHe8LGMy6/dc8SIUPOJu2Fa5wYIuzWA2kNCKrfkc=; b=1xF15OtD/Z0bz5
	iTv+2xOja5LSJB/hHGzW6EiMqvK9zh2pOpOLSTnJaA0FlOVA2+AmkusHnJ6hHmBM023N3++xJhSRp
	iusPMYunxIIkwOOElxklEEMKPX05B2yq1fUQe9Fm7/nImR+jA3ZLU9LCgjVSnnUe3E5NHZ34Rt/Ub
	nYQXrU5Pxs3r3aL7tfOuSuI/lPsnsfZaBGwqfY0IdKVF9a/PGrNeoqBZ/eS6notT8czK90qRm81gm
	MPs0Dm+UAAv9nWbMAsBE4MtNQoujGXPbv/0rzBcuHFLb2t9iQ13vfHqAG2LIe83YPd4BUjBhyiov6
	/j8IRRMISSwrXHByCE6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXWW-00000002JSi-31rR;
	Wed, 05 Feb 2025 05:00:28 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfXWU-00000002JRl-0qmq
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 05:00:27 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a814c54742so271645ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 21:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738731625; x=1739336425; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBrAJ33Lv27IH622MIOkF0t5tIX46ic8QrDeWtn4wec=;
        b=tCc8VVcfuwIS707N5aS+3EiwoXDzEsXiOY7xuv6Wrn3/exl9D0dpCkQXbK7yLylZ+s
         Xnh3rvaFq9asOZH5F8hrmNOOfNvH/z4PQHFL8uhkatoNcBuSc9W1Kv4UWpr2YcZ4j7i2
         A+os1XoN/0rrgLsRwsfZTHqYAJvPsFJ9HB6JkxMrbRDMEX9K8x19/k5XWU2TKGVvihmD
         kQ4XNFumDIhe1z/f6qsa0fb+AWIX6ECA6qJjIPp+BnPhLyb2U+RWzNqkjokmG8d70O0x
         tgR5ywjCAznN2c1w62UXopJVsT14seBQUtw59m9dhKWMB1I0zhfqDTdcrKgnumkpoLeU
         mfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738731625; x=1739336425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBrAJ33Lv27IH622MIOkF0t5tIX46ic8QrDeWtn4wec=;
        b=c2mfWoAliMZdVUCWgFg8lQI8o6H2GyGGNlq6JU6d79z/yyPMhKem/HhCVICyOS/tpm
         ccbD0xNIQ5xVRtpZLi983GodorK0VlqP8vBsCWnN0IITSkMA9+xhPvFxvzv06C62/lKW
         XUaMSzVl6Gvhtu8ehbT/lGwcUPvr0MepcZOuhlxKxPaYh2bCYprKqEiUldBgWV5BMWhF
         4a8kkJbOq0No+bjjJroEvG0bigg0ailJfHWWH2B10fyhZY977QFXRgGdpL0stXk9sXxy
         2V/azsifOWPKylfMAdyiiflbken3AeJg/gYohVJmjRjuiLEr//OWbpORhldKTGvgcFVP
         9VAg==
X-Forwarded-Encrypted: i=1; AJvYcCWLtgoYZS7/vCXz/U7Y3p4hdKzI4yQfpft/iFJgE/KVKEr011+7k6RQkobs8wgL8IEcaqq63kqn2W6ulQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk2smm1bFUMkYZk/cbmBOctGL6w9S2vOUI6G11FT5ZwgXgOlLl
	ME8yxkiT+qWfkmG7qPsuh794MWNKk+URrNnUr/uEhoTLevHgARxL1Uxiq6WD789xGah6x1NmmbT
	sJR3PxiW00nhcwGlW6o4PBsqhDDkN+rgcu7GO
X-Gm-Gg: ASbGncv8qRLjGDcrLG4KqF7ba3/VxsQcBjypnwc1aETqrBtYMNBwXzQmdTXiXJkwuO4
	ZO8LmmqvkwCqi6b8+4g+N8IAQaXR5AfB930XUUa4zRwzzn1BNEtjXHCH2bNEG/te/AT0FKXjYZg
	==
X-Google-Smtp-Source: AGHT+IE5v6UIxUtbhZWXvQ6xeQiRfsd1Lh1y3K7nKT+DdV2MV+Ch6CX6fJX9kXWxtmkarMn0roBxr/1rIM2Ik8IIu/M=
X-Received: by 2002:a05:6e02:1f0f:b0:3cf:c98a:ceba with SMTP id
 e9e14a558f8ab-3d03fc6611dmr7494995ab.22.1738731625326; Tue, 04 Feb 2025
 21:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <20250201071455.718247-3-irogers@google.com>
 <CAH0uvogeG9rUw+1huquE=8fEq8AdJaSygS94G8a05=cHckjndg@mail.gmail.com>
In-Reply-To: <CAH0uvogeG9rUw+1huquE=8fEq8AdJaSygS94G8a05=cHckjndg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 21:00:14 -0800
X-Gm-Features: AWEUYZlxJYAftveNvjFByQ6RA0wq7gWZe-nwQuI2bmCaSivCz6TrVnDN2aRhlBs
Message-ID: <CAP-5=fX1bePwr5QGZQAMxWv1zvBY3dxOhbMd0H5UYQDXMrSKMQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] perf trace: Reorganize syscalls
To: Howard Chu <howardchu95@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_210026_244988_1B722B43 
X-CRM114-Status: GOOD (  15.42  )
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

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCA0OjEy4oCvUE0gSG93YXJkIENodSA8aG93YXJkY2h1OTVA
Z21haWwuY29tPiB3cm90ZToKPgo+IEhlbGxvIElhbiwKPgo+IFRoYW5rcyBmb3IgZG9pbmcgdGhp
cy4KPgo+IE9uIEZyaSwgSmFuIDMxLCAyMDI1IGF0IDExOjE14oCvUE0gSWFuIFJvZ2VycyA8aXJv
Z2Vyc0Bnb29nbGUuY29tPiB3cm90ZToKW3NuaXBdCj4gPiBAQCAtMjEwNCwxMSArMjEyMywxMiBA
QCBzdGF0aWMgaW50IHRyYWNlX19yZWFkX3N5c2NhbGxfaW5mbyhzdHJ1Y3QgdHJhY2UgKnRyYWNl
LCBpbnQgaWQpCj4gPiAgICAgICAgICAqLwo+ID4gICAgICAgICBpZiAoSVNfRVJSKHNjLT50cF9m
b3JtYXQpKSB7Cj4gPiAgICAgICAgICAgICAgICAgc2MtPm5vbmV4aXN0ZW50ID0gdHJ1ZTsKPiA+
IC0gICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihzYy0+dHBfZm9ybWF0KTsKPiA+ICsgICAg
ICAgICAgICAgICBlcnIgPSBQVFJfRVJSKHNjLT50cF9mb3JtYXQpOwo+ID4gKyAgICAgICAgICAg
ICAgIHNjLT50cF9mb3JtYXQgPSBOVUxMOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBlcnI7
Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgIGlmIChzeXNjYWxsX19hbGxvY19hcmdfZm10
cyhzYywgSVNfRVJSKHNjLT50cF9mb3JtYXQpID8KPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBSQVdfU1lTQ0FMTF9BUkdTX05VTSA6IHNjLT50cF9mb3JtYXQtPmZv
cm1hdC5ucl9maWVsZHMpKQo+ID4gKyAgICAgICBpZiAoc3lzY2FsbF9fYWxsb2NfYXJnX2ZtdHMo
c2MsIHNjLT50cF9mb3JtYXQtPmZvcm1hdC5ucl9maWVsZHMpKQo+Cj4gTWFrZXMgc2Vuc2UgYmVj
YXVzZSBJU19FUlIoc2MtPnRwX2Zvcm1hdCkgaXMgY2hlY2tlZCBhIGZldyBsaW5lcwo+IGFib3Zl
LiBIb3dldmVyLCBucl9maWVsZHMgY2FuIGJlIDcgd2l0aCB0aGUgX19zeXNjYWxsX25yIHByZWZp
eC4gSQo+IHNlbnQgYSBwYXRjaCB0byBmaXggdGhpcywgYnV0IGl0J3Mgbm90IGluY2x1ZGVkIGhl
cmUuLi4gTmV2ZXIgbWluZCwKPiBpdCdzIG9mZi10b3BpYy4gVGhpcyBwYXRjaCBsb29rcyBnb29k
LgoKOi0pIFNvIGlzIHRoaXMgYSByZXZpZXdlZC1ieT8gV2hhdCBhYm91dCB0aGUgb3RoZXIgcGF0
Y2hlcz8KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
