Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DFEC7EE39
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jr8Z8AU0iRVIkw8A9mUKtKgsraxzPhz8IDwFwggVYbA=; b=K681nJhUGhRNFb
	Zjq/CgcGuCJqTEv9LsQMS4Ra/YvSDuYTm6KY9rMhqFamHk0xMh/4IpM3EkpECWdzkMuXhz4/jHPGB
	4OstD3bzJSFEC07r0c5ZstoMjuGsciQ//J1KbvUnp339yaCfDmqca5aEt0AKE1JUa/zEiCyY+m6F0
	QU4XoIPolPZICLGtcG9zjdQzWfflrU81iiNGZrTo3immqPPg9oVQXRjxZlRgT93DlkJ55avB1Vdzs
	rEDisaYpmtrSEhsK+kjcTggJ+T80EhWb6xaWL16bg8jZRlQPH9RTiljx0Osypn/KTMV9WYNKpFgET
	Z3i9jgs2Z+GIbocKHoBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8fj-00000001Pqz-0KoG;
	Mon, 30 Jun 2025 07:11:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW8fh-00000001Pqf-0WjT
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 07:11:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so6557625e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 00:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751267479; x=1751872279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M33IweNKB23NoNM33aEFltvshX1Eakka7go5CXq6iQ=;
        b=J7SyGnsaoNzhE3lLdKCE6lJJfRlS9Zi2PubrC9VskqJLFY5dNuBGGeVETspr5OqKgk
         6rFL3Tf218Izi/aUs6ijzgtwZXH95xcZYW2t746+lyAqDW+y6RNfKtF96EPMdEpOdi0H
         QbDIWbgDMA5FgziBzqWGFRgfC4iPIvZ2aVIF+du9DWixeWYrDqNQ1Jj05MxxBPHT20OM
         fG77LenxYXlO+M+8OKoD48dpzQ0kFwJQytAles+JfUqAjQQUaF2a2hrjrTDxcNXN95jJ
         2beCr9iZ9FkQGFzx9t7HQPlaafYrW/s+Qgnt49okLZX+/78FRxCYqxZvmM4tC2ARQCkN
         fkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751267479; x=1751872279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3M33IweNKB23NoNM33aEFltvshX1Eakka7go5CXq6iQ=;
        b=ZYOGpuu9qXhUE5OXLXKRpeixBTTCdXc/obuRAIfbHJxnrEltnwvIIHt1fJXb3ve01B
         +V2/REwEAnrwd1A+FZYdJAIhQmkccTSlr+XftuPnw9FRfQaWp/njk99m0SLqJaZh1QNG
         V/IWndK3+UGMGMBUCTiv+xyPDPEe3t9hnPEI7P79pzKJsNavEe1b7YeNFL40hA8YplZR
         cca8cciOBAOrXt36uB+61FlvvRJCeuVD5dj8gxORtT2da/3Jnvb9skjmF1XOm8kYsHBO
         AyTAentfJpaveup9FRCJ4YIrokNAfeIWzY6CbR5xuErf4Zk8qiBjXD7eIOObcD37i6BI
         stWw==
X-Forwarded-Encrypted: i=1; AJvYcCVT7OR7gl1aaEmozeugfKO5Htrw+YjJF0eaTzdECiX7npt3+l7RE59pxDWHSW7h7X2KwcTuj7EFklSbBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkfSnBbWETmiCRnPY6PCjQp1VohvZwZrxkdrZ6S1cMdxn6GpZ6
	mCBvvDGF1ymi61mIv+DivTDFcdnbL3mTVQ/SJfr2E95pGgbmjjY/U5+6y0B7z98pRKI=
X-Gm-Gg: ASbGncu1f6oOoZRr101AtyCnaXKvS7fqTTk3gAdzvVNDAMTVV0qvN9hRgUwcWYmaQo6
	pNsvAqDAgpwPWLd7ShPohEGM3xPLYq/n9D9SmKxzAmtD3WX19q4WVUuha2WYMisI65fERnI0iTh
	r+VHdf8Beh7v8fGzsTNxzkVR3L2D3sZG7folFWUYYCnUiHHTDstjAQVmrjJHMa0rsPqRSMjZ0xa
	iXGnJ1xRTHWmx4AfCkJWuI19renHXB0NBA2mLq+TLhcYvDouh4z/fOihWbMVdakrGBGh6gyvFdE
	eCUSxhCk1KR353W+JxP0jrTLMQc3SAPemnjPWQFGFsSRZ0Y4XhopdXmeIGoZWsw=
X-Google-Smtp-Source: AGHT+IG/R7CC+U7ZRabx/kXZa5HP+oumZGvsCP9NRHqQD9Rwf30kvmvGtsy7NTEikbNMBjYRtI/+qA==
X-Received: by 2002:a05:600c:1389:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-4539b3f67c8mr54429725e9.16.1751267478977;
        Mon, 30 Jun 2025 00:11:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c5fasm157989535e9.8.2025.06.30.00.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 00:11:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] pwrseq: replace magic numbers with defines for match() return values
Date: Mon, 30 Jun 2025 09:11:17 +0200
Message-ID: <175126743944.9502.1874026392338721581.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
References: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_001121_168374_A04547E5 
X-CRM114-Status: UNSURE (   9.32  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 24 Jun 2025 16:32:17 +0200, Bartosz Golaszewski wrote:
> We currently use 0 or 1 as magic numbers returned from the match()
> callback. It's more readable to replace them with proper defines whose
> names indicate the meaning. While at it: fix a build issue with the
> thead-gpu driver I noticed and extend build coverage for the drivers.
> 
> 

Applied with commit subjects tweaked to say "power: sequencing: ...", thanks!

[1/5] pwrseq: thead-gpu: add missing header
      https://git.kernel.org/brgl/linux/c/5bcfc4ef40dabcd16a0b736fea7f0d00a9efdbfb
[2/5] pwrseq: extend build coverage for pwrseq drivers with COMPILE_TEST=y
      https://git.kernel.org/brgl/linux/c/1a7312b93ab023f68b48a1550049a4f850c2c808
[3/5] pwrseq: add defines for return values of the match() callback
      https://git.kernel.org/brgl/linux/c/62b5848f73dd4f8ae17304dae54562d0c9ecdd3d
[4/5] pwrseq: qcom-wcn: use new defines for match() return values
      https://git.kernel.org/brgl/linux/c/f698155029efc708349126c8944fa8c95b28098c
[5/5] pwrseq: thead-gpu: use new defines for match() return values
      https://git.kernel.org/brgl/linux/c/385b735c90ae44dbde65fab76e356a96ff8f67be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
