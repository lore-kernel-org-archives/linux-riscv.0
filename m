Return-Path: <SRS0=iNPO=YY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B564CA9ECB
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2019 18:11:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B4D20650
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2019 18:11:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SB8vBm54";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="anCtXI82"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B4D20650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SDD6PncNB5qiquLb0TPh8/zv82SwulsdDuzwCifoHv0=; b=SB8vBm54K7lgAj
	eq3gsNrB5GCUpyWolWIuxKMnmSscxzy4YS7L6AEBYa7AjY48PJzXozzrLCvu673WCWRaWZAuKaXDm
	6f0NUrJlDrDBHdZNxsKo5bO2OtS0atRxZKzK8bQ39OFc7ywxFa4nBTzYQXhCyavCqVU8vP8E3tZY+
	X5vY1HtruKtNSh3mCh/AZx6gPZkUWavoW1b9LejMPGVqwEpc4/hKmu2CqCcHm+VxbmdIyRXkFQkYf
	WfdDD/tQd4J2Bo906D1HAzzK1i1gAK2ZDAaEuwai/Pt32Oa8QniipT/J9tgE9UX6NVRgb3VvYi8r4
	VHU5nyKW4LT/I13whuow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQEvN-00067m-3F; Thu, 31 Oct 2019 18:11:57 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQEvG-00061e-8O
 for linux-riscv@lists.infradead.org; Thu, 31 Oct 2019 18:11:52 +0000
Received: by mail-il1-x144.google.com with SMTP id f201so571697ilh.6
 for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2019 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:subject:message-id:user-agent:mime-version;
 bh=JeHMqQMHRlzdofeU2AdLK6H9sE5vErvTPI+fNaT6Y0Q=;
 b=anCtXI82wK2UYEPPyRk5cY3/0+UoUebNbWYGfvquIFrchuvys1eXNpeGssCuNOuXiB
 V8edRxmRSVOymdvyC7ujydYNOO5GRQyBJpnfd7uaQcBAWIjFq8jOemykFmWB0NgzaFul
 L4hZN9Fg4J+W/C5bWLTW0QbGfuiSwDhEUmXmqEkzokA5O0rKuRK9+nUcTDJE0EoBGUhB
 8qqKipPVNNjwcnR7+o6MWcmAFCETfcYyepmcZzvVh67GVLil0tDbgenMriCfHyFaXPri
 9hCOC3OlJg60Y+s7S3PSh640eb/Cd6fmI2GC3XBuhoRn3+H+lXR9VEG6iPDBkY4WAtO0
 rIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:user-agent
 :mime-version;
 bh=JeHMqQMHRlzdofeU2AdLK6H9sE5vErvTPI+fNaT6Y0Q=;
 b=SChdr+5fSDByYXjU7G6eOmG/jvwviFhWxG09IZ6exkW5Vy4LL1Od1QvNzZdn0JvFwH
 OLCCmnpFsEhtFnMe8UoHTZyrlz8tlSFsyW3kHyc6R9A6BubWW+/g0NYhYnFyZsvmghF6
 z7/RU3LTWezva3NP1SgDJ2V1JJZTWqDjHdE6p0O4j0dEgOOjsEr1AtOuwpcLxs4Q1YFJ
 SsgHoGWOKTgVr8zb4H960A2KiVwnvQ9bwIyy0S91RzyzENB4ARMD4mF1R4k3s0WZImDd
 EHftIV7Psd8a7VRZOBNO94jWt9WVbX9Q7oQ/FpdOu9PJtJ4TqL5WkQ9MHJOLlnvd2I12
 PTLw==
X-Gm-Message-State: APjAAAUDEUFU69nQLadF5U4hLOC+rZr2mEzLWXbAkwky41/awlcottpI
 U3TGTjUij9tOGE0Y1LF8jPMvq3LlC7o=
X-Google-Smtp-Source: APXvYqypiIVcNe2fxDkPHBMejVDwtiPlqOnogYhZrVIHC6A5lLdaJzoF8cGyLcLerCEZA9Hu2nF2iw==
X-Received: by 2002:a92:4609:: with SMTP id t9mr7160801ila.156.1572545508348; 
 Thu, 31 Oct 2019 11:11:48 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id d197sm363664iog.15.2019.10.31.11.11.47
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2019 11:11:47 -0700 (PDT)
Date: Thu, 31 Oct 2019 11:11:45 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-riscv@lists.infradead.org
Subject: Experimental branch
Message-ID: <alpine.DEB.2.21.9999.1910311101480.23683@viisi.sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_111150_495170_3716C4F9 
X-CRM114-Status: UNSURE (   6.94  )
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


Hi,

There is now an "experimental" branch on the RISC-V kernel git tree:

  https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=experimental

This branch will contain patches that have been posted to the list which 
are getting close to being in shape, but which are not yet ready for 
merging.  It's an unstable branch, so don't base any patch submissions on 
it.  The intention is to make it easier for folks to see what's upcoming 
in the distant future, beyond what's been queued for submission to Linus.  
This branch will receive very little testing to start, but this will 
improve over time as our automated testing improves.

Right now the experimental branch contains the following patches:

- Steven Price's generic page table dumping code (not yet in mainline, but 
  looks close)
- Zong Li's page table dumping code for RISC-V (based on Steven's generic
  page table dumper patches)
- Anup Patel's KVM patches (waiting for the hypervisor specification to 
  exit draft status, and for reviews and testing)

but we expect patch sets to be added and removed quite frequently.


regards,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
