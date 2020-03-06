Return-Path: <SRS0=72ER=4X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B827AC3F2D1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2020 00:02:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84424207FD
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2020 00:02:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dGhn6kpo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="usQNsRNw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84424207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lEx3mbJGiKeEXvxraB+JKr/DKkGfwpgYwbWrzWfsAtI=; b=dGhn6kpoK757mD
	DDCWyi5H5HujwVRHQnc+iV1Bw6O+q39dhVQa1FFRieKsb71CBbyGwf7/sggatF9gN6jSz9xAinMvM
	wU2c3VIOdv4aqAx4A+esLVc4taU57c2jM6WaxJB/Z1+SnD6ImhKnXT9nXbXohkWm4EhNji0hpIGvb
	eyffd98odFH+fwf3VfM+m4/QU2iTAhcellyZA5PTA96plIZ4xL5J24bvKgRqQEg0NZMGSY30tWEAF
	eYZXZzY6pMac0PIUMHohEwXTlGJe+HLatzMnhgfn3MJ8T4Dw6ihzcSGC/nuLNX6U1r4oWF78dMRtT
	XuHCQVxEwJBnz9JnH1YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA0Rv-0002It-Oc; Fri, 06 Mar 2020 00:02:43 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA0Rt-0002IQ-9C
 for linux-riscv@lists.infradead.org; Fri, 06 Mar 2020 00:02:42 +0000
Received: by mail-pf1-x442.google.com with SMTP id z65so166224pfz.8
 for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2020 16:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lEx3mbJGiKeEXvxraB+JKr/DKkGfwpgYwbWrzWfsAtI=;
 b=usQNsRNwrKXKCDE/3+Zs5C20nk/L+PZYnbzZbdLuERUPx9Gaz0MxQsTUGUO+Ok3tAB
 VkrORlFUMeKXaQCOxtkgMJLuPXcdA9woD4GUtt9hAue5jHzcEnOgw52JhkvjP911MGAD
 YOPoN8iMZ9B3Joe/Q7KyxMzgIrUqHtoO9KxqhtHPWhOAVekhQ39qHegUGtevVtNMsFrr
 uSrR7FB+MgWSntR+rq58ArfHhBCtrBNSxbJabvA8797y8TWpp7CwAJsU9/aP+XBqgzel
 jhln5m8+59B9HP0SQ8l89M7VFAPPt8zRA2Wdq33MhyNJ2RY3W9iMFKneRfpPKFTB1x5L
 7GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lEx3mbJGiKeEXvxraB+JKr/DKkGfwpgYwbWrzWfsAtI=;
 b=dOb+nxKyTifrPn1QSKTsX226MxfgCbHd6oCTyJBcfjSt3f8CnG6KYS0BerltColmlI
 mqERcAgFQs1FZ5UB0/tTUn2lOc6UnP6aEVfQN+lhxbZq2vRZh565hUCyQo1B4429IIoc
 3qJdxQ9py+2ZvRIFBmKcPH7VH83LiY964m15Ky19X/R3DXqsoMhMfm6DBsFyUwiqhmki
 rklWxET2sE8tsDlnVbuafaIzLOePGTCfBGfjr6PNBrtEq0TXa6YOoYvUyJYrsjy1/MT0
 ZHHAy+hf4w9BscHmfAbiovkPAKOR2KuhAuYkebUQ4eoqLrk302+AhzuCVsGy501GtX3W
 DmpA==
X-Gm-Message-State: ANhLgQ1DtneGUjSiMaYSipc0E3ECHo7WN1reajHEWGxZNT8pj27PvHFB
 Xpqr3bBrWzgegG0YTo7Rj1yHQQ==
X-Google-Smtp-Source: ADFU+vvxrcvqVvr1z+jGHKogkWUowyP4jcgYAaHtzqpDhXoQ6QG14zzRtSyWudWh7TydkClqn5DS0A==
X-Received: by 2002:a62:e713:: with SMTP id s19mr908777pfh.20.1583452960166;
 Thu, 05 Mar 2020 16:02:40 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id j21sm7128491pji.13.2020.03.05.16.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 16:02:39 -0800 (PST)
Date: Thu, 05 Mar 2020 16:02:39 -0800 (PST)
X-Google-Original-Date: Thu, 05 Mar 2020 14:00:00 PST (-0800)
Subject: Re: [PATCH] riscv: fix seccomp reject syscall code path
In-Reply-To: <20200223171757.GB22040@cisco>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tycho@tycho.ws
Message-ID: <mhng-75f7f767-2b9d-404d-817f-ac39e1b2dc50@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_160241_349263_2BC1E1CA 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: keescook@chromium.org, david.abdurachmanov@gmail.com, oleg@redhat.com,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, luto@amacapital.net
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 23 Feb 2020 09:17:57 PST (-0800), tycho@tycho.ws wrote:
> On Sat, Feb 08, 2020 at 08:18:17AM -0700, Tycho Andersen wrote:
>> ...
>
> Ping, any risc-v people have thoughts on this?

Thanks for fixing this.  It ended up escaping my inbox, but it's on fixes now
and targeted for the next RC.

