Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B78C61DC6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 08:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XD0H0XgvO2VHi42NJDfFpNyLb31JsSzXYW47Se+lfBE=; b=CkcNrUFGA8DHNJ
	lLB3CJXuqgqGtqI5TobSAsL1hlkSN/JSis9o3AfggkEAm5ZJTW3kt5LO6Rt/ZHM97UGytphrGqop1
	JK2jGsttfod8Qa9YmUtxtT4qa9tMD/BIIGFbFX+/XCcMYlrjvs5DCoXZr4erknrOC4GV4agXVmvX0
	9g2x5q2QthlBe3FQ3jEjDzHmSc9HdTI2JY2fUPnO4rWzOAlQp/di26YkZhtTFJKE23Kx//gLKXoMB
	fmg3o1wltOni+5pJ+gJNCzEDl60nCi9vt4lO2tZ5HWAbxjVhn1WG5pUPR7uWYFEkTQdyKOhbC/Dp2
	BdCTXheYJnJ9VnP/pqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsOR-00000005NLf-0OWQ;
	Fri, 28 Aug 2026 08:56:59 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsOO-00000005NLI-43yA
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 08:56:58 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c253425b253so129621366b.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 01:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787907415; cv=none;
        d=google.com; s=arc-20260327;
        b=aZs24ui9N9LBFjUQe3pbQZFYCvfUjB1h3Rir5H12WZ1cNq7iL+iC/4v0G6lgemkKcB
         KvxobpCpEvK/AGvD/JJmObL9Lo2pG9l2V1Mejkf2AsO+Psi9i++TzyOKeVCtwwpdrMoI
         9c/7JKydag++wS4CktoF/s2xm9TrE5+AYgdnMqH7uXTmlhSROYifeWHSRxBb4y00/vAU
         jNxWdKdGPa8oxq8Qh0LeZq32/83kEJQZtbD9MlZ638hu7oyXVtMVXzA6TPxKBvQDSXHl
         LKq4f35DjoOOGdbzCDZgWyHxOEk/EGdMLJzQ+2AATY+CBSABmzwKh4O7U+ckmguNSA+w
         QW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KH0APOVPoRE7sreVg72LcwRkOSoARs0sBWd4BqC6Eg4=;
        fh=rEtWAYrQWS59JgLiCIrRw13Abn64PpFldUyj/VfSddA=;
        b=eqjbj6X5LJ6o6Z5axxKRIWjwKEIwQwfeqySJc7syG/dLaO+yj77saxMlGFsHHgO+Qt
         GwUF+pv4x+7MYIzdrbFn0+CAHnSEBJVzP1+Vo4h9sEt6WQnps0cp6bDq9z6vSpln+CXX
         GBh8QjFeq9IPfZZAIY2EJx/rtFIFHt2GdzPEzSRC0B/TmUVBv4fJ607cQPToT+YwiZUY
         Tyza0JcG/AcpkjPZrwMm1VwWkforB7AQJfY+wGsoV3gEvkmB01h4vGNiJYLCDNQP7X1S
         mSHi1IQs+/rWsq1jtwiVrUnMnjN7UHlwnKAZocu/O+TJ1BDatVay/WqjTUHccJ6HXYL5
         fx5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787907415; x=1788512215; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KH0APOVPoRE7sreVg72LcwRkOSoARs0sBWd4BqC6Eg4=;
        b=XuuvrGQX7sY+rOOZH6sc0V/vzdsiDniM8XrvibC1gpL1wsTvNsY4pb1G2KSCM/bYqZ
         xBjDAkw/DW5a+Gn8xDhgJ5+faQ+yvb3z3Hjb8sKJyaLDF7T51Bq0pVBIV+66BhPreLQo
         a7RdQDMaxSGr0ttI77cHv4WZnwywHcjeDdzFtHnkvkdfaeAT3X5aq10m5aNSFdtOczOT
         BRHpXFNlnRfG/cfq4SXA7e1uEPdSiyT9pbrucfsy3j6XNwTQ62/PSaZRC6FwNwQ7lDgp
         hp7MlOAKAyRU0bCfNMd9FlMSfcRAO+RQHXofyyqsyTpKd1SLK/1sFDlGLIFH8I+IebRF
         jJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907415; x=1788512215;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KH0APOVPoRE7sreVg72LcwRkOSoARs0sBWd4BqC6Eg4=;
        b=QaQeYZLBx4gY3UgZ9t06/W85/AFQUNluLqEIv236QC5QySssREnLKlKOuoPFog+LhX
         ni8CZBQaDMeF1L63hCJQMh6Lvt6IwLyIaQ9eyvCa6rbXeqmg8vKh4ophkQ1A/uTwweeE
         ZFczIB0bVJbVSm3nC5KRXzKPCJjixw5+jnPjA10AUm6DUSId3UgTi6zbyPM3qmBunu3B
         mxcAULIfe/V5ABF2Poox5CnpzOIiUlBrIKMpFog0piNaFE/d6+l26TOqDUS5P6l6euf+
         tLNp8iGOrV/X+zG66goPo8hTnce18PE6G6CthfVJx/mwJAU/fdZewnzwGxLMhUKg1EYo
         YIYg==
X-Forwarded-Encrypted: i=1; AHgh+RrUKp03ZXo9Ffgde06T6kH8MIL3gRGo/cIHSHDiMsFcDwhLLVS806xAamC/ekZea0AUkHzTclZKhh+w4Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nEMGVISCsfZEOkBYStc0VDXFTM065po2EgQv7B3bWpUYA3rrV4
	QYjcveswJVbIb83TZ1PYIe21IRLWMeR3zKqoiKfaGkdIIVdcqlY+aU3M9zLWbJfPPW9BlJrNHqb
	0tuXKmPfidpds1r0GUhHPJywN9x0VIfXCAdc/ASF7+buc562jM4G8e1QnWLop
X-Gm-Gg: AR+sD12/Axelc9Cs04mJz+zTLhBgbbKLqHJWo/BSz107JiL+xybaZe9kziZfZHI9C8u
	yeSPiYha/noYgCxPTTLG9SDLIzLNWCywsIg8mxFXkdVDdFKqq/Cr0LH1es6JZaPPgyz/GTEg9gX
	NkZgve7n5ocj6yc0soL0Zcd3JW7OthmULX7i/wGCiz5NBbX/FZqf0J7bPbWHUHOTETcm+fU0iD/
	w8IHZj4IkeNsyF/uPFdW/MmL/tnOIpnape2RjFTrQaaKlgjxHIM2vWgTsjM7niQ0X78RLqF+zwJ
	urKpjuWIl5P4w5TNZY7uHSVvWmnGEYmkXmQ1l5YX8zHnuWk=
X-Received: by 2002:a17:906:fe04:b0:c24:c24f:e176 with SMTP id
 a640c23a62f3a-c25571576e4mr284901266b.15.1787907414399; Fri, 28 Aug 2026
 01:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260828070747.4009519-1-zong.li@sifive.com> <CAJF2gTQ-1pKoBvnRSLkDGqwKDzon_yfyT74haifeGD=VRBanYg@mail.gmail.com>
In-Reply-To: <CAJF2gTQ-1pKoBvnRSLkDGqwKDzon_yfyT74haifeGD=VRBanYg@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 28 Aug 2026 16:56:41 +0800
X-Gm-Features: AcwNN1V-ZapGFDA2xiCNdfR0yQ83uvkMjP-C1OSA7d6syIhtKwC-Wxz-1qct13s
Message-ID: <CANXhq0q6nkZapRCKew50azkrmR2Gyh_X7OA39uu1p-kR67QSMQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] RISC-V IOMMU HPM support
To: Guo Ren <guoren@kernel.org>
Cc: tomasz.jeznach@linux.dev, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, mark.rutland@arm.com, 
	andrew.jones@oss.qualcomm.com, david.laight.linux@gmail.com, 
	zhangzhanpeng.jasper@bytedance.com, yang.yicong@picoheart.com, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_015657_049131_575968A3 
X-CRM114-Status: GOOD (  34.74  )
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

T24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgNDo0OeKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IEhpIExpIFpvbmcsCj4KPiBKdXN0IHR3byBwYXRjaGVzPyBXaGVyZSBk
aWQgdGhlIHJpc2N2LWlvbW11IFBNVSBkcml2ZXIgcGF0Y2ggZ28/Cj4KCkkgYXBvbG9naXplIGZv
ciBtaXNzaW5nIHRoZSBmaXJzdCBjb21taXQuIEkgd2lsbCByZXNlbmQgaXQgYXMgUEFUQ0gKUkVT
RU5EIHY3LiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciBwb2ludGluZyB0aGlzIG91dCEKCj4gLS0K
PiBCZXN0IFJlZ2FyZHMKPiAgR1VPIFJlbgo+Cj4gT24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgMzow
N+KAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBz
ZXJpZXMgaW1wbGVtZW50cyBzdXBwb3J0IGZvciB0aGUgUklTQy1WIElPTU1VIGhhcmR3YXJlIHBl
cmZvcm1hbmNlCj4gPiBtb25pdG9yLgo+ID4KPiA+IFRoZSBSSVNDLVYgSU9NTVUgUE1VIGRyaXZl
ciBpcyBpbXBsZW1lbnRlZCBhcyBhbiBhdXhpbGlhcnkgZGV2aWNlIGRyaXZlcgo+ID4gY3JlYXRl
ZCBieSB0aGUgcGFyZW50IFJJU0MtViBJT01NVSBkcml2ZXIuIFRoZXJlZm9yZSwgdGhlIGNoaWxk
IGRyaXZlcgo+ID4gY2FuIG9idGFpbiByZXNvdXJjZXMgYW5kIGluZm9ybWF0aW9uIGZyb20gdGhl
IHBhcmVudCBkZXZpY2UsIHN1Y2ggYXMKPiA+IHRoZSBNTUlPIGJhc2UgYWRkcmVzcyBhbmQgSVJR
IG51bWJlci4KPiA+Cj4gPiBUaGUgdGhyaWQgY29tbWl0IGFkZHMgcmF3IHNwaW5sb2NrIGZvciBy
YWNlIGNvbmRpdGlvbiB3aGVuIFBDSSBNU0kvTVNJLVgKPiA+IG9uIElNU0lDLiBBcyB0aGUgY29t
bWl0IG1lc3NhZ2UgbWVudGlvbmVkOgo+ID4gRXZlbnRzIGFyZSBib3VuZCB0byBvbmUgQ1BVIGFu
ZCB0aGUgaW50ZXJydXB0IGlzIGFmZmluZSB0byBpdCwgc28gdGhlCj4gPiBwZXJmIGNhbGxiYWNr
cyBydW5uaW5nIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZCB3b3VsZCBiZSBlbm91Z2ggdG8KPiA+
IGV4Y2x1ZGUgdGhlIGhhbmRsZXIuIEJ1dCBQQ0kgTVNJL01TSS1YIG9uIElNU0lDIGJyZWFrcyB0
aGF0Ogo+ID4gVGhlIGlycWNoaXAgc2V0cyBJUlFDSElQX01PVkVfREVGRVJSRUQsIHNvIGlycV9z
ZXRfYWZmaW5pdHkoKSByZXBvcnRzCj4gPiBzdWNjZXNzIHdoaWxlIG9ubHkgcmVjb3JkaW5nIHRo
ZSByZXF1ZXN0LCBhbmQgdGhlIG1vdmUgaXMgYXBwbGllZCBpbgo+ID4gaW50ZXJydXB0IGNvbnRl
eHQgdXBvbiB0aGUgbmV4dCBkZXZpY2UgaW50ZXJydXB0LiBVbnRpbCB0aGVuIHRoZQo+ID4gaW50
ZXJydXB0IGlzIHN0aWxsIHJvdXRlZCB0byB0aGUgQ1BVIElNU0lDIHBpY2tlZCBpbml0aWFsbHks
IHNvIHRoZQo+ID4gZmlyc3Qgb3ZlcmZsb3cgaW50ZXJydXB0IGNhbiBydW4gY29uY3VycmVudGx5
IHdpdGggdGhlIHBlcmYgY2FsbGJhY2tzCj4gPiBvbiB0aGUgQ1BVIHRoZSBldmVudHMgYXJlIGJv
dW5kIHRvLgo+ID4KPiA+IEkgbm90aWNlZCB0aGF0IHhnZW5lX3BtdSBhbmQgYXJtLWNjaSBoYXZl
IHNpbWlsYXIgaW1wbGVtZW50YXRpb24sIHNvIGFkZAo+ID4gaXQgaW4gcmlzY3ZfaW9tbXVfcG11
IHNob3VsZCBiZSBhY2NlcHRlZC4KPiA+Cj4gPiBDaGFuZ2VkIGluIHY2Ogo+ID4gLSBSZWJhc2Vk
IG9udG8gdGhlIGxhdGVzdCB2Ny4zLXJjCj4gPiAtIFVzZSBzeXNmc19lbWl0IGluc3RlYWQgb2Yg
Y3B1bWFwX3ByaW50X3RvX3BhZ2VidWYKPiA+IC0gU2V0IHVwIG9uX2NwdSBhbmQgaXJxIGFmZmlu
aXR5IGJ5IGNwdWhwIGNhbGxiYWNrcwo+ID4gLSBDaGFuZ2UgdHlwZSBvZiBvbl9jcHUgZnJvbSB1
bnNpZ25lZCBpbnQgdG8gaW50Cj4gPiAtIFJlamVjdCBmaWx0ZXIgb3BlcmFuZHMgb2YgY3ljbGUg
ZXZlbnQgaW4gZXZlbnRfaW5pdAo+ID4gLSBDaGVjayByZXR1cm4gdmFsdWUgb2YgY291bnRlciBu
dW1iZXIgYW5kICBtYXNrcyBpbiBwcm9iZQo+ID4gLSBBZGQgcmF3IHNwaW5sb2NrIGZvciByYWNl
IGNvbmRpdGlvbiAodGhpcmQgY29tbWl0KQo+ID4KPiA+IENoYW5nZWQgaW4gdjU6Cj4gPiAtIFBp
Y2sgdXAgc3VnZ2VzdGlvbnMgZnJvbSBzYXNoaWtvLWJvdCBhcyBmb2xsb3dzCj4gPiAtIEZpeCBl
dmVudCBncm91cCB2YWxpZGF0aW9uIGZvciBzdyBldmVudAo+ID4gLSBCaW5kIElSUSB0byBhdXgg
UE1VIGRldiBpbnN0ZWFkIG9mIHBhcmVudCBJT01NVSBkZXYKPiA+IC0gQ2xlYXIgT0YgYml0IHdo
ZW4gZXZlbnQgaXMgTlVMTAo+ID4gLSBJbXByb3ZlIGhpLWxvLWhpIHBhdHRlbgo+ID4gLSBBZGQg
YmFjayBJUlFGX1NIQVJFRCBmbGFnIGR1ZSB0byBtaXNtYXRjaAo+ID4gLSBNYW5hZ2UgY3B1aHAg
YW5kIHBtdSByZWdpc3RlciBieSBkZXZyZQo+ID4KPiA+IENoYW5nZWQgaW4gdjQ6Cj4gPiAtIFJl
YmFzZWQgb250byB2Ny4zLXJjCj4gPiAtIFVzZSBpc19zYW1wbGluZ19ldmVudCgpIGluc3RlYWQg
b2YgYWNjZXNzaW5nIHZhaXJhYmxlIGRpcmVjdGx5Cj4gPiAtIFJlbmFtZSB0aGUgbWF0Y2hpbmcg
bmFtZSBmcm9tICJpb21tdS5wbXUiIHRvICJyaXNjdi1pb21tdS5wbXUiCj4gPiAtIENoYW5nZSB0
aGUgbmFtaW5nIG9mIFBNVSBkZXZpY2UgZm9yIGF2b2lkICI6IiBpbiBQQ0llIGNhc2UKPiA+IC0g
QWRkIHN1cHByZXNzX2JpbmRfYXR0cnMgYXR0cmlidXRlCj4gPiAtIFJlbW92ZSBJUlFGX1NIQVJF
RCBmbGFnCj4gPiAtIFNldCBpcnEgYWZmaW5pdHkgdG8gbG9jYWwgQ1BVIG9mIElPTU1VCj4gPiAt
IEFsbG9jYXRlIElEIGJ5IElEQSBmb3IgYXV4aWxpYXJ5IGRldmljZQo+ID4gLSBQaWNrIHVwIHN1
Z2dlc3Rpb25zIGZyb20gc2FzaGlrby1ib3QKPiA+Cj4gPiBDaGFuZ2VkIGluIHYzOgo+ID4gLSBS
ZWJhc2VkIG9udG8gdjcuMi1yYzMKPiA+IC0gVXNlIGhpX2xvX3dyaXRlcS9yZWFkcSB0byBhY2Nl
c3MgcmVnaXN0ZXIKPiA+IC0gUGljayBjb21tZW50cyBmcm9tIHNhc2hpa28tYm90IGFzIGZvbGxv
d3MKPiA+IC0gU2V0IElSUSBDUFUgYWZmaW5pdHkKPiA+IC0gUmVtb3ZlIElSUUZfT05FU0hPVCBm
bGFnIHdoZW4gcmVxdWVzdCBpcnEKPiA+IC0gQWRqdXN0IGN5Y2xlIGV2ZW50IGNoZWNrIGJ5IGNo
ZWNraW5nIGV2ZW50X2lkIGZpZWxkIG9ubHkKPiA+IC0gRml4IGJ1ZyBmb3IgZ3JvdXAgZXZlbnRz
IHZlcmlmaWNhaXRvbgo+ID4gLSBGaXggS0FTQU4gaXNzdWUgYWJvdXQgY2FzdGluZyAzMi1iaXQg
dmFyaWFibGUgdG8gdW5zaWduZWQgbG9uZyBwb2ludGVyCj4gPiAtIENsZWFyIElQU1IgcGVuZGlu
ZyBiaXQgYmVmb3JlIHN0YXJ0aW5nIGNvdW50ZXIKPiA+IC0gQ2xlYXIgT0YgYml0IGluIGV2ZW50
IHNlbGVjdG9yIHJlZ2lzdGVyIGluIGlycSBoYW5kbGVyCj4gPiAtIFJlbGVhc2UgaXJxIGJ5IGRl
dm0gaW5zdGVhZCBvZiBleHBsaWNpdCBmcmVlX2lycQo+ID4KPiA+IENoYW5nZWQgaW4gdjI6Cj4g
PiAtIFJlYmFzZWQgb250byB2Ny4yLXJjMQo+ID4gLSBVc2UgaGktbG8taGkgbWVjaGFuaXNtIHRv
IHJlYWQgY291bnRlci4KPiA+ICAgU3VnZ2VzdGVkIGJ5IEd1byBSZW4gYW5kIERhdmlkIExhaWdo
dAo+ID4KPiA+IENoYW5nZWQgaW4gdjE6Cj4gPiAtIFJlYmFzZWQgb250byB2Ni4xOS1yYzgKPiA+
IC0gUGljayBhbGwgc3VnZ2VzdGlvbnMgYW5kIGZlZWRiYWNrcyBmcm9tIHYxIHNlcmllcwo+ID4g
LSBBZGQgY3B1IGhvdHBsdWcgaW1wbGVtZW50YXRpb24gdG8gYXZvaWQgcmFjZSBlbmFibGVtZW50
Cj4gPiAtIE1vdmUgUE1VLXJlbGF0ZWQgZGVmaW5pdGlvbiBmcm9tIGhlYWRlciB0byBjIGZpbGUK
PiA+IC0gQ2hhbmdlIFBNVSBkcml2ZXIgdG8gYXV4aWxpYXJ5IGRldmljZSBkcml2ZXIKPiA+Cj4g
PiBDaGFuZ2VkIGluIFJGQzoKPiA+IC0gUmViYXNlIG9udG8gdjYuMTMtcmM3Cj4gPiAtIENsZWFy
IGludGVycnVwdCBwZW5kaW5nIGJlZm9yZSBoYW5kbGluZyBpbnRlcnJ1cHQKPiA+IC0gRml4IHRo
ZSBjb3VudGVyIHZhbHVlIGlzc3VlIGNhdXNlZCBieSBPRiBiaXQgaW4gdGhlIGN5Y2xlIGNvdW50
ZXIuCj4gPiAtIEludm9rZSByaXNjdl9pb21tdV9ocG1fZGlzYWJsZSgpIGluc3RlYWQgb2Ygcmlz
Y3ZfaW9tbXVfcG11X3VuaW5pdCgpCj4gPiAgIGluIHJpc2N2X2lvbW11X3JlbW92ZSgpCj4gPgo+
ID4gWm9uZyBMaSAoMik6Cj4gPiAgIGlvbW11L3Jpc2N2OiBjcmVhdGUgYSBhdXhpbGlhcnkgZGV2
aWNlIGZvciBIUE0KPiA+ICAgZHJpdmVycy9wZXJmOiByaXNjdi1pb21tdTogcHJvdGVjdCBzaGFy
ZWQgc3RhdGUgd2l0aCBhIHJhdyBzcGlubG9jawo+ID4KPiA+ICBkcml2ZXJzL2lvbW11L3Jpc2N2
L0tjb25maWcgICAgfCAgMSArCj4gPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jICAgIHwg
MzcgKysrKysrKysrKysrKysrKysrKwo+ID4gIGRyaXZlcnMvcGVyZi9yaXNjdl9pb21tdV9wbXUu
YyB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiA+ICAzIGZpbGVzIGNo
YW5nZWQsIDk4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4gLS0KPiA+IDIu
NDMuNwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
