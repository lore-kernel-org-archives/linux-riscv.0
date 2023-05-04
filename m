Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C9BC77B78
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 20:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMWo640ZVoKPETHzOotGP1SD+/RTkO6XR2RQ8OhfWYc=; b=z3Gickj7lNihoI
	iZe2p8jCHOdgMlaTc/p02v+yeo7etjdc7JmzJnm9WdtvZ5ef2IP8szutTXVs9Iq9dRvFsHkGnBCzL
	DMVk/K64C1+Omu01kXzfyBvdXz1X26uEVsAX6f4Nkmfzra4W303KQW/M8xdXUq65nSRYaTZ5BvviW
	4ZZiMZirw/fR3d7aBM6P4pWaRcH0Cn/geWTG9aM3srILnc94n7mJ8qojqPNtoqxctCc5vpjgMzFs+
	EouytyY211LbEBDRE7TFSC4/KwPiRKyXqq9zWhhTCny+UBjpSThMdGasFLBYirrdUpUBMq7l5bl14
	yrjgX/PsEuspQ34aEBeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pufma-008wn3-2c;
	Thu, 04 May 2023 20:42:32 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pufmX-008wlh-0h
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 20:42:30 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ec8148f73eso1120147e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683232944; x=1685824944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVXjrmmVPaC86MGd9q8K4xTk3JxmLDQjsYVtmH3P8Vg=;
        b=3BjmTk52FjJ4BZ5C66bWTRr52l9evxxc+bMgjqDSaabztt/bHBF+RohZUSzJQatZyb
         claN4a2I75spURPJHBoUn4s7lpu22YrwaqWj4XPKUalZG/Nid9NWJC1zfEpy8CYq0pKH
         ygTPX8WE4pBaJ5R2+0qomdO/dJsWlmMU/PJ8mREJ3up0fwU3/dppDVSQXU/JZm77RbmP
         G0PMoyVs/M6xOZ+ISzCA8dq8QQmq1zh17PDsPyNzgqNsaYTglDYz5d6e2tCy8StqGQF/
         Z6RSBtQ3Ff+CJt8/AX6Qen7TW6lfpZBKrIDZAdoyt/e+3Sbq/TDS0b1Fbzr3tQFqQorl
         65EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683232944; x=1685824944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVXjrmmVPaC86MGd9q8K4xTk3JxmLDQjsYVtmH3P8Vg=;
        b=FoxR+TIA3fFxisiuxiMaqH4IcnX8cWm7EFHo0UKzJZvhRgMIIzXP6PfU1l+fw0FT5I
         ACFcsyXmFS3USVngG/sXRVG8XGe4C3w8n3G9PfiX0eJs8lM1zY0uI8YQD8xZjccKk0Ed
         KMvdRGCHo9zR3dwxZKk3qnRCSFU/DeviAbTT2nrbFwG1WpiLp2DB2lq1gs4U9rE2olv9
         IqriKVxnEIg9aiWNR5r4y7AMMU2huACluEjtMf4xyMt2vVciK7AqiSDTTIQJ4pRrUCcu
         Jgb75DaJoM1I5aasLnWqJwSpAVbFfylr6LZlRgMypUa97EqkzJDLQoqy35+XpMrcNiXJ
         jiCA==
X-Gm-Message-State: AC+VfDw0IqyOXMZbBRCYY0xgFF6vHkAuc+sYQ/sjS0ZaUWw36VbdLsOO
	pJRtJTznS7UoqyQwGWeVvlPwhfEog5FQ1t0T0CZIwA==
X-Google-Smtp-Source: ACHHUZ5Oc2JEQgYDtMrNqV9XGIAbMc3mAKkNtDt4QLTkADEAez2zfBLXo0ybF6pZVqwkI3T9WtVOyOeQEtC+PYafcWE=
X-Received: by 2002:a2e:9c46:0:b0:298:a840:ec65 with SMTP id
 t6-20020a2e9c46000000b00298a840ec65mr1174533ljj.36.1683232944435; Thu, 04 May
 2023 13:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230404-tractor-confusing-8852e552539a@spud> <20230504202156.GA260181-robh@kernel.org>
In-Reply-To: <20230504202156.GA260181-robh@kernel.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 5 May 2023 02:12:13 +0530
Message-ID: <CAHBxVyE6Hy8R3BY2_71az5__UxHyOQcjf-hRm6ivTpXNSyCj6Q@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: perf: riscv,pmu: fix property dependencies
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_134229_446960_760C6031 
X-CRM114-Status: GOOD (  22.96  )
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

T24gRnJpLCBNYXkgNSwgMjAyMyBhdCAxOjUx4oCvQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEFwciAwNCwgMjAyMyBhdCAwNzowMzoyMlBNICswMTAw
LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+ID4KPiA+IFNlZW1pbmdseSBJIG1pcy1pbXBsZW1lbnRlZCB0aGUg
ZGVwZW5kZW5jaWVzIGhlcmUuIFRoZSBPcGVuU0JJIGRvY3Mgb25seQo+ID4gcG9pbnQgb3V0IHRo
YXQgdGhlICJyaXNjdixldmVudC10by1taHBtY291bnRlcnMgcHJvcGVydHkgaXMgbWFuZGF0b3J5
IGlmCj4gPiByaXNjdixldmVudC10by1taHBtZXZlbnQgaXMgcHJlc2VudCIuIEl0IG5ldmVyIGNs
YWltcyB0aGF0Cj4gPiByaXNjdixldmVudC10by1taHBtY291bnRlcnMgcmVxdWlyZXMgcmlzY3Ys
ZXZlbnQtdG8tbWhwbWV2ZW50Lgo+ID4KPiA+IERyb3AgdGhlIGRlcGVuZGVuY3kgb2YgcmlzY3Ys
ZXZlbnQtdG8tbWhwbWNvdW50ZXJzIG9uCj4gPiByaXNjdixldmVudC10by1taHBtZXZlbnQuCj4g
Pgo+ID4gRml4ZXM6IDdlMzgwODVkOWM1OSAoImR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFNCSSBQ
TVUgZXZlbnQgbWFwcGluZ3MiKQo+ID4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+IC0tLQo+ID4KPiA+IEF0aXNoLCBJJ20gbm90IDEw
MCUgb24gdGhpcyBvbmUgYnV0IEkgbm90aWNlZCBpdCB3aGlsZSBkb2luZyBkdC12YWxpZGF0ZQo+
ID4gb24gYSBkdW1wIG9mIHRoZSBxZW11IHZpcnQgbWFjaGluZSB3aGljaCBkb2Vzbid0IHVzZSB0
aGUKPiA+IGV2ZW50LXRvLW1ocG1ldmVudCBwcm9wZXJ0eS4KClllcy4gVGhhdCdzIGNvcnJlY3Qu
IHZpcnQgbWFjaGluZSB1c2VzIGRlZmF1bHQgZW5jb2Rpbmcgc3BlY2lmaWVkIGJ5CnRoZSBTQkkg
UE1VIHNwZWMuCkhlbmNlLCBldmVudC10by1taHBtZXZlbnQgaXMgbm90IHVzZWQuCgo+Cj4gV2Fp
dGluZyBmb3IgY29tbWVudHMgYmVmb3JlIEkgYXBwbHkgdGhpcy4uLgo+CgpTb3JyeSBmb3IgdGhl
IGRlbGF5LiBOb3Qgc3VyZSB3aHkgdGhpcyBkaWQgbm90IHNob3cgdXAgaW4gbXkgZ21haWwuClBy
b2JhYmx5IGR1ZSB0byBhbGwgdGhlIGJvdW5jaW5nIGlzc3VlcyBnb2luZyBvbi4KCgpSZXZpZXdl
ZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cgo+ID4KPiA+IENDOiBSb2Ig
SGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgo+ID4gQ0M6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4KPiA+IENDOiBQYXVsIFdhbG1zbGV5
IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4gPiBDQzogUGFsbWVyIERhYmJlbHQgPHBhbG1l
ckBkYWJiZWx0LmNvbT4KPiA+IENDOiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4K
PiA+IENDOiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gQ0M6IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnCj4gPiBDQzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+ID4gQ0M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiA+IC0tLQo+ID4g
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wZXJmL3Jpc2N2LHBtdS55YW1sIHwg
MSAtCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvcmlzY3YscG11LnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVyZi9yaXNjdixwbXUueWFtbAo+
ID4gaW5kZXggYTU1YTRkMDQ3ZDNmLi5jODQ0OGRlMmYyYTAgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGVyZi9yaXNjdixwbXUueWFtbAo+ID4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BlcmYvcmlzY3YscG11LnlhbWwK
PiA+IEBAIC05MSw3ICs5MSw2IEBAIHByb3BlcnRpZXM6Cj4gPgo+ID4gIGRlcGVuZGVuY2llczoK
PiA+ICAgICJyaXNjdixldmVudC10by1taHBtZXZlbnQiOiBbICJyaXNjdixldmVudC10by1taHBt
Y291bnRlcnMiIF0KPiA+IC0gICJyaXNjdixldmVudC10by1taHBtY291bnRlcnMiOiBbICJyaXNj
dixldmVudC10by1taHBtZXZlbnQiIF0KPiA+Cj4gPiAgcmVxdWlyZWQ6Cj4gPiAgICAtIGNvbXBh
dGlibGUKPiA+IC0tCj4gPiAyLjM5LjIKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
