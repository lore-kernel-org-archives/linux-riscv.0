Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21CBC2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E0D2071A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 07:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="25KrOYeD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="RBRw+86r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E0D2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Mro0jjSsCDPi7BtMZzJwtqXYmEZudPskh2uRoNzOn4g=; b=25KrOYeDDFGlBKewEWHg1kXZZ
	2F+GtS05cDeRCZyIn1x5WhTQvCF/L8mR68lUarVSuv2jUWn/B5diytViWhO88UAyHgQjrK8Ogh6W2
	5/eWuiIx6oIfCJ6CmlpRHPmonN1nfT5m7z21G5U2/vBo3SzjfhtsXX0kTjUJ6U6Srn6dfuGy3k6yP
	krmpZ6GHpPO/+jxUQw7aBdyXJJ69PNEown9v3ZpNRNgzjwGH/WHYmXT3uySosuw6Ez1kQqQt2jlq+
	4RdPDalbu5Ymsb6Trw+yLuOWgYAC/r4FPTldEu2TVswpoLMOX4e4q8U+Y1Pqywx7C4QEZqVy9ZaWR
	fNjPtHsTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kawGM-0004uZ-Cr; Fri, 06 Nov 2020 07:34:22 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kawGK-0004tX-Un
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 07:34:21 +0000
Received: by mail-pg1-x533.google.com with SMTP id r10so272897pgb.10
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 23:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gnquAVwim3lWeDYuXOidnFBuId8ZNT6kfQUdUWViku4=;
 b=RBRw+86rFAOQpo7UqupFk+13rRGBDvQgZ3Or8LDU66P3YKxcMXAlTQBLXTNmCopIh0
 D848CHZ+d6Wtqklwkrai4qcicbvxOBlYxIv6IiBIBVPDm7NwmxsjUW8yLp2bGl5FRsvH
 dWH3+mN2+O2WHaZ114DnAd/+qqrfIzCXX3pXLcqjlM1SiQZEZ6d3Al83gVhXJmn99jXy
 wWquB41DQZxI5wu/IQjrUBwZVA9J5prgVA+eAMg62W2jHEOS4myq6AZ/1OZGdci0TwUP
 JCUgd5bd3jE7nDZ1gj8DBZqzwhks778ThjeiOCZiG4eXbJ8sXHZ8FjVz/+g+z57d7ooV
 7jQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gnquAVwim3lWeDYuXOidnFBuId8ZNT6kfQUdUWViku4=;
 b=uDLZhtcGv19/dUjisf+tdLv0G3Z4aKNMFMjtMxeu6/SjYJHE2W+kOzegzNf7/xITIl
 gBK5rzCDlPg0uXzGuRnfNmbvz4At1uQwtoS9U0CSnOymPZ/8vO/rjnsNUTifW+enS6DZ
 MrjS+xq6LDA4+W+mTXs4VoxD14lZcLoG35MZz3/EQQU7MatUxYiXejP3dfkfnM5D4vK+
 sLI+QkiRYCsCH0AYVBHm6ukOAPXL73WWWLjXTGcbxHlZAv+vesLDmsk50QvzcJFk8uR3
 6rnHejhvLS37pCPJWi7JmMKE0pT2UWP0gH6Q6cTVub/T0DXgysZ82SnZRlfEI30tlln2
 U/Kw==
X-Gm-Message-State: AOAM531YQ5WwtEULqPbWqN115YucmlEo0j/BQAGFXWywOkklEkNeaW2b
 wGL885q3QCjRSIEdN+eKdv4JAHzkqvyxss0s
X-Google-Smtp-Source: ABdhPJxIfHZO+PBa0uWkDpkCt7la6zVLkcE1bhEiWMlasrIMIvx2hwlZqIODohQJxsKfEcNzPIAprA==
X-Received: by 2002:a62:52d7:0:b029:18b:7093:fb88 with SMTP id
 g206-20020a6252d70000b029018b7093fb88mr727884pfb.76.1604648058274; 
 Thu, 05 Nov 2020 23:34:18 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w4sm1093388pjh.14.2020.11.05.23.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 23:34:17 -0800 (PST)
Date: Thu, 05 Nov 2020 23:34:17 -0800 (PST)
X-Google-Original-Date: Thu, 05 Nov 2020 23:34:13 PST (-0800)
Subject: Re: [PATCH v2 0/3] riscv: some build fixes
In-Reply-To: <20201104061501.91153-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-65b27d86-2758-4395-9152-2ae6ff576636@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_023421_020323_F7311C91 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, wangkefeng.wang@huawei.com,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 03 Nov 2020 22:14:58 PST (-0800), wangkefeng.wang@huawei.com wrote:
> V2:
> -Add RB and fix comments from Atish Patra
>
> Kefeng Wang (3):
>   riscv: Fix compressed Image formats build
>   riscv: Clean up boot dir
>   riscv: Ignore Image.* and loader.bin
>
>  arch/riscv/Makefile        | 6 ++++++
>  arch/riscv/boot/.gitignore | 3 ++-
>  arch/riscv/boot/Makefile   | 2 +-
>  3 files changed, 9 insertions(+), 2 deletions(-)

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
