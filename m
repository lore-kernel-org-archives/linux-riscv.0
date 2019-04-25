Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2D0C43218
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 18:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BAC420717
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 18:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PMHxFcJW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="l56nmXBz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BAC420717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=uuGUK8puOklYWNPU4V/aKmom/s/wa0TfcYBPnYgygCc=; b=PMHxFcJWBMz36PSqsUryIY9Pt
	my4fQTeciDDro7d3qIu/UXUJ4KEmyh81x2Lf7lsT5mBJUCfFTx1hRfiLAbK3S4hq9OxmbVfybPFmM
	hG2wM25dgchrt/nGDdrhklK8WG7+aFtbZ0q5vwBzYNqqLZMz0p0UM83rLWxOCJGR/1QFJCR4ZTCzi
	9Q4cqYcPAMMdExvWg/Zy/z9tpg9tY267OSIXim2x2wSYEHxEepwIU/SCU75ePIwjqbKPvOek2itL5
	SaRcQe0FrIUOvvzpW1iaynWubZnE0XRz9z72OTuBcvcMveS+OAW9Bs40q+agYvMpTqtKEkf3qIC/+
	5HlJUnjqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJiqC-0006k0-6B; Thu, 25 Apr 2019 18:11:24 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJiq9-0006jg-G8
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 18:11:22 +0000
Received: by mail-pf1-x441.google.com with SMTP id e24so288145pfi.12
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5lGPiotqFsXnHCFPcp4p25LBjmPjAhvbjVU4U9JLqy8=;
 b=l56nmXBzEGn1m1ng/I+i9/CB4YNSitXs36Enhz6nr5OVnUymBa/d9hvhoTQPzHSA9l
 XehOK/PtPQ8Gwkasm5ySnOXMQmSPT0aIQahOAEtx8KBCE46M42Uvkmfc5Nsa9pQ8MkiL
 y2Dq+rPIxm4BkyUQA+P8IC2zp+SGpEaZwK6JMdk81I55bBOnHfjVpT3beLY6LHUJgpc2
 6elPBLWDBUvrUt7edFugW1bQbgXRfzowRCpvyuRPSrwn2qWo92eJU8UUJTKkjGgYOGKV
 /JTvobI/pZ8VbnUcPYQHt4jVbCV0w57KEHfuVgXhG3jB8yS5ys1GH7VSOskJ3bblJ6i8
 Strw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5lGPiotqFsXnHCFPcp4p25LBjmPjAhvbjVU4U9JLqy8=;
 b=JaowT8JKDmuFVjKBJzFCrfrzg1T8vm+L6Ww3AM8VLNrPlHL+W6KbmQl8EcZnUyRaAN
 W7l0UbXh5NXpMglMSziH4oBq+XOWveWHkmvDz/6DCJadbEdJdDRTCtxjjmCIOLbtxaBs
 0eSjMzQL2wLtI6hMaDlVczVIUqFVYkIKRpxypyNABrSbKYRnpuESiN6NGjBuU6pL6D7W
 /E1pdhAGSGtlXYPnisfiEcSCi/PJJx+H06dn/d0ibXLyr6eMHYZe9JpJa98qOqxCGtpd
 JKOxYC7GMEJPJiKgxQPkIJU8K/xyc35UvRrfBSx0O4AbAbRQDd4ihoEd8JovJkuuktmR
 ikhw==
X-Gm-Message-State: APjAAAXuBeZI+z24BbvceBg6EJijwVSSRHC8rROMcC+CJZLZXFPr0uAa
 ejR0HZLpoJ4cNB5QMKa947sLXQ==
X-Google-Smtp-Source: APXvYqyfOTs6fTSBCpgWsKOSSyK/s8tWQGXiH4g6Y4lSbp0B7Dqo90yoBnMyARIpT+YLy9Mou3ZpaA==
X-Received: by 2002:a62:fb16:: with SMTP id x22mr2818961pfm.140.1556215880706; 
 Thu, 25 Apr 2019 11:11:20 -0700 (PDT)
Received: from localhost ([134.134.139.92])
 by smtp.gmail.com with ESMTPSA id e4sm8629592pfn.185.2019.04.25.11.11.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 11:11:19 -0700 (PDT)
Date: Thu, 25 Apr 2019 11:11:19 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Apr 2019 11:11:15 PDT (-0700)
Subject: Re: [PATCH 3/3] riscv/signal: Fixup additional syscall restarting
In-Reply-To: <20190410065304.GA2942@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-e56eb5bc-3336-4e0e-897f-be508b1c5f4a@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_111121_550706_72384FD4 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, guoren@kernel.org, ren_guo@c-sky.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 09 Apr 2019 23:53:04 PDT (-0700), Christoph Hellwig wrote:
> Looks good,
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks!  I've pulled just this patch into my for-next, as I'm assuming the
c-sky patches will go in seperately.  Given that it's been on the list for a
while I think it's a good candidate for rc7, so unless anyone says something or
testing causes a problem I'll send it up tomorrow.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
