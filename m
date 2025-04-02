Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB69C3601A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Apr 2025 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCTe4V3VIikSJy/BigAe3n6im3dd6nnZLhjL9kEUwpA=; b=vLYXs+n1bBx2nB
	Idvi5tF0DndjWtf0eEBj0MPlCoAm26vA8ylywpPxwICUPRBT7GZ1BCLPYZIaKWgALMEx+Rcg1LK84
	onpUKw61yJLQEaqxFQsBjnfGZNfLhXOZdcWbIe+Q68FCa057MZxuCNWa+QQgQ6/oSjtrf08QfAEDL
	JboaRaOqUWpEqmhGeN0V56yFQtlu8k/6qa7jffDxxKQ3S/BbwqACz997aDrzdsX0C8KqNKirc+i4S
	TaxRpMfiO7LHbaCxaE4k5TmyDMsZu+F/xaK8linfUB6sVuAiYF1CrAZB+IHq6LDnHfWrKrAlp5Clx
	bVJ6DZhv/b3STCimDpTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzssb-00000005REF-2Xwy;
	Wed, 02 Apr 2025 07:51:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsnJ-00000005QMU-275I;
	Wed, 02 Apr 2025 07:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uIzWjvfJbyS7n54sJ+5shgly3p7L+Bq4hAOWNvm3+QQ=; b=K19W1GmQJKHEi4CglJlEuX8NWi
	LthI2Z1LT4kdChvQwI3VZxL8k5hQ8dfV9NdzrOUMMX5Pj6OAhhEMS8GDkCXS2YpBQcPOH/Ls8WWAg
	vt0plzI5MTrstT6vVlp7xwsZ0RSoiIMGP/bQXVfBeMRFvz9Ykq9JPtPXarpYwYT/LMNYgK0a0CjKi
	kJJEWZJJLww9Gks/HsTl8JvWnlqFdUJ6xwagZ6hon/A/xb2B/diil2B0kL2IZ7+7EZgbibHMjzb7w
	/qUr5UiptHJqHeN9jIzxomcDYiKG84dHAl9weULxWpIBCV33DZruujj7uy0w4xbjRcWo4+Gbycyy+
	hIRGELoQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsnH-00000006zJG-0AVp;
	Wed, 02 Apr 2025 07:45:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 95EEB30049D; Wed,  2 Apr 2025 09:45:50 +0200 (CEST)
Date: Wed, 2 Apr 2025 09:45:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Alessandro Carminati <acarmina@redhat.com>,
	linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v4 06/14] x86: Add support for suppressing warning
 backtraces
Message-ID: <20250402074550.GQ5880@noisy.programming.kicks-ass.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-7-acarmina@redhat.com>
 <20250401170829.GO5880@noisy.programming.kicks-ass.net>
 <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddc7939f-fb98-43af-aed1-0bc0594ecc41@roeck-us.net>
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

On Tue, Apr 01, 2025 at 10:53:46AM -0700, Guenter Roeck wrote:

> > >   #define _BUG_FLAGS(ins, flags, extra)					\
> > >   do {									\
> > >   	asm_inline volatile("1:\t" ins "\n"				\
> > >   		     ".pushsection __bug_table,\"aw\"\n"		\
> > >   		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
> > >   		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
> > > -		     "\t.word %c1"        "\t# bug_entry::line\n"	\
> > > -		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
> > > -		     "\t.org 2b+%c3\n"					\
> > > +		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
> > > +		     "\t.word %c2"        "\t# bug_entry::line\n"	\
> > > +		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
> > > +		     "\t.org 2b+%c4\n"					\
> > >   		     ".popsection\n"					\
> > >   		     extra						\
> > > -		     : : "i" (__FILE__), "i" (__LINE__),		\
> > > +		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
> > >   			 "i" (flags),					\
> > >   			 "i" (sizeof(struct bug_entry)));		\
> > >   } while (0)

Also this, why do you need this extra function in the bug entry? Isn't
that trivial from the trap site itself? symbol information should be
able to get you the function from the trap ip.

None of this makes any sense.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
