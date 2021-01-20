Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85668C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 15:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39DB523358
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 15:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39DB523358
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embecosm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=THWRGobeAJxifW3C4hTnYe6tpcEHjtxHlYgbOJa+Zp8=; b=ePqFpiQBAq/TNoQTKzc9MdeJL
	NrbO/7tcjfdqOTAXyNVhLdrSyLA5VJnMQQ0ZjG/5ZtEPJXGjxXwBuCmxq7aoJUxlvwXZm2EUAZf7y
	ZonkenB6iRwDoOno+z7TpAl13Loit+9Fvi1bCqXfvjDtfavS0cs8yixB6ivL+eUEfCxdXALepkPdr
	PljzBckhzWZgbFxdXpcp6zh/RPPRnfqtU8l3OYjXyCh7IPEEnFCT3K97E/6aotrJ2y9hQkx+BKo5D
	10rbjrHqXVT2Yb248vmEoCpKOw4MMDOljrSAMNgqPUApvpHz9bxpZ5anrBKCEhB1V5d8f9fo7Y2dB
	+99eNkchQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2FUn-0006U0-St; Wed, 20 Jan 2021 15:34:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2FUk-0006Sd-Vh
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 15:34:07 +0000
Received: by mail-wr1-x433.google.com with SMTP id 7so16257396wrz.0
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 07:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embecosm.com; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :in-reply-to; bh=yJWQbhCc0AAf8neuWVEcWBzYJRG3dVvxC4lEV4Idv+g=;
 b=NegdkMbiNHK6mJ/4QwOtuhMZy/KWfi1rku9mZ4q+0X/7FN5gaBmMwFOvi6vwAA7z2m
 29NMfZllDN3/qrEQk+KugKFzKegznbhUBIAQQbUIBORLqmFsllOaka67tf2c5g1rb6mk
 UW+S+CW595nR9ijoOPk2UnJFdPVZ7YigoIQ+NkD4rLM/cv73nXaf2tF5pVJXGXXp16qG
 isVqDXihOTR1wBm/L5xkD2fpUkAPjiWdR0wkUfrI2jT58HP+emitQitS4v6hID7gYsr+
 4mhrhHs4UoIe5ALQjLE4uhl/0unTmF4bLtbKVOndbXYDQsJtW73Yjazk+IwTVhIFownC
 cvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:in-reply-to;
 bh=yJWQbhCc0AAf8neuWVEcWBzYJRG3dVvxC4lEV4Idv+g=;
 b=Lk2ZimOy1nUEBNS/3mN43Dx9fBj9kt4haytWFJtkAqX3W9RhSJiU5fPOmRH+WxxMLH
 SsAU8RAB0XTLB2WGf/0K0CNeZlxtk2UsY4KkndzEXrWe0r87PeT8VnIBMyaY2rp08CaU
 CuT3KpB1Xyz5kKzxZ5f0EykSYpfAaXxOknpw8tP1TiFioholvLp9+CH8UsoPm8lzTvWp
 Vi4EV4rHpnxDbj4KX9uMrBgDntwt7l2nUaUAfjAD2wyRwfl6sRSVS3x6TUSGLbGFfB3y
 G3e8U5nlGTpQw/MMXEKLgRlWdOxAjCXYAYNvyXznwXW3OXQgh2jYwVwA5rnNzVPA5Tz4
 5JmA==
X-Gm-Message-State: AOAM532vCSrFqP6YjszgAVuZbow502ZGmrbTRPv0jMthXGFqSkEmos8Z
 9kqkQuB1aaX+p/IrqajTp6QOqQhxdcRcjA==
X-Google-Smtp-Source: ABdhPJxB/lgF/M5i2ogXpJaQprQqPxkYZXoZdJ4KPS8LXgeV9R1mPFril1weO+AUFLvsLuwH6zkBZQ==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr9860383wrv.54.1611156844204; 
 Wed, 20 Jan 2021 07:34:04 -0800 (PST)
Received: from localhost (host86-180-62-229.range86-180.btcentralplus.com.
 [86.180.62.229])
 by smtp.gmail.com with ESMTPSA id p9sm3184705wrj.11.2021.01.20.07.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:34:03 -0800 (PST)
Date: Wed, 20 Jan 2021 15:34:02 +0000
From: Andrew Burgess <andrew.burgess@embecosm.com>
To: linux-riscv@lists.infradead.org
Subject: [PING] Re: [PATCH] riscv: add NT_RISCV_CSR constant
Message-ID: <20210120153402.GA1226955@embecosm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201214152437.1526146-1-andrew.burgess@embecosm.com>
X-Operating-System: Linux/5.8.13-100.fc31.x86_64 (x86_64)
X-Uptime: 15:28:22 up 42 days, 20:12,
X-Editor: GNU Emacs [ http://www.gnu.org/software/emacs ]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_103407_124491_65D89E42 
X-CRM114-Status: GOOD (  29.96  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Burgess <andrew.burgess@embecosm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ping!

I'm not sure if this is the correct mailing list for this patch, or if
this should be posted to a more common list for consideration?

Does anyone have any thoughts on this?  As RISC-V gains more
extensions (like vectors) it seems inevitable that at some point we
would need to claim a RISC-V specific number range for notes.  It
would be super useful if we could coordinate the note numbers used by
Linux with those used in other tools to avoid conflicts.

Thanks,
Andrew


> I am currently working on adding support to GDB for dumping bare metal
> core files for RISC-V.  As part of this work I would like to include
> support for dumping RISC-V CSRs.
>
> The format of these bare metal core files is planned to be ELF + NOTES
> very similar to the core file format use by Linux.
>
> As such I need to pick a number to use for the CSR note.  Currently
> Linux for RISC-V doesn't support writing out CSRs, and so no number
> has been assigned for a CSR note.
>
> In this patch I propose reserving a note number for RISC-V CSRs.  This
> note isn't currently used within Linux, but might be one day.  Given
> how the per-architecture notes are allocated this patch not only
> reserves a note number for the CSRs, but as the first RISC-V specific
> note number, it reserves the whole 0x9?? number range for RISC-V
> specific notes.
>
> Reserving this constant now will allow for coordination between Linux
> and user-space tools that work with core files (like GDB) without
> risking possible number conflicts in the future.
>
> I don't know if it's acceptable to have reserved, but otherwise
> unused, constants like this in the kernel or not.
> ---
>  include/uapi/linux/elf.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
> index 34c02e4290fe..7db3752108c8 100644
> --- a/include/uapi/linux/elf.h
> +++ b/include/uapi/linux/elf.h
> @@ -428,6 +428,7 @@ typedef struct elf64_shdr {
>  #define NT_MIPS_DSP	0x800		/* MIPS DSP ASE registers */
>  #define NT_MIPS_FP_MODE	0x801		/* MIPS floating-point mode */
>  #define NT_MIPS_MSA	0x802		/* MIPS SIMD registers */
> +#define NT_RISCV_CSR	0x900		/* RISC-V Control Status Registers */
>
>  /* Note header in a PT_NOTE section */
>  typedef struct elf32_note {
> --
> 2.25.4

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
