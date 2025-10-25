Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E90CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3BjbKL2Z5wSk6yS8P9jLPuLIL+NzHIolz/NItkSWto=; b=e324t7CYYxGlCK
	8bmfK7fW55mPtAAU4OlXrDdGUD5V+IQqUW8GtFfwDogItG2dKBtCAYuYob95rdcmfLPICn90+7vjZ
	dHHLf4R/xaJqCqU/a7tzfgUDwa20nTG/9xSzX6xgtCwnUJs9A+gPaTy50d2ZDR/T535r9VM9ymQIL
	pdceGEZg9BRzRml+btgnu0DGmyLXRwzUGaDS8WW/8RL4/3nOv9/UT2bzLBzMGw0UARl3XYFCWUH/o
	CMv7XXOdpfHgRK0fIYXM9yMbxTz64ZkRN3ZJtut0KT9KvdL4Yg1Pxc87vhsPMply26xMHABWNGVwy
	V3sr7kcMpr5Q01TInHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCfy4-0000000BNop-1ZnL;
	Sat, 25 Oct 2025 15:14:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCfy2-0000000BNoS-2txE
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 15:14:07 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b4539dddd99so644493166b.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 08:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761405245; x=1762010045; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6ZApRvRb7vW0G2zoc1eEE/W2po0au9F5FmCvI0sheY=;
        b=UKtgJAwvhdSjiwdnZR/XXYn8lqG7pIvmVy/yVsXXezsz30Qwac09XHbS+RBir5KU7r
         F8lhigvKIJjDByPg0Kt/+g6frXUcc3Pvc5MLXfUIkWDg2cd2HmfY7nliqQ54nLT8Yegp
         MdL6PmCi2TbtqF5FbglsCfzb9SLIPHp0UzH+hYH6t49AaPRFWzXORmtf/+WLuPJyRkLm
         OsBctP8VzvjJubHn0BJXLVXPrmd3xmADzmFZobXZegyA1uYT6IEzi6+E5UjKyPDbII9F
         I1QbERTSRGq+RLKXpshfsNgeXDQ5F4X+ZfwIHvMNWlGOcJ0zRMu+mwY2IaZp48M2vZYZ
         9+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761405245; x=1762010045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6ZApRvRb7vW0G2zoc1eEE/W2po0au9F5FmCvI0sheY=;
        b=h7RH+DS7Aem/ZCGX09xiybA86iDYW6NiyPW/Fj6HMwIfwf7MKHEQ8YySqYml9GToBz
         +ydwCJA1jj03/YtUfsi5D62mmiB0RyDTVyHAk/YXZSlx2eaQRpEHYGA24DyyLIxuO21p
         GXGcwNmNAdGAYNh6zf52XwEDxcU9BsHtfhcF+LU1SOSOcy9mTGClNCHwj3gMZeNSkn6d
         I+QujIA2KG6hIYsff4hz1yg+q60AQBWhoJ+74Vk0KdN7tmTfErDUSqevLwVlN4D2iMrO
         CZwwkU8x91ZTtAffSE/Yd9uRsjOKT/759q4INNy3qkZbiExgnoGOIJSnzSbBMBow4eTH
         MBIw==
X-Forwarded-Encrypted: i=1; AJvYcCU6fBoVty8i5AF3dhFH8yhoxTLSkCViVCu66S3qJgZX0Uua2wpudE/zzeGlM/xb7zV0db0vTLK9wGXjrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyUDJ97kuhHwqFK/WOKovIWVRCYypdRqGiPL02xHC4GQ2xBXWk
	JrSKQT0OabNkAj2+7JKnXyi0asIVqEM99XggMP0vSWZaA/5JXPn+73q4Aaigk9FD858bHRwU7wx
	OnBrxv9WlHpoi7CDkJOVE4QstGitqsLm+/b/KkiHHzw==
X-Gm-Gg: ASbGncveTYt2237C6f2fBMmuk+DcpNiSYbkhcjmKwF5GvCCgT1IVBL50fkvp+L7eKD+
	o6VByYyXdVNPvvsoCFzz4iExfx850D5xMpgGQ5ehC533NLOT2eZjpCmL6aR/TTnwcIEZiPBU7dl
	6KWgi1Yhg+8z0BdWUBNt9seM5CUdkHmArh6l4bTaNOtY0cSb8A4btThkmvGoy/a/EhOpHl5UWm1
	pYfzhpE3Z+wheg7Bqo1uFj9QYBx9NvIkMaizHNk4hXJf/8OMqJ+8QiaI09xwsRQm5kFEk6C+ZEt
	sfcOCblSFn84sQ8mhCynwcFBQxzF
X-Google-Smtp-Source: AGHT+IHaV1ZPy0NcxBjvZpBvRmdUs/H93j26P98BKr5SgBmvXnyMy41VvCYN1RoSAKCw4YXmnyQMwoR6KSlG6St14Q0=
X-Received: by 2002:a17:907:86a0:b0:b3f:f822:2db2 with SMTP id
 a640c23a62f3a-b6d51aeff2amr1161620066b.11.1761405244508; Sat, 25 Oct 2025
 08:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <1-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <1-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:13:28 -0400
X-Gm-Features: AWmQ_bnwA61ouglJ0muhK3QYt2JBH2l0zMaAEi3nbw0px0nYabPLbrggddVDt6k
Message-ID: <CA+CK2bB8JTN8qcSumb_tmY2gzmbahoDCeWS88W-Fh7P68pDhjg@mail.gmail.com>
Subject: Re: [PATCH v7 01/15] genpt: Generic Page Table base API
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_081406_769571_7B18EFDA 
X-CRM114-Status: GOOD (  17.16  )
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMjoyMeKAr1BNIEphc29uIEd1bnRob3JwZSA8amdnQG52
aWRpYS5jb20+IHdyb3RlOgo+Cj4gVGhlIGdlbmVyaWMgQVBJIGlzIGludGVuZGVkIHRvIGJlIHNl
cGFyYXRlZCBmcm9tIHRoZSBpbXBsZW1lbnRhdGlvbiBvZgo+IHBhZ2UgdGFibGUgYWxnb3JpdGht
cy4gSXQgY29udGFpbnMgb25seSBhY2Nlc3NvcnMgZm9yIHdhbGtpbmcgYW5kCj4gbWFuaXB1bGF0
aW5nIHRoZSB0YWJsZSBhbmQgaGVscGVycyB0aGF0IGFyZSB1c2VmdWwgZm9yIGJ1aWxkaW5nIGFu
Cj4gaW1wbGVtZW50YXRpb24uIE1lbW9yeSBtYW5hZ2VtZW50IGlzIG5vdCBpbiB0aGUgZ2VuZXJp
YyBBUEksIGJ1dCBwYXJ0IG9mCj4gdGhlIGltcGxlbWVudGF0aW9uLgo+Cj4gVXNpbmcgYSBtdWx0
aS1jb21waWxhdGlvbiBhcHByb2FjaCB0aGUgaW1wbGVtZW50YXRpb24gbW9kdWxlIHdvdWxkIGlu
Y2x1ZGUKPiBoZWFkZXJzIGluIHRoaXMgb3JkZXI6Cj4KPiAgIGNvbW1vbi5oCj4gICBkZWZzX0ZN
VC5oCj4gICBwdF9kZWZzLmgKPiAgIEZNVC5oCj4gICBwdF9jb21tb24uaAo+ICAgSU1QTEVNRU5U
QVRJT04uaAo+Cj4gV2hlcmUgZWFjaCBjb21waWxhdGlvbiB1bml0IHdvdWxkIGhhdmUgYSBjb21i
aW5hdGlvbiBvZiBGTVQgYW5kCj4gSU1QTEVNRU5UQVRJT04gdG8gcHJvZHVjZSBhIHBlci1mb3Jt
YXQgcGVyLWltcGxlbWVudGF0aW9uIG1vZHVsZS4KPgo+IFRoZSBBUEkgaXMgZGVzaWduZWQgc28g
dGhhdCB0aGUgZm9ybWF0IGhlYWRlcnMgaGF2ZSBtaW5pbWFsIGxvZ2ljLCBhbmQKPiBkZWZhdWx0
IGltcGxlbWVudGF0aW9ucyBhcmUgcHJvdmlkZWQgaWYgdGhlIGZvcm1hdCBkb2Vzbid0IGluY2x1
ZGUgb25lLgo+Cj4gR2VuZXJhbGx5IGZvcm1hdHMgcHJvdmlkZSB0aGVpciBjb2RlIHZpYSBhbiBp
bmxpbmUgZnVuY3Rpb24gdXNpbmcgdGhlCj4gcGF0dGVybjoKPgo+ICAgc3RhdGljIGlubGluZSBG
TVRwdF9YWCguLikge30KPiAgICNkZWZpbmUgcHRfWFggRk1UcHRfWFgKPgo+IFRoZSBjb21tb24g
Y29kZSB0aGVuIGVuZm9yY2VzIGEgZnVuY3Rpb24gc2lnbmF0dXJlIHNvIHRoYXQgdGhlcmUgaXMg
bm8KPiBkcmlmdCBpbiBmdW5jdGlvbiBhcmd1bWVudHMsIG9yIGFjY2lkZW50YWwgcG9seW1vcnBo
aWMgZnVuY3Rpb25zIChhcyBoYXMKPiBiZWVuIHNsaWdodGx5IHRyb3VibGVzb21lIGluIG1tKS4g
VXNlIG9mIGZ1bmN0aW9uLWxpa2UgI2RlZmluZXMgYXJlCj4gYXZvaWRlZCBpbiB0aGUgZm9ybWF0
IGV2ZW4gdGhvdWdoIG1hbnkgb2YgdGhlIGZ1bmN0aW9ucyBhcmUgc21hbGwgZW5vdWdoLgo+Cj4g
UHJvdmlkZSBrZG9jcyBmb3IgdGhlIEFQSSBzdXJmYWNlLgo+Cj4gVGhpcyBpcyBlbm91Z2ggdG8g
aW1wbGVtZW50IHRoZSA4IGluaXRpYWwgZm9ybWF0IHZhcmlhdGlvbnMgd2l0aCBhbGwgb2YKPiB0
aGVpciBmZWF0dXJlczoKPiAgKiBFbnRyaWVzIGNvbXByaXNlZCBvZiBjb250aWd1b3VzIGJsb2Nr
cyBvZiBJTyBQVEVzIGZvciBsYXJnZXIgcGFnZQo+ICAgIHNpemVzIChBTUR2MSwgQVJNdjgpCj4g
ICogTXVsdGktbGV2ZWwgdGFibGVzLCB1cCB0byA2IGxldmVscy4gUnVudGltZSBzZWxlY3RlZCB0
b3AgbGV2ZWwKPiAgKiBUaGUgc2l6ZSBvZiB0aGUgdG9wIHRhYmxlIGxldmVsIGNhbiBiZSBzZWxl
Y3RlZCBhdCBydW50aW1lIChBUk0ncwo+ICAgIGNvbmNhdGVuYXRlZCB0YWJsZXMpCj4gICogVGhl
IG51bWJlciBvZiBsZXZlbHMgaW4gdGhlIHRhYmxlIGNhbiBvcHRpb25hbGx5IGluY3JlYXNlIGR5
bmFtaWNhbGx5Cj4gICAgZHVyaW5nIG1hcCAoQU1EdjEpCj4gICogT3B0aW9uYWwgbGVhZiBlbnRy
aWVzIGF0IGFueSBsZXZlbAo+ICAqIDMyIGJpdC82NCBiaXQgdmlydHVhbCBhbmQgb3V0cHV0IGFk
ZHJlc3NlcywgdXNpbmcgZXZlcnkgYml0Cj4gICogU2lnbiBleHRlbmRlZCBhZGRyZXNzaW5nICh4
ODYpCj4gICogRGlydHkgdHJhY2tpbmcKPgo+IEEgYmFzaWMgc2ltcGxlIGZvcm1hdCB0YWtlcyBh
Ym91dCAyMDAgbGluZXMgdG8gZGVjbGFyZSB0aGUgcmVxdWlyZSBpbmxpbmUKPiBmdW5jdGlvbnMu
Cj4KPiBUZXN0ZWQtYnk6IEFsZWphbmRybyBKaW1lbmV6IDxhbGVqYW5kcm8uai5qaW1lbmV6QG9y
YWNsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+CgpSZXZp
ZXdlZC1ieTogUGFzaGEgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
