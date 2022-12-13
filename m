Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ABBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BFi+HHlACVyk9Lj+ZcQhsydIpgUktutZnzdpvrwhYI=; b=DWuWXvX4pGeDq4
	j/bzdDs6Lgw0P6PBQZ3QXGwjInulnBB9YkKK2tFGSdp5fdJZpEhlxtUAi67x9YkbIwO6OzowYMUZy
	+9yaks3I9vm/ZwroKYfpCOLpw+Gj7sGHCNd0a5IyzI074UbGbG+oA/kngD0jlUnCL39QvJmtwNV0E
	u8eFkR0B0ET6Y1sP2+Ym3OZs91E2g56I3BgF2pTMDCXBLGDpFIk6F6esZ64jLcIfdrp3LKLrKJWdL
	9iHy6U91rTOa41HLILJ6EMiklhK7ULe1MtUMtUKDNZH38zq+0PYoYW2Kz3bxhW46UiIDvF8Wahadl
	+AHjUonn9a4nto4gQXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p582p-002nsA-97; Tue, 13 Dec 2022 16:22:15 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p582m-002nnR-EH
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 16:22:13 +0000
Received: by mail-pf1-x432.google.com with SMTP id w26so2540178pfj.6
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 08:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHkCheSVYyORaWLusgzRmwOntbPzGslP/lnkmmbUUJM=;
        b=ZVd5+p9icA+7v0H3rz+WLvZkK/mMDsOPsUCPxb+gwUrcTkANQUcLXVYGqg4meDxCyb
         4hSA7Zne7Ru3/1J144rfaaO+ErJWK5yejZtN3wRIHiM45ONMN9uJ0MZZbLt9hUO/0Plf
         Q01PO6nd+beQGd3lUl93AlmCmH/yBjroJMvoOdhnRqtzu8eQBuiSSX0pb/tCILN6+rY/
         QJRD3U5lkQBcgviFf3IpbSsHfxmWiHM83MWCXkwuLKsO3TwS6kYcboufb22l9sZVDJNg
         0bE7UJCYDBt9xWtFLzFrfY6R1KbH0+NfowQlmaFER8yzI8PxhEk1///Vnfz28hgEHW6f
         8ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHkCheSVYyORaWLusgzRmwOntbPzGslP/lnkmmbUUJM=;
        b=ZK8kMVNOWIB24is0UAfA7NGo5jb9iwc210xwiaQIYjoBl9aNWAEtRET6SNcCd0gPi2
         7QkNtzskKTNv9JjT/OVTI1aOttro/CUrsSa1isBf7yRPUXEnya56dOPMXHuTfqmEz15x
         I14aCuqcKclKaM64yDi1NdsekgY7EXyfMR2Fikrj3xpMOLesx9l8hawR/WKHO0Y5z09v
         gYRpX612R9grLw7X3ktJ3uHuIGMdFREzLmLWgYnD6M1zJX7xK4vQ/VtV+dofPPGuoMt4
         yzHNlKkVuOWFXI2z1kiTsWj4cErAk14nNc3Djd8oMRLRGHOpkjrcz/+qn3k4FGlc3HOv
         ZyIg==
X-Gm-Message-State: ANoB5plSk2xAzUc2+09yJJSJ8T+OvTWVvHdTFjo20LkBFeBCCwbY2nxq
	fd16kTYkdvPRNat/j87AWQLAJw==
X-Google-Smtp-Source: AA0mqf7D7Zd9V6SYGaRgflaR65WiIVEhNph6QxaOCD0LwUK1z+bmZuwi9ObC+PUy/eLdbTGZKWgYMg==
X-Received: by 2002:a62:3342:0:b0:575:ff07:cb1e with SMTP id z63-20020a623342000000b00575ff07cb1emr19610871pfz.31.1670948517279;
        Tue, 13 Dec 2022 08:21:57 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id i63-20020a62c142000000b00572198393c2sm7846700pfg.194.2022.12.13.08.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 08:21:56 -0800 (PST)
In-Reply-To: <20221201113750.18021-1-ajones@ventanamicro.com>
References: <20221201113750.18021-1-ajones@ventanamicro.com>
Subject: Re: [PATCH] riscv: Apply a static assert to riscv_isa_ext_id
Message-Id: <167094850226.7325.3598403274018767080.b4-ty@rivosinc.com>
Date: Tue, 13 Dec 2022 08:21:42 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
  Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_082212_494875_75F702AF 
X-CRM114-Status: UNSURE (   9.59  )
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

On Thu, 1 Dec 2022 12:37:50 +0100, Andrew Jones wrote:
> Add a static assert to ensure a RISCV_ISA_EXT_* enum is never
> created with a value >= RISCV_ISA_EXT_MAX. We can do this by
> putting RISCV_ISA_EXT_ID_MAX to more work. Before it was
> redundant with RISCV_ISA_EXT_MAX and hence only used to
> document the limit. Now it grows with the enum and is used to
> check the limit.
> 
> [...]

Applied, thanks!

[1/1] riscv: Apply a static assert to riscv_isa_ext_id
      https://git.kernel.org/palmer/c/e923f4625ed3

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
