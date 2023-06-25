Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76381EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIswodixXEiuJAzzElrHgJK4FgGP0VIpa1Po7kTtd5U=; b=PYFdnsL7sXZ1Qb
	kxoyRDtkITuK0xg5eGCwbJTIUlBGYn+y+EY3ET/aU01JkDziTmEkcssTD+knrukM2iMt9ms7yYFWZ
	9dk7WWfEm6RcVYfOS8kR7vbCelxG+yu2mBKn36mt+3+l7dDQzjzzxTyQMynreXcU2sgCw6CIR5XSi
	0UU5wGapU7qe/eyuTRrsm2LyzbpsVIONmLCqhD0UtgJJO1mzgxKpTd2ZScpMsxUgk5A0lsB5x+0LE
	O34lxA95h/zFZnqdKR+JeyJBdV1qVMiZKp+5ZPtv3OGC84SELMTJlud2bgRTjrBm5tvUjRgrsbOHP
	DEGq6ME/EaKoRfFVXoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0i-008u0Q-2s;
	Sun, 25 Jun 2023 23:19:12 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0M-008tsz-2A
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 23:18:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-66615629689so2404853b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 16:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687735129; x=1690327129;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggy/7h1OPvstNA0LMyWIdKuG/UdvrrY9huBZRZ1dffc=;
        b=FPJt8W4ID6XMXNwf1/VDKjHKddiZA2HyalGr4b7xUSwxScRpb8jmJ10eanIKIZv6dP
         Yt4Aia8ROJ2su6ZpuuAupfSD8XRUvCxQBYSb/hIjFjEnwshNVvsn3RPlweXpUTKKqccl
         kNq84gbcwQSW6bWF5cBkMdTLfcE7R4Y6PU8q7pk5046SnwEfhl+wqnzEDBsaiqAaIC+5
         rRNOUEwQDWq1GUQMEiRLSQJwFJHNLwi4A1Bk48kf7khPsYQmDjfmzU8FyRRdEUkEKey+
         mtF6v1L0ApdP+yH7YcND616lDMDQ9oFg5m3/2SWCMulebzoATcU4uXNcwEg/y3Jk5Cbs
         vDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687735129; x=1690327129;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ggy/7h1OPvstNA0LMyWIdKuG/UdvrrY9huBZRZ1dffc=;
        b=apOCqReoitENfaLbFHMotLIHb/DKKYJUiOM/xkezaA31gEdVZ8UTr/gc8n3v0c0jhr
         LFYRQgA7zYM1WpYQVLwy44Scngse7NrTMlm6iWGHiJ0uEw7WxBpoV/q4hkedPVp/AM6c
         0mIQ7AW3VZjgr2iCC0BV3UGRFII4Nm40G7ZTCiidlgjNOWGQk/dV2HTgkhKw0y5BFLut
         hUfx120fgvgYmS0FFkihntyklH1FZoCYwCKIlfO87xEWIh0Ju/rHdMnDxEXM+daGiZ73
         j/e7BD9Ov4k5ElMxrDO6IH0yc6pDcuWjw7kpUU9gqLsycEO15WsrYE+f8sk8mit1QMvE
         Dc5Q==
X-Gm-Message-State: AC+VfDyzuzEBu5Ool8kyLfnCN8zZyKvFST9xXzEzuVAuKWP+SRKiN0Uc
	00dN9WhVwGlGsVVmJJMaUBe9Xw==
X-Google-Smtp-Source: ACHHUZ6STT7aK+LnRIHxE3GjBnB8LVhIpf1/SkLYkFWTvrD+zpVBcDnGSskJdr3AwnPeVhacnd1DPA==
X-Received: by 2002:a05:6a00:1804:b0:667:e17e:85bc with SMTP id y4-20020a056a00180400b00667e17e85bcmr33742884pfa.0.1687735129579;
        Sun, 25 Jun 2023 16:18:49 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id m18-20020aa79012000000b0064fc715b380sm2693121pfo.176.2023.06.25.16.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 16:18:49 -0700 (PDT)
In-Reply-To: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
References: <20230609075049.2651723-1-songshuaishuai@tinylab.org>
Subject: Re: (subset) [PATCH V2 0/4] Remove WARN_ON in save_processor_state
Message-Id: <168773507361.1389.9680109116196931036.b4-ty@rivosinc.com>
Date: Sun, 25 Jun 2023 16:17:53 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, chris@zankel.net,
  jcmvbkbc@gmail.com, steven.price@arm.com, vincenzo.frascino@arm.com, leyfoon.tan@starfivetech.com,
  mason.huo@starfivetech.com, jeeheng.sia@starfivetech.com, Conor Dooley <conor.dooley@microchip.com>,
  ajones@ventanamicro.com, Song Shuai <songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_161850_711318_F921983B 
X-CRM114-Status: UNSURE (   8.76  )
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


On Fri, 09 Jun 2023 15:50:45 +0800, Song Shuai wrote:
> During hibernation or restoration, freeze_secondary_cpus
> checks num_online_cpus via BUG_ON, and the subsequent
> save_processor_state also does the checking with WARN_ON.
> 
> In the case of CONFIG_PM_SLEEP_SMP=n, freeze_secondary_cpus
> is not defined, but the sole possible condition to disable
> CONFIG_PM_SLEEP_SMP is !SMP where num_online_cpus is always 1.
> We also don't have to check it in save_processor_state.
> 
> [...]

Applied, thanks!

[3/4] riscv: hibernate: remove WARN_ON in save_processor_state
      https://git.kernel.org/palmer/c/91afbaafd6b1

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
