Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C01E9A02C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Feb 2026 19:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg5MkJRbrJTlfuQguAkPxQK971dSj6sXi04BLm5fp0g=; b=ajWt1FMHY0Og19LFJ/96h+ni1G
	VtrVMOXhWx7Cjb/LKvixxp3lgohPPGnwXaZxEHEWvpsnO0cK0WbQP7MCIjSwPZIVVWK5mb0rM0kaW
	ohdDFfw4g+WuJbuQDlkxtYqbpXZEcx+uOYsnI5Zgc+TncdZCDP7MaPrwBTOkq1DLIHgWOBa3XFV/r
	ENcdDuV+OZFfQflsY9uY8keYQ+NDyXKJmQ/aZZTs+Ffw6UmHuk3mVOWco5YZoNDXIBr+vtwAEyC+W
	6PSR3hnBQs/wBNCLec5EyG5MJh7jxKWIpNtjNNWGCc7JCDcl5UOOKCEVCBPKPCCOJunwibice1n03
	2zxjXqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsng6-0000000AL8b-03xf;
	Wed, 18 Feb 2026 19:57:42 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsng3-0000000AL7p-2mlr
	for linux-riscv@lists.infradead.org;
	Wed, 18 Feb 2026 19:57:40 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-12732165d1eso161135c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Feb 2026 11:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1771444658; x=1772049458; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iKYkZR4doNKAqI71WoYaMA5DL3zj5NX+5I6qS1ZsCY0=;
        b=BV4CCTs/iF0oqDA6NPGvtqWDjk/nr/S3DTKoUO7t6mgW2wuPFvK6g/xjsZZDB8oQqg
         k+TATs8e3TmlJiX9ntXE4cvHaifw/oFQy19WbmkW/Q0dlmzbiMjINP4HEoKkNqWMzikl
         mXyE1gopX9b7U56WNQmE+CKn6V4XNQVoP47qgfcp9TOJsVQK2brYAZcovRBsILc1UBJV
         KPBVbFT2oXxm3A0nzFNB0R+Ezv9aeRRf+L5MFT7ol00V2fP5hG8+x/Voh1C2WNlTc8iB
         hHBAz2uPH2c5LwyMm+OscerBD/DovfGjoELr1A0WLOiTA6zudJxoOfLXzTE3VQfLApnY
         X5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771444658; x=1772049458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKYkZR4doNKAqI71WoYaMA5DL3zj5NX+5I6qS1ZsCY0=;
        b=o4mSzWuoQ7aCqdXF0NB4mR7pYX4Yoe0o9kYKH9/b32ERP9qcatCYvITdXbQHRoboy6
         N1U38GTWV7ZSkSRqnoANgrv/5omcy4mDiesdPtQj14Ix43K4JfkgQy1Jrn8kyMT/ndIb
         dkGHrirNytyAgqTJPDQaiZPSINaGToy52D7UUg1+WhZ3Fg99ERbEgndyeIfc7ximf/Xc
         QgyqANb805NQXrWP6fbe+uBB1ITDJPG3mvob2A+px9MGOuLMSSIosJoPTjWa3LvI6gXj
         bKGgFMdUQhS/ZMBUVsWXTmr11s80x60peBY2cNfcdo+iC1yBy+fmjKXtWFJj90fz35dB
         +yAA==
X-Forwarded-Encrypted: i=1; AJvYcCXHCXpIpfetE24NHAdqYRz7PNBkOoGcHfZRuRrd8lIIN2LmwXYBU69lTNqEWMFx37MbcHoGVTRMhW+M2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxuUim7EAZH5rLLKsU39cfYaLizMwVKcbkg8I2tvn50zbpFz02O
	s/LL443q5COVUwxqxbi4zxDv6ySgiyAHzGG4sksZXseacH3QcQOJLsh659sQGR6hSoE=
X-Gm-Gg: AZuq6aK1iWxD1tRYNMuw80gd5AK0UcEndm9pZ32AklmallIu/946+lUb5FjSuy90BTl
	RGC/ep8ZKbz/I/ZRCX/ASTEj9g4mPo1He3eigI1Xam1ihTBS6W4NitPdwEMo6iRt32cs/+TKUEx
	LWS2WqZejluQ8AUcFg5KdhvSlFVj2D81CCZYtLFIJC3cMGGNwsAQk/n+TNdKs5luEvOYVZLs0Pp
	s/o1Y3h6Y5OF1wLdRkHPiykRxKQNIIsYPCJbxxDVG6RnBAmxBjBil3o1kSrI9Z3trDXfGVGmcpK
	pBCZSmacf3V0V+V/swXoiNJOkcvj2RH41c70qeum1CJWMbW5O2EnvLQejJ0MxDA8soS43ZBLyoa
	e0tY4xUjFP3k6AEmVR3dls8P3aNSYEwFUOi9WGQStbJoP65uWbix3N4zrE0SdCFOdm/wAL3403F
	PwXQ+ar7Y2sCqd5A+sKZiumrNzDNzzjAV4
X-Received: by 2002:a05:7022:a81:b0:127:3b1d:f593 with SMTP id a92af1059eb24-12759a043c6mr1438756c88.9.1771444658229;
        Wed, 18 Feb 2026 11:57:38 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c63feesm24060077c88.4.2026.02.18.11.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:57:37 -0800 (PST)
Date: Wed, 18 Feb 2026 11:57:36 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zong.li@sifive.com, rick.p.edgecombe@intel.com,
	yu-cheng.yu@intel.com
Subject: Re: [GIT PULL] RISC-V updates for v7.0
Message-ID: <aZYZsBlH_tVxnZIf@debug.ba.rivosinc.com>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
 <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
 <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_115739_863619_FEF2C9F7 
X-CRM114-Status: GOOD (  21.57  )
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

On Mon, Feb 16, 2026 at 01:55:11PM -0800, Linus Torvalds wrote:
>On Mon, 16 Feb 2026 at 06:20, Mark Brown <broonie@kernel.org> wrote:
>>
>> If that's the part I think it is it's following the same pattern as
>> shadow stacks, originally inherited from x86 then generalised.
>
>That makes sense. I was looking at the speculation control ones -
>which I honestly think are done much better in that they are a bit
>more future-proof and won't need yet another random prctl just because
>some architecture comes up with a slight variation on a theme.
>
>They don't technically do the locking (the speculation control has a
>different kind of locking), but because of how they do things - by
>having separate "which control do you want to change", and "how do you
>want to change it", it would actually be very natural to make "lock
>it" just another thing.
>
>So I actually wish we didn't have that shadow stack prctl - or this
>new one - at all, and they'd just use the speculation mitigation
>pattern instead.
>
>I think the shadow stack case is probably too late to fix and people
>presumably already use it, but maybe it's not too late to fix this new
>control flow integrity case?

A little bit of history on this. I was at Intel back when Intel was trying
to enable support for "shadow stack" and "enbranch (branch terminating instr)"
feature. Given no other ISAs at that time had any notion of "shadow stack"
and "indirect branch tracking", IIRC it was advised on list that "shadow
stack" enabling for x86 should be done via arch specific prctl. Yu-cheng/Rick
Edgecombe can correct me if I am missing something here.

"x86 indirect branch tracking" enabling for userspace never made it to kernel
(although most distros when they compile userspace/packages, `endbr64` is
compiled-in so that whenever it lands, enabling is one step away).

Later in 2022 when I started doing work for cfi extensions on RISC-V, I started
with arch-agnostic prctl for enabling shadow stack and branch tracking. I was
hoping that all arches would end up converging on that. Soon Mark Brown sent
out arm's "Guarded Control Stack" (aka shadow stack) which used the
arch-agnostic shadow stack prctl.

So today we have 
- arch specific shadow stack prctl for managing (enable/lock/disable) shadow
   stack on x86

- arch-agnostic prctl for shadow stack management on arm64 and RISC-V


If we land arch-agnostic prctl for enabling branch tracking for userspace as
part of risc-v patches, I am hoping we can leverage that for x86 "branch
tracking enabling" as well. I don't know if "BTI" is enabled for userspace in
the arm64 world but if it isn't then it can use the same prctl. This creates
symmetry and convergence as well between major 3 arches for branch tracking
support.

Furthermore, Control-flow integrity is shadow stack (for backward cfi) and
branch tracking (for forward cfi) both. It'll look odd and ugly (to an extent
it already is because x86 and arm64/riscv use different prctls for shstk) that
shadow stack has its own prctl and we invent new cfi prctl just for branch
tracking.

Ideally, it would have been nicer if we had
`PR_GET/SET_TASK_EXPLOIT_MITIGATIONS` and sub-codes under them to enable all
sort of things like "Manage CFI", "Manage memory tagging", "Manage speculation
control", etc. But things evolved on their own pace at different timelines.

Given that we already have a fragmentation in prctl space, I propose we go for
arch-agnostic branch tracking prctl and let other ISAs implement support as
they go about it.

If you agree, I'll let Paul choose the right name for it (given that indir_lp
isn't a favorite)


>
>                 Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
