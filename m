Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D74C433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 23:28:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E38820768
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 23:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PBGdp4NH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="GWnwwLId"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E38820768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rNyoHzBX3pFTLPyzSvE9M8TDQ/+5h863POusM4ztkM0=; b=PBGdp4NHlE0tMxdU8U8R2UBzx
	hd9+VDbrfEZAXYkXC8GuHtBlojMGlQFoJl8PwSuyFnqdY/eiPqCBSHKB4IfuiTM26lkc/NDoWnuLo
	Hf7XEGvONJOszMoDkdSl2vPuWR3F4+qmzGQH6ET8FW1+Dv9ynB1bC4GMtCCyaiOb+/iAqsd6h9W7L
	8/g5dyzH2hzIOfu4Pkq+90O9gloC/bTYeNsrna5arw/nmFnksWSBgOGawCu9gzWJi+xVi/kVBOGwx
	CiyOBGVUNfqmhc5NLbD1/lZ9t+dNyROjE567AfeefQSYOtctSQKFge7ql2T54plUUJ4MUlx0Q1kFM
	Yp6HGN3RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6j7N-0006me-Gj; Fri, 14 Aug 2020 23:28:13 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6j7K-0006m1-BV
 for linux-riscv@lists.infradead.org; Fri, 14 Aug 2020 23:28:11 +0000
Received: by mail-pf1-x444.google.com with SMTP id u20so5294600pfn.0
 for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2020 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=uDkX0jG6u13wLhugyTid2FyPD+CUWlJE65vd4J+hUuw=;
 b=GWnwwLIdAFGEDXFeo2yD3ifqHgwalpmQsg7oitKTawOaVSkQN9B9eteO/d/u3Wf4Sb
 B8o7PRI6zuf7D5P1dlkreJJmHCj5olVu6edVI5FIm4uXjlveqplTumDedOgQV/FpvvGw
 /UqtfIjCxUoS24ZT/dQpUBhdlPhy8T8EgeT2vlocIgYJnYlZsILAwredAYNdC7nh8ldb
 +/h4cGY/7y29H9U7Mk6IjbwRR+IWPes4hTYugNvo0+HMRM9XBVk0l03NlnnedjyCPyEN
 tZI+4WwebAKO/X6XmYPC9bL+0sOKVac0gjZhD2fTPUXR7m9c2ZXykXJUqJbcUmyUcpeh
 WVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=uDkX0jG6u13wLhugyTid2FyPD+CUWlJE65vd4J+hUuw=;
 b=YVzQw0jKg1RoxvVS64D/6RJl7V3zkiGhv9pzEIRa2P8vQKeFlfeQojvrdFCxrsoYo4
 k9ozUK1R38ApLXEpGLtdPX0WhEPJGLX7sL1Hh7aqE6Kl90JrSseZI9XI8xbbeF4VlOUw
 SQBpw1UKsQq6VwXsOVaMjV2zhd1IR6+brnIOw0fG7PS3zoDW6wNaZokon1qDBpAFi3/l
 AegN1ox/d1iKA9zAFyeS3pKPudIXytz+wG7CqE8+D1S97wexfloaJ24x5rzd2t2xtb6j
 zaBIrOsj1KOy1hQJ+g29aYxfDSyaiVysghyS4O9pFJGDVKpyYFwYOyoUvq5Ho40W6rlm
 nY9g==
X-Gm-Message-State: AOAM532ychpVYkJ14enA5YzeA829bLJ5FWsY0DX8qmYwnyDlp8UO23rB
 aKzcZlateZWhXy1u5f75C0IHXg==
X-Google-Smtp-Source: ABdhPJxcX6ReXOv8BVKzzWJYJ/a0XOACfPkpgTE/NLWhN+slsY92V6w9PARQjE5WUAOMqkHa3SnQuw==
X-Received: by 2002:a65:6205:: with SMTP id d5mr3063739pgv.432.1597447688010; 
 Fri, 14 Aug 2020 16:28:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r91sm9245816pja.56.2020.08.14.16.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 16:28:07 -0700 (PDT)
Date: Fri, 14 Aug 2020 16:28:07 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2020 16:28:04 PDT (-0700)
Subject: Re: [PATCH] Documentation/features: refresh RISC-V arch support files
In-Reply-To: <20200814232245.lmwdkla7zx22vtls@distanz.ch>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tklauser@distanz.ch
Message-ID: <mhng-99e80cc6-a887-407f-ad22-6ef4552f382e@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_192810_399692_7A586CA6 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-doc@vger.kernel.org, aou@eecs.berkeley.edu, corbet@lwn.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 14 Aug 2020 16:22:45 PDT (-0700), tklauser@distanz.ch wrote:
> On 2020-08-15 at 00:38:52 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> [...]
>> Thanks.  I've put this on fixes.  Unless there are any issues I'll be sending
>> out a PR tomorrow.
>
> Jonathan already applied the patch to the linux-doc tree [1] and
> it made it into Linus' tree [2] in the meantime.
>
> [1] https://lore.kernel.org/linux-doc/20200811103940.0a9229b9@lwn.net/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f30c3ff3f0e8305d6c1a210df6d588a13333b8f7
>
> Thanks

Thanks -- I thought that's how these went in, but I didn't see anything.  I
must have just missed it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
