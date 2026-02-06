Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8BEECD9B0
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 01:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXlMWTVlyd1cHhapE0TisEymROiNrA4y7FjuR/hYP0M=; b=SEOE1iFSKU7i0S
	AignRsM/GRVBs11WKwcqS8Eq7UtSB7+WZdx8sSfPjVSCHWhPWu9O6sMxkzKO+3JovFHK8Pph7FwJi
	PbXymMyXSMa3+7odXIws+O1kfO3fc+f5etN3/zUyTiPIv9n17qBB46ByfYylFHo94EuLWpWCPrQh9
	vuAPvOLT/Ar/nrCRJFOss9KTFa47/Cp5STugfmj8FVz2FxrbN5YFgMgb/C5LfKmtps9fKA2CYWJ8T
	HNwcahDTBN62kY8Bdom2JWdAIaTuSPem5sWAELDVlfKcoSLIyDbPdWu01PbGXY1dLvXrwYVZDQi/m
	OuLqvUOQQQpQtDJhy5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAMZ-0000000AhaC-3bIF;
	Fri, 06 Feb 2026 01:10:23 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAMW-0000000AhZH-3Hou
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 01:10:22 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-404263bd58fso1651190fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 17:10:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770340219; cv=none;
        d=google.com; s=arc-20240605;
        b=AM7xzHp5VrpPmmfr+h/N8fxnNupvjs9N6+6GXGKd3XioctCxtqt9rPk89eZ2l7d+cV
         KVTHb4opxZF4eGGcd+J41IYD3IS6w2wxBxrGA9EgrpO1LzDYlKGy/5HGj22TYAmu4pDO
         NtypVl2R4e7M/HcDvpRuewGnDO+A9wHxHj/JVjQ9peGO6a35BxL/zqf4gXs7UtX8GhvM
         ZGRplMk1LtwWQ0C3ghD8C50CcEweHfV02toLzN0UuAIohxWocQkieL3MECvd5AW7n28p
         DOVJj/OjcvjllkSewGuw+q0s7yqiSiG7SXzSgwgVo3ZyBdITpO5mwqfRBSWQlTK5P/TS
         opKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g/MfuwqLqbhKjZWvGBnhdqUtPnwfWft+1ZZSTUtvZos=;
        fh=KFfT9arptabQKVJqIyCIxhrY/MHM7qWaMpR/6fa3SqY=;
        b=Dt2D6J90rqSrCu3nMcZrINM4O0wrg3FUOpmnZ0E9aB9ekyBZ2d8TLMHvTVybA0LKeh
         V3TvfHR5w0DXNAz9piyU+GJ1x/kHAfkz6VMurGyuwvkuqNvEXtHI4xo47jEACjWndv+t
         NAQb6hS5XeJrW752Dg4s+v55+yMG40xLC1BAEvhj2sNdmtTw7IbJuAFjmnn26R5qDQAU
         lW+8x33zGT+sLYfvJvDSY4dTSZLtLKytKCV/tI8/WPa5Ybq8POdSUHhsQpZIcnoaCaMR
         k8TzecTw7bYt6i1+8TuveFdSBrb9DO0qdJUgsolxcGtHveT3JsHzsIBpebEXQdQ9eWB0
         h7uA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770340219; x=1770945019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/MfuwqLqbhKjZWvGBnhdqUtPnwfWft+1ZZSTUtvZos=;
        b=b1y9cigy2jUAS2YrGqD+R8l/4N9mYtfEwErxqk+t4lMmFbdXsijujOm+4swfDUZs0I
         rVSTDctMHLRP0J++lJo9PACHaMrgWZC25jzKoWl03JXFA6XX8bLj65wrS/bXDCMLyFt7
         5FumJr2ZtlMvbMzUOJCWpr8Sh+EmRuj77AN84fpqtxp7KVwWDrDG6feyVAq/OeCw3MIY
         49E46SkaDxJRKToKTWC9Mwr5VEeeGEs8t/T9ZSVEgYz7KoyMw2lVdYee8eQ9d951GcCv
         6sJVyY8KUsxXhrcpfFfuWTr9RWvsJhUmhZ0Of1pG7hca6atsuvAWp5QGXs63W1h6XzEO
         yjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770340219; x=1770945019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g/MfuwqLqbhKjZWvGBnhdqUtPnwfWft+1ZZSTUtvZos=;
        b=G70g2/GatktvboFMKJM80zE+/lFDJeprwp2ZwAVls9yaLc9FBtqGf0LnkEDW45KfOj
         PK4e/9fLVcFDQ1XO6cwc7Bs6cbUCd0eSike2yVjfwaX/Gqc9vTjJm04tdogLCFAXPwgY
         2v5TqhsbSrNZQl7oGHFM00kG0uBDiGULDngu+mfxpVC66iIpo5qH7qcLQ68KpCQPzeV0
         LRa9ynjuTHfORIzdV8RV3mXHvIHWsqKpK7gu8PuVIKwUqVnkEYQ/isqMn7K+v5cJ7ktn
         SB9kZbsI4NStDn/zGr1aioIdbNoi95NuwSCuApvsYAo2eLghZyaKn7O7SwlFLh6vL5ma
         SDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb6GUro47qRNiKnHL+UA79nkkkCtx42x10zC+V/ULf10gCpxS+CptrZe/BPR4ah9j+UFjYNyjLKrklCw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9PP6QyYzLrpxOU9yxwSDyGu5QsujZQcwnbKY9rCN0YxLUuH3y
	oVaKutHpQZAUoLiVcRXUZzMP3sPgoXceQVlg/+kqDEx0z7WkpV6ciX+gduO1tzMmkeJGGloavMZ
	pFDB1VbtY9OD7qeIaNZggjeGTeNUrYfc=
X-Gm-Gg: AZuq6aKyagITHGXEEVV2W8AXZ9yI/is6VhkW856puytL00FbSWwCxSIZq1zbSYW5i4u
	6rK78omv0edeWzJe9CxTChTmlQeYwAZ1MMQe+L2WOAkHOdlwPv/oTiqulUZKL+zZcc6/IQJTalG
	kA8sanEVJP7Eq4koogjhGj5F0AlnZQhMVs0lZFSPxMnbQRo3uBUCEPYMc5o8TPy7spqUItVEJof
	0FTX0UWAhXi5YxF2rcvXwOjIUoD2VeECmom8NqeV7NqMRpw98Qnf0HVnPxgW4Z/W9isWQFIhgE2
	NrW4G/gh6dPgLL9YwQrg0rPwxsg=
X-Received: by 2002:a05:6820:4df5:b0:663:12ec:15b8 with SMTP id
 006d021491bc7-66d148a45c3mr529303eaf.26.1770340219223; Thu, 05 Feb 2026
 17:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20260205010502.2554381-1-xujiakai2025@iscas.ac.cn>
 <20260205010502.2554381-3-xujiakai2025@iscas.ac.cn> <gcspbbvqkr7y53c4ytkqqycygkcqkiakle4aelq2z7nsnlyegl@addv4v655cbg>
In-Reply-To: <gcspbbvqkr7y53c4ytkqqycygkcqkiakle4aelq2z7nsnlyegl@addv4v655cbg>
From: eanut 6 <jiakaipeanut@gmail.com>
Date: Fri, 6 Feb 2026 09:10:08 +0800
X-Gm-Features: AZwV_QhcFA9toIkXo56oGUCoj8hyEt0zkeewoqds6t1BmWq6FbDPmwG23AVfrVE
Message-ID: <CAFb8wJuXBLiqZieA+puXd=5BGhHaNqy_vvSJgfhp-v4q3D4mHQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Jiakai Xu <xujiakai2025@iscas.ac.cn>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_171020_841324_39DB0904 
X-CRM114-Status: GOOD (  36.90  )
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

SGkgRHJldywKClRoYW5rcyBhIGxvdCBmb3IgdGhlIGRldGFpbGVkIHJldmlldyBhbmQgc3VnZ2Vz
dGlvbnMuCkkgYWdyZWUgd2l0aCB5b3VyIHBvaW50cy4KCkkgd2lsbCBwb3N0IGEgcmV2aXNlZCB2
ZXJzaW9uIGluIGFib3V0IGEgd2Vlay4gVGhpcyBpcyBtYWlubHkgdG8gYWxsb3cKc29tZSB0aW1l
IGluIGNhc2Ugb3RoZXIgcmV2aWV3ZXJzIGhhdmUgYWRkaXRpb25hbCBmZWVkYmFjayBvbiB0aGUK
Y3VycmVudCBhcHByb2FjaCwgc28gdGhhdCBldmVyeXRoaW5nIGNhbiBiZSBhZGRyZXNzZWQgdG9n
ZXRoZXIgaW4gdGhlCm5leHQgcmV2aXNpb24uCgpUaGFua3MgYWdhaW4gZm9yIHRoZSBjYXJlZnVs
IHJldmlldy4KCkJlc3QgcmVnYXJkcywKSmlha2FpCgpPbiBUaHUsIEZlYiA1LCAyMDI2IGF0IDEx
OjU44oCvUE0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4gd3Jv
dGU6Cj4KPiBPbiBUaHUsIEZlYiAwNSwgMjAyNiBhdCAwMTowNTowMkFNICswMDAwLCBKaWFrYWkg
WHUgd3JvdGU6Cj4gPiBBZGQgUklTQy1WIEtWTSBzZWxmdGVzdHMgdG8gdmVyaWZ5IHRoZSBTQkkg
U3RlYWwtVGltZSBBY2NvdW50aW5nIChTVEEpCj4gPiBzaGFyZWQgbWVtb3J5IGFsaWdubWVudCBy
ZXF1aXJlbWVudHMuCj4gPgo+ID4gVGhlIFNCSSBzcGVjaWZpY2F0aW9uIHJlcXVpcmVzIHRoZSBT
VEEgc2hhcmVkIG1lbW9yeSBHUEEgdG8gYmUgNjQtYnl0ZQo+ID4gYWxpZ25lZCwgb3Igc2V0IHRv
IGFsbC1vbmVzIHRvIGV4cGxpY2l0bHkgZGlzYWJsZSBzdGVhbC10aW1lIGFjY291bnRpbmcuCj4g
PiBUaGlzIHRlc3QgdmVyaWZpZXMgdGhhdCBLVk0gZW5mb3JjZXMgdGhlIGV4cGVjdGVkIGJlaGF2
aW9yIHdoZW4KPiA+IGNvbmZpZ3VyaW5nIHRoZSBTQkkgU1RBIHNoYXJlZCBtZW1vcnkgdmlhIEtW
TV9TRVRfT05FX1JFRy4KPiA+Cj4gPiBTcGVjaWZpY2FsbHksIHRoZSB0ZXN0IGNoZWNrcyB0aGF0
Ogo+ID4gLSBtaXNhbGlnbmVkIEdQQXMgYXJlIHJlamVjdGVkIHdpdGggLUVJTlZBTAo+ID4gLSA2
NC1ieXRlIGFsaWduZWQgR1BBcyBhcmUgYWNjZXB0ZWQKPiA+IC0gSU5WQUxJRF9HUEEgY29ycmVj
dGx5IGRpc2FibGVzIHN0ZWFsLXRpbWUgYWNjb3VudGluZwo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgo+ID4gU2lnbmVkLW9mZi1ieTog
Smlha2FpIFh1IDxqaWFrYWlQZWFudXRAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgLi4uL3NlbGZ0
ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaCAgIHwgIDQgKysrCj4gPiAgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL3N0ZWFsX3RpbWUuYyAgICAgIHwgMzMgKysrKysrKysrKysr
KysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9j
ZXNzb3IuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nl
c3Nvci5oCj4gPiBpbmRleCBlNTgyODI0ODhiZWIzLi5jMzU1MWQxMjlkMmY2IDEwMDY0NAo+ID4g
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29y
LmgKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3By
b2Nlc3Nvci5oCj4gPiBAQCAtNjIsNiArNjIsMTAgQEAgc3RhdGljIGlubGluZSB1aW50NjRfdCBf
X2t2bV9yZWdfaWQodWludDY0X3QgdHlwZSwgdWludDY0X3Qgc3VidHlwZSwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEtWTV9SRUdfUklTQ1Zf
U0JJX1NJTkdMRSwgICAgICAgICAgXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgaWR4LCBLVk1fUkVHX1NJWkVfVUxPTkcpCj4gPgo+ID4gKyNk
ZWZpbmUgUklTQ1ZfU0JJX1NUQV9SRUcoaWR4KSAgICAgICBfX2t2bV9yZWdfaWQoS1ZNX1JFR19S
SVNDVl9TQklfU1RBVEUsICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgS1ZNX1JFR19SSVNDVl9TQklfU1RBLCAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlkeCwgS1ZNX1JFR19TSVpFX1VMT05HKQo+Cj4gV2UgZG9uJ3QgbmVlZCB0aGlzIGJlY2F1
c2UuLi4KPgo+ID4gKwo+ID4gIGJvb2wgX192Y3B1X2hhc19leHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCB1aW50NjRfdCBleHQpOwo+ID4KPiA+ICBzdGF0aWMgaW5saW5lIGJvb2wgX192Y3B1X2hh
c19pc2FfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdWludDY0X3QgaXNhX2V4dCkKPiA+IGRp
ZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vc3RlYWxfdGltZS5jIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3N0ZWFsX3RpbWUuYwo+ID4gaW5kZXggOGVkYzFmY2Ez
NDViYS4uMzBiOThkMWI2MDFjMyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9zdGVhbF90aW1lLmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9zdGVhbF90aW1lLmMKPiA+IEBAIC0yMDksNiArMjA5LDcgQEAgc3RhdGljIHZvaWQgc3RlYWxf
dGltZV9kdW1wKHN0cnVjdCBrdm1fdm0gKnZtLCB1aW50MzJfdCB2Y3B1X2lkeCkKPiA+Cj4gPiAg
LyogU0JJIFNUQSBzaG1lbSBtdXN0IGhhdmUgNjQtYnl0ZSBhbGlnbm1lbnQgKi8KPiA+ICAjZGVm
aW5lIFNURUFMX1RJTUVfU0laRSAgICAgICAgICAgICAgKChzaXplb2Yoc3RydWN0IHN0YV9zdHJ1
Y3QpICsgNjMpICYgfjYzKQo+ID4gKyNkZWZpbmUgSU5WQUxJRF9HUEEgKH4odTY0KTApCj4gPgo+
ID4gIHN0YXRpYyB2bV9wYWRkcl90IHN0X2dwYVtOUl9WQ1BVU107Cj4gPgo+ID4gQEAgLTMwMSw2
ICszMDIsMzQgQEAgc3RhdGljIHZvaWQgc3RlYWxfdGltZV9kdW1wKHN0cnVjdCBrdm1fdm0gKnZt
LCB1aW50MzJfdCB2Y3B1X2lkeCkKPiA+ICAgICAgIHByX2luZm8oIlxuIik7Cj4gPiAgfQo+ID4K
PiA+ICtzdGF0aWMgdm9pZCB0ZXN0X3Jpc2N2X3N0YV9zaG1lbV9hbGlnbm1lbnQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBrdm1fb25lX3JlZyByZWc7Cj4g
PiArICAgICB1aW50NjRfdCBzaG1lbTsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAg
ICByZWcuaWQgPSBSSVNDVl9TQklfU1RBX1JFRygwKTsKPgo+IC4uLmhlcmUgd2Ugc2hvdWxkIHVz
ZSBLVk1fUkVHX1JJU0NWX1NCSV9TVEFfUkVHKHNobWVtX2xvKQo+Cj4gPiArICAgICByZWcuYWRk
ciA9ICh1aW50NjRfdCkmc2htZW07Cj4gPiArCj4gPiArICAgICAvKiBDYXNlIDE6IG1pc2FsaWdu
ZWQgR1BBICovCj4gPiArICAgICBzaG1lbSA9IFNUX0dQQV9CQVNFICsgMTsKPiA+ICsgICAgIHJl
dCA9IF9fdmNwdV9pb2N0bCh2Y3B1LCBLVk1fU0VUX09ORV9SRUcsICZyZWcpOwo+ID4gKyAgICAg
VEVTVF9BU1NFUlQocmV0ID09IC0xICYmIGVycm5vID09IEVJTlZBTCwKPiA+ICsgICAgICAgICAg
ICAgICAgICJtaXNhbGlnbmVkIFNUQSBzaG1lbSBzaG91bGQgcmV0dXJuIC1FSU5WQUwiKTsKPgo+
IHJlbW92ZSB0aGUgd29yZCAnc2hvdWxkJwo+Cj4gIm1pc2FsaWduZWQgU1RBIHNobWVtIHJldHVy
bnMgLUVJTlZBTCIKPgo+ID4gKwo+ID4gKyAgICAgLyogQ2FzZSAyOiA2NC1ieXRlIGFsaWduZWQg
R1BBICovCj4gPiArICAgICBzaG1lbSA9IFNUX0dQQV9CQVNFOwo+ID4gKyAgICAgcmV0ID0gX192
Y3B1X2lvY3RsKHZjcHUsIEtWTV9TRVRfT05FX1JFRywgJnJlZyk7Cj4gPiArICAgICBURVNUX0FT
U0VSVChyZXQgPT0gMCwKPiA+ICsgICAgICAgICAgICAgICAgICJhbGlnbmVkIFNUQSBzaG1lbSBz
aG91bGQgc3VjY2VlZCIpOwo+Cj4gc2FtZSBjb21tZW50IGFib3V0ICdzaG91bGQnCj4KPiA+ICsK
PiA+ICsgICAgIC8qIENhc2UgMzogSU5WQUxJRF9HUEEgZGlzYWJsZXMgU1RBICovCj4gPiArICAg
ICBzaG1lbSA9IElOVkFMSURfR1BBOwo+ID4gKyAgICAgcmV0ID0gX192Y3B1X2lvY3RsKHZjcHUs
IEtWTV9TRVRfT05FX1JFRywgJnJlZyk7Cj4gPiArICAgICBURVNUX0FTU0VSVChyZXQgPT0gMCwK
PiA+ICsgICAgICAgICAgICAgICAgICJJTlZBTElEX0dQQSBzaG91bGQgZGlzYWJsZSBTVEEgc3Vj
Y2Vzc2Z1bGx5Iik7Cj4KPiBXZSdyZSBub3QgdGVzdGluZyB0aGF0IFNUQSB3YXMgc3VjY2Vzc2Z1
bGx5IGRpc2FibGVkLCBvbmx5IHRoYXQgYWxsLW9uZXMKPiBpbnB1dCBkb2Vzbid0IGdlbmVyYXRl
IGFuIGVycm9yLiBTbyB0aGUgbWVzc2FnZSBzaG91bGQgYmUgYWxvbmcgdGhlIGxpbmVzCj4gb2Yg
ImFsbC1vbmVzIGZvciBTVEEgc2htZW0gc3VjY2VlZHMiCj4KPiA+ICt9Cj4gPiArCj4gPiAgI2Vu
ZGlmCj4gPgo+ID4gIHN0YXRpYyB2b2lkICpkb19zdGVhbF90aW1lKHZvaWQgKmFyZykKPiA+IEBA
IC0zNjksNiArMzk4LDEwIEBAIGludCBtYWluKGludCBhYywgY2hhciAqKmF2KQo+ID4gICAgICAg
VEVTVF9SRVFVSVJFKGlzX3N0ZWFsX3RpbWVfc3VwcG9ydGVkKHZjcHVzWzBdKSk7Cj4gPiAgICAg
ICBrc2Z0X3NldF9wbGFuKE5SX1ZDUFVTKTsKPiA+Cj4gPiArI2lmZGVmIF9fcmlzY3YKPiA+ICsg
ICAgIHRlc3RfcmlzY3Zfc3RhX3NobWVtX2FsaWdubWVudCh2Y3B1c1swXSk7Cj4gPiArI2VuZGlm
Cj4KPiBXZSBsaWtlIHRvIHRyeSB0byBhdm9pZCAjaWZkZWZzIGluIGNvbW1vbiBmdW5jdGlvbnMg
YnkgcHJvdmlkaW5nIHN0dWJzIGZvcgo+IGFyY2hpdGVjdHVyZXMgdGhhdCBkb24ndCBuZWVkIHRo
ZW0gW3lldF0uIFNvIHdlIHNob3VsZCByZW5hbWUgdGhpcyB0bwo+IHNvbWV0aGluZyBtb3JlIGdl
bmVyaWMsIGxpa2UKPgo+ICBjaGVja19zdGVhbF90aW1lX3VhcGkoKQo+Cj4gYW5kIHRoZW4gY2Fs
bCBpdCBmb3IgYWxsIGFyY2hpdGVjdHVyZXMuIEFjdHVhbGx5IHRoZSBvdGhlciBhcmNoaXRlY3R1
cmVzCj4gY2FuIGFscmVhZHkgbWFrZSB1c2Ugb2YgaXQgc2luY2UgYm90aCB4ODYgYW5kIGFybTY0
IGRvIHVhcGkgdGVzdHMgaW4KPiB0aGVpciBzdGVhbF90aW1lX2luaXQoKSBmdW5jdGlvbnMgYW5k
IHRoYXQncyBub3QgcmVhbGx5IHRoZSByaWdodAo+IHBsYWNlIHRvIGRvIHRoYXQuIEkgc3VnZ2Vz
dCBjcmVhdGluZyBhbm90aGVyIHBhdGNoIHRoYXQgZmlyc3QgbW92ZXMgdGhvc2UKPiB0ZXN0cyBp
bnRvIG5ldyBmdW5jdGlvbnMgKGNoZWNrX3N0ZWFsX3RpbWVfdWFwaSgpKSB3aGljaCBvbmx5IG5l
ZWRzIHRvCj4gYmUgY2FsbGVkIG9uY2UgZm9yIHZjcHVbMF0gb3V0c2lkZSB0aGUgdmNwdSBsb29w
LCBhcyB5b3UgZG8gaGVyZS4gSW4KPiB0aGF0IHBhdGNoIGNoZWNrX3N0ZWFsX3RpbWVfdWFwaSgp
IHdpbGwgYmUgYSBzdHViIGZvciByaXNjdi4gVGhlbiBpbgo+IGEgc2Vjb25kIHBhdGNoIGZpbGwg
aW4gdGhhdCBzdHViIHdpdGggdGhlIHRlc3RzIGFib3ZlLgo+Cj4gVGhhbmtzLAo+IGRyZXcKPgo+
ID4gKwo+ID4gICAgICAgLyogUnVuIHRlc3Qgb24gZWFjaCBWQ1BVICovCj4gPiAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgTlJfVkNQVVM7ICsraSkgewo+ID4gICAgICAgICAgICAgICBzdGVhbF90aW1l
X2luaXQodmNwdXNbaV0sIGkpOwo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
