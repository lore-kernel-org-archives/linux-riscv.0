Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09DDEF99F1
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 02:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qr1kp58VFcHVUbnCZKvcjVnJCuJ8S+pmibSWpFxL9RE=; b=H74kF1nTFV0ubU
	LKcVT6qZxiioSlTM9KXu2xbr4bcqL6s8fNBhzKoe84PUsjD7KspaYgZD/eP+rNXQl7EgPmKh7nuLo
	mscDs6H2TDISxzbfWF1xVrHsqg8d5BpKrclBcqHQciDxuaoD9wOkx0gyXwQBI/lzqs1piviS5yH1l
	VBHCqp9Wkav90h19xatt+DskxmJpepOzSrZ/ABmBmGZFb8i1WFVN/86dymqSDoZT3QAXn9jNnI7b9
	iXQGs85lRYblqhPITTAXFDzVQSH+FkpTCmRxmSueDE7XaAq01T2fTGIqu8TP7YFQ4E2+NrXbH4ZB4
	/oD08l+/yusrDC77smyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5Mu-00000004AOR-0KdW;
	Sat, 14 Feb 2026 02:26:48 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr5Mq-00000004AO3-230f
	for linux-riscv@lists.infradead.org;
	Sat, 14 Feb 2026 02:26:47 +0000
Message-ID: <8ee1b065-b021-411b-b5ee-22c4a108cbce@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771035999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0G0v4sVDDa/rU7cSPsEm3DDPPtxN/YGFfMN1h9Ze2E4=;
	b=ivIJMQtRNW1E0gGE8YTM0oKtbIK0OFy5AMJCJqoYa/c3LykfEWRHJpcCa9K4BS0Kwx85pd
	s/Nh+tMRLR9XfMlulroHGKed2CJyyjncrh8p7KecACNtIkEKXc6uZTcSWJFi2dMHgDfO2A
	YT9xe2xuWlVgyTid3BQxdF7WNKK+YT0=
Date: Sat, 14 Feb 2026 10:25:57 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] riscv: fix minor typos and style issues in XIP code
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
 zhouzhouyi <zhouzhouyi@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260213094739.397762-1-kunwu.chan@linux.dev>
 <20260213-entomb-ambulance-ec51cd9ea179@spud>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kunwu Chan <kunwu.chan@linux.dev>
In-Reply-To: <20260213-entomb-ambulance-ec51cd9ea179@spud>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_182645_761773_E60B4B64 
X-CRM114-Status: UNSURE (   7.73  )
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

On 2/13/26 18:47, Conor Dooley wrote:
> On Fri, Feb 13, 2026 at 05:47:37PM +0800, Kunwu Chan wrote:
>> Fix a few minor issues found in riscv XIP-related code:
>>
>> - xip_fixup.h: comment typo (_start vs _sdata) and spaces-vs-tab
>> - head.S: spelling typo and wrong #endif comment
>>
>> Kunwu Chan (2):
>>   riscv: xip_fixup.h: fix comment typo and whitespace issue
>>   riscv: head.S: fix typo and wrong #endif comment
>>
>>  arch/riscv/include/asm/xip_fixup.h | 4 ++--
>>  arch/riscv/kernel/head.S           | 4 ++--
>>  2 files changed, 4 insertions(+), 4 deletions(-)
> The patches should be sent in reply to the cover letter.

Thanks. I'll resend the series properly threaded.

-- 
Thanx, Kunwu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
