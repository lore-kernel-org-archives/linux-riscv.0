Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD417C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 06:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltIra1eThFKKnuWs0IkX5ZYmUw1g0haH2spwWQ/pP7E=; b=ehZziv467sL2rV
	a80OBXRnCNwfU8gIr/AvuuReiNB3sIsK9OQ/KCOHbTiJGCoj5euywO03sL+jdUS6fdyfie5xW5HMf
	d4o34tkHdJ9zbZALY08ludrSMaw9U09Qoa4jc8jqtbtLD0i3yCNGgCsga3zQrx5+RYRz9ooyVwbLO
	PmyD0jSzW3R5mRXzcuM2jctkrcrIRR/8dL6jLgIy4dc89PAKIHEZrAJBccnkSQRHSK0UFRGwmeAs5
	ZTSgEsPLe4An3crHvGu7MgOTGK7/RLpTHokdEH0snmyVSE4PUInCZMsnX1VYiSaXSm5jMo5NCejvp
	Fy/5VmwQadzZZkJv9MoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psePm-00CLLv-1p;
	Sat, 29 Apr 2023 06:50:38 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psePh-00CLK7-2q
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 06:50:36 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-517bdd9957dso420970a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 23:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1682751031; x=1685343031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UhLj8G0RcQUtsKhKUXfnhL7zuYYyQ7vxUKRWYdX3To=;
        b=kl5IGW/Q3ziJZox5rl+u6Pls+orvxgrZh7dIcOOMrHC3T+7UehfcLxH/5OXNGM61OK
         LeNapk1MFK9ZdPD+3yGP8whyGPsLJvuM/JdqjpVdy3soAh0+inT2wfUcCbvKGF/byerP
         uViGf7E40KXqnWzIXzvuPPnVBhiSor/hPtMoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682751031; x=1685343031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UhLj8G0RcQUtsKhKUXfnhL7zuYYyQ7vxUKRWYdX3To=;
        b=bywrahHUcUCOL6CST/9bAkDSWLkD4lrBowZIzBq8fSmf7vRbqJtsJmLdaYBkjiZfx4
         H5FujIZT8bljIYq79vTGfIoOsnlpvC+LtL/o9o85mN8o1sT6v781Z5RAdS0NK44A6g0C
         WzQ4cRhT5hu5EeBdtXzEIalaOVnb09PgKkSZZLy3IVp+ennv6YGVV1aRSPqQFt2CDrtQ
         FmCfkMwSlFdcDfmda9tqmcblK5FmP52bDmrej73berHR6/NnD2hNF+s7QGvI5djfC8JY
         bacclojEnF2vb1kzcnRxzaaU8ULcsYmRravA1u6FLGP1OY5s1LXzC1jJD8H7p0x8iWy8
         rzSw==
X-Gm-Message-State: AC+VfDw25wG87xOsHnhZxasmhtQbGUAONVjBrzMtH/uWrMlmwdu6h/W0
	JlV2UH8tU36r2yZriirl/5YlrLwHPzmLnImEmsXB
X-Google-Smtp-Source: ACHHUZ696dIE7IrwvV8BtWc5TacXtKoiSXfv7kuAMvB8aDSVSFFnBuVQsWCP5AhdIJRoTLbNGit9a3My/X0+KaY2+2g=
X-Received: by 2002:a05:6a21:1706:b0:ef:a31b:af8e with SMTP id
 nv6-20020a056a21170600b000efa31baf8emr8535949pzb.25.1682751031206; Fri, 28
 Apr 2023 23:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <20230413161725.195417-5-alexghiti@rivosinc.com> <kwvrls2m6swp443brn27jwcsdhovtc4kxrkqustxpqgf7zqltw@xlhsrndkf4om>
 <CAHVXubh_y9Uw2xsgsQrVZEcb9bCLBLUCo74GOm-czsSawHxk4g@mail.gmail.com>
 <3bwxedsrovutzhlmlnozeuvz4zqnr32kuef2mdzmnbniajh6vb@we6jzlwkfuof> <CAOnJCU+xL1qP0zj9rD0d9nix-tSd-yfQnToDXCdHveTKQN_rUA@mail.gmail.com>
In-Reply-To: <CAOnJCU+xL1qP0zj9rD0d9nix-tSd-yfQnToDXCdHveTKQN_rUA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 29 Apr 2023 12:20:19 +0530
Message-ID: <CAOnJCUK+cXPDMiA=x7sCTt=K7rCjr7q_6aj04VR8fZUUKbrkPA@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: Enable perf counters user access only through perf
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	David Abdurachmanov <davidlt@rivosinc.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Andreas Schwab <schwab@suse.de>, mafm@debian.org, 
	aurel32@debian.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_235033_918401_251C6267 
X-CRM114-Status: GOOD (  38.05  )
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

T24gU2F0LCBBcHIgMjksIDIwMjMgYXQgMTE6NDnigK9BTSBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0
aXNocGF0cmEub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgQXByIDI2LCAyMDIzIGF0IDY6NTXigK9Q
TSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBP
biBXZWQsIEFwciAyNiwgMjAyMyBhdCAwMzoxNzowMVBNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkg
d3JvdGU6Cj4gPiA+IE9uIFdlZCwgQXByIDI2LCAyMDIzIGF0IDI6NTfigK9QTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFRo
dSwgQXByIDEzLCAyMDIzIGF0IDA2OjE3OjI1UE0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90
ZToKPiA+ID4gPiA+IFdlIHVzZWQgdG8gdW5jb25kaXRpb25uYWxseSBleHBvc2UgdGhlIGN5Y2xl
IGFuZCBpbnN0cmV0IGNzcnMgdG8KPiA+ID4gPiA+IHVzZXJzcGFjZSwgd2hpY2ggZ2l2ZXMgcmlz
ZSB0byBzZWN1cml0eSBjb25jZXJucy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTbyBvbmx5IGFsbG93
IGFjY2VzcyB0byBodyBjb3VudGVycyBmcm9tIHVzZXJzcGFjZSB0aHJvdWdoIHRoZSBwZXJmCj4g
PiA+ID4gPiBmcmFtZXdvcmsgd2hpY2ggd2lsbCBoYW5kbGUgY29udGV4dCBzd2l0Y2hzLCBwZXIt
dGFzayBldmVudHMuLi5ldGMuIEJ1dAo+ID4gPiA+ID4gYXMgd2UgY2Fubm90IGJyZWFrIHVzZXJz
cGFjZSwgd2UgZ2l2ZSB0aGUgdXNlciB0aGUgY2hvaWNlIHRvIGdvIGJhY2sgdG8KPiA+ID4gPiA+
IHRoZSBwcmV2aW91cyBiZWhhdmlvdXIgYnkgc2V0dGluZyB0aGUgc3lzY3RsIHBlcmZfdXNlcl9h
Y2Nlc3MuCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2UgYWxzbyBpbnRyb2R1Y2UgYSBtZWFucyB0byBk
aXJlY3RseSBtYXAgdGhlIGhhcmR3YXJlIGNvdW50ZXJzIHRvCj4gPiA+ID4gPiB1c2Vyc3BhY2Us
IHRodXMgYXZvaWRpbmcgdGhlIG5lZWQgZm9yIHN5c2NhbGxzIHdoZW5ldmVyIGFuIGFwcGxpY2F0
aW9uCj4gPiA+ID4gPiB3YW50cyB0byBhY2Nlc3MgY291bnRlcnMgdmFsdWVzLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IE5vdGUgdGhhdCBhcmNoX3BlcmZfdXBkYXRlX3VzZXJwYWdlIGlzIGEgY29weSBv
ZiBhcm02NCBjb2RlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4g
IERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QgfCAgMjMgKysrLQo+
ID4gPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGVyZl9ldmVudC5oICAgICAgICAgfCAg
IDMgKwo+ID4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgfCAgIDIgKy0KPiA+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wZXJmX2V2ZW50LmMgICAg
ICAgICAgICAgIHwgIDY1ICsrKysrKysrKysrCj4gPiA+ID4gPiAgZHJpdmVycy9wZXJmL3Jpc2N2
X3BtdS5jICAgICAgICAgICAgICAgICAgICB8ICA0MiArKysrKysrKwo+ID4gPiA+ID4gIGRyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfbGVnYWN5LmMgICAgICAgICAgICAgfCAgMTcgKysrCj4gPiA+ID4g
PiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyAgICAgICAgICAgICAgICB8IDExMyArKysr
KysrKysrKysrKysrKystLQo+ID4gPiA+ID4gIGluY2x1ZGUvbGludXgvcGVyZi9yaXNjdl9wbXUu
aCAgICAgICAgICAgICAgfCAgIDMgKwo+ID4gPiA+ID4gIHRvb2xzL2xpYi9wZXJmL21tYXAuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNjUgKysrKysrKysrKysKPiA+ID4gPiA+ICA5IGZpbGVz
IGNoYW5nZWQsIDMyMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+ID4gPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvcGVyZl9ldmVudC5jCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3Rs
L2tlcm5lbC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0
Cj4gPiA+ID4gPiBpbmRleCA0YjdiZmVhMjhjZDcuLjAyYjJhNDBhMzY0NyAxMDA2NDQKPiA+ID4g
PiA+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QKPiA+
ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QK
PiA+ID4gPiA+IEBAIC05NDEsMTYgKzk0MSwzMSBAQCBlbmFibGVkLCBvdGhlcndpc2Ugd3JpdGlu
ZyB0byB0aGlzIGZpbGUgd2lsbCByZXR1cm4gYGAtRUJVU1lgYC4KPiA+ID4gPiA+ICBUaGUgZGVm
YXVsdCB2YWx1ZSBpcyA4Lgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtcGVyZl91c2Vy
X2FjY2VzcyAoYXJtNjQgb25seSkKPiA+ID4gPiA+IC09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0KPiA+ID4gPiA+ICtwZXJmX3VzZXJfYWNjZXNzIChhcm02NCBhbmQgcmlzY3Ygb25s
eSkKPiA+ID4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+
ID4gPiA+ICsKPiA+ID4gPiA+ICtDb250cm9scyB1c2VyIHNwYWNlIGFjY2VzcyBmb3IgcmVhZGlu
ZyBwZXJmIGV2ZW50IGNvdW50ZXJzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IC1Db250cm9scyB1c2Vy
IHNwYWNlIGFjY2VzcyBmb3IgcmVhZGluZyBwZXJmIGV2ZW50IGNvdW50ZXJzLiBXaGVuIHNldCB0
byAxLAo+ID4gPiA+ID4gLXVzZXIgc3BhY2UgY2FuIHJlYWQgcGVyZm9ybWFuY2UgbW9uaXRvciBj
b3VudGVyIHJlZ2lzdGVycyBkaXJlY3RseS4KPiA+ID4gPiA+ICthcm02NAo+ID4gPiA+ID4gKz09
PT09Cj4gPiA+ID4gPgo+ID4gPiA+ID4gIFRoZSBkZWZhdWx0IHZhbHVlIGlzIDAgKGFjY2VzcyBk
aXNhYmxlZCkuCj4gPiA+ID4gPiArV2hlbiBzZXQgdG8gMSwgdXNlciBzcGFjZSBjYW4gcmVhZCBw
ZXJmb3JtYW5jZSBtb25pdG9yIGNvdW50ZXIgcmVnaXN0ZXJzCj4gPiA+ID4gPiArZGlyZWN0bHku
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gIFNlZSBEb2N1bWVudGF0aW9uL2FybTY0L3BlcmYucnN0IGZv
ciBtb3JlIGluZm9ybWF0aW9uLgo+ID4gPiA+ID4KPiA+ID4gPiA+ICtyaXNjdgo+ID4gPiA+ID4g
Kz09PT09Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArV2hlbiBzZXQgdG8gMCwgdXNlciBhY2Nlc3Mg
aXMgZGlzYWJsZWQuCj4gPiA+ID4gPiArCj4gPiA+ID4gPiArV2hlbiBzZXQgdG8gMSwgdXNlciBz
cGFjZSBjYW4gcmVhZCBwZXJmb3JtYW5jZSBtb25pdG9yIGNvdW50ZXIgcmVnaXN0ZXJzCj4gPiA+
ID4gPiArZGlyZWN0bHkgb25seSB0aHJvdWdoIHBlcmYsIGFueSBkaXJlY3QgYWNjZXNzIHdpdGhv
dXQgcGVyZiBpbnRlcnZlbnRpb24gd2lsbAo+ID4gPiA+ID4gK3RyaWdnZXIgYW4gaWxsZWdhbCBp
bnN0cnVjdGlvbi4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtUaGUgZGVmYXVsdCB2YWx1ZSBpcyAy
LCBpdCBlbmFibGVzIHRoZSBsZWdhY3kgbW9kZSwgdGhhdCBpcyB1c2VyIHNwYWNlIGhhcwo+ID4g
PiA+ID4gK2RpcmVjdCBhY2Nlc3MgdG8gY3ljbGUsIHRpbWUgYW5kIGluc3JldCBDU1JzIG9ubHku
Cj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIHRoaXMgZGVmYXVsdCB2YWx1ZSBzaG91bGQgYmUgYSBL
Y29uZmlnIHN5bWJvbCwgYWxsb3dpbmcga2VybmVscyB0bwo+ID4gPiA+IGJlIGJ1aWx0IHdpdGgg
YSBzZWN1cmUgZGVmYXVsdC4KPiA+ID4KPiA+ID4gQWN0dWFsbHkgSSB3YXMgbW9yZSBpbiBmYXZv
ciBvZiBoYXZpbmcgdGhlIGRlZmF1bHQgdG8gMSAoaWUgdGhlIHNlY3VyZQo+ID4gPiBvcHRpb24p
IGFuZCBsZXQgdGhlIGRpc3Ryb3MgZGVhbCB3aXRoIHRoZSBsZWdhY3kgbW9kZSAodmlhIGEgc3lz
Y3RsCj4gPiA+IHBhcmFtZXRlciBvbiB0aGUgY29tbWFuZCBsaW5lKSBhcyBsb25nIGFzIHVzZXIt
c3BhY2UgaGFzIG5vdCBiZWVuCj4gPiA+IGZpeGVkOiBkb2VzIHRoYXQgbWFrZSBzZW5zZT8KPiA+
Cj4gPiBZZXMsIEknZCBwcmVmZXIgdGhhdCB0b28uIEkgYXNzdW1lZCB0aGUgZGVmYXVsdCB3YXMg
MiBpbiB0aGlzIHBhdGNoCj4gPiBiZWNhdXNlIHdlIGNvdWxkbid0IHNldCBpdCB0byAxIGZvciBz
b21lIHJlYXNvbi4KPiA+Cj4KPiBJIHdvdWxkIHByZWZlciB0aGF0IHRvby4gSG93ZXZlciwgaXQg
d2FzIHNldCB0byAyIGJlY2F1c2UgaXQgd291bGQgYnJlYWsKPiB0aGUgdXNlciBzcGFjZSBhcHBs
aWNhdGlvbiBkZXBlbmRpbmcgb24gdGhlIGxlZ2FjeSBiZWhhdmlvciBhcyBzb29uIGFzIHRoZQo+
IHBhdGNoZXMgYXJlIHVwc3RyZWFtLiBUaGF0IGlzIHRoZSByZWFzb24KPiBwYWxtZXIgc3VnZ2Vz
dGVkIGtlZXBpbmcgdGhlIGRlZmF1bHQgdmFsdWUgdG8gMiBpbiBvcmRlciB0byBhdm9pZCB0aGF0
Lgo+Cj4gK2Rpc3RybyBmb2xrcyAoY2MnZCkKPiBJZiB0aGUgZGlzdHJvIG1haW50YWluZXIgY2Fu
IGNvbmZpcm0gdGhhdCB0aGlzIHdvdWxkIGJlIGEgbm9uLWlzc3VlLCBJIGFtIG9rYXkKPiB3aXRo
IHNldHRpbmcgdGhlIGRlZmF1bHQgdG8gMS4KPgoKQERhdmlkIEFiZHVyYWNobWFub3YgcmVtaW5k
cyBtZSBvZiBBUk02NCBjb2RlIHdoZXJlIGl0IGlzIHNldCB0byB6ZXJvLgpUaGUgdXBzdHJlYW0g
a2VybmVsIGRvZXNuJ3QgZXZlbiBlbmFibGUgdXNlcnNwYWNlIHZpYSBwZXJmLiBUaGUKZGVmYXVs
dCBpbiB4ODYgaXMgMSB0aG91Z2guCgorUm9iIEhlcnJpbmcgKHdobyBlbmFibGVkIHRoZSBBUk02
NCBzdXBwb3J0WzFdKQpAUm9iOiBJZiB5b3UgY2FuIHNoZWQgc29tZSBsaWdodCBvbiB0aGUgcmVh
c29uaW5nIGJlaGluZCBzZXR0aW5nIHRvCmRpc2FibGVkLCB0aGF0IHdvdWxkIGhlbHAKdXMgbWFr
ZSBhIG1vcmUgaW5mb3JtZWQgZGVjaXNpb24uCgpodHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMv
bGludXgvY29tbWl0L2UyMDEyNjAwODEwYzlkZWQ4MWY2ZjYzYThkMDQ3ODFiZTNjMzAwYWQKCj4K
PiA+IFRoYW5rcywKPiA+IGRyZXcKPgo+Cj4KPiAtLQo+IFJlZ2FyZHMsCj4gQXRpc2gKCgoKLS0g
ClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
