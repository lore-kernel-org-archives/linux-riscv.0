Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E246C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3eo/4keDPxq7LASgpUQH+812/0RwXGxsuCDlYZZrQo=; b=Ip7lwx4Oi6c1Ib
	LwUZKJq+roKe+Zi09yCQXyqqUB4NYgjpseBHsVleWsM9XfPgWMvv2KwQ09Xm7QFNuxHIxqk9CDACW
	5O26BCPnzcVPhL57O8vYAEIjsBcNyVuY9LG9VuS8ql7ylhbPzgOsR1HTobrJjTF/nBmNYoczJo3/3
	hRsK4JCH+LjLW+OgJOefKuhnwCsfIuOQ09rR8D5qxwF91QI+M6rTieieQ6qT8JcQxgUxMNeWWMqiJ
	914+SV246W4buYtWITDsBdsVbImLTV2vEQRBTNY7l34ViYZcwagE26vbn15BuiMKVcEAq8hePXiM0
	mCNGn7JK97Lv0AI3x7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaRe-00000006VLY-0SVq;
	Fri, 03 Jul 2026 09:44:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaRb-00000006VKr-3F0t
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 09:44:25 +0000
Date: Fri, 3 Jul 2026 11:44:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783071859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vbkc8C6vPfuFCPiBlHwfq26ZgkZnTR7YZfJ6x+U6dgw=;
	b=3wx+GZN3lUFtMi+zC9r4PUHex2Hrj5bj/px96NRFCJxYeFrkRhdZG9a3JlWoIIwuWfBB83
	NpUbJBYKtbr4ddLbrNs4614/5mxWlN05qbtSQd6qkg4lSMTrgqGvwZmIHZsaP1toX3NAek
	3QTdMQwVqxC5axCIplVnugf8z8LiXafTIE4g36P2y7qPSIWuErov/HgzcSaUrr72jtDC7s
	fxKwEfoe0OmdhQWbw6qxKWo1xYy6m6CfkjRgZTFRW0/ka6CXtzjYQb58xn2gTZ4k844eGN
	vOYXyPHHNEgyt1STYuuxIFlmwOVqk9dndhYl0jB/QpI5kA1XMlU5IAlDsqPTAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783071859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vbkc8C6vPfuFCPiBlHwfq26ZgkZnTR7YZfJ6x+U6dgw=;
	b=whrD/IxmYah58ALJenVjpQsAGHKeODZYizVPDeOc6rM12TMi1TbQNAexWnah0bkE32iMFF
	08t3rz9pX05lChAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Leon Hwang <leon.hwang@linux.dev>
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Message-ID: <20260703114128-2a7a4723-0060-436b-99d9-7499bd90fa82@linutronix.de>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703022507.187457-1-leon.hwang@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_024423_973059_FA61C3CD 
X-CRM114-Status: UNSURE (   7.12  )
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jann Horn <jannh@google.com>, Nathan Chancellor <nathan@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Pedro Falcato <pfalcato@suse.de>, Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <liam@infradead.org>, Nicolas Schier <nsc@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
(...)

>    The following architectures currently support this feature: x86-64, arm64,
> -  loongarch and s390.
> +  loongarch, riscv, and s390.

For per-architecture feature documentation we also have
Documentation/features/. Maybe move it there.

>  
>    WARNING: This feature breaks programs which rely on relocating
>    or unmapping system mappings. Known broken software at the time

(...)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
