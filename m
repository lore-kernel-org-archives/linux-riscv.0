Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63790C761A6
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2et/A7pslt1l5KrWA4GO9Zqn1nhE6vdIotputLCg7IY=; b=s8y0RSi5cE8lp6
	xdwu3rqOtNpMtMDxO+xaJy67KfsmL4UuxljMK26KRVnfFnfxeFMubNN18fwQnyzB6iPdLItylB40J
	eKcg22uMI2F2Ax5AvlguNpOcQL+TTi4wY/FgDMDJoLungvTDqV/+CRsZmXVtHi3IR+oQunEGsvnzZ
	GNJeB0a9Xe7Yuz3kfJWKmgJw0lZaevRM0qaorkE2CBW0sXgkSdf77dbt1bqnb5pDHWaz6yzD8JR+m
	gKZlnDh0yZD5wGkuwSNJVlte//NpFXcYG5WNsX+8dEUNNidKydHIIkjpNj1DTCeyc8q11cUCRe2B6
	VIwLX660Buw/H/URYPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phsot-003wwG-3B;
	Thu, 30 Mar 2023 14:00:03 +0000
Received: from mail.skyhub.de ([2a01:4f8:190:11c2::b:1457])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phsop-003wuU-2n;
	Thu, 30 Mar 2023 14:00:01 +0000
Received: from zn.tnic (p5de8e687.dip0.t-ipconnect.de [93.232.230.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CFE661EC0529;
	Thu, 30 Mar 2023 15:59:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1680184792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=RaCQbtJuOp6mvRaZEd/yxaaNx3ln6NDUmrn5m6jP5cQ=;
	b=AAMsLpcSo0OnfJr8XT2N2CxydGkTGtTH4OVDjce65Fv3r1awzQAnakR6nzpIVd8js7OM/k
	fJEkv6TbZxgp6j4Q8rh7jtCLkkAc+wDzulgG6zorzgoJ0OzkY7EiDUWKYBGhvISM9TKI5B
	O0bG89vw0sRleDbcY8db9jEv5UwdojA=
Date: Thu, 30 Mar 2023 15:59:48 +0200
From: Borislav Petkov <bp@alien8.de>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
	mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rmk+kernel@armlinux.org.uk, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, tglx@linutronix.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	chenhuacai@kernel.org, zhangqing@loongson.cn, kernel@xen0n.name,
	mingo@redhat.com, peterz@infradead.org, xiehuan09@gmail.com,
	dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
	dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/8] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230330135948.GCZCWV1O/IjsxsBmN8@fat_crate.local>
References: <cover.1680176068.git.pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1680176068.git.pengdonglin@sangfor.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_070000_062263_DDAFE084 
X-CRM114-Status: GOOD (  11.39  )
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

On Thu, Mar 30, 2023 at 04:39:07AM -0700, Donglin Peng wrote:
> v9:
>  - Fix align issues in ARM asm code
>  - Fix align issues in LoongArch asm code
>  - Update commit messages
>  - Update comments for ftrace_return_to_handler
> 
> v8:
>  - Fix issues in ARM64 asm code
>  - Fix issues in selftest
>  - Add some comments on CONFIG_HAVE_FUNCTION_GRAPH_RETVAL
>  - Make CONFIG_FUNCTION_GRAPH_RETVAL switable
>  - Modify the control range of CONFIG_HAVE_FUNCTION_GRAPH_RETVAL

Please control your spamming:

From: Documentation/process/submitting-patches.rst

Don't get discouraged - or impatient
------------------------------------

After you have submitted your change, be patient and wait.  Reviewers are
busy people and may not get to your patch right away.

Once upon a time, patches used to disappear into the void without comment,
but the development process works more smoothly than that now.  You should
receive comments within a week or so; if that does not happen, make sure
that you have sent your patches to the right place.  Wait for a minimum of
						     ^^^^^^^^^^^^^^^^^^^^^

one week before resubmitting or pinging reviewers - possibly longer during
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

busy times like merge windows.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
