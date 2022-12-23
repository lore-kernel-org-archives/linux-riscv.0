Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4D7C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Dec 2022 00:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/dQp7RuV0qNNqtEaLUCfBey8obVdXncZSfa5crxIpyo=; b=liMYQSfpKi37v3
	+5Xmp8dPFrG/dJ8LMLklg+OiKSYV+mrN6T8jbBixu2SvceSP6thCx+1MxOiNONhHWGPP4h6SyLszB
	pHElyWLZYoSK15FcSBoty62+Te7vBmCU53G7O8AEleV9BnY3d5K67tR/ijx9n3xvQ9CXE4gChQSDZ
	qWD82+uzMeUPbxMgQUG8lSHkggG6NdD5HZ2NwJRxztzp5OlIlAGjNMlffQQ99/qbXiEmYMt9mkck7
	zBxsuRYVYvCKmtlQe/MqtRoCdg8mQ31PMywLZiraA8fYfB97OnrYGzPBONv+PGoOM0ZCH66rx2G0T
	nEojisVPcjfdUuxtPNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Vxc-001JCR-1s; Fri, 23 Dec 2022 00:30:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8VxW-001JA6-5S
	for linux-riscv@lists.infradead.org; Fri, 23 Dec 2022 00:30:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB1D3B81F66;
	Fri, 23 Dec 2022 00:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E91C433F0;
	Fri, 23 Dec 2022 00:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671755442;
	bh=w6dIiGuuL/9a1BYcQr8gBHIQrA00bIWuAZsr5i52qyY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=DqzCF90I+BvrcmpaZplvPUxS8wRC6p1hT7Yfx7SyqcYvUfLmTboUUHc7HugmLA+Y6
	 UxmQZ4Mw7fFNI+dxyvG9ZF39soAneELNlRARYL6ME0AzzbNtA9hRyFqqM+DnB63Fb2
	 h2Ooapxdaw8/a/HmsLHo5ed8k9DPwAyEJ9ZeDT20ie93f1SfiD7I/geU9rYEU2iNjT
	 sC3vsNEvya+Vu3J3ePYICXgu7DuLRrGCHJcGGqOZruccBz1h9xr5MiQO4artebZ4BK
	 PyEJpz9YiRQdnRl4jluhmuH47PjzAicNmin8QLz4hSn2ejReKgwJg8jDkrXEhByaaK
	 PkbhlE68mL/rQ==
Date: Fri, 23 Dec 2022 00:30:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Vineet Gupta <vineetg@rivosinc.com>
CC: linux-riscv@lists.infradead.org, linux@rivosinc.com,
 Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: add base extensions to enum riscv_isa_ext_id
User-Agent: K-9 Mail for Android
In-Reply-To: <18228ba9-464b-d4c1-f8b9-8de1b0e6a64f@rivosinc.com>
References: <20221222224104.3449841-1-vineetg@rivosinc.com> <Y6TgAxg3csoQqaFr@spud> <1cd24228-847f-61a1-2466-07f0cc4c221a@rivosinc.com> <Y6TprjVBPX6CRvOm@spud> <18228ba9-464b-d4c1-f8b9-8de1b0e6a64f@rivosinc.com>
Message-ID: <6D9E2D1E-7FC7-47FC-A458-D7467177C206@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_163046_408287_6A56C9AB 
X-CRM114-Status: GOOD (  12.90  )
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



On 23 December 2022 00:03:18 GMT, Vineet Gupta <vineetg@rivosinc.com> wrote:
>
>
>On 12/22/22 15:35, Conor Dooley wrote:
>> On Thu, Dec 22, 2022 at 03:13:56PM -0800, Vineet Gupta wrote:
>>> 
>>> On 12/22/22 14:53, Conor Dooley wrote:
>>>> Hi Vineet,
>>>> 
>>>> On Thu, Dec 22, 2022 at 02:41:04PM -0800, Vineet Gupta wrote:
>>>>> This allows for using the enum in general to refer to any extension.
>>>> What is the point of this patch? It's hard to understand the rationale
>>>> without having any user, especially...
>>> Right I'm trying to build a cpu feature enable API which required handling
>>> of all extensions.
>> Does it matter to you if it's defines or an enum, as long as every
>> extension is exposed to you via the same mechanism?
>
>No, I just went with what v6.1 release code base had.
>
>> 
>>> Ideally yes this needs to go there. But it seemed more like a cleanup type
>>> patch to warrant a standalone submission.
>> Meh, dw. Not expecting people to know about every patch under the sun.
>
>No this patch doesn't require people to know what series it facilitates since IMO it is a trivial cleanup - fixing 2 disparate ways of defining extensions.

I meant it's not a problem that you weren't aware of what the other series is doing.

>And as I said it is not urgent, specially with other changes in flight.
>
>Thx,
>-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
