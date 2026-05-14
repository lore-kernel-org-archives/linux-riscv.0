Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F54FCD4F21
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 01:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLrhwN8G4tN2+io5ra7XEC5aKbXyM1oZIZsSjCKttAo=; b=so/xbs75EqJfFM
	gwC/0EHrX7/TCsvDbuzW9IWmHBynH9YOVv+qFDPcTuaPHCklBraMK50ZFLUjmcw2hgW3tm1thQUdO
	ulHsy9djEL9lLwYSWvQ+ebyAr5QrqGdQz8qGQXpDot3SDovB/MPvRRricRWCvuOFpKHBVS42c0BNM
	hJIdP/FYuWXkqzxrhwEHqwjahNusVTjoric6ds1uOfGArgT4b+lX7MEWxKU/5EF9VvqREnRJC5caw
	/eqF4yMUanWoVOOcHscYm5NTVcFEkf1jAtjUcJ8bWkrbrIdhJXyUTtJN/BIFbdaxgWhoPZm+rowFx
	zic3cSqOCRob01HYgjFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKkT-00000004FVi-3Fzw;
	Thu, 14 May 2026 01:20:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNKkR-00000004FVG-3biV
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 01:20:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFB8E43E89;
	Thu, 14 May 2026 01:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED63C19425;
	Thu, 14 May 2026 01:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778721622;
	bh=Vikb1ma9EMjiEHU0VSHq33bf6jhsP4o5/IdgpABneh8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Fo+qFr9SogPd1vIkvhp2DSX6Lzt0vQZZJYH/dQ8rw/4sI9F85Bj/lk/RDvN4L4Vy4
	 +n+6jCEAgIjjFlXVRJ4zW46E967csMD5Dqch2HhboEh4Au1wsuLSKmOtlg8Dao11Ug
	 zHdsmMzjtYhos+g6Cfq6q7v8rkYMZeHbFcqIT1gcxnC3jfemmIfzXPhan41hv2RwVG
	 lyu+ogXxx6lXcS/TmaWJ/SN9KPce5oVprtRWmn6sdHMhY9Vl3UhQmpgWe9aLld5EHm
	 pwUJOt8a6VX4aQC/1cq4cZRzR7BQiypGhAOwUZFziMD9kV+AdEtQERPDZYrEP5Q35T
	 IuM3LXqpB/BRA==
Date: Wed, 13 May 2026 19:20:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zong Li <zong.li@sifive.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    debug@rivosinc.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, david.laight.linux@gmail.com
Subject: Re: [PATCH v2] riscv: cif: reduce shadow stack size limit from 4GB
 to 2GB
In-Reply-To: <20260428024105.645162-1-zong.li@sifive.com>
Message-ID: <a5073e94-d360-e8d5-2b49-5167ab4f542d@kernel.org>
References: <20260428024105.645162-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_182023_919962_B7335E3E 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, 

On Mon, 27 Apr 2026, Zong Li wrote:

> Follow the ARM64 GCS (Guarded Control Stack) implementation approach
> by reducing the shadow stack size allocation from min(RLIMIT_STACK, 4GB)
> to min(RLIMIT_STACK/2, 2GB). see commit '506496bcbb42 "arm64/gcs: Ensure
> that new threads have a GCS")'

Sashiko caught that this patch doesn't exactly follow the ARM 
implementation, in that it doesn't include the max(PAGE_SIZE, size) 
constraint, which covers the case where someone sets RLIMIT_STACK to 
something absurdly small ( < PAGE_SIZE ).  Care to fix that and post a new 
version?


thanks

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
