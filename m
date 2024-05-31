Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8928EC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 20:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4B0tqV7MWGBgMY0vOs9t2IS3DDRGmbxUTzB3BiD5yAk=; b=knLLXJjKB/UaTO
	4vSOjGPhyMKBN/l5aI7dEq6fdmxqrWVy6uZLrBj9ljzHafclbyGFtGeqYj3A8MgtrILF3F8xb19xr
	lihRaOjxq7UpFd7cg5Xb0xFoE+87xqta3anu6dLB+qOjfrxtcjx8F0rU47zsmXG3CW6BUqseMBYzS
	SLb9Qe9UrWSLGyUpFeodE91/z9LTgOwQNTtkWHDM5WllsaQ4K5HlqNfl/679+oAO8HNBcNsFDsi53
	dsEsBP/ePs6OXKaQKQgYZLyQMmQTyv/ZT6OjdddRHZL0N/HJCkANX3SMRKnCtBnJrN+Kkv2JB/8Yk
	xgQ0a2jTPnZB/LFHLdSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD8ih-0000000BMTJ-42pd;
	Fri, 31 May 2024 20:19:23 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD8ie-0000000BMSl-2qIF
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 20:19:22 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6f693306b7cso2194172b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717186758; x=1717791558; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qAGjhFHnXf9IpViW/yMwbiFI16GqjUPhP70I5dCooFE=;
        b=ugHEIJgUrtKqHek1iFfDYcAG2n7ShrFg5+2y3zE1GMGQHesyQAopKwI+8NEmu3ggwq
         gIZa/0M56SrVkzsO76ERVcD+5XhUjNdHwK3xTEXxps/y9MWLcSsCZQwDKXpL6F1OByRS
         WZGoCrU46FNBQt6AjOzzze45czSwDJK//a18neDAbgixykP4nznCYr/snKe9iZ71Q8OM
         6fQn0jIpag2kNRuiY4QFwm+DiAIFvvt/iflshIbN+8MU8PeTFvlIi1hwmUB5xa0hRr9j
         Af96hQYa2CmrTLWAj8CcQHaEPALwxMjQmAvFvC6XjmjJ+E3yOQV65JX1+khqFbyjT+6t
         ckNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717186758; x=1717791558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAGjhFHnXf9IpViW/yMwbiFI16GqjUPhP70I5dCooFE=;
        b=QP5zZNUvES4DDlt4AOIp0xEGFAGIihuNv6Ij+JYMZmF1R3qiaVlmEgn23+eEAkBGVn
         eIJesFfdEhGCWrFKSZYRT2x+0AWNRsLIAzEj6OiJl9vuBqT2A2gpygRPTnflCoN86VCO
         YDRF1cHNDDUupsCgAs5rVazCGWnga9p/28jKggAgl6P0UV/0W4LCICptBUDPvm5HJMBP
         2GRCSHb2HDxNMJFtw+4ECxgbO/ZoXnvSd3V5J1tB57QtF7VZTxQQ9ja+pJwuGxdRmW5b
         UZGyenh+/FWLS7/bjxHpcWi51P/rbxkQuCDgoCimCpMThaRj+r3o0dpPEiuuDTmWDUpk
         6dTg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ4C8O4gxmFq89UljCLGVvmAsiWP7oj1hcSJzkODyO772CG3CIzd1HubTBeh0gw29xXkbaQ6Ui16WHwe/iot/n0+kapR3cFjtEsLr+VbZL
X-Gm-Message-State: AOJu0Yx6nlr9XizocngbhDJHH7rlOAZi2csPyoyxaUf4+Gz6p8gh+dVM
	0WZaWjOr/GQxfSH1OMcRBCScbH4kdk8YWo500IPgltL19nqtuDHihFs6/uzpE8w=
X-Google-Smtp-Source: AGHT+IGVzy3+vOIUubWLHwauUWb5Skr6TuZH88CsARiNo0nv/hRvULtFg2uHbqI0Wo/CnlmesOhwIw==
X-Received: by 2002:a05:6a00:198d:b0:6f0:b53c:dfb4 with SMTP id d2e1a72fcca58-7024788e80bmr3955148b3a.22.1717186757959;
        Fri, 31 May 2024 13:19:17 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4d3b:392b:5722:91c1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242c245absm1745251b3a.200.2024.05.31.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 13:19:17 -0700 (PDT)
Date: Fri, 31 May 2024 13:19:14 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Message-ID: <ZlowwohstpT0sJVl@ghost>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531-uselessly-spied-262ecf44e694@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_131920_947474_9A2D3452 
X-CRM114-Status: GOOD (  29.46  )
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

On Fri, May 31, 2024 at 06:31:09PM +0100, Conor Dooley wrote:
> On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
> > Dectect the Zkr extension and use it to seed the kernel base address.
> > 
> > Detection of the extension can not be done in the typical fashion, as
> > this is very early in the boot process. Instead, add a trap handler
> > and run it to see if the extension is present.
> 
> You can't rely on the lack of a trap meaning that Zkr is present unless
> you know that the platform implements Ssstrict. The CSR with that number
> could do anything if not Ssstrict compliant, so this approach gets a
> nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
> it, so you're stuck with getting that information from firmware.

The Scalar Cryptography v1.0.1 spec says "If Zkr is not implemented, the
[s,u]seed bits must be hardwired to zero". It also says "Without the
corresponding access control bit set to 1, any attempted access to seed
from U, S, or HS modes will raise an illegal instruction exception."

There is a slight nuance here as the definition of Ssstrict is:

"No non-conforming extensions are present. Attempts to execute
unimplemented opcodes or access unimplemented CSRs in the standard or
reserved encoding spaces raises an illegal instruction exception that
results in a contained trap to the supervisor-mode trap handler."

The trap that Jesse is relying on in the code here is related to access
bits and not related to the CSR being unimplemented. Since the access
bits are required to be 0 on an implementation without Zkr, it is
required to trap if seed is accessed, regardless of Ssstrict.

The situation here is slightly odd because the spec is defining behavior
for what to do if the extension is not supported, and requires
implementations to follow this aspect of the Scalar Cryptography spec
even though they may not implement any of the instructions in the spec.

> 
> For DT systems, you can actually parse the DT in the pi, we do it to get
> the kaslr seed if present, so you can actually check for Zkr. With ACPI
> I have no idea how you can get that information, I amn't an ACPI-ist.

It is feasible to check if Zkr is present in the device tree at this
stage in boot, but at first glance does not seem feasible to read the
ACPI tables this early.

The CSR being read is just for entropy so even if the seed CSR doesn't
trap and provides an arbitrary value on an implementation that does not
support Zkr, it can still be used as a source of entropy. If the
implementation does trap, the entropy will be set to 0 which is just a
different hard-coded arbitrary value. 

- Charlie

> 
> Thanks,
> Conor.
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
