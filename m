Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5E1C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyvDBr842nBrRRHb/Qlpw4jErKmp89QPl07grwC8eys=; b=aKEdRjcYvrmsY9
	HD0kR51Um7vkOsvNWap/Vh1+zpned/B55/QdbMML5Yzcqlk7kBlOKgWHj+0722fcIlSrAGT7A8Krm
	FCZCKULkwqjmSEbY4E+OesQTDU0+vSxaggRx2+MHvAvD3jNtkbf1TNL1HtptX52p06B7AWfWnqUlX
	r9Zk/dl/DZHej+cuwpbndJFsQ5mJHTRgMRUP9gKqL5XA/YE8vxc9nNXTv1oPJihU+W8MCwmY63he6
	dCxVhQMzfiYAMP5Bra17n5aE3BVsj5sqedI6k2W+vFtbOE81/kgEfGl7Yaq5u9plGizMbSkjaXfTs
	Kgv6gvo9673v9ldGH6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58NG-002zuk-56; Tue, 13 Dec 2022 16:43:22 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p58ND-002zsr-5d
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 16:43:21 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id u10so10792990qvp.4
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 08:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluespec-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OwYkkGOZrIudiCQIBSUvcv40gkAuqrBjpEeTE4vLA8=;
        b=dMTrfA2yVrybtIk5Dhf1PFQXlNiXZTTYzkF1Ot7tljDpRTmKBANsrcLl+EcUFuhpWe
         EaENf/vhiy9pN4IH9Gyil6kpOWjUw2I0aPTkzE5oj4SmROXik+8NH6Mp6JbimIDTr7Zh
         /7dY/EleRNS5+06Fn/EXE1xipXNG2uTnkU2iSxyKDUmN2k6x77NyvXy5F3qfcmf+KXNj
         kxia+3jFrxvlRNYM2/MX9/jF9PY39AiUTLkIUsAP3k4q3sFo36MrGvWNsyhlGsf5MMnY
         Op4y95xX/grlIbDOgFGVKSD4BtDPG+CoGOh84yXvuh0m1ThTWJSOg2TA4dI+DrcjkiTV
         XIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OwYkkGOZrIudiCQIBSUvcv40gkAuqrBjpEeTE4vLA8=;
        b=pp4buTCJbqQhrTRm2luQTXMyCbEPRh7trgYlI+b6zZ1D/D/2FmSrCppQLuy2kBUC1C
         w/Kx1VGfZGC/vIAQWiVj03o4SBXRO+3m/0ELqQvBIlBpjoYeujV85Tn9FDzFhc8jL08y
         8e9BDPxYVyEpxx7tYnXlSjatvjg08r2ROFQl/wWFzQ5bqhMX6Qs17XThdnxjcTLFlelO
         wYWuEJsTb8xYIzuKllUf+wGYt7Z5hYAWGJM1A9uOYawf+X4qte5Uv7ER1y2IoGN33jfX
         i0ygI49X95005H0MuC6NdqXBSQvEm48tzWwL89ya22LYjGTqeIWSNTPmOKqNvy608NIw
         7NrA==
X-Gm-Message-State: ANoB5plPje0Mqwx291JSoy1gPwgfF+Cm845mdHwlEtWVYcp54+s4j9HP
	nj6SZ6YgPqLgv3wZS4lAxU8k
X-Google-Smtp-Source: AA0mqf603YEue3EXF8qlyILlT/0qEnn/IPhWuaayQS3EcmXydtBkWYQgQAYWkPwL22oID/nc4+O1Mw==
X-Received: by 2002:a0c:fc0f:0:b0:4c7:1d69:5533 with SMTP id z15-20020a0cfc0f000000b004c71d695533mr24885733qvo.34.1670949796382;
        Tue, 13 Dec 2022 08:43:16 -0800 (PST)
Received: from bruce.bluespec.com ([38.70.11.69])
        by smtp.gmail.com with ESMTPSA id d6-20020a05620a240600b006fcb4e01345sm8365089qkn.24.2022.12.13.08.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 08:43:15 -0800 (PST)
Date: Tue, 13 Dec 2022 11:43:11 -0500
From: Darius Rad <darius@bluespec.com>
To: Vineet Gupta <vineetg@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, fweimer@redhat.com,
	Andrew Waterman <andrew@sifive.com>, stillson@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
	atishp@atishpatra.org, guoren@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
	vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	bjorn@kernel.org, libc-alpha@sourceware.org,
	christoph.muellner@vrull.eu, Aaron Durbin <adurbin@rivosinc.com>,
	linux@rivosinc.com
Subject: Re: RISCV Vector unit disabled by default for new task (was Re:
 [PATCH v12 17/17] riscv: prctl to enable vector commands)
Message-ID: <Y5irn63DQkwumfvW@bruce.bluespec.com>
Mail-Followup-To: Vineet Gupta <vineetg@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, fweimer@redhat.com,
	Andrew Waterman <andrew@sifive.com>, stillson@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
	atishp@atishpatra.org, guoren@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, greentime.hu@sifive.com,
	vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	bjorn@kernel.org, libc-alpha@sourceware.org,
	christoph.muellner@vrull.eu, Aaron Durbin <adurbin@rivosinc.com>,
	linux@rivosinc.com
References: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
 <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9cf13a9-561a-3438-00f0-41fe2631888d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_084319_432834_2158B91D 
X-CRM114-Status: GOOD (  22.86  )
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

On Fri, Dec 09, 2022 at 11:42:19AM -0800, Vineet Gupta wrote:
> 
> But keeping the V unit disabled by default and using prctl as a gatekeeper
> to enable it feels unnecessary and tedious.
> Here's my reasoning below (I'm collating comments from prior msgs as well).

Please reference the previous discussion [1] which has covered topics that
have not been discussed recently.

[1] https://lists.infradead.org/pipermail/linux-riscv/2021-September/thread.html#8361

> 
> 1. Doesn't it add another userspace ABI which is already a headache for this
> feature. And that needs to be built into not just libc but potentially other
> runtimes too. Even after implemention there will be an interim pain as the
> new prctl takes time to trickle down into tooling and headers. Besides the
> new stuff will never be compatible with older kernel but that is a minor
> point since older kernel not supporting V is a deal breaker anyways.
> 

None of this is relevant because there is no existing user space ABI for
vector.  It is being invented now.  If this is done poorly, for example, by
missing this opportunity to add a mechanism for user space to request use
of the vector extension, it will be much more painful to add later.

> 2. People want the prctl gatekeeping for ability to gracefully handle memory
> allocation failure for the extra V-state within kernel. But that is only
> additional 4K (for typical 128 wide V regs) per task. 

But vector state scales up to as much as 256k.  Are you suggesting that
there is no possibility that future systems would support more than
VLEN=128?

> If that is failing,
> the system is not doing well anyways. Besides it is not an issue at all
> since ENOMEM in clone/execve for the additional space should handle the
> failure anyways. Only very sophisticated apps would downgrade from executing
> V to Scalar code if the prctl failed.  

This seems unlikely.  As vector support does not exist in any present
hardware, and the vector extension is only optional in the RISC-V profiles
that include it, I would think that it is almost certain that any
application that supports V would have a fallback path for when the V
extension is not available.


Another motivation for requiring that user space request use of the vector
extension is that the vector unit may be shared between multiple harts
and/or have power or performance implications in the system.  By requiring
that user space request access, it allows the system to decline that
access, and user space can handle this gracefully.

If we add a mechanism for user space to request access to the vector
extension, and it turns out that it was unnecessary, the worst that has
happened is a slight inconvenience.

If we do not add such a mechanism, and later determine that it is
necessary, we have a much greater problem.  There would be backward
compatibility issues with the ABI, and such a mechanism could probably not
be fully implemented at all due to the desire to support potential future
legacy vector code.

This is a similar problem on x86.  According to some, it was handled poorly
with AVX-512 by missing this type of mechanism, and improved with AMX [2].
There is opportunity to learn from that experience and do things better on
RISC-V.

[2] https://lore.kernel.org/lkml/87k0ntazyn.ffs@nanos.tec.linutronix.de/


// darius


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
