Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3D9CD5BD0
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 10:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+j731PKmhntQs4cQv5ud9oFZ2OBkhsR9ALAuShS/dZU=; b=Gn0tECpXntzwxr
	dyw3xgGXuMsLJMzABktYXQs/q+jupTHOWNhvDYcfJ6Q/6IWXIWgj76tu01zas5tu9SsSBlK7M0mmo
	Ld/keTIIXVO3t09ZVMK2HV1ga+d3LAn+cQ+/LFqZlbFizhUZ+2/xMbHXFJNpQnQ+fz3d19QSx8907
	WkHkuurt3s4krCgy7i3EBhl8TSXKRlZZnF6VCDlKy90BYlNXYxcmerGMGitaTTkmTYJkUf6a85KSG
	WuIsio6vL/l3LWc2zXIAg929Z7Pw18cxWo62Ks56pnmLpqhFmJm1UwpBXKMrbJKE+FvkkEO4chDW9
	U04hVPLtcbNcl4r+1bMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTH8R-00000008e2K-2VDR;
	Sat, 30 May 2026 10:41:43 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTH8J-00000008e1X-3zNo
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 10:41:43 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gSGws0fwFz9tpD;
	Sat, 30 May 2026 12:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780137677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8rLJAHarAeoUMg59HygnNpa2WBuECEEdnuMIXACLS/w=;
	b=H0TpCUQpQ+Dr9Pvt+Ml8uhSOYfjX7mn/HBGzH+0yuyngapzV0xhIUrnYMAJdEkZKOPmlE6
	6bPrr74+kesJtiZhnCMR2utspDjmRTh0V+y5YUqlFI1v2Oao5U1EtfdABClzF15QtEJk1H
	gxs1yT4k1HqDfsZcZ5LF3UFqCT1yqPl0ZC1UssqQDoF3k+s/I20VrYyJ/NkIzAchOlA9Km
	+BHM0PmW/A4hu4H2wR5TS8zwNjY9QHaO6MUIZ5rSR7u6TxQzHjKTYedyOPfyNtpGWBOQR1
	aZiJ4vizjDVX1Ne/E9/IYcBGGe3xJzw3AnG3KrksPAaN8YGjmRcmZRr1ZX+vww==
Message-ID: <47062326dcf87b605cf4def9835394551645caa5.camel@mailbox.org>
Subject: Re: [PATCH RESEND] pwm: th1520: Remove requirement for
 mul_u64_u64_div_u64_roundup
From: Maurice Hieronymus <mhi@mailbox.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini	
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <ukleinek@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng	
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Date: Sat, 30 May 2026 12:41:08 +0200
In-Reply-To: <58245ce0-7271-4b07-b866-0037ff68d92c@samsung.com>
References: <CGME20260525131112eucas1p1d7e4836f71c81686e1f71e4007e344ec@eucas1p1.samsung.com>
		<20260525-pwm-th1520-fix-v1-1-814e537c6812@mailbox.org>
		<8857fc45-b787-4661-b27b-8976e655f7c9@samsung.com>
		<1f550af5b8d1fa2aaa9936d5b0010c156e0cb455.camel@mailbox.org>
	 <58245ce0-7271-4b07-b866-0037ff68d92c@samsung.com>
MIME-Version: 1.0
X-MBO-RS-META: w7y49kc766z4x146mxmm6op3a9e9kqhq
X-MBO-RS-ID: 66b95ce410648b2b261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_034141_710092_2D19D09E 
X-CRM114-Status: GOOD (  12.88  )
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

> 
> Apologies, I have to correct my statement from before after
> discussing
No worries!
> with Uwe. The reason the macro was used in the mentioned driver is
> NOT
> that PWM controllers have 64-bit registers - Uwe isn't aware of that
> being a real pattern either, and I was inferring it from the code
> rather
> than from hardware reality. The actual reason the macros get used
> isn't
> unified across drivers and we should pin that down separately rather
> than block your patch on it.
> 
> So please hold off on the Rust helper for now - your initial patch
> might
> be the right direction.
> 
Is there any further conclusion which direction is right? Can we merge
my patch, does it need some change or are we going down the road with
the Rust helpers?

Thanks!

Maurice
> > 
> > Maurice
> > 
> 
> Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
