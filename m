Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D401C4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:53:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0378522B4B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0378522B4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ftzi3oPywLT4saKYZT0EADvOE6t56Z6M4HtmidMdGok=; b=C3HyfCAt6+KAsbnLrsilUlAMt4
	3Rsr/4outB2kyn2q2a3mlBv5GQn8gJi4S7PZCrxK2uZv2ZZg3O+OyOG2rkTAjI1XZiSQZkOw66jYe
	E5UA/um1spJxjbxR/mZdGxM0KIV4N6shhRwaQCygWoojKwiXrDEocQi3Id1o00oNrMCbrCVJyqoCF
	T9thl3Ar5oH4TAV1GLKH/btZRNKp9u4ekASFPBkhYjd4pfHkeVWotZvEPu42QLBikqDBXqHkDXO1V
	O7ayDJv43zaz+8vozWdZ2U693sQ9Y6B2FsNvwYkfvODp7u+sw03/VeprpLuchj1neCyU7IBz4RS0I
	nOHTMaxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpQgw-0004tY-SQ; Wed, 16 Dec 2020 06:53:43 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpQgu-0004tH-Mz
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 06:53:41 +0000
Received: by mail-yb1-xb34.google.com with SMTP id y4so908822ybn.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Dec 2020 22:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+Mx+fdQx08QkPB6FazCiUXaMXPnUrytToXg7hZT6L2Q=;
 b=fcGDGstsRe6LCmVMR1Po6i3Nty+Yq6WUJAyRgf5jqgBfMux0kaxMrU3OVFsi5mAbto
 NEYjQclyKac+9ZNDKfUwWlqRLK2yYe5KIfQyhqyq9dYVf/hHbog0raGH3sdikVPyyzqo
 W6k653V1DeN9gtfofwkV6A9MGll1NCZ7zC+esNW8OHYixsuXaKjxbyTWpX64iuYTpM+R
 QxSXX7Q6ZoKn9B3bNYFriicVCE2U+4UCHGEUj5OWpDlp7CC5G4G3SVBxueTz10xINoKT
 qba4AG0rNmd8pqUV9pRHIqb36C0LZbx0ti2DrSPfLr0HlaOiIbXduk8UpuGEuWj0j9Bd
 znlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+Mx+fdQx08QkPB6FazCiUXaMXPnUrytToXg7hZT6L2Q=;
 b=KYtHhu/oglQMD1+FqsTfqoHmV+E1aEmJjv6BmIEQHVQ9mcLvRpu0+uLb0gOExNwVBQ
 dRhycG6gp0JUda4sLZ9ax4ADsxl1sYr4k1Hx/rnZIn8WYkTpEy/fZVZaqrhHEnz2GhIS
 v3IV833Cc5IfLsTDnBNSPTiHzjxfaH14nkl41U5OqdZEmEDs3NRe9zjA1cTQLPjx7DSw
 IN0CnPnjtRA1bQHA4VHHz7yqryDN6lE4HEXHFCNq3jOWGpEZXZqqy3wGfcNQowALroa/
 f7SGvMWEWlJSG4mds/hQb9KndpgQOlD4PKNgAwotY1TKoX0PxxQzR1Ns4yUlZHeaY93u
 yuhw==
X-Gm-Message-State: AOAM531+fTzsukjAxvfEbM5mbXblkJTUUK8Hq2Yutxl2QxokKUmm8zCs
 sNyy4IjmviTuTWK0kuPEcFYeUuqzTlFT7rahzRw=
X-Google-Smtp-Source: ABdhPJz7XsSsSRrrLlACMcAMfPCIUpNH5GjFgnMZva/LHBl5YZbkL2eZkFNBDRHX2dCQcy28WASs0omCOIcOPfVFGmM=
X-Received: by 2002:a25:aaee:: with SMTP id
 t101mr45851410ybi.517.1608101619127; 
 Tue, 15 Dec 2020 22:53:39 -0800 (PST)
MIME-Version: 1.0
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Dec 2020 14:53:28 +0800
Message-ID: <CAEUhbmXb79UgB=mjfw3=gS3pgKmiYUhQqEEsXWMTBGPtroiZBQ@mail.gmail.com>
Subject: 32-bit kernel does not boot on QEMU 5.1.0 'virt'
To: Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_015340_771636_805A3236 
X-CRM114-Status: UNSURE (   7.20  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

A 32-bit kernel built from kernel 5.10 tag does not boot on QEMU 5.1.0 'virt'.

git bisect shows that the following commit breaks the 32-bit boot:

1bd14a66ee5200d6a24419cbd2e0a0fccd4da36f is the first bad commit
commit 1bd14a66ee5200d6a24419cbd2e0a0fccd4da36f
Author: Atish Patra <atish.patra@wdc.com>
Date:   Wed Oct 7 14:51:59 2020 -0700

    RISC-V: Remove any memblock representing unusable memory area

    RISC-V limits the physical memory size by -PAGE_OFFSET. Any memory beyond
    that size from DRAM start is unusable. Just remove any memblock pointing
    to those memory region without worrying about computing the maximum size.

    Signed-off-by: Atish Patra <atish.patra@wdc.com>
    Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
    Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

:040000 040000 7c73868aed798c5ce33d6e75124903f716c445cf
1070db6e44e80c08fe6537e70f9beea5cde23154 M        arch

Reverting this commit solves the problem. Would you please take a look?

Note QEMU 5.1.0 must be used to reproduce the problem. The latest QEMU
has switched to fw_dynamic OpenSBI binary and seems to have a problem
too.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
