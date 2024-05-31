Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C043AC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 21:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBaAuxFofALrjkOkHG7pRfwhZL6MQFzA9kMGBbO7W1Y=; b=tjX6GSu8s9l9wm
	MBfGxNI3CxaPpKF5g0FBDEfaxdEPVySwiPavH3keVfYd1CLojDE/nwCieI/t06CXANYFaf+bE+gmN
	4KcxMwAevRGbDKifB9RfFdsyt5G1GTCRrIg2tUQhb63WFwl8x/5xFIcGEjuasGFCYLKQetz35U+Ea
	HmWFFekyZ2kAPcwTOHww6mLY7zDc70sGsJUVXJn/tmX6ZGy4j4LHN1Sxi8MZnumsRJ7qHmFLrEvmt
	Ld46TX5XK6oEHndul7zEpJZlNKfItHpQnFy4ga8E7giLmEtfyV2oXcPB3F2mshdQrjDtmZqg4bwMo
	azWDphHQOmKhvHmDjofQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9yv-0000000BWOS-1AMu;
	Fri, 31 May 2024 21:40:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD9yr-0000000BWM9-2ehT
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 21:40:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f44b5b9de6so11482635ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717191608; x=1717796408; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CbxzTHPbCC9+OSlgnBZBAHLV896CAURuJytC4yPNa7k=;
        b=UMkm1gCgQtBoWHXaDx/hpTnHs/eoPKVAoJoworZdB4lNrSqLtENRJZOq4u9LpCCkEN
         CJIUHIMzBR5XfXRUh1GbOqhjk9Wz1UXfb1dFXzJxv5nsrUrS0pP7rVuIbUr2jfow1h8q
         Omr5t1b2jlWnqggsyaYlWLiWZCGAzEShF5iTIBG9SnqVmqNtzVGzzxjo+uA7g6RN3eQA
         dQzm2QJOv3k0OWzt8yGt+movWHV/d+JChwOdsO3iHPgyGrYfMDjsT3Ix+ure38q7/xAb
         VgykymigCW9cnkrp0YU6oseEIc56tyJ2WXjLZGLIrTs2EAo6HNUJoDIlUAAxSeL1FDRA
         T6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717191608; x=1717796408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbxzTHPbCC9+OSlgnBZBAHLV896CAURuJytC4yPNa7k=;
        b=UH7hVEEw534ZC/GO25R7IkDLLZsCTzj0zJdMRCHdChLdNwrhif+jvW72P+x+zBI3OU
         rEvaR4IrcO9sYCNyU9UglcUI0wMBQI+tHLts8gJ468e/Sr5K403wv4dnI3SCg4eeUcJs
         h2D+DuAYab/lzjDtr4u+haBF7CeJCkUpMXNP4NmZqQLBJPrxSzySso6odLWeuzUKvEk0
         s6jmXjjV/vqOIqiETZqpK97tUoqsJ85WZx6qrlzwBElRyEFB4bgY0rh87jMW5l6dAO9k
         z77tiXY6MJ2unM6Ff0L1O1xYFyeZIARRmyhNWGz7LQFzd+zmq6zSKkQI00Wrh3DcYGYb
         +ENA==
X-Forwarded-Encrypted: i=1; AJvYcCVRObq8X4d/rLvxWxnG7gn0g+OhetC0LIQHQw44P16MVIlLIASy2kHiamYr4+n3hrL7iWWX0GL/bG3g4NbX9gp0PURZAzh3lVfOFLeVtJoU
X-Gm-Message-State: AOJu0Yzsf5CC1zla+yBiakIeox1hj2kCJFL8w+ReF8aT4aBfX6CYYdtD
	90AZGubFUMUAVHiMfnScOn0N1wu3BGqZ0AnxKq9EowQWVG+bQ4N8Iy2uty97ZjI=
X-Google-Smtp-Source: AGHT+IH2kNxy+DP2BxFop3mrfOTKvOonyr2h+6QlVJwdZ5WJPUZsjyyTJNbm91WWm+wlyt9/NWx0sA==
X-Received: by 2002:a17:902:f9ce:b0:1f4:b7ff:ac41 with SMTP id d9443c01a7336-1f63701f241mr26562825ad.36.1717191608125;
        Fri, 31 May 2024 14:40:08 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:4d3b:392b:5722:91c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63235ae5csm21720615ad.79.2024.05.31.14.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 14:40:07 -0700 (PDT)
Date: Fri, 31 May 2024 14:40:05 -0700
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
Message-ID: <ZlpDtR7ch+nE08lm@ghost>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <ZlowwohstpT0sJVl@ghost>
 <20240531-cough-yearling-bdfd49244885@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240531-cough-yearling-bdfd49244885@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_144009_801393_D517EA1F 
X-CRM114-Status: GOOD (  48.70  )
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

On Fri, May 31, 2024 at 10:36:46PM +0100, Conor Dooley wrote:
> On Fri, May 31, 2024 at 01:19:14PM -0700, Charlie Jenkins wrote:
> > On Fri, May 31, 2024 at 06:31:09PM +0100, Conor Dooley wrote:
> > > On Fri, May 31, 2024 at 12:23:27PM -0400, Jesse Taube wrote:
> > > > Dectect the Zkr extension and use it to seed the kernel base address.
> > > > 
> > > > Detection of the extension can not be done in the typical fashion, as
> > > > this is very early in the boot process. Instead, add a trap handler
> > > > and run it to see if the extension is present.
> > > 
> > > You can't rely on the lack of a trap meaning that Zkr is present unless
> > > you know that the platform implements Ssstrict. The CSR with that number
> > > could do anything if not Ssstrict compliant, so this approach gets a
> > > nak from me. Unfortunately, Ssstrict doesn't provide a way to detect
> > > it, so you're stuck with getting that information from firmware.
> > 
> > The Scalar Cryptography v1.0.1 spec says "If Zkr is not implemented, the
> > [s,u]seed bits must be hardwired to zero". It also says "Without the
> > corresponding access control bit set to 1, any attempted access to seed
> > from U, S, or HS modes will raise an illegal instruction exception."
> > 
> > There is a slight nuance here as the definition of Ssstrict is:
> > 
> > "No non-conforming extensions are present. Attempts to execute
> > unimplemented opcodes or access unimplemented CSRs in the standard or
> > reserved encoding spaces raises an illegal instruction exception that
> > results in a contained trap to the supervisor-mode trap handler."
> > 
> > The trap that Jesse is relying on in the code here is related to access
> > bits and not related to the CSR being unimplemented. Since the access
> > bits are required to be 0 on an implementation without Zkr, it is
> > required to trap if seed is accessed, regardless of Ssstrict.
> > 
> > The situation here is slightly odd because the spec is defining behavior
> > for what to do if the extension is not supported, and requires
> > implementations to follow this aspect of the Scalar Cryptography spec
> > even though they may not implement any of the instructions in the spec.
> 
> Firstly, you absolutely cannot rely on the behaviour defined by a new
> extension by systems that implement a version of the ISA that predates
> it. Secondly, we're talking about non-conforming implementations that
> use a reserved CSR number for other purposes, you cannot rely on the
> behaviour that the Scalar Crypto spec prescribes for access to the
> register.

Yes that is definitely a slippery slope.

> 
> "Non-conforming" is also a moving target btw - the Andes PMU (I think
> it's that) uses an interrupt number that was moved from "platform
> specific use" to "reserved" by the AIA spec. If you only looked the
> current specs, the Andes PMU is a "non-conforming extension" but at the
> time that it was created it was compliant. I think we're gonna have a
> fun conversation defining what "Ssstrict" actually means when someone
> actually tries to document that.

Sounds fun ;)

> 
> > > For DT systems, you can actually parse the DT in the pi, we do it to get
> > > the kaslr seed if present, so you can actually check for Zkr. With ACPI
> > > I have no idea how you can get that information, I amn't an ACPI-ist.
> > 
> > It is feasible to check if Zkr is present in the device tree at this
> > stage in boot, but at first glance does not seem feasible to read the
> > ACPI tables this early.
> > 
> > The CSR being read is just for entropy so even if the seed CSR doesn't
> > trap and provides an arbitrary value on an implementation that does not
> > support Zkr, it can still be used as a source of entropy. If the
> > implementation does trap, the entropy will be set to 0 which is just a
> > different hard-coded arbitrary value. 
> 
> Right. I can see value in doing something that may contain entropy, and
> is at worst no better than the 0 we can currently get. But the patch
> we're talking about here mentions nothing of the sort, it presents itself
> as detection of Zkr and an actually random number - but all it actually
> detects is whether or not the CSR at CSR_SEED traps.
> 
> To be acceptable, the patch would need to stop claiming that it is a valid
> way to detect Zkr. The commit message, and a comment, must also explain
> what may happen on systems that do not implement Zkr as you have done
> here.
> For example, `if (!riscv_has_zkr()) return 0` would have to be something
> like `if (riscv_csr_seed_traps()) return 0`.

That is reasonable, thank you for your input!

- Charlie

> 
> Thanks,
> Conor.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
