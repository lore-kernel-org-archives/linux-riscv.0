Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03B1C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPFWEU9KND9chj3SX9DpOfAE8O5yXwzcyzNYXMTIyEM=; b=DVaUJ7JXJS57A5
	Nrgqm8ylyvNM0/4Nt/h3dd1apx1K7HPPG/dzQme4JsPdbGuuRLR2JFz7lgAyYguAg5QQaJoMrjOJz
	13bIvQGJeQ2oFCU6GnwkorCcEEc1iRovtt6HXsr29QAFzbyzD9bD1a+hFBWXN8Yi9VsWk2cLb/YNo
	h9YA5stvUDkCad5mO2ka2B3Qo156rdN4JEYYngRxEp+7GTOnnw7zbpQ50/PH/pL3sFYT4R6pT84KD
	9zq0rw6r800hvOMvd+6ITQpIKhFpUmpAn0P+KelIj3sDIrzQrDMT0goXAdwRv6LU0cMnD6UruKsrv
	r6CYA6AU/QnUsDaBFb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0m4s-008ROn-Ee; Thu, 01 Dec 2022 16:06:22 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0m4o-008RNn-VD
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 16:06:21 +0000
Received: by mail-ej1-x631.google.com with SMTP id td2so5311767ejc.5
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 08:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYBwCxPIEcs552vI5UUgZomjgzDegtvXtPee6cS3tDA=;
        b=fdFARI3cqK84YH3bkQCGvztt5qIJXxdPXyik0OrZivYlSt/afoDQ2jDWxsbkRLAlBi
         oGYJ/dZDPYOHFEv1feoBUbskALUEd7ZmqiwLazsDIugtGmNSuAwpHWthtmgbralE4A7B
         zf2JwVte3yBVEvYDRv7TvbOj8/0DpMjWvttzV+d1l8D1mpz7dDai0ktRukUrTRqgMtrm
         /g6ed+eiMRPwqzmDhsjAghhSPvE+YGa+9tZuV8kNt1frs5SG4CZpjxR5PmDvbXadDMqt
         Ar6yrLho5Zm2Kuxp6e1l3JuhSGdkQVPJRvhNG+wzg0sa0PXNbN6mRR9ongoL1GLiZXBz
         Ge/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYBwCxPIEcs552vI5UUgZomjgzDegtvXtPee6cS3tDA=;
        b=7R5m49tmX/EwJ0fF0U6pGrM9RxRA9I5EI3pvia8zbw92L9UvU5RQr8wPhPexyQYwwX
         BRT9XxHi4n3kL6RqZI4lGdYIS/o/uQ4gwb5nl7UGvH09Hbhx+naDYvCzltkRgAmDoyv1
         9O6df02eEF+x7Pg+NXFQnHzaxiXT/11WI97AiF/DFU0x71Ow3aJ85rygKPG+yuXvqrhE
         Kd6t8FoKYTrY5B06KGe/8Xb5cCDNAL0dGI5hW6nwZZ0NNX20hoTvxenb8KW2K/7eUlIo
         7K20hjbgyBUOFwqj5Cm+RbIAo92p0leb7xhb4xtqUz2LjSKHiML7DfcQai6cvHMDwMSQ
         /KaA==
X-Gm-Message-State: ANoB5pmolghcitwzCPsNkvzc63Ij+y99qHHO4oUSgIeN/Fw+GF96eg+L
	0enE8PzaZWSce9VtLbmbLfeUXMDNWYJSPw==
X-Google-Smtp-Source: AA0mqf73kSy7zxJKs8vJDXnMeacKA8ZPYPCMycCkgVxlECM3LzBFAWydeFjzSlP5qOHO4hJxmmbhBQ==
X-Received: by 2002:a17:906:6d7:b0:781:951:2fb with SMTP id v23-20020a17090606d700b00781095102fbmr56834635ejb.64.1669910776395;
        Thu, 01 Dec 2022 08:06:16 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id gf16-20020a170906e21000b007815ca7ae57sm1903807ejb.212.2022.12.01.08.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 08:06:16 -0800 (PST)
Date: Thu, 1 Dec 2022 17:06:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/5] RISC-V Hardware Probing User Interface
Message-ID: <20221201160614.xpomlqq2fzpzfmcm@kamzik>
References: <20221013163551.6775-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221013163551.6775-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_080619_028296_609FED5F 
X-CRM114-Status: GOOD (  38.50  )
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

On Thu, Oct 13, 2022 at 09:35:46AM -0700, Palmer Dabbelt wrote:
> These are very much up for discussion, as it's a pretty big new user
> interface and it's quite a bit different from how we've historically
> done things: this isn't just providing an ISA string to userspace, this
> has its own format for providing information to userspace.
> 
> There's been a bunch of off-list discussions about this, including at
> Plumbers.  The original plan was to do something involving providing an
> ISA string to userspace, but ISA strings just aren't sufficient for a
> stable ABI any more: in order to parse an ISA string users need the
> version of the specifications that the string is written to, the version
> of each extension (sometimes at a finer granularity than the RISC-V
> releases/versions encode), and the expected use case for the ISA string
> (ie, is it a U-mode or M-mode string).  That's a lot of complexity to
> try and keep ABI compatible and it's probably going to continue to grow,
> as even if there's no more complexity in the specifications we'll have
> to deal with the various ISA string parsing oddities that end up all
> over userspace.
> 
> Instead this patch set takes a very different approach and provides a se
> of key/value pairs that encode various bits about the system.  The big
> advantage here is that we can clearly define what these mean so we can
> ensure ABI stability, but it also allows us to encode information that's
> unlikely to ever appear in an ISA string (see the misaligned access
> performance, for example).  The resulting interface looks a lot like
> what arm64 and x86 do, and will hopefully fit well into something like
> ACPI in the future.
> 
> The actual user interface is a syscall.  I'm not really sure that's the
> right way to go about this, but it makes for flexible prototying.
> Various other approaches have been talked about like making HWCAP2 a
> pointer, having a VDSO routine, or exposing this via sysfs. 

Hi Palmer,

To throw my two cents into the penny jar, I'd vote for sysfs. It handles
the heterogeneous CPU case since cpu feature nodes can be hung off each
cpu node. It also avoids yet another encoding. If we enumerate extensions
and their properties then we need to maintain that enumeration in both
the kernel space and userspace. If, OTOH, we use sysfs node names for
the encoding, then, when we match the spec naming exactly, e.g.

 .../features/zicbom
 .../features/zihintpause
 .../features/sscofpmf

userspace can look for features by name. Userspace libraries can even
lead the kernel in development, since the encoding (the spec name) is
already agreed.

Properties of extensions are just sub-nodes, some with standard names,
like

 .../features/zicbom/major
 .../features/zicbom/minor

and others, which are cpu feature specific, like

 .../features/zicbom/block_size

I used 'features' in the above examples for the node name, rather than
'isa', since not all features map to isa extensions, but it should be
possible to fit non-isa features into the same framework.

Thanks,
drew


> Those seem
> like generally reasonable approaches, but I've yet to figure out a way
> to get the general case working without a syscall as that's the only way
> I've come up with to deal with the heterogenous CPU case.  Happy to hear
> if someone has a better idea, though, as I don't really want to add a
> syscall if we can avoid it.
> 
> I threw this together during the conferences so I would be surprised if
> it's not broken, but I figured it'd be best to just get something on the
> lists sooner rather that later.  Happy to have someone go fix my code,
> but the new uABI is really going to be the tricky bit here.  There's
> some test code included, but I haven't even booted a kernel with these
> patches so YMMV.
> 
> These are also up at kernel.org/palmer/linux/riscv-hwprobe-v1 in case
> that's easier for folks.
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
