Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61E0C8303D
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 01:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yM7MmaO0Gg+0zJuxRxG6DQQ5mR17PAvB8v2V/3ByKCU=; b=hx94tYswRoNPa8
	5rsbxVKZzwPjK0URES9Z5MGlI9yCXmGRPsDqJM36/VAFBZIySShtZJVqAbnKgk5598r2/N2q0zdph
	rtk1BJPp6/4Xr4/gndgcnyPdaHeBAyr6fCm8UXyR/1bEkdFfGnH/L1+kmpWYMPW7FK3UL2Hvyf52L
	GJqkCimp5dOA3IzV1plpPH2p8tJzruwe8wHBJacI9HqkDEYqFuSPg/023jVs0tcPVYu13qj2BXCMN
	xCcL2iXjUiSSVI7vVfBuk+ik+kG5ITsv5InLtQId25my3kBUD/XOw8khfiQUQqYPf7but3lv/uDOO
	rEAKj044jCuG/PeCeLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmIM-00000006zGN-2Uka;
	Wed, 02 Jul 2025 01:29:54 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmII-00000006zFE-20Fk
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 01:29:53 +0000
Message-ID: <47333b7f-2eac-4f57-a9d2-2a7f24c8fa7d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751419786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPrS94lVOu7EmI9PYREdDlh0EO6H/zNHIWs+MvCReBI=;
	b=nA9zp2rIDXqL4jzjAR5plfd7uB0j/RUUL+bdMkXsWvyT5PSap3GreV6kZ7o8P0xqNqRSG3
	RzIcf1e9N92AKYdX/uvjqrwzkuME1+dZao9Qp0+McCpbkHZvDe0FWsQk4e5lfn4MPie2qm
	32F5oEnaKg4aRZTbjls//FK0VXFIMAc=
Date: Wed, 2 Jul 2025 09:29:33 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@redhat.com, 21cnbao@gmail.com, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com,
 mingzhe.yang@ly.com, stable@vger.kernel.org, Barry Song <baohua@kernel.org>,
 Lance Yang <ioworker0@gmail.com>
References: <20250701143100.6970-1-lance.yang@linux.dev>
 <20250701141705.ff1a446e6a25d7970b209c3e@linux-foundation.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250701141705.ff1a446e6a25d7970b209c3e@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_182951_728493_9516CEA3 
X-CRM114-Status: UNSURE (   9.66  )
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



On 2025/7/2 05:17, Andrew Morton wrote:
> On Tue,  1 Jul 2025 22:31:00 +0800 Lance Yang <ioworker0@gmail.com> wrote:
> 
>>   - Add Reported-by + Closes tags (per David)
>>   - Pick RB from Lorenzo - thanks!
>>   - Pick AB from David - thanks!
> 
> It generally isn't necessary to resend a patch to add these
> things - I update the changelog in place as they come in.
> 
> In this case I'll grab that Reported-by: and Closes:, thanks.

Ah, good to know that. Thanks for adding these tags!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
