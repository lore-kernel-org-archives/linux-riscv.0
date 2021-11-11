Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC328C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 10:48:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F0A61002
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 10:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51F0A61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9fB9TDERrk0ByT+9FGt2Mm6smFFHhJpoyMUwIXuiSY=; b=VTLy1wn382tr+C
	zW49QPPJK+T5o2T7KXbdsWRIjb+ibSwMrlnoOtd9mXbJ0wYzIHO/DuVaS0CCr0NjYJi8QLO53zHtr
	N8WRBr6lFUd6uvsX5A6nL7fKq/wC2vOZIMbIefzKotDD7LwZaqVhls/OdYWbpHwsZDanj4O8Iejs3
	co2EOy8IssaS/s90aJFiORA+5QIWMIEgVw5hiemq+AgN9TVdQCKvpoIdy7dihxF8lszUQ/HveEn7M
	nC3kYA8hBAAE+G6QPbhw9ki1ZpiBEj10igWWsS6YiQkVxBWBdU6/1abJlmSCXT9HBOe+y7IwIiQIs
	gQXp0hbKoiorfTtRN58g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml7d7-007ib2-BF; Thu, 11 Nov 2021 10:48:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml7cw-007iad-0r; Thu, 11 Nov 2021 10:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Lk4G/R3I07fhmcAqeSUqtCqNDck8UECisYgW0RP2fZk=; b=AET3uxMt3hHFzdG81TShZLlRhA
 lnzx4x2xkBejjcu8i+MuOlBWGAq82yBnQhP9jNhSKqzutZkvoPrE+DaFRBQ2JOb4j5DojW+YmB1TQ
 EZfc3k1Z3m4KXMajFbDtwS9023NbK50LztQbXevsdQvS6AOv4JY3DBFmFrzKqXOH+RV3M0pyTvPbI
 9sn7wEgLyUpWZTEsemou0MiLDGDeur8Ama9taCLIXAaN6Ru7/xY5zsA5qZdI+ad11Hfx7npvyG54r
 SstAvX6uYL3TOGkFqkoXYIn4TKwOJvn7Eki+iTRy2VOK059F6VHaZNIoBBTll1KF9xSh0wvNlGSuH
 NL6Mf2Yg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml7ce-002eyR-My; Thu, 11 Nov 2021 10:48:01 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CB96930001B;
 Thu, 11 Nov 2021 11:47:57 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 950042D1ADCA5; Thu, 11 Nov 2021 11:47:57 +0100 (CET)
Date: Thu, 11 Nov 2021 11:47:57 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Artem Kashkanov <artem.kashkanov@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v4 01/17] perf: Protect perf_guest_cbs with RCU
Message-ID: <YYz03fcDRV9NZnyA@hirez.programming.kicks-ass.net>
References: <20211111020738.2512932-1-seanjc@google.com>
 <20211111020738.2512932-2-seanjc@google.com>
 <d784dc27-72d0-d64f-e1f4-a2b9a5f86dd4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d784dc27-72d0-d64f-e1f4-a2b9a5f86dd4@redhat.com>
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

On Thu, Nov 11, 2021 at 08:26:58AM +0100, Paolo Bonzini wrote:
> On 11/11/21 03:07, Sean Christopherson wrote:

> >   EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
> >   int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> >   {
> > -	perf_guest_cbs = NULL;
> > +	if (WARN_ON_ONCE(rcu_access_pointer(perf_guest_cbs) != cbs))
> > +		return -EINVAL;
> > +
> > +	rcu_assign_pointer(perf_guest_cbs, NULL);
> > +	synchronize_rcu();
> This technically could be RCU_INIT_POINTER but it's not worth a respin.
> There are dozens of other occurrences, and if somebody wanted they
> could use Coccinelle to fix all of them.

I've been pushing the other way, trying to get rid of RCU_INIT_POINTER()
since rcu_assign_pointer(, NULL) actualy DTRT per __builtin_constant_p()
etc.

There's a very few sites where we use RCU_INIT_POINTER() with a !NULL
argument, and those are 'special'.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
