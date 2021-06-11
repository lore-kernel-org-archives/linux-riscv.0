Return-Path: <SRS0=LC3o=LF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77A8C48BDF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 00:53:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7569561357
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 00:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7569561357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6vEDtH0JcxZWGu4oQ0mlxlZH9QLgPfmiN5/+ZmbtdHo=; b=Ki7bwIAa2m+xwHSXYI6D8mhFN2
	A4IDE3MLZXHSKhqG1wQbeQobpyUchG5uBifKheFWG7XbyNFh10m6zlvyfjhYPHg+JxcG1ZCSFqYWw
	dpKg01hypi7vn5AiEnBenHJRzlJ6zwv+6a/HWk50Dqwe/VeFqdKFVQYr0uD21xUrRR+M793xGGi+h
	1CTAgCmvezkT/6WmXTsUzasTtUlazNxcVlJRY90PyOJTrFg5LGSZiAzXauK8x8UXVskZpYe/Cr6a8
	WzjrGfaXUNk7A3RVHyZYphRQbJL05bvlr2pGHcVeR2UsusKGt5UODYFh9Wcj8OxfVYP/EUhmhgYLQ
	BabUrbcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrVQe-003489-8L; Fri, 11 Jun 2021 00:53:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrVQa-0033bP-LF
 for linux-riscv@lists.infradead.org; Fri, 11 Jun 2021 00:53:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id v11so1952591ply.6
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jun 2021 17:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aZNT3kL4iWZvfY4I/7vWnUNWgnDCeU2L8iX660hLjpI=;
 b=txhSEsqEx0yBEULxHzcBLHV8fMe/03mn5SuB58L2XBXArQlbBBfMHP62mLkvCWeVxb
 pLqoMAgr7jrDgF4kmVC0sIPik4BJXO99+fGWNjMnk7R6LIxSSG8oDloUeW2PfTk7O7L8
 6v4nG8+Q84p2vVQYvXe+vFbFlJz9wlZppcFU+mZS0XRvafuKtSkqvexjIpNk/r0mfMIy
 EdKQ6rwQzxLeh/ovnQC/3pmOLognUXL93AktlD9wInPcU3T+4g3rE5GUqOgQPHpXnAYW
 VGubjevJ0MZBD9K6RrnLVyGkU6Y15j9rnChf39Ka/KD8EvgQEecF2rEoBqZrKzNuaoRC
 i4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aZNT3kL4iWZvfY4I/7vWnUNWgnDCeU2L8iX660hLjpI=;
 b=L5q5rk6CnobPJuz3kge5wKpFerxgYPm2pL6g3DSFYxh66edNCMSRFLr1CBov3W6i/5
 T/9gSEnRrR5Qes6QzIawizkCMzLOrmbxj3TTJua6Nfe+vwiDWv/ratYkNaRM6hXqgfBG
 mgROw9RgGgk0SrANv7fHttt76UiZP8aH+9xFr6Nkf9TT4hco45EhPs+OWJBxwhcPLrXR
 3g6blIb3JvYyuMtu5QOgRBQkbpkAJzeOV2anZlYhJcwdtA3SeR0s5Ygqu2c/Wl4PDccJ
 i90RP/vin3fowRdDSJpFwTiNlgmL9EiV409qE44nfWP64zfegn6h3Q0yw7tBAWMofprn
 BBdg==
X-Gm-Message-State: AOAM533Xh7v8Q8n0YuJZECehAUCRd9pjHIx8DvueMCVnZvzdY/hco7Br
 iJvd7T2BEZPA3mwehgSDb3agOQ==
X-Google-Smtp-Source: ABdhPJyq9FrCShS23Llbd5PD5b1xuqmIo2d7fvh50y+aXFphhMIQ1G24RqPCN8fivd7Wyc++cTajHg==
X-Received: by 2002:a17:90a:650b:: with SMTP id
 i11mr1580828pjj.39.1623372697167; 
 Thu, 10 Jun 2021 17:51:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t1sm3512162pjs.20.2021.06.10.17.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 17:51:36 -0700 (PDT)
Date: Thu, 10 Jun 2021 17:51:36 -0700 (PDT)
X-Google-Original-Date: Thu, 10 Jun 2021 16:30:08 PDT (-0700)
Subject: Re: [PATCH] riscv: xip: support runtime trap patching
In-Reply-To: <CAM4kBBKL0D0cvHaNTt2DobbUROp1eGAfmNkakOqzgakEZDLYbA@mail.gmail.com>
CC: alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, nico@fluxnic.net
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vitaly.wool@konsulko.com
Message-ID: <mhng-3991ff14-95d8-4d36-b2f5-bed51f109380@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_175340_725922_135BEE5B 
X-CRM114-Status: GOOD (  27.39  )
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

T24gRnJpLCAwNCBKdW4gMjAyMSAwMjo1Mjo0MCBQRFQgKC0wNzAwKSwgdml0YWx5Lndvb2xAa29u
c3Vsa28uY29tIHdyb3RlOgo+IEhpIEFsZXgsCj4KPiBPbiBGcmksIEp1biA0LCAyMDIxIGF0IDEx
OjM1IEFNIEFsZXggR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Pgo+PiBMZSAzMS8wNS8y
MDIxIMOgIDE3OjE3LCBBbGV4IEdoaXRpIGEgw6ljcml0IDoKPj4gPiBIaSBWaXRhbHksCj4+ID4K
Pj4gPiBMZSAzMS8wNS8yMDIxIMOgIDEwOjUzLCBWaXRhbHkgV29vbCBhIMOpY3JpdCA6Cj4+ID4+
IFJJU0NWX0VSUkFUQV9BTFRFUk5BVElWRSBwYXRjaGVzIHRleHQgYXQgcnVudGltZSB3aGljaCBp
cyBjdXJyZW50bHkKPj4gPj4gbm90IHBvc3NpYmxlIHdoZW4gdGhlIGtlcm5lbCBpcyBleGVjdXRl
ZCBmcm9tIHRoZSBmbGFzaCBpbiBYSVAgbW9kZS4KPj4gPj4gU2luY2UgcnVudGltZSBwYXRjaGlu
ZyBjb25jZXJucyBvbmx5IHRyYXBzIGF0IHRoZSBtb21lbnQsIGxldCdzIGp1c3QKPj4gPj4gaGF2
ZSBhbGwgdGhlIHRyYXBzIHJlc2lkZSBpbiBSQU0gYW55d2F5IGlmIFJJU0NWX0VSUkFUQV9BTFRF
Uk5BVElWRQo+PiA+PiBpcyBzZXQuIFRodXMsIHRoZXNlIGZ1bmN0aW9ucyB3aWxsIGJlIHBhdGNo
LWFibGUgZXZlbiB3aGVuIHRoZSAudGV4dAo+PiA+PiBzZWN0aW9uIGlzIGluIGZsYXNoLgo+PiA+
Pgo+PiA+Cj4+ID4gVGhpcyBzb3VuZHMgbGlrZSBhIGdvb2QgZml4IGZvciBzaWZpdmUgcGxhdGZv
cm1zIHRvIHdvcmsgd2l0aCBYSVAga2VybmVsCj4+ID4gaW4gNS4xMzogZGlkIHlvdSB0ZXN0IHRo
YXQgaXQgYWN0dWFsbHkgd29ya3Mgb24gSFc/Cj4+ID4KPj4gPj4gU2lnbmVkLW9mZi1ieTogVml0
YWx5IFdvb2wgPHZpdGFseS53b29sQGtvbnN1bGtvLmNvbT4KPj4gPj4gLS0tCj4+ID4+ICAgYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAgfCAxMyArKysrKysrKystLS0tCj4+ID4+
ICAgYXJjaC9yaXNjdi9rZXJuZWwvdm1saW51eC14aXAubGRzLlMgfCAxNSArKysrKysrKysrKysr
Ky0KPj4gPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4+ID4+Cj4+ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+PiA+PiBpbmRleCAwNzIxYjk3OTg1OTUuLjdiYzg4
ZDhhYWI5NyAxMDA2NDQKPj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+PiA+
PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+ID4+IEBAIC04Niw4ICs4NiwxMyBA
QCBzdGF0aWMgdm9pZCBkb190cmFwX2Vycm9yKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBpbnQKPj4g
Pj4gc2lnbm8sIGludCBjb2RlLAo+PiA+PiAgICAgICB9Cj4+ID4+ICAgfQo+PiA+PiArI2lmIGRl
ZmluZWQgKENPTkZJR19YSVBfS0VSTkVMKSAmJiBkZWZpbmVkCj4+ID4+IChDT05GSUdfUklTQ1Zf
RVJSQVRBX0FMVEVSTkFUSVZFKQo+PiA+PiArI2RlZmluZSBfX3RyYXBfc2VjdGlvbiAgICAgICAg
X19zZWN0aW9uKCIueGlwLnRyYXBzIikKPj4gPj4gKyNlbHNlCj4+ID4+ICsjZGVmaW5lIF9fdHJh
cF9zZWN0aW9uCj4+ID4+ICsjZW5kaWYKPj4gPgo+PiA+IE1heWJlIHdlIGNvdWxkIGRvIHNvbWV0
aGluZyBtb3JlIGdlbmVyaWMuIEF0IHRoZSBtb21lbnQsIG9ubHkgdHJhcHMgYXJlCj4+ID4gc3Vi
amVjdCB0byBhbHRlcm5hdGl2ZXMgYnV0IHRoYXQgd2lsbCBsaWtlbHkgZXhwYW5kOiB3aGF0IGFi
b3V0IHJhdGhlcgo+PiA+IGRlZmluaW5nIGEgc2VjdGlvbiBjYWxsZWQgX19hbHRlcm5hdGl2ZV9z
ZWN0aW9uPwo+Pgo+PiBBbnkgdGhvdWdodHMgYWJvdXQgdGhhdD8KPgo+IE9oIHNvcnJ5LCBJIGhh
dmUgb3Zlcmxvb2tlZCB0aGlzLiBJIGRvIGFncmVlIHRoaXMgaXMgdGhlIHdheSB0byBnbwo+IGxv
bmcgdGVybSwgSSBqdXN0IHdhbnRlZCB0byBkbyBhIHJlYXNvbmFibHkgZ29vZCBxdWljayBmaXgg
c2luY2UgdGhlCj4gZGVmYXVsdCBTaUZpdmUgY29uZmlndXJhdGlvbiB3b24ndCBldmVuIGJ1aWxk
IHdpdGggQ09ORklHX1hJUCBlbmFibGVkLgo+IFNvIEkgd291bGQgcHJvYmFibHkganVzdCBzdWdn
ZXN0IHRvIHRha2UgdGhlIGV4aXN0aW5nIHNvbHV0aW9uIGFuZAo+IHRoZW4gdGhpbmsgb3ZlciB0
aGUgZGV0YWlscyAoZS4gZy4gc2hvdWxkIHdlIGp1c3QgdXNlIG9uZSAiYWx0ZXJuYXRpdmUKPiBz
ZWN0aW9uIiBmb3IgYm90aCB0aGUgZnVuY3Rpb25zIGFuZCB0aGUgdGFibGUgb3IgaGF2ZSBzZXBh
cmF0ZSBvbmVzPykKPiBmb3IgdGhlIGdlbmVyaWMgc29sdXRpb24uCgpJJ3ZlIHRha2VuIHRoaXMg
b24gZml4ZXMuICBJdCdzIGZpeGluZyBhIGJ1ZyBhbmQgc2hvdWxkIGJlIHByZXR0eSBzYWZlLCAK
c2luY2UgaXQgb25seSBoYXMgYW55IGVmZmVjdCBvbiBYSVAga2VybmVscy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
