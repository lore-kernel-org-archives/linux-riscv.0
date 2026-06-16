Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1FACD98D2
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1nPZHYPpbxuoCYlPy7zsm5gaDdrZRiG9EOAqQfHqxY=; b=05icAAafzEpIkg
	HXwo8/Zp25dhbHM/wQ4GIEuuT00EhrQdTpJeoHB9wFB0k4ENO1/OCQx/oSdEGJ7bn98dAeLuWuCyp
	HDgeVoyBjkvemcKtoY9tc/D0CYr2at+77KF4cgjaon2Rptv9tI8bRUwNvoaki5dH5Qv5A8wcfZARQ
	h9ZGqXFUglstWQcgCS5xfoeJljhEZWCLKk+7PaJt/C+t/x3GFJUgBTLhyIO+cg+BJCt+cJHQWfp2b
	/WTttbtjjZf+g7aucuqvj6hSN8akmnxUv5WqGJ/yl7ndI9V72LGKAhuK6p47JE2dMC/FTf9TLSSxE
	R0yWAGYqxL7SK9PTISqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMoi-0000000FGyQ-3tQJ;
	Tue, 16 Jun 2026 05:58:32 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMog-0000000FGxi-3axD
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 05:58:32 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so70737eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 22:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781589509; x=1782194309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9PSlzuZQ4Daz0lqLHFL3WubdgzTXoK9WA+8u5CazoU0=;
        b=eiEm9Ido7Ts6f/iS7TxUvCuz+yry19/S9SiEopMQe/zXxznA6UFUtm+qIx6wLbEKO9
         4fNUF24FzybQJqPI4tX1S8dIMqNyfEeHga2lnlNWVy3GbPO5n2kwmpvJUm0mK85A65Xc
         h2eNakVrmSMTEEBsXBpDVeCJ/3LVSj2y5omdtE/qqe1+pfB664FIE81UV1NZ7/DP7+32
         a1WyeaFVUGx3ArPlwKYpS37eV2pXN+ZPC05IIunz31UWY4ZgR8Z+9y3NSQBRxoC+cmvn
         qWzYFzU5fB5sfrmo9f07WWTLHp6osNZIPXcaVnGZcYxE3k9eKtL1MyUsxczz0DeN+tqw
         7EJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589509; x=1782194309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PSlzuZQ4Daz0lqLHFL3WubdgzTXoK9WA+8u5CazoU0=;
        b=D/KHvrh0NMsKLpBuCA9N6MNLXSOViGk3X8zNhXIFiEBsP0di8v2BCUn30c80D00QLt
         ICY/pgj2d94wi46FgMzUY1gXM4+iswEaK+JGNBppALBgzQMEUeERleY204ejJtc0GEA6
         +VhpzsC5o54/bAFJRLTmYJHBQPd6SSjCd2IZjTh9+TpuAPSL3U62NhFz2/p5rsnE+50p
         3n7OM5yQvTV00mgMMGtrHxQd2v/PDZIH9O2buYm5xHPbQAqlsPnqoJvDcf4FSLlDr90v
         3HZaleidxLMbzlJaz7yguN9PT/59DueL7YS9bvPFOTJfAxNWE4TKTtT8tMIiV8gf55VW
         jXaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yvt99mH+L+CfSaitqwgcOdJdUTmVIuDTuzkiSFY8xvkv894NLwtgekHxY+S9kPu2dH27CUtccIj/EJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSDeCy3bo+jFIvK6r9TJtBBudiFzTFMAymQFtimi8KTpqERGQg
	9wUyQ268/lDA7qL5B+2wjW/yNWzlLoZRUbjTpMdWrviHizAkKrj+h6DzVwGQGEYY
X-Gm-Gg: Acq92OE7V+4GFd5690i0cxGyBURUPUyql08z+c8tJlViXUueIIbM6KCgVIo38kjj99j
	/b1ISy8f5KAAy6WtWFpRlwCo/rNMMeoog3wUJMurXpQEzP/WNrBnEPPAvzcp6SwZPwO80ktD9vR
	pXiUbbsSfGiuaxq0nS5X08zWXSZ/imIY1otiWJmrGwXeFkqjgqGABhSER1fSHSdWvvCaWgiITf+
	VQlhZo2CiGLSUdjbXmLU/fK0LEOgKLFlBIW2LEJFjBX6RIcJETRAUKYSOhDfZK0zI5Lw4Mx0a0R
	fakf7yHmiVUuaZdz2MRFdBkBJnDN9tG7RxOvfHkweuJ/zb6UqjKZl2F8qiwxdSJe+4swQzK78ps
	yIQqRhujkyw0bJI0IEKtw2XKMMo//7xz7OguaJ8a2Bs/LRjOR0PMTJDSrk58byiEJgoXNEYWNCu
	e8T8D5jrHUI/g=
X-Received: by 2002:a05:693c:63d4:b0:30b:6191:7f96 with SMTP id 5a478bee46e88-30b6191bf72mr3509252eec.30.1781589509451;
        Mon, 15 Jun 2026 22:58:29 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e92096esm18135283eec.15.2026.06.15.22.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 22:58:28 -0700 (PDT)
Date: Mon, 15 Jun 2026 22:58:26 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 01/16] riscv: Introduce instruction table generation
Message-ID: <ajDmAmq4_hYCDEfp@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-1-54b4736a1e77@gmail.com>
 <878q8m1j9y.fsf@yellow.woof>
 <aioJ_5SIXdGQg55R@blinky>
 <87se6tejoe.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87se6tejoe.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_225830_898376_39C098BC 
X-CRM114-Status: GOOD (  18.27  )
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

On Thu, Jun 11, 2026 at 07:21:37AM +0200, Nam Cao wrote:
> Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> > This is a weird one. The Ziclsd extension introduces it for RV32[1]. All
> > of the data is generated from the riscv-unified-db and because it is in
> > the Ziclsd extension, c.ld is included for 32-bit in the c.ld
> > description [2]. 
> 
> Oh :( We probably should amend the base spec to mention that.
> 
> >> > +        compressed_name=${name##c.*}
> >> 	   ^^^^^^^^^^^^^^^
> >> 	   this name is misleading
> >
> > That's fair, I can rename it to be something like "compressed_inst"?
> 
> My issue is that "compressed_name" indicates that it holds the
> compressed variant of the name. But it actually is empty if the
> instruction is compressed, otherwise it is the original instruction name.
> 
> I am not sure what is a better name. Perhaps just inline this to the
> usage below.

Oh I see, I'll come up with a name that is more clear on inline it.

> 
> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
