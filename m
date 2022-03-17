Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE74C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+LgZEhSiNjfhkTUZ+k1QifvcT/0+MZ+eVhRBQGgzlY=; b=pr9oaFg2aIy5Rt
	y/rYn8qF4iANWhF4HGG4uq8b8iXNeSiIh1XS3r/nVFzOzk3TOUnT/AzIPgNJOJ3FSO+Eyl5LBYphZ
	K8NRkfanJd81qqzQ09st1HL423iw79fjYbDQ5KLQvbTGL920LfJutqnK2o6kl6wyiyguwGyJysqFV
	AH9poEr9uqPjqNpRnunz9ryv9ArSrcHIgtleaDUbq4KWDiv0TERK7eUclzOfqrtiayRV6dwv8JxYh
	TjkJR4oZK0wHY5Vv32RonSb9FW8DzOlWOyk9BL3/53+Crt2N7aNg/WN//Fte3ZcaLqFO/zEhlo09O
	5MbQGKjZOR/7i8JO8gVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUmiK-00FZTN-4s; Thu, 17 Mar 2022 09:46:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmiI-00FZT0-Cs
 for linux-riscv@bombadil.infradead.org; Thu, 17 Mar 2022 09:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+qA6MENEtbOnKxLxQVOH0ud0BbLlTVGZKx9qSfsjh7M=; b=gkygt28PPeixJWqoCdDEjatxVm
 EB4DflH8ok/qCvuqnejlHsxty4rwOyj9OSE49mLDz2vhgxO62t4tGyg6YrefluQiwtrsuO/bnKLFv
 ir1Z5YuDFUXMn1l2bA9ibju+jHG2AiJHVAN9/mbiZEwN0+61eOkcI9Hbm50HVuRT+aTvY+K4sWbWo
 gHi9ySkYyAvzIp+7diY5expc5fDs+ThTsnMlyRx7+PzgvAvSyXBCXQjOmKs2bVQ1/xmJr4LofnL1F
 HbT5ALLebqxJ3wUy2TgdgTt+o562eCoPFfB/1XEnk3ZSJfnG8BvhUQC2aaC/boNo18l2PUX4axprz
 cshy4y1A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUmiG-006qcM-TH; Thu, 17 Mar 2022 09:46:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 525613001EA;
 Thu, 17 Mar 2022 10:46:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 42268201CD1C3; Thu, 17 Mar 2022 10:46:32 +0100 (CET)
Date: Thu, 17 Mar 2022 10:46:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, openrisc@lists.librecores.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 3/5] openrisc: Move to ticket-spinlock
Message-ID: <YjMDeKw/3qxclCJf@hirez.programming.kicks-ass.net>
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <20220316232600.20419-4-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316232600.20419-4-palmer@rivosinc.com>
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

On Wed, Mar 16, 2022 at 04:25:58PM -0700, Palmer Dabbelt wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> We have no indications that openrisc meets the qspinlock requirements,
> so move to ticket-spinlock as that is more likey to be correct.
> 

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
