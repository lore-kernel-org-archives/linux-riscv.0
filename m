Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390AFC48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XOtCw49lEO/v9oskT6gt28xs7aZ8OwjA5eyFQCvjujE=; b=KZgb3oUnMFKfLYwbLoaZy7FQ6W
	S/WLMW4r5MFQO0MeF+UxRfNG+ndvTWjnrXuFoCjZJKHlFhA9eHEhDqeZ59/zC3Z1pl5Nd4IXcPo9B
	O8pUs8nX3/Y6mZBIg0fX2N+csTUGz90e6Dr51W/w0S/kfRjelINpGs/j/ONgozDzlXtb8CHCi0egx
	EhiU01FDqbhr/jk7ffZtGTTXFEjw47z7ji4y95dRCzob783XtsCpCKclcsX2DnDe5B2EjUeyL+Lft
	BQMd5rbWplvVRQd8yjPqQqueJ93QxsY9dloqmQgoVR3IwneFI8XNc2cvC3qCfKCFgBU5ZkecMNJpM
	SnaGyQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuJZ-00000009f0f-1Woa;
	Tue, 13 Feb 2024 15:03:19 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZuJW-00000009ey9-1jFk
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 15:03:16 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dcc15b03287so1712698276.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707836593; x=1708441393; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7FsuJV64CawsinrLvyO7glO7FRW444919z354YbA2w=;
        b=QO8yOkyg6byty3t3BmzEwUIwaXnFtFp3jWu/+BovjR7WS9paVQfXBWqM25Yfr3mo7w
         0IPqBqyh3/7vQVWnqIvKFkhFECek/PuTvvBDN5F0yQWtqSUEkWySRKIWu0WOtxsOYnYM
         RHTk8MuZRuPlj1C7kWmbcp4NxNuI2nwX/pwC5sXZXtJQazQ21H7bgMMFSwcmdV5Lx4u1
         8qmnx8X2SoNW6usFHGyrBJi7tvEIYAB5gpDVuClzfldH68QUkkeZIz0S1hbuzzNSdVKr
         it/Wkbebudo+fvRrw5eFE137rOV6bGnPFRnZDaR69N8O5SAlv/44COcZFcnW4qHLiZFE
         ua9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707836593; x=1708441393;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7FsuJV64CawsinrLvyO7glO7FRW444919z354YbA2w=;
        b=f6H14LgwL0Vuoz5vw4Iu97MmEhDaKqvrw4RB7RcfE0zmPSOZOOZZ8EHkFHdKQP2ZLp
         k5saf42RjnTT6/nZKkDN+RGLmx19aN1ZerxRb4aY1IVFsWskizk6quF75XyajtAXNoNW
         FLH0nZjE1Jad7pVPFYKO14gWwcUCC6z4faF1esQ0lncxQ/vpCNJ4HHx9FOxU/StK4ODS
         RPKLHtOMtF0rhuhwV7lKlu+WErXyZV1SXDH1fAuNaC5UljpVeAZQmSs6WfoOEv8viTXg
         5U5wszInaMkM+q2yuZAL1Pp0VTrdBZhmKykWpzfc/nZEZcSMBSrs3Hn+qJCwpOy27tiG
         Qdng==
X-Forwarded-Encrypted: i=1; AJvYcCUoH9nKyejLhcbW0eb+8jhV3/YTq8BHrNs8hf8t9CuUOjcHccYsD+60sXYKudesIdm9ZC2EYjePDshZ3DYRXs6d8GYm/CzmisoNvfTR1Zmm
X-Gm-Message-State: AOJu0Yw8l3tCpVoPXcgjK3i2CIjzJK/xGe6ry7nyjF//OpI7oDzXW7y8
	qE8iFh131vnLh1ZeI32wKPXrFQ5wvaIEZJsn09H+GE7ay4ZiNSg003a5jPcSjmSzmbuRaIAcVei
	lhdbOMLLz785fvr+HuQ==
X-Google-Smtp-Source: AGHT+IHt98x+ca2z3v4AKP+J76FiBBL6a2IyfEdm+GmtAaSsTOTJCpAsnIW8kZghoanSUU8fucgHOps/Fvor/cca
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:1005:b0:dcb:c2c0:b319 with
 SMTP id w5-20020a056902100500b00dcbc2c0b319mr142381ybt.9.1707836593127; Tue,
 13 Feb 2024 07:03:13 -0800 (PST)
Date: Tue, 13 Feb 2024 15:03:06 +0000
In-Reply-To: <20240212-projector-dangle-7815fa2f7415@wendy>
Mime-Version: 1.0
References: <20240212-projector-dangle-7815fa2f7415@wendy>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213150306.2424991-1-ericchancf@google.com>
Subject: Re: [PATCH] riscv/fence: Consolidate fence definitions and define __{mb,rmb,wmb}
From: Eric Chan <ericchancf@google.com>
To: conor.dooley@microchip.com
Cc: aou@eecs.berkeley.edu, ericchancf@google.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_070314_498284_7C1013BC 
X-CRM114-Status: UNSURE (   5.38  )
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

Hi Conor,

  Thank you, I should not have just used defconfig without allesconfig.
  It has been corrected in PATCH v2 [0] as follows.

  v1 -> v2: makes compilation pass with allyesconfig instead of
  defconfig only, also satisfy scripts/checkpatch.pl.
  - (__asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"))
  + ({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })

  I've updated patch v3[https://marc.info/?l=linux-kernel&m=170783431129245]
  Please let me know if you have any further questions or suggestions.

  [0] https://lore.kernel.org/lkml/20240212105946.1241100-1-ericchancf@google.com/

Sincerely,
  Eric Chan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
