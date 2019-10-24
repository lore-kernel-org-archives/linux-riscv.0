Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF75CA9EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 02:23:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC772086D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 02:23:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UNwPsf+w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Zrv6A3fx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC772086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uctOI46/K9yz/RO0Zpy47DbC1Ty7gag5nEXmP00sgg=; b=UNwPsf+wMC8gOL
	P20h2p19vyl5hLbnFLl9o4d/SZPBWKHSDfiS1Hhko1+/PClX+/esJ/7D5w3qsfgs0UQzeqWOZFZlT
	22SCGYvu4rADFZDEFNq2GwFU/x3A9fqZW2oDgwOulex7WxBCYJ4Lp8L7KAPCVPJbSoJRTUhfjOr6o
	XQcpoqqvv5MuNIF0oY3w9PFjn+EAy3AXiJgVtuWP1v2hpFIItj54qfHGbrHzZv7fHAaOptSAwoeQj
	aIS3Voicm+r4O3F5vYiDmbQABkaeNnHhLANEVmscWC84tQ11Nn6MtcSxzjE8qIZl59YAA82e1Swqg
	ZOoSWisox2AfBekPS3ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNSmY-0004ci-Nf; Thu, 24 Oct 2019 02:23:22 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNSmV-0004cP-VU
 for linux-riscv@lists.infradead.org; Thu, 24 Oct 2019 02:23:21 +0000
Received: by mail-il1-x141.google.com with SMTP id o16so12817100ilq.9
 for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2019 19:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=UKXBfFsSsS+KQFVSXZJ5Z5ciwn2HoQ35BmGLy8gFF54=;
 b=Zrv6A3fxB7wBT18mzB2qZzt70OLhTa/qc1nz219KW347fOQjRxP4kaZes0FhVIkYxt
 Ip2nI/t5mog2flCIGP1RkTjbjrJJIKtsDaLo3fyan3tjD7DokCc3l5l4wC0bDZo/va9t
 /VXp06hvbFFVR37EmsOufJeumhTaSgrZuiB3SQA/xh5vFWlrbYpMPEdCd0Fp1vhXExIY
 N1x5YT2O70QkJAhTmZ34jt6C1ffWomGg+W94Ak/WLZT/bVOZMvZ5PDF2tR2gYGS0L1Yk
 +cStlGUh2wVetQDR4GRblk1Z6GWcH6ezP1webozEg71n7OrrC/PSbFzrjrbtT5hyOxK1
 rX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=UKXBfFsSsS+KQFVSXZJ5Z5ciwn2HoQ35BmGLy8gFF54=;
 b=jf0GkgGou9a6moDX33sVwmKerzhyLMi8FRohC1YoGeNNTwG2USxARDbQGmZRtM/p93
 CFbbNp2/YmcyjDClQMGPof0EP5wGpU8GprFtrdwmm03saAKsbZCCcWqvxIBH56SpKTSx
 9EbCnaFMD36xctfUzf2Gn9/7lqJ1nDN0IGEHbYXABDxJ35Z9y+SWKpbBYGANcjG+f/Mb
 XoYsHLaOK2y+5kVKwNyrfXYVyB8leI6woxCc9F9R0wBeTa04rWOls7Y2l0nq3LDLLWnf
 K/3SA1CBrb48arcMDnbN976Irkt5Lc70r+0xfSoZCdEjXEZv5V1b0T3FMzui0G5mz+r0
 /YwA==
X-Gm-Message-State: APjAAAWH67xConjImf4Q04VHZTN86nuUSdatDkWDTKbXgciydyxNS5BB
 6yI5glLQXSHWX9RVQ8D3ld94oA==
X-Google-Smtp-Source: APXvYqx+WZbDrR/2m/39Q5jylPjOxKGBNdSh6U7ymXW2iPi2LdDpDbbXSn++d9383knPfHbb0MJqhw==
X-Received: by 2002:a92:d643:: with SMTP id x3mr14848111ilp.203.1571883799058; 
 Wed, 23 Oct 2019 19:23:19 -0700 (PDT)
Received: from localhost (67-0-11-246.albq.qwest.net. [67.0.11.246])
 by smtp.gmail.com with ESMTPSA id y7sm7707327ior.45.2019.10.23.19.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 19:23:18 -0700 (PDT)
Date: Wed, 23 Oct 2019 19:23:17 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: Perf-related compilation issues
In-Reply-To: <1bba622b-1f59-d21b-f396-d9c1a021dc3a@ics.forth.gr>
Message-ID: <alpine.DEB.2.21.9999.1910231922110.2470@viisi.sifive.com>
References: <1bba622b-1f59-d21b-f396-d9c1a021dc3a@ics.forth.gr>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_192320_016349_B09FE528 
X-CRM114-Status: UNSURE (   8.50  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 23 Oct 2019, Nick Kossifidis wrote:

> a) Compiling the current fixes branch with a minimal config I get the
> following error:
> 
> riscv64-unknown-linux-gnu-ld: arch/riscv/kernel/perf_callchain.o: in
> function `.L0 ':
> perf_callchain.c:(.text+0x16a): undefined reference to `walk_stackframe'
> make: *** [Makefile:1074: vmlinux] Error 1
> 
> 
> I've removed the static delcaration of walk_stackframe on stackframe.c
> and marked walk_stackframe as extern on perf_callchain.c to fix the
> above issue.

Greentime found the same issue:

https://lore.kernel.org/linux-riscv/CAEbi=3dk0R3HMnqsK1mSm2bewecdHm279f9zEq1pHWLPo9tdAg@mail.gmail.com/

Will fix this in the upcoming revision of these patches.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
