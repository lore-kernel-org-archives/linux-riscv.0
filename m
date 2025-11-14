Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99253CE8D76
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsjyfrYckzZeHd8SwD4nqKkMn+ARgEMfUTAKW807ma4=; b=DuwizsGsqCsTJk
	3wkYd6+M5hu3K9NIgowBXVMKBY3mcObwnRXu2Ij4pyt2yx0Sbmtvvno15gMNLtkXENTMj72H+OXEp
	83QvlbukD/XVTWOSo2ZDyBo4LumK1hkwqJmtbYFNDVBBa2VTyh5XQJiz7zn90JqAdsPULOTsrWhhC
	eM1DcpIBWbItmxIrgsrKpUDt/8Bbl85stXc5Z+VBYeydHd/54oj5ujhJuCZNGtBko5NtvcfOw6v0N
	A5NZ3xKqhBfPfZ9usc8UMBHRtKF21OSSvQcCP3Yv+y9M/xMv2ZYgq+W62t3r/nR2a61Jbh/2FhAXc
	VbTqSZMENh61E/I/cnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJziX-0000000D22D-2nNu;
	Fri, 14 Nov 2025 19:44:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJziS-0000000D21U-3WQK;
	Fri, 14 Nov 2025 19:44:20 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763149455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3YYGc4b5Pr9c4KoZvbwK3VLYSBe3af5xbvfb36+JCI=;
	b=LexRWbmLGZy53r6pTcHou9ffaCf/nQBlEuUud81fffTY1piVuJlKS99+J4BVcxB2h84jVA
	JsDVd16BrBOgFBCT0hiKaD7d1DxSchV3AhjHg6spJ+D8Gu1klglzmpMaCgeLWDvOCTsERG
	TahicHhYFn5juSANT1fOG4/BZZs5E3i6st/AMlK6rq5Pm1MD7bn2QLirPCQ7mVfpyvBxWQ
	y7N47YdVd0cXYHN6TOzrpQYHtzJQEMqS9a5FiIqS7VRv11cqcF4oP2jHm0V9jlhe0nHqdy
	77RvM4vBdYBuThkDLcQ8hKvNll7l50VNArnuoyW+n4X3SrmRWt78tbrbjEWkJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763149455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X3YYGc4b5Pr9c4KoZvbwK3VLYSBe3af5xbvfb36+JCI=;
	b=40zAVFBmoQ9ytl+qD4DXmOWJ1OqpyrNSsoOVU2TYC6tHo4z2zi5Tm3fE+RnPtd7F0VaBLs
	VPpdI75gggZjAvAg==
To: Xie Yuanbin <qq570070308@gmail.com>, riel@surriel.com,
 segher@kernel.crashing.org, david@redhat.com, peterz@infradead.org,
 hpa@zytor.com, osalvador@suse.de, linux@armlinux.org.uk,
 mathieu.desnoyers@efficios.com, paulmck@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net,
 andreas@gaisler.com, luto@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
 james.clark@linaro.org, anna-maria@linutronix.de, frederic@kernel.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 qq570070308@gmail.com, thuth@redhat.com, brauner@kernel.org,
 arnd@arndb.de, sforshee@kernel.org, mhiramat@kernel.org,
 andrii@kernel.org, oleg@redhat.com, jlayton@kernel.org,
 aalbersh@redhat.com, akpm@linux-foundation.org, david@kernel.org,
 lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com,
 max.kellermann@ionos.com, ryan.roberts@arm.com, nysal@linux.ibm.com,
 urezki@gmail.com
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, will@kernel.org
Subject: Re: [PATCH v3 2/3] Make raw_spin_rq_unlock inline
In-Reply-To: <20251113105227.57650-3-qq570070308@gmail.com>
References: <20251113105227.57650-1-qq570070308@gmail.com>
 <20251113105227.57650-3-qq570070308@gmail.com>
Date: Fri, 14 Nov 2025 20:44:13 +0100
Message-ID: <875xbcbdrm.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_114417_016044_741B06FF 
X-CRM114-Status: UNSURE (   6.09  )
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

On Thu, Nov 13 2025 at 18:52, Xie Yuanbin wrote:

> This function is short, and is called in some critical hot code paths,
> such as finish_lock_switch.
>
> Make it inline to optimize performance.

> +static inline void raw_spin_rq_unlock(struct rq *rq)

That inline does not guarantee that the compiler actually inlines
it. clang is obnoxiously bad at that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
