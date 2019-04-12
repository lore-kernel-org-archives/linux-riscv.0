Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925AAC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 01:23:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D7F20869
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 01:23:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+n6xtOL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Xw3BuLlv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63D7F20869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=IZmX2UaUAvsh8H6uYBkGifyBcfT6oYVAZLRPVeer1AE=; b=Q+n6xtOLHEJm0byXHG+jtWdM/
	uUxhD5ajAHWjJ3npkBUxP9IHg7u109KbaFrF0p1ac//qf91VnsJjJfkd9ReIwFeipBlWOtb2D+T6s
	1tct8FNi3e5Go7fVIICF37bnPyIXb8+6cihLo7uB3wt4pLKC5SzjZlSpwQdDeU/synYpJVQYJgcik
	fGATHurLTC2Nnr1PhoBXST6bS8mEfOgeh/Acb1UtKhyUAP5+Oyefq34kYPMwfy2urakm8CxfLEQJm
	+W85vn1xWCs/Ks1UQQA6b+8s+0P3tt5KjIVLq9N/Um2eI1lJJ58V8g7qRRLu2CEEfzttZXhbtLh8X
	WYMrJBIZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEkuh-0000s2-8i; Fri, 12 Apr 2019 01:23:31 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEkub-0000rU-Od
 for linux-riscv@lists.infradead.org; Fri, 12 Apr 2019 01:23:30 +0000
Received: by mail-pg1-x542.google.com with SMTP id k19so4368981pgh.0
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 18:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kTyPED1fC8eQxgbS8wheFzh/vw5d8ZYsn8dwZllUlfE=;
 b=Xw3BuLlv3smqoFcHoFaKmXrX0ZxqUypZTOLyUyqVN1OOkvkjEPXAa4zwMMDaTqCMHG
 oQEQPlFftc3uJiG3bKqLe3rIQbz7obzx5lf1koG6aw5yMWM9rOij1gtgTYVIDGSiSc63
 DgXuN0lTOfmIiWECnViLD9OeYUm4A7EMkO9A/1z+0TlM7uvq44A59Q1FJDLxeyAzbm9C
 U3qgiBgYGkwG+MgUwzlrgYBnUCnQ9ZymdlMtJyNP/0eDhNQ/A5/DPE0DB0ZmvT//T4vZ
 7Tlp6ppid8Ki3oSkMaTrxdhHpwT0NO7A1R6z7ZmvdobLSIJYEZp1EPZ5J0/9MQu7GxPQ
 ateg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kTyPED1fC8eQxgbS8wheFzh/vw5d8ZYsn8dwZllUlfE=;
 b=BJ9C5PuZKYX/yLZJVapqxd8MIxg9LBubMWeSq29A9U/u4W61jJN9OQcdKGAqsmMQek
 iZtD7gLiDIFFTn2LphzEb+AUex+IrubJQ9+uZg+WNeCaoKFv3o/KOf4frrxTgb47fMhh
 KA9+6D9TTuRDqPOZpL1NNt2tz3mJpQEwyFbnjaT4xjcvd3A7ByzGbMg9zm7ovhxLRs/0
 STdzW81q1mBkuWEwk9R4PpS6035xoQPym0vxDB+KcD2Nxcl3oMDEbyylfdMsy4AF7Zq+
 4tAsVqRsrbgyLB8vddbAiUeKSQzCLJtyyVT+skdWcRlpPoZxui+FsWH5S+NDiNkYuSmh
 H6+A==
X-Gm-Message-State: APjAAAWQ+mJBFSNO+10R8T+ra3d4eiVIr/oZXFNll+ZUUMiL0H69i4fC
 lmyfG6qZ47twI9vhIefk6luUOw==
X-Google-Smtp-Source: APXvYqyMYDyz1rBUdtL527noRYkY5/hIfZ3y1p04TX+3DmXkpfCEXtjA+PR5ocmfPYfCe7oa8Tx3Bw==
X-Received: by 2002:a65:610a:: with SMTP id z10mr3736149pgu.23.1555032204539; 
 Thu, 11 Apr 2019 18:23:24 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j28sm74493603pgb.46.2019.04.11.18.23.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 18:23:23 -0700 (PDT)
Date: Thu, 11 Apr 2019 18:23:23 -0700 (PDT)
X-Google-Original-Date: Thu, 11 Apr 2019 18:23:21 PDT (-0700)
Subject: Re: [PATCH 3/9] riscv: remove CONFIG_RISCV_ISA_A
In-Reply-To: <mvm5zrkg2bg.fsf@suse.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: schwab@suse.de
Message-ID: <mhng-c4fcebd9-8339-4e3a-bbec-309c0dc84cc9@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_182325_825321_87616A27 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Apr 2019 05:21:23 PDT (-0700), schwab@suse.de wrote:
> On Apr 11 2019, Christoph Hellwig <hch@lst.de> wrote:
>
>> This option is always enabled, and not supporting the A extensions would
>> create a complete ABI trainwreck, so there is point in even slightly
>
> +no

Sorry, but I can't parse your answer.  Do you agree with or disagree with the 
proposed patch?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
