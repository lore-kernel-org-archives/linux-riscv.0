Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EBACCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 05:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTiR9k9CkHRkrugeww8SAbuSqDQlJxgocXzsLI1PsoU=; b=A+Ljc6ui807Yhl
	Jt7v2/VOR0eAunOuAcZX7uTmybDqFTkDMdf1QVTpEN0ferMbGbTtDJWGnpIJOWUcF/AM3m4zuy5vh
	JTvWnZYQJS0Z8qMASOSjb7L1p5eESRpv5KYkMnffTRbnY4gguMLJoYJUYmXJ52ijugDKsJBNhI535
	gKOkwtJmFjx7Gv2M9HtLJNdPAB6N4gb826L8eX3BK0ikv0cERXQDIJw0bb3+2w8liHRVZmyA7VCGO
	3EmWAxcfFG+yzmcuI5XAh9B4Rh8GrKqcRQWukcCCLh1B1YAuRC+HIyiAuyLb74jNpVGUVTTZOcjXc
	2jhZTEjPNUUhtjjaFkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAP7-00000008HF1-0CGc;
	Fri, 24 Oct 2025 05:31:57 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCAP4-00000008HEF-0j2x
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 05:31:55 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b550a522a49so1298738a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 22:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761283913; x=1761888713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHfVHx15Bq2/aoRhICm73cKae4vxx15Gf2KsSuTNfOg=;
        b=fXrpt+ZKmnOC5/IUBiJYYjbHoNCMr3j5RSHsOTKMD3h5nFT4L1KuICPn+5YHokx4qq
         2uSBTyi+ZP5czJ6TH1qJPNoJ0uWcFnB1QUMyFA70Orqu141AcJtmn/Es7tCn5JtlIYak
         5HsVO9KepxiqzI8eNRxOClcUA2MyG4SK17uBFNijo4wiE4o9/jR7uu6kIkygdNnoN5lm
         RM9cVnUQ50whiD7kl+aR1T9ChIZuT8YTqZBawyTip0Z9vLStoudFgfa5gfOuBpeYFlHr
         X6Of1bXop12+ggFGNrlp0o1I4rzfRfwRFgrL3Hvt4RJE2bzmcHw7T3ftASHTLkvYRyvz
         ph0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761283913; x=1761888713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHfVHx15Bq2/aoRhICm73cKae4vxx15Gf2KsSuTNfOg=;
        b=IgoTKJCAtiLKzUfwH5kYtE3hoAjmEB+Ti2B+2BIhuM56Vhh+ATv22CVcGGBMTmdZ9G
         rH9iQr23wRQK9JtJoVVUXTsHCy/rk2T+MkBCxnOShOtcgWpm8zf2aBS14KqV+DRcPXiT
         E1HJElqm8u8KEY2Bj1J8C2U+nu8M0tlXzIPV31fpJfkfYMQJllOO4o0heAlVCi5DVwiz
         LfjDXB0u9C4+QnqOPbPKnqVyKb4gujzZrE3CkyGirtcQjUL9rYi/HjexG0vSIZq82UaJ
         Nu131ArWJheUeFMU2FfJyQlwqfJZtH+665NveF+5KOKU3F4sTjM/26JFxh4l7HevtLNS
         4+5g==
X-Forwarded-Encrypted: i=1; AJvYcCVbVSv/pllVnrcJxIbI3XMI6Sm8Bw/OZwP5lyBzEJo4/rg7lnGSwHZRUtyHeI5iOH85OYrJwysehNsYbg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzeYeOUMh/y9+QiI9Cn3vuWJg48FLXKxRk5ZTg34INVCp0GtpA
	EaXufgaUcQP7gbN9nc2e+rhHAlqOn+tJyXxF/A1cdqTwsIOHQaKx3Zpqt6Gf+3ZgFvhPmyxrZsf
	JJR0a2gFaGnBqpqFIwjoWR18waKVpRhgoN+pZ0CNN
X-Gm-Gg: ASbGncuF9F2chLfuMW3xkOQT0onLdO6M2ladekeKjj34CKg79IMXkTcBf4b/HWfaLJw
	pr90/Ms3afz7A/SrjEegPZW9AyuCVadN/PAKDYnIYum+LJ2xv1AbhFK1MPvtnIocHRvyQBL20NI
	YhWnwT//SOktSYNZP8jMe0Bkk8Zap4x3miWPUagYYAWpp1VvxEEs9CEO3zqjJmUnhrTMu9n1wvN
	yyPiAeSEhtLPZmOMAw0KE2f4MMuvk0QiAgYHOQ+BQ5/w/J1GVQju7I6TGdYgMeI6Lzljo/ZEnvR
	iP9U0vINjQiLD3dmfzep6ACEAQ==
X-Google-Smtp-Source: AGHT+IF/VvU9VCEldtU8TlKdOOJKqinHd6plYVfP7jz1N/U0hWCfgU1KoVW9GCuTIIpcsB4YHkE/z7uj+DsUXzYb81k=
X-Received: by 2002:a17:902:f542:b0:24f:dbe7:73a2 with SMTP id
 d9443c01a7336-290ca121a7bmr368072235ad.31.1761283912454; Thu, 23 Oct 2025
 22:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251023000535.2897002-1-kuniyu@google.com> <20251023000535.2897002-2-kuniyu@google.com>
 <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com> <20251023092910.2ed9cf15@pumpkin>
In-Reply-To: <20251023092910.2ed9cf15@pumpkin>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 23 Oct 2025 22:31:41 -0700
X-Gm-Features: AS18NWAlIGQJ_wV8neCVFWBA2cf-w_Bdy_0uat0cNCw22R5tVWCPnuP-0EplywA
Message-ID: <CAAVpQUC=KH8iFOdMZfnuXdEMuCYuEgFxNvU93zgFNiGSU_tMLQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
To: David Laight <david.laight.linux@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Christian Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandre Ghiti <alex@ghiti.fr>, 
	"H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_223154_217781_DE81D09C 
X-CRM114-Status: GOOD (  23.08  )
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMToyOeKAr0FNIERhdmlkIExhaWdodAo8ZGF2aWQubGFp
Z2h0LmxpbnV4QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDIyIE9jdCAyMDI1IDE5OjM3
OjI3IC0xMDAwCj4gTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3Jn
PiB3cm90ZToKPgo+ID4gT24gV2VkLCAyMiBPY3QgMjAyNSBhdCAxNDowNSwgS3VuaXl1a2kgSXdh
c2hpbWEgPGt1bml5dUBnb29nbGUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gdW5zYWZlX3B1dF91
c2VyKCkgY2FuIGJlIHVzZWQgdG8gc2F2ZSBhIHN0YWMvY2xhYyBwYWlyLCBidXQKPiA+ID4gbWFz
a2VkX3VzZXJfYWNjZXNzX2JlZ2luKCkgb3IgdXNlcl9hY2Nlc3NfYmVnaW4oKSBpbnRyb2R1Y2Vz
Cj4gPiA+IGFuIHVubmVjZXNzYXJ5IGFkZHJlc3MgbWFza2luZyBvciBhY2Nlc3Nfb2soKS4KPiA+
ID4KPiA+ID4gQWRkIGEgbG93LWxldmVsIGhlbHBlciBmb3Igc3VjaCBhIHVzZSBjYXNlLgo+ID4K
PiA+IEkgcmVhbGx5IHN1c3BlY3QgdGhhdCB5b3UgY2Fubm90IGFjdHVhbGx5IG1lYXN1cmUgdGhl
IGNvc3Qgb2YgdGhlCj4gPiBleHRyYSBtYXNraW5nLCBhbmQgd291bGQgYmUgbXVjaCBoYXBwaWVy
IGlmIHlvdSBqdXN0IHVzZWQgYSByZWd1bGFyCj4gPiAidXNlcl9hY2Nlc3NfYmVnaW4oKSIgKHBl
cmhhcHMgdGhlICJ1c2VyX3dyaXRlX2FjY2Vzc19iZWdpbigpIgo+ID4gdmFyaWFudCkuCj4KPiBP
ciB3YWl0IGZvciBzY29wZWRfdXNlcl93cml0ZV9hY2Nlc3MoKSB0byBnZXQgY29tbWl0dGVkIGFu
ZCB0aGVuIHVzZSB0aGF0LgoKSUlVQywgc2NvcGVkX3VzZXJfd3JpdGVfYWNjZXNzKCkgaXMgc2lt
cGx5IGlubGluZWQgdG8KbWFza2VkX3VzZXJfYWNjZXNzX2JlZ2luKCkgb3IgdXNlcl9hY2Nlc3Nf
YmVnaW4oKSwgYW5kIHRoaXMKaXMgdGhlIGNhc2Ugd2hlcmUgSSBzYXcgbm8gaW1wcm92ZW1lbnQg
b3IgZXZlbiB3b3JzZSBwZXJmb3JtYW5jZS4KCj4KPiAgICAgICAgIERhdmlkCj4KPiA+Cj4gPiBU
aGUgbWFza2luZyBpcyB2ZXJ5IGNoZWFwIC0gbGl0ZXJhbGx5IGp1c3QgYSBjb3VwbGUgb2YgQUxV
Cj4gPiBpbnN0cnVjdGlvbnMuIEFuZCB1bmxlc3MgeW91IGNhbiBhY3R1YWxseSBtZWFzdXJlIHNv
bWUgcmVhbCBhZHZhbnRhZ2UKPiA+IG9mIGF2b2lkaW5nIGl0LCBsZXQncyBub3QgYWRkIGFub3Ro
ZXIgaGVscGVyIHRvIHRoaXMgYXJlYS4KClllcywgaXQncyBvbmx5IDMgaW5zdHJ1Y3Rpb25zIG9u
IHg4Nl82NCwgYnV0IGJ5IHNhdmluZyB0aGVtCkkgc2F3IGJldHRlciBwZXJmb3JtYW5jZSBjb25z
dGFudGx5LiAgUGxlYXNlIHNlZSB0aGUgbnVtYmVycyBoZXJlLgpodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjUxMDI0MDUxNjUzLjY2MzI5LTEta3VuaXl1QGdvb2dsZS5jb20vCgoKPiA+
Cj4gPiBXZSBzcGVudCBhIGZhaXIgYW1vdW50IG9mIHRpbWUgdW5kb2luZyB5ZWFycyBvZiAiX19n
ZXRfdXNlcigpIiBhbmQKPiA+ICJfX3B1dF91c2VyKCkiIGNhc2VzIHRoYXQgZGlkbid0IGFjdHVh
bGx5IGhlbHAsIGFuZCBzb21ldGltZXMgb25seQo+ID4gbWFkZSBpdCBoYXJkIHRvIHNlZSB3aGVy
ZSB0aGUgYWN0dWFsIHVzZXIgcG9pbnRlciB2YWxpZGF0aW9uIHdhcyBkb25lLgo+ID4KPiA+ICAg
ICAgICAgICAgICAgIExpbnVzCj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
