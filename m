Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC8EC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQ1N3O8vxugLyragtnI1PT8eF+Mu1HPj1dO9IFP+6QA=; b=AleXt8sP3pkHJI
	4NdhT0qTJIk0hThBBEXo4jK8BACNmJi4hRHbMcSFiPtQvxbNB5pkVBwwiNd2VPotJrn3kWL9Tjcey
	P38IOpw5AoXrIZTpvmRXJLs8TiPjRbq9OkzhS5GkKz3JV31OoEhoZFU4R8cezplomwSkWwcvqpKvT
	tylIYL2v381jUDSBUHuAfHV4cOmhIqeZh3pNcYvSBfvaFyhf4o1xQeMLM7khhxmUfn1nAlsca0tfV
	8d23BdPOXax+eWd1HIpqOAqUOO1Z3OqPegrdP1LxZQc8+TBLvbNJpzUxHI/XEQLE1bZErYpt6bZgm
	kPt9LIktZC3e1773p16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlkE-0000000GHdw-20EY;
	Tue, 30 Jan 2024 10:53:34 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUlkB-0000000GHdK-1PR8
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 10:53:33 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7ce3c7566e0so1345725241.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706612005; x=1707216805; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2Wgc2ClmelSiswazxUWS0iU6q84Ug0M/jBpx2lzDSQ=;
        b=FjDh5CvYMiTqqXGlZy0+My8RfzHGMbXJBlzEgSUD3TDYn7trHnraNKea9f/07SYlna
         LtfUmlNi948ChxGdCvzeTDu+8Uwd4ciiteHUqOBQwxbODOlBuAzyitM4EMyoEohXve0r
         eQGCLVbgxsCOH7yLJNLxEtQ+BFDydDutA+TIu7jVoKRip2Kn1GXtqv1i77qJM2RaYfXg
         zL5OnaqSrtNU5oUjlqt71aXmvcQN2XJRaJdkYxKU/tE72XpxwWjV8oyWwTfjfSymkraK
         G/7jjd82s9+4+ynKwONoyOY2Oc44tHHiiUfM4vmKmxphYfDmSfL+p34HurKUqfM+ntVs
         Mi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706612005; x=1707216805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2Wgc2ClmelSiswazxUWS0iU6q84Ug0M/jBpx2lzDSQ=;
        b=Mm2ZsrBCP1+nr995tHYCKW4PbOwPYKdzAyu68r9tIY+077lRoJ/GlKd1BlhNhkwQnW
         zfeO89/xqcp1fLlGApbZIHRQrT44tkuSMjc7QoLaTINFCyWF+9OSW44Aj8ne6qF11eK/
         I9G6mBFczjwwQ9TyDqWcBTWtR8/uprRVXHxs+zemQc/RK1EziZaijPBBiLtoFHXOVbk8
         Ixz0iyu6ooLM4X6L7CTL46BvKI2EwnfH7fjZ0QzMnCRQiYQpI4IiMGEDxWt+QTBLqldW
         695TexSjnCb1aVScISh8hSGfH2PlqSFpr9PtyDaY/hXvGdwupBHuAdweajE5iE/pEqjo
         CQIQ==
X-Gm-Message-State: AOJu0YynRtR4TxEct/FSvHt+X2knMmL51Orn/DpwwWQTxVKHEAvtQUtE
	q9I6hD7hE3tL0pH4EZvgaBHvpcl2UKfa2lWew7vjV6yRXLIgYHx8cPF0dN4h4DvSilEkegSW7PB
	IPZAVvs8QFcR3wwboZWBE5o4sOV8=
X-Google-Smtp-Source: AGHT+IHgpOYGVwZC7jGnAQ5quTRMCHeTj6rwn160Ts+Wqt1/jnYyj4K3u3HJFVo+yEseFc6FkttQlfm/AvfFuGOWpDg=
X-Received: by 2002:a05:6122:d28:b0:4b6:c49a:174a with SMTP id
 az40-20020a0561220d2800b004b6c49a174amr3593381vkb.14.1706612004892; Tue, 30
 Jan 2024 02:53:24 -0800 (PST)
MIME-Version: 1.0
References: <20240129135556.63466-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129135556.63466-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWbPooCMqyKjTh+uJgAqh=az0+DOQAJYKQ7cuBrxyV1-w@mail.gmail.com>
In-Reply-To: <CAMuHMdWbPooCMqyKjTh+uJgAqh=az0+DOQAJYKQ7cuBrxyV1-w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 30 Jan 2024 10:52:54 +0000
Message-ID: <CA+V-a8ux+AfF4rTmfr448Gp_=_M2TczsZ5_j2afk9qRFs3ePGQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] pinctrl: renesas: rzg2l: Improve code for readability
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_025331_401442_64F93413 
X-CRM114-Status: GOOD (  23.32  )
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

SEkgR2VlcnQsCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBUdWUsIEphbiAzMCwgMjAy
NCBhdCAxMDozNeKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2VlcnRAbGludXgtbTY4ay5vcmc+
IHdyb3RlOgo+Cj4gSGkgUHJhYmhha2FyLAo+Cj4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMjo1
NuKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4g
RnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMu
Y29tPgo+ID4KPiA+IEFzIHRoZSBSWi9HMkwgcGluY3RybCBkcml2ZXIgaXMgZXh0ZW5zaXZlbHkg
dXRpbGl6ZWQgYnkgbnVtZXJvdXMgU29DcyBhbmQKPiA+IGhhcyBleHBlcmllbmNlZCBzdWJzdGFu
dGlhbCBncm93dGgsIGVuaGFuY2UgY29kZSByZWFkYWJpbGl0eSBieQo+ID4gaW5jb3Jwb3JhdGlu
ZyBGSUVMRF9QUkVQX0NPTlNUL0ZJRUxEX0dFVCBtYWNyb3Mgd2hlcmV2ZXIgbmVjZXNzYXJ5Lgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IGkuZS4gd2lsbCBxdWV1ZSBpbiByZW5lc2FzLXBp
bmN0cmwgZm9yIHY2LjkuCj4KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0
cmwtcnpnMmwuYwo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcy
bC5jCj4KPiA+IEBAIC05MCwxNCArOTMsMTggQEAKPiA+ICAgKiAoYiAqIDgpIGFuZCBmIGlzIHRo
ZSBwaW4gY29uZmlndXJhdGlvbiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkLgo+ID4gICAqLwo+ID4g
ICNkZWZpbmUgUlpHMkxfU0lOR0xFX1BJTiAgICAgICAgICAgICAgIEJJVCgzMSkKPiA+ICsjZGVm
aW5lIFJaRzJMX1NJTkdMRV9QSU5fSU5ERVhfTUFTSyAgICBHRU5NQVNLKDMwLCAyNCkKPiA+ICsj
ZGVmaW5lIFJaRzJMX1NJTkdMRV9QSU5fQklUU19NQVNLICAgICBHRU5NQVNLKDIyLCAyMCkKPiA+
ICsKPiA+ICAjZGVmaW5lIFJaRzJMX1NJTkdMRV9QSU5fUEFDSyhwLCBiLCBmKSAoUlpHMkxfU0lO
R0xFX1BJTiB8IFwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KChwKSA8PCAyNCkgfCAoKGIpIDw8IDIwKSB8IChmKSkKPiA+IC0jZGVmaW5lIFJaRzJMX1NJTkdM
RV9QSU5fR0VUX0JJVCh4KSAgICAoKCh4KSAmIEdFTk1BU0soMjIsIDIwKSkgPj4gMjApCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZJRUxEX1BSRVBfQ09OU1Qo
UlpHMkxfU0lOR0xFX1BJTl9JTkRFWF9NQVNLLCAocCkpIHwgXAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQX0NPTlNUKFJaRzJMX1NJTkdMRV9Q
SU5fQklUU19NQVNLLCAoYikpIHwgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBGSUVMRF9QUkVQX0NPTlNUKFBJTl9DRkdfTUFTSywgKGYpKSkKPiA+Cj4gPiAt
I2RlZmluZSBSWkcyTF9QSU5fQ0ZHX1RPX0NBUFMoY2ZnKSAgICAgICAgICAgICAoKGNmZykgJiBH
RU5NQVNLKDE5LCAwKSkKPiA+ICsjZGVmaW5lIFJaRzJMX1BJTl9DRkdfVE9fQ0FQUyhjZmcpICAg
ICAgICAgICAgICgoY2ZnKSAmIFBJTl9DRkdfTUFTSykKPgo+IERvIHlvdSBtaW5kIGlmIEkgZHJv
cCBSWkcyTF9QSU5fQ0ZHX1RPX0NBUFMoKSBhbmQgcmVwbGFjZSBpdHMgdHdvCj4gdXNlcnMgYnkg
RklFTERfR0VUKFBJTl9DRkdfTUFTSywgKnBpbl9kYXRhKSB3aGlsZSBhcHBseWluZz8KPgpGaW5l
IGJ5IG1lLgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gPiAgI2RlZmluZSBSWkcyTF9QSU5fQ0ZHX1RP
X1BPUlRfT0ZGU0VUKGNmZykgICAgICAoKGNmZykgJiBSWkcyTF9TSU5HTEVfUElOID8gXAo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCgoY2ZnKSAm
IEdFTk1BU0soMzAsIDI0KSkgPj4gMjQpIDogXAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKCgoY2ZnKSAmIEdFTk1BU0soMjYsIDIwKSkgPj4gMjAp
KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZJ
RUxEX0dFVChSWkcyTF9TSU5HTEVfUElOX0lOREVYX01BU0ssIChjZmcpKSA6IFwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBGSUVMRF9HRVQoUElO
X0NGR19QSU5fUkVHX01BU0ssIChjZmcpKSkKPiA+Cj4gPiAgI2RlZmluZSBQKG9mZikgICAgICAg
ICAgICAgICAgICgweDAwMDAgKyAob2ZmKSkKPiA+ICAjZGVmaW5lIFBNKG9mZikgICAgICAgICAg
ICAgICAgICAgICAgICAoMHgwMTAwICsgKG9mZikgKiAyKQo+Cj4gR3J7b2V0amUsZWV0aW5nfXMs
Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+Cj4gLS0KPiBHZWVydCBVeXR0ZXJo
b2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4
LW02OGsub3JnCj4KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBq
b3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0
Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
