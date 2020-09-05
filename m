Return-Path: <SRS0=D0Wr=CO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8718DC433E2
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 14:42:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91375206B8
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 14:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bDDNIxEy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91375206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/wHub4WiIZsZ4i7N9QaqrIdWPwgFXfPar8bIQ5zAsy4=; b=bDDNIxEyBPGbizwOmsx8VT74Z
	wbagI4hUH9rriDx6+KDxraXUrl5DH9NXef2YqExt0/n7OAdbAwG0aI0b586ss35fpM8l1yP4B2etR
	Hhpq00TsLWMIN2o0az3J3gr3HttQ+5JoUuXXG07v09JguesZxrwtSe99Uja4U5apkHAncd3jOFiSf
	Tc8TXoxEsMQxTzxBRQ06kD0gY1rsWqAeYZDmKOxHrldKBovXZYvsTqIFBBXCSnd3waoI6OyFj/Bn9
	+MkaJf6NsMVeAWql3VrwIsgHnGM6oL9LGzEdmIbrNKSiKHIfwwJVLr6DkDZbY0j2kvoPQXQ95n0l2
	PIPnIAeWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEZO4-0002Gb-0y; Sat, 05 Sep 2020 14:41:52 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEZO2-0002GB-9y
 for linux-riscv@lists.infradead.org; Sat, 05 Sep 2020 14:41:51 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kEZNo-00AviF-NY; Sat, 05 Sep 2020 14:41:36 +0000
Date: Sat, 5 Sep 2020 15:41:36 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/8] asm-generic: fix unaligned access hamdling in
 raw_copy_{from,to}_user
Message-ID: <20200905144136.GA2604093@ZenIV.linux.org.uk>
References: <20200904165216.1799796-1-hch@lst.de>
 <20200904165216.1799796-4-hch@lst.de>
 <20200904180617.GQ1236603@ZenIV.linux.org.uk>
 <20200904223518.GR1236603@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904223518.GR1236603@ZenIV.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_104150_379113_0C233D99 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 11:35:18PM +0100, Al Viro wrote:

> 	Now, if you look at raw_copy_from_user() you'll see an interesting
> picture: some architectures special-case the handling of small constant sizes.
> Namely,
> 	arc (any size; inlining in there is obscene, constant size or not),
> 	c6x (1,4,8),
> 	m68k/MMU (1,2,3,4,5,6,7,8,9,10,12)
> 	ppc (1,2,4,8),
> 	h8300 (1,2,4),
> 	riscv (with your series)(1,2,4, 8 if 64bit).

FWIW, on the raw_copy_to_user() side the same set of constant sizes is
recongized by the same architectures and we have
	* __put_user/put_user in asm-generic/uaccess.h make use of that
	* arc, c6x, ppc and riscv using it to store sigset_t on sigframe
	* 3 odd callers:
		* arc stash_usr_regs(), inlined and unrolled large copy_to_user()
		* ppc kvm_htab_read(), 64bit store.
		* i915_gem_execbuffer_ioctl():
                        if (__copy_to_user(&user_exec_list[i].offset,
                                           &exec2_list[i].offset,
                                           sizeof(user_exec_list[i].offset)))
		in a loop.  'offset' here is __u64.

That's it.  IOW, asm-generic put_user() is the only real cause to have those 
magic sizes recognized on raw_copy_to_user() side.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
