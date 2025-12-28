Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B0AE784BE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 12:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ea9TOzKKd4TeuO/yN8VUOM7IG4S7ITeR+EH7ErsJYd8=; b=EnsJMk8Yyv+xPJ
	yKgZjZ2XsbudzjdhyKFN1hUB/cApltioyOjSZlxBsoEDPlI9wjtzPeJ/1d0mR39gD7AQAC14dEy0l
	cyCrdyPBPkaz40B1MTRDTG2CLY287w0cpLNTTHQvbuoluZOOz9s7YK2A+UINSQyznJwEy+Z1xkr3M
	KEWOqYy37O6nC27yPYgd8WJPKclSG992jMCOjsnr0oe1fzdDjtYyfky0URYcwf1zgpd2vPglNXbBY
	qaATNTyk8M2weBYG3uJUiHjWocr+404uEb6KeHruNNHnu530hzw3pmi2VI4AFIga6Ln8RQpxIAE4m
	HKde6yGU7/oAHPtVG4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZq7J-00000002ih9-2wUe;
	Sun, 28 Dec 2025 12:43:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZq7H-00000002ify-3AQz
	for linux-riscv@bombadil.infradead.org;
	Sun, 28 Dec 2025 12:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ubXvmj1fUdXD8dToAHqKBaQMhIVravK57oAPfXT+X64=; b=T0SiPh6asVTENGGeKAbwVJNiZp
	t/YFraeY2r9AhFvvR+g8IwyrvoH2d6l30Pjt8TuLoGaMeuqtctnYJ1CFS0KlFuwOudsFhyeU16+vR
	6i9FcL11+QT8llJR/PbDNrJuUEe1abliC2vXE5zSU8tVgNBBJamhXJCdkC02RkeyinpZO+jQoJn7U
	DKzICKzCoLnzGZbuEtni1GBD7Fe8O4u3X943HLsrCaDy292NUGC1njEC9mxKm7pOVBRm4XAqXzIdO
	ZrMPt/3Xw2fI8sw0P0/z/ohAjsPJBaQGUXEYiXyuP5am+Ypag9yt0f7/ba054X6hczQaN9LOkU92e
	jaYg4jHw==;
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZq7E-000000023y6-0nhO
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 12:43:22 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-644798bb299so6585222d50.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 04:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766925797; x=1767530597; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubXvmj1fUdXD8dToAHqKBaQMhIVravK57oAPfXT+X64=;
        b=CGJovMQtwCh3S/kr8X8d6hi5QaIahSWkjjmSnhKWrNCRBOG9k0pS05pT2nlUH+S/t6
         dPmiXpCXuSk76XIxuG5PgZry/m8+yZctjUX6FvKylcyWnCIepoR6BXGuB6hYaEHQ5ysp
         h9pEcjgKk7cvAXs8QvyST9sTMlL5cy76urg7Gu/RTlvFuNcz9TH0odxYhFb0Amoi82fx
         0OKTOCf1BCbWwUhrFTGeHO7dp+MVgizMr60K/hAQ0YU270gxi7M7l1ZV8FMviIP7evbZ
         PlZL84aZBNATJoEyde6ON2deGR6ascsBRcvGU0BFijk/jB2kREfcr30VEO8Jdq5DpmFK
         Adxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766925797; x=1767530597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ubXvmj1fUdXD8dToAHqKBaQMhIVravK57oAPfXT+X64=;
        b=oEbLy4fRQE32FjqbIXps/7pc69nih6BJsiWLCvujM3Hhq7BMOmzOSg1IU1jarQJDXI
         g7I4YDAaJyrmmYZPGKGBjWA1SUXNEP9iCy4M6wghlnr6JODpmBgWCBXbiFVHGzLQr2q+
         bHqNRUjYM2InWrvVTXbDFWwcNJRvdTm7Anb1My+Syv4tMmvF5oJyYTL/bpLZ1CwMcAbp
         E7YcnTPxG/c5BPhMYGqh1/uvcJfxAlF5HH9eOUGddlmv7Pi4i1tJvaRrtqPo1W80Ii2H
         8YjzeK8W/2iw7XJylaD1MJeY3EcVSTUztf7t2cLYwIXmdN7uOvPScxDniiRVKRqH/Mym
         rzuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK9uCFREULO+lAHxwQShBZw9pXTdWwd3UabPFid3+i9iQwyCzrQ6x/S/3OWiX77ts3dX8BMKSf/I/wVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNO95ntlZAceF9J7a2JXNUUfQqgFTpaFVyBvrMgZZES/fRxXfk
	rG6JD8J05u/KRMuRUaOOQdDgQ5cAcRXcDwR23uyX4SJO8lU2D7nuWqUH3SZnuHH+R+8BnV5O/jm
	xrfn0YwwBQntqGwS3F22NbRiiDPM1i5k3LdGEZafHtlETMKcwkx8jNXoEeg==
X-Gm-Gg: AY/fxX44Fh3BexlolqvDBRLH1F1lMDj1QBLPfVVu8d2+7+ftl4hhDKeBnafsj1sCutU
	ub8k5HjEwagpfvOI3fjB32R/48HMwJ0jKwGq9+zYcL2nouzer7U/6E653vrijisDohYyqWXYVlq
	bUrOfqRoKxIezOcMT44Wvbd8uD/NSof/DIfjcOv7oH7YDlllRskKQ7nmX81a8KXLYHj71F5yfvK
	NNQLnBCyDjCDtuzhbaPUU0NM+U1SAMjGhS3zkNtconlD9hU5oYargeBHrGkjq5SP+OxxaE2kcnE
	fg8dKJIiz7wl341HeShwYNc59tF8qGTa63HdatzOcJab
X-Google-Smtp-Source: AGHT+IHppMMkEW6WFB0HEo0ifxTYnk4oEPsIke/IUQFq16jbr9MVRxACLruWnHcI0AyOA5DYLrW7GjdWONuaMWC32sY=
X-Received: by 2002:a05:690e:1402:b0:644:60d9:867a with SMTP id
 956f58d0204a3-6466a8e7f1amr19754124d50.95.1766925796931; Sun, 28 Dec 2025
 04:43:16 -0800 (PST)
MIME-Version: 1.0
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-10-3af3f3cd0f8a@riscstar.com> <0253c25d-f5fd-46f1-b4d3-ec56909d5eac@riscstar.com>
In-Reply-To: <0253c25d-f5fd-46f1-b4d3-ec56909d5eac@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 20:43:02 +0800
X-Gm-Features: AQt7F2qXu9cqHVEnLlLdWdHISUhUuV8HhHEXXaEigmu6Qha30-fVIyENTL3svVE
Message-ID: <CAH1PCMa0NqZGQAknRZppVWUEBzKDE7tcega7bsT187+=wc-_YQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] dt-bindings: riscv: Add Sha and its comprised extensions
To: Alex Elder <elder@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_124320_865560_B7296440 
X-CRM114-Status: GOOD (  25.70  )
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

SGksIEFsZXgKCk9uIFNhdCwgRGVjIDI3LCAyMDI1IGF0IDU6MjjigK9BTSBBbGV4IEVsZGVyIDxl
bGRlckByaXNjc3Rhci5jb20+IHdyb3RlOgo+Cj4gT24gMTIvMjIvMjUgNzowNCBBTSwgR3VvZG9u
ZyBYdSB3cm90ZToKPiA+IEFkZCBkZXNjcmlwdGlvbnMgZm9yIHRoZSBTaGEgZXh0ZW5zaW9uIGFu
ZCB0aGUgc2V2ZW4gZXh0ZW5zaW9ucyBpdAo+ID4gY29tcHJpc2VzOiBTaGNvdW50ZXJlbncsIFNo
Z2F0cGEsIFNodHZhbGEsIFNodnNhdHBhLCBTaHZzdHZhbGEsIFNodnN0dmVjZCwKPiA+IGFuZCBT
c3N0YXRlZW4uCj4gPgo+ID4gU2hhIGlzIHJhdGlmaWVkIGluIHRoZSBSVkEyMyBQcm9maWxlcyBW
ZXJzaW9uIDEuMCAoY29tbWl0IDAyNzNmM2M5MjFiNgo+ID4gInJ2YTIzL3J2YjIzIHJhdGlmaWVk
IikgYXMgYSBuZXcgcHJvZmlsZS1kZWZpbmVkIGV4dGVuc2lvbiB0aGF0IGNhcHR1cmVzCj4gPiB0
aGUgZnVsbCBzZXQgb2YgZmVhdHVyZXMgdGhhdCBhcmUgbWFuZGF0ZWQgdG8gYmUgc3VwcG9ydGVk
IGFsb25nIHdpdGgKPiA+IHRoZSBIIGV4dGVuc2lvbi4KPiA+Cj4gPiBFeHRlbnNpb25zIFNoY291
bnRlcmVudywgU2hnYXRwYSwgU2h0dmFsYSwgU2h2c2F0cGEsIFNodnN0dmFsYSwgU2h2c3R2ZWNk
LAo+ID4gYW5kIFNzc3RhdGVlbiBhcmUgcmF0aWZpZWQgaW4gdGhlIFJJU0MtViBQcm9maWxlcyBW
ZXJzaW9uIDEuMCAoY29tbWl0Cj4gPiBiMWQ4MDY2MDVmODcgIlVwZGF0ZWQgdG8gcmF0aWZpZWQg
c3RhdGUiKS4KPiA+Cj4gPiBUaGUgcmVxdWlyZW1lbnQgc3RhdHVzIGZvciBTaGEgYW5kIGl0cyBj
b21wcmlzZWQgZXh0ZW5zaW9uIGluIFJJU0MtVgo+ID4gUHJvZmlsZXMgYXJlOgo+ID4gICAtIFNo
YTogTWFuZGF0b3J5IGluIFJWQTIzUzY0Cj4gPiAgIC0gSDogT3B0aW9uYWwgaW4gUlZBMjJTNjQ7
IE1hbmRhdG9yeSBpbiBSVkEyM1M2NAo+ID4gICAtIFNoY291bnRlcmVudzogT3B0aW9uYWwgaW4g
UlZBMjJTNjQ7IE1hbmRhdG9yeSBpbiBSVkEyM1M2NAo+ID4gICAtIFNoZ2F0cGE6IE9wdGlvbmFs
IGluIFJWQTIyUzY0OyBNYW5kYXRvcnkgaW4gUlZBMjNTNjQKPiA+ICAgLSBTaHR2YWxhOiBPcHRp
b25hbCBpbiBSVkEyMlM2NDsgTWFuZGF0b3J5IGluIFJWQTIzUzY0Cj4gPiAgIC0gU2h2c2F0cGE6
IE9wdGlvbmFsIGluIFJWQTIyUzY0OyBNYW5kYXRvcnkgaW4gUlZBMjNTNjQKPiA+ICAgLSBTaHZz
dHZhbGE6IE9wdGlvbmFsIGluIFJWQTIyUzY0OyBNYW5kYXRvcnkgaW4gUlZBMjNTNjQKPiA+ICAg
LSBTaHZzdHZlY2Q6IE9wdGlvbmFsIGluIFJWQTIyUzY0OyBNYW5kYXRvcnkgaW4gUlZBMjNTNjQK
PiA+ICAgLSBTc3N0YXRlZW46IE9wdGlvbmFsIGluIFJWQTIyUzY0OyBNYW5kYXRvcnkgaW4gUlZB
MjNTNjQKPiA+Cj4gPiBBZGQgc2NoZW1hIGNoZWNrcyB0byBlbmZvcmNlIHRoYXQgU2hhIGltcGxp
ZXMgdGhlIHByZXNlbmNlIG9mIGFsbCBpdHMKPiA+IGNvbXByaXNlZCBleHRlbnNpb25zLgo+Cj4g
TGlrZSBwYXRjaCA3IGluIHlvdXIgc2VyaWVzLCBJICp0aGluayogd2hhdCB5b3UncmUgZG9pbmcK
PiBpbiB0cnlpbmcgdG8gaW1wbHkgdGhlIHByZXNlbmNlIG9mIHRoZXNlIG90aGVyIGV4dGVuc2lv
bnMKPiBpcyBhY3R1YWxseSByZXF1aXJpbmcgYWxsIHRob3NlIGV4dGVuc2lvbnMgdG8gYmUgcHJl
c2VudAo+ICppbiBhZGRpdGlvbiogdG8ganVzdCAiU2hhIi4gIEkgZG9uJ3QgdGhpbmsgdGhhdCdz
IHdoYXQKPiB3ZSB3YW50LgoKSSB0ZW5kIHRvIHRoaW5rIHRoaXMgc2NoZW1hIGNoZWNrIGJsb2Nr
IHNob3VsZCBiZSByZW1vdmVkLiBDb25vciBleHByZXNzZWQKc2ltaWxhciBkZXNpZ24gbG9naWMg
aW4gaGlzIGNvbW1lbnRzIHRvIG15IFBhdGNoIDcvMTMgb2YgdjIgc2VyaWVzLgoKSWYgdGhlcmUg
aXMgbm8gb2JqZWN0aW9uLCBJIHdpbGwgcmVtb3ZlIGl0LgoKQlIsCkd1b2RvbmcKCgo+Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC1BbGV4Cj4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+ID4gLS0tCj4gPiB2Mjog
TmV3IHBhdGNoLgo+ID4gLS0tCj4gPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbCAgICAgIHwgNzkgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgNzkgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gaW5k
ZXggZWQ3YTg4YzBhYjNiN2RjN2FkNGE0ZDJmZDMwMGQ2ZmIzM2VmMDUwYy4uMTA2NmI3ZTY1ZGFi
ODk3MDRkYmFjNDQ5ZGI0YWE1NjA1Yzk1YjlkMyAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+
IEBAIC0xMjgsNiArMTI4LDU3IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgIHZlcnNp
b24gb2YgdGhlIHByaXZpbGVnZWQgSVNBIHNwZWNpZmljYXRpb24uCj4gPgo+ID4gICAgICAgICAg
ICMgbXVsdGktbGV0dGVyIGV4dGVuc2lvbnMsIHNvcnRlZCBhbHBoYW51bWVyaWNhbGx5Cj4gPiAr
ICAgICAgICAtIGNvbnN0OiBzaGEKPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ICsg
ICAgICAgICAgICBUaGUgc3RhbmRhcmQgU2hhIGV4dGVuc2lvbiBmb3IgYXVnbWVudGVkIGh5cGVy
dmlzb3IgZXh0ZW5zaW9uIGFzCj4gPiArICAgICAgICAgICAgcmF0aWZpZWQgaW4gUlZBMjMgUHJv
ZmlsZXMgVmVyc2lvbiAxLjAsIHdpdGggY29tbWl0IDAyNzNmM2M5MjFiNgo+ID4gKyAgICAgICAg
ICAgICgicnZhMjMvcnZiMjMgcmF0aWZpZWQiKS4KPiA+ICsKPiA+ICsgICAgICAgICAgICBTaGEg
Y2FwdHVyZXMgdGhlIGZ1bGwgc2V0IG9mIGZlYXR1cmVzIHRoYXQgYXJlIG1hbmRhdGVkIHRvIGJl
Cj4gPiArICAgICAgICAgICAgc3VwcG9ydGVkIGFsb25nIHdpdGggdGhlIEggZXh0ZW5zaW9uLiBT
aGEgY29tcHJpc2VzIHRoZSBmb2xsb3dpbmcKPiA+ICsgICAgICAgICAgICBleHRlbnNpb25zOiBI
LCBTaGNvdW50ZXJlbncsIFNoZ2F0cGEsIFNodHZhbGEsIFNodnNhdHBhLCBTaHZzdHZhbGEsCj4g
PiArICAgICAgICAgICAgU2h2c3R2ZWNkLCBhbmQgU3NzdGF0ZWVuLgo+ID4gKwo+ID4gKyAgICAg
ICAgLSBjb25zdDogc2hjb3VudGVyZW53Cj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4g
PiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNoY291bnRlcmVudyBleHRlbnNpb24gZm9yIHN1
cHBvcnQgd3JpdGFibGUgZW5hYmxlcwo+ID4gKyAgICAgICAgICAgIGluIGhjb3VudGVyZW4gZm9y
IGFueSBzdXBwb3J0ZWQgY291bnRlciwgYXMgcmF0aWZpZWQgaW4gUklTQy1WCj4gPiArICAgICAg
ICAgICAgUHJvZmlsZXMgVmVyc2lvbiAxLjAsIHdpdGggY29tbWl0IGIxZDgwNjYwNWY4NyAoIlVw
ZGF0ZWQgdG8KPiA+ICsgICAgICAgICAgICByYXRpZmllZCBzdGF0ZS4iKQo+ID4gKwo+ID4gKyAg
ICAgICAgLSBjb25zdDogc2hnYXRwYQo+ID4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4g
KyAgICAgICAgICAgIFRoZSBzdGFuZGFyZCBTaGdhdHBhIGV4dGVuc2lvbiBpbmRpY2F0ZXMgdGhh
dCBmb3IgZWFjaCBzdXBwb3J0ZWQKPiA+ICsgICAgICAgICAgICB2aXJ0dWFsIG1lbW9yeSBzY2hl
bWUgU3ZOTiBzdXBwb3J0ZWQgaW4gc2F0cCwgdGhlIGNvcnJlc3BvbmRpbmcKPiA+ICsgICAgICAg
ICAgICBoZ2F0cCBTdk5OeDQgbW9kZSBtdXN0IGJlIHN1cHBvcnRlZC4gVGhlIGhnYXRwIG1vZGUg
QmFyZSBtdXN0Cj4gPiArICAgICAgICAgICAgYWxzbyBiZSBzdXBwb3J0ZWQuIEl0IGlzIHJhdGlm
aWVkIGluIFJJU0MtViBQcm9maWxlcyBWZXJzaW9uIDEuMCwKPiA+ICsgICAgICAgICAgICB3aXRo
IGNvbW1pdCBiMWQ4MDY2MDVmODcgKCJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIpCj4gPiAr
Cj4gPiArICAgICAgICAtIGNvbnN0OiBzaHR2YWxhCj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9u
OiB8Cj4gPiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNodHZhbGEgZXh0ZW5zaW9uIGZvciBo
dHZhbCBiZSB3cml0dGVuIHdpdGggdGhlCj4gPiArICAgICAgICAgICAgZmF1bHRpbmcgZ3Vlc3Qg
cGh5c2ljYWwgYWRkcmVzcyBpbiBhbGwgY2lyY3Vtc3RhbmNlcyBwZXJtaXR0ZWQgYnkKPiA+ICsg
ICAgICAgICAgICB0aGUgSVNBLiBJdCBpcyByYXRpZmllZCBpbiBSSVNDLVYgUHJvZmlsZXMgVmVy
c2lvbiAxLjAsIHdpdGgKPiA+ICsgICAgICAgICAgICBjb21taXQgYjFkODA2NjA1Zjg3ICgiVXBk
YXRlZCB0byByYXRpZmllZCBzdGF0ZS4iKQo+ID4gKwo+ID4gKyAgICAgICAgLSBjb25zdDogc2h2
c2F0cGEKPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ICsgICAgICAgICAgICBUaGUg
c3RhbmRhcmQgU2h2c2F0cGEgZXh0ZW5zaW9uIGZvciB2c2F0cCBzdXBwb3J0aW5nIGFsbCB0cmFu
c2xhdGlvbgo+ID4gKyAgICAgICAgICAgIG1vZGVzIHN1cHBvcnRlZCBpbiBzYXRwLCBhcyByYXRp
ZmllZCBpbiBSSVNDLVYgUHJvZmlsZXMgVmVyc2lvbiAxLjAsCj4gPiArICAgICAgICAgICAgd2l0
aCBjb21taXQgYjFkODA2NjA1Zjg3ICgiVXBkYXRlZCB0byByYXRpZmllZCBzdGF0ZS4iKQo+ID4g
Kwo+ID4gKyAgICAgICAgLSBjb25zdDogc2h2c3R2YWxhCj4gPiArICAgICAgICAgIGRlc2NyaXB0
aW9uOiB8Cj4gPiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNodnN0dmFsYSBleHRlbnNpb24g
Zm9yIHZzdHZhbCBwcm92aWRlcyBhbGwgbmVlZGVkCj4gPiArICAgICAgICAgICAgdmFsdWVzIGFz
IHJhdGlmaWVkIGluIFJJU0MtViBQcm9maWxlcyBWZXJzaW9uIDEuMCwgd2l0aCBjb21taXQKPiA+
ICsgICAgICAgICAgICBiMWQ4MDY2MDVmODcgKCJVcGRhdGVkIHRvIHJhdGlmaWVkIHN0YXRlLiIp
Cj4gPiArCj4gPiArICAgICAgICAtIGNvbnN0OiBzaHZzdHZlY2QKPiA+ICsgICAgICAgICAgZGVz
Y3JpcHRpb246IHwKPiA+ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU2h2c3R2ZWNkIGV4dGVu
c2lvbiBmb3IgdnN0dmVjIHN1cHBvcnRpbmcgRGlyZWN0IG1vZGUsCj4gPiArICAgICAgICAgICAg
YXMgcmF0aWZpZWQgaW4gUklTQy1WIFByb2ZpbGVzIFZlcnNpb24gMS4wLCB3aXRoIGNvbW1pdCBi
MWQ4MDY2MDVmODcKPiA+ICsgICAgICAgICAgICAoIlVwZGF0ZWQgdG8gcmF0aWZpZWQgc3RhdGUu
IikKPiA+ICsKPiA+ICAgICAgICAgICAtIGNvbnN0OiBzbWFpYQo+ID4gICAgICAgICAgICAgZGVz
Y3JpcHRpb246IHwKPiA+ICAgICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNtYWlhIHN1cGVydmlz
b3ItbGV2ZWwgZXh0ZW5zaW9uIGZvciB0aGUgYWR2YW5jZWQKPiA+IEBAIC0xODYsNiArMjM3LDEy
IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgIHJhdGlmaWVkIGF0IGNvbW1pdCBkNzAw
MTFkZGU2YzIgKCJVcGRhdGUgdG8gcmF0aWZpZWQgc3RhdGUiKQo+ID4gICAgICAgICAgICAgICBv
ZiByaXNjdi1qLWV4dGVuc2lvbi4KPiA+Cj4gPiArICAgICAgICAtIGNvbnN0OiBzc3N0YXRlZW4K
PiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ICsgICAgICAgICAgICBUaGUgc3RhbmRh
cmQgU3NzdGF0ZWVuIGV4dGVuc2lvbiBmb3Igc3VwZXJ2aXNvci1tb2RlIHZpZXcgb2YgdGhlCj4g
PiArICAgICAgICAgICAgc3RhdGUtZW5hYmxlIGV4dGVuc2lvbiwgYXMgcmF0aWZpZWQgaW4gUklT
Qy1WIFByb2ZpbGVzIFZlcnNpb24gMS4wLAo+ID4gKyAgICAgICAgICAgIHdpdGggY29tbWl0IGIx
ZDgwNjYwNWY4NyAoIlVwZGF0ZWQgdG8gcmF0aWZpZWQgc3RhdGUuIikKPiA+ICsKPiA+ICAgICAg
ICAgICAtIGNvbnN0OiBzc3RjCj4gPiAgICAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gICAg
ICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3N0YyBzdXBlcnZpc29yLWxldmVsIGV4dGVuc2lvbiBm
b3IgdGltZSBjb21wYXJlIGFzCj4gPiBAQCAtODEzLDYgKzg3MCwyOCBAQCBwcm9wZXJ0aWVzOgo+
ID4gICAgICAgICAgICAgICAgICAgY29uc3Q6IHpiYgo+ID4gICAgICAgICAgICAgICAtIGNvbnRh
aW5zOgo+ID4gICAgICAgICAgICAgICAgICAgY29uc3Q6IHpicwo+ID4gKyAgICAgICMgc2hhIGNv
bXByaXNlcyB0aGUgZm9sbG93aW5nIGV4dGVuc2lvbnMKPiA+ICsgICAgICAtIGlmOgo+ID4gKyAg
ICAgICAgICBjb250YWluczoKPiA+ICsgICAgICAgICAgICBjb25zdDogc2hhCj4gPiArICAgICAg
ICB0aGVuOgo+ID4gKyAgICAgICAgICBhbGxPZjoKPiA+ICsgICAgICAgICAgICAtIGNvbnRhaW5z
Ogo+ID4gKyAgICAgICAgICAgICAgICBjb25zdDogaAo+ID4gKyAgICAgICAgICAgIC0gY29udGFp
bnM6Cj4gPiArICAgICAgICAgICAgICAgIGNvbnN0OiBzaGNvdW50ZXJlbncKPiA+ICsgICAgICAg
ICAgICAtIGNvbnRhaW5zOgo+ID4gKyAgICAgICAgICAgICAgICBjb25zdDogc2hnYXRwYQo+ID4g
KyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4gPiArICAgICAgICAgICAgICAgIGNvbnN0OiBzaHR2
YWxhCj4gPiArICAgICAgICAgICAgLSBjb250YWluczoKPiA+ICsgICAgICAgICAgICAgICAgY29u
c3Q6IHNodnNhdHBhCj4gPiArICAgICAgICAgICAgLSBjb250YWluczoKPiA+ICsgICAgICAgICAg
ICAgICAgY29uc3Q6IHNodnN0dmFsYQo+ID4gKyAgICAgICAgICAgIC0gY29udGFpbnM6Cj4gPiAr
ICAgICAgICAgICAgICAgIGNvbnN0OiBzaHZzdHZlY2QKPiA+ICsgICAgICAgICAgICAtIGNvbnRh
aW5zOgo+ID4gKyAgICAgICAgICAgICAgICBjb25zdDogc3NzdGF0ZWVuCj4gPiAgICAgICAgICMg
WmNiIGRlcGVuZHMgb24gWmNhCj4gPiAgICAgICAgIC0gaWY6Cj4gPiAgICAgICAgICAgICBjb250
YWluczoKPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
