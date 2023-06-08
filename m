Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6383C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYx+YnDlO2vFp8n8J9sdFOjLOacvifdRI7Cr5qe3b0I=; b=I7m2kmPDW0TYgJ
	ejAa3fY2fYugsR9F2thQSGn61T8t1qoU+9migeKP7VrQyRzryMpX+iqSEU6a+s/7/Z8UFryuZ4Kus
	vmen1/kBvwdExshEMuQHlAzPqegLapjPucOIk4s2dR19EG9qEstoaNI/kLaP5/HZHMKgCqPXzAXw6
	znudIl+PQ0ZiZ5IWssGpYCtKu+8husDqyHXsQwWohMEV5H8wviY1pywd01WlRfM/1Y3gqEAUiUwuY
	voPu98o+xycI5tw0R+MwOOTlwViV4WapDMygL7Q1oxvkdeh3QxJsNopVUhyBRb5mrSAV7GrXxfXRz
	5ZnNhlY9XsErhIaLhuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GGc-009ZHH-01;
	Thu, 08 Jun 2023 14:05:34 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GGU-009ZEq-2t
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 14:05:30 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so375815a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 07:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686233123; x=1688825123;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiTCui1w+W8sNchnu7jhDwLSkHbv4+LC8J3CAsZCpJw=;
        b=dWFaFLnb4/x7tW6GRCJP3ZHo5tIBZtmvKwXnYIrrjlSabMRKrfdaUL9q3++8soguwN
         IBHba0/E1pTRAtdkpxTk5v4+Lud7L+zSCZ8UJQ/5IJJLQmQtSljFIbVzLnpDjtk9UiJL
         dZfociUBXG4F1jpkWHEOlTidTA+ARnKs+5KRXLiP0VmBxbdcMmS4mWqVhDQQ1y6v2WC9
         Cx8VHjkZS1ABoDQP6VQayf75oLfq0BbygOE93lRSitUKo9+VyhgIdpPaZALDhuaS5ZsN
         Q8PCSehqO2HjHPYe7P/AI8AIgN/J3Ua09ncivG7ZIL4tP9YeVfO+PcmtLROts4AdlQwd
         kQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686233123; x=1688825123;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiTCui1w+W8sNchnu7jhDwLSkHbv4+LC8J3CAsZCpJw=;
        b=AO0Qck30Ou2MBjMnSkfTmWQVh8JdF2LNBM4rIcQO9FXqxc+mTnLwY2zi7ICq2bqLyj
         8nFwmnZd9HcXD6f8D5sxmX2YwveYTvcGwTT0ydrryCm+c7+B+fVojPLyKmcQRYte4mIq
         giFNoAg3Zb5s0ryRZ0KLMtHdZuzPgHrlnICUIgvpqZ8YTyQl7/rA/pZzRJRZXY0OIIrB
         9irbrMmoN3VnWi8deL67FEeVGY2aZvUImxyPFIF05n4IZ9LfNZD/DGYbxZc8cUuOICA9
         8oLaypGLdjjHhYIlTBCutL7hXUjH6xzTosNKQM2/1Dc4dgZS0W4I5fAmbj7YUDfwBh15
         oc3Q==
X-Gm-Message-State: AC+VfDy11efMan90iaYyCMnSzE7muwf+K1+h6OX40LG1ekPfchh4h9+V
	3InAC4WmIVFpdtBhmeDKVCVsSw==
X-Google-Smtp-Source: ACHHUZ7P5/AN251f/wAmo8JcMi33bVvOtrS3JIRw4guBNejoHDsoME04LkLUer5qOF7A40y5m0Hy+A==
X-Received: by 2002:a17:902:c411:b0:1ac:5717:fd5 with SMTP id k17-20020a170902c41100b001ac57170fd5mr11654586plk.60.1686233123522;
        Thu, 08 Jun 2023 07:05:23 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902860a00b00192aa53a7d5sm1502362plo.8.2023.06.08.07.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 07:05:22 -0700 (PDT)
In-Reply-To: <20230606130444.25090-1-alexghiti@rivosinc.com>
References: <20230606130444.25090-1-alexghiti@rivosinc.com>
Subject: Re: [PATCH] riscv: Fix kfence now that the linear mapping can be
 backed by PUD/P4D/PGD
Message-Id: <168623309503.19530.6891077660786418703.b4-ty@rivosinc.com>
Date: Thu, 08 Jun 2023 07:04:55 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: syzbot+a74d57bddabbedd75135@syzkaller.appspotmail.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
  Dmitry Vyukov <dvyukov@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
  Andrew Jones <ajones@ventanamicro.com>, kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_070528_715267_93CFEFB9 
X-CRM114-Status: UNSURE (   7.72  )
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


On Tue, 06 Jun 2023 15:04:44 +0200, Alexandre Ghiti wrote:
> RISC-V Kfence implementation used to rely on the fact the linear mapping
> was backed by at most PMD hugepages, which is not true anymore since
> commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear
> mapping").
> 
> Instead of splitting PUD/P4D/PGD mappings afterwards, directly map the
> kfence pool region using PTE mappings by allocating this region before
> setup_vm_final().
> 
> [...]

Applied, thanks!

[1/1] riscv: Fix kfence now that the linear mapping can be backed by PUD/P4D/PGD
      https://git.kernel.org/palmer/c/25abe0db9243

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
