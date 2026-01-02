Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC702FA3752
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pizJ3W3XDY66cbpSec5YLOU4B4MiuuUL5qwiAFhajYs=; b=OGXdMu5aNkB5pA
	lbDOHU8iZtdjYOX/8WLhSg8ApwKzmajlq+Ny9sOCFfp+Hs4Jv0R+4wnagdj9k7Y4SN0l10Z3yjzgf
	D9YVeNSLIseq9vU05uXS5BHF9LZt6ZypkBHjVG90gOueR1ezay9v3dxMcguR7iSLPSkJ68Vy7ZVxY
	0nys0z31XGI4R4bHZj4+EkmC5lAoGo3/oD1Wt+8lz005mwhT+BBRQ1d1yOhDQMZeHBi0Zu/f3Z5U6
	DCjnQNpy8fyVY6j57oRAorO2nGxq804uNgMM9z9DAt9KBHILrkB4g7/u5jnS9JVUHlkBllOP2wKq/
	DLSYLfRPNIZez/fVwWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhIR-00000008Rl5-15PF;
	Fri, 02 Jan 2026 15:42:35 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhIN-00000008RkN-3v4G
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 15:42:33 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4f1b1948ffaso83159921cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jan 2026 07:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767368551; x=1767973351; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUaW410yZnjl46gYHFzLMVokQz6be6dGpRuwVbnPCzc=;
        b=VBibnT94QGSibn/RjkuxRxVZu1pAoHrSWMsvM+Ix9NThUEb6bIBafRp9DfOjMvYokD
         LUoZu5d1BiyEOiRDsaMy33EKRr2ECRoI30kAIiQlXy0+HgaiRblHg6/dNCCWl9PcFkkn
         0VA+FHDAaEjhhx11HGYXDR9WcU2hn0sQ6TAbcPRyqNyvHIujNbry6cBNEfgYE9xjxKw0
         yoouKFiTbEUf4D2VtpVsZ6SXEXZ8Tz+t1br2QZ59gU+XbWtR8g7UMSEvBiVBJiJHvW82
         w+D4hEUvcBQr7ahnmVLwv0ynL7XWZUr+0d3RGe2IXAiq/hw7uM2gqbVFP5qGlZcfXkWv
         KmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767368551; x=1767973351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUaW410yZnjl46gYHFzLMVokQz6be6dGpRuwVbnPCzc=;
        b=l0l1irifCr0Fet7jNC4vBcwL9EHqEgC50zf8tWXOaGp4lkAcxnUaxW23z4TgI3QKna
         qNPebEV1Py35UFY8Umo+DhVVcX0AJVE33O90ppUQ3zjYBEutsXEq0HecFi+TPRs9GQhU
         2bpCZtCK8j5K6E5AIYCwft2ag10c4D6TrHCmR2eZPSG7jFWefjcGyaJ/HEMSiJGLJmXk
         NpZ/3InxIfD30WJvz9ThT3nEzllFpY3/Mgz6LOz1saUu7UdTUaM2Yi5BAxPglANVTmWR
         J4igUu3gVr/8BRUku/G2Ec4cg+/4fWdDfFw27QKix9OBphMtMb9HrOAjqTeGWxHkde9C
         zrUw==
X-Forwarded-Encrypted: i=1; AJvYcCW91KvONQTP/5SKkWv7BfsCZEaKYL+TsDySiUfu3uMmO1NNFWQSSuiz6Znrjx9pofIi4D73mCgBsaIR5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4ZMosE7qIG7ZmJLDi//vrGJMXmNu/LjJKe26Cd87zuR5l5rsI
	aJsf6ktaxiWbsYQGYXZ7m9aVtH+qCS9WD4EOri646GJL2LDbFrGnwT0e8kAekAc5I3c=
X-Gm-Gg: AY/fxX5GJGLBxsBiXMftBj3zmlSTDxvVW7QeP1REA0U0Dg1XiVLRfV4AxXsZ33qaOkE
	wAUudQ0TayD8h9xVGmJDLvJ1pKTDtG5Km0cX/AoQ5m/Z3doak+czKKgxODhxI9a6V7Ep6/B9iLj
	Qnxi/BofKljgXwWz+nopVyMStXCKdPpmyYo/TsNkZlc1Ev6nehkq0v7DbnMHQhbx5tqsMmtvMwu
	nvueYtfufAbV8UYg0fJqx87HRDzeZmk6DtHhgAwMHKuQ6U5LEctWATNGIQtTlkFMC8GWyaVWB9Z
	NGYpO1W4OjhZ48KYdDHOqcBAkzZdZ3iYoE3q2qD6SRg/WnPpeFZHdTVrcewCf+JSG2ea2UB20zp
	zAOT3d8QSjS1pqMUvjXa5ScoQaRVt9opZhTwMzxO7ouC+ij2ua60P1UiGNqf/aF3MIz5v+X3C0I
	yxj7AEeeCuuJ2bMluexAJv1VUUY0v4O8HBH6Czcjqai1PYOQKsGlU=
X-Google-Smtp-Source: AGHT+IHtEl+Nsh7Sudx4gNAqVHpF5lV6u1SdMvxxbZdekk0b4Vk5JFG+dPcCu/VVDnvDpxsq/g1ikQ==
X-Received: by 2002:ac8:6044:0:b0:4f4:c150:7d1c with SMTP id d75a77b69052e-4f4c3ebfe26mr437680291cf.53.1767368550594;
        Fri, 02 Jan 2026 07:42:30 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeff4sm326161116d6.29.2026.01.02.07.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 07:42:30 -0800 (PST)
Message-ID: <8241a2a0-62e6-4708-8cf6-58d0a59476ff@riscstar.com>
Date: Fri, 2 Jan 2026 09:42:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guodong Xu <guodong@riscstar.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
 <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>
 <20251231020951-GYA2019108@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251231020951-GYA2019108@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_074232_234414_FBE03D88 
X-CRM114-Status: GOOD (  21.20  )
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

On 12/30/25 8:09 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 18:50 Mon 29 Dec     , Alex Elder wrote:
>> On 12/26/25 12:55 AM, Yixun Lan wrote:
>>> Due to the auxiliary register procedure moved to ccu common module,
>>> the auxiliary device id need to be adjusted, otherwise reset driver
>>> will fail to probe.
>>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>>    drivers/reset/reset-spacemit.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
>>> index e1272aff28f7..8922e14fa836 100644
>>> --- a/drivers/reset/reset-spacemit.c
>>> +++ b/drivers/reset/reset-spacemit.c
>>> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>>>    
>>>    #define K1_AUX_DEV_ID(_unit) \
>>>    	{ \
>>> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
>>> +		.name = "spacemit_ccu." _K_RST(_unit), \
>>>    		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>>>    	}
>>
>> The above macro is named K1_AUX_DEV_ID().  Why don't you
>> define K3_AUX_DEV_ID(), which could use "k3" in its name?
>>
> that should also works, the idea of using same macro '_K_RST()' here
> is trying to explictly tell users the clock and reset shares same name

You mean like "spacemit,k1-syscon-mpmu" is used, and you'd rather
name the reset "spacemit.k1-mpmu-reset" because it sort of matches
a little better than "spacemit_ccu_k1.mpmu-reset"?

Anyway, when K1_AUX_DEV_ID() was defined, it was named that way
to suggest a pattern that would mean K3_AUX_DEV_ID() would also
be defined.

I don't really care where the "k1"/"k3" goes, before or after the
period.  But I think the "k1" could be encoded explicitly here
rather than doing it with _K_RST() (i.e., don't even use a macro).

					-Alex
> 
>> Anyway, if you go this route I suggest you drop "K1_" from the
>> name of this macro.
>>
> or could further refactor the code, to make K1/K3 drivers share same macro
> 
> anyway I don't want to change this patch, my goal here is tring to fix
> reset driver after clock common driver refactored plus the modularization
> introduced, it's more proper to leave those refactor work up to Guodong,
> since he did a lot adjustment to add reset support for K3 SoC
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
