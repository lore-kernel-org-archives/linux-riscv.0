Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A51C4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 13:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPkvjdnvy2z9ihKTxqePm28aFoBFDaiZKjpNu00QAk8=; b=raWMpxnmY4PIlR
	juQwgEsSzwFgGFjRalb7ntCQ8TOB0N3nOKREps2IY4W1DC+sw4sz7NPv1KfEcxqGUA3AS1HpmD5lx
	gltBV+0uXp6iDCp+I1XWxnOUNPWad89W0PecctxiZk/iI7lcQ4qqB6ZJMbaSWGvIzLliYfB5Y4gYP
	yzaZKFAM4cxi72plmg5oveBRHxkM0wOOFp2k5TF1xml22fOT2ZqZvckMvzmYychSATrtSsUs+0oXO
	0E+JEma+2z3+jZFUDFWRRB/SqNAzBL6Q6vn/hPXkRBEEq+FJZLQ+vXSkB2SBL7i7a1M/cohoiI1qQ
	yZ7BsHBnyQ4NplM2TwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVXGY-0000000878X-3wtL;
	Thu, 01 Feb 2024 13:38:06 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVWlB-00000007tgX-3LeO
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 13:05:42 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7d625a3ace6so313761241.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 05:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706792739; x=1707397539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fdnwK8iaaWfuANgz2bEov8b83FWFpe1U9HGTL70t+I=;
        b=g3zvMZB/07SoTeKSJ320Tpua5IQHH2DLng0w9gCbZHLWQ6mU4s+nWetM4pATCshl2p
         2/8jgew91zC0fZI3ur0XkQo43NLBtVeUFNdNBwdEl09UAgMK/sI/HcXwpG2Pbg04E96W
         dDtcEk17oswlvOFAJvH3SSPoOi4Yb0DLI12NKiaRjZoVNQCZjvYFOMRPZL1NgMkxskTm
         k8TXUwxR3hom5NrgpBYUChEOEMfpG1Ym8A/TR17f98QkrxYbBhUFe7I8Z4cu7mhCVDIB
         YMi69y5hVbfgY4nmrpB+dBPXFo3rj+g8hmpseWsp01tp7GJVtZ6S68bxPCoLgg5L45AL
         r5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706792739; x=1707397539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fdnwK8iaaWfuANgz2bEov8b83FWFpe1U9HGTL70t+I=;
        b=qx0kVEzv1iA0UNCBa4IXhE0zsF3J9r88sMBbhZGEYrb9O3ih+4bnwmL/74YLXLu9M0
         GhyU/nEIFq7C8+2yhPmF1DEhVJ3qePfX6N5zx0jiPF2HbEQlqkO0R4KtPbaDXTVnRcr1
         fIHn5FxVWADFHTSfwAuGxuhhZMOhRpAFJLuIaXEufMjkE42luFGzkkNkX8k/aJ5M4rQO
         QlhcDHP3vIUT5pOgUJ6G3LL/ijJfopaAPjSrwyDXnVwyL2RbNLR0kI7kMstLLKZCzKD6
         dfxEMpfzE0/f4xKchMPFxV/lE1e0ZB2Y9GkRYnei6cBI3LLXP/21uGp6pzy12lFPejHr
         k+Jg==
X-Gm-Message-State: AOJu0YynXDegDo6hbcMAEmpQVaHP6JqJCVpopdalLv/AYLUx5nFa6THp
	AqMfYYez1sj4FTpHUKR6UeAhyiu01ZERDSOtNizTlzKqz/tvlUD23It+Z16GQtE8lBx810FH74a
	fIx17ZuqV6JA+US251S3PQnmFaLk=
X-Google-Smtp-Source: AGHT+IFigfduTRWsVmPlC+0JRfAbL46rAzX8asmlX4/T+JbyargMaUcC1tcGZu/+10b2CLWwTtcY1LRuKIsCJEiZcSk=
X-Received: by 2002:a05:6122:e6b:b0:4b7:3c54:357e with SMTP id
 bj43-20020a0561220e6b00b004b73c54357emr3297980vkb.1.1706792739290; Thu, 01
 Feb 2024 05:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV7Q4kMv1pFVNBf5oYF=_W_snp=5GKLpr9+OxeqxywhBw@mail.gmail.com>
 <CA+V-a8spFYvOo2=9CwM-1EyMA3Xrc_rggUgxDZwZan2ou4SG1A@mail.gmail.com> <CAMuHMdUFZ6pRtZv4QLGhTz_gG575-8-LvaFprNuP2-1HGS8r+A@mail.gmail.com>
In-Reply-To: <CAMuHMdUFZ6pRtZv4QLGhTz_gG575-8-LvaFprNuP2-1HGS8r+A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 Feb 2024 13:05:05 +0000
Message-ID: <CA+V-a8tQRr96q6SJfCgPa7Zte4UhRHE+83hXNzN8-=rRX5EH0Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_050541_885038_00DC6E3B 
X-CRM114-Status: GOOD (  43.31  )
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

SGkgR2VlcnQsCgpPbiBUaHUsIEZlYiAxLCAyMDI0IGF0IDg6MzTigK9BTSBHZWVydCBVeXR0ZXJo
b2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPgo+IEhpIFByYWJoYWthciwKPgo+
IE9uIFdlZCwgSmFuIDMxLCAyMDI0IGF0IDc6MzbigK9QTSBMYWQsIFByYWJoYWthcgo+IDxwcmFi
aGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiBPbiBUdWUsIEphbiAzMCwgMjAyNCBh
dCAxMTozOOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo+ID4gPGdlZXJ0QGxpbnV4LW02OGsub3Jn
PiB3cm90ZToKPiA+ID4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDoxNuKAr1BNIFByYWJoYWth
ciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+IEZyb206IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4g
Pgo+ID4gPiA+IFRoZSBJWDQ1IGJsb2NrIGhhcyBhZGRpdGlvbmFsIG1hc2sgcmVnaXN0ZXJzIChO
TVNLL0lNU0svVE1TSykgYXMgY29tcGFyZWQKPiA+ID4gPiB0byB0aGUgUlovRzJMIChmYW1pbHkp
IFNvQy4KPiA+ID4gPgo+ID4gPiA+IEludHJvZHVjZSBtYXNraW5nL3VubWFza2luZyBzdXBwb3J0
IGZvciBJUlEgYW5kIFRJTlQgaW50ZXJydXB0cyBpbiBJUlFDCj4gPiA+ID4gY29udHJvbGxlciBk
cml2ZXIuIFR3byBuZXcgcmVnaXN0ZXJzLCBJTVNLIGFuZCBUTVNLLCBhcmUgZGVmaW5lZCB0bwo+
ID4gPiA+IGhhbmRsZSBtYXNraW5nIG9uIFJaL0ZpdmUgU29DLiBUaGUgaW1wbGVtZW50YXRpb24g
dXRpbGl6ZXMgYSBuZXcgZGF0YQo+ID4gPiA+IHN0cnVjdHVyZSwgYHN0cnVjdCByemcybF9pcnFj
X2RhdGFgLCB0byBkZXRlcm1pbmUgbWFzayBzdXBwb3J0IGZvciBhCj4gPiA+ID4gc3BlY2lmaWMg
Y29udHJvbGxlciBpbnN0YW5jZS4KPiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQ
cmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4K
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtcnpnMmwuYwo+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yemcybC5jCj4gPiA+ID4gQEAgLTY2
LDE1ICs2OCwyNSBAQCBzdHJ1Y3QgcnpnMmxfaXJxY19yZWdfY2FjaGUgewo+ID4gPiA+ICAgICAg
ICAgdTMyICAgICB0aXRzclsyXTsKPiA+ID4gPiAgfTsKPiA+ID4gPgo+ID4gPiA+ICsvKioKPiA+
ID4gPiArICogc3RydWN0IHJ6ZzJsX2lycWNfZGF0YSAtIE9GIGRhdGEgc3RydWN0dXJlCj4gPiA+
ID4gKyAqIEBtYXNrX3N1cHBvcnRlZDogSW5kaWNhdGVzIGlmIG1hc2sgcmVnaXN0ZXJzIGFyZSBh
dmFpbGFibGUKPiA+ID4gPiArICovCj4gPiA+ID4gK3N0cnVjdCByemcybF9pcnFjX2RhdGEgewo+
ID4gPgo+ID4gPiBUaGlzIHN0cnVjdHVyZSBoYXMgdGhlIHNhbWUgbmFtZSBhcyB0aGUgc2luZ2xl
IHN0YXRpYyBzdHJ1Y3QKPiA+ID4gcnpnMmxfaXJxY19wcml2IGluc3RhbmNlLCB3aGljaCBpcyBj
b25mdXNpbmcuCj4gPiA+Cj4gPiBBZ3JlZWQsIEkgd2lsbCByZW5hbWUgaXQgdG8gcnpnMmxfaXJx
Y19vZl9kYXRhCj4gPgo+ID4gPiA+ICsgICAgICAgYm9vbCAgICBtYXNrX3N1cHBvcnRlZDsKPiA+
ID4gPiArfTsKPiA+ID4gPiArCj4gPiA+ID4gIC8qKgo+ID4gPiA+ICAgKiBzdHJ1Y3QgcnpnMmxf
aXJxY19wcml2IC0gSVJRIGNvbnRyb2xsZXIgcHJpdmF0ZSBkYXRhIHN0cnVjdHVyZQo+ID4gPiA+
ICAgKiBAYmFzZTogICAgICBDb250cm9sbGVyJ3MgYmFzZSBhZGRyZXNzCj4gPiA+ID4gKyAqIEBk
YXRhOiAgICAgIE9GIGRhdGEgcG9pbnRlcgo+ID4gPiA+ICAgKiBAZndzcGVjOiAgICBJUlEgZmly
bXdhcmUgc3BlY2lmaWMgZGF0YQo+ID4gPiA+ICAgKiBAbG9jazogICAgICBMb2NrIHRvIHNlcmlh
bGl6ZSBhY2Nlc3MgdG8gaGFyZHdhcmUgcmVnaXN0ZXJzCj4gPiA+ID4gICAqIEBjYWNoZTogICAg
IFJlZ2lzdGVycyBjYWNoZSBmb3Igc3VzcGVuZC9yZXN1bWUKPiA+ID4gPiAgICovCj4gPiA+ID4g
IHN0YXRpYyBzdHJ1Y3QgcnpnMmxfaXJxY19wcml2IHsKPiA+ID4gPiAgICAgICAgIHZvaWQgX19p
b21lbSAgICAgICAgICAgICAgICAgICAgKmJhc2U7Cj4gPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1
Y3QgcnpnMmxfaXJxY19kYXRhICAgICpkYXRhOwo+ID4gPgo+ID4gPiBSZXBsYWNpbmcgdGhpcyBi
eSBhIGJvb2wgd291bGQgYXZvaWQgYSBwb2ludGVyIGRlcmVmZXJlbmNlIGluIGVhY2ggdXNlciwK
PiA+ID4gYW5kIGFsbG93cyB5b3UgdG8gbWFrZSByemcybF9pcnFjX2RhdGEgZXRjLiBfX2luaXRj
b25zdC4KPiA+ID4KPiA+IERvIHlvdSBtZWFuIGp1c3QgYWRkICJib29sIG1hc2tfc3VwcG9ydGVk
IiBoZXJlIGFuZCBnZXQgcmlkIG9mIHN0cnVjdAo+ID4gcnpnMmxfaXJxY19kYXRhID8gQ2FuIHlv
dSBwbGVhc2UgZWxhYm9yYXRlIGhlcmUuLgo+Cj4gRWl0aGVyIGFkZCAiYm9vbCBtYXNrX3N1cHBv
cnRlZCIgaGVyZSwgb3IgYWRkIGEgY29weSBvZiB0aGUgZnVsbAo+IHN0cnVjdCByemcybF9pcnFj
X2RhdGEgKHNlZSBiZWxvdykuCj4KT0ssIGknbGwga2VlcCBhIGNvcHkgb2Ygc3RydWN0IHJ6ZzJs
X2lycWNfZGF0YSBoZXJlLi4uCj4gPgo+ID4gPiA+ICAgICAgICAgc3RydWN0IGlycV9md3NwZWMg
ICAgICAgICAgICAgICBmd3NwZWNbSVJRQ19OVU1fSVJRXTsKPiA+ID4gPiAgICAgICAgIHJhd19z
cGlubG9ja190ICAgICAgICAgICAgICAgICAgbG9jazsKPiA+ID4gPiAgICAgICAgIHN0cnVjdCBy
emcybF9pcnFjX3JlZ19jYWNoZSAgICAgY2FjaGU7Cj4gPiA+Cj4gPiA+ID4gQEAgLTM3MSw5ICs0
NzUsMjMgQEAgc3RhdGljIGludCByemcybF9pcnFjX3BhcnNlX2ludGVycnVwdHMoc3RydWN0IHJ6
ZzJsX2lycWNfcHJpdiAqcHJpdiwKPiA+ID4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gPiA+ICB9
Cj4gPiA+ID4KPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByemcybF9pcnFjX2RhdGEgcnpm
aXZlX2lycWNfZGF0YSA9IHsKPiA+ID4gPiArICAgICAgIC5tYXNrX3N1cHBvcnRlZCA9IHRydWUs
Cj4gPiA+ID4gK307Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJs
X2lycWNfZGF0YSByemcybF9pcnFjX2RlZmF1bHRfZGF0YSA9IHsKPiA+ID4gPiArICAgICAgIC5t
YXNrX3N1cHBvcnRlZCA9IGZhbHNlLAo+ID4gPiA+ICt9Owo+ID4gPiA+ICsKPiA+ID4gPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcnpnMmxfaXJxY19tYXRjaGVzW10gPSB7Cj4g
PiA+ID4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscjlhMDdnMDQzZi1pcnFjIiwg
LmRhdGEgPSAmcnpmaXZlX2lycWNfZGF0YSB9LAo+ID4gPiA+ICsgICAgICAgeyB9Cj4gPiA+ID4g
K307Cj4gPiA+ID4gKwo+ID4gPiA+ICBzdGF0aWMgaW50IHJ6ZzJsX2lycWNfaW5pdChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50KQo+ID4gPiA+ICB7
Cj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgaXJxX2RvbWFpbiAqaXJxX2RvbWFpbiwgKnBhcmVudF9k
b21haW47Cj4gPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaDsK
PiA+ID4gPiAgICAgICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXY7Cj4gPiA+ID4gICAg
ICAgICBzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcmVzZXRuOwo+ID4gPiA+ICAgICAgICAgaW50IHJl
dDsKPiA+ID4gPiBAQCAtMzkyLDYgKzUxMCwxMiBAQCBzdGF0aWMgaW50IHJ6ZzJsX2lycWNfaW5p
dChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50KQo+
ID4gPiA+ICAgICAgICAgaWYgKCFyemcybF9pcnFjX2RhdGEpCj4gPiA+ID4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOwo+ID4gPiA+Cj4gPiA+ID4gKyAgICAgICBtYXRjaCA9IG9mX21h
dGNoX25vZGUocnpnMmxfaXJxY19tYXRjaGVzLCBub2RlKTsKPiA+ID4gPiArICAgICAgIGlmICht
YXRjaCkKPiA+ID4gPiArICAgICAgICAgICAgICAgcnpnMmxfaXJxY19kYXRhLT5kYXRhID0gbWF0
Y2gtPmRhdGE7Cj4gPiA+ID4gKyAgICAgICBlbHNlCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJ6
ZzJsX2lycWNfZGF0YS0+ZGF0YSA9ICZyemcybF9pcnFjX2RlZmF1bHRfZGF0YTsKPiA+ID4KPiA+
ID4gSW5zdGVhZCBvZiBtYXRjaGluZyBhIHNlY29uZCB0aW1lLCBJJ2QgcmF0aGVyIGFkZCBhIHNl
Y29uZAo+ID4gPiBJUlFDSElQX01BVENIKCkgZW50cnkgd2l0aCBhIGRpZmZlcmVudCBpbml0IGZ1
bmN0aW9uLCBwYXNzaW5nIHRoZQo+ID4gPiBhY3R1YWwgcnpnMmxfaXJxY19kYXRhIHBvaW50ZXIu
Cj4gPiA+Cj4gPiBPSywgb3IgcmF0aGVyIGp1c3QgcGFzcyB0cnVlL2ZhbHNlIGluc3RlYWQgb2Yg
cnpnMmxfaXJxY19vZl9kYXRhIHBvaW50ZXIuPwo+Cj4gWWVzLCB0aGF0IHdvdWxkIGJlIGZpbmUg
Zm9yIG1lLCB0b28uCj4gSXQgYWxsIGRlcGVuZHMgb24gd2hldGhlciB5b3UgcGxhbiB0byBhZGQs
IG9yIHNlZSBhIG5lZWQgZm9yIGFkZGluZywKPiBtb3JlIGZsYWdzIG9yIG90aGVyIGZpZWxkcyBp
biB0aGUgZnV0dXJlIChhbmQgZXZlbiBmb3IgZmxhZ3MsIHlvdSBjb3VsZAo+IGNvbWJpbmUgdGhl
bSBpbiBhbiB1bnNpZ25lZCBsb25nKS4KPgpJJ2xsIGtlZXAgdGhlIGJvb2wgZmxhZyBmb3Igbm93
IGFuZCB1cGRhdGUgaXQgIGFzICBhbmQgd2hlbiBpdCBncm93cy4KSSBzZWUgZnV0dXJlIFNvQ3Mg
d2l0aCBhIGxvdCBvZiBvdGhlciBpbnRlcnJ1cHRzIGJlaW5nIHN1cHBvcnRlZCBieQp0aGlzIGJs
b2NrLgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gR3J7b2V0amUsZWV0aW5nfXMsCj4KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAo+Cj4gLS0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhl
cmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCj4K
PiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
