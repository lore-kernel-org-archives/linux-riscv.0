Return-Path: <SRS0=E7Bo=ZP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEACC432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 03:13:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB692071C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Nov 2019 03:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HIbAbnyF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aqNVL7xV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EB692071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0zUqdZqlEfKkKaWCPi61V96/xjbAS99Q0RSkruQg+0=; b=HIbAbnyF1YUKgQ
	wz9W6HWMMioHj+gP30srteZogRDM6AxvXi2yzSrlGilMKsHReKKkvkCF1D+rDDLxb+GAbGUPMwD8P
	9sJNVGTvwHnP+tunOMHHTIUvoTToQdUR0w4iQSYoYjEZGRsLJZgTF2bew+NgTL+xwButRY0/kxCkZ
	4zxVaRo1x5G27wpK2m66Sme3FJK7L3RTq3MZRVSa3odHrv+P1D8yCxW2G5jSWGyicuynGfpQuZwFu
	Ya13ISwPJWgLoI9l5dP8ENIVUzwFP/VijPf08dMz+pC2ZXxkq348FfwZyT0tG9jpkunOce2w5r+gJ
	Kft0g9AvqZHK8SxJxlfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYLrs-0007Q6-3a; Sat, 23 Nov 2019 03:13:52 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYLrp-0007Pj-VT
 for linux-riscv@lists.infradead.org; Sat, 23 Nov 2019 03:13:51 +0000
Received: by mail-il1-x141.google.com with SMTP id a7so9106304ild.6
 for <linux-riscv@lists.infradead.org>; Fri, 22 Nov 2019 19:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Qdi4xJuJjta2u9BrlQQY9FpGcN9H5nfrgZO9QjBGHhk=;
 b=aqNVL7xVNyuMCGR0fX2PLBMKf2jeELkaON/ndcZFsGUF+jI7+VKi/S1FP3MFvVBPHD
 oTgap/KMM07d9IdlSVF54qH7OxrSRXqxynmzFns5iePgt2kS2gQwaqnqmXSdE+JNncQB
 pZe/9aDETflvjjsHP6xHIQGcJzPqyKXAUgiG2xsQBHt3vxJUIBf2WSUp5epBGDqUbYUJ
 pvm6ccpqLMUz4Nwqnak0d80xlHMrt/S2NdQhEG1OAdFVzBJbam+gJb8LPqmVSFXSr8Dv
 9xvDq45I9HtFq4kT3eebp7TY9GTXGii6CXfcSaR7+g59X28giS/IakHFPFhXB5a3u1OR
 wdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Qdi4xJuJjta2u9BrlQQY9FpGcN9H5nfrgZO9QjBGHhk=;
 b=NxnT3J+Ji1gqWf/b9L+PO8FDywuqRGytwB26ag788HrxfuLIBxhFvkyCSzHFmPpOQQ
 9LsSBggvkBxWos0aQi9xEHmjx3nOAO+4+aJz8Rpa2XwMFRQpZatNKt8SeHDdWxxUvlNx
 XEY5Kp9DA+na+4XPBeq2SPd3NfiJt8ty0kyFCY/1lANzXweblF+1sr6QT5L+ruZcdnMh
 aJTXva8unJWi+i5cNmwUVnSvh755t2j5yoIrqSgV8g66sZBZ5rTXXM0Y8ZFcO3VRV2d6
 CJTAQE5Y+rBlX84zLuLmlhBpsu6jaUqv+qvkmsQdyKh2TL9fzi6OiRoNzSAT4irALPcw
 /3GQ==
X-Gm-Message-State: APjAAAWadOrI8fJ3wuJdXQqhR/Rt8Q5FEnhIotjkJkP2ZbMgYmAQ6JH8
 Rqn8q/YVjzDga+06lCSs+HN1Lw==
X-Google-Smtp-Source: APXvYqwLehW6jT9h73wjWDikxsJDU3y94CGY9KVHlLXmuBEF+b78ooLizwVHu0RmqsPNgCJOLq+t1w==
X-Received: by 2002:a05:6638:91:: with SMTP id
 v17mr12217947jao.97.1574478827962; 
 Fri, 22 Nov 2019 19:13:47 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id t6sm3468008ilq.53.2019.11.22.19.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 19:13:47 -0800 (PST)
Date: Fri, 22 Nov 2019 19:13:45 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH 0/2] riscv: defconfigs: enable debugging options 
In-Reply-To: <mhng-a92b32ea-0365-407c-9569-1ebce2d3b37f@palmerdabbelt.mtv.corp.google.com>
Message-ID: <alpine.DEB.2.21.9999.1911221912390.490@viisi.sifive.com>
References: <mhng-a92b32ea-0365-407c-9569-1ebce2d3b37f@palmerdabbelt.mtv.corp.google.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_191350_026683_601EF041 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 22 Nov 2019, Palmer Dabbelt wrote:

> Does it make sense to turn on some CONFIG_*_SELFTEST entries as well?  I know
> I've found RISC-V bugs with ATOMIC64_SELFTEST before, but they do take a while
> to run.  I just turned on 
> 
>     diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>     index 420a0dbef386..90001c3746cd 100644
>     --- a/arch/riscv/configs/defconfig
>     +++ b/arch/riscv/configs/defconfig
>     @@ -100,4 +100,18 @@ CONFIG_9P_FS=y
>      CONFIG_CRYPTO_USER_API_HASH=y
>      CONFIG_CRYPTO_DEV_VIRTIO=y
>      CONFIG_PRINTK_TIME=y
>     +CONFIG_DEBUG_RT_MUTEXES=y
>     +CONFIG_DEBUG_SPINLOCK=y
>     +CONFIG_DEBUG_MUTEXES=y
>     +CONFIG_DEBUG_RWSEMS=y
>     +CONFIG_DEBUG_ATOMIC_SLEEP=y
>     +CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
>     +CONFIG_LOCK_TORTURE_TEST=y
>     +CONFIG_WW_MUTEX_SELFTEST=y
>     +CONFIG_RCU_PERF_TEST=y
>     +CONFIG_RCU_TORTURE_TEST=y
>      # CONFIG_RCU_TRACE is not set
>     +CONFIG_PERCPU_TEST=m
>     +CONFIG_ATOMIC64_SELFTEST=y
>     +CONFIG_TEST_LKM=m
>     +CONFIG_TEST_USER_COPY=m
> 
> as an experiment and OE looks like it's still functional, but it looks like the
> lock torture stuff keeps running and the RCU torture can't run at the same
> time.

Thanks - that's a good idea.

Will take a look to see what tests can be enabled that don't take too much 
time (and don't conflict) and will put together another patch.  If anyone 
has any feedback or suggestions here, they would be welcome.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
