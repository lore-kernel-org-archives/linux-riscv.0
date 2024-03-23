Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2139DC54E58
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 18:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcKNwlkY5Kf8W3/hRWXR97pK3enmauIiS+Lnok2VseM=; b=1+Mz/NkSibepAz
	5BrE1gRqvrLL0yhMyfPpWySZP3z3C0ITfu0J51DSXlbN3wY2vMC4FviHhV6vMdjMWKAxlnOPPBXl3
	kHm3p9P1s78Puher8M6af+VoJ7S0LdHHIZeIG5TCrjGzt7q3ouJN3Le3cF1Wt/GJhSnEM/s/EVkJP
	4iAadjF8+LhACK4JBQzX43FSc8mp0BWNL1LVk09/OzZ2KPvM+//W7UfZBgsPJNfUMksjm7gN1tk7w
	x2PmzxxrmS7Vk5tAChVaqDu8lA0jJ27RMAH6uD9j5DymOUlLQK5ZQoXWdKgeJ7ZMREyKESupVp0Cl
	wmCUmVR0YFFPZFvjihZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro6Fn-0000000AvUW-3COt;
	Sat, 23 Mar 2024 18:38:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro6Fk-0000000AvTa-1kHN
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 18:38:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-341730bfc46so1994239f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2024 11:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711219078; x=1711823878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfH5WGMGx2/rhyl1QkGDZcJNlwpDJH+Q6GuhYoIntBE=;
        b=E1ijsyG+KV23FGp2gDUOHn7WA7rv2GrQ1bA+xPRxvMH6tjq712UK3IK+3SEIx0CO4L
         DQzYZaXKAEdaEOT1KaLk/1zfM+xb5k6tdKgpSxqkKu9ctdBrQWkj1bR7/8W77orU1dpK
         PVqcc/05fT8Zg6LkysnDGJd6S16gMxpU7CVPm22CODbDUdNqxohwLB3AFvNDIQx9vD7M
         GiQIfyO3mKwKJ0e2GY5EqmBIghv7Hb/zGDaE0fIYA4gIsrAMMvxA/Wa0VcjkNHTIMIQ4
         yxFucfwBwS3GbuR1VQ1OlHXVO2HJc1PTcs2iRXpOCCpIzrlbOUU4N8yBx5Yo870wbZIX
         feJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711219078; x=1711823878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfH5WGMGx2/rhyl1QkGDZcJNlwpDJH+Q6GuhYoIntBE=;
        b=XA90BQetXv+2HNfI3HgYfMq9h3A6NRTLNcfOg+3fWFUiSgvtjnhPj1xTE/hx8O9c8P
         7NJ9CZZklRMDSY4j+BdjDILCj4gEBuJ6C8+0KkqKAUmoO5fh3O6HBpEjEreylxoHj7GU
         WQlD2CpKudUzV28RTKv9P9K8iLR2+dZvTTX/kykXpE6F/1xsaBuzTuWHw7GAqaFQ1R7J
         sNOKFwVcsvfgeY8Cp9IjnJ5yU7Z7FYsHMumX5+4KZ9DjDWAEgbCvCR8+8y+2HYcIKPsn
         oSaUxX4KCCkx9Tpzf1VkQa2sTZpaYdoY8TIgZlxGzVXqrWQXYWa3rRYNfwUM6I+28C9L
         FVYA==
X-Forwarded-Encrypted: i=1; AJvYcCV1uCjwfvCxgiiqugsTZq+JyaKLjGeTOB7e8C7lQozICr2bZCkm2ACGrYrjN0SB3jQUw8cOulHTyErtLKEOUgdlFoDmy2iz3qLXyGatmzT9
X-Gm-Message-State: AOJu0Yw8ujyrekYwpWtJmSKrCZqD8GoArfk4xFKAzYxBUYfMMDNU9KK0
	VbLNDp6EUdt95hBPxK63ys+xDGYJhnAlgO41l6bSsDLRTt/e2PK0pb6m1gKyHhaFZIlmEUjx5rs
	1B1jCq7GkZRQEga5EWI0VgkNVxPE=
X-Google-Smtp-Source: AGHT+IEsIxO0glIvBi1dgQLe0aNKeZmhmgRSkvuB69Irs9ZeionhCzyCfv4nsPLzOYyQEumbSGQjon4EjFDDweSh8Ro=
X-Received: by 2002:a5d:6b0d:0:b0:33e:1ea:2eeb with SMTP id
 v13-20020a5d6b0d000000b0033e01ea2eebmr1950375wrw.67.1711219077568; Sat, 23
 Mar 2024 11:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240323154652.54572-1-puranjay12@gmail.com> <20240323154652.54572-3-puranjay12@gmail.com>
In-Reply-To: <20240323154652.54572-3-puranjay12@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 23 Mar 2024 11:37:46 -0700
Message-ID: <CAADnVQKQiG_mmWFUa5Jzt1upCTOQTOGQP=h98z9Et8VSwm=L_g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf,riscv: Implement bpf_addr_space_cast instruction
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, bpf <bpf@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_113800_482232_311AC7A5 
X-CRM114-Status: GOOD (  19.76  )
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

T24gU2F0LCBNYXIgMjMsIDIwMjQgYXQgODo0N+KAr0FNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmph
eTEyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBMTFZNIGdlbmVyYXRlcyBicGZfYWRkcl9zcGFjZV9j
YXN0IGluc3RydWN0aW9uIHdoaWxlIHRyYW5zbGF0aW5nCj4gcG9pbnRlcnMgYmV0d2VlbiBuYXRp
dmUgKHplcm8pIGFkZHJlc3Mgc3BhY2UgYW5kCj4gX19hdHRyaWJ1dGVfXygoYWRkcmVzc19zcGFj
ZShOKSkpLiBUaGUgYWRkcl9zcGFjZT0wIGlzIHJlc2VydmVkIGFzCj4gYnBmX2FyZW5hIGFkZHJl
c3Mgc3BhY2UuCj4KPiByWSA9IGFkZHJfc3BhY2VfY2FzdChyWCwgMCwgMSkgaXMgcHJvY2Vzc2Vk
IGJ5IHRoZSB2ZXJpZmllciBhbmQKPiBjb252ZXJ0ZWQgdG8gbm9ybWFsIDMyLWJpdCBtb3ZlOiB3
WCA9IHdZCj4KPiByWSA9IGFkZHJfc3BhY2VfY2FzdChyWCwgMSwgMCkgaGFzIHRvIGJlIGNvbnZl
cnRlZCBieSBKSVQ6Cj4KPiBIZXJlIEkgZXhwbGFpbiB1c2luZyBzeW1ib2xpYyBsYW5ndWFnZSB3
aGF0IHRoZSBKSVQgaXMgc3VwcG9zZWQgdG8gZG86Cj4gV2UgaGF2ZToKPiAgICAgICAgIHNyYyA9
IFtzcmNfdXBwZXIzMl1bc3JjX2xvd2VyMzJdIC8vIDY0IGJpdCBzcmMga2VybmVsIHBvaW50ZXIK
PiAgICAgICAgIHV2bSA9IFt1dm1fdXBwZXIzMl1bdXZtX2xvd2VyMzJdIC8vIDY0IGJpdCB1c2Vy
X3ZtX3N0YXJ0CgpUaGlzIGlzIGEgYml0IG1pc2xlYWRpbmcuCnNyY19sb3dlcjMyIGFyZSBhbHdh
eXMgZXF1YWwgdG8gdXZtX2xvd2VyMzIKYW5kIHNyY191cHBlcjMyIGFyZSBlaXRoZXIgemVybyBv
ciB1dm1fdXBwZXIzMi4KCkhlbmNlIG1vc3Qgb2YgdGhlIHRpbWUgbGx2bSBkb2Vzbid0IGdlbmVy
YXRlIHRoaXMgaW5zbiwKc2luY2UgaXQga25vd3MgdGhhdCB1cHBlciAzMiBiaXQgYXJlIHV2bV91
cHBlcjMyLgoKPiBUaGUgSklUIGhhcyB0byBtYWtlIHRoZSBkc3QgcmVnIGxpa2UgZm9sbG93aW5n
Cj4gICAgICAgICBkc3QgPSBbdXZtX3VwcGVyMzJdW3NyY19sb3dlcjMyXSAvLyBpZiBzcmNfbG93
ZXIzMiAhPSAwCj4gICAgICAgICBkc3QgPSBbMDAwMDAwMDAwMDBdWzAwMDAwMDAwMDAwXSAvLyBp
ZiBzcmNfbG93ZXIzMiA9PSAwCj4KPiBTaWduZWQtb2ZmLWJ5OiBQdXJhbmpheSBNb2hhbiA8cHVy
YW5qYXkxMkBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCAgICAg
ICAgfCAgMSArCj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgfCAxNSArKysrKysr
KysrKysrKysKPiAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMgICB8ICAxICsKPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9uZXQvYnBmX2ppdC5oIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4gaW5kZXggOGE0N2Rh
MDhkZDljLi41ZmMzNzRlZDk4ZWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dC5oCj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdC5oCj4gQEAgLTgyLDYgKzgyLDcgQEAg
c3RydWN0IHJ2X2ppdF9jb250ZXh0IHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4g
ICAgICAgICBpbnQgc3RhY2tfc2l6ZTsKPiAgICAgICAgIHU2NCBhcmVuYV92bV9zdGFydDsKPiAr
ICAgICAgIHU2NCB1c2VyX3ZtX3N0YXJ0Owo+ICB9Owo+Cj4gIC8qIENvbnZlcnQgZnJvbSBuaW5z
bnMgdG8gYnl0ZXMuICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29t
cDY0LmMgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gaW5kZXggZjUxYjgzMmVh
ZmI2Li4zYzM4OWU3NWNiOTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBAQCAtMTA4
Myw2ICsxMDgzLDE2IEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2lu
c24gKmluc24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+ICAgICAgICAgLyogZHN0ID0g
c3JjICovCj4gICAgICAgICBjYXNlIEJQRl9BTFUgfCBCUEZfTU9WIHwgQlBGX1g6Cj4gICAgICAg
ICBjYXNlIEJQRl9BTFU2NCB8IEJQRl9NT1YgfCBCUEZfWDoKPiArICAgICAgICAgICAgICAgaWYg
KEJQRl9DTEFTUyhpbnNuLT5jb2RlKSA9PSBCUEZfQUxVNjQgJiYgaW5zbi0+b2ZmID09IEJQRl9B
RERSX1NQQUNFX0NBU1QgJiYKPiArICAgICAgICAgICAgICAgICAgIGluc24tPmltbSA9PSAxVSA8
PCAxNikgewoKTGV0J3MgYWRkIGEgZ2VuZXJpYyBoZWxwZXIgbGlrZSBpbnNuX2lzX3pleHQoKSwK
Y2FsbCBpdCBpbnNuX2lzX2Nhc3RfdXNlcigpID8KYW5kIHVzZSBpdCBpbiBhbGwgSklULXMgPwpJ
IHNob3VsZCBoYXZlIGFkZGVkIGl0IHJpZ2h0IGF3YXkgd2hlbiBJIGRpZCB4ODYgcGFydC4gU29y
cnkuCgpBbmQgYSBjb21tZW50IG5leHQgdG8gdGhlIGhlbHBlciB0aGF0IGFkZHIgc3BhY2UgY2Fz
dCAwLT4xCmlzIGZvciBjb252ZXJ0aW5nIGJwZiBhcmVuYSBwb2ludGVycyB0byB1c2VyIHZtYS4K
SGVuY2UgdGhlIG5hbWUuCgpTYW1lIGNvbW1lbnRzIGZvciBhcm02NCBKSVQgYXJlbmEgc3VwcG9y
dC4KCnB3LWJvdDogY3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
