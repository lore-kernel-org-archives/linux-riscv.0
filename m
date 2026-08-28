Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921DFC61DB9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 02:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTRRdc5kLRU+K0M0UkT7WiOYtmWQpidZaltyiJW8Fgg=; b=a3iunijLkvkKVR
	qy1wOBjWrSS6Ytul5wlnnhcN8Uyh2R5f7KbE0SXG9a2eVwlkCgtOtkmEhPl77m5E+cUd4+Kilxu5I
	qnSN1Dsg4WG8DBEIIvARM3NOXP1zkJQ9oz/WQeOCvpJEaJeJwCfMDqEWvhY/yj8iZFiNOHMZGexMT
	FWjqgZQ5KSRZnZnJGiVAxzBsa2Rg1pQk2VIcjh2UNCaEUAwTyWyLnP9YXL0q9F6d3XguRj/SO0h7o
	nXZyoUbXXpPJIygzbvwVsPKnZTcTrK0PJqAhXAQLH8VW05VgXpG1DA/h7AmoJCCKxBSJLCVXhxFTu
	rhCIqejQDUnC1rj1KmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzmhd-000000052Ul-1JfL;
	Fri, 28 Aug 2026 02:52:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzmha-000000052UP-2m7I
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 02:52:24 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c25366c9b42so58032866b.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2026 19:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787885541; cv=none;
        d=google.com; s=arc-20260327;
        b=NQAUh20MTahJHRrwMMYkOb2uzPFeZHwctrfi9vinHFvQNyl+MDZN7mQ5wFRgT94dmP
         sNA6vpHoIb/odU0ZETaNHj4WIkAImCsKiahvMuUeyyTeMMTurI3TNc/NLP3L96UL4wah
         iX1UfLHjUPDHRbn5rosSZPNmTzdc/Kibzyz0qV4sCq4j8J6kZXkszvLS/gReMSdcD6ok
         5r4jMYsNOdT16aQ6KgAcqOgBd9pLNXcRdz/MDYoL3K7IBOW7TTyW72uUzwb5V8N/6+zo
         CMpaiYQmPI6tOkdOCrnsfeNgV80K8r2aciAyYAb/am+Po+g71yr+/qV6XwFS9NYCepZ2
         a7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8h8ajQ5iXnMhCt1P+yDUVUP4cBmcnCV7lKhnpULiS68=;
        fh=NJfMf+OLO3WRJy31rj1ZHxBHVEryzZAzFXmHMoUN0MM=;
        b=p77q4u3bUKC9jaPCVH1ZubS2FZu1PI/aqzYmYq8Xjf/0BJZ+lhJ8X3zWqAFbhZO5IG
         EtUotSumuw9NlVnEx6/OJ+EvOW9s/LvrhaVEEB4MjkA+SD18+ZI757ky7ny1lIGtR8FP
         wndmSj6p59k0PYLyTALvTGxGKjjj1kJE//Sp24qxStX6X9HMbY93kapuxswgwtEgPn5j
         Jqf157Od1JmIsBKkCaVs74dd7DfyNy7RMcs/nyqsBveK15y9wT4PWmGAjzBicMi85WAb
         Kiob8I2kHbLG5ibAmG7j6Fnvzlth14Plk9qwbAnBMQg3z/kz1ZghfBvgMA1CWqUi08Hs
         VKOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787885541; x=1788490341; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8h8ajQ5iXnMhCt1P+yDUVUP4cBmcnCV7lKhnpULiS68=;
        b=CVywXWJDy5Lt8XNblRKJgylGh4liQy9N/Na+ocuKz1947+k2xatPMb93wTVHD77epx
         DwbJof7uWkOpPYc5AhbeKkhdXBm+/Z2uwPU/3rPjuxgqiZwI1h8bhr9z2mQoIjdlSnh1
         eHACyzgTk4Gmiy3wr7cB/t3s1wiIr2dscAXwzdVi9SrPwhwj4vhHUjhKys0XID805DIt
         oJzpdFAchdtxPru/aY0342GbQae3skLU+ixLxSW3/obG5UVdpj+rZvjK6XB7a9YTVj9M
         S6jSp0JJqysIw2+Z4W1Vu5B6iGWnglohufOkuP+jEVo04dQuv1XQ1O2ai1y2QWfEvtnv
         Agng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787885541; x=1788490341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8h8ajQ5iXnMhCt1P+yDUVUP4cBmcnCV7lKhnpULiS68=;
        b=rRqEDT3qP4XEqL7PHJRMf3+JBnFYffYuCu+YlNKdWf5j9tat2WqYq9TFLkG7NqoZCv
         Tg7Im76nEUrhY4pL8XXi2OvNGBs7ELSCHuJfVOHPH6yCZPWzhm99KJxwxfZZuTkJrHfe
         zG18fmYDBB8ebi4iBbAQNnr8rqHwn35gjpDfuHzVwmAj6DZ9S2dQqm55ieiHLQBYKlik
         xd8TY7W/qzdi2ObctBqL8lK57MghmskYFevQ1Cdy45yoy0rvt2W3C54PZ6k3CWvJCLgs
         +e9NaeiF7s+cZy3IB91MAJY8T2B+zFbx0SOjTSByO6Gln+m16DyHCNST3w6QdIEWr2dO
         Yl9A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/0PjHXqFg2WlKMr58ebl6yXwhzpqYdM2Oilj/Qc1+fa9uIIYOhsUHZ22OgDON8H94t4Ti/rbGEwnxIg==@lists.infradead.org
X-Gm-Message-State: AFuF++miTX13bhoYxhDaRi5nlRuzM065kAjeUNhTUAIeor5kqnoKaUYK
	u3Wo//w3CVzAHU7l/hwJVns/q2MOVgszQ5qI8cTljOYcPBPwd6dgv9YZva1q93WdO/jAmzFbikD
	QBNfNJYY80Q++9NTKqS/7tg2Q98RakXNKQGVb/G6XRw==
X-Gm-Gg: AR+sD10LT1y98K+SsZxiFrDCfM6B++tOylT1nTkAQ1l+iB+OIC4xTI5VP8HL64sj0Md
	jUZcCUD/hWPovnZivBCgxuWWsHR1RfMQtQ7kOHdOLKFyyv0zhA4G3TmH6dl57UAVmsP9+qNjzXS
	5y51LqhTvDrzluShYlzYthRr89jFvzBKh7v2kNnt6d+VnSOXqRiNmv65I/FfG2LI0Q6dBASRcex
	T2NAKbgD2nAWJE3Q5Glas617cGd6yxfz2iwpnz7do0YpkmnwLF2VhpOLjGOoWGf9fPppzHFbyDe
	BYj+ktOlg7AURFek1njKZkdygb4ydLBf1VD2SBhkISegasUxXS5S4CYRCA==
X-Received: by 2002:a17:907:a091:b0:c16:8adf:f183 with SMTP id
 a640c23a62f3a-c255742f3e2mr190741766b.14.1787885540701; Thu, 27 Aug 2026
 19:52:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260615123821.373248-1-guoren@kernel.org> <7c490aeb-a3d9-4fe9-81de-f9662577851d@iscas.ac.cn>
 <CAJF2gTQ+-gpvUDtOh99aKP2-iDJy3MYOWti9k2Ntd0-J0MXqxQ@mail.gmail.com>
 <e051d822-d0be-4a88-ba86-ec9b5905fd1e@iscas.ac.cn> <CAJF2gTRH6x78A3J5HJ5kUM47aDv8R0yFr8LRP+7jiLX4GL3ssg@mail.gmail.com>
 <20260618143634.7f3dd6c5@pumpkin>
In-Reply-To: <20260618143634.7f3dd6c5@pumpkin>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 28 Aug 2026 10:52:08 +0800
X-Gm-Features: AcwNN1XwesBjMwTR7nVyOfHazvWEdcWRn6IE55RF21RXQf02dtzp-bwH5tm1dh0
Message-ID: <CANXhq0qtt7U3jKEB4drvSn7gg55nwWm8VFnfY-NRGjBaWVr_MQ@mail.gmail.com>
Subject: Re: [PATCH v1] iommu/riscv: Support 32-bit register accesses
To: David Laight <david.laight.linux@gmail.com>
Cc: Guo Ren <guoren@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	zhangzhanpeng.jasper@bytedance.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	cuiyunhui@bytedance.com, iommu@lists.linux.dev, joro@8bytes.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luxu.kernel@bytedance.com, palmer@dabbelt.com, pjw@kernel.org, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	yuanzhu@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_195222_745657_AC709A17 
X-CRM114-Status: GOOD (  27.10  )
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

T24gRnJpLCBKdW4gMTksIDIwMjYgYXQgMTI6MDLigK9BTSBEYXZpZCBMYWlnaHQKPGRhdmlkLmxh
aWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAxOCBKdW4gMjAyNiAxNzo1
MTozNCArMDgwMAo+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPgo+ID4gSGkg
Vml2aWFuLAo+ID4KPiA+IEFzIG5vdGVkIGluIHRoZSBSSVNDLVYgSU9NTVUgU3BlY2lmaWNhdGlv
biwgQ2hhcHRlciA2Ogo+ID4gPiBXaGV0aGVyIGFuIDgtYnl0ZSBhY2Nlc3MgdG8gYW4gSU9NTVUg
cmVnaXN0ZXIgaXMgc2luZ2xlLWNvcHkgYXRvbWljIGlzIFVOU1BFQ0lGSUVELCBhbmQgc3VjaCBh
biBhY2Nlc3MgbWF5IGFwcGVhciwgaW50ZXJuYWxseSB0byB0aGUgSU9NTVUsIGFzIGlmIHR3byBz
ZXBhcmF0ZSA0LWJ5dGUgYWNjZXNzZXMg4oCUIGZpcnN0IHRvIHRoZSBoaWdoIGhhbGYgYW5kIHNl
Y29uZCB0byB0aGUgbG93IGhhbGYg4oCUIHdlcmUgcGVyZm9ybWVkLgo+ID4KPiA+IFRoZXJlZm9y
ZSwgdGhlIGF0b21pY2l0eSBvZiA2NC1iaXQgTU1JTyBhY2Nlc3NlcyBpcyBVTlNQRUNJRklFRCBh
bmQKPiA+IG5vdCBjbGVhcmx5IGRlZmluZWQgaW4gdGhlIGN1cnJlbnQgcmF0aWZpZWQgUklTQy1W
IElPTU1VCj4gPiBzcGVjaWZpY2F0aW9uLiBUbyBoYW5kbGUgdGhpcyBjb3JyZWN0bHksIHRoZSBM
aW51eCBSSVNDLVYgSU9NTVUgZHJpdmVyCj4gPiBzaG91bGQgZmFsbCBiYWNrIHRvIDMyLWJpdCBN
TUlPIGFjY2Vzc2VzIHdoZW4gcmVhZGluZyA2NC1iaXQgcmVnaXN0ZXJzCj4gPiAoZS5nLiwgcGVy
Zm9ybWFuY2UgY291bnRlcnMpLiBUaGUgYmVoYXZpb3Igb2YgMzItYml0IE1NSU8gYWNjZXNzZXMg
aXMKPiA+IG1vcmUgcHJlY2lzZWx5IGRlZmluZWQgaW4gdGhlIFJJU0MtViBJT01NVSBzcGVjaWZp
Y2F0aW9uLgo+ID4KPiA+IFRodXMsIG1hbnkgaGFyZHdhcmUgdmVuZG9ycyBpbXBsZW1lbnQgMzIt
Yml0IE1NSU8gKHJhdGhlciB0aGFuIDY0LWJpdAo+ID4gTU1JTykgYmFzZWQgb24gdGhlIGN1cnJl
bnQgcmF0aWZpZWQgUklTQy1WIElPTU1VIHNwZWNpZmljYXRpb24sIGFuZAo+ID4gdGhpcyBkcml2
ZXIgZG9lcyBub3QgYXBwZWFyIHRvIGJlbmVmaXQgZnJvbSA2NC1iaXQgTU1JTyBhY2Nlc3MgZWl0
aGVyLgo+ID4gUGVyZm9ybWFuY2UgaXMgZnVuZGFtZW50YWxseSBjb25zdHJhaW5lZCBieSBidXMg
bGF0ZW5jeTsgYXNzdW1pbmcgdGhhdAo+ID4gc2ltcGx5IHJlZHVjaW5nIHRoZSBudW1iZXIgb2Yg
YWNjZXNzZXMgd2lsbCBpbXByb3ZlIHBlcmZvcm1hbmNlIGlzIGFuCj4gPiBvdmVyc2ltcGxpZmlj
YXRpb24gdGhhdCBpZ25vcmVzIHRoZSB1bmRlcmx5aW5nIGhhcmR3YXJlCj4gPiBjaGFyYWN0ZXJp
c3RpY3MuCj4KPiBJZiB0aGUgYnVzIGxhdGVuY3kgaXMgc2lnbmlmaWNhbnQgaXQgaXMgYWxtb3N0
IGNlcnRhaW5seSB3b3J0aCB1c2luZwo+IG1lbW9yeSBhY2Nlc3NlcyB0byBhdm9pZCByZS1yZWFk
aW5nIHRoZSBoaSByZWdpc3Rlci4KPgo+IFNvbWV0aGluZyBsaWtlIHRoaXMgbWlnaHQgd29yazoK
Pgo+IHN0YXRpYyB2b2xhdGlsZSB1MzIgaGlfcHJldiwgbG9fcHJldjsKPgo+ICAgICAgICAgdTMy
IGhpID0gcmVhZF9yZWdfaGkoKTsKPiAgICAgICAgIHUzMiBsbyA9IHJlYWRfcmVnX2xvKCk7Cj4K
PiAgICAgICAgIGlmIChsbyA8PSBsb19wcmV2IHx8IGhpICE9IGhpX3ByZXYpIHsKPiAgICAgICAg
ICAgICAgICAgdTMyIGhpX3RtcCA9IHJlYWRfcmVnX2hpOwo+ICAgICAgICAgICAgICAgICBpZiAo
aGlfdG1wICE9IGhpKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaGkgPSBoaV90bXA7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgbG8gPSAwOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAg
ICAgICAgICAgICAgIGxvX3ByZXYgPSB+MHU7Cj4gICAgICAgICAgICAgICAgIGhpX3ByZXYgPSBo
aTsKPiAgICAgICAgIH0KPiAgICAgICAgIGxvX3ByZXYgPSBsbzsKPiAgICAgICAgIHJldHVybiAo
dTY0KWhpIDw8IDMyIHwgbG87Cj4KCkhpIERhaXZkLAoKSSBpbmNsdWRlZCB0aGlzIGluIG15IHY1
IG9mIHRoZSBJT01NVSBQTVUgc2VyaWVzLCBidXQgd2Ugbm90aWNlZCB0aGF0CnNhc2hpa28tYm90
IEFJIHJlcG9ydGVkIHR3byBpc3N1ZXM6CgoxOiBUaGUgbG9fcHJldiBpcyBpbW1lZGlhdGVseSBv
dmVyd3JpdHRlbjoKVGhlIHRyYWlsaW5nICdwbXUtPmxvX3ByZXZbaWR4XSA9IGxvOycgaXMgb3V0
c2lkZSB0aGUgaWYgYmxvY2sgYW5kCnJ1bnMgdW5jb25kaXRpb25hbGx5LCBzbyB0aGUgJ2xvX3By
ZXYgPSB+MHUnIGlzIGNsb2JiZXJlZCBiZWZvcmUgdGhlCmZ1bmN0aW9uIGV2ZW4gcmV0dXJucy4g
SXQgbmV2ZXIgc3Vydml2ZXMgdG8gdGhlIG5leHQgY2FsbC4gbG9fcHJldgplbmRzIHVwIGhvbGRp
bmcgdGhlIGd1ZXNzZWQgdmFsdWUgKHR5cGljYWxseSAwKSBpbnN0ZWFkLCB3aGljaCBpcyBhCnBl
cmZlY3RseSBvcmRpbmFyeSBzbWFsbCBudW1iZXIsIGFuZCB0aGUgaW50ZW5kZWQgImFsd2F5cyBy
ZS12ZXJpZnkKbmV4dCB0aW1lIiBiZWhhdmlvdXIgbmV2ZXIgaGFwcGVucy4gVGhlIHNlbnRpbmVs
IHdyaXRlIHdhcyBlZmZlY3RpdmVseQpkZWFkIGNvZGUuCgoyOiBUaGUgd3JhcCBjaGVjayBpdHNl
bGYgY2FuIG1pc3MgYSB3cmFwCkhlcmUgaXMgYSBjb25jcmV0ZSBzZXF1ZW5jZS4gQXNzdW1lIGEg
cHJldmlvdXMgY2FsbCBsZWZ0IGhpX3ByZXYgPSAxCmFuZCBsb19wcmV2ID0gNSwgaS5lLiB0aGUg
Y291bnRlciB3YXMgMHgxXzAwMDAwMDA1LiBTb21lIHRpbWUgbGF0ZXIKdGhlIGNvdW50ZXIgaGFz
IGFkdmFuY2VkIGNsb3NlIHRvIDB4MV9GRkZGRkZGRjoKCiAgMS4gaGkgPSByZWFkbChhZGRyICsg
NCkgIC0+IGNvdW50ZXIgaXMgMHgxX0ZGRkZGRkYwLCBzbyBoaSA9IDEKICAyLiB0aGUgY291bnRl
ciBjcm9zc2VzIHRoZSBib3VuZGFyeSBhbmQgYmVjb21lcyAweDJfMDAwMDAwMDgKICAzLiBsbyA9
IHJlYWRsKGFkZHIpICAgICAgLT4gbG8gPSA4CgpUaGUgY2hlY2sgdGhlbiBldmFsdWF0ZXM6Cgog
IGxvICg4KSA8PSBsb19wcmV2ICg1KSAgIC0+IGZhbHNlCiAgaGkgKDEpICE9IGhpX3ByZXYgKDEp
ICAgLT4gZmFsc2UKCkJvdGggYXJlIGZhbHNlLCBzbyB0aGUgZmFzdCBwYXRoIGlzIHRha2VuIGFu
ZCAweDFfMDAwMDAwMDggaXMKcmV0dXJuZWQuIFRoZSB0cnVlIHZhbHVlIGlzIDB4Ml8wMDAwMDAw
OCwgc28gdGhlIHJlc3VsdCBpcyBzaG9ydCBieQoyXjMyIGFuZCB0aGUgdGhpcmQgcmVhZCBvZiB0
aGUgaGlnaCBoYWxmIG5ldmVyIGV2ZW4gZXhlY3V0ZXMuCgpCb3RoIHNpdHVhdGlvbnMgc2hhcmUg
dGhlIHNhbWUgcm9vdCBjYXVzZTogSXQgcHV0cyB0aGUgcmVsaWFibGUgY2hlY2sKKHRoZSB0aGly
ZCByZWFkKSBpbnNpZGUgYW4gaWYgZ3VhcmRlZCBieSB0aGUgdW5yZWxpYWJsZSBjcm9zcy1jYWxs
CmhldXJpc3RpYyAnbG8gPD0gbG9fcHJldiB8fCBoaSAhPSBoaV9wcmV2KScKQ2FzZSAxIGlzIGFu
IGlzc3VlIGluIHRoZSBib29ra2VlcGluZyB0aGF0IGhldXJpc3RpYyBkZXBlbmRzIG9uLCBhbmQK
Y2FzZSAyIHNob3dzIHRoYXQgZXZlbiB3aXRoIGNvcnJlY3QgYm9va2tlZXBpbmcgdGhlIGhldXJp
c3RpYyBpcyBub3QKc291bmQuCgpUbyBtYWtlIGV2ZXJ5dGhpbmcgc2ltcGxlciwgSSB3b3VsZCB1
c2UgeW91ciBmaXJzdCB2ZXJzaW9uIGZvciB0aGUKbGF0ZXN0IElPTU1VIFBNVSBzZXJpZXM6Cgog
ICAgICAgIGhpID0gcmVhZF9oaSgpOwogICAgICAgIGxvID0gcmVhZF9sbygpOwogICAgICAgIGlm
IChoaSAhPSByZWFkX2hpKCkpIHsKICAgICAgICAgICAgICAgIC8vIFBpY2sgYSB2YWx1ZSB0aGF0
IGhhcHBlbmVkIHdoaWxlIGRvaW5nIHRoZSByZWFkcy4KICAgICAgICAgICAgICAgIGhpKys7CiAg
ICAgICAgICAgICAgICBsbyA9IDA7CiAgICAgICAgfQoKPiBJdCBzaG91bGRuJ3QgbmVlZCBhbnkg
bG9ja2luZyBidXQgdGhlIGFjY2Vzc2VzIGRvIG5lZWQgdG8gYmUgb3JkZXJlZC4KPgo+ICAgICAg
ICAgRGF2aWQKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
