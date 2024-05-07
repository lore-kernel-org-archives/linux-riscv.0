Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E17BC25B4F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MvXQ+bDKYeTqX58JLF4yHOOqAahRdH3zLLDycCs7qw=; b=UEnEzAbZPSfrCc
	IoS7InM3DqmB0rc7eumml4xT3Rh3TKOKba0KWA5G9e7X4QXGRJ0l/CB9vSSY/RrhkmJdZo1OOGEXS
	Ok8ULywUvKxyKln0QCbH2heFUILvNq7TAE26nQjU5I5y4SXHd6a9v5tDxL+x3buFK9rwX+8adrDDR
	RrDEYeIb9P+ntJMdxvtRiI19+V1MNLtkBx6RoEXRgIUV0lAr++Tn2PGT3v3qyvKa+3p5YYzAlK/Wc
	W7XpPhZGnJXr9WpXKcNPFRSxOrJY0enWnkQT9gsI14b6aHr3OG1p7XEwOSmUkyc5VUt3EaIAXU6Ix
	SS2rMQK5y0xNyu1XQ5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4N7L-0000000BoR4-1Ilq;
	Tue, 07 May 2024 15:52:35 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4N7I-0000000BoOP-1H4X
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 15:52:34 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7e1835a9339so20558139f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 08:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715097146; x=1715701946; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdwrYxvKykWEvU1ciSRbQbFvSgqU+2A+2xiS1iPvfJQ=;
        b=k7L5f60dO0ejslo1KGqtJIjIW38T/qhF6s+H5DLkZ8zk9NVfRS5SpHhRj9yQSl0+Ff
         BDOzRIv1BoOO/EdBMXw5cAPq+B+B5Cb/AAhfIB+vpDZBDlWBMaFMR/pNvKTmL9OEsE+1
         yfBkbKWPxyLPgqdK28aSLt304VXH4rCMlD5wGAREPI4QCXsDAmoBGGId7eM4qwk1/l0Z
         5mmQw4nAkWg4PvFt5B+8SxE497dCSYbmQgxafUNhRrjXBG5px1uAmcsRFOJzYRp0wfSU
         3XqP/Ksh5XjUIY6TXlabh3SSesm9jQoRbfr8BdsvXyOgLUaIbZFAw6eWZHQE3bip87De
         obGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715097146; x=1715701946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdwrYxvKykWEvU1ciSRbQbFvSgqU+2A+2xiS1iPvfJQ=;
        b=R5e3vUaBFdN60WboLK2/ri/48qfDO/+lOYYkgGXP9n5uqgftXtEUF+/U3HazqcSL7g
         zZpvTzco5fNEpI+O8hX7ec3n2zsOWHaTNGUKkw4Gsd0+Ya0QYvcBMQyCI9JtMIBU3pLI
         3HKrkDYe9HB3KloWu6WSw4jV+VWHbYupDb/16iUGuqoqRngDz8sUIOrSRW55XERPuDHp
         qppQ8rhBnuKESWrBGK2LauDvXVhVhE++FwLixXTEVNoPoKpVWzavjUj2FpQW9zZJIY0R
         u2E0R14vIwEsJyhvTyXgQFvS7Hb8XtoNu/HcIicyuw218y4C32oCN4pKXdhjpHmZ9y5n
         E1ew==
X-Forwarded-Encrypted: i=1; AJvYcCXILQF+ojXbJzS/L5se8uFUJMCrSD1FJUa5IVtZGAjX7H7N0AEvwE2IM64AwNz6CLfTaK3yhERHrp3Zg0BPCtpWO12yS5r7WOKVMghpNgXG
X-Gm-Message-State: AOJu0YzNUAXVZqEcosEQYGcvgejPlopAKOnCmvxzMOAQinFa9ypDXEmq
	+eTonJxnVqmZE6bA+3QNR0wMJnpwlrRfdjY4KYx6K/KcIf2PZbjGTWuR2yNzq7r9ZxOkADJXSgi
	MqEn8PxwjrOBGS3JDGMHs7uPJ2O9WWmIrUiUP5A==
X-Google-Smtp-Source: AGHT+IGgeNVgdFJDVuDgv9ivECfpykkOYp4g95K8N5g+DPVmrNpWUToncN7f6H6A1ruTyO44ONnmAEe/3TdfEor5yQg=
X-Received: by 2002:a5e:db42:0:b0:7de:c47d:a740 with SMTP id
 ca18e2360f4ac-7e18f722d8amr13408539f.8.1715097146605; Tue, 07 May 2024
 08:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240507142600.23844-1-zong.li@sifive.com> <20240507142600.23844-4-zong.li@sifive.com>
 <20240507151516.GK901876@ziepe.ca>
In-Reply-To: <20240507151516.GK901876@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 7 May 2024 23:52:15 +0800
Message-ID: <CANXhq0qLbC2RgW04C5DcuzR-kSmT3hA9rWW=w3e3PKHr+QsyzQ@mail.gmail.com>
Subject: Re: [PATCH RFC RESEND 3/6] iommu/riscv: support GSCID
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kevin.tian@intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_085232_543429_992A72A7 
X-CRM114-Status: GOOD (  25.00  )
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

T24gVHVlLCBNYXkgNywgMjAyNCBhdCAxMToxNeKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDA3LCAyMDI0IGF0IDEwOjI1OjU3UE0gKzA4
MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPiBAQCAtOTE5LDI5ICs5MjQsNDMgQEAgc3RhdGljIHZvaWQg
cmlzY3ZfaW9tbXVfaW90bGJfaW52YWwoc3RydWN0IHJpc2N2X2lvbW11X2RvbWFpbiAqZG9tYWlu
LAo+ID4gICAgICAgcmN1X3JlYWRfbG9jaygpOwo+ID4KPiA+ICAgICAgIHByZXYgPSBOVUxMOwo+
ID4gLSAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UoYm9uZCwgJmRvbWFpbi0+Ym9uZHMsIGxp
c3QpIHsKPiA+IC0gICAgICAgICAgICAgaW9tbXUgPSBkZXZfdG9faW9tbXUoYm9uZC0+ZGV2KTsK
PiA+Cj4gPiAtICAgICAgICAgICAgIC8qCj4gPiAtICAgICAgICAgICAgICAqIElPVExCIGludmFs
aWRhdGlvbiByZXF1ZXN0IGNhbiBiZSBzYWZlbHkgb21pdHRlZCBpZiBhbHJlYWR5IHNlbnQKPiA+
IC0gICAgICAgICAgICAgICogdG8gdGhlIElPTU1VIGZvciB0aGUgc2FtZSBQU0NJRCwgYW5kIHdp
dGggZG9tYWluLT5ib25kcyBsaXN0Cj4gPiAtICAgICAgICAgICAgICAqIGFycmFuZ2VkIGJhc2Vk
IG9uIHRoZSBkZXZpY2UncyBJT01NVSwgaXQncyBzdWZmaWNpZW50IHRvIGNoZWNrCj4gPiAtICAg
ICAgICAgICAgICAqIGxhc3QgZGV2aWNlIHRoZSBpbnZhbGlkYXRpb24gd2FzIHNlbnQgdG8uCj4g
PiAtICAgICAgICAgICAgICAqLwo+ID4gLSAgICAgICAgICAgICBpZiAoaW9tbXUgPT0gcHJldikK
PiA+IC0gICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+IC0KPiA+IC0gICAgICAgICAg
ICAgcmlzY3ZfaW9tbXVfY21kX2ludmFsX3ZtYSgmY21kKTsKPiA+IC0gICAgICAgICAgICAgcmlz
Y3ZfaW9tbXVfY21kX2ludmFsX3NldF9wc2NpZCgmY21kLCBkb21haW4tPnBzY2lkKTsKPiA+IC0g
ICAgICAgICAgICAgaWYgKGxlbiAmJiBsZW4gPj0gUklTQ1ZfSU9NTVVfSU9UTEJfSU5WQUxfTElN
SVQpIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICBmb3IgKGlvdmEgPSBzdGFydDsgaW92YSA8
IGVuZDsgaW92YSArPSBQQUdFX1NJWkUpIHsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJpc2N2X2lvbW11X2NtZF9pbnZhbF9zZXRfYWRkcigmY21kLCBpb3ZhKTsKPiA+ICsgICAg
IC8qCj4gPiArICAgICAgKiBIb3N0IGRvbWFpbiBuZWVkcyB0byBmbHVzaCBlbnRyaWVzIGluIHN0
YWdlLTIgZm9yIE1TSSBtYXBwaW5nLgo+ID4gKyAgICAgICogSG93ZXZlciwgZGV2aWNlIGlzIGJv
dW5kIHRvIHMxIGRvbWFpbiBpbnN0ZWFkIG9mIHMyIGRvbWFpbi4KPiA+ICsgICAgICAqIFdlIG5l
ZWQgdG8gZmx1c2ggbWFwcGluZyB3aXRob3V0IGxvb3BpbmcgZGV2aWNlcyBvZiBzMiBkb21haW4K
PiA+ICsgICAgICAqLwo+ID4gKyAgICAgaWYgKGRvbWFpbi0+Z3NjaWQpIHsKPiA+ICsgICAgICAg
ICAgICAgcmlzY3ZfaW9tbXVfY21kX2ludmFsX2d2bWEoJmNtZCk7Cj4gPiArICAgICAgICAgICAg
IHJpc2N2X2lvbW11X2NtZF9pbnZhbF9zZXRfZ3NjaWQoJmNtZCwgZG9tYWluLT5nc2NpZCk7Cj4g
PiArICAgICAgICAgICAgIHJpc2N2X2lvbW11X2NtZF9zZW5kKGlvbW11LCAmY21kLCAwKTsKPiA+
ICsgICAgICAgICAgICAgcmlzY3ZfaW9tbXVfY21kX2lvZmVuY2UoJmNtZCk7Cj4gPiArICAgICAg
ICAgICAgIHJpc2N2X2lvbW11X2NtZF9zZW5kKGlvbW11LCAmY21kLCBSSVNDVl9JT01NVV9RVUVV
RV9USU1FT1VUKTsKPgo+IElzIGlvbW11IG51bGwgaGVyZT8gV2hlcmUgZGlkIGl0IGNvbWUgZnJv
bT8KPgo+IFRoaXMgbG9va3Mgd3JvbmcgdG9vLiBUaGUgImJvbmRzIiBsaXN0IGlzIHNvcnQgb2Yg
bWlzbmFtZWQsIGl0IGlzCj4gcmVhbGx5IGEgbGlzdCBvZiBpbnZhbGlkYXRpb24gaW5zdHJ1Y3Rp
b25zLiBJZiB5b3UgbmVlZCBhIHNwZWNpYWwKPiBpbnZhbGlkYXRpb24gaW5zdHJ1Y3Rpb24gZm9y
IHRoaXMgY2FzZSB0aGVuIHlvdSBzaG91bGQgYWxsb2NhdGUgYQo+IG1lbW9yeSBhbmQgYWRkIGl0
IHRvIHRoZSBib25kIGxpc3Qgd2hlbiB0aGUgYXR0YWNoIGlzIGRvbmUuCj4KPiBJbnZhbGlkYXRp
b24gc2hvdWxkIHNpbXBseSBpdGVyYXRlIG92ZXIgdGhlIGJvbmQgbGlzdCBhbmQgZG8gdGhlCj4g
aW5zdHJ1Y3Rpb25zIGl0IGNvbnRhaW5zLCBhbHdheXMuCgpJIG1lc3NlZCB1cCB0aGlzIHBpZWNl
IG9mIGNvZGUgd2hpbGUgY2xlYW5pbmcgaXQuIEkgd2lsbCBmaXggaXQgaW4gdGhlCm5leHQgdmVy
c2lvbi4gSG93ZXZlciwgYWZ0ZXIgeW91ciB0aXBzLCBpdCBzZWVtcyB0byBtZSB0aGF0IHdlIHNo
b3VsZAphbGxvY2F0ZSBhIG5ldyBib25kIGVudHJ5IGluIHRoZSBzMiBkb21haW4ncyBsaXN0LiBU
aGlzIGlzIGJlY2F1c2UgdGhlCm9yaWdpbmFsIGJvbmQgZW50cnkgYmVjb21lcyBkZXRhY2hlZCBm
cm9tIHRoZSBzMiBkb21haW4gYW5kIGlzCmF0dGFjaGVkIHRvIHRoZSBzMSBkb21haW4gd2hlbiB0
aGUgZGV2aWNlIHBhc3NlcyB0aHJvdWdoIHRvIHRoZSBndWVzdCwKaWYgd2UgZG9uJ3QgY3JlYXRl
IGEgbmV3IGJvbmQgaW4gczIgZG9tYWluLCB0aGVuIHRoZSBsaXN0IGluIHMyIGRvbWFpbgp3b3Vs
ZCBsb3NlIGl0LiBMZXQgbWUgbW9kaWZ5IHRoZSBpbXBsZW1lbnRhdGlvbiBoZXJlLiBUaGFua3Mu
Cgo+Cj4gPiAgc3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfaW9kaXJfdXBkYXRlKHN0cnVjdCByaXNj
dl9pb21tdV9kZXZpY2UgKmlvbW11LAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYsIHU2NCBmc2MsIHU2NCB0YSkKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2LCB1NjQgZnNjLCB1NjQg
dGEsIHU2NCBpb2hnYXRwKQo+Cj4gSSB0aGluayB5b3Ugc2hvdWxkIG1ha2UgYSBzdHJ1Y3QgdG8g
cmVwcmVzZW50IHRoZSBkYyBlbnRyeS4KPgo+IEphc29uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
