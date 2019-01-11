Return-Path: <SRS0=/Bz6=PT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E98C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 06:18:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6937220870
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 06:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C6UvNw/u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="D2GpO7WT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6937220870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4mwlMrqTNrjfYcXgDtCEEhiJP60/Pyj2QXjdpC5DyM=; b=C6UvNw/uA73bga
	nEmIEQVTieASr3LAIx0YexwSnEoKitAFv/mjb2CSmjvjL2tqiCzOiOfTo+Tdv5TRLBbYiMnrXVpPe
	sdUuWB9r6fv4FAjtTi89THUs87t2X+VKUMwdR9A2WyhsC+0QqXA46PJ7DxpkIO8E8YaF/YVIVBAv1
	xqXG4xyS9JnX5QiKX0LzgeycPCEF8uFr7SPXO4BjzhUDXDM2c3teJe9rGV0wJT/mVx6V5Dn0akp1B
	w/XpaIMIhXu6zJt7jmTfy1gReuijl3H/cnb1HaLrwwA1vPUZjy9rOzwsJOe+g2g2FyFBzhGUBqhcQ
	jktE4/lQVbik9dxPEw+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghq9N-0006qc-9K; Fri, 11 Jan 2019 06:18:37 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghq9J-0006py-U4
 for linux-riscv@lists.infradead.org; Fri, 11 Jan 2019 06:18:35 +0000
Received: by mail-pf1-x443.google.com with SMTP id r136so6464537pfc.6
 for <linux-riscv@lists.infradead.org>; Thu, 10 Jan 2019 22:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Odd+d7FRnWKozZoyrm85E0qq1CgMg6d5XpBldOLqvE4=;
 b=D2GpO7WTBKs3z+AkN4S0bDDH5YLwW3d7KQQmMz51zjBJCbiwQfEt6xRP8eesLEHgsZ
 0aDAbn497/baah6/r9ePKiU3SneHiUCS41enMD9O470cEV9JmKcTR3IMVd5zrFWtbJcY
 1DfNLvh8jxQe6I5eo+CUjmzj7Y5UAdhYFS9wap/YeWsfdrvkyZMFL+/Zj4jqU1aTmSXN
 h0Vshg+q0qG7GzoSR8kDOzeLLZiVXQHwVJiySHuJKjDDSdb+MfrT4pKgrjNjqPiWZ1nQ
 ptdAOL0gmhS97aIzrRs0CbrlaLCwk3df5Q4qrnJYMve/6R/udziqzVgoGiynOrxJJ8YN
 lMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Odd+d7FRnWKozZoyrm85E0qq1CgMg6d5XpBldOLqvE4=;
 b=lhQJSdAv8DdekkjtIg5UY10/W8Ngm557cZakjO6giOsHvXGYEWjVA9gqguNvtUv68P
 PpgwvgQlgF7P/GNUlVSBRM4/JEUnz1dpaPm6JlVc1QpbXr1r0CPwb9Vu/EzbgxT9z/uG
 /9z0TjKMZ1kXWYxW0ChVf4OXJWU7bwEVd8HkTChkgiLzohps4BW4Th66KhgSsBrR+aia
 oJTVgIH/+yCPDaNU+WkEsf3QLS9quqflK7UHY9veZ23pyZt28B/QAFz55p1JNyp7TQV6
 zjs6YqHigNSYpM1q9FEfYfeewidE8DRTPClyocgOny3F9bP+nT3AhH9m8h0Y3+PG4eKk
 W/1w==
X-Gm-Message-State: AJcUukcwAzDGJXdWH2b3VeFNJUbTMezMpOkSyK4i++m8s/XLzZhLPPD6
 Rt08+PNmNrn8PCkta7OHP8yuVw==
X-Google-Smtp-Source: ALg8bN7t7y2f75pxqWUVGFGf0z7L0qxYYjnGe8eBmMz51gqXGJ1hqxXM2QLa5gTxL9urnS3c3HjV7g==
X-Received: by 2002:a63:9809:: with SMTP id q9mr12261502pgd.109.1547187513063; 
 Thu, 10 Jan 2019 22:18:33 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r187sm244596079pfc.63.2019.01.10.22.18.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 22:18:32 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Thu, 10 Jan 2019 22:18:31 -0800 (PST)
To: Alexandre Ghiti <aghiti@upmem.com>
Subject: Re: [PATCH 1/3] riscv: Introduce huge page support for 32/64bit kernel
In-Reply-To: <20181210062146.24951-2-aghiti@upmem.com>
Message-ID: <alpine.DEB.2.21.9999.1901102215390.22105@viisi.sifive.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <20181210062146.24951-2-aghiti@upmem.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_221833_979391_881E429A 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, palmer@sifive.com,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, mingo@kernel.org,
 atish.patra@wdc.com, linux-riscv@lists.infradead.org,
 akpm@linux-foundation.org, mike.kravetz@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello Alexandre,

On Mon, 10 Dec 2018, Alexandre Ghiti wrote:

> This patch implements both 4MB huge page support for 32bit kernel
> and 2MB/1GB huge pages support for 64bit kernel.
> 
> Signed-off-by: Alexandre Ghiti <aghiti@upmem.com>

This patch introduces a few minor checkpatch and strict checkpatch 
warnings, when tested against both v4.20 and v5.0-rc1 checkpatch versions.  
Could you fix those?  The other two patches in the series look OK from 
that point of view.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
