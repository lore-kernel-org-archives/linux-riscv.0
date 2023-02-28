Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EBDC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hU8/OArX+1KI9CzAWJ1ev/IIraOXeVMfgOszPkeTUI=; b=YgChfrWZoSaYPq
	P5FuWgP2mQ+xae/Dw76q6gBFUXVgihd2q41KOpRbjATIzh3N5ryHIz00Qt8Eisepwa1kZggSfsM/4
	pyeakf+Oy6YtD1EJ1oReMH1k/R2NttTtLkKbg9r+2Vrf2wH/1I3jySq8ihMh3fk8hXEAxZ2d+jhOJ
	xl+asngjyqfiQj17NH5mP2ElR9EK2MBRU29nLuFA3uxTzwxKWxPRwalXIytcnD3O/tUc9j+PVIs9p
	YZydwWNWgfIF0APF2C8rnUn8qTNgCd6cWcReb4zOWVB0GT/sX2XdLYgFuouToXtbv5Kvi2VxKsdL9
	7qcdnLVT2+5pzGOF5Nxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX6xr-00EFAI-19; Tue, 28 Feb 2023 20:52:47 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX6xn-00EF7l-Vu
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 20:52:45 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so10490916pjg.4
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 12:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677617558;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lyXGNk7FlexKacBj27dEmckMTH6sMBWrOvXXLtAiEoo=;
        b=doQrXDAt1jwGttVG1vfvs789T37zM1/lMF20VuG7CoABnUShbPV9s3t5pAUkbRFUM+
         7cQ8Ww0R/CjisJ3F5CR9xPIBaee7+RDnZEfhvpopDhq9haJYY82JPgOV86DGXW74PRBD
         0WN0JG1ZYjdFZrv0znpA+uQzcewroNsYVdIBpkNpkAVRARAGW74r+jRv6Nv48tQcQpyq
         6Akktzzu/8MntkD23vDR6kg7kh+1ZXxtOxdTK5rIOhZKUN8L+azf7inM9LbLDJ/z7ffJ
         6kcz4kjg9kGsyjvjBV4VOZKbzE6RJhyNFYtfpsIDmk1Ay4k52rr9LaRSp/EKNCPVG8KX
         j9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677617558;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyXGNk7FlexKacBj27dEmckMTH6sMBWrOvXXLtAiEoo=;
        b=lX9utHRdGWFBZYGATSwuP77zaNBdndhgSLew4uvkNnvLQb6EciDGtvnXafQ7Lq8ZcZ
         4tDdvlY66lp2OvlrRM4H+u1tPskcdp7R1kYA6NEaVUsuk8LwwWaGL7bJg+i4i4DtoQuJ
         ssI6FCBfy/zSTrmullHQEz1UC3WzVpBxhiMtwJHkrvuOuiRaj1KRw9poC8kJ+6gPZS3w
         1XwTFSEeS6oNO8tFimOUikhinYKYcScE3yb+lzBLmcevF7HcyuctFsqEQdvawvotQ4nS
         apbEXqVu07Mocvg+TprNKyPVuO+UQYvCy5w0j1tYFmOa7tfAHVV91aUNFB4FYQ8qsz6J
         2oWQ==
X-Gm-Message-State: AO0yUKWKjsyky2cH+Ydr2abWyiAReNcOTDeCDrUbW44a0LyJLt2ilm8t
	o7+BsLoWoD5spvbZyzeCiNo5qg==
X-Google-Smtp-Source: AK7set9eplo/mJu3gJ6BJKisU0RdvtBkHBwbUJ6DNSAdFWZH2D5//FwQKucGz6zbCzK0Al2v281cRg==
X-Received: by 2002:a17:902:fb84:b0:19e:2fe5:40c7 with SMTP id lg4-20020a170902fb8400b0019e2fe540c7mr3603203plb.48.1677617558638;
        Tue, 28 Feb 2023 12:52:38 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u13-20020a170902714d00b00198e7d97171sm6914875plm.128.2023.02.28.12.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 12:52:38 -0800 (PST)
In-Reply-To: <20230208225328.1636017-1-heiko@sntech.de>
References: <20230208225328.1636017-1-heiko@sntech.de>
Subject: Re: (subset) [PATCH 0/2] Small fixups for the Zbb string functions
Message-Id: <167761750116.11234.7293839788838839450.b4-ty@rivosinc.com>
Date: Tue, 28 Feb 2023 12:51:41 -0800
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu, ajones@ventanamicro.com,
  Heiko Stuebner <heiko.stuebner@vrull.eu>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_125244_274100_6F34BA69 
X-CRM114-Status: UNSURE (   7.79  )
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


On Wed, 08 Feb 2023 23:53:26 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> I didn't manage to address Andrews comments on v5 [0] in time
> before the series got applied, so here are two addon comments
> that hopefully do his comments justice now.
> 
> 
> [...]

Applied, thanks!

[2/2] RISC-V: improve string-function assembly
      https://git.kernel.org/palmer/c/6934cf8a3e0b

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
