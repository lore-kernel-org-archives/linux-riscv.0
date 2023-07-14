Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE3FEB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 09:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ItNeDGi1H0RPyiEYSfi2VoUqC9i5F691iYUWz0J920s=; b=X3fL6d/WMvSxPz
	163I6C6HfLoi+U4jDOBKIw/DDJfva7QmhPZaVN6QswwPvlK6v7aPI7T7MuSboVJSvvIdB3uJynyD1
	QKuJjMhs8KxHdvPJt6CIolVDD1BnY/WwCqV4ewXGSiw7ART2CjoL7orB8/BCyoRz+bCqpbdkwjT+a
	U/6HrDFsyYckqZtuJaj2PobnVraJ8m+uFbyRRbSTkpFx5G5Lt2Zri9q0cbcfO/0f7i6iC5vdSCsEq
	+Y+7cGQ4dZEn1qdn6CdyRV3oFFqoMpP7Ja59SthuGKjOXmXC1a5zXdOplPybdOgL2EEARWPxJ6l0s
	JHdSEI8is3krMCKIcw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEmJ-005dE1-0K;
	Fri, 14 Jul 2023 09:07:55 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEmF-005dCY-0g
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 09:07:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6f943383eso24629261fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 02:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689325668; x=1691917668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzynI4WLtBuw1d8m4j6WgZRv2EJK5DJSgflNEDgPfAc=;
        b=IeC4T67kCP+pYnmAmWKq3ZdRuzCxPc8oq3BWChG25r6bWYHzuDoyfrRi9GHWV4EuNv
         cse/ph6ey17vHs/Oht8kGJb1u140M0biadKuB6R+b6tTZzd4eCLeh4M3XHMaNQqQ/tvZ
         5hH1xkdWhGE/JMhxT4YxkiL4kTRihb5q62bv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689325668; x=1691917668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzynI4WLtBuw1d8m4j6WgZRv2EJK5DJSgflNEDgPfAc=;
        b=GGCPji0lOzig4zkLaEKjRBOBcsA1B2SSCIww4p+mZU8lKbRHD3D0/uupbzuYjCWknv
         +ofsyoj3lNY1B0i8wkTbTxF2nhMwpBH8cP6gZ1G4s9aDAKDYUR5fzFHjKIWJChpBapEw
         MN6srwlUBfav5AbNG6NyA3NHVSxg9zn06MnxQvm2xPwHRMCxu8ERJEJ7ie5S30gfidDG
         Qw46FB3cEV1a3zhCKouKsMoiKcHBePULSx6SAbphaQ1P6Jkq0SzeJnGgs8IQCUVPyDW8
         Du42FvHMuGGwkJnBTWNqvmfuiUsBVl2C+4wBKRmXJnp8BLzGhD80AJyc2d4KF97TD8hl
         0RCQ==
X-Gm-Message-State: ABy/qLYdO0XVznXEEGF3+besSEdhd62qdoyYvSNsQrWtNHVC2qmYDoUP
	eynGLEL7h2kGUmE21LO+Spjx8t5lJ3Q694ItKTfI
X-Google-Smtp-Source: APBJJlEwvR3ie1wgajxu0LrxjHcnSgGyVfqq6Q7CDLHhh5oOZ5yoIAJ4eMMXji8exSySAnAz+ADwVtTO01lfq+BCC5k=
X-Received: by 2002:a2e:9f0c:0:b0:2b6:d9dd:f65f with SMTP id
 u12-20020a2e9f0c000000b002b6d9ddf65fmr3737244ljk.17.1689325668135; Fri, 14
 Jul 2023 02:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 14 Jul 2023 02:07:36 -0700
Message-ID: <CAOnJCUKCwnOXGWKiwQQxZ92t4138JAOqzkkqtwApHRy6YuS0Kw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] riscv: Allow userspace to directly access perf counters
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_020751_488665_2B78ADB2 
X-CRM114-Status: GOOD (  24.55  )
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

T24gTW9uLCBKdWwgMywgMjAyMyBhdCA1OjQ24oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IHJpc2N2IHVzZWQgdG8gYWxsb3cgZGlyZWN0IGFj
Y2VzcyB0byBjeWNsZS90aW1lL2luc3RyZXQgY291bnRlcnMsCj4gYnlwYXNzaW5nIHRoZSBwZXJm
IGZyYW1ld29yaywgdGhpcyBwYXRjaHNldCBpbnRlbmRzIHRvIGFsbG93IHRoZSB1c2VyIHRvCj4g
bW1hcCBhbnkgY291bnRlciB3aGVuIGFjY2Vzc2VkIHRocm91Z2ggcGVyZi4gQnV0IHdlIGNhbid0
IGJyZWFrIHRoZQo+IGV4aXN0aW5nIGJlaGF2aW91ciBzbyB3ZSBpbnRyb2R1Y2UgYSBzeXNjdGwg
cGVyZl91c2VyX2FjY2VzcyBsaWtlIGFybTY0Cj4gZG9lcywgd2hpY2ggZGVmYXVsdHMgdG8gdGhl
IGxlZ2FjeSBtb2RlIGRlc2NyaWJlZCBhYm92ZS4KPgo+IFRoaXMgdmVyc2lvbiBuZWVkcyBvcGVu
U0JJIHYxLjMgKmFuZCogYSBrZXJuZWwgZml4IHRoYXQgd2VudCB1cHN0cmVhbSBsYXRlbHkKPiAo
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDYxNjExNDgzMS4zMTg2OTgwLTEtbWF6
QGtlcm5lbC5vcmcvVC8pLgo+Cj4gKipJbXBvcnRhbnQqKjogSW4gdGhpcyB2ZXJzaW9uLCB0aGUg
ZGVmYXVsdCBtb2RlIGlzIG5vdyB1c2VyIGFjY2Vzcywgbm90Cj4gdGhlIGxlZ2FjeSBzbyBzb21l
IGFwcGxpY2F0aW9ucyB3aWxsIGJyZWFrLgo+Ck1heWJlIHByb3ZpZGluZyBhIGxpdHRsZSBtb3Jl
IGNvbnRleHQgdG8gdGhlIGlzc3VlIHdpbGwgaGVscAp1bmRlcnN0YW5kaW5nIHdoeSBicmVha2lu
ZyB0aG9zZSBsZWdhY3kKYXBwbGljYXRpb25zIGlzIG5lY2Vzc2FyeSBkdWUgdG8gc2VjdXJpdHkg
cmVhc29ucy4KCkhlcmUgd2FzIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIGFyb3VuZCB0aGlzWzFd
LgpNb3N0IG9mIHRoZSBsZWdhY3kgdXNlciBhcHBsaWNhdGlvbnMgdXNpbmcgcmRjeWNsZSBzaG91
bGQgdXNlIHJkdGltZQppbnN0ZWFkIGFzIHRoZXkganVzdCB3YW50IHRvIHJlY29yZCB0aGUgdGlt
ZQplbGFwc2VkLiBBbGxvd2luZyByZGN5Y2xlL3JkaW5zdHJldCB0byBiZSByZWFkIGZyb20gdXNl
ciBzcGFjZSBjYW4KbGVhZCB0byB2ZXJ5IGRldGVybWluaXN0aWMgYXR0YWNrc1syXS4KClsxXSBo
dHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2EvZ3JvdXBzLnJpc2N2Lm9yZy9nL3N3LWRldi9jL1JF
V2N3WW56c0tFP3BsaT0xClsyXSBodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PTMtYzRD
X0wyUFJRJmFiX2NoYW5uZWw9SUVFRVN5bXBvc2l1bW9uU2VjdXJpdHlhbmRQcml2YWN5CgpBbnkg
dXNlciBhcHBsaWNhdGlvbiB0aGF0IHJlYWxseSByZXF1aXJlcyB0byByZWFkIHJkY3ljbGUgZGly
ZWN0bHkgY2FuCnVzZSB0aGlzIG5ldyBwZXJmIGludGVyZmFjZSB0byBkbyB0aGF0IHdpdGhvdXQg
YW55IGxhdGVuY3kuCgo+IGJhc2UtY29tbWl0LXRhZzogdjYuNC1yYzYKPgo+IENoYW5nZXMgaW4g
djQ6Cj4gLSBGaXhlZCBzb21lIG5pdHMgaW4gcmlzY3ZfcG11X3NiaS5jIHRoYW5rcyB0byBBbmRy
ZXcKPiAtIEZpeGVkIHRoZSBkb2N1bWVudGF0aW9uIHRoYW5rcyB0byBBbmRyZXcKPiAtIEFkZGVk
IFJCIGZyb20gQW5kcmV3IFxvLwo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIHBhdGNoIDEgbm93IGNv
bnRhaW5zIHRoZSByZWYgdG8gdGhlIGZhdWx0eSBjb21taXQgKG5vIEZpeGVzIHRhZyBhcyBpdCBp
cyBvbmx5IGEgY29tbWVudCksIGFzIEFuZHJldyBzdWdnZXN0ZWQKPiAtIFJlbW92ZWQgUklTQ1Zf
UE1VX0xFR0FDWV9USU1FIGZyb20gcGF0Y2ggMywgYXMgQW5kcmV3IHN1Z2dlc3RlZAo+IC0gUmVu
YW1lIFJJU0NWX1BNVV9QREVWX05BTUUgdG8gInJpc2N2LXBtdS1zYmkiLCBwYXRjaDQgaXMganVz
dCBjb3NtZXRpYyBub3csIGFzIEFuZHJldyBzdWdnZXN0ZWQKPiAtIFJlbW92ZWQgYSBmZXcgdXNl
bGVzcyAoYW5kIHdyb25nKSBjb21tZW50cywgYXMgQW5kcmV3IHN1Z2dlc3RlZAo+IC0gU2ltcGxp
ZnkgYXJjaF9wZXJmX3VwZGF0ZV91c2VycGFnZSBjb2RlLCBhcyBBbmRyZXcgc3VnZ2VzdGVkCj4g
LSBEb2N1bWVudGF0aW9uIG5vdyBtZW50aW9ucyB0aGF0IHRpbWUgQ1NSIGlzICphbHdheXMqIGFj
Y2Vzc2libGUsIHdoYXRldmVyIHRoZSBtb2RlLCBhcyBzdWdnZXN0ZWQgYnkgQW5kcmV3Cj4gLSBS
ZW1vdmVkIENZQ0xFSCByZWZlcmVuY2UgYW5kIGFkZCBUT0RPIGZvciBydjMyIHN1cHBvcnQsIGFz
IHN1Z2dlc3RlZCBieSBBdGlzaAo+IC0gRG8gbm90IHJlbmFtZSB0aGUgcG11IGluc3RhbmNlIGFz
IEF0aXNoIHN1Z2dlc3RlZAo+IC0gU2V0IHBtY193aWR0aCBvbmx5IGlmIHJkcG1jIGlzIGVuYWJs
ZWQgYW5kIENPTkZJR19SSVNDVl9QTVUgaXMgc2V0IGFuZCB0aGUgZXZlbnQgaXMgYSBodyBldmVu
dAo+IC0gTW92ZSBhcmNoX3BlcmZfdXBkYXRlX3VzZXJwYWdlIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyMzA2MTYxMTQ4MzEuMzE4Njk4MC0xLW1hekBrZXJuZWwub3JnL1QvCj4gLSAq
KlN3aXRjaCB0byB1c2VyIG1vZGUgYWNjZXNzIGJ5IGRlZmF1bHQqKgo+Cj4gQ2hhbmdlcyBpbiB2
MjoKPiAtIFNwbGl0IGludG8gc21hbGxlciBwYXRjaGVzLCB3YXkgYmV0dGVyIQo+IC0gQWRkIFJC
IGZyb20gQ29ub3IKPiAtIFNpbXBsaWZ5IHRoZSB3YXkgd2UgY2hlY2tlZCByaXNjdiBhcmNoaXRl
Y3R1cmUKPiAtIEZpeCByYWNlIG1tYXAgYW5kIG90aGVyIHRocmVhZCBydW5uaW5nIG9uIG90aGVy
IGNwdXMKPiAtIFVzZSBod2Mgd2hlbiBhdmFpbGFibGUKPiAtIFNldCBhbGwgdXNlcnNwYWNlIGFj
Y2VzcyBmbGFncyBpbiBldmVudF9pbml0LCB0b28gY3VtYmVyc29tZSB0byBoYW5kbGUgc3lzY3Rs
IGNoYW5nZXMKPiAtIEZpeCBhcmNoX3BlcmZfdXBkYXRlX3VzZXJwYWdlIGZvciBwbXUgb3RoZXIg
dGhhbiByaXNjdi1wbXUgYnkgcmVuYW1pbmcgcG11IGRyaXZlcgo+IC0gRml4ZWQga2VybmVsIHRl
c3Qgcm9ib3QgYnVpbGQgZXJyb3IKPiAtIEZpeGVkIGRvY3VtZW50YXRpb24gKEFuZHJldyBhbmQg
QmFnYXMpCj4gLSBwZXJmIHRlc3RzdWl0ZSBwYXNzZXMgbW1hcCB0ZXN0cyBpbiBhbGwgMyBtb2Rl
cwo+Cj4gQWxleGFuZHJlIEdoaXRpICgxMCk6Cj4gICBwZXJmOiBGaXggd3JvbmcgY29tbWVudCBh
Ym91dCBkZWZhdWx0IGV2ZW50X2lkeAo+ICAgaW5jbHVkZTogcmlzY3Y6IEZpeCB3cm9uZyBpbmNs
dWRlIGd1YXJkIGluIHJpc2N2X3BtdS5oCj4gICByaXNjdjogTWFrZSBsZWdhY3kgY291bnRlciBl
bnVtIG1hdGNoIHRoZSBIVyBudW1iZXJpbmcKPiAgIGRyaXZlcnM6IHBlcmY6IFJlbmFtZSByaXNj
diBwbXUgc2JpIGRyaXZlcgo+ICAgcmlzY3Y6IFByZXBhcmUgZm9yIHVzZXItc3BhY2UgcGVyZiBl
dmVudCBtbWFwIHN1cHBvcnQKPiAgIGRyaXZlcnM6IHBlcmY6IEltcGxlbWVudCBwZXJmIGV2ZW50
IG1tYXAgc3VwcG9ydCBpbiB0aGUgbGVnYWN5IGJhY2tlbmQKPiAgIGRyaXZlcnM6IHBlcmY6IElt
cGxlbWVudCBwZXJmIGV2ZW50IG1tYXAgc3VwcG9ydCBpbiB0aGUgU0JJIGJhY2tlbmQKPiAgIERv
Y3VtZW50YXRpb246IGFkbWluLWd1aWRlOiBBZGQgcmlzY3Ygc3lzY3RsX3BlcmZfdXNlcl9hY2Nl
c3MKPiAgIHRvb2xzOiBsaWI6IHBlcmY6IEltcGxlbWVudCByaXNjdiBtbWFwIHN1cHBvcnQKPiAg
IHBlcmY6IHRlc3RzOiBBZGFwdCBtbWFwLWJhc2ljLmMgZm9yIHJpc2N2Cj4KPiAgRG9jdW1lbnRh
dGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2VybmVsLnJzdCB8ICAyNyArKy0KPiAgZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdS5jICAgICAgICAgICAgICAgICAgICB8IDExMyArKysrKysrKysrKwo+ICBk
cml2ZXJzL3BlcmYvcmlzY3ZfcG11X2xlZ2FjeS5jICAgICAgICAgICAgIHwgIDI4ICsrLQo+ICBk
cml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jICAgICAgICAgICAgICAgIHwgMTk2ICsrKysrKysr
KysrKysrKysrKystCj4gIGluY2x1ZGUvbGludXgvcGVyZi9yaXNjdl9wbXUuaCAgICAgICAgICAg
ICAgfCAgMTIgKy0KPiAgaW5jbHVkZS9saW51eC9wZXJmX2V2ZW50LmggICAgICAgICAgICAgICAg
ICB8ICAgMyArLQo+ICB0b29scy9saWIvcGVyZi9tbWFwLmMgICAgICAgICAgICAgICAgICAgICAg
IHwgIDY1ICsrKysrKysKPiAgdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMgICAgICAgICAg
ICAgICB8ICAgNCArLQo+ICA4IGZpbGVzIGNoYW5nZWQsIDQyOCBpbnNlcnRpb25zKCspLCAyMCBk
ZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4zOS4yCj4KCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
