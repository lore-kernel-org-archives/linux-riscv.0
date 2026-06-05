Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10097CD6E74
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 07:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bpBv1R7ixqj6gid5Y666g9QQSKOtcgaM8auGDaYN3oc=; b=RG7x/f413Hmmva
	++ILT3PGljt2d5nWiz3dEKA08w/uqSip8N127M3sbNwprBDVrcxae291gM9OLQUmASe7Jh/wmS9gP
	dkdpMM1IeZBnkPT/uM4jBwhZ388aNSP+YxusXxZW9L1evScitSVRcaOoHJfA2rI1WIv5ektaUYl0y
	vc1cqN/+8ZSeTuzOzM2BEUBUscVhzYhx+NnCLgtOUDsWl5vYhfpnR5DVVpEQ2GX1wGYgrlLojRQdR
	YdY2DD03UD/G0jMRGwBvivq8W1H2LnaDycbd+GSWPILFnD7Q+RzGJ90XhZ9pdqlrKP+7h6xbd+cij
	g4fF2tmzWCYH9ab54NKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPRe-00000000GnC-27Vy;
	Fri, 05 Jun 2026 07:58:22 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPRa-00000000Glk-3utV
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 07:58:21 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c8585c51f1fso1222712a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 00:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780646298; x=1781251098; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U0wGo+/dZuxgW4szuH8gan5ReO5OZDCnLg0qgexAPWw=;
        b=jiuYCDXFWSD0D5h7B2GLm2pOLyPishzFqcrx6H/qDVX3kX/VFAr1jypOBgm+2hugz8
         Phf1ArtJ8UaoYPUjAZLPYKqev3wGP/HNKs1jay6ERQVIIbA5O0CBxMepFzkJPQ8x6FRQ
         D8hl/VtKln9cFywQ3ASuuenSb+pLJgGfrOLAQwC7Hih2G0YarCXSiA166Ujl2DSHDm2P
         CtE4Z2+B51FQBLCfeR5iiuiAlpqGmx4VMm/Tr2Xku5RLiy+rY+S1HpWN0j9+2bZnX7xJ
         bdSgBpfTfhOvYCVGepGx++4ejb/5/uGp0hDpNG9neekEsFPaDX/M+O9rWX1wCcdnNa6q
         t/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646298; x=1781251098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0wGo+/dZuxgW4szuH8gan5ReO5OZDCnLg0qgexAPWw=;
        b=hiAxwnnRq0Fud91gJ68Wq8rSk/iUFSmFIkuhF5AdF30wpL/5n35HnG1uTcTfZHWSjW
         IGH9VnOfNHvP0iaa+P8HqwzsxGdDMmZmPEYlsts554Qq81ix9dkkdJPvA499WRsiJvid
         PC+TiWdxt9dX0sUxri50n7euvF1XeJZVU2PMVn8Qr2XeS14IDFQZantRlNMr+2i2emYd
         hFVh8q6A1XDdeZn/H8dMPJbKNLvL6ig7Gfq0WaijknCTx8RXXDyCt/tRRXK2obXF6B0v
         AOSJ+RV8kK8F4F2AndSX2bu7xfXtzAX7SjAZsXp9f67VceJkhLX2E0hVma1na1iTqRlq
         3Mlg==
X-Forwarded-Encrypted: i=1; AFNElJ8l/xgJZYTiHXvI06t47akxrWXP0WMV+ntmsAUYekt7KnzFuxyIznfbxcgh+iLzH+Sq/CvyVM9A+7RIDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrgjCknMpSMAyy5h364PWYEFUkwOrxC7frvpozxKO78XbrtXNO
	UM2lZFPIz5Mj4b0CQgla1A3KGQm27PtBjb0mssrRGeD+of74qxW7D2dy
X-Gm-Gg: Acq92OHtqU6Y9AiTPERQLe1FzPmmI30ewjQyALNcwyYq4wiKaQqpM67qNoTKIsDUfA+
	6nQcJWp26lZ75uSkL46zfrzo0sYt7vA6j1CGuvyCkoqPjkWkNGjTnrM9fdD93s3GIHDHoMo8Y7t
	AmFSZqa4AAn2JaKgAXJDAg1fuOVTkx2PFujcWP2O/VZQhCI+mLMN2yHutxTYBS6zA+0PMQL4wCN
	RPUI0aV1Rb8EFKiKtjwMcFm1/Ej2aOtnMwUYD1gmJBHfe9aitt+QpFQKQCf0IjrZh5SHHWrTL1y
	qPujeUxMU7jSEM/86W+hYteVCDUq8gZ696O5/FYEsVvd9TM4f7pKXy2CsMvCbuE/OaXWTOMw1qt
	aiGALT7jtU2l7ka7nPD4PxV4Fdlk8PBWco5phCOObjNJPQ2u+3riUR8I33Ma4NB0pNAZUw+6SmU
	V1tjDKhMDy8/KDFlWE/15oRa0n1egDrONQAQ==
X-Received: by 2002:a17:903:230f:b0:2bd:9b0e:b43a with SMTP id d9443c01a7336-2c1ec7a81e2mr15580255ad.7.1780646297700;
        Fri, 05 Jun 2026 00:58:17 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm84894355ad.33.2026.06.05.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 00:58:17 -0700 (PDT)
Date: Fri, 5 Jun 2026 15:58:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Enhance the logging check for mmu mapping
Message-ID: <aiJyHGne7VAkRD3g@inochi.infowork>
References: <20260528113840.2629186-1-inochiama@gmail.com>
 <CAAhSdy096z4SdwQKBxM0ZtE5=i3UZrhMD-BcES9UdP5OgajqEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy096z4SdwQKBxM0ZtE5=i3UZrhMD-BcES9UdP5OgajqEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_005818_973528_682CB35E 
X-CRM114-Status: GOOD (  28.48  )
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

T24gRnJpLCBKdW4gMDUsIDIwMjYgYXQgMTI6MTk6MDNQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIE1heSAyOCwgMjAyNiBhdCA1OjA44oCvUE0gSW5vY2hpIEFtYW90byA8aW5v
Y2hpYW1hQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2hlbiBlbmFibGluZyBkaXJ0eSByaW5n
LCB0aGUgZGlydHkgYml0bWFwIGlzIGRpc2FibGUsIGFuZCB0aGUgbG9nZ2luZwo+ID4gY2hlY2sg
aXMgYWx3YXlzIGZhbHNlIGFzIHRoZSBSSVNDLVYgYXJjaGl0ZWN0dXJlIGRvZXMgbm90IHNlbGVj
dAo+ID4gIk5FRURfS1ZNX0RJUlRZX1JJTkdfV0lUSF9CSVRNQVAiLiBBbHRob3VnaCB0aGUgZGly
dHkgbG9nIGlzIHJlY29yZGVkCj4gPiBzaW5jZSB0aGUgd3JpdGUgcGF0aCBhbHJlYWR5IHRyeWlu
ZyB0byBhZGQgdGhlIGRpcnR5IGxvZywgdGhlIGxvZ2ljIGZvcgo+ID4gbG9nZ2luZyBjaGVjayBp
cyBicm9rZW4gYW5kIHNvbWUgc2lkZSBlZmZlY3Qgd2lsbCBvY2N1cnMuCj4gPgo+ID4gRW5oYW5j
ZSB0aGUgbG9nZ2luZyBjaGVjayBmb3IgbW11IG1hcHBpbmcgc28gaXQgY2FuIGNoZWNrIGJvdGgg
dGhlIGRpcnR5Cj4gPiByaW5nIGFuZCB0aGUgZGlydHkgYml0bWFwLgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBh
cmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDkgKysrKy0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ID4gaW5kZXggMmQzZGVmMDI0
MjcwLi5iNTg3M2JjYTlkY2UgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+
ID4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiA+IEBAIC0xNDIsOSArMTQyLDggQEAgdm9p
ZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0ga3ZtX21yX2NoYW5nZSBjaGFuZ2UpCj4g
PiAgewo+ID4gICAgICAgICAvKgo+ID4gLSAgICAgICAgKiBBdCB0aGlzIHBvaW50IG1lbXNsb3Qg
aGFzIGJlZW4gY29tbWl0dGVkIGFuZCB0aGVyZSBpcyBhbgo+ID4gLSAgICAgICAgKiBhbGxvY2F0
ZWQgZGlydHlfYml0bWFwW10sIGRpcnR5IHBhZ2VzIHdpbGwgYmUgdHJhY2tlZCB3aGlsZQo+ID4g
LSAgICAgICAgKiB0aGUgbWVtb3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVjdGVkLgo+ID4gKyAgICAg
ICAgKiBBdCB0aGlzIHBvaW50IG1lbXNsb3QgaGFzIGJlZW4gY29tbWl0dGVkIGFuZCBkaXJ0eSBw
YWdlcyB3aWxsIGJlCj4gPiArICAgICAgICAqIHRyYWNrZWQgd2hpbGUgdGhlIG1lbW9yeSBzbG90
IGlzIHdyaXRlIHByb3RlY3RlZC4KPiA+ICAgICAgICAgICovCj4gPiAgICAgICAgIGlmIChjaGFu
Z2UgIT0gS1ZNX01SX0RFTEVURSAmJiBuZXctPmZsYWdzICYgS1ZNX01FTV9MT0dfRElSVFlfUEFH
RVMpIHsKPiA+ICAgICAgICAgICAgICAgICBpZiAoa3ZtX2RpcnR5X2xvZ19tYW51YWxfcHJvdGVj
dF9hbmRfaW5pdF9zZXQoa3ZtKSkKPiA+IEBAIC00MzMsOCArNDMyLDggQEAgaW50IGt2bV9yaXNj
dl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
bWVtc2xvdCwKPiA+ICAgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4gPiAgICAg
ICAgIHN0cnVjdCBrdm0gKmt2bSA9IHZjcHUtPmt2bTsKPiA+ICAgICAgICAgc3RydWN0IGt2bV9t
bXVfbWVtb3J5X2NhY2hlICpwY2FjaGUgPSAmdmNwdS0+YXJjaC5tbXVfcGFnZV9jYWNoZTsKPiA+
IC0gICAgICAgYm9vbCBsb2dnaW5nID0gKG1lbXNsb3QtPmRpcnR5X2JpdG1hcCAmJgo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgIShtZW1zbG90LT5mbGFncyAmIEtWTV9NRU1fUkVBRE9OTFkp
KSA/IHRydWUgOiBmYWxzZTsKPiAKPiBXaHkgaXMgdGhpcyBub3QgY29ycmVjdCBhcHByb2FjaCB0
byBkZXRlcm1pbmUgd2hldGhlciBsb2dnaW5nIGlzIGVuYWJsZWQgPwo+IAo+IEtWTSBBUk02NCBk
b2VzIGEgdmVyeSBzaW1pbGFyIHRoaW5nIChSZWZlciwgbWVtc2xvdF9pc19sb2dnaW5nKCkgaW4K
PiBhcmNoL2FybTY0L2t2bS9tbXUuYykuCj4gCgpBUk02NCBpcyBjb3JyZWN0IGFzIGl0IHNlbGVj
dCBORUVEX0tWTV9ESVJUWV9SSU5HX1dJVEhfQklUTUFQLCB3aGljaAp3aWxsIGFkZCBhIGJhY2t1
cCBiaXRtYXAgd2hlbiBlbmFibGluZyBkaXJ0eSByaW5nLiBIb3dldmVyLCB0aGUgUklTQ1YKZG9l
cyBub3Qgc2VsZWN0IHRoaXMsIHdoaWNoIG1lYW5zIHRoZSBiaXRtYXAgaXMgbm90IHByZXNlbnQg
d2hlbiB0aGUKZGlydHkgcmluZyBpcyB1c2VkLiAKCkFsdGhvdWdoIHdlIHN0aWxsIGhhdmUgZGly
dHkgbG9nIHdpdGggZGlydHkgcmluZyBub3csIGl0IGNvbWVzIGZyb20KdGhlIGNoZWNrIGluIHRo
ZSBtYXJrX3BhZ2VfZGlydHlfaW5fc2xvdCgpLiBBbmQgdGhlIGNoZWNrIGZvciB2YXJpYWJsZQoi
bG9nZ2luZyIgaXMgYWx3YXlzIGZhbHNlIHdoZW4gZW5hYmxpbmcgZGlydHkgcmluZy4KClJlZ2Fy
ZHMsCklub2NoaQoKPiA+ICsgICAgICAgYm9vbCBsb2dnaW5nID0ga3ZtX3Nsb3RfZGlydHlfdHJh
Y2tfZW5hYmxlZChtZW1zbG90KSAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAhKG1lbXNs
b3QtPmZsYWdzICYgS1ZNX01FTV9SRUFET05MWSk7Cj4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcg
dm1hX3BhZ2VzaXplLCBtbXVfc2VxOwo+ID4gICAgICAgICBzdHJ1Y3Qga3ZtX2dzdGFnZSBnc3Rh
Z2U7Cj4gPiAgICAgICAgIHN0cnVjdCBwYWdlICpwYWdlOwo+ID4gLS0KPiA+IDIuNTQuMAo+ID4K
PiAKPiBSZWdhcmRzLAo+IEFudXAKPiAKPiAtLSAKPiBrdm0tcmlzY3YgbWFpbGluZyBsaXN0Cj4g
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
