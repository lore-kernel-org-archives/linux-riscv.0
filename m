Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05E8E7D27D
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yi6DCu4afsLQWN6j2GW+cEOvR5QiPJLSqWEkmpHr5uQ=; b=OEFW8y3C3Vpk5W
	MKnrn/qelnBASnnkrGv7AmMTKoTT7G+Gb08IjS3y6Y3PAmGfyAzKXByeEPJ+ESDgDzqy+IHd9Ov1l
	4hW7886A6DeMbu5gu0TUYr7NxQKoWtQSc7CLqbvcnJPfS0k1qZv31LuNAVUHv0FbBWLC0rbMYV5C6
	05UCGHXYkgcex3hAPQLzdy5cW/bk0OXNiTfhjP2dV8IDFvscDrLW9DssjCGSjQIxCiKkPC1eqEzdM
	88r4zJ+Xj7aJWoetBjZVPKl+15Exw0+4M45s9jJOQCOqbRYyaLdJXkfwSIFQ6d43WLX4yKISM+E3Q
	Zn2VUs/+6kawefNhK5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5ir-00GCce-11;
	Tue, 26 Sep 2023 10:55:21 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql5io-00GCbx-0H
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 10:55:19 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-59c0b9ad491so101576067b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 03:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695725714; x=1696330514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvtTsf3vpAC3463ssznlJAFWAnBfRPI8L0YmeYOh6ic=;
        b=NnspDPaR29/Mec/gpFCIba8+J1GoGIEkzKgLlapAnJJlpVKcp9QywgGchmply2ZZ01
         +WeYTh+dq9e9F6lE1yF9S1cW/VmXSr7JLD+LggPo88n/tajjl7rj0/7tRHT8EjMDAV7U
         UPBFO8KDa4G4GnFXHymBOE/5Sp0TZcIpl5pMzJHcg2IHa2B0Yb5NlvXuH5yyf1qguQJ1
         7fLfujQLtlm4aybplEyIDwxoqRdYjnnCuh29UR/MwrcanrmkVV6KY5T4c3sN7f45sVDQ
         kHObG0jp7G9PCepd3uSRKoy3DYla39a1tqVH5I5u1N9IbAKi2JYY+rHiGnhPfjlRKzpB
         VK4w==
X-Gm-Message-State: AOJu0YzVR+ibA4I+21onf1xb7fVjcOWhrbRWj7Fy9UZ3CLn+WNG49FTp
	rzl1bqmbpT/eKIy1eOedh1/zL5RHcWsMLw==
X-Google-Smtp-Source: AGHT+IFzPP1T4/nfvTkhocBbojD1GCkC/kXRl6K7IajEMUUSo0Fg18vx5gFnVNa6+idJRCfloVHU1Q==
X-Received: by 2002:a81:9e08:0:b0:59e:9fbc:a16c with SMTP id m8-20020a819e08000000b0059e9fbca16cmr9793267ywj.35.1695725714339;
        Tue, 26 Sep 2023 03:55:14 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id i7-20020a0dc607000000b005777a2c356asm2893318ywd.65.2023.09.26.03.55.14
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:55:14 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d81adf0d57fso9780941276.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 03:55:14 -0700 (PDT)
X-Received: by 2002:a25:fc0e:0:b0:d4c:cbd2:f6f3 with SMTP id
 v14-20020a25fc0e000000b00d4ccbd2f6f3mr9064526ybd.53.1695725713917; Tue, 26
 Sep 2023 03:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud> <20230913-grumbly-rewrite-34c85539f2ed@spud>
In-Reply-To: <20230913-grumbly-rewrite-34c85539f2ed@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Sep 2023 12:55:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
Message-ID: <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
Subject: Re: [GIT PULL 2/5] dt-bindings: power: Add power-domain header for JH7110
To: Conor Dooley <conor@kernel.org>, changhuang.liang@starfivetech.com
Cc: ulf.hansson@linaro.org, Conor Dooley <conor.dooley@microchip.com>, arnd@arndb.de, 
	jiajie.ho@starfivetech.com, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, robh@kernel.org, 
	walker.chen@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_035518_121205_7771F3E6 
X-CRM114-Status: GOOD (  20.32  )
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

SGkgQ29ub3IsIENoYW5naHVhbmcsCgpPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAzOjU44oCvUE0g
Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiBGcm9tOiBDaGFuZ2h1YW5n
IExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+Cj4KPiBBZGQgcG93ZXIt
ZG9tYWluIGhlYWRlciBmb3IgSkg3MTEwIFNvQywgaXQgY2FuIHVzZSB0byBvcGVyYXRlIGRwaHkK
PiBwb3dlci4KPgo+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcu
bGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBp
cyBub3cgY29tbWl0IDQxYjY2YjU0YTcyYmQ3OTYKKCJkdC1iaW5kaW5nczogcG93ZXI6IEFkZCBw
b3dlci1kb21haW4gaGVhZGVyIGZvciBKSDcxMTAiKQppbiBwbWRvbWFpbi9uZXh0LgoKQ29ub3I6
IGxvb2tzIGxpa2UgeW91IGZvcmdvdCB0byB1cGRhdGUgdGhlIHBhdGNoIGRlc2NyaXB0aW9uLCBh
cyBwcm9taXNlZCBpbgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA1MTktaXJrLWR3
ZWxsZWQtNmE0OTljNDgyZTYyQHNwdWQ/Cgo+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcG93
ZXIvc3RhcmZpdmUsamg3MTEwLXBtdS5oCj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dl
ci9zdGFyZml2ZSxqaDcxMTAtcG11LmgKPiBAQCAtMSw2ICsxLDYgQEAKPiAgLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAqLwo+ICAvKgo+
IC0gKiBDb3B5cmlnaHQgKEMpIDIwMjIgU3RhckZpdmUgVGVjaG5vbG9neSBDby4sIEx0ZC4KPiAr
ICogQ29weXJpZ2h0IChDKSAyMDIyLTIwMjMgU3RhckZpdmUgVGVjaG5vbG9neSBDby4sIEx0ZC4K
PiAgICogQXV0aG9yOiBXYWxrZXIgQ2hlbiA8d2Fsa2VyLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4K
PiAgICovCj4gICNpZm5kZWYgX19EVF9CSU5ESU5HU19QT1dFUl9KSDcxMTBfUE9XRVJfSF9fCj4g
QEAgLTE0LDQgKzE0LDcgQEAKPiAgI2RlZmluZSBKSDcxMTBfUERfSVNQICAgICAgICAgIDUKPiAg
I2RlZmluZSBKSDcxMTBfUERfVkVOQyAgICAgICAgIDYKPgo+ICsjZGVmaW5lIEpINzExMF9QRF9E
UEhZX1RYICAgICAgMAo+ICsjZGVmaW5lIEpINzExMF9QRF9EUEhZX1JYICAgICAgMQoKVGhlc2Ug
dmFsdWVzIGFyZSBjb25mbGljdGluZyB3aXRoIHNpbWlsYXJseS1uYW1lZCB2YWx1ZXMgYWJvdmU6
CgogICAgI2RlZmluZSBKSDcxMTBfUERfU1lTVE9QICAgICAgICAwCiAgICAjZGVmaW5lIEpINzEx
MF9QRF9DUFUgICAgICAgICAgIDEKClVwb24gY2xvc2VyIGxvb2ssIGFuZCBkaXZpbmcgaW50byB0
aGUgZHJpdmVyLCB0aGlzIGhlYWRlciBmaWxlIGNvbnRhaW5zCmRlZmluaXRpb25zIGZvciB0d28g
c2VwYXJhdGUgbnVtYmVyIHNwYWNlczogdGhlIGZpcnN0IHNldCBpcyBtZWFudAp0byBiZSB1c2Vk
IGluIFBNIERvbWFpbiBzcGVjaWZpZXJzIHJlZmVycmluZyB0byBhIG5vZGUgY29tcGF0aWJsZQp3
aXRoICJzdGFyZml2ZSxqaDcxMTAtcG11Iiwgd2hpbGUgdGhlIHNlY29uZCBzZXQgaXMgbWVhbnQg
dG8gYmUKdXNlZCBpbiBQTSBEb21haW4gc3BlY2lmaWVycyByZWZlcnJpbmcgdG8gYSBub2RlIGNv
bXBhdGlibGUgd2l0aAoic3RhcmZpdmUsamg3MTEwLWFvbi1zeXNjb24iLgpJIHRoaW5rIGl0IHdv
dWxkIGJlIG5pY2UgdG8gaGF2ZSB0aGlzIHJlZmxlY3RlZCBpbiB0aGUgbmFtZXMgb2YKdGhlIGRl
ZmluZXMgKGUuZy4gSkg3MTEwX1BEX0FPTl9EUEhZX1RYKSwgYW5kL29yIHRvIGFkZCBjb21tZW50
cwpjbGVhcmx5IGRlbGltaXRpbmcgdGhlIHR3byBzZXBhcmF0ZSBudW1iZXIgc3BhY2VzLCBhbmQg
ZXhwbGFpbmluZwp3aGVyZSB0aGV5IGFwcGx5IHRvLgoKPiArCj4gICNlbmRpZgoKR3J7b2V0amUs
ZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
