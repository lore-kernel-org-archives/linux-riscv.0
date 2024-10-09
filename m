Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3261ECF042B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 01:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sDUMq6hBjCpzKIB/gjPOWggUx05Gw16H2m2PHhKQMc4=; b=nzcxo6IRBVq7i0
	1+xnLNHJrLvF27jUi/N4n/bevpwzRrXOEpNOxymjjfUOSJN0Xs4EzZRuGj6IJ1bm63wRTuPQiq2/Y
	9uxx8HLOq+PzquXPfAOwI6QIGSJkXt+skbd0YFTUdV9CHq1N7ra+VHrqRRl4nCAYXFyNCwveZujOA
	lN0+U746Ib67c9YsM5rI3vbq0eN6KYpuwQUOaDadk8N+bWnJL+g5hKN/ysktt3x39kDu9wAzoJ7gI
	GzLqo+gNlQu4mLgXhatBivliEb7bqcElsXqmqNJ5nLLeXm1BbH2XoIlOvFiczTxZjUskbBbTs/x9f
	YLysZXw2oKXmxp46SqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syLKl-00000007a7e-3P1O;
	Wed, 09 Oct 2024 01:17:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syLKg-00000007a6D-1H9v
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 01:17:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c544d34bcso12448275ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 18:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728436661; x=1729041461; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gXIoKwehMAZvKSi1ZW9gJSgNU8emklB6JJg58GCOnA=;
        b=F5O73g4vPGjVkO2BdzfJUlqF8ovmgxw5b9qCbvVkXSo9tbjzLu+8aYIUnoAJBaVwnH
         Fnw3WhSnYyXLc8qTbe5tBuzgWNQthGl0FWe0NptTIar18qbdE5eUsgO6vLgjbCZytVz5
         SjT675diG0LC86ZTnp92++kpH0iEvO6x0gXpjawaKU6uKEIOqvEZLD9UUzSZOw2Nm6dH
         Pnc5oS1mARZwxxAl1Lt89fOgydpBErT/rvsiXgaYhELPnojPTZDjvqoVAWxP4Yt7oM67
         Ovs1KP7kOw4G8H2Cb5R6xYEaByskmW81zwvChqZRuHZnTr1nDXNzlmeJT00oMnsFoF78
         V3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728436661; x=1729041461;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gXIoKwehMAZvKSi1ZW9gJSgNU8emklB6JJg58GCOnA=;
        b=e87c0HeqaGYg7U8Gojl0Fe5b7dxxo1Ink1RoYO/4v+sBurG6yPf0jc8ojrlUinWczW
         pvjmS0P6JEna6Vs6TV4obSaKsMWImAdYirylqEb3zyHsVg/BdHDXkcK4U931e929w4f2
         v2J+xJocseNQuWUXpmLOC2UX2rsiSiKDNLu9mrWDaRJqBCF0uNhEcfy8ZLwcVfBniOLS
         TiuShdxQTnXoDsoGw5+O/CMvuGEnJIR62OOMlMQJYfEz/ksNkd3egkrP2TWJZfGMU/0k
         HVgcbZs2CZnYjAS5PdfO08Q60VW3RbCoJt4K8/W/IApASbcACfvuF40jfDuEYeOk+33Z
         1u/g==
X-Gm-Message-State: AOJu0YzG7lgBDQjTEvd4baiqkm7t8Isjlp1V2oy3rUsD7dLSYKRTuAY5
	yyzKjy2wUxO0+DLKXxHRbs610EyHw5q+Io4Lvp04LSv8yzRCfkagWivmD95Fy7SNqPYPPkFzuvR
	7
X-Google-Smtp-Source: AGHT+IEnse84BySsrxxDqF+rx4nHQxQNoK1aENuWT8okmvAHlh6k+aHET6PvGLInmguwwhVposdu7Q==
X-Received: by 2002:a17:902:d504:b0:20c:5d78:4d88 with SMTP id d9443c01a7336-20c6379ae73mr11464655ad.60.1728436660857;
        Tue, 08 Oct 2024 18:17:40 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbbc2sm61076365ad.78.2024.10.08.18.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 18:17:40 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v3 0/3] pinctrl: th1520: Improve code quality
Date: Tue, 08 Oct 2024 18:16:45 -0700
Message-Id: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH3ZBWcC/4XNQQrCMBAF0KuUrI1MpiYtrnoPcZEmUxvQtCQhK
 KV3N+1KEHH5//DfLCxScBTZuVpYoOyim3wJ9aFiZtT+RtzZkhkCngSA5GkUEoHPzpsU7nxwT4r
 cIthetXXbkGJlOgfaD2V5uZY8upim8Nq/ZLG1f8AsOHBplLTDoMECdIn8ZgTy6WimB9vYjJ+U+
 kFhoXrRImqqtbLNN7Wu6xtU7pvcCQEAAA==
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_181742_391989_0D5830BB 
X-CRM114-Status: GOOD (  10.48  )
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

This series contains code quality improvements for the new TH1520
pinctrl driver [1]:

 - Fix smatch warning that the return value is not correctly set when an
   unknown pin error occurs
 - Linus suggested using guarded mutexs so I've converted the thp->mutex
   lock to that usage.
 - Linus also suggested using a scoped iterator for the DT for-each
   child node loop: for_each_available_child_of_node_scoped.

The series is based on the linusw devel branch [2].

[1] https://lore.kernel.org/lkml/CACRpkdavPAv2sPRREQhx_A7EtOj6Ld_n+NcO+vH0QCnfVedXKw@mail.gmail.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Changes in v3:
 - Remove declaration of 'child' in th1520_pinctrl_dt_node_to_map() as
   the macro for_each_available_child_of_node_scoped already includes the
   declaration of 'child'.
 - Link to v2: https://lore.kernel.org/r/20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com

Changes in v2:
 - Move the scoped iterator conversion to a separate patch and remove the
   child put operations as they are no longer needed
 - Link to v1: https://lore.kernel.org/lkml/20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com/

---
Drew Fustini (3):
      pinctrl: th1520: Fix return value for unknown pin error
      pinctrl: th1520: Convert thp->mutex to guarded mutex
      pinctrl: th1520: Convert dt child node loop to scoped iterator

 drivers/pinctrl/pinctrl-th1520.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)
---
base-commit: 2694868880705e8f6bb61b24b1b25adc42a4a217
change-id: 20241005-th1520-pinctrl-fixes-d20db68387e6

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
