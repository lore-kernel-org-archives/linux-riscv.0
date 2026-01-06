Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6819CEFD0C
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 23:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tXyKmruLnwzHOIEiFXOpWIMn5S1TUblI4fDgKJ4/mw=; b=IagVxgUTZHlm/Y
	ZostpffT8TzbZmyNJejHK3TekorEij3eJhqKAVon4XBYwkTjpc9GzSi9oSvn5gwaTiQTcxKr/DMNq
	VckTExweWAOEPDhE6FxSSg1YLVvkbXzMgrMLRcEgrPnYTskTE/77oAOjwGat2FMRrbT3jfk/HsVrh
	l7Vj/OmhHQwYWcZFEM+vfRc0Xga/EiFJ4kTGglOMbsj80rP5yYzy/JBubjgmFBzmTWlF1FiwdLw1o
	3NpPKqU6f4vdWogWh8P9l8yB9tJacTbA/WR387RIxUa3nyXLrcK/e2wsrt6qKmsFdi/H4gJ2wbE+8
	q7h6XjxF3c1cttwP8qvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdGh9-0000000Dwzq-3cIb;
	Tue, 06 Jan 2026 23:42:35 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdGh6-0000000DwzB-1zdQ
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 23:42:33 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-88ffcb14e11so16456826d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767742951; x=1768347751; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OfChIqKNcwmrZLIiAT7R5xSM6Gp2o3yGw0q++DE8G1k=;
        b=eWV6kdVcL0YXz/g0r31xbF2tSgOTqsOS7FD83LQoidcrOB7iG3t+UufUxZ3RruCGpg
         gZl/liS98+6+ggp2nUebGkkyH0tKQ73wTQ2rg52keUomMQq611Dfi2U668ia9jmxbcDx
         efbHovfYznbsVWYx0UjLaxqHBpQeSS5udO7swZo9JjVLpBbxuIbs8L0qWXvWQsvhw1+P
         yxqORU94d4T0uZOVN13OF0pBd8ZVf4/EKCmw2BmfPCX8Cl1YtjVHVoK8jmdAxxeFk9pN
         BMVTqQPN/liH38hZ+u2CB9pTr0PCOcUIsRixZDi7WTKNcUe87Fzob88t1Tv03QJr2bRo
         FnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767742951; x=1768347751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfChIqKNcwmrZLIiAT7R5xSM6Gp2o3yGw0q++DE8G1k=;
        b=SKdgbVL12VUfPF1RydLHx9geK/tP0fDo/OYc1WDQ+6X1iYOpPPPvplmOFFmnlGIm1q
         aJlERGZ3003TneOiNojQvWn+kb5dWNV/ZQM2OWmyxg2kzNMzo3w8/+53vr7JlkUH7ZHg
         8v1LTcI/c7wrVFFXh/Nwschtkt9aY+Kf4k60RAQPeLbubzVrb1oeH2eXv6avRNx7w5lB
         YB2wKlzvK0mbtPOYjp+N/LiLfhU8eimkHbw1F+dfN7YAAC6AHLW2cLTvNp8xmKX9tnV6
         Y2+1zT/gCMvUHZ5IpGfZ9caNLc2kyxo79QMAucDlS8tbMrpI/vEBadAGMlDvDWRiPBMd
         1ang==
X-Forwarded-Encrypted: i=1; AJvYcCXUFSwnZW4xre2CeFqyLYsSeXP/XQTxd/c3osczYLJkfjQ0ydyYYx19c5PtYZsMxU9nVnjIklUpu74BvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK4XnsStG9teLo1mAznof54kOTyqLq5yj5xTsAl8ov6gOwK8cK
	HTZDmUGM9KRVBW9rV4G4g1X5wV7XRIq4anjfxHD0xDKHDcNZKkDfu+VTBjUnUx6wY48=
X-Gm-Gg: AY/fxX4PxtGB4RnYunz+Z98hvS1KD7bcFffn36xTHl+fAmiuhgboTF1LTSLZe20A+BN
	A7aR/Ybkts+GLkznB82CpTcLtHPw8lWZ6rARrUDzriT2RSy+Xw3fuXeaM2gRbUDYoZ86a3/vkRF
	YFaSa030KPpVEDcTymKjg5gUmM/PUHqMd56Z5f/MlDtB8MmYWr09GxkqUGAkynGBJNWQzxThYPT
	vR55jmYQmB83t9MHNoeMabdwgir9YPTiDyt/BxT+l6+/Ka5aMswFIJX/j6JNEF5xusJ5Reayosk
	g9pjmRZgJqC344Et6L3dNIsoOT8TcbiD0HhoTsQ2F2KASSun+9ejfxTlWpXmXGdTUFsmHqbfaWB
	ykDStPY85GoSs4+fzDMUo2g4kolJn1yaAlzzovZwHPOkOS1MjKFHCfpcWL33NLHy1Mgc/33prLe
	nASKjrqnVx9DbuZI7zXTncyXUaX+Wg8uELssKcFTyoyUwgiMreo5s=
X-Google-Smtp-Source: AGHT+IH1hw6SHnlsa+o57uQvBqGquCSnLrP81cZqJwz2JA/4lI4rccbRN4fom/VIn/Px/30MwTS1Zw==
X-Received: by 2002:a05:6214:d49:b0:888:710a:1750 with SMTP id 6a1803df08f44-890841ae7eemr10031776d6.31.1767742950921;
        Tue, 06 Jan 2026 15:42:30 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253305sm24209026d6.41.2026.01.06.15.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 15:42:30 -0800 (PST)
Message-ID: <255ff9c5-7662-47a4-b2b9-1fd740fc526d@riscstar.com>
Date: Tue, 6 Jan 2026 17:42:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: spacemit: extract common ccu functions
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guodong Xu <guodong@riscstar.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yao Zi <me@ziyao.cc>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-2-6061d9f69eef@gentoo.org>
 <a198d2d2-0c82-4c9d-abca-d17221ef1453@riscstar.com>
 <20260106222753-GYA2092678@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260106222753-GYA2092678@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_154232_689619_68FF9D7D 
X-CRM114-Status: GOOD (  19.96  )
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

On 1/6/26 4:27 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 08:43 Tue 06 Jan     , Alex Elder wrote:
>> On 1/3/26 1:26 AM, Yixun Lan wrote:
>>> Refactor the probe function of SpacemiT's clock, and extract a common ccu
>>> file, so new clock driver added in the future can share the same code,
>>> which would lower the burden of maintenance. Since this commit changes the
>>> module name where the auxiliary device registered, the auxiliary device id
>>> need to be adjusted. Idea of the patch comes from the review of K3 clock
>>> driver, please refer to this disucssion[1] for more detail.
>>
>> Are all of the hunks of moved code moved without change (I
>> think so)?  If so I think it's worth mentioning that.  If
>> not, you should explain whatever differs, and why.  (I would
> yes, no literal changes with this patch except probe() refactored,
> and the real effective change is the module name changed which
> I mentioned already

Thanks for confirming.  No need to change your description,
just consider this for future patches.

>> expect the only thing that would have to change is making
>> spacemit_ccu_probe() public.)
> to make spacemit_ccu_probe() public, we move SoC specific code
> out of this function which should have no functionality change..
> 
> (I think the above commit message is ok, and would not plan to send
> out another version if no serious comment incoming, unless you insist)
> 
>>
>> I made one minor comment below.  I didn't verify, but I
>> assume this is all just moving the code around, and based
>> on that:
>>
>> Reviewed-by: Alex Elder <elder@riscstar.com>
>>
> [snip]...
>>> diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
>>> index 4412c4104dab..5f05b17f8452 100644
>>> --- a/drivers/clk/spacemit/ccu_common.c
>>> +++ b/drivers/clk/spacemit/ccu_common.c
>>> @@ -1,6 +1,177 @@
>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>    
>>> +#include <linux/clk-provider.h>
>>> +#include <linux/device/devres.h>
>>> +#include <linux/mfd/syscon.h>
>>>    #include <linux/module.h>
>>> +#include <linux/of.h>
>>> +#include <linux/slab.h>
>>> +#include <soc/spacemit/ccu.h>
>>> +
>>> +#include "ccu_common.h"
>>> +
>>> +static DEFINE_IDA(auxiliary_ids);
>>
>> I'd insert a space here to make the definition above stand out a
>> bit more.
>>
> do you mean a blank line?
> (I could do this while applying this patch since it's quite trivial..)

Yes that's what I mean, and yes, fine to add that when applying.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
