Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D995EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AS0Du74noyPvbAopQJyI8OckZopqMoIkY3+C5vcQlHM=; b=neDxs8mrJePlbJ
	wbIFa86571AFKtFX2ZaETdvxVhQwnn2f+PkJCQTV/RnEWW0L0OIqTHLyj0u8xFhZrPgG3zj+BsFC6
	B++9/1BG4gL32y8GgD5D2b0WYmO8fdCpBQNBPKAA68C6VmfqnzTpKTB9hz+JTuAAUFkrYdlPZd+df
	r8QhJ1AsbWP35vZoExgIO006rK47VA502OIUdp9JBlMGnQg5jo9ODpLOAV59fihyzow4HItHroIDm
	1ixyiJuRyMP5DFDC1NUYu3gFM+ruk9hvkcZfPd7ijDT4LeNG1cBY1pnGTXt+phRBExoxi5xcSmPEe
	WS5EPs4EfCUGrxzhNn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJa5S-0005c2-1j;
	Wed, 12 Jul 2023 13:40:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJa5P-0005bA-0W
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 13:40:57 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b89600a37fso36249945ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689169253; x=1691761253;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3R0+IQvkrnQnU39Oyvspo6kg9ZBUBh3NOpdgKbP28Q=;
        b=kUaPpTjzrSmJSf3A/0N8Bjx35pzJ+R9vTPioEu+jki4TzCHjwK1QXrCxYvvcBfpiJ+
         Q06ZeYruQPizj41Kmb9QPpdhgG5O8S8WKlIPcUZSdIwoA7q9kViyX08OhNXmtX7q2Yhd
         veodMrjzSg3UPqUd840f5/jRUSgbbxlWJJISzHRQ9jSIAckUyw7w44mS+2IaZ4yWoYCI
         0Nke6G6TjpQY9PsgLb9GvhrPhCP5CuKOy/F+vzVtfcPkHW1KfUhIcyxjKXK6swxg4vmT
         0QxDvct6iSuEzMHcWCHEsc+bzitxb9npB5cuhGrzsBVz6NFFMGlPmWkg4iEQMjSqjt6b
         J5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689169253; x=1691761253;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3R0+IQvkrnQnU39Oyvspo6kg9ZBUBh3NOpdgKbP28Q=;
        b=eXikbFizwiPZlRDNj+khu+5IfjtCnMzERxs4pqA8B+XuH8gpJtw+0+RWbA90/inacf
         WV5w+Z6WV+lO7GzCviwoJXYx0B0Kff7IMHpEGPPsfSvTeEBIovbJRbmhbxPwRy/2ndFW
         j9Ljf5K2fAmZ9AhpZjfOZst3V9vm/LWHbeRsGw80Xo/Qs7guwZPIQfGz0T1I1vGZYPW1
         Nzhu2VSpw5XNnryYE9K5dGWpxRe4EZYLtfR4Od67QDuprshDTQ86Dn1wtcHC0GWZjhln
         4+isyN2Q1tdf5v53HQT7kGAX1GXw2qDPL+IyGhF6ZzaM5LkO7PmGhjxS2bsmGh2BfV/h
         jl9w==
X-Gm-Message-State: ABy/qLYsZKxB5aavTyoG02TniMvgUpCcCxJQfgNMR8WBV2YHRLo+Ms44
	u2y15aL26HSa0ItoEX4+81moMA==
X-Google-Smtp-Source: APBJJlHqWGwANrvcMUuLz3oxOixxg8JACWF4MUlz5eaWWdretSN+IWL9V6Ed/DMFvROe8q5DStA27A==
X-Received: by 2002:a17:902:ea0d:b0:1b6:bced:1dd6 with SMTP id s13-20020a170902ea0d00b001b6bced1dd6mr17088119plg.35.1689169253365;
        Wed, 12 Jul 2023 06:40:53 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id bd5-20020a170902830500b001b8b4730355sm3941611plb.287.2023.07.12.06.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:40:52 -0700 (PDT)
In-Reply-To: <20230710193329.2742-1-palmer@rivosinc.com>
References: <20230710193329.2742-1-palmer@rivosinc.com>
Subject: Re: [PATCH] Documentation: RISC-V: hwprobe: Fix a formatting error
Message-Id: <168916915823.11099.3749390544258653138.b4-ty@rivosinc.com>
Date: Wed, 12 Jul 2023 06:39:18 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>,
  Evan Green <evan@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, andy.chiu@sifive.com,
  linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_064055_431166_87995EB7 
X-CRM114-Status: UNSURE (   9.33  )
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


On Mon, 10 Jul 2023 12:33:30 -0700, Palmer Dabbelt wrote:
> I'm not sure what I was trying to do with the ':'s, but they're just
> rendered to HTML which looks odd.   This makes "fence.i" look like
> "mvendorid" and such, which is seems reasonable to me.
> 
> 

Applied, thanks!

[1/1] Documentation: RISC-V: hwprobe: Fix a formatting error
      https://git.kernel.org/palmer/c/d6e724d3ef0b

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
