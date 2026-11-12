Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF1E606A323
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CqTzvtNt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KTjp3CZY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UKr7owS1XldvCQ6sDwEx/6yT7laOYZo+5eMnN376tjY=; b=CqTzvtNtaHaPRHnOfaSZhV6PBr
	vV8Kt4xrZeT6AeJqAPBWnXTlYAeA+RbG6SjZmazpyM30R+hEbEybSJnbrEIOFjFYItheXenDoqrjj
	ZCOiM6SJ4PXwRmpbPFGaoalnoKvFDigV9ltZcT7xy6jvuiIZkcL7G+9sRCBr3LXSMkNoGHlrYllx3
	E/kd6oUsgOBqCx3mVB6RXSvV5QbJW/YAaVP7fuamtGBD4YJ0AgO/Sp1IH3KlmLfDSPHeMxH0wQnGf
	R69f+Y6mcSLFBKkfwqmfrfovRujPLK/vOxtzoh7PK2KBMAYiXLXVJ0IwSi2VjeDy+wZUREevKIkG/
	cEeR28ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUwD-0000000A58o-3hgS;
	Thu, 12 Nov 2026 13:34:01 +0000
Received: from mail-ej2-x05.google.com ([2a00:1450:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUwB-0000000A57x-1xo3
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 13:34:00 +0000
Received: by mail-ej2-x05.google.com with SMTP id a640c23a62f3a-c50485c0cb8so171691666b.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 05:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490437; x=1795095237; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwL/KWXkezDHAFArKAWV6uoJFctTAPwUR8TBzgDQZkM=;
        b=KTjp3CZYq50AKy3rEYKPv1T4wmXC6SdbojAaQAc0waY1CiiH7ZK6PwArhVKJKGWS69
         fbmn9FJQ7GpiGx7pfN418SfuUYPcZzrspqBcIObCV8AmH4w8DfzJBM/0XmqEabNg2D+t
         N9LNxyFlqCCjd60QS2DcmDUpmhFdDhLUG943CkUd/XfDDjtg1vA6sj/oLGoJ6bYrGNRY
         mk3ylW/b+XOJgePEh6Ry2xq0BuzgS61llG3ifGgL6UxrZOuNf0THKtyEhCK56bTmiOew
         JSdp7FxqGltoGEKrwA+3dw+XICMuEU9y/VwHvpdVbfTA6ldTZklETUM0A3vwEpYKJ2Pb
         2BeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490437; x=1795095237;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwL/KWXkezDHAFArKAWV6uoJFctTAPwUR8TBzgDQZkM=;
        b=UOvDkkfNH6k0S2ju2RfvoEAa0sZHe+CQoTptGyfY2Qdiaj3sBJReOtG+WzxaKTquTs
         P6PtTf2NhaW3EGEZqKTlnV3DBMzYfotoTyt+aYK/Y4wz1WkGYz43mFxqFCZwgiSd2pfB
         D3hBwHYS35YFzB7XLWXITL/TEOnJ4PRPdqfiDcvSa/rSfspap+RUi7fQ7cBBO6fbYAwj
         YPzaFzBY34pezrDkG9CZN+vzdeE/T5fYX+u6a45XvzKOMojQ/ERlkoJETeRJ/X46OtbU
         gIomWq3Y8Fz4X94FZjZklM8fPNQAfTQlFJqfCyNCrv8AK2fviRYB9ykAGmN4BLQMTp5f
         FJ/Q==
X-Forwarded-Encrypted: i=1; AL+hErEHYV5QZpov4cA+9S4HyKJ14wwNpZ4Hp/y1EcwTEsN72qbhW8jodx7ee4bLvMZ30Nt+91NM1B52DftZcQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9VlsBleayOGbEee8KFYqSmC81cK/zWfI6cA5QqaZxMWVYUpDm1
	INNbKVkCOOXi6gmr/3a17IOiRgtS6adpnZ4eKJQzx7Qv+wawM7CbGjHH
X-Gm-Gg: AYBFou3A9hxMj1AZfLXiBCl+lrLtKoItgVCy87hDPqo8B5g+Mvg0xfJH5gMmlRdFvZn
	KgWxNBt/wZCEmou1+Wzhau3rNREDZzRU54BHChVb2oGMaTcf9r6O/MuywDRkf8eSnTdtKmt/3on
	8t2LUU8lpHEmDAqdXvEWNtraCJtFDT1XuS4DswyeKqPHQtYvvmKPTPuXo+bStAbfc+ohW39ISlA
	WRHHT7g6wYSIPB447B+uJVExhcLx3OjZO56x+oBf7DmyzM/GAA9uWWCAslDMeSWZ2qvNESy5t7m
	CmEA9J7oKFkwrN1IAB+ljXFh+cssN3Go8P+Jihk9xnhwncpoApMMQBvy0I0gPR5399QDuvvvsYT
	wJptjhBGnpGAfVemaA0yO1nOAQplzD1iF/97PuqjAaECsYJgskU3xlgCAxNcrVVixX9AXHhjx3z
	QpGDcutwAg5Tz7RGztXAJ4VfN2cCwJes2nRvwZmBpDcKKg8feqKPVfyzKsUkk+LNRZdVxBSw7P5
	XyHGtye2gNtM3dGSVEVGv1X9yCNvEEurVBGlSpcztvYHcLB3IzNhQmWeJrgMxK1tiUsEQutkmql
	fLc/B+U9kDjcJxrJ/G3l3PUt3Lt9Zuyv0Sh8xw==
X-Received: by 2002:a17:907:868a:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c5066b51879mr464464066b.35.1794490437222;
        Thu, 12 Nov 2026 05:33:57 -0800 (PST)
Received: from [192.168.100.182] ([45.249.9.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6947sm353760066b.10.2026.11.12.05.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:33:56 -0800 (PST)
Message-ID: <e11f1ba6-6e56-4bac-a0cb-f9258a53f34e@gmail.com>
Date: Thu, 12 Nov 2026 18:33:51 +0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Andrew Lunn <andrew@lunn.ch>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Tomas Hlavacek
 <tmshlvck@gmail.com>, Muhammad Bilal <meatuni001@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
 <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
 <12a95b3a-9c8b-4a2d-9b81-12b3839e64a9@lunn.ch>
 <DMPNAPNEGQ5I.XYUIB7Y8HDCA@linux.spacemit.com>
 <ee3f414c-fffa-41e6-8bec-6af7ce676c4b@iscas.ac.cn>
 <DMQJ0R4QTE6R.2I492KA9N85CB@linux.spacemit.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <DMQJ0R4QTE6R.2I492KA9N85CB@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_053359_553923_A7C35F59 
X-CRM114-Status: GOOD (  21.63  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/9/26 1:10 PM, Troy Mitchell wrote:
> On Mon Nov 9, 2026 at 7:59 AM GMT, Vivian Wang wrote:
>> On 11/8/26 15:19, Troy Mitchell wrote:
>>
>>> On Sat Nov 7, 2026 at 5:32 PM GMT, Andrew Lunn wrote:
>>>> On Fri, Nov 06, 2026 at 03:44:50PM +0500, Ali Tariq wrote:
>>>>>
>>>>> On 11/6/26 2:43 PM, Troy Mitchell wrote:
>>>>>> On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
>>>>>>> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>>>>>>>    		return 0;
>>>>>>>    	}
>>>>>>> +	rtnl_lock();
>>>>>>>    	emac_stop(ndev);
>>>>>>> +	rtnl_unlock();
>>>>>>>    	clk_disable_unprepare(priv->bus_clk);
>>>>>>>    	netif_device_detach(ndev);
>>>>>> This can deadlock. emac_stop() -> emac_down() calls
>>>>>> cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
>>>>>> emac_tx_timeout_task() starts with rtnl_lock().
>>>>>>
>>>>> Thanks Troy, that makes sense.
>>>>>
>>>>> For the deadlock, I think the correct function to call is rtnl_trylock()
>>>>> inside the emac_tx_timeout_task(), which would return if the lock is already
>>>>> held and will hold the lock if it is not.
>>>> rtnl_trylock() is generally a workaround needed for badly written
>>>> code. Please try to avoid it.
>>> Agreed. If the reset is done in place, the work does not need RTNL at all,
>>> so .ndo_stop can keep cancel_work_sync() as is.
>>>
>> Thanks for the diagnosis and suggestions.
>>
>> Although, maybe we could simply avoid cancel_work_sync() in emac_down()?
>> emac_tx_timeout_task() checks for !netif_running and does nothing if
>> already down so it should be safe. The task cancel_work_sync() in
>> emac_remove() does cleanup on unbind so the task is not leaked.
>>
>> This seems to be the pattern in other drivers as well. What do you think?
> That was my first thought too, but I'm not sure netif_running() is
> enough here. emac_suspend() calls emac_stop() directly, so
> netif_running() is still true and a pending work would stop the device
> a second time. And since the netdev is devm-registered, emac_remove()
> runs before unregister_netdev(), so the work could be requeued after
> the cancel there.
> 
> So we'd still need to cancel it in suspend and remove, and at that
> point resetting in place looks simpler to me. What do you think?
> 
> 

Thanks Troy, Vivian and Andrew. I'll drop rtnl_trylock().

I think a simpler approach here will be to go with Vivian's suggestion
of dropping cancel_work_sync() from emac_down(), and handle Troy's two
cases by disabling the work where the device is stopped without the core:

1. Suspend: emac_suspend() calls disable_work_sync() before stopping
    the device, and emac_resume() calls enable_work(). So the work
    can't run while the device is suspended.

2. Remove: emac_remove() uses disable_work_sync() instead of
    cancel_work_sync(), so the work can't be queued again before the
    devm unregister_netdev().

For a normal close, the work's existing netif_running() check is
enough, because the core clears it before calling .ndo_stop.

With this, nothing waits for the work while holding RTNL, and the
work doesn't wait for itself.

v2 will have two patches. First the TX timeout fix (reported by Troy) 
then the suspend/resume patch, which will take
RTNL after disable_work_sync() and before the netif_running() checks.

If you still prefer resetting in place, please let me know.

Regards,
Ali

pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
