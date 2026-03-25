Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC771093163
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 01:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2evWU+vopfbbXacRzH8PCGok+NV0NkVCEuBSXmxN3DM=; b=IgbGkOG05RLBXS
	EFeVVV8MYpyRKQM1iCq0RbzXKI0uwd1IohRBfIG4+HpObGR+lrFwLuwuvyR2apWSqAnJ/dpIREAcx
	eUSGTRhuGlcj7tS6PwjeVy4hQqx2uzDAuo4p/s8dMOlklugolRBF9wtp+DvMeKNs7Sf8GuGjDr6TW
	STEgnHSH4qGtqwEwOs239akosRflBDDyLsynv7HmBLYE4thD2zH8itm1PAXzDnu0tORSA9MtzYzA6
	kO2Dpr+WwWFcxnlPuYFdPlcFZANPwSHh9r1NEYG1Rvmu9gU/ejtQF23XGBdNp4g85qhF1o24LoVEI
	KqQEzXoFARyWDJfL+kbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5D8s-00000002SIR-1mOD;
	Wed, 25 Mar 2026 01:34:42 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5D8o-00000002SHw-3nTy
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 01:34:40 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-467e8aaa865so1075507b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 18:34:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774402474; cv=none;
        d=google.com; s=arc-20240605;
        b=CvoAtTUjtYIna9ump360ZTDjwbCU1MJMbuyvVqiNvrDaYmGFJ2JnS7gO05puGWpDn2
         iV58DcrMJ+pvDIduWFt/w6EwozcKx2UH5Hm928KmZ91LxAsbmV7fRl1aO0CoMl4Ivi6T
         wQviy5whHf/3/PVu3qNGiGY78bvcqvDJ83bTV5i4MmcJhrTXXiwQ0ds3pcld4t5PLJYT
         lM3AX3aBBV2/THsAPejSR9NEYvMYDYyj3uC9olX8yE5BFolLHLiYgbRvvanWRrvAOFH7
         FV3hUJcEZSGjyy0z+wltvt1/eYC2wxVfYWg1aa5xJJrymNEauVclGuZhW+xE8K4fw1Rk
         ECeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nMJSXWHElAalaVGIQXtj4XQ2QzHBElxpVqzpZTWIIiA=;
        fh=/Ntq7/4pfJH/+F6AwEj5H/+YrOnakbA4veVDLKvoZ7Q=;
        b=cgjhFxZWfZfRK2MIMruPqExUDDosySgPz/u4fZVccsgHfCuaYZIFo7BeTzig8/jBpp
         RMrCh8VQOiLaLMcMVXHkifseIdTcEtH0TRn1FnMV+6Vh0LAwQ4kQXYafJOwb3vHXb3Qf
         6Jt5CZOb5cYM1Xv9S9pmyp6+GMYIeRwXuaQugpuRjZ26BQSdwoyDpyTVxUpWx+SZksoz
         fZrsa+NA2Ogbn1HAq7/zPa9Jml4e77z4IsU7Q5zhsL8pQSIg2CFwtfT+owZ6sdWhiOTS
         Cjh4KfyZUVDMPsRDRm2hf+tLR1w/ziJsLt2oQavJsJ+VFTjxIxwWIFKi1tFChgNdugON
         xI7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1774402474; x=1775007274; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMJSXWHElAalaVGIQXtj4XQ2QzHBElxpVqzpZTWIIiA=;
        b=TVDu9xklaNiWKgjKjCT1BzS9PlFOobBl5LrxgGyfuYjIgpPOtQK5PWSPqBhoO+3E6J
         XHBWiq0ObltSpl6zjJrxbSgR16gFNKLG4YGHwv1P7zmFlwEJ9XttOG0ukuS9QniTVR2Z
         27+8JRz6z+qLydAWGRFH5o1yPfZBKhFf9uonflhZkmstwAxYqGlEvj+1MJHXw3yZcE/R
         4JcwLjNTCa8K3MaRdylQ4Dxc+i5VSP1j3QMK6LTBo4qtnDhfqtU86yEHjMuDljFhOUGC
         WFN/mIJ/FyQIHTAMUkNXtGHhwYkyyjHG8xFEYzZY8qTUQnsQdd/BKT4vOXCuJ0crob1f
         P9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774402474; x=1775007274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMJSXWHElAalaVGIQXtj4XQ2QzHBElxpVqzpZTWIIiA=;
        b=s2NJj0qomY2GfZq3s6rBANEDVNoNwrk1rPpmDbZNWIZHsPST5mxTczfs74IKPpW8DL
         WCuew/sa5bnoaL6qNAJHzNaBccZI1DpVBrnMuLqTXLlhWznWnHwWQr5Ri2MZhARHumhR
         vrYc8IIVUlYnFx74IW/o7DxYyMElfsj6vKX73Dj2evUPOSFrJpjLCWOSd3ZMeK2E4YvW
         KfNgCzccc66RJxdv8YV/xPwaP76k8BH5l6QHpq0T8HgcA0/We1rkSJViITWuYzLhdjBg
         H1bGsL6WIY5qZWR2H55BPONNo5YQu5KluL9VLwzkaT2FMdrXC6vvt8bAF2BW0HXWDR37
         jjuA==
X-Forwarded-Encrypted: i=1; AJvYcCWgPoskUKwVDu3mr00g0Fw8JqSjajYkXe6aCh4zzbnm8gblhOVBwMFA9EHrHrnyFnTXu4pdNryv7y0FZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpbeeBpfge3cz7hxtkvZAuDFkNkz0upyePv1Ig6UIcauzL1kVc
	qDTL4davq84+A5lapIZf2/eL16NZSzEg48qIELuOsb6WlhOcPXv6ctgd6UJdM8B6mDtEnV4iXfs
	xOmp6MQDKZ36DDf3Ve6UYb59zVyH4/yEDMgKGAeTqmw==
X-Gm-Gg: ATEYQzzR4DYnfr6+fTsxl93FY14C+FLDWp7IjOmsftHgzbUmRnOKFvyS2aTH9pmOufA
	bfQCqS+lDpIwsbWIIwSyH8xLdFFECQASCwxtY++sVSVmzonD/Djc4SbEdrnVe61owavn+EgONT2
	ULbYT3CM2W+RgG6Fm7jQGiadRZpDiTyuT+utZVpcmqVikkEbxjHUA335bInKGY5VyWqfNpFUX10
	+ikILFagxZdyC2PpO+eY4n9yHySEcpQzAl7F+mRXy7dxlsKq7BYjZix10athiJZhQakp/bZq9I8
	dnYV5o2w5V1LK31fd5cvxK/M
X-Received: by 2002:a05:6808:1786:b0:467:254:ba8 with SMTP id
 5614622812f47-46a5c559a3fmr976022b6e.11.1774402473754; Tue, 24 Mar 2026
 18:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org> <20260128-ssqosid-cbqri-v2-13-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-13-dca586b091b9@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 25 Mar 2026 09:34:22 +0800
X-Gm-Features: AaiRm50-EQhX5eRfy8n3fhONNShK5GtzIxF13pcKegKveCXY8vae28POGPRFJcE
Message-ID: <CAEEQ3wka26n8koB3tErRE=rgE1Bxnn7PDCjnXp2j67gdkp-=Zg@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 13/17] acpi: pptt: Add helper to find a
 cache from id
To: Drew Fustini <fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_183439_437209_90697374 
X-CRM114-Status: GOOD (  24.53  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRHJldywKCk9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBBZGQgZnVuY3Rpb24gdG8gZmluZCB0aGUg
cG9pbnRlciB0byBhbiBpbnN0YW5jZSBvZiBhY3BpX3BwdHRfY2FjaGUuCj4KPiBmaW5kX2FjcGlf
Y2FjaGVfZnJvbV9pZCgpIGlzIGJhc2VkIG9uIGZpbmRfYWNwaV9jYWNoZV9sZXZlbF9mcm9tX2lk
KCkKPiBmcm9tIGNvbW1pdCBjNDE3MDU3MGNjN2YgKCJBQ1BJIC8gUFBUVDogRmluZCBQUFRUIGNh
Y2hlIGxldmVsIGJ5IElEIikgaW4KPiB0aGUgbW9yc2UvbXBhbS9zbmFwc2hvdC92Ni4xNC1yYzEg
YnJhbmNoLgo+Cj4gVE9ETzogZmluZF9hY3BpX2NhY2hlX2xldmVsX2Zyb21faWQoKSBoYXMgY2hh
bmdlZCBzaW5jZSB0aGVuIHNvIHRoaXMKPiBmdW5jdGlvbiBzaG91bGQgYmUgdXBkYXRlZC4gSW4g
YWRkaXRvbiwgdGhlcmUgbWF5IGJlIGEgc2ltcGxlciB3YXkgZm9yCj4gYWNwaV9wYXJzZV9ycXNj
KCkgdGhhbiBhZGRpbmcgdGhpcyBmdW5jdGlvbiB0byBnZXQgYSBwb2ludGVyIHRvCj4gYWNwaV9w
cHR0X2NhY2hlLgo+Cj4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5l
bC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvYWNwaS9wcHR0LmMgIHwgNjMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L2Fj
cGkuaCB8ICA4ICsrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL3BwdHQuYyBiL2RyaXZlcnMvYWNwaS9wcHR0LmMK
PiBpbmRleCBkZTVmOGMwMTgzMzMuLmQxMDAyNjczZGMzOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2FjcGkvcHB0dC5jCj4gKysrIGIvZHJpdmVycy9hY3BpL3BwdHQuYwo+IEBAIC0xMDYzLDMgKzEw
NjMsNjYgQEAgaW50IGFjcGlfcHB0dF9nZXRfY3B1bWFza19mcm9tX2NhY2hlX2lkKHUzMiBjYWNo
ZV9pZCwgY3B1bWFza190ICpjcHVzKQo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+ICsKPiAr
LyoKPiArICogZmluZF9hY3BpX2NhY2hlX2Zyb21faWQoKSBpcyBhZGFwdGVkIGZyb20gZmluZF9h
Y3BpX2NhY2hlX2xldmVsX2Zyb21faWQoKQo+ICsgKiBpbnRyb2R1Y2VkIGJ5IGM0MTcwNTcwY2M3
ZiAoIkFDUEkgLyBQUFRUOiBGaW5kIFBQVFQgY2FjaGUgbGV2ZWwgYnkgSUQiKQo+ICsgKiBpbiB0
aGUgbW9yc2UvbXBhbS9zbmFwc2hvdC92Ni4xNC1yYzEgYnJhbmNoLgo+ICsgKgo+ICsgKiBUT0RP
OiBmaW5kX2FjcGlfY2FjaGVfbGV2ZWxfZnJvbV9pZCgpIGhhcyBjaGFuZ2VkIHNpbmNlIHRoZW4g
c28gdGhpcwo+ICsgKiBmdW5jdGlvbiBzaG91bGQgYmUgdXBkYXRlZC4gSW4gYWRkaXRvbiwgdGhl
cmUgbWF5IGJlIGEgc2ltcGxlciB3YXkgZm9yCj4gKyAqIGFjcGlfcGFyc2VfcnFzYygpIHRoYW4g
YWRkaW5nIHRoaXMgZnVuY3Rpb24gdG8gZ2V0IGEgcG9pbnRlciB0bwo+ICsgKiBhY3BpX3BwdHRf
Y2FjaGUuCj4gKyAqLwo+ICtzdHJ1Y3QgYWNwaV9wcHR0X2NhY2hlICpmaW5kX2FjcGlfY2FjaGVf
ZnJvbV9pZCh1MzIgY2FjaGVfaWQpCj4gK3sKPiArICAgICAgIHUzMiBhY3BpX2NwdV9pZDsKPiAr
ICAgICAgIGFjcGlfc3RhdHVzIHN0YXR1czsKPiArICAgICAgIGludCBsZXZlbCwgY3B1LCBudW1f
bGV2ZWxzOwo+ICsgICAgICAgc3RydWN0IGFjcGlfcHB0dF9jYWNoZSAqY2FjaGU7Cj4gKyAgICAg
ICBzdHJ1Y3QgYWNwaV90YWJsZV9oZWFkZXIgKnRhYmxlOwo+ICsgICAgICAgc3RydWN0IGFjcGlf
cHB0dF9jYWNoZV92MSAqY2FjaGVfdjE7Cj4gKyAgICAgICBzdHJ1Y3QgYWNwaV9wcHR0X3Byb2Nl
c3NvciAqY3B1X25vZGU7Cj4gKwo+ICsgICAgICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQ
SV9TSUdfUFBUVCwgMCwgJnRhYmxlKTsKPiArICAgICAgIGlmIChBQ1BJX0ZBSUxVUkUoc3RhdHVz
KSkgewo+ICsgICAgICAgICAgICAgICBhY3BpX3BwdHRfd2Fybl9taXNzaW5nKCk7Cj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGlmICh0YWJs
ZS0+cmV2aXNpb24gPCAzKSB7Cj4gKyAgICAgICAgICAgICAgIGFjcGlfcHV0X3RhYmxlKHRhYmxl
KTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAg
ICAgZm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkgewo+ICsgICAgICAgICAgICAgICBudW1fbGV2
ZWxzID0gMDsKPiArICAgICAgICAgICAgICAgYWNwaV9jcHVfaWQgPSBnZXRfYWNwaV9pZF9mb3Jf
Y3B1KGNwdSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBjcHVfbm9kZSA9IGFjcGlfZmluZF9wcm9j
ZXNzb3Jfbm9kZSh0YWJsZSwgYWNwaV9jcHVfaWQpOwo+ICsgICAgICAgICAgICAgICBpZiAoIWNw
dV9ub2RlKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwoKYnJlYWsgb3IgY29udGlu
dWU/CgoKPiArICAgICAgICAgICAgICAgbnVtX2xldmVscyA9IGFjcGlfY291bnRfbGV2ZWxzKHRh
YmxlLCBjcHVfbm9kZSwgTlVMTCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBmb3IgKGxldmVsID0g
MTsgbGV2ZWwgPD0gbnVtX2xldmVsczsgbGV2ZWwrKykgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNhY2hlID0gYWNwaV9maW5kX2NhY2hlX25vZGUodGFibGUsIGFjcGlfY3B1X2lkLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQUNQSV9Q
UFRUX0NBQ0hFX1RZUEVfVU5JRklFRCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxldmVsLCAmY3B1X25vZGUpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGlmICghY2FjaGUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY2FjaGVfdjEgPSBBQ1BJX0FE
RF9QVFIoc3RydWN0IGFjcGlfcHB0dF9jYWNoZV92MSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjYWNoZSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yoc3RydWN0IGFjcGlfcHB0dF9jYWNoZSkp
Owo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoY2FjaGUtPmZsYWdzICYgQUNQSV9Q
UFRUX0NBQ0hFX0lEX1ZBTElEICYmCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGNhY2hl
X3YxLT5jYWNoZV9pZCA9PSBjYWNoZV9pZCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYWNwaV9wdXRfdGFibGUodGFibGUpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIGNhY2hlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIH0KPiArICAgICAg
ICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGFjcGlfcHV0X3RhYmxlKHRhYmxl
KTsKPiArICAgICAgIHJldHVybiBOVUxMOwo+ICt9Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvYWNwaS5oIGIvaW5jbHVkZS9saW51eC9hY3BpLmgKPiBpbmRleCBmYmYwYzNhNjVmNTkuLmZl
ZTZhNTA1OWE0NiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2FjcGkuaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvYWNwaS5oCj4gQEAgLTE1NDYsNiArMTU0Niw3IEBAIGludCBmaW5kX2FjcGlf
Y3B1X3RvcG9sb2d5X3BhY2thZ2UodW5zaWduZWQgaW50IGNwdSk7Cj4gIGludCBmaW5kX2FjcGlf
Y3B1X3RvcG9sb2d5X2hldGVyb19pZCh1bnNpZ25lZCBpbnQgY3B1KTsKPiAgdm9pZCBhY3BpX3Bw
dHRfZ2V0X2NwdXNfZnJvbV9jb250YWluZXIodTMyIGFjcGlfY3B1X2lkLCBjcHVtYXNrX3QgKmNw
dXMpOwo+ICBpbnQgZmluZF9hY3BpX2NhY2hlX2xldmVsX2Zyb21faWQodTMyIGNhY2hlX2lkKTsK
PiArc3RydWN0IGFjcGlfcHB0dF9jYWNoZSAqZmluZF9hY3BpX2NhY2hlX2Zyb21faWQodTMyIGNh
Y2hlX2lkKTsKPiAgaW50IGFjcGlfcHB0dF9nZXRfY3B1bWFza19mcm9tX2NhY2hlX2lkKHUzMiBj
YWNoZV9pZCwgY3B1bWFza190ICpjcHVzKTsKPiAgI2Vsc2UKPiAgc3RhdGljIGlubGluZSBpbnQg
YWNwaV9wcHR0X2NwdV9pc190aHJlYWQodW5zaWduZWQgaW50IGNwdSkKPiBAQCAtMTU3MCwxMCAr
MTU3MSwxNyBAQCBzdGF0aWMgaW5saW5lIGludCBmaW5kX2FjcGlfY3B1X3RvcG9sb2d5X2hldGVy
b19pZCh1bnNpZ25lZCBpbnQgY3B1KQo+ICB9Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBhY3BpX3Bw
dHRfZ2V0X2NwdXNfZnJvbV9jb250YWluZXIodTMyIGFjcGlfY3B1X2lkLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1bWFza190ICpjcHVz
KSB7IH0KPiArCj4gIHN0YXRpYyBpbmxpbmUgaW50IGZpbmRfYWNwaV9jYWNoZV9sZXZlbF9mcm9t
X2lkKHUzMiBjYWNoZV9pZCkKPiAgewo+ICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gIH0KPiAr
Cj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGFjcGlfcHB0dF9jYWNoZSAqZmluZF9hY3BpX2NhY2hl
X2Zyb21faWQodTMyIGNhY2hlX2lkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gTlVMTDsKPiArfQo+
ICsKPiAgc3RhdGljIGlubGluZSBpbnQgYWNwaV9wcHR0X2dldF9jcHVtYXNrX2Zyb21fY2FjaGVf
aWQodTMyIGNhY2hlX2lkLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNwdW1hc2tfdCAqY3B1cykKPiAgewo+Cj4gLS0KPiAyLjQzLjAKPgoK
VGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
