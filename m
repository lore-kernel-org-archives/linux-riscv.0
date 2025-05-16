Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4E1C54754
	for <linux-riscv@archiver.kernel.org>; Fri, 16 May 2025 14:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udGD/vlp05P8DJFDHL9xIIq1z4sEL9/SmnEOzvzizWI=; b=BKDv5JBR5bhRge
	1BPcIXVHs/2k+18omLpPX27+vUu8I6//VCUc26DHbS4A22sS2IuHOE3J6hcwFGAZ40gC18sBZzErX
	IgTmu3TGliS9+oHL8nkoGMMpr7btzFK6flgKiAFZ7ag5Ub5D8U0ncEhystNx1kepCFfrcw6XcfeV0
	5VBMzGTVey1Y5mL01ztEPFvEKcVsLaSBbZ+0nJrfWVFVEImWTZXJk/m6KMmpccI2aS4sUVRI4mGYJ
	kSfv1gyn5GK7eYtyvNppgf54Q1jW2D1nChFCxZexlOBgbGjMjB82AeEetVIqf7/rxGP6LpILt0RD9
	yA2t5S1i+wOd4bfknb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwR4-00000003jcW-2Xxw;
	Fri, 16 May 2025 14:53:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvo3-00000003dCi-2deZ
	for linux-riscv@lists.infradead.org;
	Fri, 16 May 2025 14:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7EB59A4E815
	for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 14:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A9BC4CEED
	for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 14:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747404778;
	bh=M40WfWlk5YMTEsDWr5cABgdKxkUNV407DW73Q7i7IeI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NAZaY/4CpF0feR2rflVvHns81UR7MQacqaPo/ql/3FOQ/wRMlyVUzX9OLlk8Z780h
	 NW0WIOojV892uYO1oRts59Uae2uXosWs5rDCcNJrHvPAEzpASW5gRkcO15ihuNQ3at
	 KX9s3XBPMmzxHMHBJhzxW1hyAiAykGXi7Oh3DnBL2KtsUabczzEcEqWdt6m3ETc+3s
	 K1FgLClCRQdSGC4eee5Y8D3u8Qr+VT70nEQvZw5aaKYA/R3v5nSxaon5aGmwNFBmcP
	 rvoHyWrXkkPNIzeBK1/OPZrDi3qTb8d5Q9hxTm5wiIq9YBjh70bAxKmlJsq+5cWVM5
	 /UhI6clSoea4Q==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-60402c94319so1572930eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 May 2025 07:12:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUs5lBbduLDuXFqqoBguaCUCVGga6Q4Cf8lXVrvVIuT6kGGHl0NTRPaTjlA5FNWHexEQyzNNQgjeJoWXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8JXohwV2O0khrMufZOBGswL5FYk6P8QGOltntZAzNdrhAof3c
	j3G2V1eajvs3yoY4KxsQ2fX+csHcyBrbGOBrCcLaCgLEZEjkv209cQvrI9K/j7Abu2ePATQwEX6
	t5Snp3vCDWculrw0IKGHCWK5/o+zqbo8=
X-Google-Smtp-Source: AGHT+IGupjLPJfmTwVsmvNg0fAfU7DGdQNDawRspJaseP9wgN7f5DAnJ+5/LOf3oSCS/IGTVEHVkkx5+Ray2I6WcuTI=
X-Received: by 2002:a05:6820:1908:b0:606:361b:52ad with SMTP id
 006d021491bc7-609f3731c3bmr2140452eaf.3.1747404777502; Fri, 16 May 2025
 07:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250514055723.1328557-1-sunilvl@ventanamicro.com> <20250514055723.1328557-2-sunilvl@ventanamicro.com>
In-Reply-To: <20250514055723.1328557-2-sunilvl@ventanamicro.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 16 May 2025 16:12:46 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hGVYyHX7ZQPQ5XNrHBBy9jfA+WMLu7XaoXAqr3s4dOfg@mail.gmail.com>
X-Gm-Features: AX0GCFsH-bwqQdQsyTXD9jznFAfsf5DgDdkDatIcIuRAOxRJWF942Z9YbvDa2JI
Message-ID: <CAJZ5v0hGVYyHX7ZQPQ5XNrHBBy9jfA+WMLu7XaoXAqr3s4dOfg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ACPICA: actbl2: Add definitions for RIMT
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev, 
	acpica-devel@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_071259_801987_6DD74B11 
X-CRM114-Status: GOOD (  17.43  )
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

T24gV2VkLCBNYXkgMTQsIDIwMjUgYXQgNzo1N+KAr0FNIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEFDUElDQSBjb21taXQgNzNjMzJiYzg5Y2FkNjRhYjE5
YzEyMzFhMjAyMzYxZTkxN2U2ODIzYwo+Cj4gUklTQy1WIElPIE1hcHBpbmcgVGFibGUgKFJJTVQp
IGlzIGEgbmV3IHN0YXRpYyB0YWJsZSBkZWZpbmVkIGZvciBSSVNDLVYKPiB0byBjb21tdW5pY2F0
ZSBJT01NVSBpbmZvcm1hdGlvbiB0byB0aGUgT1MuIFRoZSBzcGVjaWZpY2F0aW9uIGZvciBSSU1U
Cj4gaXMgYXZhaWxhYmxlIGF0IFsxXS4gQWRkIHN0cnVjdHVyZSBkZWZpbml0aW9ucyBmb3IgUklN
VC4KPgo+IFsxXSAtIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWFjcGkt
cmltdAo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2FjcGljYS9hY3BpY2EvY29tbWl0Lzcz
YzMyYmM4Cj4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5j
b20+CgpBbiBhbmFsb2dvdXMgcGF0Y2ggaXMgcHJlc2VudCBpbiBsaW51eC1uZXh0IGFscmVhZHkg
YXMKCmNlZDYzMzcwMjM3YSBBQ1BJQ0E6IGFjdGJsMjogQWRkIGRlZmluaXRpb25zIGZvciBSSU1U
CgpObyBuZWVkIHRvIHNlbmQgdGhpcyBhZ2Fpbi4KCj4gLS0tCj4gIGluY2x1ZGUvYWNwaS9hY3Ri
bDIuaCB8IDgzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2FjcGkvYWN0YmwyLmggYi9pbmNsdWRlL2FjcGkvYWN0YmwyLmgKPiBpbmRleCAyZTkxN2E4Zjhi
Y2EuLjk5ZWE4YmZlNDdkZSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2FjcGkvYWN0YmwyLmgKPiAr
KysgYi9pbmNsdWRlL2FjcGkvYWN0YmwyLmgKPiBAQCAtNTAsNiArNTAsNyBAQAo+ICAjZGVmaW5l
IEFDUElfU0lHX1JBUzIgICAgICAgICAgICJSQVMyIiAvKiBSQVMyIEZlYXR1cmUgdGFibGUgKi8K
PiAgI2RlZmluZSBBQ1BJX1NJR19SR1JUICAgICAgICAgICAiUkdSVCIgLyogUmVndWxhdG9yeSBH
cmFwaGljcyBSZXNvdXJjZSBUYWJsZSAqLwo+ICAjZGVmaW5lIEFDUElfU0lHX1JIQ1QgICAgICAg
ICAgICJSSENUIiAvKiBSSVNDLVYgSGFydCBDYXBhYmlsaXRpZXMgVGFibGUgKi8KPiArI2RlZmlu
ZSBBQ1BJX1NJR19SSU1UICAgICAgICAgICAiUklNVCIgLyogUklTQy1WIElPIE1hcHBpbmcgVGFi
bGUgKi8KPiAgI2RlZmluZSBBQ1BJX1NJR19TQlNUICAgICAgICAgICAiU0JTVCIgLyogU21hcnQg
QmF0dGVyeSBTcGVjaWZpY2F0aW9uIFRhYmxlICovCj4gICNkZWZpbmUgQUNQSV9TSUdfU0RFSSAg
ICAgICAgICAgIlNERUkiIC8qIFNvZnR3YXJlIERlbGVnYXRlZCBFeGNlcHRpb24gSW50ZXJmYWNl
IFRhYmxlICovCj4gICNkZWZpbmUgQUNQSV9TSUdfU0RFViAgICAgICAgICAgIlNERVYiIC8qIFNl
Y3VyZSBEZXZpY2VzIHRhYmxlICovCj4gQEAgLTMwMDIsNiArMzAwMyw4OCBAQCBzdHJ1Y3QgYWNw
aV9yaGN0X2hhcnRfaW5mbyB7Cj4gICAgICAgICB1MzIgdWlkOyAgICAgICAgICAgICAgICAvKiBB
Q1BJIHByb2Nlc3NvciBVSUQgKi8KPiAgfTsKPgo+ICsvKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+
ICsgKgo+ICsgKiBSSU1UIC0gUklTQy1WIElPIFJlbWFwcGluZyBUYWJsZQo+ICsgKgo+ICsgKiBo
dHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1hY3BpLXJpbXQKPiArICoKPiAr
ICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKi8KPiArCj4gK3N0cnVjdCBhY3BpX3RhYmxlX3JpbXQgewo+
ICsgICAgICAgc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyIGhlYWRlcjsgICAgICAgIC8qIENvbW1v
biBBQ1BJIHRhYmxlIGhlYWRlciAqLwo+ICsgICAgICAgdTMyIG51bV9ub2RlczsgICAgICAgICAg
LyogTnVtYmVyIG9mIFJJTVQgTm9kZXMgKi8KPiArICAgICAgIHUzMiBub2RlX29mZnNldDsgICAg
ICAgIC8qIE9mZnNldCB0byBSSU1UIE5vZGUgQXJyYXkgKi8KPiArICAgICAgIHUzMiByZXNlcnZl
ZDsKPiArfTsKPiArCj4gK3N0cnVjdCBhY3BpX3JpbXRfbm9kZSB7Cj4gKyAgICAgICB1OCB0eXBl
Owo+ICsgICAgICAgdTggcmV2aXNpb247Cj4gKyAgICAgICB1MTYgbGVuZ3RoOwo+ICsgICAgICAg
dTE2IHJlc2VydmVkOwo+ICsgICAgICAgdTE2IGlkOwo+ICsgICAgICAgY2hhciBub2RlX2RhdGFb
XTsKPiArfTsKPiArCj4gK2VudW0gYWNwaV9yaW10X25vZGVfdHlwZSB7Cj4gKyAgICAgICBBQ1BJ
X1JJTVRfTk9ERV9UWVBFX0lPTU1VID0gMHgwLAo+ICsgICAgICAgQUNQSV9SSU1UX05PREVfVFlQ
RV9QQ0lFX1JPT1RfQ09NUExFWCA9IDB4MSwKPiArICAgICAgIEFDUElfUklNVF9OT0RFX1RZUEVf
UExBVF9ERVZJQ0UgPSAweDIsCj4gK307Cj4gKwo+ICtzdHJ1Y3QgYWNwaV9yaW10X2lvbW11IHsK
PiArICAgICAgIHU4IGhhcmR3YXJlX2lkWzhdOyAgICAgIC8qIEhhcmR3YXJlIElEICovCj4gKyAg
ICAgICB1NjQgYmFzZV9hZGRyZXNzOyAgICAgICAvKiBCYXNlIEFkZHJlc3MgKi8KPiArICAgICAg
IHUzMiBmbGFnczsgICAgICAgICAgICAgIC8qIEZsYWdzICovCj4gKyAgICAgICB1MzIgcHJveGlt
aXR5X2RvbWFpbjsgICAvKiBQcm94aW1pdHkgRG9tYWluICovCj4gKyAgICAgICB1MTYgcGNpZV9z
ZWdtZW50X251bWJlcjsgICAgICAgIC8qIFBDSWUgU2VnbWVudCBudW1iZXIgKi8KPiArICAgICAg
IHUxNiBwY2llX2JkZjsgICAgICAgICAgIC8qIFBDSWUgQi9EL0YgKi8KPiArICAgICAgIHUxNiBu
dW1faW50ZXJydXB0X3dpcmVzOyAgICAgICAgLyogTnVtYmVyIG9mIGludGVycnVwdCB3aXJlcyAq
Lwo+ICsgICAgICAgdTE2IGludGVycnVwdF93aXJlX29mZnNldDsgICAgICAvKiBJbnRlcnJ1cHQg
d2lyZSBhcnJheSBvZmZzZXQgKi8KPiArICAgICAgIHU2NCBpbnRlcnJ1cHRfd2lyZVtdOyAgIC8q
IEludGVycnVwdCB3aXJlIGFycmF5ICovCj4gK307Cj4gKwo+ICsvKiBJT01NVSBOb2RlIEZsYWdz
ICovCj4gKyNkZWZpbmUgQUNQSV9SSU1UX0lPTU1VX0ZMQUdTX1BDSUUgICAgICAoMSkKPiArI2Rl
ZmluZSBBQ1BJX1JJTVRfSU9NTVVfRkxBR1NfUFhNX1ZBTElEICgxIDw8IDEpCj4gKwo+ICsvKiBJ
bnRlcnJ1cHQgV2lyZSBTdHJ1Y3R1cmUgKi8KPiArc3RydWN0IGFjcGlfcmltdF9pb21tdV93aXJl
X2dzaSB7Cj4gKyAgICAgICB1MzIgaXJxX251bTsgICAgICAgICAgICAvKiBJbnRlcnJ1cHQgTnVt
YmVyICovCj4gKyAgICAgICB1MzIgZmxhZ3M7ICAgICAgICAgICAgICAvKiBGbGFncyAqLwo+ICt9
Owo+ICsKPiArLyogSW50ZXJydXB0IFdpcmUgRmxhZ3MgKi8KPiArI2RlZmluZSBBQ1BJX1JJTVRf
R1NJX0xFVkVMX1RSSUdHRVJSRUQgICgxKQo+ICsjZGVmaW5lIEFDUElfUklNVF9HU0lfQUNUSVZF
X0hJR0ggICAgICAgKDEgPDwgMSkKPiArCj4gK3N0cnVjdCBhY3BpX3JpbXRfaWRfbWFwcGluZyB7
Cj4gKyAgICAgICB1MzIgc291cmNlX2lkX2Jhc2U7ICAgICAvKiBTb3VyY2UgSUQgQmFzZSAqLwo+
ICsgICAgICAgdTMyIG51bV9pZHM7ICAgICAgICAgICAgLyogTnVtYmVyIG9mIElEcyAqLwo+ICsg
ICAgICAgdTMyIGRlc3RfaWRfYmFzZTsgICAgICAgLyogRGVzdGluYXRpb24gRGV2aWNlIElEIEJh
c2UgKi8KPiArICAgICAgIHUzMiBkZXN0X29mZnNldDsgICAgICAgIC8qIERlc3RpbmF0aW9uIElP
TU1VIE9mZnNldCAqLwo+ICsgICAgICAgdTMyIGZsYWdzOyAgICAgICAgICAgICAgLyogRmxhZ3Mg
Ki8KPiArfTsKPiArCj4gK3N0cnVjdCBhY3BpX3JpbXRfcGNpZV9yYyB7Cj4gKyAgICAgICB1MzIg
ZmxhZ3M7ICAgICAgICAgICAgICAvKiBGbGFncyAqLwo+ICsgICAgICAgdTE2IHJlc2VydmVkOyAg
ICAgICAgICAgLyogUmVzZXJ2ZWQgKi8KPiArICAgICAgIHUxNiBwY2llX3NlZ21lbnRfbnVtYmVy
OyAgICAgICAgLyogUENJZSBTZWdtZW50IG51bWJlciAqLwo+ICsgICAgICAgdTE2IGlkX21hcHBp
bmdfb2Zmc2V0OyAgLyogSUQgbWFwcGluZyBhcnJheSBvZmZzZXQgKi8KPiArICAgICAgIHUxNiBu
dW1faWRfbWFwcGluZ3M7ICAgIC8qIE51bWJlciBvZiBJRCBtYXBwaW5ncyAqLwo+ICt9Owo+ICsK
PiArLyogUENJZSBSb290IENvbXBsZXggTm9kZSBGbGFncyAqLwo+ICsjZGVmaW5lIEFDUElfUklN
VF9QQ0lFX0FUU19TVVBQT1JURUQgICAoMSkKPiArI2RlZmluZSBBQ1BJX1JJTVRfUENJRV9QUklf
U1VQUE9SVEVEICAgKDEgPDwgMSkKPiArCj4gK3N0cnVjdCBhY3BpX3JpbXRfcGxhdGZvcm1fZGV2
aWNlIHsKPiArICAgICAgIHUxNiBpZF9tYXBwaW5nX29mZnNldDsgIC8qIElEIE1hcHBpbmcgYXJy
YXkgb2Zmc2V0ICovCj4gKyAgICAgICB1MTYgbnVtX2lkX21hcHBpbmdzOyAgICAvKiBOdW1iZXIg
b2YgSUQgbWFwcGluZ3MgKi8KPiArICAgICAgIGNoYXIgZGV2aWNlX25hbWVbXTsgICAgIC8qIERl
dmljZSBPYmplY3QgTmFtZSAqLwo+ICt9Owo+ICsKPiAgLyoqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioK
PiAgICoKPiAgICogU0JTVCAtIFNtYXJ0IEJhdHRlcnkgU3BlY2lmaWNhdGlvbiBUYWJsZQo+IC0t
Cj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
