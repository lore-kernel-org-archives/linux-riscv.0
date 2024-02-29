Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CE5C54E41
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=O8N2boqKCF9Je6zg06r4kM85BASmcFjROFtV1vUtHD0=; b=kxLE+3ksO0FOPeK03lvkC5f2VS
	9umQqA0+bMvt+Q7CDRaLnWpCXa+QCxA9xDS9u9Jd/te84Oslfg+O6m+CD9bA2O/8DYmCNZAp0Cwze
	nQ2aziDYnU+SZspYibH3rrpEYD8nFVucTgK04OKZcoa+4D45H89fifxd2K4lVTXKQpQFyFPVbhc5P
	QZWqzWuFDWlAXC0kgiQnuJfcfUmE8HgcUDdAS6adNSebPiINmAwPUT0eXJE+O8U5uoQD/GbWpE6fE
	sf7XwzHdV7m1jai+whJttjj9C0HQhZ1bfowlMyH9/xUTZthhrwZNlJqpWHK2ZwfFya918VtayoYI/
	PpSp36sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfjl5-0000000EOZk-1HlQ;
	Thu, 29 Feb 2024 16:59:47 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfjl2-0000000EOZE-0u5A
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 16:59:45 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e571666829so784818b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 08:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1709225982; x=1709830782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCwbHubyDS4ZcCYWO3W+q1wbDUBu7EEDiLr+msADxOc=;
        b=x6N/Kne0dyuStNLpfH3xOGnmSspN30JogyayuKehdsfDXp4j0JLKmBUu1vSS5iyB7J
         S3hA4by4dg+r+BObvVkrYgOYR66bvOl4ILusuMLh4VjGlvV0WHMRYXrBLalPzivGbTfr
         kNJn1e1nmG2ifC+pS8YMwPBSjlTxlb14HSMTYPrxrVbgkNixmqxxKFRGEQ+6s+dbX9IJ
         07pYcHh7Oi2QY70pB5nRPhvettcxIcTyRePCB5v3JC46Y8xI0vyRD1QyWmGdmezzdInR
         uoADqn1dM2W89qEKLfSWcqQhS8F8IOr2i61eoiQTirlrit6g87FrC6jq9Ck/zF55zMJO
         M0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709225982; x=1709830782;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCwbHubyDS4ZcCYWO3W+q1wbDUBu7EEDiLr+msADxOc=;
        b=L+E0c9otJt8Sqp7bGunmzX6wWP7hApy0QWXRyWEq1fZIEKMApyDSQENplrTLX56n4f
         1TNtWA+6h3BV8xeSbV7DRgoOO5XPxmoUskGonG/gcem6x3tL5umDbcX5mXrssTdqFhq/
         cMd5yqCMx7v5GtxGffi2IXdNcX9trChhP9vjQ+j0t3fDMO/NwSbDOps0l4G9lZN/25rS
         YOveDqXot7ByAN1kBL7x7bL2vtz3DfOSKEBpx1mIIqN1paKbt0EpFvGhDFr8JA4xb238
         Tg/tdqjIskvic+QBQ5FpMtoSZKrenoTEEB95AZwWZH7Y7WC6oNJ4dvf2iI9EEM/5f4yi
         x9rw==
X-Gm-Message-State: AOJu0Yxdnx2SqtpqX9KvN3YMet+OKgMQ1s4G43JQUkVH8FKYALUWqfFL
	y0lHlYNhKAx+1lkaZ+rRtKHvfSklEoCQdDXDiUtRISfi/vbMwtUS8JAzol4HhwFfnWflzZbbUN7
	8
X-Google-Smtp-Source: AGHT+IF89+u+M5gfpJIt0PO+2Aslds66FV418lJGhf4myd1ccaQrlhG4WNSPxxT4731pUU1oToI17g==
X-Received: by 2002:a17:902:ea0e:b0:1dc:de65:623b with SMTP id s14-20020a170902ea0e00b001dcde65623bmr2029696plg.60.1709225982355;
        Thu, 29 Feb 2024 08:59:42 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id o17-20020a170902d4d100b001db5bdd5e3asm1720485plg.84.2024.02.29.08.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 08:59:41 -0800 (PST)
Date: Thu, 29 Feb 2024 08:59:41 -0800 (PST)
X-Google-Original-Date: Thu, 29 Feb 2024 08:59:39 PST (-0800)
Subject: Re: vector status when vlen doesn't match
In-Reply-To: <20240228-durably-anymore-19d6c7d79f43@spud>
CC: linux-riscv@lists.infradead.org, andy.chiu@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-0bef9493-11f2-4a01-b3ba-0913088d0354@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_085944_509576_25AD95A9 
X-CRM114-Status: GOOD (  60.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 28 Feb 2024 15:32:47 PST (-0800), Conor Dooley wrote:
> On Wed, Feb 28, 2024 at 01:56:51PM -0800, Palmer Dabbelt wrote:
>> On Wed, 28 Feb 2024 08:02:47 PST (-0800), Conor Dooley wrote:
>> > Yo Andy,
>> > 
>> > I was wondering if you could clarify something that came up today on
>> > IRC.
>> > 
>> > When we enable vector we check vlenb and if it doesn't match the kernel
>> > is suppose to not support vector. We do this in a few places, the first
>> > is in riscv_fill_hwcap():
>> > 
>> > 	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
>> > 		riscv_v_setup_vsize();
>> > 		/*
>> > 		 * ISA string in device tree might have 'v' flag, but
>> > 		 * CONFIG_RISCV_ISA_V is disabled in kernel.
>> > 		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
>> > 		 */
>> > 		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
>> > 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
>> > 	}
>> > 
>> > Why does this riscv_v_setup_vsize() failing have no impact? Because this
>> > is called only once on the boot CPU, right? I feel like it deserves a
>> > comment as to why.
>> 
>> Unless I'm missing something, that first call can't fail: there's no
>> previous riscv_v_size set, so there's nothing to trigger the failure.
>> 
>> Might warrant a comment, though...
>
> Yeah. I did write (or maybe moreso remodel) that function so I know it
> only gets called on the boot CPU, I was just pointing out what is not
> immediately obvious about that particular callsite.

OK, so sounds like a comment then ;)

>> > But the main thing I was wondering about was the other time it is called,
>> > in smp_callin():
>> > 	if (has_vector()) {
>> > 		if (riscv_v_setup_vsize())
>> > 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
>> > 	}
>> > 
>> > If this fails, we clear the HWCAP bit, but I am not immediately grasping
>> > how this affects the rest of the kernel.
>> 
>> I think it's actually a bug: we're not clearing the bit in riscv_isa, so
>> this only ends up disabling the V bit in AT_HWCAP and thus doesn't do
>> anything in the kernel.
>
> Yeah, that's what I was getting at - I could not see how disabling it in
> hwcap would make a difference either in the kernel or in hwprobe. I was
> not sure if I was missing something in terms of the
> userspace-using-vector side of things, but I was pretty sure that
> hwprobe and in-kernel vector had this bug.

IIRC we used to have this stuff hooked into elf_hwcap back when it was 
the only user-visible interface.  The V support dates back to around 
then, so we probably just missed the in-flight conflict.

>> > has_vector() just checks if the extension is supported by all cores on
>> > the cpu using either an alternative or the extension support bitmap.
>> > There are lots of sites in the kernel that use has_vector() as the
>> > gating check (as far as I can tell), so if vlen does not match between
>> > CPUs should we not be returning an error for has_vector()?
>> > 
>> > The alternative that has_vector() relies on is patched before the non-boot
>> > CPUs are enabled, so we cannot modify the result once the non-boot CPUs
>> > are in their callin functions and detect a vlen mismatch while at at the
>> > same time using it in smp_calling(), so should this code be changed to
>> > something along the lines of:
>> > 
>> > 	if (riscv_has_extension_unlikely(v)) {
>> > 		if (riscv_v_setup_vsize()) {
>> > 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
>> > 			riscv_v_vlen_mismatch = true;
>> > 		}
>> > 	}
>> > and then has_vector() becomes something like
>> > static __always_inline bool has_vector(void)
>> > {
>> > 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v) && unlikely(riscv_v_vlen_mismatch);
>> > }
>> > 
>> > Probably there's value to be gained in static branches etc here, but I
>> > was just trying to explain what I was getting at. Maybe I am missing
>> > something though? I do remember talking about this back when the vector
>> > patches were still in review.
>> 
>> I actually don't think that alone fixes it: even if we make has_vector()
>> respect the changes from the new CPU (whether we re-apply the alternatives
>> or make a more dynamic check), we'd need to make sure the code that has
>> already looked at has_vector() doesn't get scheduled on one of the
>> shorter-VLENB CPUs.
>
> Is it possible to have that happen given this is in smp_callin()?
> I guess the concern is some sort of hotplug situations, given that a CPU
> could be hotplugged into a fully running system with a vlen mismatch.

Ya, something along those lines.  We essentially need to defer this sort 
of alternative processing until after all CPUs have booted and run their 
V detection, but IIUC that could be arbitrarily late if we're talking 
the hotplug world.

>> So maybe the right answer here is to flip things around, and just refuse to
>> enable CPUs that come in with a VLENB different than the boot CPU?  That way
>> we could avoid being broken by systems that behave this way,
>
> smp_callin() doesn't return an error to report a failure, but it does
> have a completion. I suppose we would just return early from
> smp_callin() so that the completion never gets completed, in turn
> causing __cpu_up() to fail?

Ya, I think something along those lines would do it.  I haven't really 
thought it through so I bet something hairy is lurking around in there.

>> if someone ends
>> up building one then they can figure out how to make it work better.
>
> Apparently the next gen sophgo product does. Not sure if people will wnt
> to run across all the cores though, apparently they different by a lot
> more than vlen.
> A DT property would allow us to get the vlen info before the CPUs have
> themselves been brought up. Apparently there are Zvl extensions for
> this, but I'd rather just have a property like we have for the cbo
> sizes if it comes to DT properties.

That might be the right answer here.  In general the "just run some code 
on the CPU to figure out what it implements" style of detection comes 
with a lot of these long-tail issues, DT just fixes that because we can 
look at every core from early in boot.

> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
