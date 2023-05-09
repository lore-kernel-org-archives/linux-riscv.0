Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72719C7EE25
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BkbHm0U81ePAZ0ASASdVFzI9poIGAm/cM6gozzRPVkA=; b=s+vhsnjFvAfAwaY871JW1CTd7D
	9rfV1mp0pw/hC027MktIvjzDQDNR0axieXTx2b1DkWgQuDwISeXBFXO8+iBnBsDAkQxoPvu5cixtd
	FkrYx6b7wLpiuHUosV6m5wxy96hz05ScenkdJbkLsOFETgnCVjkoWfzqm/dCBUV8ooK31cadbQl6A
	KAlLM/ySbodcmTOwYJnfiNV2MHlkdT0I0dmrQ2TearWZBS7/cS3sJESIV1aLTHll0iQCH2aNnj7p1
	lfmrmmkiIl8U5l1sfTnPkpsu6Pu2HxXs4PsdF5yTFlYF1CNugkx0WUfxD3NUc01eSczeNxvxx5tqT
	rlly9P8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRcd-003wvv-1c;
	Tue, 09 May 2023 17:59:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRcZ-003wtk-28
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 17:59:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1aaea3909d1so58368545ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 10:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683655170; x=1686247170;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqJoJvlP9zDxdQ0K0L+JgsbcfKm3u2dw31nfblNM+4c=;
        b=MtP+c5nf+zW079JTRYKqCd1DsuuP90EvsoF7JOxu4HlKWSniW0GYK/5AUCw3ntd3Js
         6/JQqJIKvri0P4KwuEnWNfS8JQKuKKmnEtXOTSUPVIHrNK1HjQ61E10HvsMsusyITD7s
         XvRO0f4u75V7FSoCZ3HcOcIu5jZ8aL1vZI0Q/tSYyrJTbMqbxaoUPOh64oGdiV3ZXvM8
         uKQCZQEF/jdh3v775aazF2n2QyMxQobpXrszDmHfzTyPGeyNRjv0GAYNd1oVt9BHzYy3
         9tCo0x9w703WQIm86dHfttPkPxoAALM34pnWh+eE80Hct9jGPn8Ny5tECK4BAi/JY2Ha
         U+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683655170; x=1686247170;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqJoJvlP9zDxdQ0K0L+JgsbcfKm3u2dw31nfblNM+4c=;
        b=XN8v6tOf1AHnW7pptK9Jgy0WiBfsWEFuHcD41VLKR0hF2SlXbpttao4nl3BzE/YjvM
         nMZVwhRHejRaRnCsW0EhvylmX+f+sqPEQBzmgy1Z9baRI+Apn6FJwueyRpeX7jPx3HM+
         7njcI47J5ByL+YGy2S+GxyQDr75MMOF33jtds515VH+kgLlJH62ILYy9oPzWwWeckbvX
         Jo6fhcxm2MFVnJT5LFcrSN1kYp0bYS5vt6eOOK7iO4tp5ib+Z9zUNu+5jBDvEM9otx+6
         W2dWVrb4Ji352MV00LwPxil20dI1RyRsurd6HSu8/b4qXkBTv9k9oJx9DLY++zTDhPjt
         YmbA==
X-Gm-Message-State: AC+VfDyRhAbCPxsWCYKjI/IJuwVPzH4idI078hsmq7/KqZe/uwzA5M/U
	bgcyt53CBz2FuvoNWytN14sGkA==
X-Google-Smtp-Source: ACHHUZ4Jjxw0nwWpMVUKcca85N2M3+SP9PcqbUtCSo5uSdDwHwxoLgwK3/A/PA9HRpdUJ01X8mDTfQ==
X-Received: by 2002:a17:903:41d0:b0:1ac:4412:bd9 with SMTP id u16-20020a17090341d000b001ac44120bd9mr18370891ple.3.1683655170146;
        Tue, 09 May 2023 10:59:30 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b13-20020a17090a8c8d00b0024deb445265sm16979621pjo.47.2023.05.09.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 10:59:29 -0700 (PDT)
Date: Tue, 09 May 2023 10:59:29 -0700 (PDT)
X-Google-Original-Date: Tue, 09 May 2023 10:59:09 PDT (-0700)
Subject: Re: [PATCH -next v19 03/24] riscv: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_V
In-Reply-To: <CALs-Hss8L478Pg7zdcVZkL-jGGqdXtQd+uy+JdNEey90+eBYiA@mail.gmail.com>
CC: andy.chiu@sifive.com, heiko@sntech.de, linux-riscv@lists.infradead.org,
  anup@brainfault.org, atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
  Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>,
  ajones@ventanamicro.com, coelacanthus@outlook.com, abrestic@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Evan Green <evan@rivosinc.com>
Message-ID: <mhng-abff9e50-4cda-4f22-b903-a3f7eb2c340a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_105931_699713_EF1CB260 
X-CRM114-Status: GOOD (  42.46  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwOSBNYXkgMjAyMyAxMDozMjowMyBQRFQgKC0wNzAwKSwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBUdWUsIE1heSA5LCAyMDIzIGF0IDk6NDHigK9BTSBBbmR5IENoaXUgPGFuZHkuY2hp
dUBzaWZpdmUuY29tPiB3cm90ZToKPj4KPj4gT24gVHVlLCBNYXkgOSwgMjAyMyBhdCA3OjA14oCv
UE0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4+ID4KPj4gPiBBbSBE
aWVuc3RhZywgOS4gTWFpIDIwMjMsIDEyOjMwOjEyIENFU1Qgc2NocmllYiBBbmR5IENoaXU6Cj4+
ID4gPiBQcm9iaW5nIGtlcm5lbCBzdXBwb3J0IGZvciBWZWN0b3IgZXh0ZW5zaW9uIGlzIGF2YWls
YWJsZSBub3cuCj4+ID4gPgo+PiA+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNo
aXVAc2lmaXZlLmNvbT4KPj4gPiA+IC0tLQo+PiA+ID4gIERvY3VtZW50YXRpb24vcmlzY3YvaHdw
cm9iZS5yc3QgICAgICAgfCAxMCArKysrKysrKysrCj4+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od3Byb2JlLmggICAgICB8ICAyICstCj4+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2h3cHJvYmUuaCB8ICAzICsrKwo+PiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19y
aXNjdi5jICAgICAgICAgfCAgOSArKysrKysrKysKPj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4gPiA+Cj4+ID4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vcmlzY3YvaHdw
cm9iZS5yc3QKPj4gPiA+IGluZGV4IDlmMGRkNjJkY2I1ZC4uYjg3NTVlMTgwZmJmIDEwMDY0NAo+
PiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAo+PiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAo+PiA+ID4gQEAgLTUzLDYgKzUzLDkgQEAg
VGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+PiA+ID4gICAgICAgIHByb2dyYW1zIChp
dCBtYXkgc3RpbGwgYmUgZXhlY3V0ZWQgaW4gdXNlcnNwYWNlIHZpYSBhCj4+ID4gPiAgICAgICAg
a2VybmVsLWNvbnRyb2xsZWQgbWVjaGFuaXNtIHN1Y2ggYXMgdGhlIHZEU08pLgo+PiA+ID4KPj4g
PiA+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9WYDogU3VwcG9y
dCBmb3IgVmVjdG9yIGV4dGVuc2lvbiwgYXMKPj4gPiA+ICsgICAgZGVmaW5lZCBieSB2ZXJpb24g
MS4wIG9mIHRoZSBSSVNDLVYgVmVjdG9yIGV4dGVuc2lvbi4KPj4gPgo+PiA+ICAgICAgICAgXl4g
dmVyc2lvbiBbbWlzc2luZyB0aGUgU10KPj4gPgo+PiA+ID4gKwo+PiA+ID4gICogOmM6bWFjcm86
YFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRfMGA6IEEgYml0bWFzayBjb250YWluaW5nIHRoZSBl
eHRlbnNpb25zCj4+ID4gPiAgICB0aGF0IGFyZSBjb21wYXRpYmxlIHdpdGggdGhlIDpjOm1hY3Jv
OmBSSVNDVl9IV1BST0JFX0JBU0VfQkVIQVZJT1JfSU1BYDoKPj4gPiA+ICAgIGJhc2Ugc3lzdGVt
IGJlaGF2aW9yLgo+PiA+ID4gQEAgLTY0LDYgKzY3LDEzIEBAIFRoZSBmb2xsb3dpbmcga2V5cyBh
cmUgZGVmaW5lZDoKPj4gPiA+ICAgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfSU1BX0NgOiBU
aGUgQyBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcyBkZWZpbmVkCj4+ID4gPiAgICAgIGJ5IHZl
cnNpb24gMi4yIG9mIHRoZSBSSVNDLVYgSVNBIG1hbnVhbC4KPj4gPiA+Cj4+ID4gPiArKiA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfVl9FWFRfMGA6IEEgYml0bWFzayBjb250YWluaW5nIHRo
ZSBleHRlbnNpb25zCj4+ID4gPiArICAgdGhhdCBhcmUgY29tcGF0aWJsZSB3aXRoIHRoZSA6Yzpt
YWNybzpgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX1ZgOiBiYXNlCj4+ID4gPiArICAgc3lz
dGVtIGJlaGF2aW9yLgo+PiA+ID4gKwo+PiA+ID4gKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9WYDogVGhlIFYgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBieQo+PiA+ID4g
KyAgICB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24gbWFudWFsLgo+
PiA+ID4gKwo+PiA+Cj4+ID4gdGhpcyBzZWVtcyB0byBiZSBkb3VibGluZyB0aGUgUklTQ1ZfSFdQ
Uk9CRV9CQVNFX0JFSEFWSU9SX1Ygc3RhdGUgd2l0aG91dAo+PiA+IGFkZGluZyBhZGRpdGlvbmFs
IGluZm9ybWF0aW9uPyBCb3RoIGVzc2VudGlhbGx5IHRlbGwgdGhlIHN5c3RlbSB0aGF0Cj4+ID4g
ViBleHRlbnNpb24gImRlZmluZWQgYnkgdmVyaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBl
eHRlbnNpb24iIGlzIHN1cHBvcnRlZC4KPj4KPj4gSSB3YXMgdGhpbmtpbmcgdGhhdCBSSVNDVl9I
V1BST0JFX0JBU0VfQkVIQVZJT1JfViBpbmRpY2F0ZXMgdGhlIGtlcm5lbAo+PiBoYXMgYSBwcm9i
ZSBmb3IgdmVjdG9yIChqdXN0IGxpa2UgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lNQSkg
YW5kCj4+IFJJU0NWX0hXUFJPQkVfS0VZX1ZfRVhUXzAgaXMgd2hlcmUgdGhlIGtlcm5lbCByZXBv
cnRzIHdoYXQgZXhhY3RseSB0aGUKPj4gZXh0ZW5zaW9uIGlzLiBUaGlzIG1hcHMgdG8gdGhlIGNv
bmRpdGlvbiBtYXRjaGluZyBvZiBGLEQsIGFuZCBDIGluCj4+IElNQS4gSWYgdGhhdCBpcyBub3Qg
dGhlIGNhc2UgdGhlbiBJIHRoaW5rIHRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoaXMKPj4gZW50cnku
Cj4+Cj4+ID4KPj4gPiBJIGRvbid0IHF1ZXN0aW9uIHRoYXQgd2UnbGwgcHJvYmFibHkgbmVlZCBh
IGtleSBmb3IgZGVlcGVyIHZlY3Rvci0KPj4gPiBzcGVjaWZpY3MgYnV0IEkgZ3Vlc3MgSSdkIHRo
ZSBjb21taXQgbWVzc2FnZSBzaG91bGQgZGVmaW5pdGx5IGV4cGxhaW4KPj4gPiB3aHkgdGhlcmUg
aXMgYSBkdXBsaWNhdGlvbiBoZXJlLgo+Pgo+PiBJIHN1cHBvc2Ugc29tZXRoaW5nIGxpa2UgWnZm
aCBzaG91bGQgZmFsbCBpbnRvIHRoZSBjYXRlZ29yeSBvZgo+PiBSSVNDVl9IV1BST0JFX0tFWV9W
X0VYVF8wLiBJIHdpbGwgYWRkIHRoaXMgZXhhbXBsZSBpbnRvIHRoZSBjb21taXQKPj4gbWVzc2Fn
ZSBpZiB5b3UgYWdyZWUgdGhhdCBpcyBhIGdvb2QgZXhhbXBsZS4KPj4KPj4gPgo+PiA+Cj4+ID4g
PiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wYDogQSBiaXRtYXNrIHRo
YXQgY29udGFpbnMgcGVyZm9ybWFuY2UKPj4gPiA+ICAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBz
ZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29ycy4KPj4gPiA+Cj4+ID4gPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
cHJvYmUuaAo+PiA+ID4gaW5kZXggNzg5MzZmNGZmNTEzLi4zOWRmODYwNGZlYTEgMTAwNjQ0Cj4+
ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+PiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgKPj4gPiA+IEBAIC04LDYgKzgsNiBAQAo+
PiA+ID4KPj4gPiA+ICAjaW5jbHVkZSA8dWFwaS9hc20vaHdwcm9iZS5oPgo+PiA+ID4KPj4gPiA+
IC0jZGVmaW5lIFJJU0NWX0hXUFJPQkVfTUFYX0tFWSA1Cj4+ID4gPiArI2RlZmluZSBSSVNDVl9I
V1BST0JFX01BWF9LRVkgNgo+PiA+ID4KPj4gPiA+ICAjZW5kaWYKPj4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+PiA+ID4gaW5kZXggOGQ3NDVhNGFkOGEyLi45M2E3ZmQz
ZmQzNDEgMTAwNjQ0Cj4+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oCj4+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5o
Cj4+ID4gPiBAQCAtMjIsNiArMjIsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7Cj4+ID4gPiAg
I2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9NSU1QSUQgICAgIDIKPj4gPiA+ICAjZGVmaW5lIFJJ
U0NWX0hXUFJPQkVfS0VZX0JBU0VfQkVIQVZJT1IgICAgICAzCj4+ID4gPiAgI2RlZmluZSAgICAg
ICAgICAgICAgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lNQSAoMSA8PCAwKQo+PiA+ID4g
KyNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9WICAgKDEg
PDwgMSkKPj4gPiA+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRfMCAgNAo+PiA+
ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfSU1BX0ZEICAgICAgICAgICAg
KDEgPDwgMCkKPj4gPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0lNQV9D
ICAgICAgICAgICAgICgxIDw8IDEpCj4+ID4gPiBAQCAtMzIsNiArMzMsOCBAQCBzdHJ1Y3Qgcmlz
Y3ZfaHdwcm9iZSB7Cj4+ID4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9N
SVNBTElHTkVEX0ZBU1QgICAgICAgICAgICgzIDw8IDApCj4+ID4gPiAgI2RlZmluZSAgICAgICAg
ICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOU1VQUE9SVEVEICAgICg0IDw8IDApCj4+
ID4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX01BU0sg
ICAgICAgICAgICg3IDw8IDApCj4+ID4gPiArI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9WX0VY
VF8wICAgIDYKPj4gPiA+ICsjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX1YgICAg
ICAgICAgICAgICAgICgxIDw8IDApCj4+ID4gPiAgLyogSW5jcmVhc2UgUklTQ1ZfSFdQUk9CRV9N
QVhfS0VZIHdoZW4gYWRkaW5nIGl0ZW1zLiAqLwo+PiA+ID4KPj4gPiA+ICAjZW5kaWYKPj4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3N5c19yaXNjdi5jCj4+ID4gPiBpbmRleCA1ZGIyOTY4M2ViZWUuLjYyODBhN2Y3Nzhi
MyAxMDA2NDQKPj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4+ID4g
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+PiA+ID4gQEAgLTEwLDYgKzEw
LDcgQEAKPj4gPiA+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPj4gPiA+ICAjaW5jbHVk
ZSA8YXNtL2h3cHJvYmUuaD4KPj4gPiA+ICAjaW5jbHVkZSA8YXNtL3NiaS5oPgo+PiA+ID4gKyNp
bmNsdWRlIDxhc20vdmVjdG9yLmg+Cj4+ID4gPiAgI2luY2x1ZGUgPGFzbS9zd2l0Y2hfdG8uaD4K
Pj4gPiA+ICAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KPj4gPiA+ICAjaW5jbHVkZSA8YXNtL3Vu
aXN0ZC5oPgo+PiA+ID4gQEAgLTE2MSw2ICsxNjIsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX29u
ZV9wYWlyKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+PiA+ID4gICAgICAgICovCj4+ID4g
PiAgICAgICBjYXNlIFJJU0NWX0hXUFJPQkVfS0VZX0JBU0VfQkVIQVZJT1I6Cj4+ID4gPiAgICAg
ICAgICAgICAgIHBhaXItPnZhbHVlID0gUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lNQTsK
Pj4gPiA+ICsgICAgICAgICAgICAgcGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9CQVNFX0JF
SEFWSU9SX1Y7Cj4+ID4KPj4gPiBEb2Vzbid0IHRoaXMgYWxzbyBuZWVkIGEKPj4gPiAgICAgICAg
IGlmIChoYXNfdmVjdG9yKCkpCj4+ID4KPj4KPj4gSWYgdGhlIFJJU0NWX0hXUFJPQkVfS0VZX0JB
U0VfQkVIQVZJT1IgcGFydCBqdXN0IHRlbGxzIHdoZXRoZXIgaHdwcm9iZQo+PiBzdXBwb3J0cyBw
cm9iaW5nIG9mIGEgc2V0IG9mIGV4dGVuc2lvbnMgdGhlbiBJIHRoaW5rIHdlIHNob3VsZCBub3Qg
YWRkCj4+IHRoZSBpZiBzdGF0ZW1lbnQgaGVyZSwgYnV0IG1heWJlIEkgbWlzdW5kZXJzdG9vZCBz
b21ldGhpbmcuLgo+Cj4gVGhlIGludGVudGlvbiB3YXMgdG8gc2hvdyB0aGF0IHRoZSBJLCBNLCBh
bmQgQSBleHRlbnNpb25zIGFyZSBhY3R1YWxseQo+IHByZXNlbnQgb24gdGhpcyBtYWNoaW5lLCBu
b3QgdGhhdCB0aGUgb3RoZXIgcHJvYmUga2V5cyBleGlzdC4gVXNlcm1vZGUKPiBpcyBhbGxvd2Vk
IHRvIHF1ZXJ5IGFueSBod3Byb2JlIGtleSwgdGhleSBqdXN0IGdldCBiYWNrIHRoZSBrZXkgc2V0
IHRvCj4gLTEgYW5kIHZhbHVlIHNldCB0byAwIG9uIHVua25vd24ga2V5cy4gV2UgImNoZWF0ZWQi
IGEgYml0IGZvcgo+IGRldGVybWluaW5nIEksIE0sIGFuZCBBIGV4aXN0IHNpbmNlIHRoZXkncmUg
YWxyZWFkeSBwcmVyZXF1aXNpdGVzIG9mCj4gTGludXgsIHdoaWNoIGlzIHdoeSB0aGVyZSdzIG5v
IGNvbmRpdGlvbmFsIHRoZXJlLgoKV2Ugc2hvdWxkIHByb2JhYmx5IGFkZCBhIGNvbW1lbnQgc28g
aXQgZG9lc24ndCB0cmlwIHNvbWVvbmUgdXAgYWdhaW4uCgo+IC1FdmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
