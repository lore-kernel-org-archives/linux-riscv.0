Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DD8C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oHmCWoN2K66vdK5cH5d39ueOwfrxP5n3sweVTXy1OjA=; b=1ZF+IzTIPp4yBM
	+ByPNd3N7+o1EM5A+TI4r0PQgfI6kh/3Guy4xx0B056bBve/vrrN5OhJScljtBZv/QBBIWcSWVmrl
	xKYQii7LZK55GcuYdejqSjgChXbH4p/4kVvEyZRGYXdaK0YKv2WNaY3xVoanpMTrRgQJIgKR03TaY
	VEhOxUT7DgOgSxNCj/vJGYlLTkyM29tRMZ3zIwJDiQXcDtnWjY4Mj4prQnvT9p3KkhHWReAyxWY/C
	ld6vFc/zQoFYlrgFoesgoPeN+mp80ouhW96Q3gEoEqMw0gXJmtdKjjgliIteCFiIQlIDbbEsw3KQh
	WXER3aeyrFjWEHjvQnKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiIuo-005KfQ-9Y; Tue, 11 Oct 2022 17:19:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiIuk-005KeY-Pb
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 17:19:37 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9623D3F147
	for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1665508771;
	bh=my6sVOU8VtRYMa675sr9CNOS9J5JEpSv1gx/NSSrwBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ihB/HABPk5WS1QxpMam+eSfj+vmPxd+7ZJvdjoTbWo0U3ZqjazDnvZa7QJZvYjgdN
	 sSNehad9fdxFSwWJocOfhvyrM1bhflM7AK3vfff6OsRy+/+IduPLIgQFWOjeumv17j
	 9o568MEf9knwRH2qH3ajHM62GHEbSu4pVbELW27kY5ayhe0G1GCKAJJlX5q+a7Owfc
	 Mt5XF7gtH7cOuST2I5MyncWnaH+UxXf8y0ei3Y9qT3NnW3s/sQOvOPulyDePtQO2Lc
	 82df5DMVrISUfdmjoIljWuRaGM23Gk9SfEG5/L76T7grpeedoUIT4XdyLEujOS2aM7
	 ktIp5q4+V9Cqg==
Received: by mail-wm1-f70.google.com with SMTP id 2-20020a05600c268200b003c4290989e1so2418814wmt.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 10:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=my6sVOU8VtRYMa675sr9CNOS9J5JEpSv1gx/NSSrwBI=;
        b=Jqw587DiOkM4rER0SYP0EQk9gMq5vFsS4wt2nnZT29wqsnFpy1xyKa6OVEUmWWUP3D
         25MPAmibzyAaacdlFdsUkk983GjkuWzBL04BlNWJQx9qv6MIc+TQn/6JARd4qHc1pbHG
         DVfn9HzSD1kxRPARr32yWHAj5xImrpHcWoKOG45dx7d37LfvP4aTHaXnOm6ZgWoQfghC
         fkXdZYQ2+tl0v04xRHU3sAADhFVLZcJ5GmRkpXA0ZXHVDse8B1UyN4bPYnsw9MMA4fcz
         Soz7ff724XV5YSOEtHInO1HBrszuEzJWT1/SXEjOObRvKqtNLuL/9oNCbuf/mM+9dZ94
         Q+UA==
X-Gm-Message-State: ACrzQf3eGzzOlsrLdRrbPb3p6VT/HaSqjbDWsIcHyZujk2oMq6Ano+Nb
	gZ8PbnDrtGBEd943yazkeshuJOIbskf6LGH+M3wtLKtu0uoRzhfvAtISVx1D2hppBilzl+Yhizr
	FMC5khO6Qe/y6I82EF1hrbfFWl5VeC2GRQ63KqvKIkCE7cf5oPni+E3McCFfNig==
X-Received: by 2002:a05:600c:418b:b0:3c6:c1e6:b01c with SMTP id p11-20020a05600c418b00b003c6c1e6b01cmr113414wmh.118.1665508770791;
        Tue, 11 Oct 2022 10:19:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6kEfxTPdaaZb76dTujH+ZaW2WgqT1q11a8LoW5U3WyutzRoB267icZUKz0P9CQZnC7l3DX49bwGyxx6kmMa2k=
X-Received: by 2002:a05:600c:418b:b0:3c6:c1e6:b01c with SMTP id
 p11-20020a05600c418b00b003c6c1e6b01cmr113396wmh.118.1665508770566; Tue, 11
 Oct 2022 10:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <d6c9e249-08bd-4439-7dcc-371b32e7b851@canonical.com> <Y0WgwBgenhnk7/O2@spud>
In-Reply-To: <Y0WgwBgenhnk7/O2@spud>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Tue, 11 Oct 2022 18:18:54 +0100
Message-ID: <CADWks+Y3xYc325x2_2jeRh-iyE6i0gi2Ldd_KKBLhB7s9nQhWA@mail.gmail.com>
Subject: Re: Regression: Fwd: Re: [PATCH] riscv: mmap with PROT_WRITE but no
 PROT_READ is invalid
To: Conor Dooley <conor@kernel.org>
Cc: regressions@lists.linux.dev, stable@vger.kernel.org, 
	Eva Kotova <nyandarknessgirl@gmail.com>, linux-riscv@lists.infradead.org, 
	coelacanthus@outlook.com, kernel-team@lists.ubuntu.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_101935_253250_9F0B5E98 
X-CRM114-Status: GOOD (  34.20  )
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

On Tue, 11 Oct 2022 at 17:58, Conor Dooley <conor@kernel.org> wrote:
>
> On Tue, Oct 11, 2022 at 05:52:13PM +0100, Dimitri John Ledkov wrote:
> > #regzbot ^introduced 2139619bcad7ac44cc8f6f749089120594056613
> >
> > Over at https://lore.kernel.org/linux-riscv/Yz80ewHKTPI5Rvuz@spud/T/#ebde47064434d4ca4807b4abb8eb39898c48a8de2
> > it is reported that 2139619bcad7ac44cc8f6f749089120594056613
> > regresses userspace (openjdk) on riscv64.
> >
> > This commit has already been released in v6.0 kernel upstream,
> > but has also been included in the stable patch series all the
> > way back to v4.19.y
> >
> > There is a proposed fix for this at
> > https://lore.kernel.org/linux-riscv/20220915193702.2201018-1-abrestic@rivosinc.com/
> > which has not yet been merged upstream or in stable series.
> >
> > Please review and merge above proposed fix, or please revert
> > 2139619bcad7ac44cc8f6f749089120594056613 to stop the regression
> > spreading to all the distributions.
>
> Out of curiosity, and given the CC list lacks a CC of the maintainer,
> who are you actually asking to review and/or merge this?
>

Good point, this is my first time escalating a regression which is now
in all the stable trees. I guess I should have CC'ed all the M: from
RISC-V in the Maintainers file. Not just the riscv list.

> I'll go bump the fix itself.

Thanks.

>
> Thanks,
> Conor.
>
> >
> > In Ubuntu this regression will be tracked as https://bugs.launchpad.net/bugs/+bug/1992484
> >
> > -------- Forwarded Message --------
> > Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
> > Date: Thu, 6 Oct 2022 22:20:02 +0300
> > From: Eva Kotova <nyandarknessgirl@gmail.com>
> > Reply-To: PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com
> > To: coelacanthus@outlook.com
> > CC: c141028@gmail.com, dramforever@live.com, linux-riscv@lists.infradead.org, palmer@dabbelt.com, xc-tan@outlook.com
> >
> > On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wrote:
> > > As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
> > > but not read is "Reserved for future use.". For now, they are not valid.
> > > In the current code, -wx is marked as invalid, but -w- is not marked
> > > as invalid.
> >
> > This patch breaks OpenJDK/Java on RISC-V, as it tries to create a w-only
> > protective page:
> >
> > #
> > # There is insufficient memory for the Java Runtime Environment to continue.
> > # Native memory allocation (mmap) failed to map 4096 bytes for failed to
> > allocate memory for PaX check.
> > # An error report file with more information is saved as:
> > # /root/hs_err_pid107.log
> >
> > I bisected to this commit since on Linux 5.19+ java no longer works.
> > Perhaps some fallback should be implemented, to prevent userspace
> > breakage. It is currently documented, that at least on i386 PROT_WRITE
> > mappings imply PROT_READ (See man mmap(2) NOTES), this would be a good
> > place to start.
> >
> > Best regards,
> > Eva
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
>
>
>


-- 
okurrr,

Dimitri

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
