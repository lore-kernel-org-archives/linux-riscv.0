Return-Path: <SRS0=aH+X=4W=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5257C3F2D2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 15:55:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A3EF20848
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2020 15:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ctg1pr/f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="oDU5Pv5T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A3EF20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zlV2/HhklUPk+6HazhFg2c3NcHDRCugdQYzaRPS6yNU=; b=ctg1pr/fYWSGeg
	iDIQ6/hEVM05yuKmZ4PJwRv5nnc4c3xp/6WKC3b9iDP2Ozu1PzH4VMzC4UPmaBfbNPF+oLXbEnV/s
	kJDe5yYooofMNBh/b7Q5VNoXO48jOG9KqdcfIvTq+Y4pDXulrLVgyYp2UGXJfnbiCe3Jj0iD9pGea
	enkKo8Z581lKfZf0ykOcJP8NyU8UP/fMdPFQwkNBp/wxkLi2SVlA/r1yUcc/UGei9T1AoxNyTmmFT
	5wQAXjSRuSEyi4lkXr0QCLovLBJQidJ1cdwgmsWOon95h+1fA+RNgJd1SK5jU6prKKh2wycK4HZm+
	7lsCYJRnfypVnonJRShQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9sqP-0005Hc-S3; Thu, 05 Mar 2020 15:55:29 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9sqN-0005Ga-8Y
 for linux-riscv@lists.infradead.org; Thu, 05 Mar 2020 15:55:28 +0000
Received: by mail-pj1-x1042.google.com with SMTP id o21so2423059pjs.0
 for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2020 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zlV2/HhklUPk+6HazhFg2c3NcHDRCugdQYzaRPS6yNU=;
 b=oDU5Pv5Tq7eaDkdXZgiOnF2OrFlP5yNMtB7KGbTTN/Bon+6j0m3jnH5bSZGnDWBPGZ
 DPHh0SnpRCxrWkKm+jyrDnIeiK/wGA3oiSLBoX86vLkwwGlV9ytRFKSyIETYjl610/iA
 Gwdmez+Pq2qYts0kAvqLHLRctmWiVhyRfO5Oele2kYtm5nuFkTkBa2/MCTG91LXFaZuk
 A7JJQixojSCqudwflVfKOOJUgDZXKkZSwNavS/lAVo/Ga1Ty7Bblk5hk4aEKJ4+MDjy5
 eMhQLETOJiJ2Psrg4sei318QCkfAXFvX9/XQfVocIjeK3xREXHi92BnFrHCBKrvZKJ5+
 E8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zlV2/HhklUPk+6HazhFg2c3NcHDRCugdQYzaRPS6yNU=;
 b=bw5ec2I5yQHDbAWqyks0J1Mxe2FemOX78azRciAZLscmKniVUtfF2//PJBgs6naaHT
 OQJc+E+ROR2djedKBQsY6kGtAZxDQwNoITn8+QQhUftXeP5dxxUYExmecbxfzzHwPjpj
 vgtmoxMKECznKT8Uc+i+vVAbcdiOYbFlVy9p5AnNztQgPyjBFPpTU9PxONfVKKjzRXJz
 tcRGC6krnjDIllkBM4QQwuo9N9RcGN4t6YxXWO90cJMPa/JJufzXFMnL2QSuhv2bTiMf
 CyDERSxlzeftl//zY5hNrkiObSIQHXRCro4wPtOKYoK8UCsiIQkXcIge+KFppqVLxngH
 5GBw==
X-Gm-Message-State: ANhLgQ1sIjXvQAQmYokbEGtQwilK36jKRg0WhETp7bykEjzM5QwXiKK9
 R9qJwVntIlBMlc6fd8Qzes4ydQ==
X-Google-Smtp-Source: ADFU+vujL3wjPEssfVg2CK4Lcyyb6fMr4/WV3FRA1e4Tf9tofUg/l7ANxmbO8T6vy8+++Xmp2K6UxQ==
X-Received: by 2002:a17:902:aa01:: with SMTP id
 be1mr8440330plb.293.1583423724799; 
 Thu, 05 Mar 2020 07:55:24 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id v123sm7307086pfv.146.2020.03.05.07.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 07:55:24 -0800 (PST)
Date: Thu, 05 Mar 2020 07:55:24 -0800 (PST)
X-Google-Original-Date: Thu, 05 Mar 2020 07:55:22 PST (-0800)
Subject: Re: [PATCH 0/8] Support strict kernel memory permissions for security
In-Reply-To: <20200217083223.2011-1-zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-f31549a4-4c1b-4f9d-a034-2d0217bc1ecd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_075527_354986_52477B46 
X-CRM114-Status: GOOD (  16.61  )
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
 linux-kernel@vger.kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 17 Feb 2020 00:32:15 PST (-0800), zong.li@sifive.com wrote:
> The main purpose of this patch series is changing the kernel mapping permission
> , make sure that code is not writeable, data is not executable, and read-only
> data is neither writable nor executable.
>
> This patch series also supports the relevant implementations such as
> ARCH_HAS_SET_MEMORY, ARCH_HAS_SET_DIRECT_MAP,
> ARCH_SUPPORTS_DEBUG_PAGEALLOC and DEBUG_WX.
>
> Zong Li (8):
>   riscv: add ARCH_HAS_SET_MEMORY support
>   riscv: add ARCH_HAS_SET_DIRECT_MAP support
>   riscv: add ARCH_SUPPORTS_DEBUG_PAGEALLOC support
>   riscv: move exception table immediately after RO_DATA
>   riscv: add alignment for text, rodata and data sections
>   riscv: add STRICT_KERNEL_RWX support
>   riscv: add DEBUG_WX support
>   riscv: add two hook functions of ftrace
>
>  arch/riscv/Kconfig                  |   6 +
>  arch/riscv/Kconfig.debug            |  30 +++++
>  arch/riscv/include/asm/ptdump.h     |   6 +
>  arch/riscv/include/asm/set_memory.h |  41 ++++++
>  arch/riscv/kernel/ftrace.c          |  18 +++
>  arch/riscv/kernel/vmlinux.lds.S     |  12 +-
>  arch/riscv/mm/Makefile              |   1 +
>  arch/riscv/mm/init.c                |  47 +++++++
>  arch/riscv/mm/pageattr.c            | 187 ++++++++++++++++++++++++++++
>  9 files changed, 344 insertions(+), 4 deletions(-)
>  create mode 100644 arch/riscv/include/asm/set_memory.h
>  create mode 100644 arch/riscv/mm/pageattr.c

Sorry, I had to run last night without quite finishing the patch set.  Just so
we're on the same page: there's some issues with the patch set, I'm assuming
you're submitting a v2 so I'm dropping this from my inbox.

Thanks!

