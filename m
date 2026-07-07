Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43627C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqEzI0k+d7cP8C93gtRV96MpWXFKAfo/NUdYSePZwic=; b=fXj9bXgSWKORQt
	zUm+U2T63HvOoTzslHkCs9/GNb+Fgj1PpSgS+zoi3mNd+XZmRMUxqTErMqnG+WfP30i+yK+oqsKHX
	U6nRJZVZXGxzU3bHCzxBJzxViZtWTJbGLJXxrOt6smRUSht5nKzIPUyRho6d02AkQypkZXuhbhjK+
	5gmNke2mlZZ7qxIege4W2jYWy7LjTGkO342cTzoPvTC4vhxEbmi5Ua0QNIW10EEsZ1Xdm2DVMdy9n
	KixYKQcdhDIOpMaHWYL6yLVsgwBa+ZKULwdNejItAqIYZX/gJvWSYUnOC27CvrsrlwZ7ke3vZ/9Bs
	ftSWyRtA/y1WlaoUVYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh38m-0000000ElAm-0lsb;
	Tue, 07 Jul 2026 10:35:00 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh38i-0000000El9L-2bxb
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 10:34:59 +0000
Date: Tue, 7 Jul 2026 12:34:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783420492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUepwqSpsd3X623j785SSmasvMme6Isgo0g/WBHQGdk=;
	b=u0QPMqTIoolQHK+MWeg6Hrk1qDbvuyTiSAJV5QqXb9fIFpAwLV+/A6i3RY7y2Q5NOrNHPg
	WMCb4I48soFQQDP1uC+yYLwIE+q6bfqzEyUxvroJmO5zf5EQeuqY44UmPCqz0ktwJ5x8zb
	K/jR54x6T1+TkAKDPcpynJf63/x56iUcMSPQlxX+uoylxzMakYIx18Tel0PWacmjiFszd3
	bhaBj9f8SzF+PJycqTSCOsBYjfMxnJyZNkFusGcF5w9YjUvYsdt4XhmcejQFSoeHf6r9nC
	7kPpVdM9Rd1PD0EhWzc32TK/9x8m2VkZ1NTD+A6BTAL2llxbwwOtoTJ0lCv50w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783420492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KUepwqSpsd3X623j785SSmasvMme6Isgo0g/WBHQGdk=;
	b=wf+DLOqvEShc+UIpmPOFJHVZ1Hw8VyjhbipbDf8rX2KOzDJyaUndpQx2IJ8vRgUgaF+UCS
	kWzffhYNe0UiW6Aw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Leon Hwang <leon.hwang@linux.dev>
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
Message-ID: <20260707122827-2d6c18d3-8e02-4d9a-bb29-2ec46e759645@linutronix.de>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <20260703114128-2a7a4723-0060-436b-99d9-7499bd90fa82@linutronix.de>
 <b6f5f3b2-bf62-4b77-9c74-debbed9a4738@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6f5f3b2-bf62-4b77-9c74-debbed9a4738@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_033456_817537_B9AD8D7C 
X-CRM114-Status: GOOD (  13.19  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 03, 2026 at 11:09:55PM +0800, Leon Hwang wrote:
> On 2026/7/3 17:44, Thomas Wei=DFschuh wrote:
> > On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
> > (...)
> > =

> >>    The following architectures currently support this feature: x86-64,=
 arm64,
> >> -  loongarch and s390.
> >> +  loongarch, riscv, and s390.
> > =

> > For per-architecture feature documentation we also have
> > Documentation/features/. Maybe move it there.
> =

> Better to replace with a reference to the feature doc?
> =

> +  Refer to :doc:`features/core/mseal_sys_mappings/arch-support` for the
> +  support status of each architecture.

It should automatically show up here:
https://www.kernel.org/doc/html/latest/admin-guide/features.html

See also Documentation/sphinx/kernel_feat.py

So I don't think an explicit link is necessary.
But the maintainers might disagree.
In my opinion the link should then go to the rendered table entry.


Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
