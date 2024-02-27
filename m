Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586DEC5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H34DPRNoYzB0sKuVPbIskrPdiJ9yxrGmOw3YX2bsfjM=; b=WaHy92xXM/qh+z
	1NbiV3WJtq1Qg4gvSszvS/VKcg6jvkz5picpmCr3fF23ndWk/XZvuKt7JhUofJf+yH3xjR3pCj9C1
	xDcXQ/naP/EfFs8e+FDgiRjkJOw1ce++T1ZT/oKJSG77dHvDToIVjqCzzD9Zb9yvXS5MAtnKP8DRO
	7xPkT4sLbcbM0kcTV31A3Th8OWysN3k7Z7Jhfvt3Nd+PKgfITZBzOgm1OSAs3Bcp7/wdyFDPOAMy7
	bkhbyp7pEqwHf15G9GQJnvUsF21aHat5sRsPqnij/rymUaq6WU2A7VUmf6jaSh6aB83v8WSepB/sv
	mqptbaKr/XvJMQ5aM+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewLg-000000056xV-2COo;
	Tue, 27 Feb 2024 12:14:16 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewKY-00000005632-1rIb
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 12:13:08 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-299dba8fd24so2252808a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 04:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709035984; x=1709640784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNfuFy5Ba+D5qLkPXV/F9tZVKt/ke8CC3TLHGloyd2k=;
        b=gQ4zLWBhoRla3Yt4wll8tOV4HdF39TOAZp6Zv0l4gzb7YLFqHdyxp9zztidO3RSZd4
         SNx8fpnBKPdc9UZ+KEZhe3alaq/RxL2QiwJin0/8c9tKjQP0CsXEiZfWqXC6ocOdZCrU
         q45Zelk8qQKl+0pW/85oEazUVOZQD87gMu+rkuzSk0kJVhL5qzNIV/AubyFM6FyRig2i
         KBZsojEaP9u++K9zD77fcCKqPu8S5uWAKlV4ym72urCXRurNvUODOF99DyOiaQ0rSGZn
         I8DBJlL0EVqVfMFBET6uqdm2xRR0vcZ9uD87IQezVQ+blsc6sHl11YUQHcL+8uNynFUK
         vbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709035984; x=1709640784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNfuFy5Ba+D5qLkPXV/F9tZVKt/ke8CC3TLHGloyd2k=;
        b=H0JNI5Z+9Z8iHaihSpWgHooyiuHZFGA4VAlPh0l3dqAzsryXzuTZ4OhKrJme4P3/45
         J0swStkkw0qCCBcIX4NQHBw+BiigNQ9dn2JXpeFbpfkqjsyqUANtwwLHbZI1MchbHErc
         g12cXCibczq7iiyD3nIz3Eetmwk2IqoPjXIEgmAobEHcyl/E+4v1BBnccNeJY1fWUtcJ
         NPEl0RE8CUyotjM44CBer6jzVZ/3BNlxlnxU81zQZPVqFopUtnLTG8XOAl1pZhqJF96d
         kenxunhFAWQLAHnTWePmaXJZN0sdTaW2JGGYIlNByCrVm6wN5d15G27Pkd3FB7evIfHo
         bxqA==
X-Forwarded-Encrypted: i=1; AJvYcCUDCyuUuZjOdaHAH0he86lFhDjofHNh8M3B4uLd689AtGUgcFqGoPGPBD0ZfGiAQI6fjqUMNz+9ng8kOvKIVj4XB9hTvO30qA0oReVlJcIP
X-Gm-Message-State: AOJu0YxAggW26/XCXz8TBAyXLLyvD2LmmT0pdRtLch1MYRHnhZ4UMWPk
	+wmLOhkS1FbIwqDggVoWk4Dv7v+U3joRsJ12XFCO52It9hSfEFezA7HXLUg7XBhLV0YoHGjDa1Z
	NWRai2yi9j78ioG2xsdA1sh3/7T4=
X-Google-Smtp-Source: AGHT+IEZrxxC5KTd1mUmyNpa02ckU0dvc0XT6naKz7W71hSie5HLJAV5L6JVbDjYli/t99gdzmOA0c0J+BbxKw9TRZg=
X-Received: by 2002:a17:90a:1b85:b0:299:6a7f:3f55 with SMTP id
 w5-20020a17090a1b8500b002996a7f3f55mr6019384pjc.45.1709035984277; Tue, 27 Feb
 2024 04:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
 <20240227-resolved-deceit-4a59a6af5b71@wendy> <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
 <20240227-glove-underwire-f562a56cf2c7@wendy>
In-Reply-To: <20240227-glove-underwire-f562a56cf2c7@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 13:12:51 +0100
Message-ID: <CANiq72=f03_bw9B8ww8UxHkVyP2F7ZPyvC+KWCyhO3Nk1yqdaw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_041306_651167_268D99D6 
X-CRM114-Status: GOOD (  11.06  )
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

T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgMTI6MDXigK9QTSBDb25vciBEb29sZXkKPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IE15IHBvaW50IHRob3VnaCB3YXMgbW9yZQo+
IHRoYXQgZWl0aGVyIHRoaXMgd2FzIGFjY2VwdGFibGUgZm9yIHY2Ljkgb3Igd291bGQgYmUgdjYu
MTAgbWF0ZXJpYWwKPiB3aXRoIHRoZSBzYW1lIG1lY2hhbmlzbSBhcyBhcm02NC4gUmViYXNpbmcg
YWZ0ZXIgdjYuOS1yYzEgYnV0IG5vdAo+IGFkYXB0aW5nIHRvIHRoYXQgd2F5IG9mIGRvaW5nIHRo
aW5ncyBpcyB3aGF0IHNlZW1lZCBzaWxseSB0byBtZSwgc2luY2UKPiBpZiBhIHJlc2VuZCBpcyBy
ZXF1aXJlZCB0aGVuIHRoZSBvdGhlciBpbXByb3ZlbWVudHMgc2hvdWxkIGJlIGNhcnJpZWQKPiBv
dXQgYXQgdGhlIHNhbWUgdGltZS4KCklmIGF2b2lkaW5nIHRoZSBgdGFyZ2V0Lmpzb25gIGlzIHBv
c3NpYmxlLCBkZWZpbml0ZWx5LgoKSSBkaWRuJ3Qgd2FudCB0byBhc3N1bWUgaXQgaXMsIHRob3Vn
aCAtLSBlLmcuIHRoZSBuYXRpdmUgaW50ZWdlcgp3aWR0aHMgeW91IGhhdmUgaXMgNjQgYnV0IHRo
ZSBidWlsdC1pbiB0YXJnZXRzIHVzZSAzMjo2NCAocGVyaGFwcwp0aGVyZSBpcyBhIHdheSB0byB0
d2VhayBpdCB3aXRoIGFuIExMVk0gcGFyYW0gdmlhIGAtQ2xsdm0tYXJnc2AsIGJ1dCBJCmRvbid0
IHNlZSBhbnkgb2J2aW91cyB3YXkgZnJvbSBhIHF1aWNrIGxvb2s7IGBvcHRgIGRvZXMgaGF2ZSBp
dCwKdGhvdWdoKS4KCihUaGF0IGlzIHdoeSB3ZSBzdXBwb3J0ZWQgYHRhcmdldC5qc29uYCwgc2lu
Y2UgaXQgZ2l2ZXMgdGhlIG1vc3QKZnJlZWRvbSBpbiB0aGUgYmVnaW5uaW5nLikKCkNoZWVycywK
TWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
