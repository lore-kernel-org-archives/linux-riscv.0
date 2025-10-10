Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85AACCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 01:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sLfJbXWpgyn5B/LdQtXmj+oc1c1wvgzK/XyM3g+e5U=; b=XQZVKAi7Hw2PqXlibwoZjdkT1S
	Ra5ebC3M33dewLnBQjsB8EW4ny5JUAqLalzsS9GJ45caiZ2VzEIWKcipBG+2XgaCacF3faX4+LOzB
	FWH50SI9dxwVH0tmeyJKqGMsDW8bA0v8TD3H632VspQORGLTqqlpqcFjXZBYvS2f66yDjoxCGiDdJ
	HKEE1fzuTkdoCTM6ccc03YtT0LPJtWKJ1kcVn2wbMc3c6qJEBep4iCwPi4FSVT1fwkvg+a5as/IEi
	sABe5PhZ1FfEN4BaSdZ4mltM18zo6v81TaMsQFwlK+ZMowgr7UTYpzSXAWfyZxMRsvBqj6QN2ECTj
	BZ2fqgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v728x-00000007S02-30N4;
	Fri, 10 Oct 2025 01:42:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v728x-00000007Rzw-0t9t
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 01:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B8B560145;
	Fri, 10 Oct 2025 01:42:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376A9C4CEE7;
	Fri, 10 Oct 2025 01:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760060521;
	bh=A9TFfCDF9pgAE/Iw/EyrIDrgCMm7RRP98Y6zVUsNlaQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lY0cskXNfYWfgiFHNCyWlAODQqRTCvkg/E5aTp+2nHiQ9wUnUcHN1XJSZ3NFMxRLA
	 mp4lFpyMKdbkM9dYi9d7URhNL91ViSvOqdvrKYlh+SrrL1hDSMHTouLlxLrg4BlHSL
	 zHWvWscmv0mtP03PkWroCB5N9LVZI8tEHr8jWIyb3U8gcAy+3HtOeGEYlDwMIYeOsr
	 rnGoxGzH+ifM74p9FpS8f22AyDlgnQLlLDFHBCMsYSQ1AoeKBTPZDxOhoAH4ZZ2dqw
	 78fb1svL8n98fvmFVL0TdBr+UZIHkW+bvlZXmzHkTixcMOnCam6FPedyiLxFXFjiUc
	 HgmKaREhYpCEA==
Date: Thu, 9 Oct 2025 19:41:58 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Svetlana Parfenova <svetlana.parfenova@syntacore.com>, 
    Kees Cook <kees@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Respect dependencies of
 ARCH_HAS_ELF_CORE_EFLAGS
In-Reply-To: <20251009-riscv-elf-core-eflags-v1-1-e9b45ab6b36d@linutronix.de>
Message-ID: <9f4a3f7f-7954-f7a9-dc72-919b37adf3ce@kernel.org>
References: <20251009-riscv-elf-core-eflags-v1-1-e9b45ab6b36d@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1481120612-1760060521=:2116846"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1481120612-1760060521=:2116846
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 9 Oct 2025, Thomas Weißschuh wrote:

> This kconfig symbol has dependencies and is only selectable if those
> dependencies are also enabled.
> 
> Respect the dependencies.
> 
> Fixes the following warning when configuring an 'allnoconfig':
> 
> WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
>   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
>   Selected by [y]:
>   - RISCV [=y]
> 
> Fixes: 8c94db0ae97c ("binfmt_elf: preserve original ELF e_flags for core dumps")
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Thanks Thomas, queued for early v6.18-rc.


- Paul
--8323329-1481120612-1760060521=:2116846
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1481120612-1760060521=:2116846--

