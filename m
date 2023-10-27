Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB882C25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 04:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MU/ZUEGP3PohR3GvfDuAnwoWwk9w1kZIuuNubr/faBk=; b=KLO/4mUxfolb4Z
	qpL+EoouA1XVhm2DRH2gYF50OgJrW50TFTjdWJWxxs8K8BAW74ML9L5hij5VVE7RRt4AVqHVOEZxB
	eWCGUpPLbtubfNPjh5mcRgnrB/2luDc8qOQ8rHDW6Z7lcoyWUXP1efQRpGDknZkf/rDr/m2pNa+Be
	JurZIRrU9m+H7Ae2fr4Y9nFGAOSJR2BMGRUVjZ8lA+wE7LwYq+pSf+81Nz0YeVP4dOlXs+uJw9JM3
	goAuGYlK+cA07L2lLK5ZpnkEAKESlz4ap5oTGAA4ZmMbac7AIYfWqQdrl/gyZTQ6Uo0JkcR6rqSl2
	VOvwcYqnAFLTiPGcLmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwEVN-00FZhE-1n;
	Fri, 27 Oct 2023 04:31:29 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwEVK-00FZgq-2C
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 04:31:28 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-27d11401516so1369026a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 21:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698381085; x=1698985885; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXE3BdGbiJaMW1JfePn5Fd+c7S292LcnRGSXMgQcGgQ=;
        b=g1RfgPlae4qY8H/aCQwXoMinKOAyhyHZkLWGyqVrpuDpmxc9c7jGgY73MblAHX5CD2
         btro/jn30+RiZrqydfnmC1j3dLFlzDuVBRIslYt/QDeeafyiCXB2YIH+c03MAeuAzUv7
         PBETZpKf7XONjn1BSW0xdDmIIPS63qX06lrKMw3O6VHrQf5eZrfKtzF693qyyO04wT31
         grB0IKXeS4oqVdgcommq1F47c+WzjzfdW5AHiwqXtZLqSr3IlKFNPwA+RIFgOiIgbu3Z
         Veon1KxO0t9v+w5c8Nm5S/h+ew6d4xROSKO48SgmuLVenm32JVl1GmreKGVNXbtdlu8u
         UYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698381085; x=1698985885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXE3BdGbiJaMW1JfePn5Fd+c7S292LcnRGSXMgQcGgQ=;
        b=mvDTMiWYQsfhBDfNSULsepZlbH/bX5fg1ORY9kWed5BEsT9QuaDaxXj+dTbkXEQwX0
         esTIXgx0qwNtRcj6CxgYHL3MxHV4+7KteFsxPBvNc9KX/hmSyTptXElgGPOdZ0GwIJp6
         c+RGfRdm4hf0WvfeCo5l5iXytEz1EYiL18F/alM0Le3Po7tKw6G/4WCxQI/d76G8rHqV
         pz5immPXjO52PHH28Na/eQt+AVokcFa4Blg+K0mJ9zYbM8sRoFLfWjfwfeLhQJw+UjtF
         zDynZ73Tq1NvPqcXTR8MtgD7q6i15zDl8KVM53226WguZGvc4thUCIvr/Ceum0d/c4wr
         c5RQ==
X-Gm-Message-State: AOJu0YzWSSXgsZQJzkjxkngfymsRQat5jOUFiEvBe2UF/RAjZ9Fltj+P
	8VKMyfr6QTTuNvQiSo5q5t3qOGcBPBq6XuXScW1RbA==
X-Google-Smtp-Source: AGHT+IH1j7xyXqP3DwCFQTDS24OX+TDA2FWVupF1IKZuhrioGAIBHjfcPDT07LBSWZnf/5UobIfplJw/wsvQA5VZ8/w=
X-Received: by 2002:a17:90a:f198:b0:27d:60b1:4f2c with SMTP id
 bv24-20020a17090af19800b0027d60b14f2cmr1442918pjb.4.1698381085180; Thu, 26
 Oct 2023 21:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231026101957.320572-1-bjorn@kernel.org> <CAK9=C2Vcbq_ReGcK51uOYp+M2hakz=9=RNHaHFMbfxhth_4cnA@mail.gmail.com>
 <87a5s5z44x.fsf@all.your.base.are.belong.to.us> <87fs1x3re9.ffs@tglx>
In-Reply-To: <87fs1x3re9.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 27 Oct 2023 10:01:12 +0530
Message-ID: <CAK9=C2Xou_sZKX96c8Z7RXPCnmdf-_DPHZ8rfPmNdBqx8s_30Q@mail.gmail.com>
Subject: Re: [RFC PATCH] genirq/matrix: Dynamic bitmap allocation
To: Thomas Gleixner <tglx@linutronix.de>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Anup Patel <anup@brainfault.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org, 
	Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_213126_723970_086F6148 
X-CRM114-Status: GOOD (  16.38  )
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

SGkgVGhvbWFzLAoKT24gRnJpLCBPY3QgMjcsIDIwMjMgYXQgNDo0N+KAr0FNIFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDI2IDIwMjMg
YXQgMTk6MjYsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gPiBOb3RlIHRoYXQgdGhlIHBlci1kZXZp
Y2UgZG9tYWluIHN1cHBvcnQgaXMgYWxyZWFkeSB1cHN0cmVhbSwgaXQncyBvbmx5Cj4gPiB0aGUg
QVJNIGNsZWFudXBzIHRoYXQgYXJlIG5vdC4KPiA+Cj4gPiBJT1csIHRoZXJlJ3Mgbm8gbmVlZCB0
byB3YWl0IGZvciB0aGUgQVJNIGNsZWFudXBzLiA6LSkKPgo+IENvcnJlY3QuIFRoZSAmKkBeQCMl
JCBkZWxheWVkIEFSTSBsaW5rIHdhcyBvbmx5IG1lYW50IGFzIGEgcmVmZXJlbmNlIG9uCj4gaG93
IHRoaXMgaXMgaW1wbGVtZW50ZWQgYW5kIG9idmlvdXNseSBhcyBhIHJlbWluZGVyIHRvIHRoZSBB
Uk0gZm9sa3MgdG8KPiBnZXQgdGhpcyBmaW5hbGx5IGRvbmUuLi4KPgo+IFRoZSBtYWluIHBvaW50
IGlzIG5vdCB0byBpbnRyb2R1Y2UgbmV3IHVzZXJzIG9mIHRoaXMgZmFpbGVkIHByb2dyYW1taW5n
Cj4gbW9kZWwgYW5kIGluc3RlYWQgbWFrZSB0aGVtIHVzZSB0aGUgbW9yZSBmdXR1cmUgcHJvb2Yg
aW1wbGVtZW50YXRpb24KPiByaWdodCBhd2F5IC0gd2hpY2ggb2YgY291cnNlIG1pZ2h0IHRvIHR1
cm4gb3V0IHRvIGJlIGNvbXBsZXRlbHkgd3JvbmcKPiA1LTEwIHllYXJzIGZyb20gbm93IDopCj4K
CldlIGhhdmUgdGhyZWUgdHlwZXMgb2YgTVNJcyBvbiBSSVNDLVYgcGxhdGZvcm1zOgoxKSBQQ0kg
TVNJcyAoaGFuZGxlZCBieSB0aGUgSU1TSUMgZHJpdmVyIG9mIHRoZSBSSVNDLVYgQUlBIHNlcmll
cykKMikgUGxhdGZvcm0gTVNJcyAoaGFuZGxlZCBieSB0aGUgSU1TSUMgZHJpdmVyIG9mIHRoZSBS
SVNDLVYgQUlBIHNlcmllcykKMykgV2lyZWQgSVJRcyBjb252ZXJ0ZWQgdG8gcGxhdGZvcm0gTVNJ
cyAoYWthIHdpcmVkLXRvLU1TSSBicmlkZ2UsIHdoaWNoCiAgICBpcyBoYW5kbGVkIGJ5IEFQTElD
IGRyaXZlciBvZiB0aGUgUklTQy1WIEFJQSBzZXJpZXMpCgpUaGUgUklTQy1WIEFJQSBzZXJpZXMg
bmVlZHMgdGhlIGdlbmVyaWMgSVJRIGZyYW1ld29yayBjaGFuZ2VzCnJlbGF0ZWQgdG8gIzIgYW5k
ICMzIChhYm92ZSkgZnJvbSB5b3VyIHNlcmllcyBoZW5jZSBteSBzdWdnZXN0aW9uCnRvIHJlYmFz
ZSBvbiB5b3VyIHNlcmllcy4KKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMTEyMTEz
NTY1My4yMDg2MTEyMzNAbGludXRyb25peC5kZS8pCgpJcyB0aGVyZSBhIHdheSB0byBoYXZlIHlv
dXIgZ2VuaXJxIGNoYW5nZXMgbWVyZ2VkIGJlZm9yZSBhbGwgQVJNCmRyaXZlcnMgaGF2ZSBiZWVu
IG1vdmVkIHRvIHRoZSBuZXcgcHJvZ3JhbW1pbmcgbW9kZWwgPwpPUgpBbnkgb3RoZXIgd2F5IHRv
IGRlYWwgd2l0aCB0aGlzIGRlcGVuZGVuY3kgPwoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
