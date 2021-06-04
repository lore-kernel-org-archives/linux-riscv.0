Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865D3C47424
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 16:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FFE61405
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 16:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FFE61405
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2J7qasEPdHYaQMRjEKOFHjsSwxGk8XtKyAlEIvkVX/g=; b=hTrv5nShqsgjXYn/R4cQ26ZNxx
	LKZhVFsusg2DFifE/WLW7UOPOUmHE1Ymb9V4mdLUQ4paj2R/urrFZ8tS3KlAVNMPqccyMJewDte37
	jNLQdC0Wu71Sy2dhoNjaJFbkyTQueQTBK8HjAtgTtwdCL33MxADsCMEN5vy4Cis9bV/Da13hjcm3A
	8QZtLl5Udrv+OLfEHtsq14V01AV9CsT90VvdnYmme57mQXjAzuefg34qn3TjhqHT2gCIQ/TTrtl3Y
	Gj8vWieyoM9bDW6JlVH6I8LsjJglq1ZuMcd26Ld0cfUYMg5CXjFjrA6G4u0li921pVYyh/3t3X3Ac
	UdzfbtKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpCYC-00EJOj-JC; Fri, 04 Jun 2021 16:20:00 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpCY7-00EJNm-3n
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 16:19:58 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso1196000pjb.0
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 09:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Vpl5DauNuxvsmRJdt4Nmv/jEj0SVLIWOqqaV6/2qVpQ=;
 b=HnbVBjstJoz3eByCKCPqD4s0v8IhJIP8k1pUQUL7KMGCKEiZpxR+dTkW2WYx8ewSrj
 T2N4eojiD2eu4qtY4ey65CZ/gDkGC5oF6+AciY9ZfeRI1ywVDiWiHaN0gK9W5v1ry1Ba
 tdg/Hz0mE4HIc8DpmXru9EWnjKABqWdXiBu5y2j/NGEHgGd3pwPU/ofrFbzpxxjB+Buo
 FdARHl6ijmur1G/4g96uwwcBgyqFckAnnCAUXZyvm2BHD8AzFyIFMGFhDeoN5mh9Emch
 63x5/yI9qOtdCG/DQ4nS51Trp1/iyqI3ekrQbnbRYNeYWOugKc67l7rGyE03TDpeE+ZS
 EaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Vpl5DauNuxvsmRJdt4Nmv/jEj0SVLIWOqqaV6/2qVpQ=;
 b=WZy1CoUpmjFDK20gHUnmvf9T0viBNoqYZGLT8GyK063A+y80niJsYcPXA4faUSwzMu
 OBgQLnv6QT7qgtEKmUkp2CXgN2sayFbbmpry7RiSiBtIoohylEkFn6keriocMD+BYgwP
 qE/cxdYY5Tp0xnfKh+2TUE9g+JdO/tqM8QTywaJG4bIHOk/Zm0OIgXIR9wf1Fq1kW1mZ
 IHu9pR8njvDav3j425aZCkSoQ7hAtgBHnRrQYBHpQ1r4d9wbZgYNWHvufQQRnJYr34u7
 Zp+xp4J2sOMmoC5xghWFIgog7A3F/24NiHN/4QqnLk3/6oeISUR1Sb7Imy72wHqWxKEk
 VEAw==
X-Gm-Message-State: AOAM530syXBTdPVJYJhBd/aVTqUyIxElhE6/VCZyDDgkrXYzmyl+huts
 h/qhf3Qonol+kxKZc6BUNQntHQ==
X-Google-Smtp-Source: ABdhPJyco87jjGkn4Aw8Z4TnYyem/s1TOCbVFW3+1vHXJGxD3HCn7nhj6G2/0wKOHKzRmJicdJvcVA==
X-Received: by 2002:a17:902:d50f:b029:10c:85d:6ae8 with SMTP id
 b15-20020a170902d50fb029010c085d6ae8mr4942836plg.56.1622823594171; 
 Fri, 04 Jun 2021 09:19:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g22sm2071496pfv.123.2021.06.04.09.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:19:53 -0700 (PDT)
Date: Fri, 04 Jun 2021 09:19:53 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Jun 2021 09:19:51 PDT (-0700)
Subject: Re: [PATCH 0/1] riscv: better network performance with memcpy, uaccess
In-Reply-To: <CACuRN0NjftJDUAsF2pkXbx0jnJ=bba9+j-hJA8Mjj0r4RVicLA@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 gary@garyguo.net, nickhu@andestech.com, nylon7@andestech.com,
 akira.tsukamoto@gmail.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: akira.tsukamoto@gmail.com
Message-ID: <mhng-a3a53753-73e5-4676-93d3-33c4b8760283@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_091955_192001_06EEBB96 
X-CRM114-Status: GOOD (  23.32  )
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

On Fri, 04 Jun 2021 02:53:33 PDT (-0700), akira.tsukamoto@gmail.com wrote:
> I am adding a cover letter to explain the history and details since
> improvement is a combination with Gary's memcpy patch [1].
>
> Comparison of iperf3 benchmark results by applying Gary's memcpy patch and
> my uaccess optimization patch. All results are from the same base kernel,
> same rootfs and save BeagleV beta board.
>
> First left column : beaglev 5.13.rc4 kernel [2]
> Second column     : Added Palmer's memcpy in C + my uaccess patch [3]
> Third column      : Added Gary's memcpy + my uaccess patch [4]
>
> --- TCP recv ---
> 686 Mbits/sec  |  700 Mbits/sec  |  904 Mbits/sec
> 683 Mbits/sec  |  701 Mbits/sec  |  898 Mbits/sec
> 695 Mbits/sec  |  702 Mbits/sec  |  905 Mbits/sec
>
> --- TCP send ---
> 383 Mbits/sec  |  390 Mbits/sec  |  393 Mbits/sec
> 384 Mbits/sec  |  393 Mbits/sec  |  392 Mbits/sec
>
> --- UDP send ---
> 307 Mbits/sec  |  358 Mbits/sec  |  402 Mbits/sec
> 307 Mbits/sec  |  359 Mbits/sec  |  402 Mbits/sec
>
> --- UDP recv ---
> 630 Mbits/sec  |  799 Mbits/sec  |  875 Mbits/sec
> 730 Mbits/sec  |  796 Mbits/sec  |  873 Mbits/sec
>
>
> The uaccess patch is reducing pipeline stall of read after write (RAW)
> by unroling load and store.
> The main reason for using assembler inside uaccess.S is because the
> __asm_to/copy_from_user() handling page fault must be done manually inside
> the functions.
>
> The above result is combination from Gary $B!G (Bs memcpy speeding up
> by reducing
> the S-mode and M-mode switching and my uaccess reducing pipeline stall for
> user space uses syscall with large data.
>
> We had a discussion of improving network performance on the BeagleV beta
> board with Palmer.
>
> Palmer suggested to use C-based string routines, which checks the unaligned
> address and use 8 bytes aligned copy if the both src and dest are aligned
> and if not use the current copy function.
>
> The Gary's assembly version of memcpy is improving by not using unaligned
> access in 64 bit boundary, uses shifting it after reading with offset of
> aligned access, because every misaligned access is trapped and switches to
> opensbi in M-mode. The main speed up is coming from avoiding S-mode (kernel)
> and M-mode (opensbi) switching.
>
> Processing network packets require a lot of unaligned access for the packet
> header, which is not able to change the design of the header format to be
> aligned.
> And user applications pass large packet data with send/recf() and sendto/
> recvfrom() to repeat less function calls for reading and writing data for the
> optimization.

Makes sense.  I'm still not opposed to moving to a C version, but it'd 
need to be a fairly complicated one.  I think having a fast C memcpy 
would likely benefit a handful of architectures, as everything we're 
talking about is an algorithmic improvement that can be expressed in C.

Given that the simple memcpy doesn't perform well for your workload, I'm 
fine taking the assembly version.

Thanks!

>
> Akira
>
> [1] https://lkml.org/lkml/2021/2/16/778
> [2] https://github.com/mcd500/linux-jh7100/tree/starlight-sdimproved
> [3] https://github.com/mcd500/linux-jh7100/tree/starlight-sd-palmer-string
> [4] https://github.com/mcd500/linux-jh7100/tree/starlight-sd-gary
>
> Akira Tsukamoto (1):
>   riscv: prevent pipeline stall in __asm_to/copy_from_user
>
>  arch/riscv/lib/uaccess.S | 106 +++++++++++++++++++++++++++------------
>  1 file changed, 73 insertions(+), 33 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
