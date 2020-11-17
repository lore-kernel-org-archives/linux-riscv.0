Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90811C63697
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 21:13:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CF9C24199
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 21:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ks0xRUL9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MWHmfYIY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CF9C24199
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=npMOqbRQX/BrwHJmKbzn6dtgmdjp6y2ICAgxzc/k4tQ=; b=ks0xRUL9yvYQBikAIGP2oAC29
	Wkwb50pHSHY3WJag9mu6ssssKqbfgf6J2dzVY1hHd6yrkaX3O392qy+WAs9ou73RsxbBpDTbMd2Jp
	46nQ3s0Ues7ZF1CKa4VuSiE7lpLKs0GnFWxRXs2uJ5+28rTqOTbk/4WXSRWGwd6djWDdMcnUP4WOJ
	iRrRXWMqbInD7j4JWvZXx9Hf9Unbn03GDeSwacEdleaXFGDLscMwkYOzT/FMCfPc7otDA5HJ+HIBD
	SK2oajUzw80R7Ur5glIcB5ZgKWQC2k3k8C9v/SMBT84D6oXFU8tsgVGxblg8WNH0O1bI2A0mgpo8M
	lvUaamk9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf8I8-0006GG-En; Tue, 17 Nov 2020 21:13:32 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf8I6-0006FI-46
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 21:13:31 +0000
Received: by mail-pl1-x641.google.com with SMTP id k7so10972376plk.3
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 13:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cUL+9SvzrRzllFEAM5OhpKctCqgJfj/sR/XV7GWar0I=;
 b=MWHmfYIY9ch9OvmV2riVcHnEmRpuPVUXqLW0gkD2sszZU8xssgw1NP5X1ShxEm8HJa
 0hsVkK3fKE20KdO6VmXkfWW+cgXtGbCsjVnNFMstYf+pK2L5LTkbrAxCuUfBB/WpAjAt
 75tDLdzwv7U0UzXqesHtuAuhick5Z8a/RrA2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cUL+9SvzrRzllFEAM5OhpKctCqgJfj/sR/XV7GWar0I=;
 b=LQF/MQOg9lFE+qbky7AjMcfJt2WODq7uEoaZDP4fXGaogMxOn4VopvTg+lhUjli65b
 RjOCJ6XK02Fh5/zc71+5YFPZHviaUxKQEl7HZks6O0LMmDG8zSlk+UIB+H9nMH6m1I+V
 ck/gTAxVg1OHzIrWOzukTu0ORaFCt2vTD+/6bIZCJnZs4/2ztESFgooJIhhf84ske1ql
 B1gN666wlCqbzqhVmGFeWms7rvpfFPl9GtRjxo3pOrqojbQ0vjELeJ1t3OycaH8nldJM
 KnqdMg6SwBzQcXrLLT3aT7fwy4OAlMkhK9xVZV4WpvJIM2iI+rQ1jEtd1bYhhYa/Yzlq
 A+Pw==
X-Gm-Message-State: AOAM53244NgaFeiY9nfoy3QL3yCLWxDT+qgVSoN4G26TG1xUSp13s6GF
 7hTFKAPGJwABIA/dxVgGFuuOjQ==
X-Google-Smtp-Source: ABdhPJylohww9dg1GYyIbVMq/Nw8ytFEu6RVmpEehQbjLtvam+DWoalMEAMP5jppFr2nQ0E9S6IUIA==
X-Received: by 2002:a17:90b:80f:: with SMTP id
 bk15mr934491pjb.119.1605647606216; 
 Tue, 17 Nov 2020 13:13:26 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d18sm19469582pgm.68.2020.11.17.13.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 13:13:25 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: containers@lists.linux-foundation.org, YiFei Zhu <zhuyifei1999@gmail.com>
Subject: Re: [PATCH seccomp v2 0/8] seccomp: add bitmap cache support on
 remaining arches and report cache in procfs
Date: Tue, 17 Nov 2020 13:11:13 -0800
Message-Id: <160564746555.1001899.9792418917631139658.b4-ty@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_161330_204686_FE30A44A 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 07:33:46 -0600, YiFei Zhu wrote:
> This patch series enables bitmap cache for the remaining arches with
> SECCOMP_FILTER, other than MIPS.
> 
> I was unable to find any of the arches having subarch-specific NR_syscalls
> macros, so generic NR_syscalls is used. SH's syscall_get_arch seems to
> only have the 32-bit subarch implementation. I'm not sure if this is
> expected.
> 
> [...]

Applied to for-next/seccomp, thanks!

I made a small tweak to the last patch to add more details to the per-ARCH
help text, and to drop the needless "depends on SECCOMP" (which "depends
on SECCOMP_FILTER" was already present).

I successfully build-tested on parisc, powerpc, riscv, s390, and
sh. xtensa doesn't build using the existing Debian cross-compiler, and
I can't make csky with clang work, but they look correct. *cross fingers*

[1/8] csky: Enable seccomp architecture tracking
      https://git.kernel.org/kees/c/ee7ce951028f
[2/8] parisc: Enable seccomp architecture tracking
      https://git.kernel.org/kees/c/7f049cc068a3
[3/8] powerpc: Enable seccomp architecture tracking
      https://git.kernel.org/kees/c/95f8ae2624a0
[4/8] riscv: Enable seccomp architecture tracking
      https://git.kernel.org/kees/c/8f9f0f44a37b
[5/8] s390: Enable seccomp architecture tracking
      https://git.kernel.org/kees/c/5897106c6902
[6/8] sh: Enable seccomp architecture tracking
      https://git.kernel.org/kees/c/75186111c257
[7/8] xtensa: Enable seccomp architecture tracking
      https://git.kernel.org/kees/c/4f408bc643aa
[8/8] seccomp/cache: Report cache data through /proc/pid/seccomp_cache
      https://git.kernel.org/kees/c/49a6968cc78f

-- 
Kees Cook


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
