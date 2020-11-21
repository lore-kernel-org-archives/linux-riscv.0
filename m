Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99AA6C2D0E4
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 03:01:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23E55223FD
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 03:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OpJE7COH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="M2jBZYGQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23E55223FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=FCiJ0g1e4GN2pAGHzfpUeftR+1ahDRdfWfq7/0PGMo8=; b=OpJE7COHcOSt2YS7lCOFaeSMG
	ZvHIkRvuYA1rHTGyukRPzqzJc1kOUdVYV460Zbn7kDzj0CRGzcdKlGDIHVBLxCc7pL5mqye6Bnz3M
	kMDzDkWkiim/NgNnGilPf83dSIYLTXS3arFdMF3N9frBV5h3MXsjmKx7D4BMqmObpRjwefdgFV0Uc
	WMBn36Jp4c+6BGuNOLrII7ykrQZkSufF6ZFv/MivrVT8EHQD+KbCe9x2gpt4sO4vVrQwX5ZacWRsb
	5crk9w60Ds8/t79UNIUt0yV56VfvUcLqbW9VWa4Bdyz9oaLa6+csQqCTeThGaw5VQRKxrbli8F0OJ
	pXqw9JDYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgJ9M-0000Tw-Pz; Sat, 21 Nov 2020 03:01:20 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgJ9K-0000TC-Co
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 03:01:19 +0000
Received: by mail-pg1-x541.google.com with SMTP id t37so8892795pga.7
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 19:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0stukxeIbwUVfykWlgzI8f7rldTzyypjwN6oXTuJvv0=;
 b=M2jBZYGQts85WexcNlOFQ6qW/9Foo+Z4wocAEVyzFPHL7CfdUbJh0NM1xBunCJ8RBd
 NTR/HRYHBVdzh5ldvuwlWxTG5GZ0zubJiX4bAoSme6yJv/ZOCxidNiwEwM+kDpMlTeLk
 VzOeoDY/pK7+r7GAqxeXl0cJJSssfDnvVhq1a+XVghuxeMI+jpEiYJIACnw2Z2BwGZd6
 OdOYBfxeoDDa74H19Jq7kOOWa1AKJ8nynwJ7ceHoyfrbJEzd2Mwo91Mr5cvyFCoBwq70
 bOpauha4WrhYRkwy+dlqEhukNRhZzIkxUXOn6L/gm1YgU5314TT81Plu/MC4V0kYJOGS
 DEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0stukxeIbwUVfykWlgzI8f7rldTzyypjwN6oXTuJvv0=;
 b=MdaMiT3u0IAk41hXP+vKlLPMGBtudZb6CqC4XtP4+kq5QxbmbxkC/Rt3SLn0LCfNUg
 hr7RePRJdqILfD3nnDXIi+ABM8d4PVt6Gmuchxt18CFAtlhhy+be8tWWs7jG8NYIS4Wb
 XwxCH1odzQzRmPhksXYyKZjJxRtCXbR7/qeHh0Mxgcya49LKuIQ8rK2rB51VSUpy6JR1
 o5cnC/uSICLGUE/+mX4RDZUWriLPnzeQ+Y8R+JGRieM2XT46tmj5SB0DO4NRqkvXQbE9
 oJmZefR+xgNodTRtFEz0SFNnqC/QofUgSFfbbfx74bXRVLFAQxz+KNLDOugYjrjpbFyh
 NPCA==
X-Gm-Message-State: AOAM530KKRaK9eT7+NerhI1gOkNxV9yy8N43d3XWXLtkrqsgutBpO8IN
 FSr5eHfagXA2uFQRTMkAggafbQq3f2qc/g==
X-Google-Smtp-Source: ABdhPJwSO9w2LktcG16OVv89ZGzYZCWiEHmMuECjq96HPpsZEkqVRTWMopkg/2XBP2afbaxsuAShhQ==
X-Received: by 2002:a17:90a:7c4d:: with SMTP id
 e13mr14258944pjl.146.1605927676239; 
 Fri, 20 Nov 2020 19:01:16 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y5sm5629142pfc.165.2020.11.20.19.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 19:01:14 -0800 (PST)
Date: Fri, 20 Nov 2020 19:01:14 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 18:53:59 PST (-0800)
Subject: Re: [PATCH 0/3] riscv: cover to ARCH_STACKWALK
In-Reply-To: <20201113064223.103530-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-54bff36c-7c0d-4448-8859-d8d05cbd8b0d@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_220118_461128_FEE593C9 
X-CRM114-Status: GOOD (  13.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 wangkefeng.wang@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 12 Nov 2020 22:42:20 PST (-0800), wangkefeng.wang@huawei.com wrote:
> Use the newer common infrastructure and simpler arch_stack_walk() interface
> for stack walk.
>
> Kefeng Wang (3):
>   riscv: Cleanup stacktrace
>   riscv: Make stack walk callback consistent with generic code
>   riscv: Enable ARCH_STACKWALK
>
>  arch/riscv/Kconfig                  |  1 +
>  arch/riscv/include/asm/stacktrace.h | 17 ++++++++
>  arch/riscv/kernel/perf_callchain.c  | 10 +----
>  arch/riscv/kernel/stacktrace.c      | 62 +++++++----------------------
>  4 files changed, 34 insertions(+), 56 deletions(-)
>  create mode 100644 arch/riscv/include/asm/stacktrace.h

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
