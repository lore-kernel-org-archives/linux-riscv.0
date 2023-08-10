Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97595C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 14:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYqgA62bHDDzQ0FFLuaAKnsZUOgY6WTfkusF4okDTXQ=; b=xuWkA4c0WnLljg
	WEYs1juGL2ii4oPxTtAq+34U8fslDW1coEdWFcxI2rOuC80zHCta9+r/YmRDlNkY11cEPQKf83T2X
	kLSlmrEhpnw+ezT141FP+jl6vRriWwHM48TarCSyy+dKR7zXZ6PV6QmGRV3ayez+vqh2/kvurviJc
	dHFY54eEPcAqGqzBSdG4CteQRI2aogDLyun0IKgm6tzuUw/LOd5wnAn6eW+jDmtY+OR+PavJtujT4
	ISHDmM7KjJbHYn8/YBjFgSAqig2UeeGF0LJR2wIYxBX8Yj43kDcXTjFhyxTVwpC8Lr0g2zQCg9MMN
	/609E3Wze0Wdeo3FO8FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU6IQ-007oox-02;
	Thu, 10 Aug 2023 14:05:50 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU6IN-007ooZ-0r
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 14:05:48 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686b91c2744so692917b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 07:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691676344; x=1692281144;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIsU3d7vmijTPeTT3Epz86AgfuKg0p94VZmPUlywxxM=;
        b=Rlc3LrSl+ERXDW7AF9t/KBIpyH2iv9eHglTAU/FIsSsjjBcL9oSCQP7puQ99VgytmC
         IE20ByfVP/FVZuGWwvhes7Tk6WYO/xdPOjLEFCLTwTCML45xnFNXsap4MzpzeNPA4gO1
         izh1+ey4yRVIzm1VBCXHjuwvbZY5F0XQYCy5W40m25LZWa/CyYpY63ZPwQyiZlYW3vqi
         A05usNWi2J0cfPzewEVIRF5vZ55qnFRnZQaxxfe0ynN3sE+mXBZnCjdDxYAFGKjvJKyM
         vNCGRbc0pnsf7zLPeadnvvjSQUXmjDVCXSREqmGL3upQE9L1rbhFLKRyKMDj+bB4eVUM
         +rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691676344; x=1692281144;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIsU3d7vmijTPeTT3Epz86AgfuKg0p94VZmPUlywxxM=;
        b=TCqvrAqA1mUlJxCUe31BlqlwH/lnVzhLpwexg9rb2bGUHv3mrdicVD/CMVsHIKDFcA
         YAR02VwfWPJ9P9CQ3OXeDRkZv2x2wyRT/uhNnjvL8xa4PTBYerltvrgI4tASCBOOPvdb
         +oOpiwiTzlhGfMDCUH4P8tLPF6BcxI6UXLMqx1V1Xkj0I8uWC6iKON+z3HwilLDw9s5u
         ra5nLuMzErE4R5HhFVEXJPFd8oww8ZxosHeQRS3uhUFrJSrzM+IEcIgvaE4TcTdLAjkV
         kChiKzj35G5E2PVdz7d4G3Wq6nLP3Uo4qHX0Q/ahgrXDkJrGZ1TocHuIhU6HCOVv3fRF
         6Zrg==
X-Gm-Message-State: AOJu0YzMy+e0qMl1Kj3TpQPQ5yJglZ8gB6zDbQ1pe0YbT1IN1JJEnjYB
	KDFmn0uAXBtlNx92mVZxx2sYXx6yP/1g5lyc6qk=
X-Google-Smtp-Source: AGHT+IERY+VbQug14lhH/G+mh1VF2aN1ffmsXV5Dx3xILDNZoIQaN1nMBKQheNN/yBYvqVKPwW/kiQ==
X-Received: by 2002:a05:6a20:7fa8:b0:134:40f0:5d04 with SMTP id d40-20020a056a207fa800b0013440f05d04mr3222332pzj.13.1691676343838;
        Thu, 10 Aug 2023 07:05:43 -0700 (PDT)
Received: from hsinchu26 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id fm26-20020a056a002f9a00b0064928cb5f03sm1562130pfb.69.2023.08.10.07.05.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 07:05:42 -0700 (PDT)
Date: Thu, 10 Aug 2023 14:05:38 +0000
From: Andy Chiu <andy.chiu@sifive.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Savin <greg.savin@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	linux-riscv@lists.infradead.org, gdb-patches@sourceware.org,
	Andrew Burgess <andrew.burgess@embecosm.com>
Subject: Re: [PATCH] RISC-V: support for vector register accesses via
 ptrace() in RISC-V Linux native
Message-ID: <20230810140537.GA17787@hsinchu26>
References: <20230803230110.904724-1-greg.savin@sifive.com>
 <alpine.DEB.2.21.2308091008500.25915@angie.orcam.me.uk>
 <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com>
 <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk>
 <20230810103510.GA2509@hsinchu26>
 <alpine.DEB.2.21.2308101231560.25915@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2308101231560.25915@angie.orcam.me.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_070547_377679_DF4C6316 
X-CRM114-Status: GOOD (  41.38  )
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

Hi Maciej,

On Thu, Aug 10, 2023 at 12:40:12PM +0100, Maciej W. Rozycki wrote:
> On Thu, 10 Aug 2023, Andy Chiu wrote:
> 
> > > > The SIGILL guard is being used as a wrapper around determination of the
> > > > VLENB CSR, which is not part of the ptrace() payload for vector registers,
> > > > at least as it exists at head-of-tree Linux kernel.   GDB or gdbserver
> > > > needs to know VLENB in order to construct the architectural feature
> > > > metadata that reports an accurate width for the vector registers.  If not
> > > > for the VLENB determination specifically, and the lack of this information
> > > > via ptrace(), then there would be no motivation for executing a vector
> > > > instruction directly.  It's a workaround, basically.  I guess I could
> > > > inquire in Linux kernel land regarding whether the NT_RISCV_VECTOR ptrace()
> > > > payload could be enhanced to provide VLENB.
> > > 
> > >  I think the kernel interface needs to be clarified first, before we can 
> > > proceed with the tools side.
> > > 
> > >  I can see the vector state is carried in a REGSET_V regset, which in turn 
> > > corresponds to an NT_RISCV_VECTOR core file note.  I can see that besides 
> > > the vector data registers only the VSTART, VL, VTYPE, and VCSR vector CSRs
> > > are provided in that regset, and that vector data registers are assigned 
> > > a contiguous space of (32 * RISCV_MAX_VLENB) bytes rather than individual 
> > > slots.
> > > 
> > >  So how are we supposed to determine the width of the vector registers 
> > > recorded in a core file?  I'd say the RISC-V/Linux kernel regset API is 
> > > incomplete.
> > 
> > Does it make sense to you if we encapsulate this with a hwprobe syscall?
> > e.g provide a hwprobe entry to get system's VLENB. We will have to
> > increase and rearrange the buffer for NT_RISCV_VECTOR if we want to use
> > ptrace as the entry point for this purpose. I am not very sure if it'd be
> > too late to do though.
> 
>  No, how do you expect it to work with a core dump (that can be examined 
> on a different system, or with a cross-debugger)?  You need to change the 
> API I'm afraid; it's unusable anyway.  It's a pity the toolchain community 
> wasn't consulted if you weren't sure how to design the interface.  Better 
> yet it would have been to implement the GDB side before the kernel part 
> has been committed.

Conor just reminded me that we may still have a chance to get it right
since 6.5 has not been released yet. I will send a fix patch to address
this issue once the discussion settle down. After looking into some
code, I think it is possbile to steal the unused space in datap and
change the uapi with something like this:

diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index e17c550986a6..ba6ddf4f9dc9 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -97,14 +97,17 @@ struct __riscv_v_ext_state {
 	unsigned long vl;
 	unsigned long vtype;
 	unsigned long vcsr;
-	void *datap;
+	union {
+		void *datap;
+		unsigned long vlenb;
+	};
 	/*
 	 * In signal handler, datap will be set a correct user stack offset
 	 * and vector registers will be copied to the address of datap
 	 * pointer.
 	 *
-	 * In ptrace syscall, datap will be set to zero and the vector
-	 * registers will be copied to the address right after this
+	 * In ptrace syscall, the space for datap will be set to vlenb and the
+	 * vector registers will be copied to the address right after this
 	 * structure.
 	 */
 };

Now ptrace will have the knowlege of vlen to parse V rsgisters. And this
will not cause any size change to the original data structure that is
shared by both signal and ptrace because vlenb is XLEN, which has the
same size as a pointer in both ilp32/lp64.

> 
>   Maciej

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
