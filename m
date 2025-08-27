Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EADCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 02:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/M8QwX3HYttjzeZyXgLvCeX64MTY9AiUcfKpQ78z1U=; b=tHIZBcjx4BP8dI
	21gZkFVapWuZnFfhu54UIEihL1KXRobQmMv/O8CHx1ggDFZZMvJpX08XWeKWxAufwDawwmDXrqo1K
	2gypCtA3KfCGuiP/G6lIhzwsFHexrj4SLi9fcbYiseBqP+XufLNID/L/HsCRhWy06vS2D81XkwmjR
	7hltRQsm5dg4fTSd0+nFLEI1H4AtjQmFwEIh23mQ1+15DcS7ekd50m1Gau3drvTVoQLtxzEz/PE2T
	fdlzcmAXgv5bAhgz7X/uYEK9Zdw9Ye0nordgf7xtrRvcu518r+vGs4UXnmsQgn7ZnM4kVfWJcaRez
	Ji9rtb+m51LvHYqgTVOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5sK-0000000Dg51-3RDB;
	Wed, 27 Aug 2025 02:27:00 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5sH-0000000Dg4X-3mN7
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 02:26:59 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b482fd89b0eso5145629a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Aug 2025 19:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756261617; x=1756866417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHVNbfQCumqxeQCw71J4nlidfnOtKEjFHDsWTl58OjI=;
        b=fN4ABij4wkC+btLMSUviCiRboNl/GO7St1xKKgXti9rj3Eqcd4SbYVBjG3zRKPO+s7
         80RAAR4Pu+2Vv0Abz1wOtEDGdTOXQdFgmTvxK0PbfVuhen3/IFaO0zeATqJuNtq7mNbi
         I9V9GTlekUlfoIOQAuziJ0oDt4QgMGxJdLVo/o2GL1otrkZAQNgWjbgxd/Gv0EoZjFdh
         VYN1xF3aR6InOgN0Fc4PJfeP+X/ZLKkTJdQzWZvaKVDba2XNrbRnUDV0CCZ692SNzmTs
         eZVdyXDkXRPnJ9xqdvitbaOFejwH4XS+DsnzGferuCXFFh2V/oTMdlljoFbKRyrLnJe7
         DqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756261617; x=1756866417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHVNbfQCumqxeQCw71J4nlidfnOtKEjFHDsWTl58OjI=;
        b=I/yh6nbTswbv0a9ZPntmgmXi+Dv0rF/xaYInggjnlr6X0u2j5qF2f+5z9i6llmJGuv
         1qOZRh90bKszLHzSRtFrhVYm/tzZgU0fFF/JvlTJEXSSm5Ds/NnCUlz4+iru8daff3Jd
         LY5xHDm8uwtaDTt/hPrkkAtnG+ASYnjeOYDqqDwQ6ShOpOcGoTKEWAPHDwciwk9NNK3E
         qINSUI4HjMwrcKL/Z18ulEqRsKzOYP3Bl2KNwyUWwV4c4AB5X17nmdyJM64T3/jE6rpP
         vrRlPMfjq+GDrm2Qi9/NC0gq7nIQjtxLEi9Hnk0WWyMHTmzzieJKMn5B5BeBHo4HItjR
         L/yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU3d1cvMMcYRdQG2Ly7oXxOTel2ruLp8p4otCXy3pnQ3j8JwoURTYdyp/dk6GzVQepA5TvPNLY4J2f9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAWTJGI02JlofCsQzqvA/6UTc8pOW13OfMl/JDq8c1t/j3957r
	6m9dopgGECPFsSbw4edBHb5isCixO6+AqBwfcAshR5khHDJkC+/0DPFkKM8cbbfT8d8iYAJIA/p
	kp6KbtX9dWcT8piahE18AXEaM5VxhFgv25w0V6v6iLA==
X-Gm-Gg: ASbGnctfp0BHTMMTSktX+snJFGw03H6E7tYAENdVgebzok2ej3l5f4JEcRpFDvQ1xrw
	vH5J/CYQk/PG++Ifzm3VPsH30VzR/lWhiY9xCHX+s6121JVlw34qWko0Z/VNIiHNKRXiFYo6qUk
	yjDf2kZbnv0bS9fwikS+/DF1SuFQnnAAUTlejeT7dCCQ0ck35bBOi0n0p3MgzDM/j2NCK3993el
	t8gEITl4gir5Kbl2jTl60OQgiKnMdcnxXuH6I7PsM4oCrc7I8elOZgRCc8=
X-Google-Smtp-Source: AGHT+IHNZgQsssmPuxXxulhquPiv+J+5gv9oZQdEbvzqvM22YI4EwB4b2bsfvQp7QA39DPvYUCZi5e+iy3hblW/5A30=
X-Received: by 2002:a17:902:ccc4:b0:248:79d4:939e with SMTP id
 d9443c01a7336-24879d49812mr49737525ad.39.1756261617011; Tue, 26 Aug 2025
 19:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250826145740.92276-1-luxu.kernel@bytedance.com> <20250826-dullness-seventy-c93e7c8479d0@spud>
In-Reply-To: <20250826-dullness-seventy-c93e7c8479d0@spud>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 27 Aug 2025 10:26:06 +0800
X-Gm-Features: Ac12FXx2No1D1gMvYg6ri85Ywj4nyF_bfR0xM0UFuGY0pIPPFwb4VR1vHn2UueQ
Message-ID: <CAPYmKFuZ5y=q-tpmgMzGFEy6y=UPDf5vLg4gS8VAEkAKBr6BmQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 0/4] riscv: Add Zalasr ISA exntesion support
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ajones@ventanamicro.com, brs@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_192657_944595_893E9595 
X-CRM114-Status: GOOD (  16.25  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIEF1ZyAyNywgMjAyNSBhdCAxOjQ24oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDI2LCAyMDI1IGF0IDEw
OjU3OjM2UE0gKzA4MDAsIFh1IEx1IHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQg
Zm9yIHRoZSBaYWxhc3IgSVNBIGV4dGVuc2lvbiwgd2hpY2ggc3VwcGxpZXMgdGhlCj4gPiByZWFs
IGxvYWQgYWNxdWlyZS9zdG9yZSByZWxlYXNlIGluc3RydWN0aW9ucy4KPiA+Cj4gPiBUaGUgc3Bl
Y2lmaWNhdGlvbiBjYW4gYmUgZm91bmQgaGVyZToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di9yaXNjdi16YWxhc3IvYmxvYi9tYWluL2NoYXB0ZXIyLmFkb2MKPgo+IFdoeSBpcyB0aGlzIGFu
IFJGQz8KClRoZXJlIGlzIHN0aWxsIHNvbWUgY29kZSB1c2luZyBmZW5jZSB0byBzaW11bGF0ZSBy
ZWFsCmxvYWQtYWNxdWlyZS9zdG9yZS1yZWxlYXNlIGluc25zLiBGb3IgZXhhbXBsZSwgUklTQ1Zf
QUNRVUlSRV9CQVJSSUVSCmFuZCBSSVNDVl9SRUxFQVNFX0JBUlJJRVIsIGV0Yy4gSSB3aWxsIHJl
c2VuZCBhIGZvcm1hbCBwYXRjaCBzZXJpZXMKYWZ0ZXIgSSBtb2RpZnkgdGhlbS4KCj4gSXMgdGhl
IFJGQyB0YWcgcmVsYXRlZCB0byBob3cgeW91IGhhdmUgbm90IENDZWQgYWxsIHJlbGV2YW50IG1h
aWxpbmcKPiBsaXN0cyBhbmQgbWFpbnRhaW5lcnM/CgpTb3JyeSBhYm91dCB0aGlzLiBJIHdpbGwg
cmVjaGVjayB0aGUgbWFpbnRhaW5lciBsaXN0IG5leHQgdGltZS4KCkJlc3QgcmVnYXJkcywKWHUg
THUKCj4KPiBDaGVlcnMsCj4gQ29ub3IuCj4KPiA+Cj4gPiBYdSBMdSAoNCk6Cj4gPiAgIHJpc2N2
OiBhZGQgSVNBIGV4dGVuc2lvbiBwYXJzaW5nIGZvciBaYWxhc3IKPiA+ICAgZHQtYmluZGluZ3M6
IHJpc2N2OiBBZGQgWmFsYXNyIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KPiA+ICAgcmlzY3Y6
IEluc3Ryb2R1Y2UgWmFsYXNyIGluc3RydWN0aW9ucwo+ID4gICByaXNjdjogVXNlIFphbGFzciBm
b3Igc21wX2xvYWRfYWNxdWlyZS9zbXBfc3RvcmVfcmVsZWFzZQo+ID4KPiA+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCAgNSArKwo+ID4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vYmFycmllci5oICAgICAgICAgICAgICB8IDc5ICsrKysrKysrKysrKysr
KystLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAg
fCAgMSArCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pbnNuLWRlZi5oICAgICAgICAgICAg
IHwgNzkgKysrKysrKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYyAgICAgICAgICAgICAgICB8ICAxICsKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDE1NCBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi4yMC4xCj4gPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
