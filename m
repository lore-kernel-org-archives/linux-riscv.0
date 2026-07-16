Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B3FC44507
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 03:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tfuxQg9jvfMMmtUaMkDIAQBJ1VPHpnIfUIwNsWXcRkc=; b=12yh8atnv6V0l3
	Xp1KF/Hr34XVG25lN1z+iDUuk3GIGnb+OVKe+tWM02IvTOBy0Wp4LhNZQbdJAEIFs74H/r7nk221Z
	wmlWubM1g7uNjKwl68zGz2UGEsSU46J5Wg3I+jCHU76CfrY3PYy1IsnnjdUdg1lPOQTLcPjUD/AXJ
	VhAnheR7/2USGnkEfHyPc02Ha015TxOfbxfL3JQXKgghkheoglSVZUXTIHBH0l30WPnkCzzAZnMTm
	GoGDpCpdhY6oy/VdkEXIVDiCGRPuovitXMm3RJhAyKUbAOfDqNBNGG7wzuYPmhZnGT8K003KdIACr
	hpmWbfi5J5wdMM3CKCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCXk-0000000GKU2-1TiU;
	Thu, 16 Jul 2026 03:13:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkCXh-0000000GKTI-1LhA
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 03:13:46 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso11159748a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 20:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784171619; cv=none;
        d=google.com; s=arc-20260327;
        b=WAEN77kgRYibPAwHHEumVeuz26UE+64u5uOr7C2w4rrNtiAhTXVhkY6IcTlAPW9uu6
         /77Vs4IHAd3OaJGt+pcWvFNnZgiZFMMwkmFMbVJrTmyf37INNN5SvXF8isaVcaf1g1HI
         UqykJPUOIDBEo+lCDzm6xkklF9FmSfo0pQqXgHZK4Rrw6vVnqMkJtuoR8JwmY1jxidHL
         7GJtVgIHYsnW54Gon78qi8ze044AaSA6E4Fc02JxeOvp2oBc6wh0ywnXt2Cq+Cbm4SuM
         vpJcAdfS9q5Wq59Nq6VSMOZqVDMKxsXdeXOM5/TSQCowKcre9fRF7QTebKfMsu/v5sIU
         INEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UM2OezOyRvHBevtE0lxLMLuRathg1UInDTjZPXP8nn0=;
        fh=B6pOtXjGihcOhOjLB2cQi3kG3OOuDFtk9OneGt+tj5M=;
        b=fbiA1omaSkWUBtIhYF5kS7vEeL3TJa6w2sCAdgIDthZQZE02JMW4HKsATJHorxxrv+
         rNHWN8IKDxQbEDsIs+LAetZatQ6C/QLa2u6Mt0GC0+3W6S+hFAfCUxDlbE2QzI48/C/s
         3wMw5vAOs7w2ilLXymrzrJKnSINLZd6OVFp7/ax1wTwE+yhBg6gvdMG3++hi0/+9cQbs
         6evTwIiyU4icIJQnZ1dVheesfXHWtdU9ChaUwkweyQsCmNfOiqIiw2+/22TwhicAiNlr
         UmvA59+d1YZcuw3DeWXhzflggZH6zHGdz8kHljyJgE2ZXOatnatPdLqrlOfS+Ln0Ohlg
         ukJw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784171619; x=1784776419; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UM2OezOyRvHBevtE0lxLMLuRathg1UInDTjZPXP8nn0=;
        b=fkZz1BcBnGPo7vt7S+xsiQ0mZcf1f7yRcK+/kXCsJu5p4uFXCY7mWnP0MxUAkEB8Z2
         36DtkT9wWnMr4S797vdhMAFiUJLjAzgEd8vRV1ROhEOlfK2QEyXsPlF0ZkQKSgpf2fHx
         uJuJ98c7GQnSOl3qBh3IxohQ/R7T6eB+csJVGN/kUF4a5TLTxk4vTsjGqj2cQv1fWCJc
         3jBalmt2e7NRk4atR20voXIdj54n4kJeMPw2XSrjJdq7YXTH3G0AH7epBHTrDIHJGLHs
         cqDeogP79UafxX0jrryvd2pyLpt6milWjlLKR9G+khIPVJeAIfy3RRxtGdeWVysZ1AkN
         6mBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784171619; x=1784776419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UM2OezOyRvHBevtE0lxLMLuRathg1UInDTjZPXP8nn0=;
        b=TfeKbtlH3ijM+dIXSb9FI5jQftBBzIMkLp3Rk2tEd14LC5OxRapqBXRyHz6hMEd+Gs
         BCj38XHr/7qsXVdnVJdF5WksgbkRfMHcjWZZ573EfOPoK+GJuSJN1Dq46CQcrV6x8EB2
         vvM5uwLKaGwtxGMJCr/NDardlvU1HLgSpJmzrap/VoFC4pGJ/Oh62EDRMrdWtr8nOQ6r
         nTD2mOBPx0vvxjk34OKm5GFxCXCpgyxvnPLPiq0iCJ0aRSw/lsblaXYEkgEWYU4kjuWb
         ymntrLOf5Iijfp5sFaDJ5t7/Jox9ZSwsmjFdJSq1UG6uslc8sWML8l+lRTC8N+8pOBT1
         oOeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3kpUcSd1J0IkvjaCH+rLL8ShGERgOddnF4OO4g8IEocYkouvgd8DN2Rw2PEV0dmZboygGyXNUGONbEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqxtPLPlkmYgNeQznWD9SKtcEb/hSKVMAOgWw+Uq0pqnFsKcRV
	1vATHU4YjJHOLLeSF4MmmkzI9bFfiR0ZP6yVdMV7j5KmUc+QteEmVUfY8qas5ReRJ0wypR+LZZW
	6aD6AE9IpXJnfBc45vcO5jX7ZPngUkewXOqdVYwcyAw==
X-Gm-Gg: AfdE7ck3bghoesFJN/a2wPL6e9g0yAfxp5Qztp+zelxYBGt8b5A/L2ygPxT+FU3aZnK
	nwCuQqPhufsz44GngxYh7kgAnsaY1lfg5A9n9wL/VXKm1RCxBDYzK2zMtQ32TMNZiql56tzQKvI
	f+Gnv4UQP5Io+NDaefkrO7FB5ez4bEA35Ua7zjCkFM7/jdyOwHQ1B8Xr4wCYZ3odOL+Rt8UxLeG
	RS4PQQev/KFCLAMSaZCBEbMkfEw1poaGgaSKLarrqFZfEQL3xNcIa7h/Q0DSGKr
X-Received: by 2002:a05:6402:d0e:b0:697:d475:9692 with SMTP id
 4fb4d7f45d1cf-69cd2a0067cmr5743576a12.11.1784171619065; Wed, 15 Jul 2026
 20:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260713122903.9458-1-zhangzhanpeng.jasper@bytedance.com>
 <3591a185-d0b5-4cb0-a0d5-ae9608a4e244@arm.com> <CAJF2gTT7TPA+K+JgkvvUtb0x5BSzfox+s5rG8OtrP0QzPetHFw@mail.gmail.com>
 <20260715094305.2783-1-cp0613@linux.alibaba.com>
In-Reply-To: <20260715094305.2783-1-cp0613@linux.alibaba.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 16 Jul 2026 11:13:28 +0800
X-Gm-Features: AUfX_mwSlLuBkXLYWkCx82Cd69Su-eA8XLoXsfXduJDZmMHngIn0tQiburCm1Ms
Message-ID: <CANXhq0pvrXDJyE_dA-3z2tHnVndvxOm7kLRvnF9T+_r8cUHXug@mail.gmail.com>
Subject: Re: [PATCH v3] iommu/riscv: Use 32-bit MMIO accesses for 64-bit registers
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: Guo Ren <guoren@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
	Tomasz Jeznach <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Laight <david.laight.linux@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	cuiyunhui@bytedance.com, yuanzhu@bytedance.com, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_201345_581234_B0858BFF 
X-CRM114-Status: GOOD (  22.80  )
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

T24gV2VkLCBKdWwgMTUsIDIwMjYgYXQgNTo0M+KAr1BNIENoZW4gUGVpIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBKdWwgMTQsIDIwMjYgYXQgMDk6NTU6MTlQ
TSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IFRoZSBzcGVjaWZpY2F0aW9uIGlzIGRlbGliZXJh
dGVseSBwcmVjaXNlLiBJdCB1c2VzICJtYXkiLCBub3QgInNoYWxsIgo+ID4gb3IgIm11c3QiLiBX
ZSBzaG91bGQgbm90IGludHJvZHVjZSBzcGVjdWxhdGl2ZSBpbXBsaWNhdGlvbnMgdGhhdCBicmVh
awo+ID4gdGhlIHNwZWMncyBjb25zaXN0ZW5jeSBvbiBSVjMyLiBUaGUgc2FmZSBhbmQgcG9ydGFi
bGUgaW50ZXJwcmV0YXRpb24KPiA+IGlzIHRoYXQgc29mdHdhcmUgaXMgZXhwbGljaXRseSBhbGxv
d2VkIHRvIHVzZSAzMi1iaXQgYWNjZXNzZXMgZm9yCj4gPiB0aGVzZSByZWdpc3RlcnMgb24gYW55
IHN5c3RlbSwgd2hpY2ggaXMgZXhhY3RseSB3aGF0IHRoaXMgcGF0Y2ggZG9lcy4KPgo+IFRoZSBS
VjMyIGFyZ3VtZW50IGlzIHF1aXRlIGNvbXBlbGxpbmcuIFRoZSBSSVNDLVYgSU9NTVUgaXMgYQo+
IHBsYXRmb3JtLWxldmVsIElQIHRoYXQgbXVzdCBzZXJ2ZSBib3RoIFJWMzIgYW5kIFJWNjQgc29m
dHdhcmUgc3RhY2tzLgo+IE1hbmRhdGluZyA2NC1iaXQgTU1JTyBhY2Nlc3NlcyB3b3VsZCBkaXJl
Y3RseSBjb25mbGljdCB3aXRoIFJWMzIsIHdoZXJlCj4gc3VjaCBhY2Nlc3NlcyBhcmUgaW1wb3Nz
aWJsZSDigJQgc28gYW55IGludGVycHJldGF0aW9uIHRoYXQgdHVybnMgIm1heSBiZQo+IGFjY2Vz
c2VkIHVzaW5nIGVpdGhlciBhIDMyLWJpdCBvciBhIDY0LWJpdCBhY2Nlc3MiIGludG8gYW4gaW1w
bGljaXQKPiBoYXJkd2FyZSByZXF1aXJlbWVudCBmb3IgNjQtYml0IGFjY2Vzc2VzIGJyZWFrcyB0
aGUgc3BlYydzIG93bgo+IGNvbnNpc3RlbmN5IG9uIFJWMzIuCj4KPiBUaGUgUkZDIDIxMTkgYXJn
dW1lbnQgaXMgZXF1YWxseSBzdHJvbmcuIEluIFJGQyAyMTE5IHRlcm1zLCAiTUFZIiBtZWFucwo+
IGFuIGl0ZW0gaXMgdHJ1bHkgb3B0aW9uYWwg4oCUIGEgc3BlY2lmaWNhdGlvbiBzaG91bGQgZXhw
cmVzcyBvYmxpZ2F0aW9ucwo+IHRocm91Z2ggdGhlc2Ugd2VsbC1kZWZpbmVkIG5vcm1hdGl2ZSBr
ZXl3b3Jkcywgbm90IGxlYXZlIHRoZW0gdG8gYmUKPiBpbmZlcnJlZCBmcm9tIGV2ZXJ5ZGF5LWxh
bmd1YWdlIGludHVpdGlvbi4gSWYgdGhlIHNwZWMgYXV0aG9ycyBoYWQKPiBpbnRlbmRlZCB0byBy
ZXF1aXJlIGhhcmR3YXJlIHRvIHN1cHBvcnQgNjQtYml0IGFjY2Vzc2VzLCB0aGV5IHdvdWxkIGhh
dmUKPiBzYWlkICJtdXN0IiBvciAic2hhbGwiLgo+Cj4gR2l2ZW4gYm90aCBwb2ludHMsIHRyZWF0
aW5nIDMyLWJpdCBNTUlPIGFjY2Vzc2VzIGFzIHRoZSBkZWZhdWx0IGZvciB0aGUKPiBSSVNDLVYg
SU9NTVUgZHJpdmVyIGlzIHRoZSBzYWZlLCBwb3J0YWJsZSwgYW5kIG1vcmUgaW5jbHVzaXZlIGNo
b2ljZTogaXQKPiBpcyBleHBsaWNpdGx5IHBlcm1pdHRlZCBvbiBldmVyeSBjb25mb3JtYW50IGlt
cGxlbWVudGF0aW9uLCB3aGVyZWFzCj4gNjQtYml0IGFjY2VzcyBhdG9taWNpdHkgaXMgbGVmdCB1
bnNwZWNpZmllZC4KPgo+IEFja2VkLWJ5OiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEu
Y29tPgo+CgpJdCBzZWVtcyB0aGF0IHdlIG1pZ2h0IG5vdCBuZWVkIHRvIHdvcnJ5IGFib3V0IFJW
MzIuIFRoZQppby02NC1ub25hdG9taWMtaGktbG8uaCBoZWFkZXIgd2lsbCBhdXRvbWF0aWNhbGx5
IHJlcGxhY2Ugd3JpdGVxL3JlYWRxCndpdGggaGlfbG9fd3JpdGVxL3JlYWRxIGluIFJWMzIgYnVp
bGQuIFRoZXJlZm9yZSwgcGVyaGFwcyB3ZSBjYW4ganVzdApmb2N1cyBvdXIgZGlzY3Vzc2lvbiBv
biBSVjY0OiB3aGV0aGVyIHRoZSBkcml2ZXIgc2hvdWxkIHVzZQpyZWFkcS93cml0ZXEgdG8gYWNj
ZXNzIDY0LWJpdCByZWdpc3RlcnMgb24gUlY2NCBzeXN0ZW1zLgoKQWN0dWFsbHksIGluIG15IHBy
ZXZpb3VzIElPTU1VIFBNVSBzZXJpZXMsIEkgc2hhcmVkIGEgc2ltaWxhciB2aWV3IHRvIFJvYmlu
J3M6CiJSZXZpc2l0aW5nIHRoZSBzcGVjIHJlZ2FyZGluZyB0aGUgVU5TUEVDSUZJRUQgOC1ieXRl
IGF0b21pYyBhY2Nlc3MsCnRoaXMgbWlnaHQgaW1wbHkgdGhhdCB0aGUgaGFyZHdhcmUgaXRzZWxm
IHdpbGwgaGFuZGxlIHRoZSBzcGxpdCBpbnRvCnR3byA0LWJ5dGUgYWNjZXNzZXMgYW5kIGludGVy
bmFsbHkgbWFuYWdlIGl0cyBvd24gdHJpZ2dlciBsb2dpYy4KQmVjYXVzZSBvZiB0aGlzLCBmb3Ig
UlY2NCBzeXN0ZW1zLCBzb2Z0d2FyZSBtaWdodCBzaW1wbHkgdXNlIHN0YW5kYXJkCjgtYnl0ZSB3
cml0ZXMgKGUuZy4sIHdyaXRlcSkuIERlbGVnYXRpbmcgdGhlIGFjY2VzcyBoYW5kbGluZyB0byB0
aGUKaGFyZHdhcmUgaXMgbGlrZWx5IHRoZSBiZXN0IHdheSB0byBtYXhpbWl6ZSBjb21wYXRpYmls
aXR5IGFjcm9zcyBhbGwKdmVuZG9yIGltcGxlbWVudGF0aW9ucy4iCk1vcmUgZGV0YWlsczogaHR0
cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNjdi8yMDI2LUp1bHkv
MDk0MDk5Lmh0bWwKCkkgYWxzbyBjaGVja2VkIHRoZSBHaXRIdWIgZGlzY3Vzc2lvbnMuIFRoZSBJ
T01NVSBzcGVjIGF1dGhvciBzZWVtcyB0bwpoYXZlIGNsYXJpZmllZCB0aGF0IHRoZSBoYXJkd2Fy
ZSBzaG91bGQgYmUgYWJsZSB0byBoYW5kbGUgbmF0dXJhbGx5CmFsaWduZWQgNjQtYml0IGFjY2Vz
c2VzIGZyb20gdGhlIHNvZnR3YXJlLgpNb3JlIGRldGFpbHM6IGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi1ub24taXNhL3Jpc2N2LWlvbW11L2lzc3Vlcy83NjUKCkZyb20gbXkgcGVyc3BlY3RpdmUs
IHNpbmNlIHRoZSBhdXRob3IgaGFzIGFscmVhZHkgY2xhcmlmaWVkIHRoZQppbnRlbnQsIGl0IG1p
Z2h0IGJlIGJldHRlciBmb3IgdXMgdG8gZm9jdXMgb24gaW1wcm92aW5nIGFuZCB1cGRhdGluZwp0
aGUgc3BlYyB0byBtYWtlIGl0IGNsZWFyZXIuIFRoaXMgY291bGQgYmUgYSBiZXR0ZXIgYXBwcm9h
Y2ggdGhhbgpjaGFuZ2luZyB0aGUgZHJpdmVyIHRvIGZpdCBhbiB1bmNsZWFyIHNwZWMuCldoYXQg
ZG9lcyBldmVyeW9uZSB0aGluayBhYm91dCB0aGlzPyBJZiB3ZSBhbGwgYWdyZWUsIEkgd291bGQg
YmUgaGFwcHkKdG8gc2VuZCBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBJT01NVSBQTVUgc2VyaWVzIHVz
aW5nIDY0LWJpdCBhY2Nlc3NlcwphZ2FpbiBmb3IgUlY2NC4KCj4gVGhhbmtzLAo+IFBlaQo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
