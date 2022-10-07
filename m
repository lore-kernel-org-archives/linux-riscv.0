Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF34C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 03:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yKpx+ETkZ3LQhqgUl8e5MF186WyPLfnd+7vxIqv7Eew=; b=frE1SbXLbQAd0tKF7W6NZ+rG5N
	nXuvxFWTaQvw2Jujdu1UgDveCRKaNbSwb1pF3RObL7WHdrqVWKK3FuS9iLZAP4Fnyv8xkai6b31Bg
	Z64xKzpeK9i7Hcxfmbo3nwbsz3gX0Oj34CKs1BtrvvhecTW+EQk59H1bhHp9CGkr/il4/rplUz6Oa
	f+HLrgs6g7Sq8BFsD2pwxeImIAm8rmFEB5n2ymXinpx1TKypXbjjunoVwU5rZRybIC+6bYmxta1RK
	UGCoVy86pnwecF+RWukOmWxrDxHgf2zu9DWaW0bjmfPetYONDYpuaJ47gsOZKTVX+ZaBFDRkRiNbx
	ZmK6BwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeND-0070XR-7j; Fri, 07 Oct 2022 03:50:07 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogeNA-0070VE-If
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 03:50:06 +0000
Received: by mail-pj1-x1031.google.com with SMTP id t12-20020a17090a3b4c00b0020b04251529so3571175pjf.5
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 20:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJV+qm5YFFiznBqhy0lPgYnioHuBBK2LI/jJC4Wt6/0=;
        b=K7FtXe2lgnfARccniRXk8NU9SjejL3DLeQ9TGBThaSeXN+j8P0jRiZ2Z4vExivTKii
         fB8kLmh6BDHs78+SLNoP+ZT7uyZn7VwYUSg3uDOV+Ccsa9LPSK7LKchYu3q082wfTXTc
         kAXeY7Ck3lM8pqsfGwSVYssedBc8P4uZb4dXvdlSwOGpF7GtBypu74pobADDkbDQJfS9
         pbr3NQMEzoD+4vhQc2AmoPeiYvJcjnhsTcnCxevdNlXlrjrpeHeuFnoG1fkO3UxaCMr4
         1OKknIlOqRIPrgp8V/ddnBpD9dTcNduOMnWd7AzmxTCeDcSbw5ncZNubkXyFQvydxg/7
         se/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJV+qm5YFFiznBqhy0lPgYnioHuBBK2LI/jJC4Wt6/0=;
        b=Jrzs1A/yyfcrD3UhlRAeWHNDeBR0BE29vcXULzs87mgmnNONZTNg1kybtdQsurVJQ1
         kCNBUHtxx/nMcoP3mLRgBE2kX0LRWylRNqAJwe5+Jd8XGxvGPyKzFCetunINe0kQuDzM
         ZOlblTTj0hSN+dII9FavemtJhGUlVrWhvA8xmNitzsNn+O7NejRi1oiYh+bjNSIrnHvk
         yVm6o/efaHzi3oz7RtggKNidcoQMHrdtFbDza0whlzAr00Mu5/6M4OV4WmCMinQ4Y2Xe
         XYtuZAQiIomJ678t8qDGuY+W+a3s1wBwd7U3SbqH6eet/+weWzVmrVOXRfAJUMv8paGi
         0/9w==
X-Gm-Message-State: ACrzQf2MF3pphEAltAPBrnlsemdf0RuZImkChgTkZH4f7IYD4X17ZfnR
	FcZsO5e7NjPEGgsTXPuIXurpLw==
X-Google-Smtp-Source: AMsMyM7ZwrpwCHd+5QHfW0XpJ3EKIi7cgd1qJwnX9OVy1i3qhA0wrZklq7ArKdAyv0wtkVlNeFasnw==
X-Received: by 2002:a17:90b:4d05:b0:202:ec78:9d73 with SMTP id mw5-20020a17090b4d0500b00202ec789d73mr3115970pjb.103.1665114601298;
        Thu, 06 Oct 2022 20:50:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902f7cc00b001781a7c28b9sm380109plw.240.2022.10.06.20.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 20:50:00 -0700 (PDT)
Date: Thu, 06 Oct 2022 20:50:00 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Oct 2022 20:49:53 PDT (-0700)
Subject: Re: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
In-Reply-To: <YzQ6pqykLhJVeD2p@infradead.org>
CC: apatel@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
  atishp@atishpatra.org, heiko@sntech.de, anup@brainfault.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, mchitale@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-96bfb7a5-6579-4ebc-9517-db2e62d2f82b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_205004_830781_19BA9929 
X-CRM114-Status: GOOD (  14.42  )
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

On Wed, 28 Sep 2022 05:14:30 PDT (-0700), Christoph Hellwig wrote:
> On Thu, Sep 22, 2022 at 09:35:56AM -0700, Palmer Dabbelt wrote:
>> Sorry I missed this, I thought it was just part of the rest of this patch
>> set.  That said, I'm not actually sure this is a critical fix: sure it's a
>> performance problem, and if some driver is expecting ioremap_cache() to go
>> fast then possibly a pretty big one, but the only Svpmbt hardware that
>
> More importantly nothing should be using ioremap_cache at all.  It is
> an API that has long been deprecated in favor of memremap.

There's a few uses of it, I just send along a patch to make it 
arch-specific and make the users depend on it.  That should let us stop 
adding this to ports just to get the drivers building.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
