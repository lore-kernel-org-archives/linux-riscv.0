Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2974C5321E
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2024 02:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1d/TXoeYxtQFheLaTIH1SsVUtocmJcOiZ32rgC00u8=; b=PIKyVJhGtQXxus
	sulm4ex255c2Nn1f8U0ux+y84/Hq9xSGhUhioGF3otuXoFa0J9YcTzxop4J5cK5q6wIvgclaaDrKr
	dRZbxIqvYFDGz7N+kobT7C7iPGNBAGt4ij8zAwHTa8h3idgqoie/fhDf+/VQFhgnVN67/ym+RBO8p
	VIzBYniMp8qB8sf1bp8fCqARgdLBdd4R6onjAfp6PlcKEmYS0fpbs9lRmdaJnWELE9FVPio0P2or4
	23tuvZMFAQXLAs9W6cmQNOXD/Lpkcq/pru5MPJxkCug/G/97Pqj+dXCqrsO5nCEt29U57az2LNHLo
	KK6A00GUlZyMBMwb/RXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shgDa-00000001DJ5-0L11;
	Sat, 24 Aug 2024 02:09:30 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shgDY-00000001DI1-02Jj
	for linux-riscv@lists.infradead.org;
	Sat, 24 Aug 2024 02:09:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1724464663;
	bh=ZdptpvZunaw0PLSDFJJ841ADB7LgdVYYNI/QYfzS23o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IGR28dm2CK4RA6XwL4MgMGSZTe1cEs1GDTn8cgKqaxGGZ+SpUE0S9afg+1TDwgzrG
	 23mm7f4ggwaNLAoKKl0uA3F3c6DbPOYBhHTgDS/rtPHt47p3f+WCqavMT5Q9I2Po2s
	 P52vHjW1YahXrTaGGRnifE5bDWYlXMQOLTlYesKQ=
Received: by gentwo.org (Postfix, from userid 1003)
	id 7812240355; Fri, 23 Aug 2024 18:57:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 76A234022C;
	Fri, 23 Aug 2024 18:57:43 -0700 (PDT)
Date: Fri, 23 Aug 2024 18:57:43 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
    aou@eecs.berkeley.edu, dennis@kernel.org, tj@kernel.org, 
    samitolvanen@google.com, guoren@kernel.org, debug@rivosinc.com, 
    charlie@rivosinc.com, cleger@rivosinc.com, puranjay@kernel.org, 
    antonb@tenstorrent.com, namcaov@gmail.com, andy.chiu@sifive.com, 
    ajones@ventanamicro.com, samuel.holland@sifive.com, haxel@fzi.de, 
    yang.zhang@hexintek.com, conor.dooley@microchip.com, evan@rivosinc.com, 
    yang.lee@linux.alibaba.com, tglx@linutronix.de, haibo1.xu@intel.com, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org
Subject: Re: [PATCH RFC] riscv: use gp to save percpu offset
In-Reply-To: <20240824004920.35877-1-cuiyunhui@bytedance.com>
Message-ID: <e06a3bd9-6378-2d4b-b06d-cc2d58776eca@gentwo.org>
References: <20240824004920.35877-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_190928_103428_E6DA47C5 
X-CRM114-Status: UNSURE (   6.62  )
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

On Sat, 24 Aug 2024, Yunhui Cui wrote:

> Compared to directly fetching the per-CPU offset from memory (or cache),
> using the global pointer (gp) to store the per-CPU offset can save one
> memory access.

Yes! That is a step in the right direction.

Is there something like gp relative addressing so that we can do loads
and stores relative to gp as well?

Are there atomics that can do read modify write relative to GP? That would
get  you to comparable per cpu efficiency to x86. x86 can do relative
addressing and RMV in one instruction which allows one to drop the preempt
enable/disable since one instruction cannot be interrupted.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
