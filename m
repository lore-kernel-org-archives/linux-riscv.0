Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5693C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 13:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdgKJ2WD+c56dYf5mDgO2g/khPNl4ugzFK9RMU49vlA=; b=X7fd44xA4KMiR9
	QwUPsGRCoaZJzSnKC7iFkzlFi7HUaoOUYJ1m+V2rTAaQ9T6xMhA5pbR3+/OvmmX/+FJf6jcpQUhTk
	q1XuogDE1z/46S1Ql5RsyF+t0qmXBOIYKxbiuJSEJQ7X5uzLeTDzJakwfbYQ6bU0GlFmCN4MzPNSu
	M/uxwJ7apOg35LCjPcypnheL6Gx9Xccn2RmIQZRlRFP3bO0tLCGjNOva6kI2C1UH4SQ9k5DiPhmW4
	AZD4KlnFh/d2zRdHmMjiKycQnDgqVHbKwnx4zeNyO/8YaBi3jHFtvjS7EYe386T7WEYRXLAjTbbol
	+RphsBuDBlk59R0pwCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPsd-0000000EnLm-0tcl;
	Tue, 20 Feb 2024 13:09:51 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPsZ-0000000EnKI-3b3G
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 13:09:49 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3654aa79d6eso1088845ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 05:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1708434586; x=1709039386; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20voKxE+jWNuTLz3X5MuseyKDNhrLXnhCuKfseH4ExI=;
        b=su+gNGfSxIbOwQZiOa/Gr6D2172K7fSiZla8XoNaUpTV9f5EjDaHCnvY4VdMXRAnQi
         0QfM7E3LUgBiLdnurmUGGgJItqFzqb1CQtVAcA7V17RtAgciW3r7EHZSJRpmsvD+bIvM
         p9AewG5RtJFSIrXKBNu0/c+RhgddnF1QeSpsdnlM8DvXtZdKkeW2pknDzSxqU8UQ5KCc
         Wzh4+BRdAGE3aLYs55XoubnLh6HDWdXnSSLeH1ghfnoGC2V8KXqWFhQQRHEnLdmWzT9f
         IXV3KE9CoHiMRiLYq7uKyh8NbHkxGFck06N9BKcpoex7Y2q8De4o9Ooi4wsnaLF1yMdG
         piTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708434586; x=1709039386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20voKxE+jWNuTLz3X5MuseyKDNhrLXnhCuKfseH4ExI=;
        b=bhrsZei+kPeaYo1suCiO4z+zgnB8UeScDT6T+WI/4rOJtaWVcG9VIzivZ+u/xonotX
         2uZS1ihqHcDXvcDHFAzTL0QHwwMZk+Gmv/BqjlNb/LU5kqM6eBQBuUHvjj3KbJLXUQY7
         fQ/OtqJVorRVHEHqkgVYTLJgpyjBMlop0xdsOMeLJwryzji5n9k6PZwvEpWWs3ng+RqE
         OWpDCGrEXeUUtlFlKPG+fFnryRysiE5q36bWKj9YcftMd3wTtnE9easf+3aMVyofDQMS
         Ik9eqY4NvvJg3Dsls/5QA0wxhfxQ6rmH7nuqkq+wQayKyy0e1BKs94fn/SvbQgJzqjDp
         UirQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV/7oTEUJ94wgT0ITve/U4ntOyF6hgdZSUHFkG/ThFTLfJfhcgBb+lYtOTgR/UqeGCV1IsCgSwcWtSMC26stzVrPvF0upr7xLcyaid3m64
X-Gm-Message-State: AOJu0YzeDTnTW00IoRTYQ8sjoQ/ZpnJp5U1s0glrQn3n8Ug8AdSi8z12
	r4DfdNorKrhZB3ZCduNlaZtZbRfrwlXhU3wlgsLWQq9knJpjDolVuzTVSEjQP4byIZUzyySQIHd
	e2cvi79WwfcLIbI38u8zFBUefE5Be23Kq3BKa0A==
X-Google-Smtp-Source: AGHT+IG41ou30YJCOaxfxdNlKINx1EJpgmhDcnqm4VJu+XqIGtYblfps8b9oCfMT10q7hZCaSRX5MiHJxIyxF63cy3s=
X-Received: by 2002:a05:6e02:154f:b0:363:8560:977d with SMTP id
 j15-20020a056e02154f00b003638560977dmr21841871ilu.3.1708434586491; Tue, 20
 Feb 2024 05:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20240220060718.823229-1-apatel@ventanamicro.com> <87edd7fj3d.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87edd7fj3d.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Feb 2024 18:39:34 +0530
Message-ID: <CAAhSdy1mDnE0Z5hs+LHrSUmQzEBC3EHF2TfU=Bd416RacgbjeA@mail.gmail.com>
Subject: Re: [PATCH v13 00/13] Linux RISC-V AIA Support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_050948_147360_7E50749E 
X-CRM114-Status: GOOD (  17.81  )
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

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgNToyMuKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
IHdyaXRlczoKPgo+ID4gVGhlIFJJU0MtViBBSUEgc3BlY2lmaWNhdGlvbiBpcyByYXRpZmllZCBh
cy1wZXIgdGhlIFJJU0MtViBpbnRlcm5hdGlvbmFsCj4gPiBwcm9jZXNzLiBUaGUgbGF0ZXN0IHJh
dGlmaWVkIEFJQSBzcGVjaWZjYXRpb24gY2FuIGJlIGZvdW5kIGF0Ogo+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2L3Jpc2N2LWFpYS9yZWxlYXNlcy9kb3dubG9hZC8xLjAvcmlzY3YtaW50ZXJy
dXB0cy0xLjAucGRmCj4gPgo+ID4gQXQgYSBoaWdoLWxldmVsLCB0aGUgQUlBIHNwZWNpZmljYXRp
b24gYWRkcyB0aHJlZSB0aGluZ3M6Cj4gPiAxKSBBSUEgQ1NScwo+ID4gICAgLSBJbXByb3ZlZCBs
b2NhbCBpbnRlcnJ1cHQgc3VwcG9ydAo+ID4gMikgSW5jb21pbmcgTWVzc2FnZSBTaWduYWxlZCBJ
bnRlcnJ1cHQgQ29udHJvbGxlciAoSU1TSUMpCj4gPiAgICAtIFBlci1IQVJUIE1TSSBjb250cm9s
bGVyCj4gPiAgICAtIFN1cHBvcnQgTVNJIHZpcnR1YWxpemF0aW9uCj4gPiAgICAtIFN1cHBvcnQg
SVBJIGFsb25nIHdpdGggdmlydHVhbGl6YXRpb24KPiA+IDMpIEFkdmFuY2VkIFBsYXRmb3JtLUxl
dmVsIEludGVycnVwdCBDb250cm9sbGVyIChBUExJQykKPiA+ICAgIC0gV2lyZWQgaW50ZXJydXB0
IGNvbnRyb2xsZXIKPiA+ICAgIC0gSW4gTVNJLW1vZGUsIGNvbnZlcnRzIHdpcmVkIGludGVycnVw
dCBpbnRvIE1TSXMgKGkuZS4gTVNJIGdlbmVyYXRvcikKPiA+ICAgIC0gSW4gRGlyZWN0LW1vZGUs
IGluamVjdHMgZXh0ZXJuYWwgaW50ZXJydXB0cyBkaXJlY3RseSBpbnRvIEhBUlRzCj4gPgo+ID4g
Rm9yIGFuIG92ZXJ2aWV3IG9mIHRoZSBBSUEgc3BlY2lmaWNhdGlvbiwgcmVmZXIgdGhlIEFJQSB2
aXJ0dWFsaXphdGlvbgo+ID4gdGFsayBhdCBLVk0gRm9ydW0gMjAyMjoKPiA+IGh0dHBzOi8vc3Rh
dGljLnNjaGVkLmNvbS9ob3N0ZWRfZmlsZXMva3ZtZm9ydW0yMDIyL2ExL0FJQV9WaXJ0dWFsaXph
dGlvbl9pbl9LVk1fUklTQ1ZfZmluYWwucGRmCj4gPiBodHRwczovL3d3dy55b3V0dWJlLmNvbS93
YXRjaD92PXIwNzFkTDhaMHlvCj4gPgo+ID4gVG8gdGVzdCB0aGlzIHNlcmllcywgdXNlIFFFTVUg
djcuMiAob3IgaGlnaGVyKSBhbmQgT3BlblNCSSB2MS4yIChvciBoaWdoZXIpLgo+ID4KPiA+IFRo
aXMgc2VyaWVzIGRlcGVuZHMgdXBvbiBwZXItZGV2aWNlIE1TSSBkb21haW4gcGF0Y2hlcyBtZXJn
ZWQgYnkgVGhvbWFzICh0Z2x4KQo+ID4gd2hpY2ggYXJlIGF2YWlsYWJsZSBpbiBpcnEvbXNpIGJy
YW5jaCBhdDoKPiA+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90aXAvdGlwLmdpdAo+ID4KPiA+IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4g
dGhlIHJpc2N2X2FpYV92MTMgYnJhbmNoIGF0Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0
ZWwvbGludXguZ2l0Cj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSB2MTI6Cj4gPiAgLSBSZWJhc2VkIG9u
IExpbnV4LTYuOC1yYzUKPiA+ICAtIERyb3BwZWQgcGVyLWRldmljZSBNU0kgZG9tYWluIHBhdGNo
ZXMgd2hpY2ggYXJlIGFscmVhZHkgbWVyZ2VkIGJ5IFRob21hcyAodGdseCkKPiA+ICAtIEFkZHJl
c3NlZCBuaXQgY29tbWVudHMgZnJvbSBUaG9tYXMgYW5kIENsZW1lbnQKPiA+ICAtIEFkZGVkIGEg
bmV3IHBhdGNoMiB0byBmaXggbG9jayBkZXBlbmRlbmN5IHdhcm5pbmcKPiA+ICAtIFJlcGxhY2Vk
IGxvY2FsIHN5bmMgSVBJIGluIHRoZSBJTVNJQyBkcml2ZXIgd2l0aCBwZXItQ1BVIHRpbWVyCj4g
PiAgLSBTaW1wbGlmaWVkIGxvY2tpbmcgaW4gdGhlIElNU0lDIGRyaXZlciB0byBhdm9pZCBsb2Nr
IGRlcGVuZGVuY3kgaXNzdWVzCj4gPiAgLSBBZGRlZCBhIGRpcnR5IGJpdG1hcCBpbiB0aGUgSU1T
SUMgZHJpdmVyIHRvIG9wdGltaXplIHBlci1DUFUgbG9jYWwgc3luYyBsb29wCj4KPiBUaGFua3Ms
IEFudXAuCj4KPiBJIHdpbGwgdGFrZSBpdCBmb3IgYSBzcGluLCB3aXRoIEFsZXgnIHYxIG9mIHRo
ZSBzdG9wX21hY2hpbmUoKS9mdHJhY2UKPiBJUEkgZml4Lgo+Cj4gVGhlIGRlZmNvbmZpZyBjaGFu
Z2UgKDEyLzEzKWJyZWFrcyBhIGJ1bmNoIGEgYnVpbGRzOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9saXN0Lz9zZXJpZXM9ODI3NzA2Cj4KPiBEb3du
bG9hZCB0aGUgbG9ncyBoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9saW51
eC1yaXNjdi9zdWl0ZXMvMjA5MTcxMDIxNjAvbG9ncz9hdHRlbXB0PTEKPiBhbmQgZ3JlcCBmb3Ig
JyMjW2Vycm9yXScKCllvdSBuZWVkIHRvIHB1bGwtaW4gMTQgZGVwZW5kZW50IHBhdGNoZXMgd2hp
Y2ggVGhvbWFzIGhhcyBtZXJnZWQKaW4gaGlzIGlycS9tc2kgYnJhbmNoIGF0CmdpdDovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdpdC4KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
