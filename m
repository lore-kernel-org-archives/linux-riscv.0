Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C77AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 09:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pk9h95r+YsNaEKuT0ehPCXFWMehdWnLjRV4S9en2A9E=; b=m6uH81vO71mTVL
	bQZYyj00P2Xd9VX42PSlup1qIHocZRTXC5fbp+IixIY+6GECjoZKlM9c55z+I/U1jYJgQtJYEVHf6
	701DX1eAQNwkxR7Ni4J7fFOMuIiJMUbo9UfMp2xYv1Flgqgrn3I/F/LoVofks24aIOk1pR0aV4kOI
	LMTPCJL+aJT+I4MPLOY9PrTXZyTtP6EReJVQCwKh3Fa31CDFnLnGpEPgmhuSdDjk3X0Pcqw2i4OWz
	UuOiFZPNNpp2otOl4arVP/tUcUhPokqUY4lWRmpCA8jt6EQ+zC+/r0FIEh3o9Ypb8Tq3Se4ZGPMLb
	JbkFRFoSvRmZhkBb2eYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nETBG-008gGr-6K; Mon, 31 Jan 2022 09:41:02 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nETB3-008gCm-69; Mon, 31 Jan 2022 09:40:50 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 42D361F380;
 Mon, 31 Jan 2022 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643622047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y00ZKxq/dpqUDwh0rX8TbLgQbvVTvbkuCSKi0GTnT4o=;
 b=TAvjGCxBgtVEooteuwYwy7uWXHIEi1iRNO342s4/jJ+IIGBmHSjZzV5GBJojCxowtd9VF/
 o3CAUfL8yGH9rRehhR4/C5FstjONcFAU8j7o3FYVmx80A08KFhFcu/K4azbvNlmWYom+Ua
 6mK0Ha0OUepOw9iyGtTEgdVyGEbI2ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643622047;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y00ZKxq/dpqUDwh0rX8TbLgQbvVTvbkuCSKi0GTnT4o=;
 b=xUgFlc+6YdMvHQgFdTVnfhl595dV1vnsZnMruHRjkkwO5586I6U3elglHK3ZC5shbyTZxG
 3d8GjzSobgWcibCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7204D13B68;
 Mon, 31 Jan 2022 09:40:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id f0PrF52u92G+DgAAMHmgww
 (envelope-from <osalvador@suse.de>); Mon, 31 Jan 2022 09:40:45 +0000
Date: Mon, 31 Jan 2022 10:40:43 +0100
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH RFC v1] drivers/base/node: consolidate node device
 subsystem initialization in node_dev_init()
Message-ID: <20220131094041.GA15392@linux>
References: <20220128151540.164759-1-david@redhat.com>
 <YfeARpenqPii1WQH@localhost.localdomain>
 <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3be2e20c-f0b9-c080-adf4-b0e17c046eb0@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_014049_404142_1BB4113A 
X-CRM114-Status: GOOD (  14.38  )
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

On Mon, Jan 31, 2022 at 08:48:54AM +0100, David Hildenbrand wrote:
> Hi Oscar,

Hi David :-),

> Right, and the idea is that the online state of nodes (+ node/zone
> ranges) already has to be known at that point in time, because
> otherwise, we'd be in bigger trouble.

Yeah, I wanted to check where exactly did we mark the nodes online,
and for the few architectures I checked it happens in setup_arch(),
which is called very early in start_kernel(), while driver_init()
gets called through arch_call_rest_init(), which happens at the end
of the function.

I am not sure whether we want to remark that somehow in the changelog,
so it is crystal clear that by the time the node_dev_init() gets called,
we already set the nodes online.

Anyway, just saying, but is fine as is.
 

-- 
Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
