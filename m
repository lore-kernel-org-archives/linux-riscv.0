Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4C6CCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqkyLWxd/YuHOtElng35dDKEAHV+THrFyW79WwQnKZs=; b=r5LDwixUmt+wRi
	FkasqRkhNqtVq3JbjF2C0tSu3SLF5RWL258ZROBhWyldzN6hnlG5BPU9ZWDoHsVjwtb5Qt11tkcQz
	awgMVCVf7zDpfQhtY0lZOWcyi23y39jLIioDiQScv3R/WCijzVyF3OavaVtb25nxE+7JIPiHOR5IK
	pumTxEqppBEpQ8cBGJL4HBlCzgUSRK36PxcoVf+qvTXcV1/Q3FVlrRFDtmVoZSw72zixBzrHWFo3d
	eXQn31WgZujRE5Sr3mmPynqnKEesdEkg9G3bvITgiexn3T4KwNcLrHKBerXwawpoIj42dMNzF97cz
	hXcScMX63ZoCmrh+vYWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCfzs-0000000BNzH-3TBk;
	Sat, 25 Oct 2025 15:16:00 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCfzq-0000000BNys-0wn4
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 15:15:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b6d855ca585so147026266b.0
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 08:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761405356; x=1762010156; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bi4GMT2iyyBr9MQrD3T6o1udwx+0fc5659kLbgfo8vg=;
        b=YAMLlFE0rzaNZSVrClNpi7JFQJj1sxBBPEcvmena1he61mzEXaJ1TZwrQXUdb2CAig
         ArMut7pM2EayPU7tUOmXB13qHPYOlb01OShJ4uxI9KJ/V0IUH5GJNEl3iwTTvQ2vQ7oZ
         Mbvi4tkjk4XnLQA7V9YZW0/WjhRpxxpTc8x50quE0xgVcpdh1PA3LabA9rHaQQYT0Pg0
         mxPzjFLluP4DYUikOtvZXQgNHAe3wxYSWEWHwmsrMfkyJL3FWZtHKdBbTV3ApZFipRKy
         1v+N8Ww01aXvrWnb7ovY97D386qVj15yg2klTujVGZ/dxOm6lozmxqzOB6sY09xlCykg
         tHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761405356; x=1762010156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi4GMT2iyyBr9MQrD3T6o1udwx+0fc5659kLbgfo8vg=;
        b=AzNotTrQho7i/HwXcbf31RavgbJOzk5XUc1mQimsqc768QTpTM3yeUmdtKmNzAvii9
         IBn3CEjWaPxSsd3C882Gvg1AEzzF8b42kRFombI3iAfGwyNVCnV6LRNqHOv1cAl5UQsW
         jX8QZvN+DpRr1zNppZU2VL7AJKgA+fL8r+foOOUzNZpHVdZ7iTwwwif5o+SV9nH8zcmh
         B7uevTNAhHylI2wVG6HWBzDfFx/9dykiUbSKtURotv2m8G30pTQ2gfG35RXp+jvnN5li
         FHnzY1lHtvyz9mZI7kemhNQcM57PGnSMbwBxC4wXqqZ4wOs4K6kcMoMFcSBKE1e21YiF
         XsJg==
X-Forwarded-Encrypted: i=1; AJvYcCW82efpGuK5DlMkiREaH+6BSL2IGuogQbWfJkWQjwHJP8HDqroO1BUbsyJPGQz5gQYC2yv/EpxvvqmcXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEY0VFYvNESOUj4H5TV2IP4w2m1EDGPakRMG3kyiQGOMOuZYWG
	zqBk1t1chFN3CknvWcXEXvxh6olUXmzDjdA+iZl05C5vyER1celtNt+N2B7wKi+Wb8UDdksqUMZ
	PAexN6mNGdCExLad1fvNjMw8jQhTotqrd8HxgC8I7fw==
X-Gm-Gg: ASbGncuYuDCuAlJbMrzA1y2W1r+mwRyPWm8ZK/1jle73azt9DECgLDVL8G0VCiyr3EY
	tbBbNTpdrHonzt4mw4GisT/L6k+m1c/lup+/jvN514qVvRTP2+zT+rESC5cP0ezuMoWPLgtFqvM
	1tLXyMWFkKzLzwfKgufc+gMvZcl2HDgE4OoNJ9gwB4Dl/9Q4MmbYnhwuDmZKfYG7ckblfLX0CLJ
	IoepRy0mTs/GIZ+ZElxFUTPkmGacgmnGZ6GRKmjf2p6qkO+dZUyn/9CFYk98JZpYn/QxDgYkBv7
	y2pYEVTGMHCWqe662Q==
X-Google-Smtp-Source: AGHT+IFCiIAROvFB2yMO0UCR+4ZQEZ0s8jgRn6oQbNbO878Y9zbld799sNxrnedeLYq8Qy2EigSbEXq7Bo6P6npPVMM=
X-Received: by 2002:a17:907:5cb:b0:b3f:294c:2467 with SMTP id
 a640c23a62f3a-b647195b32emr3912611266b.10.1761405356545; Sat, 25 Oct 2025
 08:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com> <2-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <2-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 11:15:20 -0400
X-Gm-Features: AWmQ_bmbZ8u5CogyggVXgDbcACzApTnoI3lXdk_DKTEGWhLBxFj0guiH9QhsMTM
Message-ID: <CA+CK2bBpunzb9yaQE91NYfp64xSSuRaHW71MC=3bLVfWsHBDzA@mail.gmail.com>
Subject: Re: [PATCH v7 02/15] genpt: Add Documentation/ files
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
X-CRM114-CacheID: sfid-20251025_081558_267527_987A18B5 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
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
aWRpYS5jb20+IHdyb3RlOgo+Cj4gQWRkIHNvbWUgZ2VuZXJhbCBkZXNjcmlwdGlvbiBhbmQgcHVs
bCBpbiB0aGUga2RvYyBjb21tZW50cyBmcm9tIHRoZSBzb3VyY2UKPiBmaWxlIHRvIGluZGV4IG1v
c3Qgb2YgdGhlIHVzZWZ1bCBmdW5jdGlvbnMuCj4KPiBUZXN0ZWQtYnk6IEFsZWphbmRybyBKaW1l
bmV6IDxhbGVqYW5kcm8uai5qaW1lbmV6QG9yYWNsZS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtldmlu
IFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRo
b3JwZSA8amdnQG52aWRpYS5jb20+CgpSZXZpZXdlZC1ieTogUGFzaGEgVGF0YXNoaW4gPHBhc2hh
LnRhdGFzaGluQHNvbGVlbi5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
