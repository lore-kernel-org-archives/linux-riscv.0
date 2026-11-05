Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7605606D806
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 22:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4pQLEjKA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k7n7M399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W+t1MByG2tZs4NDG/5HMNluKkon0x+LvK+L60yo2ViA=; b=4pQLEjKAuQjJ/3iUEi+1kxOOMQ
	EJTxpek6fMqcMm02+Y+pGQ7tizIIpbxOmysjhZhh4MfB6PqYS7gyjKZKS5dXP4L0ruIiFEHS50usp
	4ySj/8r3RsPGgD7xkasoKF4pxrviX8J0df+BWappSqgKfRLGQZ2g8npK3hiUurh1KDRbD/NpokSod
	lb0YdSATDgzp1A51wPUOWrcIn3GyirbYJj+vlKLQgxO7AmXY0Xs/UUNVIXrJpAmVUwXteFTuYWAHE
	S69RJagpa8ZxpQk2wfJ6NvPzXIfj2KwSj7GdmZmrimz2LF8ZaWdewSWDgCrz/3ibTWCFOMw2QF3p4
	zVq9t0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5wq-0000000AnWu-0fLx;
	Thu, 05 Nov 2026 22:28:44 +0000
Received: from out-252.mta1.migadu.com ([95.215.58.252] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP5wl-0000000AnWQ-3oLQ
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 22:28:42 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=RMLKgoqWLv73HkP/fp6tsjHhZlyH0aziusIjVEhYzLc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793917714; v=1; x=1794522514;
 b=k7n7M399r7CdMfhJhF/pQNTZZqYvtpZ5ydqHsfEf5gRKfF0w1BwoyoTUp8hvxCpvWS/4D3Rf
 i1fTkZZUMvgSHD0rDEzCJjgyyMjFBfe+ITXArBI7XdY9xiOjdkRFyAR52IKEFBXRgiCAvjQwjzK
 AoklpAN/HvcQSj5OTb4mFcLY=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8774a739f2d0ed26;
	Thu, 05 Nov 2026 22:28:33 +0000
X-Mizu-Trace-ID: 8774a739f2d0ed26
X-Migadu-Flow: FLOW_OUT
Message-ID: <6c36ec6d-5bc8-4ac3-8ad0-79eac7873b67@linux.dev>
Date: Thu, 5 Nov 2026 23:28:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: spacemit: Hold RTNL lock in emac_resume() and
 emac_suspend()
To: Breno Leitao <leitao@debian.org>, Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chukun Pan <amadeus@jmu.edu.cn>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Tomas Hlavacek <tmshlvck@gmail.com>, Muhammad Bilal <meatuni001@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20261105123441.2524171-1-alitariq45892@gmail.com>
 <auyG7hGJtMzV0Gbi@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <auyG7hGJtMzV0Gbi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_142840_687939_2791045D 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 13:40, Breno Leitao wrote:
> On Thu, Nov 05, 2026 at 05:34:37PM +0500, Ali Tariq wrote:
>> The emac_resume() calls the emac_open() and emac_suspend() calls
>> emac_stop() functions directly without holding the lock through
>> rtnl_lock(). These functions rely on phy_disconnect() which reads pointer
>> with rtnl_dereference(). But since no lock is being held,
>> rtnl_dereference throws a suspicious RCU usage on
>> Orange Pi RV2 (SpacemiT K1) warning when lockdep is enabled.
>>
>> WARNING: suspicious RCU usage
>> drivers/net/phy/phy_device.c:1831 suspicious rcu_dereference_protected() usage!
>> Call Trace:
>> phy_detach_internal+0x490/0x5f2
>> phy_disconnect+0x90/0xc0
>> emac_stop+0x114/0x626
>> emac_suspend+0xac/0x126
>> platform_pm_suspend+0x72/0xe4
>>
>> Hold RTNL lock before emac_open() and emac_stop() with rtnl_lock() and
>> release the lock when functions return with rtnl_unlock().
> 
> This would work, but I am wondering if it would be possible to call rtnl
> inside the _open function, when dealing with the PHY? in other words,
> shrink the time rtnl is held.

+1, especially in emac_open() rtnl is needed only in error path case

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
