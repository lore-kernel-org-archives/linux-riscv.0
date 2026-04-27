Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AAFFF8864
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 21:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oarIJsQ1Q9uOgHT2SenCYw8j4H8qbOfbNrg7PVfOzWE=; b=V8e3lJQORAldQY
	mi6VxsB8ecN9MdpzEPjML3nMebBLmsh/Bwh5OL0sbBR6N74g5cNE+bBIn4Jx6aHpHd2r6pcTZHDyH
	T9zlP5crZHyX3yjWGHcSLDiWt9of/T8w+DgffC3Un8poNbdJywRaq62XPkrSlwFZJasUaKrQnVEbR
	o2exGLvzbhtWX5scW9zbccTHvQ6urFZIrh3KaYQf6BZjusqnIKv47gnw/vnlE7c8s8kJhWm5LKhij
	PzBkUbe3BfRFOhVouCaZFlcRqJ32j+UUSRmzf0tfRaXPuffVVfylsA1pZk/IW2Hb+QVS1EWZ9qsGr
	NrB9H1r5ayIluAAsZtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTsT-00000000Cf8-0j5W;
	Mon, 27 Apr 2026 21:52:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTsQ-00000000Cdz-3cU4
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 21:52:27 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-676e62faf2bso10752292a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 14:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777326745; x=1777931545; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=GOM8EiQLVLSsajGMDI5SFbllZyby1ojGIV2wfNTziZ5wZz8WuO7MM8TsT4j7IK7l6v
         oPlVJbSscZUPvVBQ0FhmoKX9YxcMk4QFfjfBeXRv1ltLl3WriRnkvsYTv4h3JtJEC58C
         bAGJ+RbSDJAsESJ5Or8juK5O4nH+VYq/W3i9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777326745; x=1777931545;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eodThUBj1SnOvacXe/3ftYxEWQMFbYqc4B0FCa9Alx4=;
        b=p5Ec0b7pPiQrgNAEkDgIqLm+UnbKb1YwA6F+C34zgyyxE4ku1bgVjU4E0K1zOPS6t0
         y9w8uaky+QKY/byb8HfvZvXh+p8ZwQmu8eWVvw0IiIsQgEBri4p5UDtq9YAzmcHQ+JoI
         ZnHdhx3KRdEWvQhgLJAngzq5E3rPreXmXMcG76Ih5qYuzA0LfiUIoKCqidqI5vu4Fz/c
         aVw18pUlY0cIuIYRNL5DULRw5t3CBQYbbsJZANsus28/w9/UviMLSquz98Bxa5KW21T1
         8IG3dzp+dinrBy9OXGVW2ExHszWt+ZVJQN/QYJHeMg9hiatnPXFJ0bWnk60p9Z4VHNDk
         lMtw==
X-Forwarded-Encrypted: i=1; AFNElJ9j4PgMarWoTNXNkqrGMuAYC0nFphuF7vO0OaWy2WFpS2OnAoFbsWnenfYfjxWTeh+ce9Kah4v1e5kuZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdPDw5LFaNCTaaGo1frpxatLn5agV3CfOgRRj9Iptg5XSPc0O2
	uC1A+WV1trBWJPjQGJsVQdsigEVmgV4CSSG+2apvLqKUdBgVWRj2UlvGTx+WllyJnQCE1Vom5Oc
	DhOGHxkhm3w==
X-Gm-Gg: AeBDietBZ4O2tcdGP9hztdCzu8LCYiHZp0e5Up6U1sPK2m4iB1Vg3WDYNiMOg+7jmmN
	Bx08UqOi8ozvHa3IZKH5T2Pe+/lIWwfk8QmMlBD3RDZpNoYU2c601E9GB9R+VP3aigSFmUEMQpW
	3Pn7RUwFFO1R3XYvwqJIzRACbNYJfV89c3x7Er633mf5QJmIwYRCoDllDN4JB/b5HGgGM7+ydxz
	Hpu2w6Yba8O+HQBFVinrk4fR1kFhXJwnqkz4duRQZMir4Fu+RjpTWGqnNhfD6hDKp+j8EBWD74d
	uzPmNzTTYgwEUtIpMj1cX9ck9d/Iw8cy/2QZ7MohB/JUkYg6JN0x6vpC+Yak7sL7FCMYSynnIqv
	/CHmqd6Oa2e83U92+TiL15xk+PmlYcee4pueAaFs8UNuxvL5s4fBYJK48VvjAcK3qb5MQQbtxAQ
	icRosG9JN7Pod2udH02CcRkQ34SIlO6KG9tQ8KQKTf/4iJC7ERyLcOnj4AfUaggf2k5YQ4TvmMl
	wz7PjiBbWw=
X-Received: by 2002:a05:6402:2404:b0:670:4445:c326 with SMTP id 4fb4d7f45d1cf-679bb056675mr156427a12.7.1777326744866;
        Mon, 27 Apr 2026 14:52:24 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b68524cdsm151591a12.21.2026.04.27.14.52.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 14:52:23 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-676e62faf2bso10752233a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 14:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9GKrSrhbdHQB/hBHXEItYFeJlT9z3REuR0ZWjCKeAPSjSQxW6dNM5vnkopEAvF+7hEYJgOlQeiC8fzxg==@lists.infradead.org
X-Received: by 2002:a05:6402:35c2:b0:677:270f:6f4b with SMTP id
 4fb4d7f45d1cf-679bb04a8a7mr185115a12.1.1777326742385; Mon, 27 Apr 2026
 14:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <0ee46bb228d97163fbdc14f2a7c52b93d8bc34ce.1777306795.git.chleroy@kernel.org>
 <ae-j2_QirCySZD02@yury> <63a4d0f6-0eb3-48cd-9f98-bf7b223b2606@kernel.org> <ae-2yLWSGnfeTvh1@yury>
In-Reply-To: <ae-2yLWSGnfeTvh1@yury>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:52:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
X-Gm-Features: AVHnY4LQUFWo9ODz4M3q2vZC9Gn8nsdYr95Nd4ky5ERVHHxIyN_9ZXY5zjebfdc
Message-ID: <CAHk-=wgPrLy0FR3sEWBYQuNAac1axDASYMnTuPuxEU0WytzL7w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 7/9] x86: Add unsafe_copy_from_user()
To: Yury Norov <ynorov@nvidia.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	linux-wpan@vger.kernel.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, bpf@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145226_911016_0821446E 
X-CRM114-Status: GOOD (  10.48  )
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

On Mon, 27 Apr 2026 at 12:19, Yury Norov <ynorov@nvidia.com> wrote:
>
> This is what Linus said when added x86 implementation for copy_from_user()
> in c512c69187197:

Note that some things have happily changed in the six+ years since...

>   That's partly because we have no current users of it, but also partly
>   because the copy_from_user() case is slightly different and cannot
>   efficiently be implemented in terms of a unsafe_get_user() loop (because
>   gcc can't do asm goto with outputs).

now everybody can do asm goto with outputs.

Yes, it's disabled on older versions, so it's not *always* available,
but all modern versions do it. And if you care about performance, you
won't be using an old compiler.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
