Return-Path: <SRS0=QYSg=PL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3649C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 23:36:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CEC1217F5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 23:36:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r9xW4XTt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BM4sQRNO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CEC1217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Ft1M5zaGQCE4y3cCW+8pwlISy37mbKoMqxFRJobNAWQ=; b=r9xW4XTtKhV/aG78ZoettVkTr
	5WLx3WYcGuyHdqD8HCVQVNv+gyelbsbl3OXeDFz85AT9nQacyVphwO0bCsttzkEk4Qoak98smxQgb
	ar8D0a/AL9SFqHWtyyqNM0zHT3xTH6wzw/fiYpdebbl0swZItsND07Y9uAI8MfhhLw8Sk4o3loKYs
	OPtvpnSmvqIYWj0RlpQTzj2322bhMSK2BIN6coONu48GPy7bXrUlZDgrjrvvxBCJGtkIYUfABkbGH
	TX19YmGD720BZdHBEMKXmshRWxPoLC2f+i3sRNpeLMOc9dntnvkyNZcE9M2wnO5X+a55JnpX2L+X7
	p8ex+alFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfCXW-0006Ls-58; Thu, 03 Jan 2019 23:36:38 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfCXT-0006LX-4K
 for linux-riscv@lists.infradead.org; Thu, 03 Jan 2019 23:36:36 +0000
Received: by mail-pg1-x52d.google.com with SMTP id n2so16651417pgm.3
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jan 2019 15:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zVDxz2K9tFkmT5bREweEEF0kcDCwnnW1hWvzQXc7YQM=;
 b=BM4sQRNOl9eIMfG0/8kWpSYtw+CAYxhxDPl3KTy5jaSepRlplLDZTDtCZn2GcskESg
 rqovp7prPa+LmM1IlAonG3bdwjhjEoYnIG7Ni2LMnDsp0ZCI5vyn+z2Xjo1K3RDjTkjm
 NGe07zqRsD3WBEsSiVvjsKB0uFHCQr8EeE2T9odzDECB/bktj/IxpCF62aq3cw+T/Ftm
 cTyhmHfo3ckzhtPRg4tfi8kx1akEEO2jNsWp+gsoP6tuS7DTHrTgea9HkFmn2zTp5Whg
 zzS5DQtx8p4DGld0A0f9J8kYNjQPXRO7NYAGKTVBK1FP5geAevgtweVjkl4eLBmbagPA
 sqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zVDxz2K9tFkmT5bREweEEF0kcDCwnnW1hWvzQXc7YQM=;
 b=QsqV3jeMeP30/mEomcXouF2L6d0RfM9QtLobwbTAClJod7RM0RcpY4i7PVOc/IQC7j
 xxteaGv6P/YoShXxch101H//sf8ad6arQDd0HuJ4XY3p6LUDLhKEWYqFBKVz1lKJblRB
 8Y+4jN7DgN2DBL9FYEYlXBAApBYSKBCSmpQrI/O+k4zBdJFFCpCceAxufOK2qlrNzbue
 snER7+Wuou7A7TsGaJ5XQ0q7moC/5BLnL+oK74QYU2dZRbn+aHUcU+L8lPmFsb8SWW7k
 vLn1r8zbahDiq/D5zdNU7tSGso1Wy4IvrJUDxVPs3cB/q6EcmsFuPcDbUDRSEfeWfFCx
 GNkw==
X-Gm-Message-State: AJcUukday/uhVxj/k7WPjfVSUatsZ/V7Nq4HqfYuopYeCCRCdHN9M4rq
 tV8uVtUC3N37DsGX6EknEVBYSuXDaZc=
X-Google-Smtp-Source: ALg8bN528j0FlY/kTXxYc8Upq8dLZNLV9jeNM7OKJ/S8T3ihDaQvPAfp9NckbUjXzfE6mQHMp2Tfkg==
X-Received: by 2002:a63:5a57:: with SMTP id k23mr18640843pgm.5.1546558593516; 
 Thu, 03 Jan 2019 15:36:33 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b7sm136535741pga.39.2019.01.03.15.36.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Jan 2019 15:36:32 -0800 (PST)
Date: Thu, 03 Jan 2019 15:36:32 -0800 (PST)
X-Google-Original-Date: Thu, 03 Jan 2019 15:36:26 PST (-0800)
Subject: Re: BUG: FP registers leak across execve
In-Reply-To: <20181210221328.fdl2eoe5cqxudgfs@aurel32.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: aurelien@aurel32.net
Message-ID: <mhng-3e9bd56b-e190-4b20-b428-dcfb1c0f15f2@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190103_153635_202997_F0FF9869 
X-CRM114-Status: GOOD (  13.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 10 Dec 2018 14:13:28 PST (-0800), aurelien@aurel32.net wrote:
> Hi all,
>
> Debugging some glibc testsuite math failures, I have found out that most
> of the time, the FP status register and the FP registers are not zeroed
> as they should. This can be tested with the attached code. The best way
> to reproduce it is to execute from Python (i guess Perl or another
> interpreted language that support FP computation should work). When
> running an FP computation before calling the program, the result of the
> computation can be seen in f10.
>
> The zeroing of the FP status happens in kernel/process.c in the
> flush_thread function. It seems that the kernel restore that state only
> if a context switch happens between flush_thread and the first FP
> instruction of the executed program.
>
> A possible workaround is to restore of the FP registers in flush_thread,
> but that's probably not the best way to do that:
>
>
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -93,6 +93,7 @@ void flush_thread(void)
>          *      fflags: accrued exceptions cleared
>          */
>         memset(&current->thread.fstate, 0, sizeof(current->thread.fstate));
> +       fstate_restore(current, task_pt_regs(current));
>  #endif
>  }

Are you running this in QEMU?  IIRC there was a bug here and we might not have 
the right fix upstream yet.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
