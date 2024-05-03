Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39736C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 19:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGnCK1qPlpAdusDA+wAHyrYt39D734CEyYFECE068zI=; b=ldw1jHchKe25Y/
	7j0/6OtkoMsvlcCAzvthSWyxnRj8MNV/t53k2HZDvnw6nReZIVWsyWhQz4grkRg6shskV4SUXlkPz
	AuoatOrHLtkyG9o7juxA1Oj4azeueVrqfPwcaEwI9FiTdCM8ZrdTimz555SZfokGxvA7U9X3rOTfq
	WJAPi9N/kkhvjBmRtViWlkExIgZP3DLFMqxJ6zHtvoauB1JDy9PY6/zYxQXUyN2KsLBKgmRZSZ+k+
	YucRQ3d30e0q6IOh42/OFipQyr0vWBD5yNPnreidPUy5tukza5ux03Y3sh10lZBDX8SOOCcTkIm6c
	s2yX2qVPidYqadwxI3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ypV-00000000DRq-2ala;
	Fri, 03 May 2024 19:44:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ypS-00000000DRM-1ZQ5
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 19:44:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so232025ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 12:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714765461; x=1715370261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGjDpzqhZQyAQMKyqH+Z7WQdcPMW4kVzNIgeNLfdaAY=;
        b=zFLYHY+rlHW7LMf4MP3bMO5pIDE2/BNXrguKqaCXr7LiO+5cIL3bIYhLHfdC6aVjzr
         bxgiq2oKWSBI3KvyDmcbj/T+BXaqWbwgB5PbvaDKz6sU8+AYOcF6xwt+F2lT++jITv2o
         CpFOLMmdqemUuYbEh58OZoPY7fTqwzytX5pZnxp8Bdcm7cHHjhctsDLiyP//NL84A6OO
         2pvawNOxq5ULV5uBH1iFVjw4Sf4APlNxQyD+XmJe6+rcDQd5e7JUEu0jq6qQV+RiYq7t
         IS4QCNhlBQ2r6MI3W826L3+X9K/97BGbk9Qwk2BeA26uS1wJfLPjO7K2kUQh2fX2T/ZS
         ZYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714765461; x=1715370261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGjDpzqhZQyAQMKyqH+Z7WQdcPMW4kVzNIgeNLfdaAY=;
        b=I0byclYSqGHIncyWwEF2knLcGgC5MhASFt9YHIyTUcf8DdHmr228WiQAwgBpxQL4+i
         jgEepVAnB4whHEIRGZiwOzJ4L4ETCJePowHCncIx/8uv+Sjw4oO/iK65HpN68/pRMQmw
         t8pfb/4UVxUCLytkyDvTwOV8Rw/txz7suOSK71GXAq9uwA3GIpnTeSpZo/o//A+WOgas
         ZASxVmHQrdHVBtt+Y8JYsrW82V/a1Y1pJUJa/TAVUIPjxVC/ctSSO30/74o01VH2wpfg
         tPMntmzCfKndoJark1dpv0q29NLlN5wEvN0itTk51RAUOrHFF50NLFfURU41A6sqbjNV
         dGdw==
X-Forwarded-Encrypted: i=1; AJvYcCVt78o6cGK1N9ynN63LZq4Q8aEjoUp6efk3lk2y0ra6RhTkWjBX9mS/ZwI0y4yST4Z1HejndNOARMIuXqan26OZRh17JbZPOmvr2d8h7MfZ
X-Gm-Message-State: AOJu0Yw4QcQT8fuLGmXPlJRuN3x2gylwJ2MJIFM5zRwNcTFHyjlE0+gn
	zenOvlPZEvfFkqmbO6AFOhbQGK+DWAeBh6Ed7W0iGOfXt9t79luLXLCfY7ZAn/xCUoEyHdFOQC3
	xMdSKHj2qyepNyiVVB2dsorYiWUCPqBHCEYVNMA==
X-Google-Smtp-Source: AGHT+IHresXDj8zjJo2L5u68znPjhx0ovrbhxu+59NRfgJ//aE/UKF6ubHAqLADqE7qY9hVfIpPoveM7rHNL5OQZ3Ao=
X-Received: by 2002:a17:90b:354e:b0:2b4:33ee:25a1 with SMTP id
 lt14-20020a17090b354e00b002b433ee25a1mr3442632pjb.26.1714765460928; Fri, 03
 May 2024 12:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714494653.git.tjeznach@rivosinc.com> <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
 <20240501145621.GD1723318@ziepe.ca> <CAH2o1u63GjMnYrfa8W-c1hdp+TAA0R-FyxXM4dEiFF+KEGWwbA@mail.gmail.com>
 <20240503181059.GC901876@ziepe.ca>
In-Reply-To: <20240503181059.GC901876@ziepe.ca>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Fri, 3 May 2024 12:44:09 -0700
Message-ID: <CAH2o1u7av8zMucB2sKxBOZtd1eqEC4Qmgin=8VQ03pWbQdZUUg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] iommu/riscv: Paging domain support
To: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_124422_547923_8116EEA4 
X-CRM114-Status: GOOD (  45.44  )
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

T24gRnJpLCBNYXkgMywgMjAyNCBhdCAxMToxMeKAr0FNIEphc29uIEd1bnRob3JwZSA8amdnQHpp
ZXBlLmNhPiB3cm90ZToKPgo+IE9uIEZyaSwgTWF5IDAzLCAyMDI0IGF0IDEwOjQ0OjE0QU0gLTA3
MDAsIFRvbWFzeiBKZXpuYWNoIHdyb3RlOgo+ID4gPiA+ICsgICAgIGxpc3RfZm9yX2VhY2hfZW50
cnlfcmN1KGJvbmQsICZkb21haW4tPmJvbmRzLCBsaXN0KSB7Cj4gPiA+ID4gKyAgICAgICAgICAg
ICBpZiAoYm9uZC0+ZGV2ID09IGRldikgewo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBs
aXN0X2RlbF9yY3UoJmJvbmQtPmxpc3QpOwo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBm
b3VuZCA9IGJvbmQ7Cj4gPiA+ID4gKyAgICAgICAgICAgICB9Cj4gPiA+ID4gKyAgICAgfQo+ID4g
PiA+ICsgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRvbWFpbi0+bG9jaywgZmxhZ3MpOwo+
ID4gPiA+ICsKPiA+ID4gPiArICAgICAvKiBSZWxlYXNlIGFuZCB3YWl0IGZvciBhbGwgcmVhZC1y
Y3UgY3JpdGljYWwgc2VjdGlvbnMgaGF2ZSBjb21wbGV0ZWQuICovCj4gPiA+ID4gKyAgICAga2Zy
ZWVfcmN1KGZvdW5kLCByY3UpOwo+ID4gPiA+ICsgICAgIHN5bmNocm9uaXplX3JjdSgpOwo+ID4g
Pgo+ID4gPiBQbGVhc2Ugbm8sIHN5bmNocm9uaXplX3JjdSgpIG9uIGEgcGF0aCBsaWtlIHRoaXMg
aXMgbm90IHNvCj4gPiA+IHJlYXNvbmFibGUuLiBBbHNvIHlvdSBkb24ndCBuZWVkIGtmcmVlX3Jj
dSgpIGlmIHlvdSB3cml0ZSBpdCBsaWtlIHRoaXMuCj4gPiA+Cj4gPiA+IFRoaXMgc3RpbGwgbG9v
a3MgYmV0dGVyIHRvIGRvIHdoYXQgSSBzYWlkIGJlZm9yZSwgcHV0IHRoZSBpb21tdSBub3QKPiA+
ID4gdGhlIGRldiBpbiB0aGUgYm9uZCBzdHJ1Y3QuCj4gPiA+Cj4gPiA+Cj4gPgo+ID4gSSB3YXMg
dHJ5aW5nIG5vdCB0byBkdXBsaWNhdGUgZGF0YSBpbiBib25kIHN0cnVjdCBhbmQgdXNlIHdoYXRl
dmVyIGlzCj4gPiBhdmFpbGFibGUgdG8gYmUgcmVmZXJlbmNlZCBmcm9tIGRldiBwb2ludGVyIChl
ZyBpb21tdSAvIGlkcyAvIHByaXZhdGUKPiA+IGlvbW11IGRldiBkYXRhKS4KPgo+IEknbSBub3Qg
c3VyZSB0aGF0IGlzIGEgdmFsdWFibGUgZ29hbCBjb25zaWRlcmluZyB0aGUgUkNVCj4gY29tcGxl
eGl0eS4uIEJ1dCBJIHN1cHBvc2UgaXQgd291bGQgYmUgYSBiaXQgb2YgYSBoYXNzbGUgdG8gcmVw
bGljYXRlCj4gdGhlIGlkcyBsaXN0IGludG8gYm9uZCBzdHJ1Y3R1cnMuIE1heWJlIHNvbWV0aGlu
ZyB0byBkbyB3aGVuIHlvdSBnZXQKPiB0byBBVFMgc2luY2UgeW91J2xsIHByb2JhYmx5IHdhbnQg
dG8gcmVwbGljYXRlIHRoZSBBVFMgUklEcy4gKHNlZSB3aGF0Cj4gSW50ZWwgZGlkLCB3aGljaCBJ
IHRoaW5rIGlzIHByZXR0eSBnb29kKQo+Cj4gPiBJZiBJJ20gcmVhZGluZyBjb3JlIGlvbW11IGNv
ZGUgY29ycmVjdGx5LCBkZXZpY2UgcG9pbnRlciBhbmQgaW9tbXUKPiA+IHBvaW50ZXJzIHNob3Vs
ZCBiZSB2YWxpZCBiZXR3ZWVuIF9wcm9iZV9kZXZpY2UgYW5kIF9yZWxlYXNlX2RldmljZQo+ID4g
Y2FsbHMuIEkndmUgbW92ZWQgc3luY2hyb25pemVfcmN1IG91dCBvZiB0aGUgZG9tYWluIGF0dGFj
aCBwYXRoIHRvCj4gPiBfcmVsZWFzZV9kZXZpY2UsIExNSyBpZiB0aGF0IHdvdWxkIGJlIG9rIGZv
ciBub3cuICBJJ2xsIGhhdmUgYQo+ID4gc2Vjb25kIGFub3RoZXIgdG8gcmV3b3JrIG90aGVyIHBh
dGNoZXMgdG8gYXZvaWQgc3RvcmluZyBkZXYgcG9pbnRlcnMKPiA+IGF0IGFsbC4KPgo+IFllcywg
dGhhdCBzZWVtcyBiZXR0ZXIuLiBJJ20gaGFwcGllciB0byBzZWUgZGV2aWNlIGhvdC11bnBsdWcg
YmUgc2xvdwo+IHRoYW4gdW4gYXR0YWNoCj4KPiBUaGVyZSBpcyBhbm90aGVyIGlzc3VlIHdpdGgg
dGhlIFJDVSB0aGF0IEkgaGF2ZW4ndCB3cmFwcGVkIG15IGhlYWQKPiBhcm91bmQuLgo+Cj4gVGVj
aG5pY2FsbHkgd2UgY2FuIGhhdmUgY29uY3VycmVudCBtYXAvdW5tYXAvaW52YWxpZGF0aW9uIGFs
b25nIHNpZGUKPiBkZXZpY2UgYXR0YWNoL2RldGFjaC4gRG9lcyB0aGUgaW52YWxpZGF0aW9uIHVu
ZGVyIFJDVSB3b3JrIGNvcnJlY3RseT8KPgo+IEZvciBkZXRhY2ggSSB0aGluayB5ZXM6Cj4KPiAg
ICBJbnYgQ1BVICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEZXRhY2ggQ1BVCj4K
PiAgIHdyaXRlIGlvX3B0ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBVcGRhdGUgZGV2
aWNlIGRlc2NyaXB0b3IKPiAgIHJjdV9yZWFkX2xvY2sKPiAgICAgbGlzdF9mb3JfZWFjaAo+ICAg
ICAgIDxtYWtlIGludmFsaWRhdGlvbiBjb21tYW5kPiAgICAgICAgICAgIDxtYWtlIGRlc2NyaXB0
aW9uIGludiBjbWQ+Cj4gICAgICAgZG1hX3dtYigpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZG1hX3dtYigpCj4gICAgICAgPGRvb3JiZWxsPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPGNtZCBkb29yYmVsbD4KPiAgIHJjdV9yZWFkX3VubG9jawo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3RfZGVsX3JjdSgpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHdpcGUgQVNJRD4KPgo+IEluIHRoaXMg
Y2FzZSBJIHRoaW5rIHdlIG5ldmVyIG1pc3MgYW4gaW52YWxpZGF0aW9uLCB0aGUgbGlzdF9kZWwg
aXMKPiBhbHdheXMgYWZ0ZXIgdGhlIEhXIGhhcyBiZWVuIGZ1bGx5IGZlbmNlZCwgc28gSSBkb24n
dCB0aGluayB3ZSBjYW4KPiBoYXZlIGFueSBpc3N1ZS4gTWF5YmUgYSBzdXByaW91cyBpbnZhbGlk
YXRpb24gaWYgdGhlIEFTSUQgZ2V0cwo+IHJlLXVzZWQsIGJ1dCB3aG8gY2FyZXMuCj4KPiBBdHRh
Y2ggaXMgZGlmZmVyZW50Li4KPgo+ICAgIEludiBDUFUgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEF0dGFjaCBDUFUKPgo+ICAgd3JpdGUgaW9fcHRlCj4gICByY3VfcmVhZF9sb2Nr
Cj4gICAgIGxpc3RfZm9yX2VhY2ggLy8gZW1wdHkKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBsaXN0X2FkZF9yY3UoKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFVwZGF0ZSBkZXZpY2UgZGVzY3JpcHRvcgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxtYWtlIGRlc2NyaXB0aW9u
IGludiBjbWQ+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ZG1hX3dtYigpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PGNtZCBkb29yYmVsbD4KPiAgIHJjdV9yZWFkX3VubG9jawo+Cj4gQXMgYWJvdmUgc2hvd3Mgd2Ug
Y2FuICJtaXNzIiBhbiBpbnZhbGlkYXRpb24uIFRoZSBpc3N1ZSBpcyBuYXJyb3csIHRoZQo+IGlv
X3B0ZSBjb3VsZCBzdGlsbCBiZSBzaXR0aW5nIGluIHdyaXRlIGJ1ZmZlcnMgaW4gIkludiBDUFUi
IGFuZCBub3QKPiB5ZXQgZ2xvYmFsbHkgdmlzaWFibGUuICJBdHRhY2ggQ1BVIiBjb3VsZCBnZXQg
dGhlIGRldmljZSBkZXNjcmlwdG9yCj4gaW5zdGFsbGVkIGluIHRoZSBJT01NVSBhbmQgdGhlIElP
TU1VIGNvdWxkIHdhbGsgYW4gaW9fcHRlIHRoYXQgaXMgaW4KPiB0aGUgb2xkIHN0YXRlLiBFZmZl
Y3RpdmVseSB0aGlzIGlzIGJlY2F1c2UgdGhlcmUgaXMgbm8gcmVsZWFzZS9hY3F1aXJlCj4gYmFy
cmllciBwYXNzaW5nIHRoZSBpb19wdGUgc3RvcmUgZnJvbSB0aGUgSW52IENQVSB0byB0aGUgQXR0
YWNoIENQVSB0byB0aGUKPiBJT01NVS4KPgo+IEl0IHNlZW1zIGxpa2UgaXQgc2hvdWxkIGJlIHNv
bHZhYmxlIHNvbWVob3c6Cj4gIDEpIEludiBDUFUgcmVsZWFzZXMgYWxsIHRoZSBpbyBwdGVzCj4g
IDIpIEF0dGFjaCBDUFUgYWNxdWlyZXMgdGhlIGlvIHB0ZXMgYmVmb3JlIHVwZGF0aW5nIHRoZSBE
RFQKPiAgMykgSW52IENQVSBhY3F1aXJlcyB0aGUgUkNVIGxpc3QgaW4gc3VjaCBhIHdheSB0aGF0
IGVpdGhlciBhdHRhY2gKPiAgICAgQ1BVIHdpbGwgYWNxdWlyZSB0aGUgaW9fcHRlIG9yIGludiBD
UFUgd2lsbCBhY3F1aXJlIHRoZSBSQ1UgbGlzdC4KPiAgNCkgRWl0aGVyIGludmFsaWRhdGlvbiB3
b3JrcyBvciB3ZSByZWxlYXNlIHRoZSBuZXcgaW9wdGUgdG8gdGhlIFNNTVUKPiAgICAgYW5kIGRv
bid0IG5lZWQgaXQuCj4KPiBCdXQgIzMgaXMgYSByZWFsbHkgd2VpcmQgc3RhdGVtZW50LiBzbWJf
bWIoKSBvbiBib3RoIHNpZGVzIG1heSBkbyB0aGUKPiBqb2I/Pwo+CgpBY3R1YWwgYXR0YWNoIHNl
cXVlbmNlIGlzIHNsaWdodGx5IGRpZmZlcmVudC4KCiBJbnYgQ1BVICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEF0dGFjaCBDUFUKCiB3cml0ZSBpb19wdGUKICByY3VfcmVhZF9sb2NrCiAgICBs
aXN0X2Zvcl9lYWNoIC8vIGVtcHR5CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpc3RfYWRkX3JjdSgpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPVExC
LklOVkFMKFBTQ0lEKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bWFrZSBk
ZXNjcmlwdGlvbiBpbnYgY21kPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
bWFfd21iKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGNtZCBkb29yYmVs
bD4KIHJjdV9yZWFkX3VubG9jawoKSSd2ZSB0cmllZCB0byBjb3ZlciB0aGlzIGNhc2Ugd2l0aCBy
aXNjdl9pb21tdV9pb3RsYl9pbnZhbCgpIGNhbGxlZApiZWZvcmUgdGhlIGF0dGFjaGVkIGRvbWFp
biBpcyB2aXNpYmxlIHRvIHRoZSBkZXZpY2UuIFRoaXMgaXMgc29tZXRoaW5nCnRvIG9wdGltaXpl
IHRvIGF2b2lkIGludmFsaWRhdGluZyB0aGUgd2hvbGUgUFNDSUQgaWYgdGhlIGRvbWFpbiB3YXMK
YWxyZWFkeSBhdHRhY2hlZCB0byB0aGUgc2FtZSBJT01NVSwgYnV0IEknZCBsZWF2ZSBpdCBmb3Ig
YSBzZXBhcmF0ZQpwYXRjaCBzZXJpZXMuCgo+ID4gPiBUaGUgbnVtYmVyIG9mIHJhZGl4IGxldmVs
cyBpcyBhIHR1bmFibGUgYWxvdCBvZiBpb21tdXMgaGF2ZSB0aGF0IHdlCj4gPiA+IGhhdmVuJ3Qg
cmVhbGx5IGV4cG9zZWQgdG8gYW55dGhpbmcgZWxzZSB5ZXQuCj4gPgo+ID4gTWFrZXMgc2Vuc2Uu
IEkndmUgbGVmdCBhbiBvcHRpb24gdG8gcGljayBtb2RlIGZyb20gTU1VIGZvciBjYXNlcyB3aGVy
ZQo+ID4gZGV2L2lvbW11IGlzIG5vdCBrbm93biBhdCBhbGxvY2F0aW9uIHRpbWUgKHdpdGggaW9t
bXVfZG9tYWluX2FsbG9jKCkpLgo+ID4gSSdkIGd1ZXNzIGl0J3MgcmVhc29uYWJsZSB0byBhc3N1
bWUgSU9NTVUgc3VwcG9ydGVkIHBhZ2UgbW9kZXMgd2lsbAo+ID4gbWF0Y2ggTU1VLgo+Cj4gUmVh
c29uYWJsZSwgYnV0IGZvciB0aGlzIGNhc2UgeW91J2QgYmUgYmVzdCB0byBoYXZlIGEgZ2xvYmFs
IHN0YXRpYwo+IHRoYXQgdW5pZmllcyB0aGUgY2FwYWJpbGl0eSBvZiBhbGwgdGhlIGlvbW11IGlu
c3RhbmNlcy4gVGhlbiB5b3UgY2FuCj4gcGljayB0aGUgcmlnaHQgdGhpbmcgZnJvbSB0aGUgaW5z
dGFsbGVkIGlvbW11cywgYW5kIGFyZ3VhYmx5LCB0aGF0IGlzCj4gdGhlIHJpZ2h0IHRoaW5nIHRv
IGRvIGluIGFsbCBjYXNlcyBhcyB3ZSdkIHNsaWdodGx5IHByZWZlciBkb21haW5zCj4gdGhhdCB3
b3JrIGV2ZXJ5d2hlcmUgaW4gdGhhdCBlZGdlIGNhc2UuCj4KClRoYXQgaXMgYSB2aWFibGUgb3B0
aW9uLiBJZiB5b3UncmUgb2sgSSdsbCBhZGRyZXNzIHRoaXMgYXMgYSBzZXBhcmF0ZSBwYXRjaC4K
SSd2ZSBiZWVuIHRyeWluZyB0byBhdm9pZCBhZGRpbmcgbW9yZSBnbG9iYWwgdmFyaWFibGVzLCBi
dXQgaXQgbWlnaHQKbm90IGJlIGF2b2lkYWJsZS4KCj4gSmFzb24KCkJlc3QsCi0gVG9tYXN6Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
