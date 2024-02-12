Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B41C4829E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5MaW4V5CIPPunY91MscArXGpz7x86yQDrGvtjbcBj4=; b=Fry5Td56/Fx2HK
	DacKCOQLSbSum6eDimE23oBwTcN6S27XYgHEtrHG0M/JyLH99eNfJeTp0o1D7CDDTM9aXsanpiCbW
	nHoCI3q+lquxCzvEygexIn4lga5aIfbvSvST1PLUjDsVfzcGLG31dznyI/Z0qysy0OZa+AvnHNs+b
	DJF6gub/brt1lA9Zg2R9Y69a5F8uw+jFe9miGF9xsro9ZQdIqdDE3KPzw8VISOGsvzt1ftFZV4fve
	4+NJWQAPHm3AgzCPJ5UcSUygA20kE42Z6IadUm9X9/oUjZ6RLIom4p/9yx04gL699Be+EklC7LwEj
	lsCPYckK6plRvvtXLYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbbC-00000006iWB-142j;
	Mon, 12 Feb 2024 19:04:14 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbb9-00000006iVC-1knk
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 19:04:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a36126ee41eso467978066b.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 11:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707764648; x=1708369448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzCqnLw1+99Zw8U3ViYnydrnyF7SQJQlIabSysNhMG4=;
        b=hW5FWVCIzM0wVEddrr/0QTLOYTxW/GmhMble0XhWEv+djiqGU/mhnvoHAmREZe9odT
         2pg5R+wEjWiCEuBgPmJRsKToB5MD1lgZWbbvQ1NaxztKj3Tv//HYHlH7FKTKVcdvM4rZ
         efVee3VSOPqwfmfd0fP5Blv3KdUGxdqUxI45lbV8f72yr7eWUnI33cqtaINdO/D4HDb3
         Qb7hGo8TozHh+jwLyvSBJCrpGjEd+DgtTG+YnkPAVcIJA5rjsqMK8DXsQi80KiErWGTh
         1GRqf5AAITQUxrUnU8b1753S5BlTSl8YMUifI7XrdFngAXCXL01BugxzHIfuyNR9npLh
         K02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707764648; x=1708369448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzCqnLw1+99Zw8U3ViYnydrnyF7SQJQlIabSysNhMG4=;
        b=f9IXAWtQXm7mfzUOA/co+We6q8ggvhQ1jVuFCzw8M3VQrs20dqbjGEuX4IJtPrqwxz
         +aDiRO2hez74vLgGGp6aGN3ZAg8HI0GJxJVlQpNRPFNHJlDpf2RDUfk7U8Vr+ewD8eMm
         Zb8bf2hhzedy5uDKLkQMOLaqkGBkgQuAVhDXrpH+Wb5bk1sYHBMOhzFtZDcaXjPDUMKA
         2JrlAHYPUpMbp6v7bcSIvm6GByayLu+OehnCWlJ9t/7H6XSPix+nBSTa1V6JecxSgHKi
         NJUn84c8wXZ/1MPS6PzOD6WkHRKP6tOSNmK+DYi+aNknyQtLXkGhZ6jLVNWJ0wbIi/yL
         oLJg==
X-Gm-Message-State: AOJu0Ywbp2MMEeNEMqUfzd3PC3yaMjCkXb9bQEG8J8aiWxEMPbWqfvdB
	jTLZ4qEwETYCWIRFrzVqC4jDtemr/kMvW61ZtWJ+HHicwmE9FwyrhbFxxs2po8RNhFIj/rrj9Zv
	LySJrK//DBDgs7eUH0qJUVpvcJBdkvbHsFKjq
X-Google-Smtp-Source: AGHT+IHnLHXZNcbMXm4/pyV9sKf1lkpL3ZT5WagZ+5/aVIbKJQcmollNZSQjHxCY6hY/l4tsQS155BB4J/oVAOoGvcU=
X-Received: by 2002:a17:906:4ad8:b0:a38:576a:f070 with SMTP id
 u24-20020a1709064ad800b00a38576af070mr6189593ejt.32.1707764648413; Mon, 12
 Feb 2024 11:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
In-Reply-To: <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
From: Ramon de C Valle <rcvalle@google.com>
Date: Mon, 12 Feb 2024 11:03:57 -0800
Message-ID: <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Trevor Gross <tmgross@umich.edu>
Cc: Conor Dooley <conor@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_110411_483269_4CF02C8C 
X-CRM114-Status: GOOD (  20.39  )
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

U29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBTYW1pIG1pZ2h0IGJlIHRoZSBiZXN0IHBlcnNvbiB0
byBhbnN3ZXIKdGhpcywgYnV0IEtDRkkgKG5vdCBDRkkpIHRlc3RzIGFyZSBsb3dlcmVkIGJ5IHBh
c3NlcyB0aGF0IGFyZQphcmNoaXRlY3R1cmUgc3BlY2lmaWMgKHNlZSBodHRwczovL3Jldmlld3Mu
bGx2bS5vcmcvRDExOTI5NiksIHNvIHdlJ2QKbmVlZCB0byBhZGQgc3VwcG9ydCBmb3IgUklTQy1W
LiBUaGVyZSBpcyBubyBhZGRpdGlvbmFsIHdvcmsgcmVxdWlyZWQKaW4gdGhlIFJ1c3QgY29tcGls
ZXIgYmVzaWRlcyBlbmFibGluZyBpdCBmb3IgdGhlIG5ldyB0YXJnZXQuCgoKT24gU2F0LCBGZWIg
MTAsIDIwMjQgYXQgMTI6MTPigK9BTSBUcmV2b3IgR3Jvc3MgPHRtZ3Jvc3NAdW1pY2guZWR1PiB3
cm90ZToKPgo+IE9uIEZyaSwgRmViIDksIDIwMjQgYXQgOToxOOKAr0FNIENvbm9yIERvb2xleSA8
Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gU2F0LCBKYW4gMjcsIDIwMjQgYXQg
MDI6NDY6MzhQTSArMDEwMCwgTWlndWVsIE9qZWRhIHdyb3RlOgo+ID4gPiBPbiBGcmksIEphbiAy
NiwgMjAyNCBhdCAxMTowMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBJcyB0aGF0IGV2ZW4gbmVlZGVkPyBXZSBhbHJlYWR5IGhhdmUg
QVJDSF9TVVBQT1JUU19DRklfQ0xBTkcgYW5kIEFGQUlVCj4gPiA+ID4gcnVzdCBzdXBwb3J0cyBp
dCBpZiBjbGFuZyBkb2VzLCBzbyBhIHNlY29uZCBvcHRpb24gaXMgc3VwZXJmbHVvdXM/Cj4gPiA+
Cj4gPiA+IEZyb20gYSBxdWljayBsb29rLCBJIGRvbid0IHNlZSBpdCBlbmFibGVkIGluIGFueSBS
SVNDLVYgYnVpbHQtaW4KPiA+ID4gdGFyZ2V0IGluIGBydXN0Y2AgeWV0Lgo+ID4gPgo+ID4gPiBJ
dCBtYXkgYWxzbyBzdGlsbCBiZSB0aGUgY2FzZSB0aGF0IEtDRkkgbmVlZHMgc29tZSB0d2Vha3Mg
Zm9yLCBzYXksCj4gPiA+IFJJU0MtViwgYmVmb3JlIHRoZSBmbGFnIGFjdHVhbGx5IHdvcmtzLCBp
LmUuIHdlIGNvdWxkbid0IGp1c3QgdGVzdCB0aGUKPiA+ID4gZmxhZyBpbiB0aGF0IGNhc2UgLS0g
UmFtb246IGhvdyBsaWtlbHkgaXMgaXQgdGhhdCBSSVNDLVYgd291bGQgd29yayBpZgo+ID4gPiBL
Q0ZJIHdvcmtzIGZvciBhYXJjaDY0IGFuZCB4ODZfNjQ/Cj4gPgo+ID4gV2VsbCwgdGhlcmUncyBi
ZWVuIG5vIHJlcGx5IGhlcmUuIEknbGwgZG8gc2EgeW91IHN1Z2dlc3RlZCBhbmQgYWRkIGEKPiA+
IGRlcGVuZHMgb24gIUNGSV9DTEFORyB0byBSVVNULgo+ID4KPiA+IENoZWVycywKPiA+IENvbm9y
Lgo+ID4KPgo+IEkgYXNrZWQgb24gWnVsaXAgYW5kIGl0IHNvdW5kcyBsaWtlIFJhbW9uIG1heSBi
ZSBvdXQgWzFdLiBJdAo+IF9wcm9iYWJseV8gd29ya3MsIGJ1dCBnb2luZyB3aXRoIGEgZGVwZW5k
ZW5jeSB0byBub3QgYmUgYmxvY2tlZCBvbgo+IEtDRkkgaXMgcHJvYmFibHkgcmVhc29uYWJsZSBm
b3Igbm93Lgo+Cj4gLSBUcmV2b3IKPgo+IFsxXTogaHR0cHM6Ly9ydXN0LWxhbmcuenVsaXBjaGF0
LmNvbS8jbmFycm93L3N0cmVhbS8zNDMxMTktcHJvamVjdC1leHBsb2l0LW1pdGlnYXRpb25zL3Rv
cGljL0tDRkkuMjBvbi4yMFJJU0MtVi4yMHF1ZXN0aW9ucwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
