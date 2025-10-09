Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3882DCCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Date:In-Reply-To:
	Mime-Version:Message-Id:Subject:From:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=om6HEa/AOliDhEZAd1vlfWmtoyk1fu/DSDHb7b+6ejY=; b=VeVagjq/W6v+1f7d39MCn9a/XN
	v6S0nhWTkf55bP5AX1xCArAUgjD8kIlrQVnE/JBOkCiegJjNO9gA5EeerEn2mbjDww3xoCiKcIhA1
	IDyU8gqWmziwwOWsakUkAa1BztvuI8FRiK+eTOTuIv0jC9JC/wwfvyHidoHBP9MNPnCGSfgOdImPu
	1aFaODJDkLjjBV2rqcCk6sZRYTIv63uGHJy0SWMp/aZl1oeahUJsE2RxATm4ODmaE9Sjkfq//llO+
	JXxRXY/fgfF3i/dP9v9WNzwx28did5qoAi/zeeMO9tTcDyKa9Uax2B0FuE1UgNiQQMvGWmVpCjWAx
	C7qRcsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l3t-00000005N2h-0B28;
	Thu, 09 Oct 2025 07:27:41 +0000
Received: from sg-1-21.ptr.blmpb.com ([118.26.132.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6l3q-00000005N1c-0Y5T
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 07:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1759994843;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ZSYXyJocMN4nb5gYGvRIQu+BFy/CQ0L3pNzhJG8SoHY=;
 b=dJ8/28lZJw5Y2GjWSc9FjYMXRIprkN7Ai5aYNkZ6Ovc+s+fY9WG97PX1l5ll4zwO94/8wl
 uFWnpaIFu5UPxBYOzK8D4pdPBWFsuyAm5ZaG1iw49M/Lfy+c7LoCCdgswlSS8cUwv7Zi1d
 NCEm8eAk2MF8p1QJyzkybyuVu8eOlwUeWtP7O1FYwlLMIaNeZFMh8bt0+CRGv6SqmUqbqX
 tHlrvaO1SRpS82jH0MhSgEPPmG4155H3cXVnNu8i10sugSw1nVJaJUMV/MJkLyizfrcxHo
 NrOW4FHztT3sbp9Jc4ZqL+nxl6vPXxVmBE9EBVL8DVlgx7nRXRxdOW6ztkigow==
To: "Paul Walmsley" <pjw@kernel.org>, 
	"Andrew Jones" <ajones@ventanamicro.com>
Cc: <linux-riscv@lists.infradead.org>
User-Agent: Mozilla Thunderbird
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Subject: Re: [PATCH] riscv: Move user-visible sbi ext ids to uapi
Message-Id: <abf80762-79ab-49ae-98ef-9a632cbad151@lanxincomputing.com>
Mime-Version: 1.0
In-Reply-To: <d9720a12-5efc-1be6-b4a7-7a8888b959a0@kernel.org>
Date: Thu, 9 Oct 2025 15:27:18 +0800
Content-Language: en-US
References: <20250917092129.1450686-1-xiangwencheng@lanxincomputing.com> <3bd01b1c-07e1-c545-8256-f83e3343247e@kernel.org> <20251008-a966ea0e3d8bb6dbd85f6c6a@orel> <d9720a12-5efc-1be6-b4a7-7a8888b959a0@kernel.org>
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
Received: from [127.0.0.1] ([222.128.9.250]) by smtp.feishu.cn with ESMTPS; Thu, 09 Oct 2025 15:27:19 +0800
X-Lms-Return-Path: <lba+268e763d9+5dde63+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_002738_361538_96BD356C 
X-CRM114-Status: GOOD (  12.13  )
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

On 10/9/2025 4:37 AM, Paul Walmsley wrote:
> Hi Drew,
> 
> On Wed, 8 Oct 2025, Andrew Jones wrote:
> 
>> On Wed, Oct 08, 2025 at 12:17:01PM -0600, Paul Walmsley wrote:
>> ...
>>> I do have some broader questions: is this patch really needed?  Is it
>>> fixing anything that's broken?  These SBI constants aren't defined by the
>>> kernel; they come from RISC-V standards.

Hi All,

Thanks for the review, and sorry for the noise my earlier mistake caused.
Just to clarify the intent of this patch: these SBI constants are
defined by the RISC-V spec, but they are implemented by kernel.
IMO, for a userspace developer working on linux it's better to include
this constants from kernel instead of define them again.
If you don't like the patch, feel free to ignore it, nothing breaks
either way.
Additionally, the goodness of UAPI was described in[1].

[1] https://lwn.net/Articles/507794/

>>
>> Hi Paul,
>>
>> You're right that we don't want this patch. I hadn't noticed that the same
>> patch was posted more than once or I would have nacked it here too. I
>> replied to the other posting[1] a couple weeks ago.
>>
>> [1] https://lore.kernel.org/all/20250924-7e9764acec6722b5ef29ce7d@orel/
> 
> Thanks for the heads up and for the early review.  Patchwork didn't pick
> up the thread for whatever reason beyond the initial patch, and I didn't
> bother to check the mail archive...
> 
> 
> - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
