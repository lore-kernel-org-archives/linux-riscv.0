Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437D8C07E94
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09CBB61405
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 09:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09CBB61405
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2VLd+nv9XxApC2uHnoV6eyQm4GrYg2p+ojmOq93AktU=; b=IZt
	G74GTpu6W6Lkofq+6BCoFFNWR6wQzhT868bTvcECHKpBq56oB+RTsVMOhi3pb+k9qfZlVzvikhLCq
	o1+IqIMhIoLiLLHdX7BgurapVIDTPliN3/qFYqljdrh5prLvftjgwe9belMd1qPAfP/lfu6GnSd1Z
	EUzjhfxjQyq7Jvm5RBxpOF9IbdpMc+zyL1xrE/gpzEi7BKg9QA/wT3l1raD1pxKBf/+DRT65IK161
	xgse9tY2SsYKVu3RmFx7AfYVbS6U7lzzZI8Hqo4xy450G/LIGxVyl3/LAQS/VEaIy8DMty5Yfsn+0
	6X0Age4yV+eZR+Q2tSdUO+K92HMD8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp6XV-00ClNx-SO; Fri, 04 Jun 2021 09:54:53 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6XR-00ClMZ-Cd
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 09:54:53 +0000
Received: by mail-qt1-f172.google.com with SMTP id t20so6534995qtx.8
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 02:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FlfOt5ZHd9jswm+VbsyTDC9ioUME0yS40PkkEczf0Y0=;
 b=Je2OMatfku272SCys5wuDeevnAQuoLeZkgdAbEr/5K4pXTiED5RWjXXFR6ASBJkcga
 4RfBcqtAd0IEbQ0zMUoqZrkmh//WGaFOMBQ69RV54tQfjUQ2j7cYRWC2ty4gvYeARXNM
 zOFzgoQG7/yDFnrzF1kCUkEX42wG+jzUP752BWL+iisTJItJC/DFS5OD8Un3gsKexafi
 6MFnmuN9Yie17X2YSDJqir774ETG2ESiWC7iDaZa5C/b7KGdcQLhkfjgol4vJQgDSeXw
 hsiEnsAZihm4EUozsqqAo/CY41FQHSd1FraBTNt8/kTl4L4+alMm2Aci7LVS+YZFPtAA
 o5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FlfOt5ZHd9jswm+VbsyTDC9ioUME0yS40PkkEczf0Y0=;
 b=OoABhEBulhKYQAdxKGa2wDHDUqK3taAlLlon0AFBYkR9DVUFHQgKmasyM/AqnWQ1Tw
 dXI7zWWwkkyOa94LLX5gQoZRkbMaDP875Wj5VbP1LtDzwe02FErYGJ/Ue3SyZnbXMNih
 0p7CUkJDWGaSSyb+ePr7mHg9u26GbCoAGu0hkmQZy/alQ3ZTuoSlR+K1ADobtyrSZ8N3
 fswxGuVmqitSfvvNQzo+wofMlLktfBA4mInl8YrYUx6fHb0H+mjzZRfC+hhMyYjJ4eGo
 dWmChEAXovqgTeObVJhI6K6jdarL0pcXGz8QjgLd6FyeSGnrflLynztSJuVyAupFDodT
 URng==
X-Gm-Message-State: AOAM530Foc6S5IBD3m0iBG9hWGrQwxAzJZbK7BUCaP7a9tzQ9w9iDaT4
 q4BDX/ZZxoiswqyXC16d35Ilnm1zL01uGOOA9gA=
X-Google-Smtp-Source: ABdhPJwVwznMNJLi7K3cb0oL7/O0blrCBHqQbUVLtyL8W6808bqa4dS7SJcbZZti9fTrimhgectolbRglfaKv4KR5Ww=
X-Received: by 2002:ac8:5313:: with SMTP id t19mr3898290qtn.190.1622800424625; 
 Fri, 04 Jun 2021 02:53:44 -0700 (PDT)
MIME-Version: 1.0
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Date: Fri, 4 Jun 2021 18:53:33 +0900
Message-ID: <CACuRN0NjftJDUAsF2pkXbx0jnJ=bba9+j-hJA8Mjj0r4RVicLA@mail.gmail.com>
Subject: [PATCH 0/1] riscv: better network performance with memcpy, uaccess
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>,
 Nick Hu <nickhu@andestech.com>, 
 Nylon Chen <nylon7@andestech.com>, Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 linux-riscv@lists.infradead.org, 
 Linux kernel mailing list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_025449_458479_F263945F 
X-CRM114-Status: GOOD (  10.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I am adding a cover letter to explain the history and details since
improvement is a combination with Gary's memcpy patch [1].

Comparison of iperf3 benchmark results by applying Gary's memcpy patch and
my uaccess optimization patch. All results are from the same base kernel,
same rootfs and save BeagleV beta board.

First left column : beaglev 5.13.rc4 kernel [2]
Second column     : Added Palmer's memcpy in C + my uaccess patch [3]
Third column      : Added Gary's memcpy + my uaccess patch [4]

--- TCP recv ---
686 Mbits/sec  |  700 Mbits/sec  |  904 Mbits/sec
683 Mbits/sec  |  701 Mbits/sec  |  898 Mbits/sec
695 Mbits/sec  |  702 Mbits/sec  |  905 Mbits/sec

--- TCP send ---
383 Mbits/sec  |  390 Mbits/sec  |  393 Mbits/sec
384 Mbits/sec  |  393 Mbits/sec  |  392 Mbits/sec

--- UDP send ---
307 Mbits/sec  |  358 Mbits/sec  |  402 Mbits/sec
307 Mbits/sec  |  359 Mbits/sec  |  402 Mbits/sec

--- UDP recv ---
630 Mbits/sec  |  799 Mbits/sec  |  875 Mbits/sec
730 Mbits/sec  |  796 Mbits/sec  |  873 Mbits/sec


The uaccess patch is reducing pipeline stall of read after write (RAW)
by unroling load and store.
The main reason for using assembler inside uaccess.S is because the
__asm_to/copy_from_user() handling page fault must be done manually inside
the functions.

The above result is combination from Gary $B!G (Bs memcpy speeding up
by reducing
the S-mode and M-mode switching and my uaccess reducing pipeline stall for
user space uses syscall with large data.

We had a discussion of improving network performance on the BeagleV beta
board with Palmer.

Palmer suggested to use C-based string routines, which checks the unaligned
address and use 8 bytes aligned copy if the both src and dest are aligned
and if not use the current copy function.

The Gary's assembly version of memcpy is improving by not using unaligned
access in 64 bit boundary, uses shifting it after reading with offset of
aligned access, because every misaligned access is trapped and switches to
opensbi in M-mode. The main speed up is coming from avoiding S-mode (kernel)
and M-mode (opensbi) switching.

Processing network packets require a lot of unaligned access for the packet
header, which is not able to change the design of the header format to be
aligned.
And user applications pass large packet data with send/recf() and sendto/
recvfrom() to repeat less function calls for reading and writing data for the
optimization.

Akira

[1] https://lkml.org/lkml/2021/2/16/778
[2] https://github.com/mcd500/linux-jh7100/tree/starlight-sdimproved
[3] https://github.com/mcd500/linux-jh7100/tree/starlight-sd-palmer-string
[4] https://github.com/mcd500/linux-jh7100/tree/starlight-sd-gary

Akira Tsukamoto (1):
  riscv: prevent pipeline stall in __asm_to/copy_from_user

 arch/riscv/lib/uaccess.S | 106 +++++++++++++++++++++++++++------------
 1 file changed, 73 insertions(+), 33 deletions(-)

--
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
