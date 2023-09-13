Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6C0EEB57B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 03:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0B/E7bHR8r7G0yUL6sQsuxbTRmjpnWvqgy921Jf97Mw=; b=xY0STQGvw9cwfy
	VFmn9UOMzInLydzfk70Hvi3ASOQlWOy62jpEamytZ6eedvFVYSvmXtqz4beZ+wAf/h8NQNKH4m2aA
	gi4f7DvC6dfmcfvMqy4DCZxdXouqbT6myxQgFvl+KAP1Lnk28DecXjIe18AknJTKCcvUufrOD8LtK
	4D72XwSkYG8rr1kzeGA54CBGW3cqfDBEJ/TCiuMgseaPKHOk2lJ5v4X7TU644XEP8LnQx8t/igXtb
	vgBeLDtP25i32ir2oTJJncRX9GRDHMa+axKGYAs2HTWtDBKLbE8wX08tlvO4FDnIvyv6oxdM50/26
	Lgn60H/7Oyjkxhd9TA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgGGJ-004TmE-36;
	Wed, 13 Sep 2023 03:09:55 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgGGH-004TlY-0H
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 03:09:54 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-26fc9e49859so5074265a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 20:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694574591; x=1695179391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Pf7pTuUGrfS3QfAFTCC6m/hHffMqkAAMnuVf+s/49s=;
        b=W4sh0Rngebg8Q/J4UZ4BPQonXXBgPSmkOT9EAPCU4UIcqkBtnJu/3rJ0BbZ9/4YxVN
         Qk27Rnznc4rOI+VdYOgMm7y2YUcErLqPcWJtkcnbPHofv89ZOnbYzW+H43PwMgEuHaTd
         mqGcoa6v8xRneEovJ/v6Q3mHcXGXRt7qMQ50MEtbV0E7tuNrQ2X0KtgjEcd1G3BKYCc9
         hWj3E8/4sSFdLWEFvfJ7xQ6caykhF2VvPLGPUXAmZHiX9uw45Hr4dPStN1Iu8yAe1UR9
         e7p1lfELzrrOTqq/gwHoMgiTk5my7Ow9F8TrT6+mFs7KH3h/rwc9Wh5WAr2pQkkSEBVd
         JiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694574591; x=1695179391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Pf7pTuUGrfS3QfAFTCC6m/hHffMqkAAMnuVf+s/49s=;
        b=HU+kSp8eLhqPZmnXNCJNFsDcmC7+pEYK3fXLsa1MiGlue8Jta8O7+DKyUZsa5n43lY
         U1RO9VBOON5oMkKXeQv4sjIS2OLWXic5u5W0nnwcT1HNS1kw6Ftc+5bf0QdUbh8xCQRo
         MnxcCljkClyT9nTTbKE+56ImVw1a8rdCv7IUwTYvZKatJ68yorbvkdRp3gGR79yMz2p0
         V6AyLzErjCAHkMl/bGt68qiOmFam8PrzQM5HJPxUxWtNEtEfnFkfUH5+80gOdINrYOhu
         Yq8yuyCCXDo16WOXO3d1i0RldTZJaZsKJB/iYIFAo0nTCwnUVJ2MMoo27qYg03g4BJzd
         rkSA==
X-Gm-Message-State: AOJu0Yz0zVSIrERsbV8BBONiwRvoirVbqeEd2Vh3UvX54rus6K3N3x4p
	BGDXMpq3/W/51U5qHUccPWG5sed/my3Q/pZmdT4=
X-Google-Smtp-Source: AGHT+IFHQ29VVzv/3z2zxjYAkgPTTSd7MOKanaKnrXStCrAsFSBQwNstzkKsyq5oK02IXkEjSYHhKA==
X-Received: by 2002:a17:90a:668f:b0:274:1f99:290 with SMTP id m15-20020a17090a668f00b002741f990290mr986168pjj.34.1694574591042;
        Tue, 12 Sep 2023 20:09:51 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id fv23-20020a17090b0e9700b002740e66851asm333095pjb.35.2023.09.12.20.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 20:09:50 -0700 (PDT)
Date: Tue, 12 Sep 2023 20:09:47 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: David Laight <David.Laight@aculab.com>
Subject: Re: [PATCH v4 2/5] riscv: Add checksum library
Message-ID: <ZQEn+8Bi8dxNgg3g@ghost>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-2-77cc2ad9e9d7@rivosinc.com>
 <1818c4114b0e4144a9df21f235984840@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1818c4114b0e4144a9df21f235984840@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_200953_131566_68FF47BB 
X-CRM114-Status: GOOD (  30.69  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 12, 2023 at 08:45:38AM +0000, David Laight wrote:
> From: Charlie Jenkins
> > Sent: 11 September 2023 23:57
> > 
> > Provide a 32 and 64 bit version of do_csum. When compiled for 32-bit
> > will load from the buffer in groups of 32 bits, and when compiled for
> > 64-bit will load in groups of 64 bits. Benchmarking by proxy compiling
> > csum_ipv6_magic (64-bit version) for an x86 chip as well as running
> > the riscv generated code in QEMU, discovered that summing in a
> > tree-like structure is about 4% faster than doing 64-bit reads.
> > 
> ...
> > +	sum   = saddr->s6_addr32[0];
> > +	sum  += saddr->s6_addr32[1];
> > +	sum1  = saddr->s6_addr32[2];
> > +	sum1 += saddr->s6_addr32[3];
> > +
> > +	sum2  = daddr->s6_addr32[0];
> > +	sum2 += daddr->s6_addr32[1];
> > +	sum3  = daddr->s6_addr32[2];
> > +	sum3 += daddr->s6_addr32[3];
> > +
> > +	sum4  = csum;
> > +	sum4 += ulen;
> > +	sum4 += uproto;
> > +
> > +	sum  += sum1;
> > +	sum2 += sum3;
> > +
> > +	sum += sum2;
> > +	sum += sum4;
> 
> Have you got gcc to compile that as-is?
> 
> Whenever I've tried to get a 'tree add' compiled so that the
> early adds can be executed in parallel gcc always pessimises
> it to a linear sequence of adds.
> 
> But I agree that adding 32bit values to a 64bit register
> may be no slower than trying to do an 'add carry' sequence
> that is guaranteed to only do one add/clock.
> (And on Intel cpu from core-2 until IIRC Haswell adc took 2 clocks!)
> 
> IIRC RISCV doesn't have a carry flag, so the adc sequence
> is hard - probably takes two extra instructions per value.
> Although with parallel execute it may not matter.
> Consider:
> 	val = buf[offset];
> 	sum += val;
> 	carry += sum < val;
> 	val = buf[offset1];
> 	sum += val;
> 	...
> the compare and 'carry +=' can be executed at the same time
> as the following two instructions.
> You do then a final sum += carry; sum += sum < carry;
> 
> Assuming all instructions are 1 clock and any read delays
> get filled with other instructions (by source or hardware
> instruction re-ordering) even without parallel execute
> that is 4 clocks for 64 bits, which is much the same as the
> 2 clocks for 32 bits.
> 
> Remember that all the 32bit values can summed first as
> they won't overflow.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
Yeah it does seem like the tree-add does just do a linear add. All three
of them were pretty much the same on riscv so I used the version that
did best on x86 with the knowledge that my QEMU setup does not
accurately represent real hardware.

I don't quite understand how doing the carry in the middle of each
stage, even though it can be executed at the same time, would be faster
than just doing a single overflow check at the end. I can just revert
back to the non-tree add version since there is no improvement on riscv.
I can also revert back to the default version that uses carry += sum < val
as well.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
