Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13B7C001DE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRu7PlFOjIPLw4fkJzhmN0cdFMld19Us2mS310lN6Wg=; b=i6I7GRExCXqoEo
	RCU+KfT/8JdwlVD0G1dWx6cQ0Pa9HIuRimKWF14LNtxO/ODNwkQ1PZeIxwFHG5Rioy76mbIAc7PFh
	vdJoi1LgMk5oclwEP9fW5Y6Wwhk8vGVpDMLaRJ9UOq2ogluFnoAHyRZgJwxGYQadtMlA0/exjCXsh
	L0cMNpYDtRVL41n5f+vJOfUtszGz/eWp96KjhMEYGX96JYRkJjNoYxX1kpi/G8cAAFDMrBKZwzM9O
	vs+zayqug/8GzUhnzC711HDAC4k0VsNIIxqGF/e8/ImeKmMXEtYP9ATMUPWEbBarj9oHYiC+jkhQz
	zuET/E1RDiyRTNxS/vrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSKCd-00ELNQ-2q;
	Sat, 05 Aug 2023 16:32:31 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSKCa-00ELMA-2i
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 16:32:30 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-522ab557632so4021652a12.0
        for <linux-riscv@lists.infradead.org>; Sat, 05 Aug 2023 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1691253143; x=1691857943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYZwvu2eYpPnKPH3ItmneVhr19GRxWhSHTpw1p6mhRA=;
        b=W4RID/l1HMz2deakeikDSBZhV+cMNY31/wH7bwD1pjqV9FqTK3FesvmXRg/7wDghm9
         JeU+pBCqnBH3UChpLoNWZSkoOQ6MI1BxhbjM482q/AwnrLfK9E3sa4vOr3KpNI3p6Wu+
         NG30ek1UI7Lwd9zZlYS9Sb4YSkEpFavg0arxPvSeE/AzU+vm9DneBpiKSYWqAYZAOccx
         Bqcs2wF9kvK2DieQMf9nMQAH4W7h+43HX7ZsIm+/yyyL6L6UkcE2nBuCQvrn3tENPArL
         Z6fazYA6rzH20oTIIF5kAvd1vKO3XK4sFw4ybrM56Y6PbGBBE8HQnfbAcgd+I1n2ZbrH
         T2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691253143; x=1691857943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYZwvu2eYpPnKPH3ItmneVhr19GRxWhSHTpw1p6mhRA=;
        b=Ox7zgre3YxS9zvkRlJfbckh62+wlMPCRYJRhdgd/m5i9W0k3UAImv52aosGSVlI3G4
         Al7mWJqjvzXfvivwXe2WaEb8Dgq28lurI1Ol+EGaEu6fGNTYW5MLI3r2H8A5dWsdgCXz
         yVlFr/I/SLZaWJBPUOccvVi/1pT+0w69C5xla8TVtX0pfb1vMgjch6LWuvvHWHr5u8Rk
         H4jeouyPxIJvaWEmpekYoReSs6HTc4P6oF69ek9KblIS6OLnyQK0PKCk4C9+y6nIeSeN
         NG+E2NIoBD1zz+vHLgXzC8B6QkCewzBscHC0wmPDFNCDu7B+pd7ecTdAMIcMyW7PshvZ
         Upew==
X-Gm-Message-State: AOJu0YxGpcIt4GF7Di19rJ039MJcV2pwWsR6YPz2iIbc8iFc0/j2PNLo
	rmgp6q1QArFjn76NCCLPKaIGwcDK0r0AvTE0y7DV+A==
X-Google-Smtp-Source: AGHT+IGqF5CoJHwPbyndmgCWCRxoTS0266kYUcXeGjcl5kQfH3xJ618u9OsIxBNwWatK5yJoqhEKsOvIh4Iz8zJeCEc=
X-Received: by 2002:aa7:db5a:0:b0:522:3ef1:b1d with SMTP id
 n26-20020aa7db5a000000b005223ef10b1dmr3650827edt.6.1691253142737; Sat, 05 Aug
 2023 09:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230803163302.445167-1-dbarboza@ventanamicro.com> <CAAhSdy0PoG=AwvcavJxuS1Y6nbFE8pcX5vXDuzFr6+vjhpAMkQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0PoG=AwvcavJxuS1Y6nbFE8pcX5vXDuzFr6+vjhpAMkQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 5 Aug 2023 22:02:10 +0530
Message-ID: <CAAhSdy17pWaXWQDOzzJpwKxQPkojv4sZa4+EKrQW6OmFLrXNrw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] RISC-V: KVM: change get_reg/set_reg error code
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, atishp@atishpatra.org, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_093228_880799_1D3B2A96 
X-CRM114-Status: GOOD (  18.66  )
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

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCAyOjQx4oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEF1ZyAzLCAyMDIzIGF0IDEwOjAz4oCvUE0gRGFu
aWVsIEhlbnJpcXVlIEJhcmJvemEKPiA8ZGJhcmJvemFAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gSGksCj4gPgo+ID4gVGhpcyB2ZXJzaW9uIGluY2x1ZGVzIGEgZGlmZiB0aGF0IEFu
ZHJldyBtZW50aW9uZWQgaW4gdjIgWzFdIHRoYXQgSQo+ID4gbWlzc2VkLiBUaGV5IHdlcmUgc3F1
YXNoZWQgaW50byBwYXRjaCAxLgo+ID4KPiA+IE5vIG90aGVyIGNoYW5nZXMgbWFkZS4gUGF0Y2hl
cyByZWJhc2VkIG9uIHRvcCBvZiByaXNjdl9rdm1fcXVldWUuCj4gPgo+ID4gQ2hhbmdlcyBmcm9t
IHYzOgo+ID4gLSBwYXRjaCAxOgo+ID4gICAtIGFkZGVkIG1pc3NpbmcgRUlOVkFMIC0gRU5PRU5U
IGNvbnZlcnNpb25zCj4gPiAtIHYzIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8y
MDIzMDgwMzE0MDAyMi4zOTkzMzMtMS1kYmFyYm96YUB2ZW50YW5hbWljcm8uY29tLwo+ID4KPiA+
IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9rdm0vMjAyMzA4MDEyMjI2MjkuMjEwOTI5LTEt
ZGJhcmJvemFAdmVudGFuYW1pY3JvLmNvbS8KPiA+Cj4gPgo+ID4gQW5kcmV3IEpvbmVzICgxKToK
PiA+ICAgUklTQy1WOiBLVk06IEltcHJvdmUgdmVjdG9yIHNhdmUvcmVzdG9yZSBlcnJvcnMKPiA+
Cj4gPiBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSAoOSk6Cj4gPiAgIFJJU0MtVjogS1ZNOiByZXR1
cm4gRU5PRU5UIGluICpfb25lX3JlZygpIHdoZW4gcmVnIGlzIHVua25vd24KPiA+ICAgUklTQy1W
OiBLVk06IHVzZSBFTk9FTlQgaW4gKl9vbmVfcmVnKCkgd2hlbiBleHRlbnNpb24gaXMgdW5hdmFp
bGFibGUKPiA+ICAgUklTQy1WOiBLVk06IGRvIG5vdCBFT1BOT1RTVVBQIGluIHNldF9vbmVfcmVn
KCkgemljYm8obXx6KQo+ID4gICBSSVNDLVY6IEtWTTogZG8gbm90IEVPUE5PVFNVUFAgaW4gc2V0
IEtWTV9SRUdfUklTQ1ZfVElNRVJfUkVHCj4gPiAgIFJJU0MtVjogS1ZNOiB1c2UgRUJVU1kgd2hl
biAhdmNwdS0+YXJjaC5yYW5fYXRsZWFzdF9vbmNlCj4gPiAgIFJJU0MtVjogS1ZNOiBhdm9pZCBF
QlVTWSB3aGVuIHdyaXRpbmcgc2FtZSBJU0EgdmFsCj4gPiAgIFJJU0MtVjogS1ZNOiBhdm9pZCBF
QlVTWSB3aGVuIHdyaXRpbmcgdGhlIHNhbWUgbWFjaGluZSBJRCB2YWwKPiA+ICAgUklTQy1WOiBL
Vk06IGF2b2lkIEVCVVNZIHdoZW4gd3JpdGluZyB0aGUgc2FtZSBpc2FfZXh0IHZhbAo+ID4gICBk
b2NzOiBrdm06IHJpc2N2OiBkb2N1bWVudCBFQlVTWSBpbiBLVk1fU0VUX09ORV9SRUcKPgo+IEkg
aGF2ZSBxdWV1ZWQgYWxsIHBhdGNoZXMgZXhjZXB0IFBBVENIOSBmb3IgTGludXgtNi42Lgo+Cj4g
RHJldywgcGxlYXNlIHNlbmQgdjUgb2YgUEFUQ0guCgpJIGhhdmUgcXVldWVkIFBBVENIOSBhcyB3
ZWxsLgoKVGhhbmtzLApBbnVwCgoKPgo+IFRoYW5rcywKPiBBbnVwCj4KPiA+Cj4gPiAgRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0IHwgIDIgKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL2FpYS5j
ICAgICAgICAgICB8ICA0ICstCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9mcC5jICAgICAgIHwg
MTIgKysrLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgIHwgNzQgKysrKysr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
LmMgICAgICB8IDE2ICsrKystLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV90aW1lci5jICAg
IHwgMTEgKystLS0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jICAgfCA2MCArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRp
b25zKCspLCA3MiBkZWxldGlvbnMoLSkKPiA+Cj4gPiAtLQo+ID4gMi40MS4wCj4gPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
