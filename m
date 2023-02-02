Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93626C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 23:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yiGCJ4pfcmQBoJ3ot0AVDGLSRJllSwVIfjSVHR6ygck=; b=U70pxj8UnLEp/f
	9vR1q7YWhi2X3gHWR17z6lz2Ln3iGrv0+C5K+Q2eYS0OjbxV4exqnK5ppArxeCsBmzseeN3cB+eel
	HyVN7rfLu6SGa996zWDsVqEUlb9dalUB5z21fHl1xsuThJBJCx2ROlTSrKKMyV/P4w9+cvLNFO1Pp
	HIgj4FvPHl11Pc+mR63gps5SfEKaopm3OsxghIy0kkOsqsd9l/UppC7t5vMj9Dv66UOVzubROXeUc
	rUsSz8TFCMoHUkAY2V7NcIg+ae7+KuBJl9JS4KTvILrbH7T869LbOgGF07ikczfgP19QYefjPvfq6
	xpvrLB9llyiRpoBaiBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjAu-00HQ5l-88; Thu, 02 Feb 2023 23:39:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNjAq-00HQ4W-VY
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 23:39:26 +0000
Received: by mail-pl1-x62a.google.com with SMTP id n13so3542803plf.11
        for <linux-riscv@lists.infradead.org>; Thu, 02 Feb 2023 15:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXXVJ+msV45Qb+vh0t5ipeKr8C3zJmRv17wIZwWcgns=;
        b=bUCtFvEXD6yPv73eI9/frajghLKFWIQxhBxdJesonQ5XP+UXdME7cpeOgK4rc786JJ
         XvMRbcY/X0BqemsslpGFX/iD13nDwtEhNX/0dHMwBA2C+0+I66A2i7ti4Hpu75TOA9oo
         EmWCXc9n1mGa90abLPTbR6kylpZlE/D2fMxOkg2MemTXRNIdj5UDRE491IANxuTTfB42
         QoDE8OwAdwzPM6bTKZ7qZ4j9lj2XhvhzsRggEo75/Ed6s+1cXD/2fzb87UaHZPX/084b
         /PH8o4c9Q8dsaDiekx7tyJGFOYnmMV2gp+RoJBr7EHtlyGkPrQpByU7/wfN4kibri0GH
         P48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXXVJ+msV45Qb+vh0t5ipeKr8C3zJmRv17wIZwWcgns=;
        b=C/gDV/n9dHI3T9ML0dxQZPdVhhu73pcFSsGjYYwsrx+dOH4fMa836ZduBsibqRNHkv
         uDoOjSPmiALC4VV5GHS5S2FTy+s2+BOCjfhyA24yOzj06GRIiMPjWCCi0wpiV1M0712j
         JkLYonvHjCYfNNNoy80p/quO6aS7/98D3jo/5ieVJrA8SNWtKllqYwFsv5TabD7XZR0l
         PN1It/7H9sJDsZi0AGEwOuSj8OX9vXsX+qL1hW/f37hLci4noAFi5scCPut5rckXL6EF
         crUNaCP5Kw+itoJgNAXlUaHPUaFc3ZAEhsdIC435osvtKu6Ghy11o371cZb7xE+aBeCr
         CH8A==
X-Gm-Message-State: AO0yUKWofmJiGSCAqb278uyhEir83tW+iKbvYjW118ECAYW9n38lTSc9
	JkB7TMPI1eTr1QmvdtoufEV/5XAR6kuZ421f
X-Google-Smtp-Source: AK7set92nrvDKCf34zX8vY+Vh7qcSRO0xbeEbkvNo2hMVUn/i+O2G54FP+6PpZcgh4guvLG0QjkwFQ==
X-Received: by 2002:a17:902:e80e:b0:196:8798:57f0 with SMTP id u14-20020a170902e80e00b00196879857f0mr9121807plg.68.1675381162901;
        Thu, 02 Feb 2023 15:39:22 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902c1cd00b00192aa53a7d5sm237519plc.8.2023.02.02.15.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 15:39:22 -0800 (PST)
In-Reply-To: <20230113212301.3534711-1-heiko@sntech.de>
References: <20230113212301.3534711-1-heiko@sntech.de>
Subject: Re: [PATCH v5 0/2] Zbb string optimizations
Message-Id: <167538114992.11760.6205423234384730716.b4-ty@rivosinc.com>
Date: Thu, 02 Feb 2023 15:39:09 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: ajones@ventanamicro.com, jszhang@kernel.org, Conor Dooley <conor@kernel.org>,
  Heiko Stuebner <heiko.stuebner@vrull.eu>, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
  Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_153925_032168_1991BA8C 
X-CRM114-Status: GOOD (  10.85  )
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

On Fri, 13 Jan 2023 22:22:59 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> This series still tries to allow optimized string functions for specific
> extensions. The last approach of using an inline base function to hold
> the alternative calls did cause some issues in a number of places
> 
> So instead of that we're now just using an alternative j at the beginning
> of the generic function to jump to a separate place inside the function
> itself.
> 
> [...]

Applied, thanks!

[1/2] RISC-V: add infrastructure to allow different str* implementations
      https://git.kernel.org/palmer/c/56e0790c7f9e
[2/2] RISC-V: add zbb support to string functions
      https://git.kernel.org/palmer/c/b6fcdb191e36

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
