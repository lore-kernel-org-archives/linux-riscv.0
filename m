Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4029AC7EE25
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=410HLikwDbLDQn6EylZDBrKyf+KGZfF/uHEadqFSZMk=; b=zuANz6Kpw2iNsm
	fUlOvmuOrIKSCi55A+rAALZKpJVhOPp4rBGXbmUuLK2N2lbDiiM0ukZ3t4Qpg9jcNa/8WU1Kn5Jfl
	byr9UFB50+viBEywlEo75w1QzEKxNKLfAX6ibDZ5zmBrnCOJS0lyqg35mTdoIDAxIXKuWSiEZr472
	LNrmlwe9spl4ETcOmAEj7E6HyNoDzU+LR3ExYPNJkl9jlriQ7a5pCNO4hq0U1U2P8VZZLfJ93B4fU
	JPv3xaeXoA544Ov+vHEC1XY8R7UYTPybZbnLyOGFVFhf8Xf4Jw0IxSQfyR58DLIKqhYNgr7i/PwVq
	cCPz6l5LEOdpDqvgsvfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GGb-009ZGf-1V;
	Thu, 08 Jun 2023 14:05:33 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GGW-009ZFE-22
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 14:05:29 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-25695bb6461so1339229a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686233126; x=1688825126;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pn+QJTHajWfG7d1v3e1LYOVtDbu7eUfKqZSk1uMhiJI=;
        b=qdcSAqjzQG9AgkHSgdnk0Q0Z+MkVX++FcEHQVf8BVaTmnCKgBIpAn90dZxbpBQwvx/
         w0RNl118wFkBM/N7KtDulHlMQvXUFeGrxPgbq5w9gh/et7LMN6EGej1blWrtEz2BKj7P
         DTjloCnC4fobsR2GdM10J9CZtzrhQtjmo+z3xMEk9avk35i0e0lxthbCuui4Nv2HZQX8
         1oy8hF4VG35B6a3K5+pYdkH3rTlAL33GYxkGZJQqkmKepZWsKGqv4NK4XDJQhUpRxaDc
         0Du19kaXGTQ9NrufuOvcs0BXYLWGTp+6yMogN58/deNR9BOhndXpKcgbTF9OzTmBomnX
         T6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686233126; x=1688825126;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pn+QJTHajWfG7d1v3e1LYOVtDbu7eUfKqZSk1uMhiJI=;
        b=cKtyIxaIRJTuGbgbILNSuDPhFucDL9B3ymObhGkX/1oqOHkJo4/aqH7Mqx7As+rq8O
         NyUNAwHRjvSdJB5wnItcMQgbeMWbcqmryQ3AzgQ7nfOL5rcnfsN77FnYN6AwPbnj1iMS
         nMtx6E/RvBOcvLqCPD0mWuW2FvY6TiAj0QUfEYPohNBRpW/QApdm1Mp51J0ixjalZimG
         A5lnLtTf7pHtkd+S4euIY8hLq7GGkaCM20tDkNfa4egHkZXprV7SZiAgJrdPVbL7vZ5W
         vxVwl+qOOCf39pMGNO/54o4e63DxJm2OshnT9HmpBDqiVvB8OOZ2ubo36oZOy2O5xxsu
         jP8Q==
X-Gm-Message-State: AC+VfDyUQCwN+efsVjrrNZgtYtXlEPtOo7So8ceRKukuIUb14+CMefkX
	sGoNiQB8VuQK/Y77HC3HKYgyxw==
X-Google-Smtp-Source: ACHHUZ5qj7JpWv3n5h049mcDRbvrnPWU2pxzum1X6mufnufFFDh/MhtDwjz8FcgngHxSziImKBqMBA==
X-Received: by 2002:a17:90a:190d:b0:259:43e1:c81e with SMTP id 13-20020a17090a190d00b0025943e1c81emr2668601pjg.12.1686233126458;
        Thu, 08 Jun 2023 07:05:26 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b0024de39e8746sm3109142pjt.11.2023.06.08.07.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 07:05:24 -0700 (PDT)
In-Reply-To: <20230607125851.63370-1-alexghiti@rivosinc.com>
References: <20230607125851.63370-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH -fixes] riscv: Check the virtual alignment before
 choosing a map size
Message-Id: <168623309504.19530.15946291448306028872.b4-ty@rivosinc.com>
Date: Thu, 08 Jun 2023 07:04:55 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Song Shuai <songshuaishuai@tinylab.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, Rob Herring <robh@kernel.org>,
  Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_070528_716936_29BDD2B9 
X-CRM114-Status: UNSURE (   8.63  )
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


On Wed, 07 Jun 2023 14:58:51 +0200, Alexandre Ghiti wrote:
> We used to only check the alignment of the physical address to decide
> which mapping would fit for a certain region of the linear mapping, but
> it is not enough since the virtual address must also be aligned, so check
> that too.
> 
> 

Applied, thanks!

[1/1] riscv: Check the virtual alignment before choosing a map size
      https://git.kernel.org/palmer/c/49a0a3731596

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
