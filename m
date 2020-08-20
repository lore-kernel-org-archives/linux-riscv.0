Return-Path: <SRS0=ioKI=B6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486D4C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 20:45:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 084CC207DE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 20:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yLKD1gct";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="kpie1bvb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 084CC207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6W7JIm67xMAdsuJ0t5BYx4dcNHeTnFRQdbgVn5tsc6A=; b=yLKD1gctWVAztHqwjN9mL4zzi
	HQnYrbZwBEQnaaF4KWg43F34OUsu8yvCmIb++5XOqQ6v4nCshEhl3NOzFEkPKbi/IAnArS5R42x9U
	ANgudsO/rB4wALW4ePCUrNhJF9S1e+XvEnozaY0MsQpxM1PPHI/6eXm8n/5Cs0uiK060ns7GGZr6d
	ds7jsl4kZueZtjIjX9/7zwiALcZUEzmeAsEj7HvtfWJ/UIb7BTUycMAg/G/8+f0Ipm42UzMFL28Ip
	HKmHm8m1fSNFyYd5WvDypwlcEKc9T6M6ZaNZ3Etni7Pxu+5otxTfm1IrWysf9iCEZqTbBvTySTGjZ
	lRxHIyf7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8rQo-0001Ui-IP; Thu, 20 Aug 2020 20:45:06 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8rQl-0001TG-Tv
 for linux-riscv@lists.infradead.org; Thu, 20 Aug 2020 20:45:04 +0000
Received: by mail-pg1-x543.google.com with SMTP id m34so1691236pgl.11
 for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2020 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Dj6dnw1SSGK0z0yl6jJ2uTtBS6LOewFQlnOBWDc3SWg=;
 b=kpie1bvbURjnyGG5tFbzrQs43n0HWVHiEYDQrm96KF6px5dqNEbRvhU3+tGczCdBEN
 nH9nuWE/dOw1Fgm1b8XE++szjDp0mBzlS073HLhBZlzJRTxzBxHat4pKrJ+PAUUpdnkm
 6TqGwZcpetdpfq+xwK7v6+z4qTQ2Sx1kOiVB+dnlANwEjP87QrY+E1wazm4JJMh1Dtte
 tNTb00w8s9tvECp5T1ElK7APHequbv1ziFmjXXxOKTD0T16K6rLqPQ34Epqyx4dc0gth
 om4nel1RoFf6E8Eb6r55DxKFBm7aDXCQkDwlRiAeo/LUpJQgJ0amSKOIviXzQItZZOur
 iqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Dj6dnw1SSGK0z0yl6jJ2uTtBS6LOewFQlnOBWDc3SWg=;
 b=BVUozLFtDRH0wHy4+n8bdwGqL3Zld8ABv/tnkQotXtDtOD+UKik0HjAeJqifKC0j61
 OB5v0RskMdnQTfZmoBGh1m0j+aIdKY5W9u9yczKieIMJNgz1MUq0XM9yDazv3Kz5XFQR
 lZFnS3BJMRRn9D9D2rKXDatmgya4Y8Fxc+lC2YDU9NrijuCGVFZ2p1EJ/aMl5gl3Q2Ss
 j6QNmJXtTWogFhn1S7EUkB2jy11vaQ0Y8mTNdjVnhCM6pxadDO/6lqp1rnrdiOpab2YS
 OBTGxG418TvoDTb4cjZZaXzgkQJZ9nTIpENtla9ycxSaJU9cbefOgIzY6u91K5PJhXF6
 uqpQ==
X-Gm-Message-State: AOAM532PQO1X8p7NZLx29yy9hPElf1Wx0ahC19muJMROrOLvIP2NYYAY
 /VQgfIAeMq0T/Vt6tEOwRTpBEw==
X-Google-Smtp-Source: ABdhPJzF3fXdvzsbcrHyfPMlzhgjHfm67wi5JSAW979oB4n9Hau5vaGRKvg3+pKBywuyTGj6Vn1+jw==
X-Received: by 2002:aa7:8751:: with SMTP id g17mr384012pfo.109.1597956301621; 
 Thu, 20 Aug 2020 13:45:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r21sm2855133pjo.39.2020.08.20.13.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 13:45:00 -0700 (PDT)
Date: Thu, 20 Aug 2020 13:45:00 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Aug 2020 13:44:52 PDT (-0700)
Subject: Re: [PATCH 0/3] Get cache information from userland
In-Reply-To: <cover.1593766028.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-ec05108e-fd03-44c2-992d-649e967f86f0@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_164504_012833_4FAF1676 
X-CRM114-Status: GOOD (  19.03  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 03 Jul 2020 01:57:52 PDT (-0700), zong.li@sifive.com wrote:
> There are no standard CSR registers to provide cache information, the
> way for RISC-V is to get this information from DT. Currently, AT_L1I_X,
> AT_L1D_X and AT_L2_X are present in glibc header, and sysconf syscall
> could use them to get information of cache through AUX vector. We
> exploit 'struct cacheinfo' to obtain the information of cache, then we
> don't need additional variable or data structure to record it.
>
> We also need some works in glibc, but we have to support the function in
> kernel first by rule of glibc, then post the patch to glibc site.
>
> The result of 'getconf -a' as follows:
>
> LEVEL1_ICACHE_SIZE                 32768
> LEVEL1_ICACHE_ASSOC                8
> LEVEL1_ICACHE_LINESIZE             64
> LEVEL1_DCACHE_SIZE                 32768
> LEVEL1_DCACHE_ASSOC                8
> LEVEL1_DCACHE_LINESIZE             64
> LEVEL2_CACHE_SIZE                  2097152
> LEVEL2_CACHE_ASSOC                 32
> LEVEL2_CACHE_LINESIZE              64
>
> Zong Li (3):
>   riscv: Set more data to cacheinfo
>   riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
>   riscv: Add cache information in AUX vector
>
>  arch/riscv/include/asm/cacheinfo.h   | 14 +++++
>  arch/riscv/include/asm/elf.h         | 13 ++++
>  arch/riscv/include/uapi/asm/auxvec.h | 24 ++++++++
>  arch/riscv/kernel/cacheinfo.c        | 92 +++++++++++++++++++++++-----
>  4 files changed, 127 insertions(+), 16 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cacheinfo.h

Sorry, I lost track of these.  There's a little issue in #1, LMK if you want to
send another version or if you want me to just fix it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
