Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AE0C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrWA5IBaIF7zgWHP26nn0eG1S98D2QIi68avI45a2VU=; b=G4YkmxWj4rLb9/
	JoeqQt1q3tiPsmT9SXXz4aVqItVixdy4lu2Dtm/kCFuZ1H0fzznBA5O+q281k5rBUGW/QjNGDx86A
	L7KKUFQdN2S6Tf/szYeFZqbpyi/YEpzXEUouZQ33H//y2KJAN571Gg0FoWaGPn4DXHVtK3hsox0DW
	ncgXa3CwstExUJUaO5s1y2ampxz92lN1yJG6o/LufFPfIWh5Ex/T69OVZntQaCF+dYT3ewWHORshO
	mma8qYefTtIEtZgCXDT3D1sv5d/ctozC2GcJ0qpo4QSvjXNjaeOZ6vDsyu/XvfzgQTQ5cbUXW9pOk
	ov+9Y/p/USj5e67lbvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfpTn-005hWQ-0p;
	Fri, 24 Mar 2023 22:01:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfpTi-005hV1-2n
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 22:01:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id le6so3085218plb.12
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 15:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1679695300;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMXLcRgH9sF4l1frJ5KDFBQahch+t+Pfs7sWVinOqQk=;
        b=6nJasBQh6rMddp7eC89uymnike8qVmoMiN2sIBJbxj0BZypslz19zGYsgGIhibGbvG
         GjMMEgveFN8UBfak5uPmhKuaZCqd2teqFPDckoriQcTnJetHjjt5wvdu5ZvLSGKnHmUd
         qRcUqPV+5H3fJDJb5rzyd3KqRJuNThK7Hq4duKja3cofNAeJP6DDmFkJcbGFoK1rq3Ch
         qxPMs4MKhQVwBLEn+CkuDT7+gFlWSqN9Vv6M8YOULOwBqGutxublUl5r7x9pcLe+lbzu
         R7Ed8b9P0owRxWZBm2ULleoLzWPe6d0+LbNBPh9ewu6ecrFtvCtueSFd4vzdaSXHzOA5
         JHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679695300;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMXLcRgH9sF4l1frJ5KDFBQahch+t+Pfs7sWVinOqQk=;
        b=P3o/lvx+AqmqqCLbZxvbZR3XGZQBC+4i+WBiov19KrUYeIcG1+TBYKipFjsvgCj0qK
         mAJTRGmLcUNIiYxrkglspWCU/Pk+PlOdRPBDMEy7D+PfKkOuc8+V2iiyQGOPJwVLyiUs
         60SFMWQ4MLcfkdgxrTLyAuhw6wg8/h86VorrkGr7SgBclD1L1z4B+XP4IWr7ps3dPsul
         2j37HQkMFMDLRH3UCtp+ycLYLpuwyQmBE3q5Yb1ki9FEpVQ1TtYt+eFcwkYaBDz7XtYE
         SePlCHqL0snJF2dpN1UJw6DDkSiH3RcbA2oUXDVw7yK70bNnu3lpY0gTnHRA3T2d2yK0
         1UmA==
X-Gm-Message-State: AAQBX9e9qbeaa/245Lr+bt+o79H5M0snXSVAXOsULIJ+npFTxtxRzU+w
	qsB/XlUPUzz1de5h34boXFkMeA==
X-Google-Smtp-Source: AKy350bpY6oEPwkdkkjYRycrJC7DL1aXlQymZN36kbTCUbwz4pCxJaS9/0ZF59cn59bKg1/yP3Hd7g==
X-Received: by 2002:a17:903:6c4:b0:19c:fc41:2dfd with SMTP id kj4-20020a17090306c400b0019cfc412dfdmr3283889plb.29.1679695299906;
        Fri, 24 Mar 2023 15:01:39 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902bf4700b0019a60b7cc0esm14649540pls.248.2023.03.24.15.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:01:39 -0700 (PDT)
In-Reply-To: <20230222033021.983168-1-guoren@kernel.org>
References: <20230222033021.983168-1-guoren@kernel.org>
Subject: Re: (subset) [PATCH -next V17 0/7] riscv: Add GENERIC_ENTRY
 support
Message-Id: <167969528245.13232.1422776002762146191.b4-ty@rivosinc.com>
Date: Fri, 24 Mar 2023 15:01:22 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, tglx@linutronix.de, peterz@infradead.org,
  luto@kernel.org, Conor Dooley <conor.dooley@microchip.com>, heiko@sntech.de, jszhang@kernel.org,
  lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
  atishp@atishpatra.org, Mark Rutland <mark.rutland@arm.com>, ben@decadent.org.uk, bjorn@kernel.org,
  Palmer Dabbelt <palmer@dabbelt.com>, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_150143_118074_A88AEEF0 
X-CRM114-Status: UNSURE (   8.12  )
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


On Tue, 21 Feb 2023 22:30:14 -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The patches convert riscv to use the generic entry infrastructure from
> kernel/entry/*. Some optimization for entry.S with new .macro and merge
> ret_from_kernel_thread into ret_from_fork.
> 
> The 1,2 are the preparation of generic entry. 3~7 are the main part
> of generic entry.
> 
> [...]

Applied, thanks!

[2/7] riscv: ptrace: Remove duplicate operation
      https://git.kernel.org/palmer/c/8574bf8d0ddd
[3/7] riscv: entry: Add noinstr to prevent instrumentation inserted
      https://git.kernel.org/palmer/c/d0db02c62879
[4/7] riscv: entry: Convert to generic entry
      https://git.kernel.org/palmer/c/f0bddf50586d
[5/7] riscv: entry: Remove extra level wrappers of trace_hardirqs_{on,off}
      https://git.kernel.org/palmer/c/0bf298ad2b61
[6/7] riscv: entry: Consolidate ret_from_kernel_thread into ret_from_fork
      https://git.kernel.org/palmer/c/ab9164dae273
[7/7] riscv: entry: Consolidate general regs saving/restoring
      https://git.kernel.org/palmer/c/45b32b946a97

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
