Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBFCC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KN3OpImPiQ1Z/vmzEMZmqi5kyRinyOaOUtStFIefb8=; b=qKAdwq0B8zW77g
	7iMHOSeAKBaLOIY39nROCvuaQh4EDJTQ3814/2Wtvn880XxVsO+oU5byTSlUHGrGNphc/F9HLg33b
	rXEAd5qBXDpA1wXd6aCXvsPCEDDpprRhuHuJERc+tzYh/3zP05QllrTxLs6nOpp8sRYwEyLHs82uq
	5/B9tZXmz9LPvGUI2QgTruRqEyDnpfu/gBMBcy0haXWiiu5peMnR8FHIkq2K4bbY3iVpsWKrtt34X
	GPOmXxfU6ePP3Df7HbujX6gBwC4egqdRxS0cVXAlsxjqSB+BzVfqszfqrHeZTzpWPErV4FDtzZYuJ
	TcJIsV8rhq67LUzg/2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWmI-004oEW-23;
	Fri, 22 Dec 2023 04:04:50 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWmF-004oDx-21
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:04:49 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-5918f11099dso929910eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 20:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703217886; x=1703822686; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMbuyICQl6nMe9y2KZW9tM4PAnxgLD1bGygk69Ul4qI=;
        b=LYRLjPaf9E0CKiQRWVdr4pS3SxwuIvSAh+v+1LvJC5FANlHsngDTJ0qlixabNZdkbo
         P66X2HBx97bnAdsT1useWxTj5aN2qZiYttNKlttOdR5wyfbN8qel1KhqPzgLnAV+NXP4
         QShQgHvOmWgwY33pcfUUXkK4CPwnom3iNnFaMvMlDust6ud1DvYp+tQrd3DrYxafGsts
         cmKVMNw3dV4snY3YWT3Lj58WVRK3KC4jqajgMa520QLTrNUrpDMBTB/Jc4N+8qR8Vzey
         jqYeuPjlMVLPfT2fPqDezYXE4/+FGsmnB46xzKicirQuBiqzPQN3EjpDsHmpIX9lcPyD
         GuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703217886; x=1703822686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMbuyICQl6nMe9y2KZW9tM4PAnxgLD1bGygk69Ul4qI=;
        b=qBynW6c5P4aSd/AN4h8W/Z2q+wy5Smqbb3WMl6E17QgBqPcjzOYpbXduevTBVnpUdZ
         tcnC7cEOZbNz+6UcjhM1sq9RadJDA1fWu66iHaszw/socIY7gVRM8sn3fDJUcgD+TatR
         D/S3oW9Hbs3LBY+tMvqSYkVnxrnQvEj//9t5Jt8XPA35UIVtKVm4nSs/jIk0Rpwe9ZNu
         BNogEAUMg4FRYvkdxRdLrAhtfBK05HXPePKv+vHy++Lxhp/nAEfooEiqfqPTqjY1Ox9S
         jJZ/I1uIggeOxBDM4c7jGLrZ0q1LOdf4p9YB1fdYt2W0G6iXeSVr+CWh4j8loS5XTKlb
         n8Kw==
X-Gm-Message-State: AOJu0YyxieAxbmpWAPWydGmXg0YF1GfTJPlTObEmld1UPZG9cQayhG8C
	jcdNd6GCiR9XHBR4jVzSNsmn5A9ZtMoF7w==
X-Google-Smtp-Source: AGHT+IHXq5Glvort/8zooZ1cONqbJxMUnI4QjEEM2kI4kr0xLRxYvX/XwiS3CJjJ1rCS66QRkiGFCQ==
X-Received: by 2002:a05:6359:4c27:b0:170:c2d0:7236 with SMTP id kj39-20020a0563594c2700b00170c2d07236mr872470rwc.27.1703217885712;
        Thu, 21 Dec 2023 20:04:45 -0800 (PST)
Received: from ghost ([2601:647:5700:6860:9585:2e30:5aba:e80c])
        by smtp.gmail.com with ESMTPSA id f7-20020a056a001ac700b006d7310a683dsm2356295pfv.80.2023.12.21.20.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 20:04:45 -0800 (PST)
Date: Thu, 21 Dec 2023 20:04:43 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: guoren@kernel.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	alexghiti@rivosinc.com, xiao.w.wang@intel.com, david@redhat.com,
	panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com,
	willy@infradead.org, bjorn@rivosinc.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>, stable@vger.kernel.org
Subject: Re: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Message-ID: <ZYUK2zUHjYBL0zO7@ghost>
References: <20231221154702.2267684-1-guoren@kernel.org>
 <20231221154702.2267684-3-guoren@kernel.org>
 <ZYUD4C1aXWt2oFJo@LeoBras>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZYUD4C1aXWt2oFJo@LeoBras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_200447_662045_3D05549A 
X-CRM114-Status: GOOD (  31.90  )
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

On Fri, Dec 22, 2023 at 12:34:56AM -0300, Leonardo Bras wrote:
> On Thu, Dec 21, 2023 at 10:46:59AM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > When the task is in COMPAT mode, the arch_get_mmap_end should be 2GB,
> > not TASK_SIZE_64. The TASK_SIZE has contained is_compat_mode()
> > detection, so change the definition of STACK_TOP_MAX to TASK_SIZE
> > directly.
> 
> ok
> 
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/include/asm/processor.h | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index f19f861cda54..1f538fc4448d 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -16,15 +16,13 @@
> >  
> >  #ifdef CONFIG_64BIT
> >  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> > -#define STACK_TOP_MAX		TASK_SIZE_64
> > +#define STACK_TOP_MAX		TASK_SIZE
> 
> It means STACK_TOP_MAX will be in 64BIT:
> - TASK_SIZE_32 if compat_mode=y
> - TASK_SIZE_64 if compat_mode=n
> 
> Makes sense for me.
> 
> >  
> >  #define arch_get_mmap_end(addr, len, flags)			\
> >  ({								\
> >  	unsigned long mmap_end;					\
> >  	typeof(addr) _addr = (addr);				\
> > -	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
> > -		mmap_end = STACK_TOP_MAX;			\
> > -	else if ((_addr) >= VA_USER_SV57)			\
> > +	if ((_addr) == 0 || (_addr) >= VA_USER_SV57)		\
> >  		mmap_end = STACK_TOP_MAX;			\
> >  	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
> >  		mmap_end = VA_USER_SV48;			\
> 
> 
> I don't think I got this change, or how it's connected to the commit msg.
> 
> Before:
> - addr == 0, or addr > 2^57, or compat: mmap_end = STACK_TOP_MAX
> - 2^48 < addr < 2^57: mmap_end = 2^48
> - 0 < addr < 2^48 : mmap_end = 2^39
> 
> Now:
> - addr == 0, or addr > 2^57: mmap_end = STACK_TOP_MAX
> - 2^48 < addr < 2^57: mmap_end = 2^48
> - 0 < addr < 2^48 : mmap_end = 2^39
> 
> IIUC compat mode addr will be < 2^32, so will always have mmap_end = 2^39 
> if addr != 0. Is that desireable? 
> (if not, above change is unneeded)

I agree, this change does not make sense for compat mode. Compat mode
should never return an address that is greater than 2^32, but this
change allows that.

> 
> Also, unrelated to the change:
> - 2^48 < addr < 2^57: mmap_end = 2^48
> Is the above correct?
> It looks like it should be 2^57 instead, and a new if clause for 
> 2^32 < addr < 2^48 should have mmap_end = 2^48.

That is not the case. I documented this behavior and reasoning in
Documentation/arch/riscv/vm-layout.rst in the "Userspace VAs" section.

I can reiterate here though. The hint address to mmap (defined here as
"addr") is the maximum userspace address that mmap should provide. What
you are describing is a minimum. The purpose of this change was to allow
applications that are not compatible with a larger virtual address (such
as applications like Java that use the upper bits of the VA to store
data) to have a consistent way of specifying how many bits they would
like to be left free in the VA. This requires to take the next lowest
address space to guaruntee that all of the most-significant bits left
clear in hint address do not end up populated in the virtual address
returned by mmap.

- Charlie

> 
> Do I get it wrong?
> 
> (I will send an RFC 'fixing' the code the way I am whinking it should look 
> like)
> 
> Thanks, 
> Leo
> 
> 
> 
> 
> 
> > -- 
> > 2.40.1
> > 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
