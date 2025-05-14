Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9981C3ABD9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avmixTAjM2W77jMJoiUqTgpIVS1D0yrmsK4JKBE++So=; b=Ml1pa4rbfkOkOJ
	Cz+MpWG7Mk8RizQvaSpOca82elQWJuDecGb+IYJe5X4VT47LAf7YQbMTpDRUwtFHgiVwXWKrw6ya4
	eP5PSSWiySLQKMaJuRHceRNUcZtMNjbmh7b/wM55gfNH6MLCryFQOF/f1QxpjEfgv6R9K7/sPSZNU
	87e1F50K+U67QTEG9qmC5x8mUmWmuRuR4QtMsucmYfrPsgTe8ym5IORlBkzuazsqSkQs0H3cqtbUm
	KUQUu+rrsMvgH0Q9p94jBr9ZIiRl4ncjzCtyK74tmv40PSpcVAaW1OE7NfvHywFEfUuhPKt9eZrHg
	z1PsV8xIkdGIWk05EKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFB5i-0000000F3Sz-1EXi;
	Wed, 14 May 2025 12:20:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8vZ-0000000EkNe-03IJ
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 10:01:30 +0000
Date: Wed, 14 May 2025 12:01:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747216886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yjJ8VTCfJF3mh532Vvi9mnXCuXqEe7OAhye5pR0w08=;
	b=JJyTD8Ao92BZRcVKabvPvKBtz2HtA8d6TJiDDphuBIRYm0oVVhxATBhDhml5NQ3syJkx66
	y9LfcfFOkp+UeB+hGUtsIuEPKF4RBbRS4R/Tz+7KBT6f/ZZzHQ163W6gFv3p1QXuGZSm8/
	xtXGLCS260+bzl5TRVv+BOis2k1yydT1LXp5yIemUeJtAKS83Sou9m3KJqINZu6Kep29b1
	I+2kKwdHMmNxrU2ZTR/RAgtEPHtmmajjOT2ZcouWetnUp2JDMXmJqovgZqjn1WvU0D1nMe
	IvOmLgKRDoAI7USdoxYpL+hwNYAxRPAP7ZmPXdksDqPtlo5Jy766u354twljuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747216886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yjJ8VTCfJF3mh532Vvi9mnXCuXqEe7OAhye5pR0w08=;
	b=Yw/VqjqAIPadN0tqNqnAHVHf1OReRfhru2LMX6IT+9ugZFxd3qRL3vHDy94d5Tiw6qMhgy
	8HbdjDtJPy0HVmAA==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
Message-ID: <20250514100125.KjX0gdp9@linutronix.de>
References: <20250513151631.3520793-1-namcao@linutronix.de>
 <b6df6923-1028-4a6e-8cf4-e10e8fd55475@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6df6923-1028-4a6e-8cf4-e10e8fd55475@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_030129_187124_956BB25E 
X-CRM114-Status: UNSURE (   9.56  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 14, 2025 at 10:22:03AM +0200, Alexandre Ghiti wrote:
> On 13/05/2025 17:16, Nam Cao wrote:
> > +	for (i =3D 0; i < num_kprobe; ++i) {
> > +		kp[i].addr =3D test_kprobes_addresses[i];
> > +		kp[i].pre_handler =3D kprobe_dummy_handler;
> > +		KUNIT_EXPECT_EQ(test, 0, register_kprobe(&kp[i]));
> =

> =

> Will kp be freed if the test fails?

Yes. Unlike KUNIT_ASSERT_EQ() which terminates the test, KUNIT_EXPECT_EQ()
still lets the test continues.

> Thanks for adding new tests, KUnit tests do not run yet in the CI but I'll
> add them soon!

Well I promised Bj=F6rn this test back in 2023 ;) But I wasn't sure how to
implement it (I was still a student at that time) and then got busy with
other stuffs. But I guess better late than never.

Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
