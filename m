Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1370FF3ED59
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5OLRDg6Gzzy00D+B0eZF0STveS1xMZRu90igEjMG5k=; b=ga/fhM3F5tMz65
	WA+6bDfIP2cy/Zm6YhFg+L+T60RO8GeotuXA8EvXRQeGjdLDpzrwQizUFy0xhkrK4oOnRvjo4swwB
	PsDwMkwDPrPo/fHTPtbzZuWD2O+zD4bgnuBKGDPFJ4YQpPDZ31uRBsVwsnYGIAD2FqOST6TmZ4Lbf
	Y6xQkhpCh7TMm9pPkAWezHH5H6KBbcqPwY2xVlWOgei1ygKHtjphwgVlaIgMmzkOfFhrYQ650NhuR
	Y9m6eFRB+P3z8xGNonxQOmqLXMgN1ca6G93o4RqhhV+acKnKsDerF5mEl5Gc3V4qJqbhwc9pq/GYt
	O9MwIqga2Gol2kDzoKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbZ8-0000000DeJr-0Ig0;
	Sat, 11 Apr 2026 16:52:14 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbZ4-0000000DeIQ-22yf
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 16:52:12 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6841e6a5e51so1680170eaf.3
        for <linux-riscv@lists.infradead.org>; Sat, 11 Apr 2026 09:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775926329; cv=none;
        d=google.com; s=arc-20240605;
        b=PiFP7BEJiOn3qbyFEz5m6nepWGlB3hSyOF7LpKtoKHZyuWnM6W1pIe/ZY/gANVRGmh
         tLMXWPZC3lQHDyNwloxGEFrEWzdLkys8DGXXhPD1x+1jFRMsBnzX3lW1StZj5lJ6WW6Q
         RitDO35eAcgazGVzzyLR7imnjDZv9s1vmFpbLTyGuiMECJ8cz3OGNVc8+2Jm0SNcJDhI
         Vlm0+XsB4Om13N8kKkPBuG9OQWFjAz3xWBT5+2wUD5pOce+Zd0EN0wz8MNM/JHIdPk+D
         oq7ClIee6NEGJqIM0spSmD+3w7ezYbBNwWhdtchKhhV3ByEGig3K7ao7Yhw9+JIzrKXs
         vLIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FX/lULpKSMagkle3KXgfcJbERn4/bCQpLyp4j5tdJGs=;
        fh=dxHLKykcbhBfeW6Q3evLveRJvkHbLJCDsygxzNjkuPo=;
        b=Nt3w5+xnhjfj3Ugi59nKvwRpVNNzVsF31xtCosFEEWR3jQYfJluM5Myhfm6eP5S+be
         Hnerm3WSFHnZfa4wWLT1AYDPNWkSMet+UJQv9sk9ZGA7WYygMIgZNPvNk4wEPLxBFJeU
         ZW5MVIVHJAkbEVwBOEVkKcd9VjDYixLwaZmJJ52mSayu8vlKLLU/Qa0nBdfDaQVOHY5i
         N4Ah2sLQJg5NCgs/h5TPYFFRCSlOaltEKE/K3hXASn2a8HNnGAgkbC0SbG+v/hshfm2K
         R7aFzUquXy8HUUNDixb7m1WIzjwQlTX/cAqLCkfNADpYTCGpjSy1+MCKJEvlTAGhJd6P
         Dh0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775926329; x=1776531129; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FX/lULpKSMagkle3KXgfcJbERn4/bCQpLyp4j5tdJGs=;
        b=gpSB9stsVwq4GLR5glbABNLCRDsFdQ9HFoNfB3vgKlF6qnG3BEywb1vaMqCxBQEE2v
         L/TTy4m9lwmYFP22xSQ19CdbpRFNkvlJZ0eK/gxTA2dUlxOff75s6bVk6oBk5YmN5MPE
         /R9DMy38ouGAFESVQm/XcmUIc6ve/ZXc9TlC9JeA2SyU+g9nJC2f84EAzLqFvuc/nL2p
         MJqwpKngKRLi5Z1jfU8+AzoU6dQBGaRcTQ9GG/FCABN+qnSbd2HwrYSp/nC9oQVToJu2
         2H9hxct2QL3bFSyxjSlS1BviIo8qhqwlrEt74G/KVcNHxLdrcJ8y8VJq7D484gW6ayDf
         aTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775926329; x=1776531129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FX/lULpKSMagkle3KXgfcJbERn4/bCQpLyp4j5tdJGs=;
        b=OhABGG8XIe+zXrfDLvZBlDz2YgJTMQGQSbqVPfYEZRMPSQkhIjg1okYUayOeF96YKY
         jiDobKNmCpE8OswIYIQF8ILqC5ulh+3X6HctmMR0PxsqybgRXYDP8XKJMVLdAytNKn8H
         KrIJ8fm2hi+H4KR44B2DPQqbcNuAJZM9cFH4bB6GLNBKaLnelLaqTH2Eanb4BKlYTVEG
         XlXPxtFQWkCdGW/13RVXPcIagimq0RV5o78t7gqtbiQjE09xbfJMcqDit9+UztNk0hOm
         HwLUtz4BTmjhbO8BPxaplhrjvisr2f+zvdEMMVXtcD2p0QMrmpQFNrSY1XjC0kSr6HFh
         IKfg==
X-Forwarded-Encrypted: i=1; AJvYcCW4F5f2sbHcmWVDoGqfoLmMxEyCppSNVW7kC3raUe8Mgrsl9V70yLqIC0jXPyOpDlKeIE0Bxisymj/gDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz+QsXVLqQDY4GkBoUFRrqsIpTw/wYmXxtGnk/tVT6ZQoxQ4ov
	HBeA3WINuoPPfxGu+6h/iYmsyBM1g+GcGI6iCNCY//KipVToAJOhrt/RWuYxvS37bObT+3Fygw3
	ygbgVmvmN/8eRf+1OpLGdGIvgAmVOa9Nf9t/piz6Kqw==
X-Gm-Gg: AeBDiess5yHj6339O/VzDblSedqjTI4/CGCLB8QPKnoWSlR6SXgScRESnl0UK6lXClo
	NVB5LAq7Mk1uWauvi6Gy/zRb33dVzCkw8aJcXfLJyyvHDvofcZmDpR3xRQ0izBJXGYO/VcfiuwE
	XRNlyga8FSocf33nKMyqDRqna2Te0rz1zxmrbG38X2g3v9YtsSYPwe0r9BiZkOef8LdEGF87PxG
	kcD4nbP4W9Hd8n4AyIQ+FV/DfSlBCR2Oop+Dek5maCWHVXZTLz8YwrOX2SbeDiKCp0j3NRP2OTm
	KJ4cMb38xxPdaGvS8TvMv7EQVYr3W0M6bf4jQhl21pw3MWcuOo8bQPogF1F9MPgSiPHeJUn6qal
	nTcUBB9brkqYja+8nZQpoqBXLGDSHjRJAxVNZoA==
X-Received: by 2002:a05:6820:62a:b0:67e:313e:22c4 with SMTP id
 006d021491bc7-68be85d32e6mr4077914eaf.47.1775926329262; Sat, 11 Apr 2026
 09:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com> <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 11 Apr 2026 22:21:57 +0530
X-Gm-Features: AQROBzBrpzfznEAFbbO-vdp8iuvh-4Q6CVGLr2K3uMPPDNj279HD1Tp5_HAL7qw
Message-ID: <CAAhSdy3azZ2hiO_zEC4-eu3EfHYeWJh5D5LfihYRkw-2XyYbQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic page table
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com, 
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, guoren@kernel.org, 
	iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_095210_531299_7AD78EFA 
X-CRM114-Status: GOOD (  14.88  )
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

T24gU2F0LCBBcHIgMTEsIDIwMjYgYXQgNzo1MuKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBUaGUgUklTQy1WIElPTU1VIGNhbiBvcHRpb25hbGx5IHN1cHBvcnQgU3ZwYm10
IHBhZ2UtYmFzZWQgbWVtb3J5IHR5cGVzCj4gaW4gaXRzIHBhZ2UgdGFibGUgZm9ybWF0LiBXaGVu
IHByZXNlbnQsdGhlIGdlbmVyaWMgcGFnZSB0YWJsZSBjb2RlIGNhbgo+IHVzZSB0aGlzIGNhcGFi
aWxpdHkgdG8gZW5jb2RlIG1lbW9yeSBhdHRyaWJ1dGVzIChlLmcuIE1NSU8gdnMgbm9ybWFsCj4g
bWVtb3J5KSBpbiBQVEVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVA
bGludXguYWxpYmFiYS5jb20+CgpMb29rcyBnb29kIGZyb20gUklTQy1WIHBlcnNwZWN0aXZlLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApB
bnVwCgoKPiAtLS0KPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jICAgICAgIHwgMiArKwo+
ICBpbmNsdWRlL2xpbnV4L2dlbmVyaWNfcHQvY29tbW9uLmggfCAxICsKPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2
L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiBpbmRleCBjN2QwMzQyYWE3
NDcuLmU1Mzg4MzkzNTU2MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiBAQCAtMTE5NCw2ICsxMTk0
LDggQEAgc3RhdGljIHN0cnVjdCBpb21tdV9kb21haW4gKnJpc2N2X2lvbW11X2FsbG9jX3BhZ2lu
Z19kb21haW4oc3RydWN0IGRldmljZSAqZGV2KQo+ICAgICAgICAgY2ZnLmNvbW1vbi5mZWF0dXJl
cyA9IEJJVChQVF9GRUFUX1NJR05fRVhURU5EKSB8Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQklUKFBUX0ZFQVRfRkxVU0hfUkFOR0UpIHwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBCSVQoUFRfRkVBVF9SSVNDVl9TVk5BUE9UXzY0Syk7Cj4gKyAgICAgICBpZiAoaW9t
bXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfU1ZQQk1UKQo+ICsgICAgICAgICAg
ICAgICBjZmcuY29tbW9uLmZlYXR1cmVzIHw9IEJJVChQVF9GRUFUX1JJU0NWX1NWUEJNVCk7Cj4g
ICAgICAgICBkb21haW4tPnJpc2N2cHQuaW9tbXUubmlkID0gZGV2X3RvX25vZGUoaW9tbXUtPmRl
dik7Cj4gICAgICAgICBkb21haW4tPmRvbWFpbi5vcHMgPSAmcmlzY3ZfaW9tbXVfcGFnaW5nX2Rv
bWFpbl9vcHM7Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0L2NvbW1v
bi5oIGIvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0L2NvbW1vbi5oCj4gaW5kZXggZmM1ZDBiNWVk
YWRjLi5kZmFkZjhhNTc1MmEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0
L2NvbW1vbi5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0L2NvbW1vbi5oCj4gQEAg
LTE4OCw2ICsxODgsNyBAQCBlbnVtIHsKPiAgICAgICAgICAqIFN1cHBvcnQgdGhlIDY0ayBjb250
aWd1b3VzIHBhZ2Ugc2l6ZSBmb2xsb3dpbmcgdGhlIFN2bmFwb3QgZXh0ZW5zaW9uLgo+ICAgICAg
ICAgICovCj4gICAgICAgICBQVF9GRUFUX1JJU0NWX1NWTkFQT1RfNjRLID0gUFRfRkVBVF9GTVRf
U1RBUlQsCj4gKyAgICAgICBQVF9GRUFUX1JJU0NWX1NWUEJNVCwKPgo+ICB9Owo+Cj4gLS0KPiAy
LjUwLjEKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
