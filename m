Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D190C44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 11:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoN54svECzpp5WN0Wd+Sxuc6Z/7IirLLC6g1vgGGQQ4=; b=rpp+XX+/kqtxqV
	tfcTXd/zpHy+cj0EGFJz6sG36Jp0vZO+yIB+XLTGSOBAzClXFLttC9mIeNpfWgfZaIzSbhTHD62fQ
	ZQa63TcyeARLADV3MRlSea2eU1Uelh5NcBSKpvu0K4I0SIrRxHy5UbrTuRyCXr4YrKFVmFlEf0dni
	Nqh2lQtzbewtjIRWjaPg22Wt/ml0RP8f6NdATAcZx3O5CF2l0GZn/g3NF4Y0UaayrWgmywbvQEvzC
	wpAFifPjI1IhaApXRmuk0Ku1ukFj2nZMAVDGXpXe5DWqLf9iqD9roGi7UgBfZcPIg+g7vd98fqRDC
	8Q7dlkgOnINNbWaMGsvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmOg-00000006crh-28FV;
	Mon, 20 Jul 2026 11:42:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlmOe-00000006cr4-0HF2
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 11:42:57 +0000
Date: Mon, 20 Jul 2026 13:42:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784547772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jk114a1g+4q1WXv0C3HZQ6mBPvSfPI2+Niy4nHeffE=;
	b=qPBdz9sZIndzWOfA3lTL5/ACixAeoswx0TfKQgjyxxOzgTib7KPw/cSZBNP++7zDgj4BL4
	XyCQtphWHQKKYC/7sr2QZaSVbKgyeZoAMrnqtpQq+b8dZXl9Wo7XuuMmWHgWKxMWxb1RB5
	mSj1J5K3HdyXHU0qCN7YkVu3jzfKCz0qPYw068u0NldWc/+l42I0i2J+46p7oiMIw6f2IA
	BfoQqM+UgQuWPbIDwpgyvsTroz/M7ZFM8gARrE61nx6D5Y+S2WQPz5gfDKo3uyhzCgn6QG
	NXx1wPA69w/vSHwS25NKbRlzEx3PKKjAsPdpXaGqTK8kPREj21Q90ATxP0Lpmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784547772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jk114a1g+4q1WXv0C3HZQ6mBPvSfPI2+Niy4nHeffE=;
	b=WaTlXFhXlM3SuyQn3WAMKqZ4oFwdfnY0BjWuLU0N1nX7q4C0T1kbARdG/Hqj+DmxcoFGRl
	8EmMT7AfRisgMpBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3 5/5] riscv: vdso: Implement
 __vdso_futex_robust_try_unlock()
Message-ID: <20260720134032-032dc788-414c-4d7e-b72b-57fa5311adc8@linutronix.de>
References: <cover.1784274927.git.namcao@linutronix.de>
 <b3447fdd87cdd607b685940a1801b841066337fa.1784274927.git.namcao@linutronix.de>
 <20260717142423-c5be3c7c-d4cb-4a68-8e85-3e3754e42666@linutronix.de>
 <87ldb5evs8.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87ldb5evs8.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_044256_246567_1222420E 
X-CRM114-Status: GOOD (  13.69  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 20, 2026 at 01:37:59PM +0200, Nam Cao wrote:
> Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de> writes:
> > Can it ever happen that the toolchain has differing zacas support betwe=
en
> > 32-bit and 64-bit? Then cpu_supports_zacas() may not be sufficient.
> =

> No idea. Probably not.
> =

> But if it does differ, we will get a clear compile-time error message
> (unrecognized instruction or something like that). We can worry about it =
then.

I don't think we would get such an error currently.
The cc-option check in the Makefile will fall back to non-zacas for the
compat vDSO, but arch_futex_robust_unlock_get_pop() will treat it as zacas.


> > If it is guaranteed to be in sync I would prefer to reuse
> > CONFIG_TOOLCHAIN_HAS_ZACAS instead of the cc-option check in the Makefi=
le
> > to make that clear and error out early if it should ever change.
> =

> I intend to apply Vivian's .option suggestion. That won't be required the=
n.

Ok. I don't understand the .option suggestion :-)

(...)


Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
