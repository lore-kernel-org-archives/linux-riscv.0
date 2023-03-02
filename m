Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE53C87FE4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 03:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1/08XiMsoSCH91VKFujBpmeXv5+YoN9cnP65cKDD1Qk=; b=q9Dd2K/3H2tjpA+jajpmCbBFau
	LC5P/R81F3Vcs8chmTgbyRn0vkK7hg2Zu34LQfQ086lJUSzzX6ZyBCEsJAFidbRRbJ2TmVIT7ajQY
	B/Y60f4dCqHxyY3JWcdG4aJ1vW+uI22FgCwixRXZe95zr+sl5+6EUQQ+BfE4vIAOwFa9cEe+x3TUH
	2vf/J/gEErmWLKNx53da6SYZEFwBjP3OaYuVzzS7YYHmxycWouW2TgaOgJWkmgw+//zzBc++FC4ZD
	NRVUFZOnhu5Wc8urN70rhGsGiNEHPrvwZs90vbpE/J5rQT7wp55OUc9E6wj0kLQYqn8gNFeXyr3Ua
	7Nb6I5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZRb-000eBJ-9z; Thu, 02 Mar 2023 03:17:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZRX-000e7p-JT
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 03:17:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id a9so6057446plh.11
        for <linux-riscv@lists.infradead.org>; Wed, 01 Mar 2023 19:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677727036;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yy8ScGXaPSZXR051KFshbh6rpME2gALKfyyYjKgrOsY=;
        b=1Fjb1Ol7oyLqZePeb695gZAWNtlosNuUTHqTxxBczo/bwNsajQZ3gXYBbUqqyBGcCs
         Ll5Ny1mgiMzGgATsdQTmchHzetb9I0JwA8PpRaYGw3/A6L46QFVfdpOPJFj9ctQ65OK1
         8O1h8N6pYgzLtxrOlXGs5+KNdOf7N+gnG3b+wGWC1ifpnuUZqVnfQwWlphqMahuwSL+/
         5LBrbVsKhqj0n6VcRvkh39rmW1c5/jA3ulK6ysyYlLBYWSZ64Pe+GCo5gxF7BWjgPivS
         aI6lGqJruNSWZlJxgdBIuZ1pAVTxEfyMnkq6gs5btO6Sxp1aPQZrm4U2swNf6BpPbzsU
         6Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677727036;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yy8ScGXaPSZXR051KFshbh6rpME2gALKfyyYjKgrOsY=;
        b=33zEbZWgojNqw2HT0ZeqwGjTRtHV08HPMPPC01ndqL1LLr49gqx/mELauiGpb7fR6H
         /a+gpDCJaGjx+wbSCaob72emC87Qd3WHOL2CeKntPIQkTwKklLcon2ts1npxG0A99Hah
         iN6oaGGyNmnYhkad6Ici8AbW9pWAycy+thsszADGPPJbS4M2Hpru7/5QvCJ9gct+7Rw1
         nrN2gEsioBjHINQYrYysGcXkvUwe4kzH6QF51rhchhdhMEoVPOVD2p8GNBxJ0qqjwuxa
         0PW0S0INeedXV7yclOXhO7WMOFmKcZ1Qs6CwdU3GovkWDVVy8ki31sy+Wt8Y1zEyXj/E
         4Vqw==
X-Gm-Message-State: AO0yUKVZQh9/FNokowkg14XUm+7hgIoLhZYHz56FJwdy/KQfs4w6UYwe
	oCBcgLNetXBqXARD4/wXqNIdHw==
X-Google-Smtp-Source: AK7set86iSrspYl9o5QA4dvohEJpeugUFFE2LdL8HMA1D0E7CvP+4EY0c6yOV5XVN8vGyzkrQJiagw==
X-Received: by 2002:a17:90b:1d12:b0:238:e9:8994 with SMTP id on18-20020a17090b1d1200b0023800e98994mr10162686pjb.0.1677727035890;
        Wed, 01 Mar 2023 19:17:15 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v14-20020a17090a6b0e00b00233b5d6b4b5sm471042pjj.16.2023.03.01.19.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 19:17:15 -0800 (PST)
Date: Wed, 01 Mar 2023 19:17:15 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 18:50:05 PST (-0800)
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
In-Reply-To: <20210316193420.904-1-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, dvyukov@google.com,
  linux-api@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr, Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-b5f934ff-a9bb-4c2b-9ba6-3ab68312077a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_191719_877451_F04FC804 
X-CRM114-Status: GOOD (  16.99  )
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

On Tue, 16 Mar 2021 12:34:20 PDT (-0700), alex@ghiti.fr wrote:
> Increase COMMAND_LINE_SIZE as the current default value is too low
> for syzbot kernel command line.
>
> Reported-by: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/include/uapi/asm/setup.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 arch/riscv/include/uapi/asm/setup.h
>
> diff --git a/arch/riscv/include/uapi/asm/setup.h b/arch/riscv/include/uapi/asm/setup.h
> new file mode 100644
> index 000000000000..66b13a522880
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/setup.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +
> +#ifndef _UAPI_ASM_RISCV_SETUP_H
> +#define _UAPI_ASM_RISCV_SETUP_H
> +
> +#define COMMAND_LINE_SIZE	1024
> +
> +#endif /* _UAPI_ASM_RISCV_SETUP_H */

This is now back on for-next, with some commit text explaining why it's 
not a uABI change as per Arnd's message 
<https://lore.kernel.org/linux-riscv/874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com/#t>.  
I intend on sending this one for 6.3 as syzkaller depends on it.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
