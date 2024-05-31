Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0DBC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 13:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5t94anlAHpYWrYs4GtPhXFrJAv7rzZdCPnwBXwVTHc4=; b=dIibWTXRt5A5hQ
	D27heu6qHbKVjZf6oTSNYlsPjGNIvGCV/ejUEYIbre1Sqnd4OMiNPIluhP0aCYQCI1aZElVG7sTPa
	4kphPGxDenjsX5bCyBkuN6/I8sucwfGPoOV8YXeLGC76QCiF8jb4Ub9emw9R/xiRS+u5G3uRB7SEc
	14ecEKdYLyZW9DF+Ca5R69r8c0SO+4ZJPlz1y3Te4SmXeC9VCWbs3f0kroUjI590MzXmlN0Bb1doO
	i8mOQ7kZ/QCtqUx/cCIdEBO8hDmzWUIYw+kU9RemI+MIpTdo81TvJjMl/GXtUHcY8lHC5FwhiQION
	0wGrt4IceYWd8aiMm2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2SA-0000000AN0u-1v7p;
	Fri, 31 May 2024 13:37:54 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2S3-0000000AMwh-0SS9
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 13:37:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42D571BF207;
	Fri, 31 May 2024 13:37:38 +0000 (UTC)
Message-ID: <39a9b28c-2792-45ce-a8c6-1703cab0f2de@ghiti.fr>
Date: Fri, 31 May 2024 15:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] riscv: Add qspinlock support based on Zabha extension
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-8-alexghiti@rivosinc.com> <ZlZ8/Nv3QS99AgY9@andrea>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <ZlZ8/Nv3QS99AgY9@andrea>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_063747_394786_F695D007 
X-CRM114-Status: UNSURE (   7.96  )
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

Hi Andrea,

On 29/05/2024 02:55, Andrea Parri wrote:
>> +	select ARCH_USE_QUEUED_SPINLOCKS if TOOLCHAIN_HAS_ZABHA
> IIUC, we should make sure qspinlocks run with ARCH_WEAK_RELEASE_ACQUIRE,
> perhaps a similar select for the latter?  (not a kconfig expert)


Where did you see this dependency? And if that is really a dependency of 
qspinlocks, shouldn't this be under CONFIG_QUEUED_SPINLOCKS? (not a 
Kconfig expert too).


>
>    Andrea
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
