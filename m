Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DDDC77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdZyyGR1wNfQuVj/cJwNXNRVANOtk+DobD4/KMgGwjM=; b=Ri/Hv+5KTGD/HR
	/VLRBGApsX9n5tnSjq8ni2/b3BlANj/oQWoYhNH7x504pzeAdJhNMoIIRKoHKxgmg87XTf3sb2Qja
	NFf6KJUMGK1v6/VAJiMt1fcpmYQZe7N3VXDBtNz8feFZ9ZSuFM+QOwr1e7UfKC0MY2pbEKCLQN5G5
	v0f1YwBTipxxBwr2FTAMFHoiyV43UOXwXA3J1Lx6Jl+mc+p7w2SIBzy+RbM4uzSFy1sg7K6OEbmoo
	EUVtpRdgijWOcwDLqXYK5VJJi84RdZpxFfnFSSuoa/2dnq16/aoXgUELGBjn0JA4OgjoMyQ4cU7Z4
	v2tJV2sPLpmYQXwtb6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prg7z-004Cdp-2x;
	Wed, 26 Apr 2023 14:28:15 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prg7x-004CcI-1g
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 14:28:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b60365f53so8797311b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 07:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682519289; x=1685111289;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJcqfi4NEDS/gG1hv5lKgN6zMX9n9uOcWUQlYRE2NO8=;
        b=rmWmWMhl46pNMCYl02KJfjZB2Bzr5P68tnYvKy3PGjqscKP68boWgdEFvw6DY9HiVE
         9BFW9M9r1Hwz5bLLYRt8GAb/l9K0gWAlKlTabXGUR/7+qLwfxCIOb89ex3wmtlzBxh8L
         ITz4i86w6I3VPZGrD4HK4c34ABTEBn1tUzH3GWiyHaEPfNWHAKQmUQP2k4IbNggEwd+X
         u/xlD8qx6MTUdeJvcr0+sUM6UEybaQLNqZex4eN5G1jAw95GeJCOz1NlY1etPwyvg1K6
         hB9vrmiDWVYAV6iACdZHmll/rKJVua8MheojhlbGrofoUC1kB0dCf6q3EF3Di+GdmCET
         eoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682519289; x=1685111289;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJcqfi4NEDS/gG1hv5lKgN6zMX9n9uOcWUQlYRE2NO8=;
        b=CL6lMhke8WJM8m05gM5OeKdN4gfmCu1BL+0Bp6SvMwXZr6IQ2TdErtwy53iWLXvPLW
         XA5jTG/Ye/yex5kNkqaPUR/oMJxZ6lUu5QCCg21dCm/8SKWXhbn5cYRy/dig9dSR0TIK
         cTrxmvVe6emAyNDTJ7J9HbNFOzrxQS4CSG50I3KMc4/eH4kxjgeBLcmEDMFKKAdWHbsC
         OZUIHj8HL0304iQSvNN3OX1vp4z0Rdz6QxJtXFuqlD/jeUG4gneX4RBKdfGKKwsbPhXG
         ElQk5C9NSN9uZhQnhYZIzc1D0WZPd/jQMonFgf7AQng9xtcnMcP/iqnWF23GuyWi7/2g
         Z+Qw==
X-Gm-Message-State: AAQBX9eVMPu0d4OXnapFjwpTNbFqbGjDj/pesLQjQz8UrpvJ6nAytJWw
	xI/9/R2qfpMgKtZGGRotcfFAcwjKslYRbOwXbf8=
X-Google-Smtp-Source: AKy350akRxCs7TonP1gzP9WOV/BgVNsnnKVETfliEzntID5BRaDew/MoU+piyD+55ef6PEXgcJC3Og==
X-Received: by 2002:a05:6a20:3d93:b0:f3:6746:ba37 with SMTP id s19-20020a056a203d9300b000f36746ba37mr17752988pzi.13.1682519289486;
        Wed, 26 Apr 2023 07:28:09 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id v16-20020a17090a459000b0024b822e6644sm7059005pjg.54.2023.04.26.07.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:28:08 -0700 (PDT)
In-Reply-To: <20230420194934.1871356-1-evan@rivosinc.com>
References: <20230420194934.1871356-1-evan@rivosinc.com>
Subject: Re: [PATCH] RISC-V: hwprobe: Remove __init on
 probe_vendor_features()
Message-Id: <168251927960.19663.8319628708059117867.b4-ty@rivosinc.com>
Date: Wed, 26 Apr 2023 07:27:59 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>,
  Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
  Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
  Philipp Tomsich <philipp.tomsich@vrull.eu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_072813_755793_2CC65315 
X-CRM114-Status: UNSURE (   9.39  )
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


On Thu, 20 Apr 2023 12:49:34 -0700, Evan Green wrote:
> probe_vendor_features() is now called from smp_callin(), which is not
> __init code and runs during cpu hotplug events. Remove the
> __init_or_module decoration from it and the functions it calls to avoid
> walking into outer space.
> 
> Fixes: 62a31d6e38bd ("RISC-V: hwprobe: Support probing of misaligned access performance")
> 
> [...]

Applied, thanks!

[1/1] RISC-V: hwprobe: Remove __init on probe_vendor_features()
      https://git.kernel.org/palmer/c/bb3f89487fd9

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
