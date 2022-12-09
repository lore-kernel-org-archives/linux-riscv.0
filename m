Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFAAC04FDE
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 17:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QgPqRpDtYlKIFyKBw1imu71i/DGe3rf3X6+6uGbng70=; b=ETWMoyU2SYU0dZz+j8aNYVla5F
	TiHjIevms3DJXRm+gRJ5uzw9sB0HXD7+RGBuC0xa9s9E+B/x6qEqWBSsq2Yllo/lB58wSin1UPnZ3
	jbVx+QeK+kw0noSQpt6OJC7g8F1waWUWT5LAiAXZoJynwVU8TSkOCd+WfRuRE4bixZsHM8FJsjW1F
	hcAOH3dv0pM1ZcFnhPrUSvZHPSFZ3x8kzL1iVf97YQRx9H0JJK7nw3pbYqTQ/14ESoSODQxWj8j4U
	065vaUwcwzfj2KGwosNvp+jJ5KOpqAznu1ofsriWDpMEXrk6ntCF+59WAZxkpqk8Ms94jl13S5xrl
	hFdmuFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3h4L-009tpo-MG; Fri, 09 Dec 2022 17:21:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3h4H-009tnt-B7
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 17:21:51 +0000
Received: by mail-pl1-x62d.google.com with SMTP id jn7so5538470plb.13
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 09:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3ftz22T4PBLAKYuAEy8MSiyeSsUvlcVd5LGzrsdS20=;
        b=o9iqnF1AFARrXLpxgvQ9MMiwrWgg/fYr9Im7EHbyQw4/mk6D1BEdl8J94wSiC8a3yw
         yijrOJXrMtAjL8BGmZ8C68RwIt10n1LBw/ki6zzN3MZCxq2mB36FcSScnkxzaj+pfTbA
         O/gsspSRNgHDKTYgpX8DbCDjxnFRGO7eSPD8kjXLRb3fKk1/nbh5+dST1MLO8dmvVYGc
         rRgG+r8bE1qrrt/QkqSARea+Nt7W8FMhF4Tjsgh9wGR0uB1216RAXtZSviYKd1yZNafv
         nToYZR1UgCXCODgPege/HytqhANmxMkBE1nxm6GvWwkTtNy0NY3nEydwEW00AvGvToMe
         xqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3ftz22T4PBLAKYuAEy8MSiyeSsUvlcVd5LGzrsdS20=;
        b=ImasOdXxCduCLBFIlLZu12F8J1Y0eBXVcV1wSQUDfsBL3/TPOLj5NL0JI7HDmwccS4
         OhBfIKzK+oLW7I8fDxq3989w1h8slsCQqmYpCa9wgJv0OUJntLNoL41J6X2tBKHY/qnT
         sQf6AxXhyJS10Z0eaFa13/KY+0sEkPRf1Kp9UI0zyoG7vZxUZNFhu069/DO3rmT6ckjl
         J1/QBFRKV/Xw/pW/3oQKvDNWtZWdVps23a8bV1xB6XpNZIUmN0RUCY+wAJCDUzDNpaoN
         e5h6Ez/hdqX24I3KcKd0FbbjUidJZulMNpA3KRZ/MI52IbRiiE1sKxPuKFObNOpE7reU
         HX9w==
X-Gm-Message-State: ANoB5pmG0CnW8aLSUnD84bkuggB72m6/ieXN0DrsWlAshVkAHKDfXAYE
	lAJncRjEftFhft2yGesbhdhK9g==
X-Google-Smtp-Source: AA0mqf5YLC0cMA5zeF7YRupkfPKEOPx/AfvG6bFsSz1kH37k+fIn4AaBCFQeOXKRSZWLtuKxEA57NQ==
X-Received: by 2002:a17:90a:d515:b0:219:c1e8:114d with SMTP id t21-20020a17090ad51500b00219c1e8114dmr6508249pju.26.1670606506081;
        Fri, 09 Dec 2022 09:21:46 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id kk10-20020a17090b4a0a00b001fde655225fsm10884328pjb.2.2022.12.09.09.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 09:21:45 -0800 (PST)
Date: Fri, 09 Dec 2022 09:21:45 -0800 (PST)
X-Google-Original-Date: Fri, 09 Dec 2022 09:21:41 PST (-0800)
Subject: Re: RISCV Vector unit disabled by default for new task (was Re: [PATCH v12 17/17] riscv: prctl to enable vector commands)
In-Reply-To: <87zgbwk9t4.fsf@oldenburg.str.redhat.com>
CC: Andrew Waterman <andrew@sifive.com>, Vineet Gupta <vineetg@rivosinc.com>,
  stillson@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
  atishp@atishpatra.org, guoren@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
  greentime.hu@sifive.com, vincent.chen@sifive.com, andy.chiu@sifive.com, arnd@kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, bjorn@kernel.org, libc-alpha@sourceware.org,
  christoph.muellner@vrull.eu, Aaron Durbin <adurbin@rivosinc.com>, linux@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: fweimer@redhat.com
Message-ID: <mhng-975b1d7b-7b3f-4e88-804c-8b22787f9588@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_092149_622702_01B306C8 
X-CRM114-Status: GOOD (  29.05  )
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

On Fri, 09 Dec 2022 05:04:23 PST (-0800), fweimer@redhat.com wrote:
> * Darius Rad:
>
>> On Fri, Dec 09, 2022 at 01:32:33PM +0100, Florian Weimer via Libc-alpha wrote:
>>> * Darius Rad:
>>>
>>> > On Fri, Dec 09, 2022 at 11:02:57AM +0100, Florian Weimer wrote:
>>> >> * Andrew Waterman:
>>> >>
>>> >> > This suggests that ld.so, early-stage libc, or possibly both will need
>>> >> > to make this prctl() call, perhaps by parsing the ELF headers of the
>>> >> > binary and each library to determine if the V extension is used.
>>> >>
>>> >> If the string functions use the V extension, it will be enabled
>>> >> unconditionally.  So I don't see why it's okay for libc to trigger this
>>> >> alleged UAPI change, when the kernel can't do it by default.
>>> >>
>>> >
>>> > Because the call to enable can fail and userspace needs to deal with that.
>>>
>>> Failure is usually indicated by an AT_HWCAP or AT_HWCAP2 bit remaining
>>> zero, or perhaps a special CPU register (although that is more unusual).
>>
>> That would indicate that the extension is not present, which is one of, but
>> not the only way it can fail.
>
> I think you should bring down the number of failure modes.  HWCAP has
> the advantage that it communicates kernel/hypervisor/firmware/CPU
> support in a single bit, which simplifies the programming model and
> avoids hard-to-detect bugs.  It's not clear why it would be beneficial
> to continue on ENOMEM failures here because the system must clearly be
> in bad shape at this point, and launching a new process is very unlikely
> to improve matters.  So I think the simpler programming model is the way
> to go here.
>
>> The vector extension relies on dynamically allocated memory in the kernel,
>> which can fail.

The issue I'm worried about is that V needs more space in the 
ucontext-type structures.  We have an extensibility scheme there so we 
think it can be made to work, but IIUC we'll need glibc to be updated to 
handle the extended contexts in order to avoid losing state when doing 
ucontext-related operations like signal handling.

I don't see a way to handle that with just HWCAP, as we essentially need 
some bi-directional communicaton between userspace and the kernel so 
they can both decide to turn on V.  I don't think we strictly need a 
system call to do that, we kicked around the idea of encoding this in 
the ELF, but there's a lot of flavors of vector in RISC-V and we've had 
trouble trying to encode these in binaries before so it seems easier to 
just use the syscall.

> But this failure can be reported as part of execve and clone.
>
>> It also provides the opportunity for the kernel to deny access to the
>> vector extension, perhaps due to administrative policy or other future
>> mechanism.
>
> HWCAP can do this, too.
>
> Thanks,
> Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
