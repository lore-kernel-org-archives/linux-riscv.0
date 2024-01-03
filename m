Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68ADC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 15:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/R8JSmfiHIdsGTUUHYFCbOUWAO5hdMmpVKcZaZ7XTgI=; b=OoBoN1WmuQwJ/i
	xVzM5CFFGi7ZHpnmnS92RJScgc0m2ad+8OylyhkL/g1kiCchGIUlwT+TejCZmyRSrsDry31MLQXBR
	q/GhWRveJAYpZyOiom+g+5S+tR3X3WEYzLPdwEM65QZK2/5CFZAuUIayvyv3Ilh1557p/hMbBAX79
	xVFtuUSjmfFc+tc/Dc0loz6tW4YUIIUQoS+UnJxFxN9o6Wp0NMtD32IiwkjtT6cvkCkOl42AC7JPr
	ul7fVoXwmq/dId5W1amnuFGMdfUxeRhphx9NoPMOizFa6j2SNKF66yzEZPL8pBLPOtqvEIKLAEB/D
	sA0yP7plUbGiiGfPolXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3DM-00BGIL-27;
	Wed, 03 Jan 2024 15:31:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3DK-00BGHt-03
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 15:31:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704295884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xi/cLbBuD7PQL0fsq9282B7IArYlzlUVvqfZqTLR3Tc=;
	b=dJbBfZ2Wd1kBXhCkVGyQ1hjoHiYG96RwKnyY4noD+Iu7JKUiahPsYfvmx6rSnPoBZK7cJ6
	tDAwzWcIsC2dAp9NkjvluFy45g67ZCr5JDmNdhZeYB5GVmXt/mZA+aL5S7iRVHUq/RAnDS
	T0kTshY83xTesv6aEC6sMkFq5BSri00=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-xnyqeY3jOiqVhXYfx98IQQ-1; Wed, 03 Jan 2024 10:31:18 -0500
X-MC-Unique: xnyqeY3jOiqVhXYfx98IQQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d410cccfc2so39943395ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 07:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704295877; x=1704900677;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi/cLbBuD7PQL0fsq9282B7IArYlzlUVvqfZqTLR3Tc=;
        b=bIDmp2CW3t0BPJNyAkAPv7DLT7O0ggbdX+fUjEM3wkl/WZqz1abCP0fQ8RjjF3/vU1
         80pbj9ZaJw2v5Dr/57KlKehMXTG0vtT83XlDj8/qfIbGLq44Jv48+owZG5kd8X+k3fTO
         0GNjyl0Of2uny15zWxmVHSdkFh59Bt0Eel3YrwiWEc0NVG9SdbxkIwoaWTm8Dh/RuWqN
         mwWHwEBk4fcXjYBxUOOE0UmGX/Ttv6qgcY9vXootebu+AVL2fyAE6a+UDrRiBVqWGNpl
         ipcxG4B+pD89srt+I1zsxEFlXW7Tolr3N5xDkERZyrOchpJ3+AwsOwVOHBbaZhzixNPW
         uhSA==
X-Gm-Message-State: AOJu0YxV9EmfsNretB2cw9r61I5HMYnLyDkCjj0JDIMncnZz3yPIwFK/
	JLH2nQl0oVBBJmYe96WOdUYFpsLQCcKnzCgI6nRsVb2NToGthhWyQMAIAKW9S+WMGq9BtsTeGqV
	A9lsoGbyJaVKvDK4dmj8GRNGIo+nxEftKU+eP
X-Received: by 2002:a17:902:c40e:b0:1d4:59c1:cabc with SMTP id k14-20020a170902c40e00b001d459c1cabcmr7800666plk.75.1704295877207;
        Wed, 03 Jan 2024 07:31:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFD7GdHUUbPzO0iEzmnqE5viAUZQUvfg0jqQVgtyzl0QBvUi5XEXgBeW4KujyYniYeMi94Jkg==
X-Received: by 2002:a17:902:c40e:b0:1d4:59c1:cabc with SMTP id k14-20020a170902c40e00b001d459c1cabcmr7800651plk.75.1704295876882;
        Wed, 03 Jan 2024 07:31:16 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm24093873plb.20.2024.01.03.07.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:31:16 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	leobras.c@gmail.com,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Will Deacon <will@kernel.org>,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu,
	parri.andrea@gmail.com,
	andrzej.hajda@intel.com,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v5 5/5] riscv/cmpxchg: Implement xchg for variables of size 1 and 2
Date: Wed,  3 Jan 2024 12:31:04 -0300
Message-ID: <ZZV9uGm3VApkLHMF@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ZZU/YNPMigiD/k1g@xhacker>
References: <mhng-92f37526-d36c-48c0-8fbd-7676df1b6086@palmer-ri-x1c9> <2a4f1f47e945772b9fbb53a51e148636e0ae6e48.camel@redhat.com> <ZW_GzKUoqO4fD4Je@LeoBras> <ZZU/YNPMigiD/k1g@xhacker>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_073126_162239_E61D1BBA 
X-CRM114-Status: GOOD (  50.88  )
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

On Wed, Jan 03, 2024 at 07:05:04PM +0800, Jisheng Zhang wrote:
> On Tue, Dec 05, 2023 at 09:56:44PM -0300, leobras.c@gmail.com wrote:
> > From: Leonardo Bras <leobras@redhat.com>
> > =

> > On Wed, Aug 30, 2023 at 06:59:46PM -0300, Leonardo Br=E1s wrote:
> > > On Thu, 2023-08-10 at 09:23 -0700, Palmer Dabbelt wrote:
> > > > On Thu, 10 Aug 2023 09:04:04 PDT (-0700), leobras@redhat.com wrote:
> > > > > On Thu, 2023-08-10 at 08:51 +0200, Arnd Bergmann wrote:
> > > > > > On Thu, Aug 10, 2023, at 06:03, Leonardo Bras wrote:
> > > > > > > xchg for variables of size 1-byte and 2-bytes is not yet avai=
lable for
> > > > > > > riscv, even though its present in other architectures such as=
 arm64 and
> > > > > > > x86. This could lead to not being able to implement some lock=
ing mechanisms
> > > > > > > or requiring some rework to make it work properly.
> > > > > > > =

> > > > > > > Implement 1-byte and 2-bytes xchg in order to achieve parity =
with other
> > > > > > > architectures.
> > > > > > > =

> > > > > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > > > =

> > > > > =

> > > > > Hello Arnd Bergmann, thanks for reviewing!
> > > > > =

> > > > > > Parity with other architectures by itself is not a reason to do=
 this,
> > > > > > in particular the other architectures you listed have the instr=
uctions
> > > > > > in hardware while riscv does not.
> > > > > =

> > > > > Sure, I understand RISC-V don't have native support for xchg on v=
ariables of
> > > > > size < 4B. My argument is that it's nice to have even an emulated=
 version for
> > > > > this in case any future mechanism wants to use it.
> > > > > =

> > > > > Not having it may mean we won't be able to enable given mechanism=
 in RISC-V. =

> > > > =

> > > > IIUC the ask is to have a user within the kernel for these function=
s.  =

> > > > That's the general thing to do, and last time this came up there wa=
s no =

> > > > in-kernel use of it -- the qspinlock stuff would, but we haven't en=
abled =

> > > > it yet because we're worried about the performance/fairness stuff t=
hat =

> > > > other ports have seen and nobody's got concrete benchmarks yet (tho=
ugh =

> > > > there's another patch set out that I haven't had time to look throu=
gh, =

> > > > so that may have changed).
> > > > =

> > > > So if something uses these I'm happy to go look closer.
> > > =

> > > IIUC patches 4 & 5 will be used by qspinlock, which may not be done y=
et, so we
> > > don't have an use for them for the time being.
> > > =

> > > Otherwise, any comments on patches 1, 2 & 3?
> > =

> > ping
> =

> Hi,
> =

> I believe the "RFC" makes some reviewers think the series isn't ready
> for review, so could you please send a new one w/o RFC?
> =

> thanks

Sure, will do.

Thanks!
Leo

> =

> > =

> > > =

> > > > =

> > > > > > Emulating the small xchg() through cmpxchg() is particularly tr=
icky
> > > > > > since it's easy to run into a case where this does not guarantee
> > > > > > forward progress.
> > > > > > =

> > > > > =

> > > > > Didn't get this part:
> > > > > By "emulating small xchg() through cmpxchg()", did you mean like =
emulating an
> > > > > xchg (usually 1 instruction) with lr & sc (same used in cmpxchg) ?
> > > > > =

> > > > > If so, yeah, it's a fair point: in some extreme case we could hav=
e multiple
> > > > > threads accessing given cacheline and have sc always failing. On =
the other hand,
> > > > > there are 2 arguments on that:
> > > > > =

> > > > > 1 - Other architectures, (such as powerpc, arm and arm64 without =
LSE atomics)
> > > > > also seem to rely in this mechanism for every xchg size. Another =
archs like csky
> > > > > and loongarch use asm that look like mine to handle size < 4B xch=
g. =

> > > > >     =

> > > > > =

> > > > > >  This is also something that almost no architecture
> > > > > > specific code relies on (generic qspinlock being a notable exce=
ption).
> > > > > > =

> > > > > =

> > > > > 2 - As you mentioned, there should be very little code that will =
actually make
> > > > > use of xchg for vars < 4B, so it should be safe to assume its fin=
e to not
> > > > > guarantee forward progress for those rare usages (like some of ab=
ove mentioned
> > > > > archs).
> > > > > =

> > > > > > I would recommend just dropping this patch from the series, at =
least
> > > > > > until there is a need for it.
> > > > > =

> > > > > While I agree this is a valid point, I believe its more interesti=
ng to have it
> > > > > implemented if any future mechanism wants to make use of this. =

> > > > > =

> > > > > =

> > > > > Thanks!
> > > > > Leo
> > > > =

> > > =

> > =

> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> =



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
