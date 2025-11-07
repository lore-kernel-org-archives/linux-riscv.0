Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B287CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vylf93MXJ+ehJJ4Lr8CB1nYJlX+0ZcDbZzTdnVrcfq0=; b=Hj0okubryaSKdV
	dZ7GTehg5p06QWjTnBSRRL9n+N/gaFbXSs0OoWU+7KGuQEjolVJfDtxDPXevlWeea7K+IcS3niHvx
	lKxGRcRG7csC/FKQZ56R8NCHLJUBQoVyl3BGfmXMi6Ir8VYUMYWjCkX2o8EH0Cz8TpsCiGjcM/R7B
	S8nGcxH78cA89wkse7E/dphsLo/Ly9xWByWifq9VdYGgJqXUe2NogDoEfxyDFzpVI5WWQB4F167SP
	eIzBv2kIokyjralvwHVjPsCrRW23fjIZD/ex1c5CXxt9PkaG7sidhB/L/EnnhauhAqw80hC1xFluJ
	IxYt2zGzt9hHPooULKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRyJ-00000000gto-2U9q;
	Fri, 07 Nov 2025 19:18:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRyH-00000000gsp-31Ft
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Nov 2025 19:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=; b=D9tSwbNqxvZqsRO+aOEKeGYGQv
	sMhvaaMmXAWgIxXmizQfj4od/0JoD73V1wEzgYm9bgOGpcMqh5vNxghd41N360JEbWr7PLFTPnWg0
	3baFpJYWoHe1isZoGS5vFWaYlsEXuzL1kJOyHeNeJVUCzcA/Ns2gBybH32K0zsWppID7uZMtt4AcY
	01Pxk/cSACJc4jPG7Is7vbb2id9Z1UvM/awg0qGEXUZlK7WnkGUyKrQzy2hJ+D/lAKmY94EMBBcHo
	A8FfgJ0Qq/cpXSEnnfSz73+8pi1J/EWfI9pv6xJrIOEvKilHr8mS4MPpyeWiGQE0nw6LekpO7C3O3
	vxdkOm5A==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHR6W-000000073cX-1fFF
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 18:22:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-471b80b994bso12138475e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 11:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762543079; x=1763147879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=;
        b=KSB8hF3oBKjuoFgcYj0nTEdhuWMbRn6xNgXkLXHyGHpPF/kdbeR8QgrP55NKSM7xTe
         Fah8sDxHI8HzL30E0qiWqaBWp+Tu91wflnrqAC563QCqltWJB255BACpU8zhIObqLjei
         ZwvtuiJuvhnU/14ONNoRGdu0fr40JBUSZKZu/HBXh+zc9ar5XJMO9z6fEqN7E3IJM+KV
         aGCHTXjw37eSiwHfd1NqeQ/UpqIuWunaajTxww8lfwqRY+7mLoe534OWITcvHlpbaI9f
         cW9t7Fn3l9nTHNmYgoacenDKkJHbr8o8tA1Q9E/ri87QBpDjeZuspw8o4NsQnLzc3Hih
         azRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762543079; x=1763147879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=;
        b=dmq85x4Y93QPkXwcUE7dpcFWD/ChHbEVdaHG5BPM+E1vw4xPh29aXlHYKLEOVMkt0z
         fItgQ9kJkbMKhFh2b505y+baLuYfJ1ST0p4VoQXxVXtZYVi/4tTlbbIZ6+lixzAmCPCA
         OpvrfcKPtCW3U52Vorm6nELlJh0MwBhePVfNT+SqL8IlhPPeJNm6OlmrQeHtiaG8kiDP
         F5KoX0oylWycW0Xhb8IG+rjreIVkvYAMUo0VDC6LOqZC6zkqKTkH7nLqIHsz9yBA5sCZ
         u80pUQfZdx0u0iJIBrf3qO8l63vysx9BQswrKwRu0sLTZjWYR8cY6uoI9hYIM7iX5oWr
         h8rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtdVBnJysx3XWy7ueWrJ7oQ4j2jpTdOjcOWpaKg2y9yorrc07LVLOAZ4k87KhbyeJKCISxYpCLvRmjZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+4tJ3D7duo75zF2vctZ3SU5/Ou6hrFD+PaJeq2Mxcxu4Wq+Q3
	UCkF5nCFGZYlu5bHqZxUJFHF24bKn6AGvb6WKm57Vq4sxMPMFMHJ19yj
X-Gm-Gg: ASbGnctoJNq1p2IJmnkfwHu9368Qy4jW+04wBHP2tFV6J4LV19vslvzSOPRenrnS7s7
	TsE3G/eNb5IyHnanTydJOua6sROBpynWEv/Qz0kJdfuiCiIamfWUhvHUTnNGZ674su6mXyvL+Le
	KMVi1bExJNG9brwWsoMa/mZPkCKkpz4lWFiMuHqGtA9YOAe3oa7mtNrQdQAXm3W3t14p3hav24F
	el1/MEVWxmP/W35A+JSmjx21WaCExnHol4eg+e+WLN7ID66H5jLE+G9ZPD83Q42ngLQAn/U0mDS
	zYngBxylNDAyOmZ6TnGn2hGnHtwVSn6RKNtQtr7ZvZ6Q/nSM64Ce8+CDMe7AK3Ay+XGuIRNFwPx
	A2ODhpl3/y9XcVXdgHQSsvrz8fzaawL0XhT+riQVWoYpj73jAFM6Bgs9qLm44vUoTGOozaMk8Yk
	2vEHO5yFh6ZVAo3v8c8zJVUpumFVGNYr8dIYS87JYDkNlSVVyF3xXJ
X-Google-Smtp-Source: AGHT+IGwWldiHMKs6o3o24t2zUapUEv2nDiVIW1qgftMpp+s7M3k154xFpb/vMUGopieuIUWMdpZmw==
X-Received: by 2002:a05:600c:45c7:b0:477:55b6:cdd6 with SMTP id 5b1f17b1804b1-4777322f0a4mr1228445e9.10.1762543078570;
        Fri, 07 Nov 2025 11:17:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b23csm6811350f8f.10.2025.11.07.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:17:58 -0800 (PST)
Date: Fri, 7 Nov 2025 19:17:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 07/12] uaccess: Provide scoped user access regions
Message-ID: <20251107191753.7433d2dc@pumpkin>
In-Reply-To: <20251027083745.546420421@linutronix.de>
References: <20251027083700.573016505@linutronix.de>
	<20251027083745.546420421@linutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_182232_587424_1CF468B9 
X-CRM114-Status: GOOD (  16.54  )
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

On Mon, 27 Oct 2025 09:43:55 +0100 (CET)
Thomas Gleixner <tglx@linutronix.de> wrote:

> User space access regions are tedious and require similar code patterns all
> over the place:
...
> There have been issues with using the wrong user_*_access_end() variant in
> the error path and other typical Copy&Pasta problems, e.g. using the wrong
> fault label in the user accessor which ends up using the wrong accesss end
> variant. 
> 
> These patterns beg for scopes with automatic cleanup. The resulting outcome
> is:
>     	scoped_user_read_access(from, Efault)
> 		unsafe_get_user(val, from, Efault);
> 	return 0;
>   Efault:
> 	return -EFAULT;
> 
> The scope guarantees the proper cleanup for the access mode is invoked both
> in the success and the failure (fault) path.
> 
...

The code doesn't work if the 'from' (above) is 'const foo __user *from'.
Due to assigning away constness.

The changes below fix the build, I suspect the code is then correct.

...
> +/* Define RW variant so the below _mode macro expansion works */
> +#define masked_user_rw_access_begin(u)	masked_user_access_begin(u)
> +#define user_rw_access_begin(u, s)	user_access_begin(u, s)
> +#define user_rw_access_end()		user_access_end()
> +
> +/* Scoped user access */
> +#define USER_ACCESS_GUARD(_mode)				\

#define USER_ACCESS_GUARD(_mode, void)
(but change all the void below to a different name...)

> +static __always_inline void __user *				\
> +class_user_##_mode##_begin(void __user *ptr)			\
> +{								\
> +	return ptr;						\
> +}								\
> +								\
> +static __always_inline void					\
> +class_user_##_mode##_end(void __user *ptr)			\
> +{								\
> +	user_##_mode##_access_end();				\
> +}								\
> +								\
> +DEFINE_CLASS(user_ ##_mode## _access, void __user *,		\
> +	     class_user_##_mode##_end(_T),			\
> +	     class_user_##_mode##_begin(ptr), void __user *ptr)	\
> +								\
> +static __always_inline class_user_##_mode##_access_t		\
> +class_user_##_mode##_access_ptr(void __user *scope)		\
> +{								\
> +	return scope;						\
> +}
> +
> +USER_ACCESS_GUARD(read)
> +USER_ACCESS_GUARD(write)
> +USER_ACCESS_GUARD(rw)

USER_ACCESS_GUARD(read, const void)
USER_ACCESS_GUARD(write, void)
USER_ACCESS_GUARD(rw, void)

> +#undef USER_ACCESS_GUARD
...
> +#define __scoped_user_access(mode, uptr, size, elbl)					\
> +for (bool done = false; !done; done = true)						\
> +	for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \

	for (typeof(uptr) _tmpptr = ...

> +	     !done; done = true)							\
> +		for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)	\
> +			/* Force modified pointer usage within the scope */		\
> +			for (const typeof(uptr) uptr = _tmpptr; !done; done = true)
> +

	David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
