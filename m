Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CFCC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 14:50:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DF03613C7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 14:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DF03613C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=du2b9kViK+9xfsO3OCyYnDDYeKa+88F8Q8Z/EbEAKVg=; b=VI7qyoYgHdevk0TWsOOEb+0s/
	fipZow8z6O48GBRvgVC8Tu9v7bp5/hF+OkXJPyktohSicvm3LZpPAJctCy0f5okhch4VlWe5AWhvw
	tWRdrXoE5EHsRlA1fWGsP8dDn5xMhburkpRVsf+CXQ/FMlSfjHPZ2WJliERngx8wGKZvr+beeGi8H
	l6lf6zRZLB9Q/aA7JblLOn5BNXh9XXR6faVPCW1CYpZFsj5jStO73U6jsSlgbx1B62QIY0zf+Gpxi
	7NagDqp/hVh/BhHBlcaIZCTKHLbzn01BT94/f5ynMY8Ev88cf5Nth8x2jUjkLjawt+64SD/AWi7o9
	kdV2zVRTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYrhv-00COQb-Ps; Tue, 20 Apr 2021 14:50:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrhu-00COQN-1O
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 14:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=69c/suhHotwW+t4b4S1e0Clny1EowO9TJIKA0LoMQqI=; b=K8f027rmvoP12nTP3Ke7TXotZM
 nzKH3odiPMsKaHszBoyEcaQHqIUPfH7O+Ub5wdJThVHhbeqmZ/2qEmxmQGrK0ktzEHteDrjqfD9GD
 /zQgwk4nDyAvlb4G+IPwqbX7+wIO2CsvR7CyCbNFZ0OIadl9clmxJ9AyDrUaYWABoSLtgpbEYTLoe
 Z7yq3GEF+M8fJmXMrf4jud/4hs+bcG2z2Ficy1YyGYEqMm6K7oqVYPkZtwsBiDhJJ7xMZA3JWCwaM
 RiJqKUmdRpkzNSLdgoEcMOL5RaP1vB1ghxcTcXk1NY108tMJzVeeBDD7pHeJ/5LGgXvR6ZeFzEADI
 VZ0Jdl6A==;
Received: from zeniv-ca.linux.org.uk ([2607:5300:60:148a::1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYrho-00CCuz-DI
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 14:50:28 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lYrh8-006oXm-Sg; Tue, 20 Apr 2021 14:49:43 +0000
Date: Tue, 20 Apr 2021 14:49:42 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH 2/3] nios2: Cleanup deprecated function strlen_user
Message-ID: <YH7qBjuC4UIfwE8X@zeniv-ca.linux.org.uk>
References: <1618925829-90071-1-git-send-email-guoren@kernel.org>
 <1618925829-90071-2-git-send-email-guoren@kernel.org>
 <CAK8P3a1aNDomNiX7W1USWnmdw1VR21ALX7NvJYGW9LBO+jvA4A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1aNDomNiX7W1USWnmdw1VR21ALX7NvJYGW9LBO+jvA4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_075024_467531_4819102E 
X-CRM114-Status: GOOD (  13.87  )
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

On Tue, Apr 20, 2021 at 04:32:33PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 20, 2021 at 3:37 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > $ grep strlen_user * -r
> > arch/csky/include/asm/uaccess.h:#define strlen_user(str) strnlen_user(str, 32767)
> > arch/csky/lib/usercopy.c: * strlen_user: - Get the size of a string in user space.
> > arch/ia64/lib/strlen.S: // Please note that in the case of strlen() as opposed to strlen_user()
> > arch/mips/lib/strnlen_user.S: *  make strlen_user and strnlen_user access the first few KSEG0
> > arch/nds32/include/asm/uaccess.h:extern __must_check long strlen_user(const char __user * str);
> > arch/nios2/include/asm/uaccess.h:extern __must_check long strlen_user(const char __user *str);
> > arch/riscv/include/asm/uaccess.h:extern long __must_check strlen_user(const char __user *str);
> > kernel/trace/trace_probe_tmpl.h:static nokprobe_inline int fetch_store_strlen_user(unsigned long addr);
> > kernel/trace/trace_probe_tmpl.h:                        ret += fetch_store_strlen_user(val + code->offset);
> > kernel/trace/trace_uprobe.c:fetch_store_strlen_user(unsigned long addr)
> > kernel/trace/trace_kprobe.c:fetch_store_strlen_user(unsigned long addr)
> > kernel/trace/trace_kprobe.c:            return fetch_store_strlen_user(addr);
> 
> I would suggest using "grep strlen_user * -rw", to let the whole-word match
> filter out the irrelevant ones for the changelog.
> 
> > See grep result, nobody uses it.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> 
> All three patches
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Do you want me to pick them up in the asm-generic tree?

Might make sense to check -next from time to time...  See
a0d8d552783b "whack-a-mole: kill strlen_user() (again)" in there

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
