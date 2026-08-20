Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08AAC5DF82
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 06:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oD/tBGFOaQ6jO+/tNvFvU8J6Yl1ndgJ+foI07GoPRvA=; b=m7gAjCfLjRUTmv
	XVRDsMghsnOkL6DCpMCIYXAhUINrWV4rxr4yks9h1jktQ7U7eAmfI/O3TMWlURDUHXQ05o7JGARkK
	dYyMECxGvDV1rf/fnsYoIF8wVk7vUnb826RqQ01251s06Yy5U4B0sNtwwYGDAb7EABZYbvTTJXvbF
	4ZCG1jtM4MduduPUSZg3DWXmAMailQNSy/ZauIRA6cwtl2UwwNquu+uVAFdhcaqNTUT3sOf0/xy9Y
	5kOv9cWCifg3M8emsEbmsRqNZ92Xd5jNvNJ3wlX2vhzAH79xVZV/8Q4pDf41/lwLts+vFMV3yOlyy
	nyswTSPbjVjEXPW+nDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwway-0000000AyP4-2qqj;
	Thu, 20 Aug 2026 06:49:48 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwwav-0000000AyOd-1u2A
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 06:49:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1952018a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787208584; x=1787813384; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRc1eSHVwu1q1qbvgzDIPRU3EZV0cBSELC6VRfYKDj0=;
        b=LKsOowGVFKMIVli3K3lLc+sTWrbcL8eYg3piYkQ8l/uyEhtWG0PvK9LdEjYWnGMbNS
         +QRAeBdHNH2jKBHlLN2y0L6x3YJilEY5QjhR1bXHX32n/i/xbCIP+n60n7aqx0V5CR6h
         wU4CGn9iFoSdIbZe2q57uFhL2oW1rmy4TmEZqYdrqMvT9geQj2SU3eIEQHjLROarL/7L
         YDg0Un9KbF7bkXO2PrYxT41k3YAUBZITv38FCFvBT2xXWHn9CId7WQY+ps2ANq4R3ys0
         VWTZ3XFQ3cEl2LejntZgV4gBpWPqf10M9dIxHVUvT+SK3AjRikYScQBmgsSjOpwFIW9k
         p/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787208584; x=1787813384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kRc1eSHVwu1q1qbvgzDIPRU3EZV0cBSELC6VRfYKDj0=;
        b=cpK0qO2oVD4KUjztt+uVLOHyCVN35PeR9J8MM3YtG4xeI42QjRUdjvFfMmR4aUXpAo
         Dv3jDJDesSqF86a2CO5wPHF/ZGNfx0zIva3Wh/reXJmD4PtOT9NA7aKdz5ziIZq4L7OJ
         Va1Z7Bn0I3ZFrv1CgullO3EHRSbQKUYIC34WjgaD7ytSMSiwKUrZKvyoadZ89Oy5SiwV
         beJwoVnXVUImSScCIniy4Kmp5k9pIxDK2yXu2d1ma901DdMuwc76D75NLGmONXlOFT2J
         ki2150dSbsootcg27TG0n66MQucuTDXPFTSZSclpvcMo0u+GJzpQcL0ER+uTysFRwBkY
         Cr4g==
X-Forwarded-Encrypted: i=1; AHgh+Rp/cOPRQKFwvh0nYIEPdrU/NNHo5p24SGGuzMIIzxjTLLP2C8xICItma6ZH1DGDL4oC6sKoiftLBoNR0Q==@lists.infradead.org
X-Gm-Message-State: AFuF++ly7v5mNmzmU/FOlXm8TXxKBNYPw+5jANU9kOqsugAPMErkE9K5
	72sf2u0btnS5zFBaUqzrIz920OPNz5KVmodbI8enMxOMw2iDBPNdd4ly
X-Gm-Gg: AR+sD135oJs/0oUhQhKOjFQgT16RYdYs6jisqPT/JR+h488sOH0WIPZ5ST5x+dzOvDQ
	axqFoV+t3wazQmwR8vfntgx53Fjm9P5feieQP4QGl4rKgBFFDl40voRo2x/u2p/denA2vrZgQ2C
	JbJjGskcjfLxkYnuyeR5D9GDR8BDF+cXtbb6B0mUlfNPTBHLc9tZxPM2OxQmqeTZcWN6UmB0byr
	CjEybO2runoi/9beO47ijhdAUsRJb62Gt4BGkdLNmO34zM/6/TlHFPo/ezU90Ya4iNeYlXYg0/e
	QxyBfYLBv5pG7zOwoQ0aixuZOmzRq15E8T2GT8zIRRqv0HhKq8wEF1RISC6N6ExL+HJilDeX/1v
	eJOyg/4aWserRkYEMKsoyhiK7/MBuD4HqPhUaiHEx0+x0x4DjB39+47kPG4QBigL87mrSJNEAnK
	ziM/vL/1+GGrLBNf3i65mUXYegQw3+AfPvPb7r95+4w8fdttyBaFH8ffRvWn6P41/UCsKD9CaTL
	LZyQ++D8gNuLjlJTiVtTBp2TGBMyet5
X-Received: by 2002:a17:90b:4e8f:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39580a80a58mr18755677a91.1.1787208584359;
        Wed, 19 Aug 2026 23:49:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb3069csm6696864a91.15.2026.08.19.23.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:49:43 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:19:33 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, thuth@redhat.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aoahpef37-7EaTrY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260819084825.969116-1-mkchauras@gmail.com>
 <4c5b2ab5-83f8-4ee7-bb02-3046ed01fd84@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c5b2ab5-83f8-4ee7-bb02-3046ed01fd84@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_234945_500490_5F9C911F 
X-CRM114-Status: GOOD (  25.32  )
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

On Wed, Aug 19, 2026 at 01:50:43PM +0200, Christophe Leroy (CS GROUP) wrote:
> =

> =

> Le 19/08/2026 =E0 10:48, Mukesh Kumar Chaurasiya (IBM) a =E9crit=A0:
> > The Rust kernel infrastructure generates inline asm for WARN() via
> > ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> > preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> > arch-specific asm template string for use in Rust's core::arch macros.
> > =

> > powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> > Rust builds to fail on powerpc.
> > =

> > Refactor _EMIT_BUG_ENTRY to accept explicit (file, line, flags) string
> > arguments rather than relying on positional asm operand references
> > (%0, %1, %2, %3). This allows the macro to be composed as a plain
> > string concatenation, which is required for ARCH_WARN_ASM where no asm
> > operand context exists.
> > =

> > Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
> > the BUG_ENTRY() call site to preserve existing behaviour while enabling
> > ARCH_WARN_ASM to supply its own size operand independently.
> > =

> > Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
> > convention, indicating that no additional reachability annotation is
> > needed after a WARN on powerpc.
> > =

> > This brings powerpc into line with x86, arm64, s390, and riscv, all of
> > which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.
> > =

> > Suggested-by: FUJITA Tomonori <tomo@flapping.org>
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >   arch/powerpc/include/asm/bug.h | 28 ++++++++++++++++------------
> >   1 file changed, 16 insertions(+), 12 deletions(-)
> > =

> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/=
bug.h
> > index 0db48977c70c..8aba39e0cf26 100644
> > --- a/arch/powerpc/include/asm/bug.h
> > +++ b/arch/powerpc/include/asm/bug.h
> > @@ -32,34 +32,38 @@
> >   #endif /* verbose */
> >   #else /* !__ASSEMBLER__ */
> =

> Sorry, I still don't understand. The only place the new macro is used is a
> .S file (namely rust/kernel/generated_arch_warn_asm.rs.S), and the change
> this patch implements is inside a #if !__ASSEMBLER__.
> =

> What am I missing ?
> =

> Christophe

Hey Christophe,

The code calling ARCH_WARN_ASM is a .rs.S file that goes through the C
preprocessor as part of the Rust build machinery.

The intended mechanism is essentially

generated_arch_warn_asm.rs.S
          |
          v
         CPP
          |
          | includes <linux/bug.h>
          |
          v
ARCH_WARN_ASM(...) gets expanded
          |
          v
Rust source containing the generated assembly string

The patch therefore needs ARCH_WARN_ASM in the non-__ASSEMBLER__ section,
because that section is where the macros intended for C preprocessing
are defined.

The thing is .rs.S is not using ARCH_WARN_ASM as an assembler-time macro,
it is using the C preprocessor to expand ARCH_WARN_ASM before the
Rust/assembly processing stage.

This is my understanding of things, if i am wrong somewhere maybe
someone can clarify.

Regards,
Mukesh


[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
