Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BFFC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 14:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPeSh7zaHivSh5P5dCTKSbNag4LO27SnDgdQp2jaqsU=; b=T6fwYvY7WvDNwo
	cerwt7VaI/U8sGVwp48PJgRuQ+r5WCQ64+9/ZztfQWXe2cNKMsMZM+xYI1kVYnKAI+Fqpbq/Hw/Es
	AztjxYnMYb69dPyyusudcLR9OkQiAIMCBK7tjdsdGG3qaPYbFaM+0eGabo2Nx43yLPqzliNa9KNVM
	DuHjr2pEl6oI2q56A8w4QsO2YD0U+Ig/lzecR3x61YnfIs4zOIMdZ/vnJ9Aq0HGw40/60149DUkWZ
	qkhnZNVg/Uic54L0y8F6ZcuDEKQhbyHdeDzoCTVsBiIxGJ9NqerZr6C02quljAXrf86JKyOAtFFQG
	H04i07oN2mcwZNpp8eYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNaha-00GBBQ-E4; Thu, 02 Feb 2023 14:36:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNahY-00GBAw-1d
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 14:36:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D05FBB82668;
	Thu,  2 Feb 2023 14:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04285C433D2;
	Thu,  2 Feb 2023 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675348592;
	bh=PUTKwu61nx4E8yIO29kUBc+gTUgWoPwlBHwWaYyw/p4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g2GblDkaciicIjaFVbzvKrsNEdniwR07xXkNTgWhLkHXVdbb1P9YCKIFJWEWlxwV4
	 diWLV0Xk3kK+cGrjoHFNySYUc1H5kO9KA58YVbjrcy8RglR76/M2gz+3ctU0QCxl31
	 YTO4rTJoiATsTRBe8C5AUFnkDI8x5n7RCDuHXlmoiaMgJ6x5Jr8UFUl144hdgTjsu8
	 idB5XuEoivdovE86aYffpwccZLWnTHbH4kxbZdBIq+A4VtlKquUlZvkSc4GRhJsfli
	 yoVA4MW2ggKd44WzR8GrL0bv8k7A33usqVREPWe/LaNEmMhW+jdcHgjBNtvAk9Ms7i
	 WS1njy1lUNw1A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Conor
 Dooley <conor.dooley@microchip.com>, liaochang1@huawei.com, linux-arch
 <linux-arch@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>,
 Bjorn Topel <bjorn.topel@gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup misaligned load text
In-Reply-To: <5C373F4A-983E-4ACA-AAB0-54E629D5F501@jrtc27.com>
References: <20230201064608.3486136-1-guoren@kernel.org>
 <87tu05pvur.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTSj12E9+peMF0rNY_psGDyEG5BbMY6V-s4dK0FpkCC9Yw@mail.gmail.com>
 <87cz6s75ze.fsf@all.your.base.are.belong.to.us>
 <5C373F4A-983E-4ACA-AAB0-54E629D5F501@jrtc27.com>
Date: Thu, 02 Feb 2023 15:36:29 +0100
Message-ID: <878rhgrv6a.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_063636_269348_3D9624E6 
X-CRM114-Status: UNSURE (   6.31  )
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

Jessica Clarke <jrtc27@jrtc27.com> writes:

>> +	p->opcode = *insn++;
>> +	if (GET_INSN_LENGTH(p->opcode) == 4)
>> +		p->opcode |= *insn << 16;
>
> *insn gets promoted to int not unsigned so this is UB if bit 15 is set.

Ugh. Good catch! I guess we can't get rid of *that* explicit cast to
kprobe_opcode_t here...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
