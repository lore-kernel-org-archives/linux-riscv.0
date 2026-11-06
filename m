Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98111606A334
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IbgpypUJ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GDJRf9Uq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SXSztUdv6Bonujd1z7MPSwv7Im9vBuR0QkWaDbrch5I=; b=IbgpypUJRehqGY3YbTQyjFzgMu
	Qm8PRYoTx0oh77d3CIq6ncPBss57skdxdx9H4Lg/k7pNCGtqag0XJbo/gP4yeUU8xoprKQTABfOHa
	2JRKMZXIbfcGA93EPRr6nMPyLp5mR3byZOhgY95a/5VOjJ5WLFOr2oaumef93+/T0ut+0KGC2Banv
	9+WCSn2ljWu7q8ex6Unm++eVY1WaAhdMGOR7wOifr+PG8FYcRQuliIHuKf/NRhyHDOKWv5ZQQzuvk
	mhC7IqNbasNUFDLK2DNC6zb4KLZgnE71+DklpcZfF65oDlJh2nH6XdfSqlppSVZvaQqomTbgRQNaz
	kHUHlhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHRX-0000000BzP8-3vDD;
	Fri, 06 Nov 2026 10:45:11 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHRW-0000000BzOH-0bdD
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 10:45:11 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2ea19bc317dso4211795ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 02:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793961909; x=1794566709; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mK5Jdfitjwy2qBnVXmB5t+/eIsoKS4R4I1jh8e8KWtg=;
        b=GDJRf9Uq4qkm4bk3fiRnKKmoTl+XCP6A5Zfi1N9DaJKggVP2PIlhdsrOiuLtKkVWUW
         0UAv9ZBmvtOSb4V19mu/qkHI3Jjl0qQ2xcgUv4cnPBaSDmBLEIQHzwTzn5Cihpi4HCcq
         oD43IPqdF5+PwSLJCHEKTxF/j0fv6qK8gVEqcqddBvldz3FN3IFqE4pZxEm11oT8QVOC
         iROUi5CdvwyBia2XoMJzqHkOo0ZmLHoT+19nWN3towCftGFcZ7XXgh1XUzu5DEY5waiL
         kkLx+62gVzJ2nY3UoGa5u8knLN45AcqMZVmXPNqgoentxAO9LufM0FnHT2sPp4opqRG0
         Rqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961909; x=1794566709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mK5Jdfitjwy2qBnVXmB5t+/eIsoKS4R4I1jh8e8KWtg=;
        b=yTY9QLse+03q4linyIkTlv2xJqGVbzGzUGH1q3+Ldrjs3NjtqppaUSQImzVhrp6MzH
         3EjWoaAo69TUsWg4bhqa3muVG0CMrwadlY+qP7BQV+1N0ydUT8jNXFz73495YoSpppVn
         S1PjdcQ7qb+H/QKhxDw+P7YbCMUpLGjEMg4UVw2PvMfGBC2j7mijAIJuMUTl+lEoYj6y
         6ptS+xP3t3iubTcREOLkZ60bSldY/sJ1elUGtD8j6OaAZSjdhbpbYFtclyn4G7UVLLam
         ZsuhFvuP0rD1ptJSdIp7BZt9883x/YLtbDcyupN9zzeknqNv40RWwLgLarSdb2bW+edY
         zEhw==
X-Forwarded-Encrypted: i=1; AL+hErEkl+S6sIVUrjyjfOlAuDwj6wQ0NSIWxUkGCp70g94ivYofkVaBjfXF6MyqtJ0mBVVQoB4I9B0TbGSpZg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/eZIzZYE4X4lQ67+XOTMLw9QlChE6Hv2b3Fm+o0bpoUWbuc8Ed
	NkCmEFwOXNRJvLKTmPkCsRX5dwZrxVCZNKznhjGqyDsKrYj/8w+KvNru
X-Gm-Gg: AYBFou15DebYm8tkZTmcyQAkVg5gCA3rAP2ayz0ZciLXqQut0i9qYRVzwodTeOU9bD5
	rzJvxxjGZy/T3zdW15unCkK7TdBnBYezD62BdLvkBN1TgX+JH+4BKRI4YPU3d5CdgK+iIHeeOEm
	vZJjuP0IkxxFpkJEDMoog0o9Rp47I5N0kC5Mk0AFOi70tu5J9XokZQCxilLKeU5z2AdZervYEsK
	FdyGskwQjPkfZxhrbWrjpvq3QLMYy2vUoewHEvcmVOGaCKQxvlOMeSjHxqhfURW3dLdyNGy8I3W
	9DIFa41RDhbZnnFxYViyaRzQy66jns5UiKucAInGbHViPKvkYpt5ouzDGUe+b5kUfLZJCRUe3xA
	L4+Jx66AJ4dyVofrO5Th5cVjkx33s3qiymVGOKWvONdvlnTlSiFAye+8yCZdXy8mQOeZ3YYWgmQ
	AK+pRe3jSo9dKoIxGJISH8K3jCho2VtEBFVj22HfkOOeToLT90mYSRUlEURJxDvILgayTf/PczV
	n6Rga60I9WTDNM88gCEqkJ4axJkDX7q2xP2rvrHbGszzQDErObLbGSsHIH9qa3lZ71Avq/LfsuH
	HuPYT3rg7lRiSGsT2D9KHpiZc8aXCIyh7Sm7MUHJ7ZRNECWNWZ9HIPFY960=
X-Received: by 2002:a17:902:da87:b0:2ed:205e:eabc with SMTP id d9443c01a7336-2ed41bbd3d4mr26889285ad.32.1793961908564;
        Fri, 06 Nov 2026 02:45:08 -0800 (PST)
Received: from [192.168.100.182] ([110.93.227.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8915esm4095755ad.67.2026.11.06.02.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:45:06 -0800 (PST)
Message-ID: <c55c5878-d9c1-4863-bc55-99d334ba2ede@gmail.com>
Date: Fri, 6 Nov 2026 15:44:50 +0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chukun Pan <amadeus@jmu.edu.cn>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Tomas Hlavacek <tmshlvck@gmail.com>, Muhammad Bilal <meatuni001@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
Content-Language: en-US
From: Ali Tariq <alitariq45892@gmail.com>
In-Reply-To: <DMO13SWAGZAN.NYISGLGI7Y5A@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024510_194464_0AEE7475 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: 1.5 (+)
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



On 11/6/26 2:43 PM, Troy Mitchell wrote:
> On Thu,  5 Nov 2026 17:34:37 +0500, Ali Tariq wrote:
>> @@ -2056,7 +2059,9 @@ static int emac_suspend(struct device *dev)
>>   		return 0;
>>   	}
>>   
>> +	rtnl_lock();
>>   	emac_stop(ndev);
>> +	rtnl_unlock();
>>   
>>   	clk_disable_unprepare(priv->bus_clk);
>>   	netif_device_detach(ndev);
> This can deadlock. emac_stop() -> emac_down() calls
> cancel_work_sync(&priv->tx_timeout_task) with RTNL now held, while
> emac_tx_timeout_task() starts with rtnl_lock().
> 

Thanks Troy, that makes sense.

For the deadlock, I think the correct function to call is rtnl_trylock() 
inside the emac_tx_timeout_task(), which would return if the lock is 
already held and will hold the lock if it is not.

What are your thoughts on this? Does a v2 changing rtnl_lock() to 
rtnl_trylock() inside emac_tx_timeout_task() make sense?

Regards,
Ali

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
