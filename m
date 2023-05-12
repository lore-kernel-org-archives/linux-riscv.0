Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FF0C7EE24
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=W6yKSsvMfM6T/LXJ+FkGm2pWG/fSKa2YQWv84jtJ26M=; b=4W8xgUBohPthAWBvYNS7x1GXCJ
	x9MKGmAhFBJ7uOtrTGFXCNtH5lRcMbtFk4oTmj/0xIJ/0IBjxpCQc5SgbfPCwstjwZpOlddnUXzo6
	o+pikLaPeRq+jtwivvRk15C85+LA40xhd/7Ud0klRBLBz4EynkJtsdyJleKiZEId2YNzxlSVNaAvX
	o8Sp00q36gIyrkIeX36cp7VUtV874085st58QL0LC0+WLXP6lq3kkSL29tz5PCdwot40+xzO2vlzP
	zC+GfQ3gyfxRyP5x4UCp4RjCj3Ell4v58rg0ywPVSgOTY4DO9H6C/117i5n2zTFNzIUF+N8PypTHy
	IoLWnObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxafu-00D84v-07;
	Fri, 12 May 2023 21:51:42 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxafq-00D84C-2H
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 21:51:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-643912bca6fso8352708b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 14:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683928298; x=1686520298;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/lBxOTCtayU+JLx1ARgdopct5AoQPf5/nXVYl+V+5s=;
        b=IgE8zU4bBemiV39/zUOWBZJL2A/jnGIdxPytgtf4R3zOUA+LBb17N/QqBYFScneUDH
         /hNOqngcBgimvMvcMJ3bexwDxfaz9WopJXK+f1FyJyyQMK0qO86rPCtCShZuMN8ZnTeK
         hnpEgR6Eum2VTgO2yCv4MO7Conx724Q6BlrdAjWIvXNBa67Auv5APfpqqVdGq1XHp++y
         4gCtVnjdoU3BP6Y97Mgz2Rl752kC4JaIJVI6s+xn3FipkrkSxHmvypaufFwFYXAsI6TG
         mVPny6EVJkw7u1mDpa17gFeq1Ang2/uXHMP8zHl8Yz12yQoWw/+bRiBLYyHcMf4g+bmb
         dTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683928298; x=1686520298;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/lBxOTCtayU+JLx1ARgdopct5AoQPf5/nXVYl+V+5s=;
        b=RQuQZaxNdYeU/5Jqa1F+oclv5lRSTLDcoLFz39WGH89qHNcEH8XGGqx17xhZEeTOhh
         8xjOLL2tPyFYGGUU5quM0HGfPUSmcZCiXDAQqXpUWz4IqPYBt03jYoxpE6+qxSnecJs7
         Fx8qQGvt0SBzyyOqv36x4Zjr2WinmZoFJuS7Is5cqcPI7t7sc1PE+YjaV+uhrPXrhLzv
         SnB6h7UFbmgAHpIidXEESJlAoyn6WGCEPWA5yKnq7MG2fnRai+D0uSP+ndvahQ7ERKey
         dTxAlC5QVmXsfUXXS5R56XieBoJcJF6WRQLy0Ud1PQ4fv+sRcsZ5sy6ZTPFA3zPHjx9o
         Wd1Q==
X-Gm-Message-State: AC+VfDxhiFBnW1TMSllKWD55TgsHlIgUr/nQ4eFbibWwDXr7WnqtSe+1
	SWt4tVRK4jndCe4jfQuuegIY8g==
X-Google-Smtp-Source: ACHHUZ5CVA8A5BGqRPsBKfzaN6VwEM3v78qVong9m0e97ZCqeK0n/GAVy4p72AK2pLMzCeNCxqwOsw==
X-Received: by 2002:a05:6a00:801:b0:648:d20c:37dd with SMTP id m1-20020a056a00080100b00648d20c37ddmr11988601pfk.18.1683928298029;
        Fri, 12 May 2023 14:51:38 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id z14-20020aa785ce000000b0062a56e51fd7sm7485555pfn.188.2023.05.12.14.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:51:37 -0700 (PDT)
Date: Fri, 12 May 2023 14:51:37 -0700 (PDT)
X-Google-Original-Date: Fri, 12 May 2023 14:51:36 PDT (-0700)
Subject: Re: [PATCH 0/3] riscv: sbi: Switch to the sys-off handler API
In-Reply-To: <mhng-1895c1c0-4bc8-4156-909e-c20fa66e82fd@palmer-ri-x1c9>
CC: samuel@sholland.org, dmitry.osipenko@collabora.com, rafael.j.wysocki@intel.com,
  aou@eecs.berkeley.edu, apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
  geert@linux-m68k.org, heiko@sntech.de, kai.heng.feng@canonical.com, mcgrof@kernel.org,
  paulmck@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com,
  yuehaibing@huawei.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  tangmeng@uniontech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-d2f84d38-65fe-48bd-8328-328072326991@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_145138_754030_0DAE2635 
X-CRM114-Status: GOOD (  19.10  )
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

On Fri, 12 May 2023 14:50:17 PDT (-0700), Palmer Dabbelt wrote:
> On Wed, 28 Dec 2022 10:30:11 PST (-0800), Conor Dooley wrote:
>> Hey Samuel,
>>
>> On Wed, Dec 28, 2022 at 10:19:12AM -0600, Samuel Holland wrote:
>>> I want to convert the axp20x PMIC poweroff handler to use the sys-off
>>> API, so it can be used as a fallback for if the SBI poweroff handler
>>> is unavailable. But the SBI poweroff handler still uses pm_power_off, so
>>> done alone, this would cause the axp20x callback to be called first,
>>> before the SBI poweroff handler has a chance to run.
>>>
>>> In order to prevent this change in behavior, the SBI poweroff handler
>>> needs to be converted to the sys-off API first, at a higher priority.
>>>
>>> This series performs the conversion, after accounting for the fact that
>>> the SBI poweroff handler is registered quite early during boot.
>>>
>>> The first patch is a dependency for both this series and the PSCI
>>> series[1], so I would like to get at least patch 1 merged soon.
>>>
>>> [1]: https://lore.kernel.org/lkml/20221105214841.7828-1-samuel@sholland.org/
>>>
>>>
>>> Samuel Holland (3):
>>>   kernel/reboot: Use the static sys-off handler for any priority
>>>   riscv: sbi: Share the code for unsupported extension warnings
>>>   riscv: sbi: Switch to the sys-off handler API
>>
>> Not what other stuff has reboot support, so I gave it a whirl on
>> PolarFire SoC & it seemed to work as expected:
>> Tested-by: Conor Dooley <conor.dooley@microchip.com>
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> in case the reboot folks want to take these.  I'm also happy to take the
> reboot change through the RISC-V tree with an Ack.  There's some
> discussion about this in the previous patches.

sorry, this is the old version -- I just got lost...

>
>>
>> Thanks,
>> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
