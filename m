Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6822C83F25
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=clEHvWsO2VyuzwIWSEJZaCSe8VeApEBARbgwhAAh+G0=; b=helrzVD+Oik4zE
	QeYepGZB6oNVWQh7vKsln49/jwUMATmy2CSmv321wgYSa0kW1Dqpn45sBjZRAt9aNex0LmEmsnpi7
	qV4M5dURbcjb9PR2YWdiQoH8VqVxOhhmGpSRqGn7C+Ju0JqGKGf98dcq7WksKuY0ytNk3bNzYIwSU
	rhjQzwKY3Ke+4JrsgIaLMSibvfF28U3KoaFIZp+xCysjtTzwSFuza1twX5I04sqm7nccuZyjjRe0U
	HZjpeyrbdzBZBy21imVMW5V+eSSK/ssL8Gh/e1wJ8C8oPg4e/mjk/r9dsKDQkp6wA9zYq2gsnmbAa
	VVz/rTlZ7vOudDlKXs7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9OO-000000021Zn-3XWw;
	Tue, 22 Jul 2025 09:34:36 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue95j-00000001yCD-2esx
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 09:15:22 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-75bd436d970so1259183b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1753175718; x=1753780518; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sDpd/9R1FbFO45b0pyVOCvmilI+82TcVxnKdkYIR8qQ=;
        b=X8bZ8lOXhLGWHtCzeMa4XQV5DDFk84ozgy6WkBT5r4LyY4r0H2vhhB2djs3lHacTXX
         alfCbL5WLCRNSQEEIgOx5q2VyrgiqEEhRcjLOhyMcHgFgwLVnhS9gPVSkPoZdo83u62P
         +VhEbBocOTN/qHHLWM+pBCBeO5lio1qXxTl6p5JPBj8+lbCpP7MMgdCJ1Z1mM2eNSjUy
         GLmJMpIzoUpUqWh3yGLES2ntqGrkHQd8QsgAfzZBfD8zYprhdNZCBLWdmTMz5ODQCTFZ
         ENGj9orT49ihzNpnK247+FgYQibC6m5xc9MWsZ14NGVnkODcXfOLUKPnZVCSHrwMhjXK
         cw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753175718; x=1753780518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDpd/9R1FbFO45b0pyVOCvmilI+82TcVxnKdkYIR8qQ=;
        b=fY9mPtJI8xlrsBpbiQfVJGIReleXn6eiqHldsus1LtMEc4kOseU/Ijt4Yp5M4u08YN
         mKGe2fUOVqktN3TQBhFQSe1Pr7zfnD/SjPDl6zTGXuXURQ2HfIZwAK6kpZwZTpDU/jIM
         0rm2wP0bEgygBqezyJ5QInoAWY2M/hEHRidcs3Odmx27Rs3Jb5Cd+h7NikXU/5JU0GZJ
         NRZ1biwM9l/K8Xmx/6JiGC8/kMOoykAolGgU2JKmSyugyRlZe5YR/Kbg6326B+utSYqK
         xF8eaJchnfY/mY9iOlSaXnD7tdPH6g8c9aF+ONad//8RYeRTIIQy5s38y6opyIkVktD5
         WjdA==
X-Forwarded-Encrypted: i=1; AJvYcCUiRScMfCqD95NqTGB2lfQl9nHM6UGChGG0kgXqLkfa8Vg6bXtatZARN1jqLtoQK0kY6WAp6yc1A23VUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFJ83CKFgYWusDZoHXAIPmC+TSa7pnX/kDoDZhta5551/ZDX/+
	uJhFExK78KeAEqcLt18s4EWrWl3mx671iXhlNSUCFp798gLsVXlXPOzoPCLuxELbuEI=
X-Gm-Gg: ASbGncu4xl8AERSPWOHtcPl77vhBU3j6ggswurmO8cG3wQBF4awv4JsB5xpg06Vu8vr
	qoya+KaVFn1+qxZHsWw2aSS7RmdcTfrNznvwpITRzuaZHNENoIgfxP4QbpAQdYAhJlIDzGCzHma
	LQC7J8/mpxUdZaTc4lf5Go2K/9ggJKoLRSF0OnbOLGmtKbnyI8Wqtiqg5mhb8vC/PaF5xuqQRHX
	e5SgAAVT6Jfh12+8U4ZHZCv6DxpAoXetK4o2j5/GMxT/q+NqgZMOx/nRXQQMvbOY4EbIha+cp8d
	Ll6m2zf/4p+1pdFBnyBoCHWlMoQBIbpVA6vx0/AgdowVKas8Vlcu8rVh2Afl/wosWQxRtQQpWkF
	+O8ngjmeit0h4nLy+m/Dz+bESypbFxk4o1SN2zoFnVnd+/QsSOo3qZ3CH
X-Google-Smtp-Source: AGHT+IFdLWXKtYtTpg9kzQmOA7PQCO4tbUE9up/LbFHwS0ttZD0Bn895xLmmJwWm4I3jiNDzOrHtgw==
X-Received: by 2002:a05:6a00:2d19:b0:749:14b5:921f with SMTP id d2e1a72fcca58-75724a8ac06mr32920614b3a.18.1753175717942;
        Tue, 22 Jul 2025 02:15:17 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2008sm6676900b3a.30.2025.07.22.02.15.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Jul 2025 02:15:17 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	anshuman.khandual@arm.com,
	kas@kernel.org,
	ryan.roberts@arm.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	namcao@linutronix.de,
	willy@infradead.org,
	abrestic@rivosinc.com,
	yongxuan.wang@sifive.com,
	apopple@nvidia.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] introduce ioremap_wc()
Date: Tue, 22 Jul 2025 17:15:03 +0800
Message-Id: <20250722091504.45974-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_021519_998013_8FCD9C69 
X-CRM114-Status: UNSURE (   5.60  )
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

Compared with IO attributes, NC attributes can improve performance,
specifically in these aspects: Relaxed Order, Gathering, Supports Read
Speculation, Supports Unaligned Access.

When I replied to this patch (https://lore.kernel.org/all/CAEEQ3wmVPrZ6s8msM8RgcyZePGhXM1ikYMc5wW2n8q3Bf90EVw@mail.gmail.com/),
I found the author's email address was invalid. So, based on this patch,
I made slight modifications and resubmitted it.


Yunhui Cui (1):
  riscv: introduce ioremap_wc()

 arch/riscv/include/asm/io.h      | 4 ++++
 arch/riscv/include/asm/pgtable.h | 1 +
 2 files changed, 5 insertions(+)

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
