Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81ACEE77188
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 03:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4n6A6xdTLBX+3SYtH29Ht6aDJIjmwxxM9qXNDjdKrs=; b=P28dYnQJ4BU6yh
	DECTeyqzjykDkBI1iBWrCyrVqIXobd0sK2pyCMJ2ttBbgaEKPKU2KeuM1NaY58Q5JIqfEV4naVF1V
	5ePaf8ZIEEKA+GM9QUqt7qb5+E8BN70UY/7HPD/8FjZJC50nXafTra+Hhq8mtYdaUHEmj1FQBCjr1
	QsQ+BoVgMhuWvzukqq/P5fCen9c67Zobbl75aJQjpvKGE8Klax347cGareyDruEHqPox6z57mQBS+
	TaOkfYf42dx4tfNgYgZjPyI8Fyol2oF3q67UMqCKX+a15zC9AYnt04riCgO28PyeJ+N88i9oy/aWI
	72UGFvNqEuKUpsnWc2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVj9h-0000000AZ8v-0vJ6;
	Thu, 09 Jan 2025 03:24:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVj8T-0000000AZ1z-3HqW;
	Thu, 09 Jan 2025 03:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eGnPH54LSRyFRjfMNErtUz4xKItKTGUTuqn1K88a/Xo=; b=UriFXJdUkKSfWwAulEYfK4oOSS
	Dcs968TzMdF6P7h2ugIesWbgh4m+U7s84yhkCPE7YNtg7OBGGRjCgKiYyMIWaW5+Arbi4cU+ZLEkE
	0jkFbycWpXQvWG/chweiBXKy1vycWw03eJutXUgsHBe1gYR+WAkmkb6BiVLjPCYzqYLkwsTyLn5oH
	CBDVrupIqoWbnW0sZcCqH6OWj3rsU/u89hLdXQxXeZaniaisqLYlJtCNjRB52g1WnQxIr9xYEpKSw
	4rVUYfdsYsII5EvCmokCMUXd3aGB+JsoVQeDgoOycOFEM3c9xqdeOfGjH920hIox1McSLnXlc0s/M
	0dBAmbvA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVj8Q-00000009U0U-2gar;
	Thu, 09 Jan 2025 03:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2D5E5C5851;
	Thu,  9 Jan 2025 03:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3FCC4CEEC;
	Thu,  9 Jan 2025 03:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736392977;
	bh=UK4Z7qZ2n3DHOwfe1/RSpWrSJ+hABJq4TrbP8dFCHbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=my1iiEIXhKbbCPWnQayM2Jb/3gnxaDwAXkWHNpWKa+vWn0OkMn3IPlAS/cXTcFJEA
	 nMCEZBQhNKWHHygacyYEY/upkop0UkXwgrqtpm9pZ5kvcMewJSGZumqTNJi/5N070u
	 Y200NC0tYWn3yzZLCr4zNATvv0p9T9e3jxKqlWSAf3diWoxYt4QqEpDcKhz/qlaxII
	 2VQLz3AO4v6GZ9h54B6fZZfPzF6iL0xjqqCGJIoQPHcTDjdXzFQsfpuGbSbTXc88fK
	 wtuOvcgel2cecwFDrYKuTLknwbZOwMyXY/stJbNr7RhTuvPWkcNuxn6vhImsF7KkeY
	 3JNLFfyuMMrNg==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso616885a12.1;
        Wed, 08 Jan 2025 19:22:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVMB9PBSthPyP9jYsqo6/fRUE1TyzkIU3u2X8kkQPOJC9oou1mMUkCOL5SrBnKj7ADLlHY1wa60JhTszEM=@lists.infradead.org, AJvYcCXOFkSlNwl2Q8AFOSlmTaFRN6U10b5xMYmsvyjwFKcC50y/Y4o2F2EtgOhGgoxqt9RblhM4tXqNxylQ91A/7ixJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbUebOnAEMe7n2ZZfQtk2MgfpJ7O3+hvGQlNwuF1QhFMfKT9d+
	8AElS/vIEM4qJQjym8CgrYfUHE2m4prZ5uKWimI8Jv8/wOKGB27mhrciPr9Et6jRkzStcebPDBY
	hLgf51L4xH1tCgwrZAT7ARhECejI=
X-Google-Smtp-Source: AGHT+IF2vfwWk/hX1fppoOgb3+DWHmntV4ZAONyRFvI6o1pxOXRZKk7PnjDU1irlzVBy8ipamhJ7KiIEeYXxp0Ftx84=
X-Received: by 2002:a05:6402:3225:b0:5d3:bab1:513f with SMTP id
 4fb4d7f45d1cf-5d972e178cbmr4906639a12.18.1736392976133; Wed, 08 Jan 2025
 19:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com> <20250108-perf_syscalltbl-v6-3-7543b5293098@rivosinc.com>
In-Reply-To: <20250108-perf_syscalltbl-v6-3-7543b5293098@rivosinc.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 9 Jan 2025 11:22:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQFq41rpBMsEodungBHPbzd2zn9F02fB6dJxnYAr81HJg@mail.gmail.com>
X-Gm-Features: AbW1kvaPnl9RqcyhYmWgfOMmK2I_eaC06_BB36DSFhf4vdK4RFvF9kDCvTmwHLc
Message-ID: <CAJF2gTQFq41rpBMsEodungBHPbzd2zn9F02fB6dJxnYAr81HJg@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] perf tools: csky: Support generic syscall headers
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_032303_037359_31B52768 
X-CRM114-Status: GOOD (  16.30  )
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

T24gVGh1LCBKYW4gOSwgMjAyNSBhdCAxMDozNuKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gY3NreSB1c2VzIHRoZSBnZW5lcmljIHN5c2NhbGwg
dGFibGUsIHVzZSB0aGF0IGluIHBlcmYgaW5zdGVhZCBvZgo+IHJlcXVpcmluZyBsaWJhdWRpdC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+
CkxHVE0hIFRoeAoKRm9yIGMtc2t5IHBhcnQuCgpBY2tlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cgo+IC0tLQo+ICB0b29scy9wZXJmL01ha2VmaWxlLnBlcmYgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgdG9vbHMvcGVyZi9hcmNoL2Nza3kvZW50cnkvc3lz
Y2FsbHMvS2J1aWxkICAgICAgICAgICAgfCAyICsrCj4gIHRvb2xzL3BlcmYvYXJjaC9jc2t5L2Vu
dHJ5L3N5c2NhbGxzL01ha2VmaWxlLnN5c2NhbGxzIHwgMyArKysKPiAgdG9vbHMvcGVyZi9hcmNo
L2Nza3kvaW5jbHVkZS9zeXNjYWxsX3RhYmxlLmggICAgICAgICAgfCAyICsrCj4gIDQgZmlsZXMg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmIGIvdG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmCj4gaW5k
ZXggNDRiOWUzM2I5NTY4ZjYzOGJhMTJhZDY4ODgzM2ZkYjY2MWMxNmMxNi4uM2ZlNDdiZDIxYzBl
YTM5NDczYzU4NGM4MjM4M2NhNWQ0ZGFmNTgwZiAxMDA2NDQKPiAtLS0gYS90b29scy9wZXJmL01h
a2VmaWxlLnBlcmYKPiArKysgYi90b29scy9wZXJmL01ha2VmaWxlLnBlcmYKPiBAQCAtMzExLDcg
KzMxMSw3IEBAIEZFQVRVUkVfVEVTVFMgOj0gYWxsCj4gIGVuZGlmCj4gIGVuZGlmCj4gICMgYXJj
aGl0ZWN0dXJlcyB0aGF0IHVzZSB0aGUgZ2VuZXJpYyBzeXNjYWxsIHRhYmxlCj4gLWdlbmVyaWNf
c3lzY2FsbF90YWJsZV9hcmNocyA6PSByaXNjdiBhcmMKPiArZ2VuZXJpY19zeXNjYWxsX3RhYmxl
X2FyY2hzIDo9IHJpc2N2IGFyYyBjc2t5Cj4gIGlmbmVxICgkKGZpbHRlciAkKFNSQ0FSQ0gpLCAk
KGdlbmVyaWNfc3lzY2FsbF90YWJsZV9hcmNocykpLCkKPiAgaW5jbHVkZSAkKHNyY3RyZWUpL3Rv
b2xzL3BlcmYvc2NyaXB0cy9NYWtlZmlsZS5zeXNjYWxscwo+ICBlbmRpZgo+IGRpZmYgLS1naXQg
YS90b29scy9wZXJmL2FyY2gvY3NreS9lbnRyeS9zeXNjYWxscy9LYnVpbGQgYi90b29scy9wZXJm
L2FyY2gvY3NreS9lbnRyeS9zeXNjYWxscy9LYnVpbGQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjExNzA3YzQ4
MWEyNGVjZjRlMjIwZTUxZWIxYWNhODkwZmU5MjlhMTMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
dG9vbHMvcGVyZi9hcmNoL2Nza3kvZW50cnkvc3lzY2FsbHMvS2J1aWxkCj4gQEAgLTAsMCArMSwy
IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiArc3lzY2FsbC15ICs9
IHN5c2NhbGxzXzMyLmgKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL2Nza3kvZW50cnkv
c3lzY2FsbHMvTWFrZWZpbGUuc3lzY2FsbHMgYi90b29scy9wZXJmL2FyY2gvY3NreS9lbnRyeS9z
eXNjYWxscy9NYWtlZmlsZS5zeXNjYWxscwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZWEyZGQxMGQwNTcxZGY0
NjQ1NzRhOWMwMjMyYWRhMGFjMWY3OWEzZgo+IC0tLSAvZGV2L251bGwKPiArKysgYi90b29scy9w
ZXJmL2FyY2gvY3NreS9lbnRyeS9zeXNjYWxscy9NYWtlZmlsZS5zeXNjYWxscwo+IEBAIC0wLDAg
KzEsMyBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKwo+ICtzeXNj
YWxsX2FiaXNfMzIgKz0gY3NreSB0aW1lMzIgc3RhdDY0IHJsaW1pdAo+IGRpZmYgLS1naXQgYS90
b29scy9wZXJmL2FyY2gvY3NreS9pbmNsdWRlL3N5c2NhbGxfdGFibGUuaCBiL3Rvb2xzL3BlcmYv
YXJjaC9jc2t5L2luY2x1ZGUvc3lzY2FsbF90YWJsZS5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwLi40Yzk0Mjgy
MTY2MmQ5NTIxNjc2NWIxNzZhODRkNWZjNzk3NGUxMDY0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3Rvb2xzL3BlcmYvYXJjaC9jc2t5L2luY2x1ZGUvc3lzY2FsbF90YWJsZS5oCj4gQEAgLTAsMCAr
MSwyIEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gKyNpbmNs
dWRlIDxhc20vc3lzY2FsbHNfMzIuaD4KPgo+IC0tCj4gMi4zNC4xCj4KCgotLSAKQmVzdCBSZWdh
cmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
