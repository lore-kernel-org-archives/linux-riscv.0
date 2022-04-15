Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96BBC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 04:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBdEAqDsIBkkOF4b2JP8bgBiLyBO53YNVu+i50nfQ0k=; b=Myk4VztrzFo6ej
	ug/mWXdrA5wtwZzOOPnZsXs3B99E1GhF1Z+KAuoG0gT6EmOtpgtupbEmtKPVgjdtZBRnJer8X8Hqi
	0ac9qoRb1zhqZjypKg9DI2NcSCFoSJBHeqSrw9zTS0i4cmR5ixUFcjUTtC7/i129bGXnnptPu1wD4
	Xfq9pUzInPk2LiuLZsmN+8dL+tt5IpzQSKE0M5tm8ZWfyKGptjz3XGvEVWmXzvqSIuYHAuOAaPTZN
	/ARxzghmYmBmIoD33AyTIW04KrxqTFxTVAsWIG+4GPRZqOWp6swrunWtrCs/xM0L9DP8s6r2rCXZy
	BdBjMQIrMeJxmvzoNvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfE3d-008UbR-QC; Fri, 15 Apr 2022 04:59:45 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDy4-008PQn-0z
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 04:54:02 +0000
Received: by mail-lj1-x230.google.com with SMTP id h11so8386158ljb.2
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 21:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v2IHx3Qbgo3wM3/tOigomzLjD7v6BY2hlPBqUcu4Brs=;
 b=WA645uXAq8uzUS58O9L0qm/3eEl4U6ZixnBiBCalf+eeTjC0p1XzE35Hpdh3fSz7EP
 kJRdvPJh3nArYX64LSaxJzsjCvanYkoy8PSp1MIdZEiv4VQy9hpg6qGP67f3bL4KIrJP
 SmqDH5NJWUrqNQpA+cNWQBAzvl0s6I/RNCPasYC2exyDC/PQTZOVFnsMW1qO1QckF9Cr
 eIcYPbks3kAh38ZjN5Vho//fz/T2IRS8PqXCeuafNtB9T4TZhmWc+WJvfEYA1qckvmOd
 JH1bhDpCCoPjyMXC8Msbnys+CCm6OSoe3KMcODvaawDKtmyoRRNRzW3xEi1SsTK7O0Tk
 e79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v2IHx3Qbgo3wM3/tOigomzLjD7v6BY2hlPBqUcu4Brs=;
 b=Y+gamuzqaSa4ylGab9wQTmR0WTBsu8x9/uXrnnwtE9C7EIyvd/5dX3kyu9jTBSeAEb
 X8vdMEQXcdx8v03AGwq1R3zDIF+diyotoPU/FV6W+kg+VVNyMXC64+e4d2++MZSfYDnL
 /I+XljJlb5SfAOyVsMY00B/QR1+BdqQF7xEvGhwh32KJ2KhprftRpFp6fgcvpMX8SQOd
 +NfeqctHBuP44FguYqb++nPK/M84yfoecsrGlOXCvq/uQnxCEo2lTK4R79R45io/ORDK
 gKTd+RR9nANprJwi71HaKFDc4UZnNdFuG+g0NoB/gzMdnFfcRRtAHuJSBJB+br4L7IMm
 w+LA==
X-Gm-Message-State: AOAM5300bTnD+CWUo4jqfuDiTdEdBvvdh38s0ZGj+J4eMPA8SFAEw9Xp
 jUT8GVGn/sirpuEA/eAD7tZy9JAbc1HHraiJbx8dHA==
X-Google-Smtp-Source: ABdhPJyMKLAknTpEqNiOsM8G4x8qCf78+X/p03s7TvJlmBITtJTWR0D+rx0cBX1ozLuRUjW1hvSeuesOng3qFvVZeTo=
X-Received: by 2002:a2e:b6c3:0:b0:249:9b61:656f with SMTP id
 m3-20020a2eb6c3000000b002499b61656fmr3441389ljo.266.1649998437283; Thu, 14
 Apr 2022 21:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220412033335.1384230-1-apatel@ventanamicro.com>
 <4c4c7a.17284.1802b8c14cc.Coremail.panqinglin2020@iscas.ac.cn>
In-Reply-To: <4c4c7a.17284.1802b8c14cc.Coremail.panqinglin2020@iscas.ac.cn>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 15 Apr 2022 10:23:44 +0530
Message-ID: <CAK9=C2V0kiV1_12kMDxv6d4nsQZ81-9W5=JifLhNaiZMoHJyuQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: mm: Fix set_satp_mode() for platform not having
 Sv57
To: =?UTF-8?B?5r2Y5bqG6ZyW?= <panqinglin2020@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_215400_135175_EBE1128C 
X-CRM114-Status: GOOD (  17.38  )
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

T24gRnJpLCBBcHIgMTUsIDIwMjIgYXQgMTA6MTggQU0g5r2Y5bqG6ZyWIDxwYW5xaW5nbGluMjAy
MEBpc2Nhcy5hYy5jbj4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gJmd0Owo+ICZndDsgV2hlbiBT
djU3IGlzIG5vdCBhdmFpbGFibGUgdGhlIHNhdHAuTU9ERSB0ZXN0IGluIHNldF9zYXRwX21vZGUo
KSB3aWxsCj4gJmd0OyBmYWlsIGFuZCBsZWFkIHRvIHBnZGlyIHJlLXByb2dyYW1taW5nIGZvciBT
djQ4LiBUaGUgcGdkaXIgcmUtcHJvZ3JhbW1pbmcKPiAmZ3Q7IHdpbGwgZmFpbCBhcyB3ZWxsIGR1
ZSB0byBwcmUtZXhpc3RpbmcgcGdkaXIgZW50cnkgdXNlZCBmb3IgU3Y1NyBhbmQgYXMKPiAmZ3Q7
IGEgcmVzdWx0IGtlcm5lbCBmYWlscyB0byBib290IG9uIFJJU0MtViBwbGF0Zm9ybSBub3QgaGF2
aW5nIFN2NTcuCj4gJmd0Owo+ICZndDsgVG8gZml4IGFib3ZlIGlzc3VlLCB3ZSBzaG91bGQgY2xl
YXIgdGhlIHBnZGlyIG1lbW9yeSBpbiBzZXRfc2F0cF9tb2RlKCkKPiAmZ3Q7IGJlZm9yZSByZS1w
cm9ncmFtbWluZy4KPiAmZ3Q7Cj4gJmd0OyBGaXhlczogMDExZjA5ZDEyMDUyICgicmlzY3Y6IG1t
OiBTZXQgc3Y1NyBvbiBkZWZhdWx0bHkiKQo+ICZndDsgUmVwb3J0ZWQtYnk6IE1heXVyZXNoIENo
aXRhbGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20+Cj4gJmd0OyBTaWduZWQtb2ZmLWJ5OiBB
bnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiAmZ3Q7IC0tLQo+ICZndDsgIGFy
Y2gvcmlzY3YvbW0vaW5pdC5jIHwgMSArCj4gJmd0OyAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gJmd0Owo+ICZndDsgZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIv
YXJjaC9yaXNjdi9tbS9pbml0LmMKPiAmZ3Q7IGluZGV4IDk1MzViZWE4Njg4Yy4uYjA3OTNkYzBj
MjkxIDEwMDY0NAo+ICZndDsgLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiAmZ3Q7ICsrKyBi
L2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gJmd0OyBAQCAtNzE4LDYgKzcxOCw3IEBAIHN0YXRpYyBf
X2luaXQgdm9pZCBzZXRfc2F0cF9tb2RlKHZvaWQpCj4gJmd0OyAgICAgICAgICAgIGlmICghY2hl
Y2tfbDQpIHsKPiAmZ3Q7ICAgICAgICAgICAgICAgICAgICBkaXNhYmxlX3BndGFibGVfbDUoKTsK
PiAmZ3Q7ICAgICAgICAgICAgICAgICAgICBjaGVja19sNCA9IHRydWU7Cj4gJmd0OyArICAgICAg
ICAgICAgICAgICAgbWVtc2V0KGVhcmx5X3BnX2RpciwgMCwgUEFHRV9TSVpFKTsKPiAmZ3Q7ICAg
ICAgICAgICAgICAgICAgICBnb3RvIHJldHJ5Owo+ICZndDsgICAgICAgICAgICB9Cj4gJmd0OyAg
ICAgICAgICAgIGRpc2FibGVfcGd0YWJsZV9sNCgpOwo+ICZndDsgLS0KPgo+Cj4gSSBmaW5kIGl0
IHRoYXQgdGhlIHNldF9zYXRwX21vZGUgZnVuY3Rpb24gaXMgaW4gLmluaXQudGV4dCBzZWN0aW9u
IHdoaWNoIGJlZ2lucyBhdCAweDgwODAwMDAwLgo+IEFuZCBpdHMgcGdkX2luZGV4IGluIGJvdGgg
U3Y0OCBhbmQgU3Y1NyB3aWxsIGJlIDAuIFNvIGl0IG1heSBub3QgYmUgbmVjZXNzYXJ5IHRvIGNs
ZWFyIHRoZQo+IGVhcmx5X3BnX2RpciB3aGVuIHRoZSBrZXJuZWwgZmluZCBTdjU3IGlzIG5vdCBz
dXBwb3J0ZWQ/IEFuZCBtYXkgSSBnZXQgdGhlIHN0ZXBzIG9mIHJlcHJvZHVjdGlvbgo+IGZyb20g
eW91PwoKV2UgY2FuJ3QgYXNzdW1lIHRoYXQgaXQgd2lsbCBiZSB0aGUgc2FtZSBwZ2RfaW5kZXgg
Zm9yIFN2NDggYW5kIFN2NTcuCgpGb3IgZXhhbXBsZSwgc29tZSBoeXBvdGhldGljYWwgU29DIG1p
Z2h0IGhhdmUgUkFNIHN0YXJ0aW5nIGFmdGVyIDFUQiBzcGFjZS4KCldlIHNob3VsZCBlbnN1cmUg
dGhhdCBlYXJseV9wZ19kaXIgaXMgY2xlYW5lZCBlbnRpcmVseSBmb3IgZGV0ZWN0aW5nIHRoZSBu
ZXh0Cm1vZGUuCgpSZWdhcmRzLApBbnVwCgo+Cj4gWW91cnMsCj4gUWluZ2xpbgo+IDwvYXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+PC9tY2hpdGFsZUB2ZW50YW5hbWljcm8uY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
