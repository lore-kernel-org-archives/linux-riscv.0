Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9CEC001DC
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 13:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3S/6ZytzGKw4gBMtAs76g/HbbZkxknG8HhlYUZO2Rf0=; b=TWpNj+CH6G7I46
	ZIpEoAtzjFr/54fa0aEwwN7kCt5Xk8nURs08rzVogaTKn8edqeNJSbXuyEV/4ApkowuxUeQ2blkW/
	oa4w+6N+gdm5lqXRKVuf2qFb48vTslukSFFuFhhT+xWXNplaAxRlMkZCLUuddA3OHnvr/VhwzCCs/
	0bq+1uGzOgPTiubXlbFSB9VhfAtoVysW/WShRIM1WvBfs2MqsXD7BX+CovIk1xcIWQyNiqQJWVRQ+
	5yTkmWoNOO19aSaOd/qFIL1sOBXhn/xg2AXb01RNfZ3Ta9tB8Y1OREZIsqg7FaDJ418h+nRMkLZ8r
	WtMUHWtqYjh3JhX54JmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlKg-004iEu-2q;
	Fri, 07 Jul 2023 13:17:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlKe-004iDv-2F
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 13:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688735825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9JvrGxpvmS801EGByUJbO9yImJLqiJJEkFic7ujcF2c=;
	b=be484T3sMWmB23fqs1789oc2iLa/9zcv7dO13MYSgeKWieXEQ0o6CcchPDGbIPKgS5JIk0
	hp4lIl9TbWGPJGrTitEVjO2jghy2DFTu/bVdIpMGcvkGuH/bb+OjOUgqRbv9jfRmNHkv6u
	w7jHoVmkLkugBys7C0Hjz7vuhbP7ScE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-f9JZIgr-N8y4JDtBetdgyg-1; Fri, 07 Jul 2023 09:17:03 -0400
X-MC-Unique: f9JZIgr-N8y4JDtBetdgyg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f5df65f9f4so11205175e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 06:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735822; x=1691327822;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JvrGxpvmS801EGByUJbO9yImJLqiJJEkFic7ujcF2c=;
        b=XeNatnktmbm6EnOgWv/OY9hxBSwRtu6w1SLOtOESWjsu4aN9Y2oVy+nhDmSlxgReao
         KSYEXBMRVGC5wVS7a1LOZ+137NB7vB3LMDLe71PEvMQj9hp2o3fG2pk6ub7BT73k39c+
         5kbIz5Fbrtz7fq3T3rEAvxwZyvP4ACjpHU5QStX9N+QKC0nqSXXiENS6NJzF5Eqyj4i8
         ISsOPTPkADZeHXtA80xLMna/8rZS90uHU1pC7RtvLWraI8dZP8+723poIMRH0NArWiWR
         N0gZM6AoEtwLxV5LA+aJDGqjBQ3gIpjfIx97b8WWTOdaW0vdj91qw93uwLW4fqW7aGbw
         t2gw==
X-Gm-Message-State: ABy/qLaC/Y5mnSgpmi+9JeTILSymDfPniJFD8TjwQdxdM+jatgt1qD3r
	oIh2+bHJazvk91MYjJql7rFwvwYeZZJyZCsAypNCi+BSuMGzlQKWaQmkRYHVVW2NFlz6qjsuBwY
	Mhx5s+vjpL3I/C8CZyaC7x3z8UGf1
X-Received: by 2002:a7b:c408:0:b0:3fb:d1db:545a with SMTP id k8-20020a7bc408000000b003fbd1db545amr3779660wmi.15.1688735822574;
        Fri, 07 Jul 2023 06:17:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGWyEpITRdc6V/WDH+p8W9PEEzo9YNPXNRcelMOGQxrDOPXrD+EG7aq4IUiQzrsbuo+XZhh+g==
X-Received: by 2002:a7b:c408:0:b0:3fb:d1db:545a with SMTP id k8-20020a7bc408000000b003fbd1db545amr3779635wmi.15.1688735822235;
        Fri, 07 Jul 2023 06:17:02 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id t13-20020a7bc3cd000000b003fbaade072dsm2474749wmj.23.2023.07.07.06.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:17:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, dri-devel@lists.freedesktop.org, Ard Biesheuvel
 <ardb@kernel.org>, Helge Deller <deller@gmx.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH 1/4] vgacon: rework Kconfig dependencies
In-Reply-To: <20230707095415.1449376-1-arnd@kernel.org>
References: <20230707095415.1449376-1-arnd@kernel.org>
Date: Fri, 07 Jul 2023 15:17:01 +0200
Message-ID: <87mt07yi7m.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_061708_831752_A0FEB6C9 
X-CRM114-Status: GOOD (  17.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
>
> The list of dependencies here is phrased as an opt-out, but this is missing
> a lot of architectures that don't actually support VGA consoles, and some
> of the entries are stale:
>
>  - powerpc used to support VGA consoles in the old arch/ppc codebase, but
>    the merged arch/powerpc never did
>
>  - arm lists footbridge, integrator and netwinder, but netwinder is actually
>    part of footbridge, and integrator does not appear to have an actual
>    VGA hardware, or list it in its ATAG or DT.
>
>  - mips has a few platforms (jazz, sibyte, and sni) that initialize
>    screen_info, on everything else the console is selected but cannot
>    actually work.
>
>  - csky, hexgagon, loongarch, nios2, riscv and xtensa are not listed
>    in the opt-out table and declare a screen_info to allow building
>    vga_con, but this cannot work because the console is never selected.
>
> Replace this with an opt-in table that lists only the platforms that
> remain. This is effectively x86, plus a couple of historic workstation
> and server machines that reused parts of the x86 system architecture.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Both our explanation and changes look good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
