Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2F8C3DA63
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jul 2024 02:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VIffR5AjpW4rqpj3NzMschvNTbYvbWl3a/leMrSVuk=; b=NN/V4Gxmlaim0X
	QS7EY2phEhIJ9JgG0sbrzTxrKosu9rRxn5NtNGX071MsrqcvFKXXodR2IORZ9/c8zTqHxJ4ZnUomH
	tYKCO9DjEVWlIo2T6fBdQCe74bwT3XS7NNJ/Wj4AudikHTTnsmuBXRvAN1YlpclLYVfhHHPTKWqVL
	t10Epvace9Mo5zFyNeMyaw+tdChpodDtNwfRUoQVk7JAU+6O9I6VWjSPiVkZmbYYUX+f7RwiJdseL
	LgNH6P3B/hndQrQzk87zsyvRxt9zxZykeWcPS0i9FY+gvoj4qlalacFP5aZph3KqXpSJd0Q0aBGsx
	52XLc8xuM47w8aVA3Gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWRz7-0000000EAfX-0Txt;
	Wed, 24 Jul 2024 02:44:09 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWRz3-0000000EAep-3KeA
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jul 2024 02:44:07 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-396ce435923so1566115ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jul 2024 19:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721789044; x=1722393844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJuRD61x6itbq5ZOyADK/jtrgm1hblg0GZj3yw8kMqc=;
        b=fSis95xQ/6Tq1JI49pRk7TMeT1XDFmAl/S9c8h+qCFc/gL/szPbs9uP+JnxHnpVSwL
         n+U4v+YToeeztmExGyklwbKv4KO+o7hg2Z1qK1PKcJ1w2SdCbQkrzJEDHGH2GWChrCzG
         wd+OZAeILVFGqZ5kgMb3LwD6IiNIEvs5A9m/9IMIYMj3ianide9IT8/BJu1rIdjogb1T
         jsI2r5Z1lDK+2jcKTHOjA542rI2+GxD0tJMlNY3E9jSoAnFk0091NrD+e9rfUbq8uGZr
         zU1/NapoSusIR4TuWyxioDAU3vYAcQGgiRMVo9ulI/I4npZ4j/93intHDBzaydNU1V98
         XDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721789044; x=1722393844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJuRD61x6itbq5ZOyADK/jtrgm1hblg0GZj3yw8kMqc=;
        b=J4MnrRCEbxs6Ngzftk57x+RQWz2OZm0e/lM0flUoyfAkyCvE4upt2cIBu2GQCgSv/k
         1XQyNYroMN4DD8gCRF4ZOTEgnh/gLYI+YD8yUMxpyJEyob3qYCntOuCsZOaRBAP3OHJA
         y5E5gXV/6+A8yae39g1S5hqk5jUDvqvw1cHI59lN/yQb7bd9IldpUm0sr8uIT5Fj1NLm
         Pjb+L3sVD948fy2mcRWWfwH1GG0bvVkVnL3yOp2WAgM/qerp8E3ZBAI1+pDGnbhzPVg/
         gNtriDDf9XPN3aW6RpQulvMORdw6SAaTaXG69/MfZ4nWaR5MbCWPeYIXmELMUlzhD8Ww
         IMfA==
X-Forwarded-Encrypted: i=1; AJvYcCXK+03NiLS5s9MQIQPjxV9WwTqtjL58GEgNN+u31rVCp3/ATYZtxfoUEdgLUP0bKCKqT/3IWUTyzDP12k8vVcOTjPHrNuzZ5kcLwFgheXB6
X-Gm-Message-State: AOJu0Yw+a94U9thab0/SzRGHGHYPRIWI+pez7Lo+vpY8x00Y9AzGK1wA
	EFfYN6KcVIQsXJSyKIYywXJB89j9CT5z134Vxr8JqL1v0i6w5Nf1FooJLXiQJtt5Oadn8PdABOv
	+Wi1LsZmnTOHjQllOadRmy33+nTpKOL2aMFnv4A==
X-Google-Smtp-Source: AGHT+IHnlYZIrzETi2EIUQnIUgGB/dlXo2kNVp670NMBce33T+SBs7BmQBJFtm2TtzjBJawWTYMXFy4GA+BqRUY63Bg=
X-Received: by 2002:a05:6e02:1d1a:b0:375:e731:b65a with SMTP id
 e9e14a558f8ab-39a1a7cdca4mr4394765ab.11.1721789043890; Tue, 23 Jul 2024
 19:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718388908.git.tjeznach@rivosinc.com> <bdd1e0547e01d012bf40c5e33b752e77c6663c90.1718388909.git.tjeznach@rivosinc.com>
 <CANXhq0rpX=+YZLfzLcBmHPUxBpo+xWPY9XaNkV0eQAX72KCFKw@mail.gmail.com> <20240723130839.GL14050@ziepe.ca>
In-Reply-To: <20240723130839.GL14050@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 24 Jul 2024 10:43:53 +0800
Message-ID: <CANXhq0ptWEk7xQmepRVih8JQvKuZWvxBtwzyUtPhoy6HqP0vGA@mail.gmail.com>
Subject: Re: [PATCH v8 7/7] iommu/riscv: Paging domain support
To: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_194406_021437_4E90CDD4 
X-CRM114-Status: GOOD (  20.66  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgOTowOOKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVsIDE5LCAyMDI0IGF0IDAyOjMzOjEzUE0gKzA4
MDAsIFpvbmcgTGkgd3JvdGU6Cj4KPiA+ID4gK3N0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2ZyZWVf
cGFnaW5nX2RvbWFpbihzdHJ1Y3QgaW9tbXVfZG9tYWluICppb21tdV9kb21haW4pCj4gPiA+ICt7
Cj4gPiA+ICsgICAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RvbWFpbiAqZG9tYWluID0gaW9tbXVf
ZG9tYWluX3RvX3Jpc2N2KGlvbW11X2RvbWFpbik7Cj4gPiA+ICsgICAgICAgY29uc3QgdW5zaWdu
ZWQgbG9uZyBwZm4gPSB2aXJ0X3RvX3Bmbihkb21haW4tPnBnZF9yb290KTsKPiA+ID4gKwo+ID4g
PiArICAgICAgIFdBUk5fT04oIWxpc3RfZW1wdHkoJmRvbWFpbi0+Ym9uZHMpKTsKPiA+Cj4gPiBI
aSBUb21hc3osCj4gPiBJIHJlY2VudGx5IGhpdCB0aGUgaXNzdWUgaGVyZSB3aGVuIEkgcmVtb3Zl
ZCBhIGRldmljZS4gSSB0aGluayB3ZSBuZWVkCj4gPiB0byB1bmxpbmsgdGhlIGRldmljZSdzIGJv
bmQgaW4gZG9tYWluIGJlZm9yZSByZWxlYXNpbmcgZG9tYWluLgo+ID4gRG8geW91IG1pbmQgcGlj
ayB0aGUgZm9sbG93aW5nIG1vZGlmaWNhdGlvbiBpbiB0aGlzIHBhdGNoPyBUaGFua3MuCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUuYwo+ID4gaW5kZXggODU5Y2RkNDU1NTc2Li5mMDcwNzE0N2U3MDYgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiA+ICsrKyBiL2RyaXZl
cnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4gQEAgLTE1NDEsNiArMTU0MSw4IEBAIHN0YXRpYyB2
b2lkIHJpc2N2X2lvbW11X3JlbGVhc2VfZGV2aWNlKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICB7
Cj4gPiAgICAgICAgIHN0cnVjdCByaXNjdl9pb21tdV9pbmZvICppbmZvID0gZGV2X2lvbW11X3By
aXZfZ2V0KGRldik7Cj4gPgo+ID4gKyAgICAgICByaXNjdl9pb21tdV9ib25kX3VubGluayhpbmZv
LT5kb21haW4sIGRldik7Cj4gPiArCj4gPiAgICAgICAgIHN5bmNocm9uaXplX3JjdSgpOwo+ID4g
ICAgICAgICBrZnJlZShpbmZvKTsKPiA+ICB9Cj4KPiBUaGF0IGRvZXMgbm90IHNlZW0gdGhlIHJp
Z2h0IHBsYWNlIHRvIHB1dCB0aGF0LCBvciBzb21ldGhpbmcgZWxzZSBoYXMKPiBnb25lIHdyb25n
IGJlY3Vhc2U6Cj4KPiA+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzIHJpc2N2X2lv
bW11X29wcyA9IHsKPiA+ID4gKyAgICAgICAucGdzaXplX2JpdG1hcCA9IFNaXzRLLAo+ID4gPiAg
ICAgICAgIC5vZl94bGF0ZSA9IHJpc2N2X2lvbW11X29mX3hsYXRlLAo+ID4gPiAgICAgICAgIC5p
ZGVudGl0eV9kb21haW4gPSAmcmlzY3ZfaW9tbXVfaWRlbnRpdHlfZG9tYWluLAo+ID4gPiAgICAg
ICAgIC5ibG9ja2VkX2RvbWFpbiA9ICZyaXNjdl9pb21tdV9ibG9ja2luZ19kb21haW4sCj4gPiA+
ICAgICAgICAgLnJlbGVhc2VfZG9tYWluID0gJnJpc2N2X2lvbW11X2Jsb2NraW5nX2RvbWFpbiwK
Pgo+IFRoZSBhYm92ZSB1c2Ugb2YgcmVsZWFzZV9kb21haW4gd2lsbCBhdHRhY2ggdG8gdGhlIGJs
b2NraW5nIGRvbWFpbgo+IHByaW9yIHRvIGNhbGxpbmcgcmVsZWFzZV9kZXZpY2UgYW5kIHdoZW4g
ZG9pbmcgc28gZXZlcnl0aGluZyBhYm91dCBhbnkKPiBwcmV2aW91cyBkb21haW4gc2hvdWxkIGhh
dmUgYmVlbiBmdWxseSBjbGVhbmVkIHVwLgo+Cj4gU28gaW5mby0+ZG9tYWluIHNob3VsZCBiZSB0
aGUgYmxvY2tpbmcgZG9tYWluIGR1cmluZyByZWxlYXNlX2RldmljZQo+IChpZiBub3QgdGhhdCBp
cyBhbm90aGVyIGJ1ZykKPgo+IEFuZCBhdHRhY2hpbmcgdGhlIGJsb2NraW5nIGRvbWFpbiBzaG91
bGQgaGF2ZSBjbGVhcmVkIHRoZQo+IGRvbWFpbi0+Ym9uZHMgb2YgYW55IHByaW9yIHBhZ2luZyBk
b21haW4uCgpZZXMsIHlvdSBhcmUgcmlnaHQsIHRoZXJlIGlzIG5vIGlzc3VlLiBJIG1peGVkIHVw
IG15IGNvZGViYXNlLCB3aGljaApkb2Vzbid0IHN1cHBvcnQgcmVsZWFzZV9kb21haW4geWV0LiBQ
bGVhc2UgaWdub3JlIHRoaXMsIGFuZCB0aGFua3MgZm9yCnBvaW50aW5nIGl0IG91dC4KCj4KPiBK
YXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
