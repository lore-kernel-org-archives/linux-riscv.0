Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C5ECD11DD
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XObv6AHdBWEZp3P7OTybeA505AsMtmPQvplcCpiFtYg=; b=2RtLbPh8Gs6Uv0
	8tuE5TgX58hVx7WNiiIK+0vw1HwGIXmLmreu4DTOXgRhcX/U64O2ELDBUicC7BYj6Yi6MowJgIZ8v
	gi0Vm/9WUwgpogPtd2rXJYWTRNvdGjN0gpOl+XGSSdIr+Ote8grLbPe5csV8V1Izi6cj2H+JRVIUG
	Uqk+y2HupvF/vukdwL1sdC9P5DcnljoSbTrKbWW0XNa9WNei3EEWTQgELY/Wpjg4/IJbXTcb9yIcs
	6kl0WP+1O+IAkmgXu3k69byN0cRoDtssC5PIStGI2aOmMa6lwlJsdwmWC0Y1t9GYGaZxYy1ftgj0b
	2ahnmbAlHEgi8aYlopbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpTpa-00000009LJx-3klH;
	Wed, 27 Mar 2024 14:00:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpTpQ-00000009LEe-2vop
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 14:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A366FCE2271;
	Wed, 27 Mar 2024 14:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B1F7C43390;
	Wed, 27 Mar 2024 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711548029;
	bh=BA+TuURoQlOCduEndpylZLvO0UX6c1g+Nv7/szZ91Qk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KC5WpOj4Ln1dTIld9MMKLLVD3fI+1ThHwdLlTTLxXJ4Ri1kQYJypOuvSpD52bO2XB
	 t3sxXsZTmh3vxAdJ5FJDV2K1LxEAxQHHCbc22KLFAtX/G1MZ4wjilN+AsxF/315OPe
	 +rWVRaFSMqD5ztKUxu3LyTDkcI+0YV0SXiGOGpLpmAJ5BV/oVqO3sZH6b51fH3+oEf
	 i+WdPFB7VR/ABSMgGvZBzNIY9M0mKBVjr7Wn5l9BO7JtmgyZoG3Y5JiXym6SZkvi4k
	 /8dI2vpTg+YPy5DdZdsZ1OEShEhH9HQkgQZZzq3kL7NZPJaWyhGuQd2Cwunix27AZE
	 v1Nk4JsFfUdog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B13DD2D0EC;
	Wed, 27 Mar 2024 14:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: compat_vdso: install compat_vdso.so.dbg to
 /lib/modules/*/vdso/
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171154802956.9827.4136336790290384825.git-patchwork-notify@kernel.org>
Date: Wed, 27 Mar 2024 14:00:29 +0000
References: <20231117125807.1058477-1-masahiroy@kernel.org>
In-Reply-To: <20231117125807.1058477-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_070033_078793_97E00D00 
X-CRM114-Status: UNSURE (   7.77  )
X-CRM114-Notice: Please train this message.
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 17 Nov 2023 21:58:07 +0900 you wrote:
> 'make vdso_install' installs debug vdso files to /lib/modules/*/vdso/.
> 
> Only for the compat vdso on riscv, the installation destination differs;
> compat_vdso.so.dbg is installed to /lib/module/*/compat_vdso/.
> 
> To follow the standard install destination and simplify the vdso_install
> logic, change the install destination to standard /lib/modules/*/vdso/.
> 
> [...]

Here is the summary with links:
  - riscv: compat_vdso: install compat_vdso.so.dbg to /lib/modules/*/vdso/
    https://git.kernel.org/riscv/c/4b0bf9a01270

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
