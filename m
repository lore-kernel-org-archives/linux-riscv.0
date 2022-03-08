Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E5AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKrwFtyOfBBTL1pm42gvovlGW7kUUZUhtvIGH8uexyw=; b=ZgErIIpmagaxTWyOKuYHO8Tl2q
	RheP1fcrfvtHzGqog6WjwycKXVbcmNkdeWpUaq1nkgkdP0C9FOS8zXHEgUJGI+f7+DY5UxUfyiJj8
	aw/5T2CL894A5LT+Y20SxVJsPKkVrujPj8WywF61Droocg1JjsdC90hhMii72QilnO5eZrtV9qcAz
	f02hTcrPaCWXmOSM/Yus3F687HNhOx5Ib1gYzlE9ZJSVGB8lN9ab2QAgif/jng/L0SlZdx1JFdJ3d
	yDEIOIK1jMuxLazeIDzznf6ER02pfTxQ4aqHL0JcKkwJF+rpYGdPUaCPeFxLwt065GnJRkuLSvR/R
	3yjKBpxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWjR-003iTR-E4; Tue, 08 Mar 2022 10:06:17 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWYS-003eGL-8s
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 09:54:58 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by mail.gandi.net (Postfix) with ESMTPSA id ACB336000D;
 Tue,  8 Mar 2022 09:54:51 +0000 (UTC)
Message-ID: <67c4d146-3368-a791-361e-4172ec607437@ghiti.fr>
Date: Tue, 8 Mar 2022 10:54:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Question about CONFIG_EFI and CONFIG_RISCV_ISA_C
Content-Language: en-US
To: "Michael T. Kloos" <michael@michaelkloos.com>,
 linux-riscv@lists.infradead.org
References: <4407a08d90278522b95b7b0e8aba54f372d0ad15.camel@michaelkloos.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <4407a08d90278522b95b7b0e8aba54f372d0ad15.camel@michaelkloos.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_015456_537006_94C8A2F2 
X-CRM114-Status: UNSURE (   8.11  )
X-CRM114-Notice: Please train this message.
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

Hi Michael,

On 3/8/22 09:46, Michael T. Kloos wrote:
> Does anyone know why CONFIG_EFI selects CONFIG_RISCV_ISA_C ?


There has been a discussion about that not that long ago: 
https://patchwork.kernel.org/project/linux-riscv/patch/20220117173941.3798325-2-florian.wagner@nextsilicon.com/#24701077


Alex


>
> 	Michael
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
