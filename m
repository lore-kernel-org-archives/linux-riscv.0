Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1DFC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 22:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LslSOT/QPlz0i87Cz9iTnHlYtXv4VCQE7fKKw3xEgQ=; b=Ni79NSBZoehPS0
	8Z6i4XiPSAYyMrw6LhxkkDPbk8o4vV7erxP2lZTsAycNbVyAeI63OmTM+B7Umg6B1el3NDtlltsUm
	rAAa3VEWbsSU8tbFtrdcooJyFQyo/gyDAx/bmOrNAcAeEKa/DxUWg8GV79M4e7h46nz7KMPqpqPoK
	9jCG0raBtEfGPSuuSwZvrA7GFivYjuHfiy/ZVCPB2LhoyhjLVvrCHfpF/1BbqTPeCIApOyycMXPek
	4fl4UzKOI5RM98XsbHOas1eQkW9sGSCaDQfv5SP9iH7L5fuwWlaTLPctnzifxzWWVCA2jb9D48irh
	VUgAbr2oWLbuhbIhiI2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzlFB-00000006FBo-1eHG;
	Wed, 24 Apr 2024 22:37:37 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzlF8-00000006FA7-0Efa
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 22:37:35 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2a2d0ca3c92so334192a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 15:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713998245; x=1714603045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aO8Rp7JUgS7Xhpz5uMrLG4WHnD0bm/FTRd8cK1NaJfI=;
        b=x5eo7C3IrID3wGN+ZnBGroyCJ/RkI3paQQkOgj7OrLgq8ODWSSiGxFbCvAWXMP1AMk
         j+dTpDMi/9Gk/XYd0CtvT3p4/z/yMQOiiYu8f4B17Ikz0y2q7Vc6ztIR6zqGOr3nPjyn
         MTft8wvKgY8onY7ipPrUCX2zQ0jViwehSLrL0jK10mAHlFZ2Vlpqr2xXLRr7Xw17aPLZ
         FekON4NX6k1cvyFgmVS/8kmhJsKQ+guKNCsj6J7jRTLQwMd2ax0Q0rPgd4b/NkriwvnX
         oIY/+aDWuzJhzfZaPnbqOdwN9ahZ9wURVodU3SZU+UZuh1PcrFSfqRiCBMj48CPWJd8p
         YIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713998245; x=1714603045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aO8Rp7JUgS7Xhpz5uMrLG4WHnD0bm/FTRd8cK1NaJfI=;
        b=JX3u7qC6KSAaiuy9Z/cCUCKgrfVy+IIOOOATI0JnOBOY51WCdS2N7PaFtDwNbWoN0y
         GLGBnJGmnVl/8vTW+7leuSZSyT8/A3JFyetQSSVnOqk/ki02Rjvw4nsF+ro1kIweht+1
         OI7GSzQ9XR1jmAQxMB2zeYapV8Ls6cw4wHfwTHvPFhKDfXwFbhFUX2hxFzAeno/HjKOv
         mVsk7N0Pc79LLyoMwb4SxbD6dUcpaknOKp2LXWAtZU//+LA15tAexaRtaN8esDwnaSs7
         eh5BK5NqWxDkIH9gdgaOhcW98nTDclGrEkQ4AUaeVaSISNjBkMAJpMlOOcl6juaUOg+B
         AAeg==
X-Forwarded-Encrypted: i=1; AJvYcCVtPcxtXc+O66Xev6aF/IAEIY/rui4kWqVimTSqQuk1s0zZdxKbse3s5EdVe6B7ncImHurvBHOR2GDI3RoewU2oOzMFrjOPteqzocMjGI5F
X-Gm-Message-State: AOJu0YzDlObQLsontJZD1BOeOSO52bqGtvWRp3RFBX8qEha27aNj6gwC
	5Ce13HFVjQi4VPWyJW98dj/pkjvQgjL2uBNZ9irrXRobHJ90hvfYvnk1cpp+ad8qyaakh5MMExB
	RmhH+lp2VEWfgw3QNgAsJmnW3JWgVqU5m+sm89Q==
X-Google-Smtp-Source: AGHT+IGBdslP8DSVdWf46pAwH3oTFPa/IfzzcphPEMB4ixOB3ZSquD8oJqVuF7a4MYQGJ/zf/PV3za+kxLsvBdn4cjU=
X-Received: by 2002:a17:90b:4d8d:b0:2af:c3ea:8122 with SMTP id
 oj13-20020a17090b4d8d00b002afc3ea8122mr338008pjb.7.1713998245527; Wed, 24 Apr
 2024 15:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1713456597.git.tjeznach@rivosinc.com> <c37cb93e7baa7042a3f82130bf30be6831b558dc.1713456598.git.tjeznach@rivosinc.com>
 <20240418-approach-liquefy-04551ddefbc4@spud>
In-Reply-To: <20240418-approach-liquefy-04551ddefbc4@spud>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 24 Apr 2024 15:37:14 -0700
Message-ID: <CAH2o1u7_v=_GX5cnV5X14jggTycRTvGEJ1r_9tqtb-xgk=LEkA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: iommu: riscv: Add bindings for RISC-V IOMMU
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_153734_241878_A38C9CDF 
X-CRM114-Status: GOOD (  25.77  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTA6MDTigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMDk6MzI6MTlBTSAt
MDcwMCwgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gPiBBZGQgYmluZGluZ3MgZm9yIHRoZSBSSVND
LVYgSU9NTVUgZGV2aWNlIGRyaXZlcnMuCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBBbnVwIFBh
dGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0
ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEpl
em5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5ncy9p
b21tdS9yaXNjdixpb21tdS55YW1sICAgICAgICAgICB8IDE0OSArKysrKysrKysrKysrKysrKysK
PiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcg
Kwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTU2IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L3Jpc2N2LGlv
bW11LnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lvbW11L3Jpc2N2LGlvbW11LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvaW9tbXUvcmlzY3YsaW9tbXUueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDY1MjJkZGQ0M2ZhCj4gPiAtLS0gL2Rldi9udWxsCj4g
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvcmlzY3YsaW9t
bXUueWFtbAo+ID4gQEAgLTAsMCArMSwxNDkgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICst
LS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lvbW11L3Jpc2N2LGlv
bW11LnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IFJJU0MtViBJT01NVSBBcmNoaXRlY3R1cmUg
SW1wbGVtZW50YXRpb24KPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gVG9tYXN6IEpl
em5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfCsK
Pgo+IEZZSSwgdGhlICsgaGVyZSBpcyBwcm9iYWJseSBub3QgbmVlZGVkLgo+Cj4gPiArICBUaGUg
UklTQy1WIElPTU1VIHByb3ZpZGVzIG1lbW9yeSBhZGRyZXNzIHRyYW5zbGF0aW9uIGFuZCBpc29s
YXRpb24gZm9yCj4gPiArICBpbnB1dCBhbmQgb3V0cHV0IGRldmljZXMsIHN1cHBvcnRpbmcgcGVy
LWRldmljZSB0cmFuc2xhdGlvbiBjb250ZXh0LAo+ID4gKyAgc2hhcmVkIHByb2Nlc3MgYWRkcmVz
cyBzcGFjZXMgaW5jbHVkaW5nIHRoZSBBVFMgYW5kIFBSSSBjb21wb25lbnRzIG9mCj4gPiArICB0
aGUgUENJZSBzcGVjaWZpY2F0aW9uLCB0d28gc3RhZ2UgYWRkcmVzcyB0cmFuc2xhdGlvbiBhbmQg
TVNJIHJlbWFwcGluZy4KPiA+ICsgIEl0IHN1cHBvcnRzIGlkZW50aWNhbCB0cmFuc2xhdGlvbiB0
YWJsZSBmb3JtYXQgdG8gdGhlIFJJU0MtViBhZGRyZXNzCj4gPiArICB0cmFuc2xhdGlvbiB0YWJs
ZXMgd2l0aCBwYWdlIGxldmVsIGFjY2VzcyBhbmQgcHJvdGVjdGlvbiBhdHRyaWJ1dGVzLgo+ID4g
KyAgSGFyZHdhcmUgdXNlcyBpbi1tZW1vcnkgY29tbWFuZCBhbmQgZmF1bHQgcmVwb3J0aW5nIHF1
ZXVlcyB3aXRoIHdpcmVkCj4gPiArICBpbnRlcnJ1cHQgb3IgTVNJIG5vdGlmaWNhdGlvbnMuCj4g
PiArCj4gPiArICBWaXNpdCBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1p
b21tdSBmb3IgbW9yZSBkZXRhaWxzLgo+ID4gKwo+ID4gKyAgRm9yIGluZm9ybWF0aW9uIG9uIGFz
c2lnbmluZyBSSVNDLVYgSU9NTVUgdG8gaXRzIHBlcmlwaGVyYWwgZGV2aWNlcywKPiA+ICsgIHNl
ZSBnZW5lcmljIElPTU1VIGJpbmRpbmdzLgo+ID4gKwo+ID4gK3Byb3BlcnRpZXM6Cj4gPiArICAj
IEZvciBQQ0llIElPTU1VIGhhcmR3YXJlIGNvbXBhdGlibGUgcHJvcGVydHkgc2hvdWxkIGNvbnRh
aW4gdGhlIHZlbmRvcgo+ID4gKyAgIyBhbmQgZGV2aWNlIElEIGFjY29yZGluZyB0byB0aGUgUENJ
IEJ1cyBCaW5kaW5nIHNwZWNpZmljYXRpb24uCj4gPiArICAjIFNpbmNlIFBDSSBwcm92aWRlcyBi
dWlsdC1pbiBpZGVudGlmaWNhdGlvbiBtZXRob2RzLCBjb21wYXRpYmxlIGlzIG5vdAo+ID4gKyAg
IyBhY3R1YWxseSByZXF1aXJlZC4gRm9yIG5vbi1QQ0llIGhhcmR3YXJlIGltcGxlbWVudGF0aW9u
cyAncmlzY3YsaW9tbXUnCj4gPiArICAjIHNob3VsZCBiZSBzcGVjaWZpZWQgYWxvbmcgd2l0aCAn
cmVnJyBwcm9wZXJ0eSBwcm92aWRpbmcgTU1JTyBsb2NhdGlvbi4KPgo+IEkgZHVubm8sIEknZCBs
aWtlIHRvIHNlZSBzb2Mtc3BlY2lmaWMgY29tcGF0aWJsZXMgZm9yIGltcGxlbWVudGF0aW9ucyBv
Zgo+IHRoZSBSSVNDLVYgSU9NTVUuIElmIHlvdSBuZWVkIGEgRFQgY29tcGF0aWJsZSBmb3IgdXNl
IGluIFFFTVUsIEknZAo+IHN1Z2dlc3QgZG9pbmcgd2hhdCB3YXMgZG9uZSBmb3IgdGhlIGFwbGlj
IGFuZCBoYXZpbmcgYSBkZWRpY2F0ZWQKPiBjb21wYXRpYmxlIGZvciB0aGF0IGFuZCBkaXNhbGxv
dyBoYXZpbmcgInJpc2N2LGlvbW11IiBpbiBpc29sYXRpb24uCj4KCk1ha2VzIHNlbnNlLiAgV2ls
bCB1cGRhdGUgdG8gc29tZXRoaW5nIGxpa2UgYmVsb3c6CiAgY29tcGF0aWJsZToKICAgIG9uZU9m
OgogICAgICAtIGl0ZW1zOgogICAgICAgICAgLSBlbnVtOgogICAgICAgICAgICAgIC0gcWVtdSxp
b21tdQogICAgICAgICAgLSBjb25zdDogcmlzY3YsaW9tbXUKICAgICAgLSBpdGVtczoKICAgICAg
ICAgIC0gZW51bToKICAgICAgICAgICAgICAtIHBjaTFlZmQsZWRmMQogICAgICAgICAgLSBjb25z
dDogcmlzY3YscGNpLWlvbW11Cgo+ID4gKyAgY29tcGF0aWJsZToKPiA+ICsgICAgb25lT2Y6Cj4g
PiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBjb25zdDogcmlzY3YscGNpLWlvbW11
Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IHBjaTFlZmQsZWRmMQo+ID4gKyAgICAgIC0gaXRlbXM6
Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IHBjaTFlZmQsZWRmMQo+Cj4gV2h5IGFyZSBib3RoIHZl
cnNpb25zIGFsbG93ZWQ/IElmIHRoZSBmb3JtZXIgaXMgbW9yZSB1bmRlcnN0YW5kYWJsZSwKPiBj
YW4ndCB3ZSBqdXN0IGdvIHdpdGggdGhhdD8KPgo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAg
ICAgICAgIC0gY29uc3Q6IHJpc2N2LGlvbW11Cj4KPiBPdGhlciB0aGFuIHRoZSBjb21wYXRpYmxl
IHNldHVwIEkgdGhpbmsgdGhpcyBpcyBwcmV0dHkgZGVjZW50IHRob3VnaCwKPiBDb25vci4KCkFD
SyB0byBvdGhlciBjb21tZW50cywKClRoYW5rcyBmb3IgdGhlIHJldmlldywKLSBUb21hc3oKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
