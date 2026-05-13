Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8F9CD4F21
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyFg+ZpzR1r7K4CwrNvGEsCjySJ6l79sAsDHWuIVV5Q=; b=psZRA30JnBTBh0
	3hHOS/imtmKt53Ru14kuelJTZ7ILMtDWs9MIuq/B9GtsLtL/oTHQzUXor05IeuS8dXplQc9t6gXo9
	IXoQOQQmRBgf4l6iG1ted8lVKlKh3y5KjQ9tPljSyGm05b4pNRRggRMBpEJzD6hgKWM54lJfj/6h4
	IdmJhyhtvoscdBjYVnVxS6ClM1ECLkCsWjjWFcjtQer2zBKEkcInyBeA724EicVVzfWRf9Zo0CfQM
	bN1N5va6OaZxE4EjPOod2W3VDR2o4qitETED71FwG7hq2xCRX0sNS9mCeXtXH61kryQYNC5QkHDEm
	Zfu/kbx6uqYJIP8CYp+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIa0-00000003yc2-0Sob;
	Wed, 13 May 2026 23:01:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIZz-00000003ybv-0tGz
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 23:01:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8930B60052;
	Wed, 13 May 2026 23:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0A1C19425;
	Wed, 13 May 2026 23:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713286;
	bh=11u+GMiB7NpvoAsHw52zWd5zJPglYXFSlspfoZSudaw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ggtWO78vIy56LeccuBY8CQq7FHGfJ7Y+WiajO04PG9tx633Uv9kQU11uWr4sDzmlb
	 oTaSzWviE6eUc0I+qv5PQENZhPmNo4TwW5djUvkK4eW7PiL2HuhTfLMWBQ/fDgNcsf
	 gqI1jd7qrSRrhv50JLGBFkw7v8BSt1Dr18drsBwrEKlqfgxzhLi0LWy+UZhYqo2ETn
	 875pIYfjIUpYmMGFHV9+3525oL0t+iE+vmSx0pHHuBEaViPzV8H22JPLhgTS2qbxOO
	 Xhgrnx/VcNSM7yyMzmmI2eTaA+s47cW3wV3Fr1GeL00Yml3FOzvL2rGJUnu5D9c5iA
	 EoTEGw48URKeA==
Date: Wed, 13 May 2026 17:01:24 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zong Li <zong.li@sifive.com>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    shuah@kernel.org, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/riscv: fix compiler output flag spacing in
 all Makefiles
In-Reply-To: <20260511032917.3542802-1-zong.li@sifive.com>
Message-ID: <a407bc11-efcc-2254-01ca-607c3c62feed@kernel.org>
References: <20260511032917.3542802-1-zong.li@sifive.com>
MIME-Version: 1.0
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

On Sun, 10 May 2026, Zong Li wrote:

> Standardize the compiler output flag format across all RISC-V
> selftests by adding a space between '-o' and '$@'.
> 
> Although '-o$@' is perfectly valid for GCC/Clang to parse, But
> changing it to '-o $@' with a space could align with the GNU
> official documentation conventions, improves readability by
> visually separating the flag from the target variable, and
> ensures consistency with other architectures
> 
> Currently, RISC-V selftests use '-o$@' (without space) in 13
> instances across 6 Makefiles, while all other architectures
> consistently use '-o $@' (with space). This inconsistency makes
> RISC-V an outlier in the kernel's selftest infrastructure.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
