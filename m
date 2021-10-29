Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62FDC4321E
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 19:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD72560F58
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 19:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD72560F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mlk1Xxkb6/MDC7+D8iblGvEjOI2OEtA4ICdMSYCIVSs=; b=P5t3e9nMD6IKSJ9m0zDrGZ8jHo
	3aVAdDWUUTRcska/hn8UoPxkfcqXUePAHjjzueGKM28HHWhV3M9EKBaLdBRSCHX/FOIv6NFZiq3UG
	EZL53agtnFKvQxRRGOf4vHF/y2SUJadD7L48gICGLgTbyOCfJSo26JXo6UkrS4GSm9PULc8eIgqbf
	9eQ6OdiD/S32OwUYjiyIpX1fEMf2mDBwA6Cg6eqYfytKcrMueV7EH38XAwG1TyJZtCGujRP5Gzr3m
	ivDsEGX5LUBgu6Z3iPAvLrezKiEORucj2OK5J11nLPLcacgh/qhw/8YT+vQNSvg6vyo6IOBzQNqyG
	JWXbyx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgXXa-00BzRM-Rg; Fri, 29 Oct 2021 19:27:51 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgWIp-00Bj4i-3i
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 18:08:32 +0000
Received: by mail-pf1-x430.google.com with SMTP id l203so9962182pfd.2
 for <linux-riscv@lists.infradead.org>; Fri, 29 Oct 2021 11:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xFYea77yp7hHF39j7jIyl1YqhsIj0k6eOQNJFYQ5RKU=;
 b=bvJHJP9yCpPGLyJzDOAMGmnvbTTWHWRmhJRXfAdSCfdAePRvWAOufkkIiXfH3Obgk6
 A7OzZ3NdhixBsooGlavgr2XKjf5c4KHvc5YerFmO3gflcICkNPbumhL51LbWz1HVIZ5r
 NUu6LyZgAuXkQkX3uzvvIOusLLikWswHAk9UUXQ9j3xKIitPaKmmaj6cegLF+86iBmaX
 v6c4Zsq03qvHTrkiOYZSzPt1D4rl5AOtUjVbgmwdv8Sg7G5lSXwBsKAVFVBIHpN0L+Pl
 hJ0/oG6R23DEBwx1x68rCawxxYF3RxlxtvqNrfdYHSXk1Ll2a+zXNMO+jYwx4f6c1dYb
 CA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xFYea77yp7hHF39j7jIyl1YqhsIj0k6eOQNJFYQ5RKU=;
 b=j7a1stdL5BeTz1lCKJeNcpEf4eStU6LKKui7PeBAxr81njD6EB/HvFjUluzsy0hk6N
 Fh7FDXHT07/0HBPNkLPCfnKafX4WB2j7vLoDomdlQ8U22HYk1P5+xnIyvv9vL6boOsq8
 HLLkWB62AtiQqP1HCs53F/1Gi0EfJ5u6qz6xi/Ukw8zKzvkBg93wB5d2so1T1RN+drCa
 +RBa428h44jAX8F9jJRERG1edzljc2OnaFsmJJrIRM60KmDCe+V+Xj49BJXGurUXSvz8
 GLqthRMzTLwusgI+/5B20a/f5HNKtWvBBmetIw/kD6Uqb62TdiMeYGfy03R1HV+CARpB
 ZbcQ==
X-Gm-Message-State: AOAM532FVPNGCtMeGPdJYH0Fm8Y7sbIEcjCFrLB93FhWoRqF7yN8vL37
 2Lpb06iF6R1lQBFDpcCRCVuqbA==
X-Google-Smtp-Source: ABdhPJz5Sqz0A6jeR9OTfM5Fo3ERAYSM4YQaiaZ9xy1sEqYRBmNn0O6vk/ff3JxqslbHJZrGyjGEfg==
X-Received: by 2002:a63:3546:: with SMTP id c67mr9131634pga.201.1635530909069; 
 Fri, 29 Oct 2021 11:08:29 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:b1bb:1ca3:676a:3e09])
 by smtp.gmail.com with ESMTPSA id k8sm8099425pfu.179.2021.10.29.11.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 11:08:28 -0700 (PDT)
Date: Fri, 29 Oct 2021 11:08:28 -0700 (PDT)
X-Google-Original-Date: Fri, 29 Oct 2021 11:08:25 PDT (-0700)
Subject: Re: [PATCH v2 0/2] riscv asan-stack fixes
In-Reply-To: <20211029045927.72933-1-alexandre.ghiti@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, alexandre.ghiti@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-b840919e-0658-4567-8639-f15c6076a860@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_110831_240606_E6F34247 
X-CRM114-Status: GOOD (  10.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 28 Oct 2021 21:59:25 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> This small patchset fixes asan-stack for riscv.
>
> Changes in v2:
>  * fix KASAN_VMALLOC=n
>  * swap both patches in order not to have a non-bootable kernel commit
>
> Alexandre Ghiti (2):
>   riscv: Do not re-populate shadow memory with
>     kasan_populate_early_shadow
>   riscv: Fix asan-stack clang build
>
>  arch/riscv/Kconfig             |  6 ++++++
>  arch/riscv/include/asm/kasan.h |  3 +--
>  arch/riscv/mm/kasan_init.c     | 14 +++-----------
>  3 files changed, 10 insertions(+), 13 deletions(-)

Thanks, these are on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
