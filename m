Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE908D6406D
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 03:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeA5f0Q7KmXjA/1CNWA+bN+emOSVDeDnoNyLHCziAlQ=; b=JDuksE7IXnniBr
	uaksdZKAN959wn7HPB4Cf6NUrEDOGQ6YHMA/wJ//D8ZuBSvnPdnP48Ma0km8PNSvnQ6wkeZ7me1Xq
	6yWCgH7jHVpd28UnPzx+S0lpplqdGcGYPYbxyr0krNWyPFqiN4nV+RcUezg7BmSkscvWPDPPI8Av3
	wzjYshfXYbV5BDg0D4LobwLaUAawyqpJ1M7TpA2imCfHkPc2PesBfc4Zi09QXDObvUAay5ymvUyok
	JrWYqKo538SSGKUbHntVb24lDsqSBcfnPv4C1BxbxqLSoKColg6IrKTWE4Z7/xj+pa7TLVlKNFsfS
	7WErZtTp98GyX1FuyYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhlt-000000065Z1-12Ow;
	Wed, 17 Dec 2025 03:00:13 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhlp-000000065Y5-1Y8u
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 03:00:11 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-45085a4ab72so3098350b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 19:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765940408; x=1766545208; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/2RYz5g89Oo7ClB5gtL8Za3r2Xr3F25uufbNGZ7CVQ=;
        b=Q9X7s8gWRMlImBaBiipykwN0HEWiQ67pDbWRHZqqso4nlZHUJ99C5OMxnjmo6d7Nqr
         6diINqtAsMyWVEYr2eYbevwC+bMBJIuMfVftxDuQAv8qsEt0M3w7klAneTyXC6wiAw4C
         L8Jv9OKfUvo7RCQ/94FnAKc5xUlxHgKYR3gh7kElMQmPkl5q6z6i3yMlDcp8ywYXnWC2
         ldv3+zcH0F1gXzbbDTHlprd67asQhuvfIdRlAtjjC4lbIvckTUXVOCZO56qTRKKCto80
         8ft4mEV4NAU9Bw4huAxnUaRaqZrHa/AbZIAg469IF7dCXkeD9bGhC3JR9AaDnaZMRWPN
         92+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765940408; x=1766545208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/2RYz5g89Oo7ClB5gtL8Za3r2Xr3F25uufbNGZ7CVQ=;
        b=DFvUynmcF1f3JGy10oO1+/gkIp0lhkdxV5yAkDKaGrWkAphIqpEPfN//Ff0y7la/59
         XUBd2K4jBArSY0r887KOkHb25HeAGz8rCAyItXd/EJBNDK7ZU+G7E9yv3CZ/USaPPchH
         SDSGvjg0yDBQ4wBIoAhZdjdVqxfN2f/hrYDDcUlbks3sU7s9znspWMdkMkVM2JgnR5uE
         U+2i7A2LYb7vl/DENS1rVzGX5ME3GpY9s/+noEdPKTdl9avYoIYnA4QjOvQmKemc9QbE
         0psNkWeOu/uZHV7gLVtVKxf6Xk+0kYaxYf2zDzsYHvadrpshlJgBErTeUDlc5FqD5R8W
         AySw==
X-Forwarded-Encrypted: i=1; AJvYcCVvzhpu3yWLaWFhORQMYgeEN5ZLn0qLO//QaF4NPVXscqWzCRS9fW8qrBpMEV2TM+253VUTCAnJoMx6Lw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF1HZz+AzvC1B/dqzK3OCQtrlRpnFYyGqWF5nSC1t3BzK5yoWg
	Y0SRdzMkGxZIeveG+FVaqF+9LUCd+wze6RR7C/y6Y6RGDh4c+qVMNn9WLrcJanul15XDxVm8TTx
	ID3LMagK3i+KoI6OJf6ionzMbBiWnTHIoRAWJDCi2pw==
X-Gm-Gg: AY/fxX4zksEaGpWznSALoEzGNYcj1nt4t0+Dz97+w1DiAWupGJ0DNfhoxR/auUO+iO/
	HxZlVksyrD7rGIRwcKf5Xz7TQAi9dQJKBtJOkk4U5HguVmJAI8voRByZQUpIJVPHYX88b1JdZv2
	XX12OEO5PrekrVYSUI1Lwdadnh6AZWb8e88Mw159im222pVdWijOVjvwqcsaKjo4G1NgHrQz5zk
	YnJUxAvqyrB4rM7ffZPh6AsrdB/7agFKD9yGh5UURuNrvk58fkCDrILeXtJ58jieyE2f3kn1Dr8
	bw==
X-Google-Smtp-Source: AGHT+IGOsDttJF6uFgQs8b9z12RN3EHncAP/ev9NC4wtQBWY1BR7zun1IGjSOjiTZhdxNQQtrm1spYA/0On3N4VLzFM=
X-Received: by 2002:a05:6808:a5d7:20b0:455:d5d1:8abe with SMTP id
 5614622812f47-455d5d1a911mr2707386b6e.34.1765940408215; Tue, 16 Dec 2025
 19:00:08 -0800 (PST)
MIME-Version: 1.0
References: <20251114033243.76509-1-cuiyunhui@bytedance.com>
 <20251114033243.76509-3-cuiyunhui@bytedance.com> <96fd2a69-baf4-4109-8341-0d4bb6c60393@picoheart.com>
In-Reply-To: <96fd2a69-baf4-4109-8341-0d4bb6c60393@picoheart.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 17 Dec 2025 10:59:57 +0800
X-Gm-Features: AQt7F2oBwdHtfuscheWe6RG8WNJwqi88AjsGeaDU19qa6XfrY_huTLBuOPV3-Pk
Message-ID: <CAEEQ3wkq5P=WE_XsPDFOK5ESZDP6igQ9dAcN7Bd6-LkEv7N17g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v6 2/2] riscv: add HARDLOCKUP_DETECTOR_PERF support
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	dianders@chromium.org, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	will@kernel.org, yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Paul Walmsley <pjw@kernel.org>, geshijian@picoheart.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_190009_417273_2089CC98 
X-CRM114-Status: GOOD (  21.10  )
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

SGkgWWljb25nLAoKT24gRnJpLCBEZWMgNSwgMjAyNSBhdCAyOjEy4oCvUE0gWWljb25nIFlhbmcg
PHlhbmcueWljb25nQHBpY29oZWFydC5jb20+IHdyb3RlOgo+Cj4gSGkgWXVuaHVpLAo+Cj4gdGhp
cyBoYXMgY29uZmxpY3RzIG9uIHRoZSBtYWlubGluZSBtYXN0ZXIuIGxvb2tzIGxpa2UgeW91IGhh
dmUgYSBkZXBlbmRlbmN5Cj4gb24gdGhlIFNTRSBQTVUgc3VwcG9ydCBwYXRjaHNldCBbMV0sIG5l
ZWQgdG8gbWVudGlvbiBpdCBmb3IgdGhlIG1haW50YWluZXIKPiB0byBhcHBseS4KPgo+IFsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDkwODE4MTcxNy4xOTk3NDYx
LTUtY2xlZ2VyQHJpdm9zaW5jLmNvbS8KPgo+IG9uZSBjb21tZW50IGJlbG93Lgo+Cj4gT24gMjAy
NS8xMS8xNCAxMTozMiwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEVuYWJsZSB0aGUgSEFSRExPQ0tV
UF9ERVRFQ1RPUl9QRVJGIGZ1bmN0aW9uIGJhc2VkIG9uIFJJU0MtViBTU0UuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiBSZXZp
ZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+ID4gQWNr
ZWQtYnk6IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9y
aXNjdi9LY29uZmlnICAgICAgICAgICB8ICAzICsrKwo+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMgfCAxMCArKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+ID4gaW5kZXggZmFkZWMyMGI4N2E4ZS4uNDZjY2QzMzczMmZhOCAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmln
Cj4gPiBAQCAtMTg2LDYgKzE4Niw5IEBAIGNvbmZpZyBSSVNDVgo+ID4gICAgICAgc2VsZWN0IEhB
VkVfUEFHRV9TSVpFXzRLQgo+ID4gICAgICAgc2VsZWN0IEhBVkVfUENJCj4gPiAgICAgICBzZWxl
Y3QgSEFWRV9QRVJGX0VWRU5UUwo+ID4gKyAgICAgc2VsZWN0IEhBVkVfUEVSRl9FVkVOVFNfTk1J
IGlmIFJJU0NWX1BNVV9TQklfU1NFCj4gPiArICAgICBzZWxlY3QgSEFWRV9IQVJETE9DS1VQX0RF
VEVDVE9SX1BFUkYgaWYgUEVSRl9FVkVOVFMgJiYgSEFWRV9QRVJGX0VWRU5UU19OTUkKPiA+ICsg
ICAgIHNlbGVjdCBXQVRDSERPR19QRVJGX0FESlVTVF9QRVJJT0QgaWYgSEFSRExPQ0tVUF9ERVRF
Q1RPUl9QRVJGCj4gPiAgICAgICBzZWxlY3QgSEFWRV9QRVJGX1JFR1MKPiA+ICAgICAgIHNlbGVj
dCBIQVZFX1BFUkZfVVNFUl9TVEFDS19EVU1QCj4gPiAgICAgICBzZWxlY3QgSEFWRV9QT1NJWF9D
UFVfVElNRVJTX1RBU0tfV09SSwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gPiBpbmRleCBjODUyZjY0
YTUwMjIxLi4wYzdjNTkyNDY4N2M5IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2
X3BtdV9zYmkuYwo+ID4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ID4gQEAg
LTIyLDYgKzIyLDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvc2NoZWQvY2xvY2suaD4KPiA+ICAj
aW5jbHVkZSA8bGludXgvc29jL2FuZGVzL2lycS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC93b3Jr
cXVldWUuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvbm1pLmg+Cj4gPgo+ID4gICNpbmNsdWRlIDxh
c20vZXJyYXRhX2xpc3QuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3NiaS5oPgo+ID4gQEAgLTExOTIs
NiArMTE5MywxMyBAQCBzdGF0aWMgaW50IHBtdV9zYmlfc2V0dXBfc3NlKHN0cnVjdCByaXNjdl9w
bXUgKnBtdSkKPiA+ICB9Cj4gPiAgI2VuZGlmCj4gPgo+ID4gKyNpZmRlZiBDT05GSUdfSEFSRExP
Q0tVUF9ERVRFQ1RPUl9QRVJGCj4gPiArYm9vbCBhcmNoX3BlcmZfbm1pX2lzX2F2YWlsYWJsZSh2
b2lkKQo+ID4gK3sKPiA+ICsgICAgIHJldHVybiBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9QTVVf
U0JJX1NTRSk7Cj4KPiB0aGlzIGxvb2tzIGluY29ycmVjdCBwZXIgaW1wbGVtZW50YXRpb24gaW4g
WzFdLiB3ZSdsbCBmYWxsYmFjayB0byB0aGUgbm9ybWFsCj4gaW50ZXJydXB0IGlmIGZhaWxlZCB0
byByZWdpc3RlciB0aGUgU1NFIGV2ZW50LCBpbiB3aGljaCBjYXNlIE5NSSBpcyBub3QKPiBhdmFp
bGFibGUgZm9yIHRoZSBQTVUuIENoZWNrIHRoZSBrY29uZmlnIGlzIG5vdCBzdWZmaWNpZW50Lgo+
Cj4geW91IGNhbiBjaGVjayBwbXUtPnNzZV9ldnQgaW5zdGVhZCBmb3IgdGhlIE5NSSBzdXBwb3J0
IGhlcmUsIG9yIGNhY2hlZCB0aGUKPiBOTUkgc3RhdHVzIHNvbWV3aGVyZSBsaWtlIGhvdyBhcm1f
cG11IGRvZXMuCj4KPiBUaGFua3MuCj4KCldlbGwsIGJhc2VkIG9uIENPTkZJR19SSVNDVl9QTVVf
U0JJX1NTRSwgZnVydGhlciBjaGVjayByZWdpc3RyYXRpb24gc3VjY2Vzcy4KCj4gPiArfQo+ID4g
KyNlbmRpZgo+ID4gKwo+ID4gIHN0YXRpYyBpbnQgcG11X3NiaV9zdGFydGluZ19jcHUodW5zaWdu
ZWQgaW50IGNwdSwgc3RydWN0IGhsaXN0X25vZGUgKm5vZGUpCj4gPiAgewo+ID4gICAgICAgc3Ry
dWN0IHJpc2N2X3BtdSAqcG11ID0gaGxpc3RfZW50cnlfc2FmZShub2RlLCBzdHJ1Y3QgcmlzY3Zf
cG11LCBub2RlKTsKPiA+IEBAIC0xNjE4LDYgKzE2MjYsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBw
bXVfc2JpX2RldmluaXQodm9pZCkKPiA+ICAgICAgIC8qIE5vdGlmeSBsZWdhY3kgaW1wbGVtZW50
YXRpb24gdGhhdCBTQkkgcG11IGlzIGF2YWlsYWJsZSovCj4gPiAgICAgICByaXNjdl9wbXVfbGVn
YWN5X3NraXBfaW5pdCgpOwo+ID4KPiA+ICsgICAgIGxvY2t1cF9kZXRlY3Rvcl9yZXRyeV9pbml0
KCk7Cj4gPiArCj4gPiAgICAgICByZXR1cm4gcmV0Owo+ID4gIH0KPiA+ICBkZXZpY2VfaW5pdGNh
bGwocG11X3NiaV9kZXZpbml0KQoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
