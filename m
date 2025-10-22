Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C056CCD1AB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Oct 2025 15:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyHC+g1++9r6M8NobhtRJOA5JGfhN1nijItrLjQU17c=; b=1nmNIUKVsAKmVP
	H52HAOcgQzT0dFikD15zPeIK1VPkWAs4vapxxx6AVC63a2Rs817CNdhkkTtdUuAXlfV0xezILk1bo
	OA2L176s7jU9s00GzclOIOVkkkxOFCi7m/rHAuF5LGlVx9lLZvTVV9zaRjJbqCPbTl2NkeFLQtww2
	1BWEZ905yDJkT9MBlbH8nu8p+W6uREoce/9soeT2gJIC5DmyOm6SPYK6qfYUDNV7lHpHn/TDqbrQg
	ENqfD4v4cz2weBZNlNt4IyyewnWCnAqs86xAESDdleHM0YC/xpIxUci4613EZ5Bi3iZh6O1asNSsb
	gXXxrhmcKPB3vn5oOVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBag1-00000003NT1-2vGJ;
	Wed, 22 Oct 2025 15:23:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBafw-00000003NRM-32jr
	for linux-riscv@lists.infradead.org;
	Wed, 22 Oct 2025 15:22:58 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b4aed12cea3so1162523866b.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761146575; x=1761751375; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8Ks3283lFKT/3or/kKLaFk/rSeUKOKq+L7qyJbrS/M=;
        b=AVNGbhXMRVN7mS/QsnicTVgUAnIwh+J7TwGJVgPZhwSfnPRtQqBShx0LucxdzVKKYZ
         K/V/6JGc9ZAPIDD1ufO8rE56n4HWnb39z2IUgFAKs2ENYFBJ+EjKfWRjOXaaO4rCTBOj
         SQILCfpFi6jlAvyBptx4Dzhaui6JOzKCOwteE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146575; x=1761751375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8Ks3283lFKT/3or/kKLaFk/rSeUKOKq+L7qyJbrS/M=;
        b=VOst5JroDTL7MP1j8RGhrMMMabkcAsaWOTOBTQYop2GFGHBbwEeExgDnOhL/I6Kp8t
         +ASwY/ruQ2zJzjR400iwkS53Bot+DvUwlvjf/RLQDMCNozRMGwlr3Dise48x/fyHgB5Y
         WAWkZsjkF0sYOBqn1jSclBGeVbpI86aOSfAfUIx1k4+NrxYf8kKKcuLp3PbGKzvbgWv0
         KOQ77YGuxgVQuB7AamP97lfiaj81oQ6JTEOqZSHWQfMPbPgRKH8gsU4CZRTmakQ8Lu+Y
         /CNZ6NoHLaWmFxoLmg5eNVHAjlByzlnjnfFqbK45AG1kjAcvdI5Sztk2Ef4YntkeUEdB
         tb4A==
X-Forwarded-Encrypted: i=1; AJvYcCV/c9nwAZocpDZwxg80y0O0reNQGlk4ILQs3pLEqVHTvfynRMCWp42xFQmGICn7snKQp++k46MXZxRpWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZF+R60iT37DbFox0pCCJ2v7roOQ5Sfync2I4E+7hGh61EDtyq
	0JP1sl89/LK47Qnao6kx0/TMaOWZCI/AV5IkrQe9fbF5dZ3Cp6kUSgtk4QRuy+2ZCpix+dawbrr
	ifPSS9fM=
X-Gm-Gg: ASbGnctQUjGZv4EbFwGnXokabetkb1Wy0CmBFydChMOyOH6wDX51xj/TNh/TVMaOjl3
	OBsCjthDepTPj5p4NKl8RyTt+5DUvBlhBQwnNwrQC5CXxmWLNRv+4ARjJspOt1P3BtOjLaphDgm
	w2bRg8P2Q4QzR1aWnGxVp8TtY8RYV7oZyhVQyoAQpB6LGhqMqctZ2fXqIqE+4VvE/OaiYMByDgL
	Esszg1Vh0X2dvMCb7+slYKH0FJwP2cRWItwtc8sBYQ9cI80Xt/xiTgtxPUM5jY6w+5Ouhy+V/qW
	7ytpWwEePqaNK56mKInw7vK1F5jylXN/GgDA+zd/0LgDTkDl/hhaMd5BO5TpTbZIC1RHaud0Y9d
	3hR3NsX3HBcZleOnbP03DAv/KuPHoTWU6y8Bp4HFXy0OdrJdpjGBo7DXp/GWrrOPDg8dmx35aRz
	ywgV+nykC9v/il61MryUO/vwY08/0BfeY1nOkmzsLFMyyRjx1lCA==
X-Google-Smtp-Source: AGHT+IGub2SZuMDr32Vc658UJItdcyqnN8DDtG8Eh91Pl1MhwvmQWto5Bs2hbHRyYoV8CZSyaTGzMg==
X-Received: by 2002:a05:6402:3492:b0:633:8787:6052 with SMTP id 4fb4d7f45d1cf-63c1f6b0b6emr20468156a12.21.1761146574681;
        Wed, 22 Oct 2025 08:22:54 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab560esm12092090a12.12.2025.10.22.08.22.54
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:22:54 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c1a0d6315so12685698a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Oct 2025 08:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwZn+4KwJiees+ekWlYUJ4OQ8IKEAa70yqkarvkNH6G0Ji5EOhlVQJI8eDHSo9CNomgXa8464Socxa2g==@lists.infradead.org
X-Received: by 2002:a17:906:c144:b0:b04:48b5:6e8a with SMTP id
 a640c23a62f3a-b6472d5d715mr2448051866b.7.1761146216891; Wed, 22 Oct 2025
 08:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251022102427.400699796@linutronix.de> <20251022103112.478876605@linutronix.de>
In-Reply-To: <20251022103112.478876605@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 Oct 2025 05:16:40 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
X-Gm-Features: AS18NWAqLsXEY6bsEV3yJ0KWUZmBC6kMtZXzbsnMf3ubAyGEsrR55YgMKptZqjM
Message-ID: <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	David Laight <david.laight.linux@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_082257_341787_2F4C3246 
X-CRM114-Status: GOOD (  13.44  )
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

On Wed, 22 Oct 2025 at 02:49, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> From: Thomas Gleixner <tglx@linutronix.de>
>
> Replace the open coded implementation with the new get/put_user_scoped()
> helpers.

Well, "scoped" here makes no sense in the name, since it isn't scoped
in any way, it just uses the scoped helpers.

I also wonder if we should just get rid of the futex_get/put_value()
macros entirely. I did those masked user access things them long ago
because that code used "__get_user()" and "__put_user()", and I was
removing those helpers and making it match the pattern elsewhere, but
I do wonder if there is any advantage left to them all.

On x86, just using "get_user()" and "put_user()" should work fine now.
Yes, they check the address, but these days *those* helpers use that
masked user address trick too, so there is no real cost to it.

The only cost would be the out-of-line function call, I think. Maybe
that is a sufficiently big cost here.

             Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
