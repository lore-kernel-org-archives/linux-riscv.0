Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2D2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 05:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wogssrldNpw0f0lyZYCIvUv9rCBlSeWIGPbeCPLwiK0=; b=WvUUl3H//yz1y1
	f3rC/8RDXQSgGhgTtJp7gbGc4ji1GTXu2WcmNdjQykjJayUa+7SaU2EiDxUTqJZFG0ZflJz76edIO
	t7hOVyH2a0uJxGEC/6qR9Sm+dffeU1bFXK8iLUBK9uphL5GXa99Q2V++EFMuexvmYZw1Sb6GUO54x
	LOxxspwEQhMnfOQn9cWTbWuq+Jtq8Bb3uBnwS4RJDhnzERSWbZLR3nMBKE2mR4fxMbaC0wSJha59C
	GitRI0HIDbvYYpS4ZeUyVaJJbidf7O1cdZuGe01nZ5BxLtlAq9UfHJxDpIiYISKPY1OrWEidYzoQy
	i5R/YUDxTIvJBcostbYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnwC6-00CZBU-9f; Mon, 09 May 2022 05:44:30 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11]
 helo=relay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnwC3-00CZ9m-87
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 05:44:28 +0000
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay09.hostedemail.com (Postfix) with ESMTP id DA84C2FD39;
 Mon,  9 May 2022 05:36:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf17.hostedemail.com (Postfix) with ESMTPA id B49131E; 
 Mon,  9 May 2022 05:36:01 +0000 (UTC)
Message-ID: <918affc0a0a91dab08647696ed6587021264f25f.camel@perches.com>
Subject: Re: [PATCH] KVM: selftests: riscv: Remove unneeded semicolon
From: Joe Perches <joe@perches.com>
To: Anup Patel <anup@brainfault.org>, Jiapeng Chong
 <jiapeng.chong@linux.alibaba.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, KVM General <kvm@vger.kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-riscv
 <linux-riscv@lists.infradead.org>,  "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
Date: Sun, 08 May 2022 22:36:01 -0700
In-Reply-To: <CAAhSdy15CE5ZUROH-mOwhpR0AuwsK8h+8W-Kd0jxwsTixpQOQg@mail.gmail.com>
References: <20220506094512.116729-1-jiapeng.chong@linux.alibaba.com>
 <CAAhSdy15CE5ZUROH-mOwhpR0AuwsK8h+8W-Kd0jxwsTixpQOQg@mail.gmail.com>
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
X-Stat-Signature: q34mkbymsd5c8i4guxezgn8qm5yedycu
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: B49131E
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/6eHbjh40QHHy98IswUgEhKu3HfsOuVzY=
X-HE-Tag: 1652074561-122139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_224427_380188_96178D78 
X-CRM114-Status: UNSURE (   8.54  )
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

On Mon, 2022-05-09 at 10:37 +0530, Anup Patel wrote:
> On Fri, May 6, 2022 at 3:15 PM Jiapeng Chong
> <jiapeng.chong@linux.alibaba.com> wrote:
> > 
> > Fix the following coccicheck warnings:
> > 
> > ./tools/testing/selftests/kvm/lib/riscv/processor.c:353:3-4: Unneeded
> > semicolon.
> > 
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> In future, please CC kvm-riscv@lists.infradead.org for KVM RISC-V related
> patches.

Perhaps add or update some MAINTAINERS entry as this list is not
currently specified by:

$ ./scripts/get_maintainer.pl -f tools/testing/selftests/kvm/lib/riscv/processor.c --nogit --nogit-fallback
Paolo Bonzini <pbonzini@redhat.com> (supporter:KERNEL VIRTUAL MACHINE (KVM))
Shuah Khan <shuah@kernel.org> (maintainer:KERNEL SELFTEST FRAMEWORK)
Paul Walmsley <paul.walmsley@sifive.com> (supporter:RISC-V ARCHITECTURE)
Palmer Dabbelt <palmer@dabbelt.com> (supporter:RISC-V ARCHITECTURE)
Albert Ou <aou@eecs.berkeley.edu> (supporter:RISC-V ARCHITECTURE)
kvm@vger.kernel.org (open list:KERNEL VIRTUAL MACHINE (KVM))
linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
linux-kernel@vger.kernel.org (open list)
$



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
