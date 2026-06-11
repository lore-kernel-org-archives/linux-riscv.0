Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACA3CD98C6
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 01:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGJVbtkUN+6hR1wJHnfzW9WoV4AeFpsSpKlEdKgdodw=; b=Y6Ux3kKrL0C6IG
	QHuLUNuzYU56qFuuN0qzdalQvfLzJFRgCggMHSoD+87jqbsU8ieyQzmbaUxeLmZjs8ZRVd3zc9605
	tEUUWLz1FnevVXwL9chMY5s8Mub/SDY10hESp2HxiIEpJZGfVgt3/PzH0Ew0RA7rcogO0QtPdfMWN
	4TrJxLQnw3XEcqJ4RVrDN5rC393TfNT4XPzOehu718/pW7eBPPyeEnlONahxyA0uxT3+4NemSRsxN
	DQmPElGFkY8WJWZGxKqQZIZ1/eF3Ej4LYswPPwCUfWIWWqYSg034cDITwSJT0rhfogZ8xakYKDQA5
	/3a5Oac+Iz+bD0YRWSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXTs7-00000008WBM-3I7C;
	Thu, 11 Jun 2026 01:06:15 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXTs4-00000008WAi-3xtb
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 01:06:14 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-304d7f31215so6677827eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jun 2026 18:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781139971; x=1781744771; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VboLQNAR8iiox5vG6qq6qNpSq+23FwPh2uptUxiLAaw=;
        b=LdgjRiLtfpvIFoGtn9J08Ry+vFo/Hb7Q9IVBg9iSvoKCjfCRoKxV2fZW8RPRMtmw7s
         n7I7iJO8J4YHtcTYJ3Z4nSpScWdnKODre+QLiiK4Lsb3vpURqtMCpVXEZMm1Lkc6E8xG
         euggwm7dKzX5e4DiR1HguRZbsFGFsEsQCVZYit7Bh9BcrLfe6VoyqvO9+vX9hf7+ByZl
         D59uypuvrnDcvhRaFmZmqfgCVs9cAwEsQVU4LdR0b8Pw02DEcta9TOOzElt+wPH7Ns3x
         7U+OZulRoKouXE5FZXRubrlbsTgygs4JfzwBdDq14s+CLuH19y14d6kGejdmSFQVQ87m
         9XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781139971; x=1781744771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VboLQNAR8iiox5vG6qq6qNpSq+23FwPh2uptUxiLAaw=;
        b=OqzyC2nMRzRkSKC3UC4D8mS3q1wEaCfLBjSRbtWfrY+DUPbWQFbg65Ml+/HXTcYbjX
         B5vxmXOloppmTdiqRP4DxrWAWTCUq/PY/z/ZOyc2f9aMgJhXxmwO8yGm58fK6a7ReVZe
         hFqT7xn0wGM5/P39TuJt+CAMjr+U2PR7B2oHQctR5qJALNiAyQBiZp2daApzZR1HzmYU
         N7UiC4XSRVL1f9FE++EvKkFLP8zFczhuasQE7puGWXYmmNTyLaqfhMMr3EPfyEEePXeL
         F8JxU21E3hEBoUfQP3d83y2th+OwcFe7jSUprgNuyr2sBLKfcN1DkpeXXNqUkpCiGVn0
         b33g==
X-Forwarded-Encrypted: i=1; AFNElJ/1VReBKur+NY/cYBx1VCwrMwv89EmFJh2UudHi/KanAwISO2AJyHdfn0y7s/vnCXCMZ6MMFdeE4Xo+/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9IC7jSSGGEx7oU4Ose4227tsi3zhWcjXW06kRucEZNSOGDe+U
	kL4KXgUiTgAhW4LfaORQvnlgU2uN+JQxgIxNC6aEeLN1TTI9bDu5/wmN
X-Gm-Gg: Acq92OErh9BXR3IpfVzFR3yoztu6EARglW+obVg+hDRdO1ZFYH/Bq6QydOp92cQzUxS
	NOvFhJm1cMSbyI1SwXgztfKapot+rBg6gIq03kC/dU/b/lFszO4AUa0/y3UfGJ5DRwLHwzoAt+F
	0H3jHQDGDVgyzxLmMCKt0MV90m+pAxVxZko23ChW/GXQV8VI5bTG9uVJqPvJvsSpXfMOOXao4CD
	MlDFk2evUujiW7Cq7qKMzuM6tNB6xkGdpAjKzFzpqhO0Ro+Ioh5wDZpOsLXxvrcFxtptQcrOs5Z
	U0bL7QuyqQDKA6ssGIAEYAuwivrg5RpARzFGzGeifsonxPTL/h5FQ0eyteELP27wPJ2M1Qbm+ak
	3fnj0Nx9+GCdBsG0X/uqqHpoRf6ZsaMSoYi8CBNJFtwjrl1DvTlqIIWFYV2PGrEDRa5XT8+AP+J
	tJZfNIx1VCBMbFnze8JpvTLw==
X-Received: by 2002:a05:7300:510:b0:2f3:986d:2d01 with SMTP id 5a478bee46e88-30804bbdd85mr548716eec.19.1781139971040;
        Wed, 10 Jun 2026 18:06:11 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30806ebb79bsm71245eec.25.2026.06.10.18.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 18:06:10 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:06:07 -0700
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
Message-ID: <aioJ_5SIXdGQg55R@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-1-54b4736a1e77@gmail.com>
 <878q8m1j9y.fsf@yellow.woof>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878q8m1j9y.fsf@yellow.woof>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_180612_980143_BE96F3E0 
X-CRM114-Status: GOOD (  26.22  )
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

On Wed, Jun 10, 2026 at 05:56:25PM +0200, Nam Cao wrote:
> Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> > From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> >
> > Eliminate the need to hand-write riscv instructions by using a shell
> > script to autogenerate a header from an instruction table. This is modeled
> > after the syscall table infrastructure.
> >
> > The table is generated externally by riscv-unified-db [1], but is
> > in a simple format to make it possible to use other tools or modify
> > manually.
> >
> > [1] https://github.com/riscv-software-src/riscv-unified-db
> >
> > Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> Thanks for the work, I really like the idea. This will make it much
> easier to maintain the instruction stuffs.
> 
> > +c.ld common,32 011<13|00<0 imm<3=6-5|12-10 xd!1!3!5!7=4-2 xs1=9-7
> > +c.ld common,64 011<13|00<0 imm<3=6-5|12-10 xd=4-2 xs1=9-7
> 
> Not sure if I confuse something, but the spec says "C.LD is an
> RV64C-only instruction". Why do we have 32 here?

This is a weird one. The Ziclsd extension introduces it for RV32[1]. All
of the data is generated from the riscv-unified-db and because it is in
the Ziclsd extension, c.ld is included for 32-bit in the c.ld
description [2]. 

[1] https://docs.riscv.org/reference/isa/extensions/zilsd/_attachments/riscv-zilsd.pdf
[2] https://github.com/riscv/riscv-unified-db/blob/main/spec/std/isa/inst/C/c.ld.yaml

> 
> > +echo "#define COMMA ," >> $outfile
> > +echo "#define SEMICOLON ;" >> $outfile
> > +echo "#define SINGLE_ARG(...) __VA_ARGS__" >> $outfile
> 
> Aren't these macro unused?

Yes thanks, I had them for an earlier version and never removed them.

> 
> > +echo >> $outfile
> > +
> > +grep -E "^[a-z\.0-9]+[[:space:]]+" "$infile" | {
> > +    while read name base fixed variables; do
> > +        echo "/* $name */"
> > +
> > +        compressed_name=${name##c.*}
> 	   ^^^^^^^^^^^^^^^
> 	   this name is misleading

That's fair, I can rename it to be something like "compressed_inst"?

> 
> > +        invalid_inst_functions=""
> > +        variable_params=""
> > +        constraints=""
> > +        match=""
> > +        mask=""
> > +        make=""
> > +
> > +        # All compressed instructions start with "c."
> > +        size=${compressed_name:+32};
> > +        size=${size:-16};
> > +
> > +        # Replace all . with _
> > +        formatted_inst_name=$name
> > +        while [ ! ${formatted_inst_name##*.*} ]; do
> > +            prefix=${formatted_inst_name%.*}
> > +            suffix=${formatted_inst_name##*.}
> > +            contains_dot=${formatted_inst_name##*.*}
> > +            formatted_inst_name=${contains_dot:-${prefix}_${suffix}}
> > +        done
> 
> Does the simplier
>      formatted_inst_name=$(echo $name | tr '.' '_')
> work?

That does work, but it dramatically slows down the time. I was trying to
avoid using external programs because this is called on every
compilation and there are a lot of instructions to parse. On my system,
it's about 10x slower to use echo/tr. Taking the time from about 150us
to 1.5ms for each iteration and the total time from around 0.8s to
around 3.5s.

> 
> > +            echo "static __always_inline ${type}${size} riscv_insn_${formatted_inst_name}_extract_${variable_name}(u${size} ${insn})"
> > +            echo "{"
> > +            echo "\treturn ${extract};"
> > +            echo "}"
> > +            echo "static __always_inline void riscv_insn_${formatted_inst_name}_insert_${variable_name}(u${size} *${insn}, ${type}32 ${var})"
> > +            echo "{"
> > +            echo "\t*_insn &= ${insert_mask# & };"
> 
> Why is this required? Isn't this part always zero at this point?
> 
> > +            echo "\t*_insn |= ${insert# | };"
> > +            echo "}"
> > +
> > +            if [ "${only_base}" ]; then
> > +                invalid_inst_functions="${invalid_inst_functions}static __always_inline ${type}${size} riscv_insn_${formatted_inst_name}_extract_${variable_name}(u${size} ${insn}) {\n\tpanic(\"${name} is not supported on non ${only_base}-bit systems.\");\n}\n"
> 
> Instead of panic(), can we do BUILD_BUG() instead?

That's a better solution :)

- Charlie

> 
> Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
