Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E054AC19F29
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Aug 2022 00:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=aL1qQ8E9ufgi2xgtUFjXUkZmJbRW8IroFcJfgPAABC8=; b=wf/xp8nSifm6n+JOXz555beb7e
	bUDH7WxaxKSHAQVzbRpJVhv6Q2MR+76ePCwH8h/a4jDmmvL78BTDERetwM46O8qIPXa+AJq9UnLVH
	/t26jZUhFbNgtm/F8MJoSpJoEApz66qGprKb7fEWB4YR7M7tlt/mBiGUUZQU+pb3BS1UDOp7PCA9X
	yL0L0PVynltZmTypLZp2HR7jE/0XBQ2955VM3zlb86/P+ZUnVHYa/rHwzY59SZFZgdG0ZsBP/aD6d
	8GUXTsc5q0/1wS0YMYt/+w74V0OYUiVLhjwmxeavh661tUcn9BBRDEnk/A4JYJ1FHVehHYnXrE0kE
	6b+RDc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJOuG-00CDsD-T5; Thu, 04 Aug 2022 00:40:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJOuD-00CDoB-Rd
	for linux-riscv@lists.infradead.org; Thu, 04 Aug 2022 00:40:07 +0000
Received: by mail-pj1-x1034.google.com with SMTP id w17-20020a17090a8a1100b001f326c73df6so3664993pjn.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Aug 2022 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=jvKWTVIxcauh9PFk41tQ+LyMLwxAATFaP9MhP7PSwT8=;
        b=bYgsxccATxr5gR70WihR7eSZ+FddLWnPtqWukNcii1SubcxY9or8IkShvtxnkxFPWL
         jsyFc5+7CD5VErCGJZg/Ayjp51iFzoOaL43FTkZtSP99CX/5h6/370/w9+uEdSQHv2lC
         ZVXmAQ1Ez9olfEoxq/FlnbA4wAvW6ItqIXqVNuYuRDtKy1MXlbYUvrFtFjkdA9WlwGEB
         CnKQOO8MxsHAKeUJm8nFfK3GFkoRbiRL1ZBmQ6x+mqNtAxiRmvz2pR+PTiBlX6Kz7Aay
         XGZaUkHqeBCF2GK/YKsR6uFlpySA0VAVCepBbobvJuEbs5EdBfFg8UyUfR14qhz+B382
         OzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=jvKWTVIxcauh9PFk41tQ+LyMLwxAATFaP9MhP7PSwT8=;
        b=MZ+zhDf3BalTO6koVa1QaesDbqDcwXX6C7Z/pN3xIweFdXv0+/7pcXcMi2m1a53Dyv
         hhrGCrUArjyb5cIOujplrIois3F0f9uVsghJnfhI1AbERv4pTVsADMogU/KJC4us8cOC
         PnWIuJ4HujPLBfDc4FWUskb16mYQC4N8S24YATHC0peenAxQjOFforuPsHeWRxEkRxL6
         gWekdnZNMfI2zTdQfY8PRj7Q7UkQDbCfEis1A2IsJRkVUes0u6TucGigNiSEXOIZA3Ox
         vVUmvFm7+rXT273RzBLIL41nPLiEvg3tVfMKTz++6Juz8AP7X6Bpxb4fEEXS7pYvMZw/
         1lzA==
X-Gm-Message-State: ACgBeo3FMuZHgVxjcniU1XzfSy8sjhYqIQFeGgYHYAfXug1V2uZiqgj7
	Ls78MLasVyOLE4T1zW3cuArU2g==
X-Google-Smtp-Source: AA6agR7qe/jIK8QLsJ/+BcJEqvmad1YhMJZyrA8YpWoICly0GeGVlRrQWb5n9vnPqpMYWzFm9R3/tg==
X-Received: by 2002:a17:902:e750:b0:16f:3f32:6f5c with SMTP id p16-20020a170902e75000b0016f3f326f5cmr459502plf.106.1659573602844;
        Wed, 03 Aug 2022 17:40:02 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id a5-20020a170902710500b0016d987d7f76sm2538265pll.11.2022.08.03.17.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 17:40:02 -0700 (PDT)
Date: Wed, 03 Aug 2022 17:40:02 -0700 (PDT)
X-Google-Original-Date: Wed, 03 Aug 2022 17:40:00 PDT (-0700)
Subject: Re: [PATCH] uapi: Fixup strace compile error
In-Reply-To: <20220613142947.GA4110@lst.de>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux@roeck-us.net,
  heiko@sntech.de, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
  linux-kernel@vger.kernel.org, guoren@linux.alibaba.com, esyr@redhat.com, Christoph Hellwig <hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-f091aa29-2a87-4d82-9bab-f35533de7161@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_174005_914529_8C0C5B2A 
X-CRM114-Status: GOOD (  12.40  )
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

On Mon, 13 Jun 2022 07:29:47 PDT (-0700), Christoph Hellwig wrote:
> The change looks fine, but the commit log could use some work, please
> move the notes from the back to the front and make them a standalone
> commit log and just drop the rest.

I'm digging through old stuff and don't see a v2, not sure if I just 
missed it.  Either way I don't think it's really a RISC-V thing so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case that helps.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
