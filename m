Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A3BC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYXq+/MdLePpOYIsaO+ICCmqH4W5ZbucjkE/wWGonCM=; b=S0e/F1eJH0QPWH
	Abl/mtx9J5mC9zsNCEA7y4uleGKbgQqS8rbbaQhVIwGQ6mV72q0WfQVROKr6birZBbhrOzabvOXES
	Gis7nmiiewnL9Jw568B263AUpPyoef1cx/jBSdFzcSC13qggoHP7pJvcN3Fkns78wV7+pzC+82VXU
	wlb91uySxiIkNa2hwpbVEzVFSmdDJ6apMkGYyTpoFdMJT0NlHYNT1pbU8r3qJ+/azHteV2BxROAPP
	ieGPVey9/YLqEnJuYzZ7+HPwcM6EhDxlqnSRmNmnuJXLqYf6bTpOWmImYsXilVgsmXZNwMobo9PIi
	YquhxoRV6aEINF+4fM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NMb-000DwJ-2z;
	Wed, 31 May 2023 15:03:49 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4NMY-000Du5-2u
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 15:03:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-64d41d8bc63so4388868b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 May 2023 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685545424; x=1688137424;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P3/iaRtzrgno6iuohovK7fRRccPrcE4URn2TEOy4ck=;
        b=fM+Di2kgOtcEyHpooWSysQ83fLR+lM4166t7n/Ru5EXmlXx0gc9beM7Jb68r1RxONl
         PS4datB5+HKW3aG0KzEPJ67/6fiysOX8Awk4AzgE1yeX47zVXJ7EuXJnmuKjz9Npfjiy
         Qzm5sqyeFoU+6ZIshbF9biyx9iZuzcRY95/bEKU1QzZIdJad2VPBAwt4+ij8vcvdmmXT
         qS0cdPmqiWyeo5eXL55GYcswjdiV4B8dm4nn1w9pKZb0a+eltUGszKgWlbT7d2aofaPR
         voTBhghSZg8pHhrSp2DEs1KUM462v0OpjOgDn2+U8dSq07YcLS/4OagouPY1PUomYvuc
         g5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685545424; x=1688137424;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7P3/iaRtzrgno6iuohovK7fRRccPrcE4URn2TEOy4ck=;
        b=iU71dz1cF5KFQkypptmkd8rQwhiDF3LZHvYLsU7K+dtxWqxsqMjyyud6FJ8bwQGTSD
         50LYiM6cl9/r7UZiSpsNpuBfAWzhI0/ch1VxMCJPEyyMxHHkoW/5SePDPh9VBPyLkd9x
         T3Lu9INLyds+wY+N/us1FGv60gt4VMyRU+sSysL31uYHAXHQOLYg3yaRknFvBrU9U/l/
         1PPIc6mVPCJNzexsvGj2sfupSLKPB4u9MCwsh0AQ/EEEq680pU1uuTR6R10frfaOs/9Q
         1nX8x9AOytqOjxgkK0D6DdMRwEaIJeMJXAoRI9r+SqR8lgCZIlCP2i1zux3nIq9i0O83
         lr3w==
X-Gm-Message-State: AC+VfDwvBrPp5nZhgbFZF0+3z5z87MJOjdhS8jma1TKRnh2IVKaBme4w
	jIZRYyBTsXQ+vDGdl5qhwXXxF2G2TEnsX39yVXE=
X-Google-Smtp-Source: ACHHUZ4ux4FXbJUnXTvWpgX+ERHyZRis8AwzVJhnQ0Z+pY+eUo1tcGF2RSDR9jkEnHsyjCrcfWbwLA==
X-Received: by 2002:a05:6a21:6704:b0:10a:9f45:e3f with SMTP id wh4-20020a056a21670400b0010a9f450e3fmr4775740pzb.12.1685545423893;
        Wed, 31 May 2023 08:03:43 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id pi16-20020a17090b1e5000b0024df6bbf5d8sm1376271pjb.30.2023.05.31.08.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 08:03:43 -0700 (PDT)
In-Reply-To: <20230526154630.289374-1-alexghiti@rivosinc.com>
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Message-Id: <168554541145.21606.17332931108969315151.b4-ty@rivosinc.com>
Date: Wed, 31 May 2023 08:03:31 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_080346_938172_961513D6 
X-CRM114-Status: UNSURE (   7.60  )
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


On Fri, 26 May 2023 17:46:30 +0200, Alexandre Ghiti wrote:
> Early alternatives are called with the mmu disabled, and then should not
> access any global symbols through the GOT since it requires relocations,
> relocations that we do before but *virtually*. So only use medany code
> model for this early code.
> 
> 

Applied, thanks!

[1/1] riscv: Fix relocatable kernels with early alternatives using -fno-pie
      https://git.kernel.org/palmer/c/8dc2a7e8027f

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
