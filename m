Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8B2C83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 15:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80Wp+I9Jm1v0/2HxTlGieQXuPKc+208wXjF51pL5ccA=; b=oK5vG8vczNzLF2
	xUETuupdq7iVLqoE811tM7Fvo2gwYtxCHtXwtEQNxkvQBpyPbug2Na5xEVV0XjNTK3NzZL1B3WCSU
	Oee0FmnVmN0eK451BvGuCttLL+knHE0Y7sgbM+48tgm7CV++Q2usL4iTomURkwP5lIFpG6OsjK+jU
	Nk+JXs3d+iLfCjIoPvDL957hE2G9X6JN748Yu0FvaoFagIMxZOU6sVCyXvO0vn+MitaY+O2SU3RDo
	dbQ8rL/2Hj2gjkGodyscdTGLKeqAul5/uExCpaO2LkhoS1SUWaKx1+Qi/FMSC7SToI8ymWQNh3T8K
	srrNrpmcYcsuse/ijmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaeHT-009o68-2I;
	Mon, 28 Aug 2023 15:35:55 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaeHQ-009o5C-2K
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 15:35:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40078c4855fso31547395e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 08:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693236949; x=1693841749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzAX6lqqHTluclgLNh1EUElGR4QXqRqoc9259SBPLU8=;
        b=L8tjr27q6ggRC6qCsj5TJadHQXfL8J+RdwqQn6XM0VlhObtBH2Sya6jLWcLe0R0wR3
         xhmXjkr0kqa3760Oyg/+YD7dLCme27Hh/hZWuIPDpT5cr+Raxo4LjxUz884ZF0Si7XqY
         nwVblkiTpx2IbBPXODPVzgrTYRNNUbyKuci0OQxTCawXtflZmsoj/tRZQ9ZxoLYjD4FF
         P1fh6voXSQyzqhIAFf8VWyj/njtZVXsVB4k/NHM+WUAZJKcAA1bF77AyZf0jWRV5xSkp
         9ub82sSMiS0CLd5gKNpxVu91yCSBPaBmlPlV/3vSaOask252Se3eQFhRvYwFgt2e3rp2
         +nvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693236949; x=1693841749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzAX6lqqHTluclgLNh1EUElGR4QXqRqoc9259SBPLU8=;
        b=BlmKznHhHu6xg/2pbXmSN8LBo68v15Lm/xTuSXNXE3Y3o2/QAsPUZXeArbA8tQ/k91
         fHs/MTR6IXEKi2foysuUIJlR3FBDK/Klbn76KRRrFkibYj9wYBpPSYlDsx5WFggkgOJz
         idPTrAIJLpp4ngmWNh0SBEiQmergWYs0rVDMGho8JaJ+lysDLajGpnsH/Njq8BJZ2BY1
         rcKdRxZEhUufc6eaiaGiLJWZD5N6XfJJSZ2xjB4IAWgD3+JjaU3ruV58wxRwI5ZpCGuH
         FS5MhBfKops50GcSUlkNPdUh6jY99gWPm0S60y/gDiWKQjuyZEWueslWtN4ye5z1sDgk
         FdnQ==
X-Gm-Message-State: AOJu0YwYfxU5iOo5W1y48eYWlUD+lllAQNXZcogw1cPhRBkqOyZRgaBQ
	a4DW/bBgf92BFBeihvh0d7k=
X-Google-Smtp-Source: AGHT+IEfbfIoLSEJ4mhCVMfR2RUI4/euIEv22Sb6Ji7X+ZmdVa3DlIAgd265KR9S9ErkaoL7KbDt4g==
X-Received: by 2002:a1c:7303:0:b0:3fe:3004:1ffd with SMTP id d3-20020a1c7303000000b003fe30041ffdmr19711222wmb.4.1693236949046;
        Mon, 28 Aug 2023 08:35:49 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-54-170-241-106.eu-west-1.compute.amazonaws.com. [54.170.241.106])
        by smtp.gmail.com with ESMTPSA id c1-20020a056000104100b0031aef72a021sm10680247wrx.86.2023.08.28.08.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 08:35:48 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: bjorn@kernel.org
Cc: aou@eecs.berkeley.edu,
	bjorn@rivosinc.com,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	lkp@intel.com,
	namcaov@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: [PATCH v2] riscv: Only consider swbp/ss handlers for correct privileged mode
Date: Mon, 28 Aug 2023 15:35:35 +0000
Message-Id: <20230828153535.1568230-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230827114003.224958-1-bjorn@kernel.org>
References: <20230827114003.224958-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_083552_762144_43197042 
X-CRM114-Status: UNSURE (   4.02  )
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

Tested-by: Puranjay Mohan <puranjay12@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
