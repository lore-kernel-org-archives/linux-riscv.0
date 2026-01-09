Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7211D1681C
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 11:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKHbkDpugfpcl1yeuT0k84yf75wvKZH3D7oGWeQByqg=; b=bgHavPlfRKC8D4
	Unn35qVYDGy6uOwuTcyXWu4CSXBNV8akzQUJBPCpt6r0mG/RdmKwdKri+JLIm+xuz4ohZ5gyB1nHg
	0aekS8D9d4ENxl2o6dsM6GvkVlLetexn1I9IpM5+BvxVfNUxNMxCLBTAU7aAPKcVWExJls/xXV9iE
	tkMSaw4wvS4hG2nlAQaoWt84FUQgmFqvCD5CopQJoPx8LSEJdprk4j1Yi1DxmhhYIA9J+0gYtvcPm
	kSPr60ZyrrvB+0Ze+LOG/Foa04oAC+W4gquw8n0TJtymq+gJWjZ/7J5b/EDGYVDEWWBeQs/5A5Tez
	nOKAtqg2Q2Yx3VtRTqAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veB26-00000002GEo-0Jzy;
	Fri, 09 Jan 2026 11:51:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veB22-00000002GDd-1frq
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 11:51:56 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767959507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sFpAyGR1wIwB1bVkgZLiAxaubpp6P7e/qPqMXBTVbQs=;
	b=2nq1ftlXVXogAGBvb6Hi+T7FUbNjzuu3em65EkmT5UOh7azebA/B8vSihm71hjFdXbi/Ge
	/N31GGBXKphTvA925dxYj/KHmifpqaGrnPmlol6lMUVJO2RGfe942SCCTK++/Wm+BV0SdT
	DhHhvcPi91KP4EqyBn/M8eddWSvy/jMNytKeecFezF4in/Q4cAWaklFQf6kXeaQAh5ijD4
	z9nAIt3/m/cKfCY//wU4JCxQKAD1+G1mYVjzCorP2BazaP5nQF/gAY9XHx2aJPE/E66glU
	YQXQn95C4nx4qBMLbmqhxgVCt08o1hkIR5nMJEHHNNqsvjoblAwD40qE9juDQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767959507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sFpAyGR1wIwB1bVkgZLiAxaubpp6P7e/qPqMXBTVbQs=;
	b=BEO0p8I8iqBb5MOKbLIRLl28N5lVehaAO0u23eXNThfAMWang6+IlafKH32c8fs9EHR6Q1
	PTEpfidEWcGEa3DQ==
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, sanjayembeddedse@gmail.com,
 virendrasinhchauhan1206@gmail.com
Subject: Re: [PATCH] irqchip/riscv-aplic: adapt to syscore API passing
 context data
In-Reply-To: <6eafdd754222e11a43be4bbc3652f7605d47afa6.1766559840.git.sanjayembeddedse@gmail.com>
References: <6eafdd754222e11a43be4bbc3652f7605d47afa6.1766559840.git.sanjayembeddedse@gmail.com>
Date: Fri, 09 Jan 2026 12:51:46 +0100
Message-ID: <87jyxrrokt.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_035154_580359_BB9B5B95 
X-CRM114-Status: UNSURE (   6.08  )
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

On Wed, Dec 24 2025 at 16:41, Sanjay Chitroda wrote:
>
> Fixes: a97fbc3ee3e2 ("syscore: Pass context data to callbacks")
> Fixes: 1c546bb433618843 ("irqchip/riscv-aplic: Preserve APLIC states across suspend/resume")

This commit does not exist and the patch does not apply as this got fixed
already with an update folded in on Dec. 16th:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/drivers&id=95a8ddde36601d0a645475fb080ed118db59c8c3

I have no idea which tree you are working against.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
