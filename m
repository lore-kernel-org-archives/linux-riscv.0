Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64843C0218A
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Feb 2025 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mezI1Z+UjXeoEWLgOqVr3z0geAhlPAEhYLUQBRCU6tQ=; b=jgsBcw2UdJezpFJwWuGldVoG2i
	BvYBsP1+rrbn+zDTesSdK0mjK0VAlLeSd1uNgIZhqoZTdhyHuhCnpHXFgF0M16QbtyWs9SdERaOfL
	YwmNxIRHgEl99F2sgteSKvSxZH9b9ylQvp8FF2w8I7ktNOF4iySolb9Q+XGjdP7j5tJCUkNijTcfg
	7FBmS8uNE0U0QZrLRXDAVQ4zLpOeBMpkizeX4WOWyq+VGO5MZ3qf+UlxHvZaZ5B5g0sTPLrm03cJk
	v5tGEhUpg+YFjzH1z1Y9t4TMxyJ9UOXXbyQ2ZnvWI1ttrcpUT1SA4XfIPvI8kMzSZtObro3ZNFwqu
	j9/hurbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1te9FN-0000000C3mq-2RM7;
	Sat, 01 Feb 2025 08:53:01 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1te9E2-0000000C3hu-0bDS
	for linux-riscv@lists.infradead.org;
	Sat, 01 Feb 2025 08:51:39 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3a9d0c28589so86445ab.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Feb 2025 00:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738399897; x=1739004697; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIefE9I0jaBGB4Y4mTk2FVVd4hcyxumz66eayz6AufQ=;
        b=VyrlkMtuijJQLN3Pk7yA3oOMDtEd83ScsR9oBaP65cQ49QTvrDmaeZxU2ckOebTFtT
         Y6nFaeOrlY/UYMYa/r/cLLT9wCr33snjqfx0abQW6hzQKOz5UOLmJKwcZMYI0j8ad42S
         EA7S6ltSv9P95wFRSC8lQf3ziUt2sMuU3JTAJvg7fXrY1OQEOzWNDQxKtWk7T4wZZf7I
         UyK8Po9naM2lnDgDChNSIXeysGUiEgmYFS0Ssw3LQMDUS2luHQqRzOySdb8TpKjC3tpI
         9j1hNUITeHMv1dZD2xvX8GtGD11/QJWiwMI414PaTET59dE1fpqk50L1Tpay+uv21WOl
         LZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738399897; x=1739004697;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OIefE9I0jaBGB4Y4mTk2FVVd4hcyxumz66eayz6AufQ=;
        b=A3DVwbP9uvFm+mevevRVSThFua6Mo+L2TmCy2sqozpmjazjmE4VTWiqLwfIgyUr2ch
         0L5PAkIAjFSrQhXEcF1LmhM5vEGVQdTuhWyDREhmB/UszbKMoC9gqLlojlOvjOtY59i5
         Y/IE/jrSKMNy/C/sMeWYV5h/JlfEHhRltShELPCRuADOjVW0sUJwfyw9nxFb9l7IjV4Z
         FIEd63b0P+kr2dTregVooscbvubwoUdvQ0abn8KnkWzigUyL4asuEvulXMa7yPeQfi67
         YdyhOqq4XdNDNWkZy3oNVJp/qHEXbP5BaEqx/7jCI1C7CF7Ej6IjABg0JRP52UEULNTI
         Wg+w==
X-Forwarded-Encrypted: i=1; AJvYcCVKisfCGgRP0aqqyy97xjbh4F2715hTAmtbAgRNd4N8u8vlhBl32uG09F5QimBWkSI3dz6CJ04irR85Yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHzS2nTfhT4z2vhzCiKoyjF1CVMEHvd3KsJab8HtNMzCNlfkJ7
	NL0aMvc5nBV173Tel2Ek8l0+3PciIzgRvh7WIWJiLGNOs6EWLvAuP2pFUFk9pt+ijMHBK4C6TrV
	6Pkq9MpUKaayMLdgRJ2GffWdhXCarpbxvcDZL
X-Gm-Gg: ASbGncuEpA6cUQir+RyUbepzbJ6yUWHigMu92KTv+5ULksLA6JYYcsNZ6YKO53iUHDo
	7MSmcrHbPKfp4XfHPnz+lqhu8nDXUhcWOsRZL8mJ9AkX1H53THcMkqv3L1u6230Ue6Jf8Vl8IXg
	==
X-Google-Smtp-Source: AGHT+IFhoRz5P8nIkYHneDkKTVBakh7rtHG1dVw4obSdcvgjm+5z3V7T8nuKUGr47wUBBSm2PXOEjroFbF04NpvDEJE=
X-Received: by 2002:a05:6e02:1807:b0:3cf:c8b9:8826 with SMTP id
 e9e14a558f8ab-3d020178ad0mr2457485ab.10.1738399896951; Sat, 01 Feb 2025
 00:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com>
In-Reply-To: <20250201071455.718247-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Sat, 1 Feb 2025 00:51:25 -0800
X-Gm-Features: AWEUYZlh_7DpL4vGIxHF0oRogbUtw7xXXY8ZKrPktMrlaINtX7JtLXsF90u6VZI
Message-ID: <CAP-5=fVJPAEhvyV_dPHSHKJVeskCf_paFSP6V4EWmEyqACeA-w@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] perf: Support multiple system call tables in the build
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_005138_183676_439EC87A 
X-CRM114-Status: GOOD (  16.81  )
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

T24gRnJpLCBKYW4gMzEsIDIwMjUgYXQgMTE6MTXigK9QTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdv
b2dsZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyB3b3JrIGJ1aWxkcyBvbiB0aGUgY2xlYW4gdXAgb2Yg
c3lzdGVtIGNhbGwgdGFibGVzIGFuZCByZW1vdmFsIG9mCj4gbGliYXVkaXQgYnkgQ2hhcmxpZSBK
ZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4uCj4KPiBUaGUgc3lzdGVtIGNhbGwgdGFibGUg
aW4gcGVyZiB0cmFjZSBpcyB1c2VkIHRvIG1hcCBzeXN0ZW0gY2FsbCBudW1iZXJzCj4gdG8gbmFt
ZXMgYW5kIHZpY2UgdmVyc2EuIFByaW9yIHRvIHRoZXNlIGNoYW5nZXMsIGEgc2luZ2xlIHRhYmxl
Cj4gbWF0Y2hpbmcgdGhlIHBlcmYgYmluYXJ5J3MgYnVpbGQgd2FzIHByZXNlbnQuIFRoZSB0YWJs
ZSB3b3VsZCBiZQo+IGluY29ycmVjdCBpZiB0cmFjaW5nIHNheSBhIDMyLWJpdCBiaW5hcnkgZnJv
bSBhIDY0LWJpdCB2ZXJzaW9uIG9mCj4gcGVyZiwgdGhlIG5hbWVzIGFuZCBudW1iZXJzIHdvdWxk
bid0IG1hdGNoLgo+Cj4gQ2hhbmdlIHRoZSBidWlsZCBzbyB0aGF0IGEgc2luZ2xlIHN5c3RlbSBj
YWxsIGZpbGUgaXMgYnVpbHQgYW5kIHRoZQo+IHBvdGVudGlhbGx5IG11bHRpcGxlIHRhYmxlcyBh
cmUgaWRlbnRpZmlhYmxlIGZyb20gdGhlIEVMRiBtYWNoaW5lIHR5cGUKPiBvZiB0aGUgcHJvY2Vz
cyBiZWluZyBleGFtaW5lZC4gVG8gZGV0ZXJtaW5lIHRoZSBFTEYgbWFjaGluZSB0eXBlLCB0aGUK
PiBleGVjdXRhYmxlJ3MgaGVhZGVyIGlzIHJlYWQgZnJvbSAvcHJvYy9waWQvZXhlIHdpdGggZmFs
bGJhY2tzIHRvIHVzaW5nCj4gdGhlIHBlcmYncyBiaW5hcnkgdHlwZSB3aGVuIHVua25vd24uCj4K
PiBSZW1vdmUgc29tZSBydW50aW1lIHR5cGVzIHVzZWQgYnkgdGhlIHN5c3RlbSBjYWxsIHRhYmxl
cyBhbmQgbWFrZQo+IGVxdWl2YWxlbnRzIGdlbmVyYXRlZCBhdCBidWlsZCB0aW1lLgo+Cj4gSWFu
IFJvZ2VycyAoNyk6Cj4gICBwZXJmIHN5c2NhbGx0YmxlOiBSZW1vdmUgc3lzY2FsbF90YWJsZS5o
Cj4gICBwZXJmIHRyYWNlOiBSZW9yZ2FuaXplIHN5c2NhbGxzCj4gICBwZXJmIHN5c2NhbGx0Ymw6
IFJlbW92ZSBzdHJ1Y3Qgc3lzY2FsbHRibAo+ICAgcGVyZiB0aHJlYWQ6IEFkZCBzdXBwb3J0IGZv
ciByZWFkaW5nIHRoZSBlX21hY2hpbmUgdHlwZSBmb3IgYSB0aHJlYWQKPiAgIHBlcmYgdHJhY2Ug
YmVhdXR5OiBBZGQgc3lzY2FsbHRibC5zaCBnZW5lcmF0aW5nIGFsbCBzeXN0ZW0gY2FsbCB0YWJs
ZXMKPiAgIHBlcmYgc3lzY2FsbHRibDogVXNlIGxvb2t1cCB0YWJsZSBjb250YWluaW5nIG11bHRp
cGxlIGFyY2hpdGVjdHVyZXMKPiAgIHBlcmYgYnVpbGQ6IFJlbW92ZSBNYWtlZmlsZS5zeXNjYWxs
cwoKSWYgeW91IGFyZSBsb29raW5nIGZvciB0aGUgaW1wcm92ZW1lbnQgdGhpcyBzZXJpZXMgYWNo
aWV2ZXMsIHBhdGNoIDYKaGFzIHNhbXBsZSBiZWZvcmUgYW5kIGFmdGVyIG91dHB1dDoKaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDIwMTA3MTQ1NS43MTgyNDctNy1pcm9nZXJzQGdv
b2dsZS5jb20vCgpUaGFua3MsCklhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
