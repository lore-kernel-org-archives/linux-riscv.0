Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3F9C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v4jvq0XGyPXbw4yAMSRGQ8BQfkJV4pWhprl/YyfhO54=; b=f1tNKmJkszUj9f
	bthogTJdNJ35s74IpMc+EfxApavsZuTfL3SdqGeJf7LoxgQ++0cSYVoPi+JxAb5hR4uh/jkB2tVfi
	dCyFVAVLkTmW9ycLaGOZ5F39dIZYLqArK4YglMGDfJfbFJY8tgx5ev1VDkVCZWCjR6QvhxpXYffxD
	9i2IMHi1GX8y3CwLNJDDvmb2jaCaA5psF6EDCzAsJ0VghG9GSSEkJ8Fi8/vQzr02aQZ5kGh5zYkSx
	UEf0wcuQNcyjXZ6ZeFE4NIDPX3gbK4ilyUprsXIoOsXHkwUVVtL0IISMOzR5nw1W7F+xjeMmdD6Sy
	T3BYIPVBmm4tq07LRTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU64q-00000006DMI-0VEQ;
	Tue, 24 Jun 2025 16:00:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4hJ-00000005vKP-1d5x
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 14:32:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a51481a598so2800787f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 07:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750775548; x=1751380348; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/7dQju2CZeLI5d0OlTARaTle2Uj51q+BbaBg8wUzJM=;
        b=XxGRtq3SD5nuOaQM/l1Tb49ICk3T2xDP8Ybig9JxWx6B9ERmf+vN4aH59xtcfAl5CH
         lXdYNg2EwIdoeAOpgSXn5YziQVNtV5Rg2i9XJ+cwi6uB1akv/B5F3fxLbybQ9Mlxf0xr
         IRQrm7bdK5MheiWhaI7TDVVw/EqOpHYeIxpfi1U0UvGtDTX7cOg8q9JDpQB2iQWtulUZ
         RJgsV3QVsicgvlZzDv0kblo0f4MAEhf4gHJHSsbJn6Ib4KaghGs62Mae1TJEFOpHWHlO
         sHoezZFkLx8biDA6nCqGnjamw+0QWnBauIhJM/kQzWb36kX7iXC9rUB8tahpVxBnjm/q
         pN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775548; x=1751380348;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/7dQju2CZeLI5d0OlTARaTle2Uj51q+BbaBg8wUzJM=;
        b=wTk5HyBN6tSOvWk9oziCEAtI2zjfpYvJTlLcSd+dNR57hiBQRorx73taIghuDE7Q1l
         HOoACpLpMA8zzVvoXG96PooIORwAX9P+KEd76BSR6F3euAf+30J0KcnpA8Ia+DS8WTnW
         sQ82wqngxoog5VSej6espOUoLCwf7ox0ergj2+4fFPm5YVl+To6k5yzR145o3+kvZgta
         7z4dPkfWVZRBXEOSJ+D5R5IqOtVJKDXbyz/gf/Qo0ODLmfnpAGIkszhVXRmRNgzZfHOp
         412at9lbH1N2XSWF6UZheu862HUMtA/Gfmbz+/ftrBzSwY0L+F+ESg+Pu7dN7VnajizT
         C8kQ==
X-Gm-Message-State: AOJu0YzF3qlzYwE754Yo+lU8NptYinV6fv3rH/CvvcswlY13uFbOE+Dx
	MeURAIsm6ysk50zOKj0IbT1wc7K+RJ5RUE31TdF899UpOhbVo/KmznRKKZ9qSYmfI1c=
X-Gm-Gg: ASbGncucdxNleGUFCR+/i/bU3GcZ1vwWo5JSzUdcVJ5ge9s+d8MNkyI4wc/LR0MTm7H
	FvYbxVMsT7TkACdKqkRzjL7VY5exBduUwwD8yaVvudgf8FoCFjvF3mll0ltBvNsVyD8AiHeAm/X
	73VQsPSZY8vj2qzcARz0aWVDNEPT54vDBm7ttfILB8JQ5L3qDaPP0KeYcciC3hm6dDF1dR+NJPa
	xVqbSo6ACqMSU93lPoux9kwnPNvBYzD2R5AQzu3TXgYp/Lw5GxNBzVgbDrj1XlnECxtUdPgFlQD
	eLUOqav+94sX5WsVdKKh/NsIGmKcSp1MHM6xBlJrTmf4sh+FRXhPz0pSfZ2MdrD6Qkg=
X-Google-Smtp-Source: AGHT+IHImXCD0PRHI4M7v4iVLzEcYBW7djJvPwpqCRg7wUTNPed+BG1KF5ix/KPWpzBJJQPBFgd2ag==
X-Received: by 2002:a05:6000:4b0b:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3a6d12dbda2mr14879216f8f.16.1750775547583;
        Tue, 24 Jun 2025 07:32:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a84sm178512935e9.32.2025.06.24.07.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:32:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pwrseq: replace magic numbers with defines for match()
 return values
Date: Tue, 24 Jun 2025 16:32:17 +0200
Message-Id: <20250624-pwrseq-match-defines-v1-0-a59d90a951f1@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPG2WmgC/x2MQQqEMBAEvyJz3gENGl2/sngIsdU5mNWMqCD+3
 eCxKKouUkSBUptdFLGLyj8kKD4Z+cmFESx9YjK5qXJrSl6OqFh5dpufuMcgAcoOvrRNUcN+QSl
 dYhLnu/119/0AI6qNWWYAAAA=
X-Change-ID: 20250624-pwrseq-match-defines-aec46817e69e
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qL9XmUvWaq5tHfaWx1V5LuweXRKdi1ZrjKkrO+YSNmw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWrb56VtEbN8jrXfh++pA9Tt/a91zSI2thLGP6
 Zb3X5N2VSWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFq2+QAKCRARpy6gFHHX
 cs66D/9nnDqDh8+Uk6m4QTPNKsT8dOx6VegPWlRe/pW2j2o1y4gS8tZrc+2iV21gq7fF4mxnmiN
 SZJ+VE3IBUWkbI469tBUamwvJmopwlvIWXBbpvLmns5TuVfg2ziCF6b9f53xUGr0ptLAxC7xt2+
 6ofUKyshmn4ReWIk/gfyRUG6F20k9fUbxcm0IL0CKHADAcWOhEGdAYBu33Hna7oJTzahusPUZvg
 zGR91MBSHbd4Xxp77OJZRhjuYDIm8kYhYaN16zs08H6GX/OxlJrm2bXf6+qRb10/mu9xZlACjZf
 mVW3bszsPHgUBF8/RPQ/SEO8frUA59kInVGDYJ1J8XgmcLqE8sqfui5C0rREjVHO/Qgr8/CCgi1
 c0sIkUxzX4PjQB8EGSGkks0qHUt0+bwvKoh7mwO20lRlgxCBGSPhybLH5uJ2mHANOBJNHDpzZJI
 wcJ5JG9eCbuNApPD8E22Lr03o/197nRm6I5uGOBXWW5Tt6QgI/kOr04mMYtVR4RZYThbaA3b72S
 pS4feJHuF7MukcvxVQmLyKCrFVbn99hheJXgJsGlzyGDMUiwbS0CrQoJ+YzV/o9I+pFub/k3naU
 XBQK0UV1GCUgIHc9UNYX4IpDnXhF5652trnNl9Iva/DbXSbEUbGAdR+MPdzj27BUa2+W+Lp7aEA
 opBD6qhhZj6HaKw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_073229_437096_2026B441 
X-CRM114-Status: UNSURE (   8.66  )
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

We currently use 0 or 1 as magic numbers returned from the match()
callback. It's more readable to replace them with proper defines whose
names indicate the meaning. While at it: fix a build issue with the
thead-gpu driver I noticed and extend build coverage for the drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pwrseq: thead-gpu: add missing header
      pwrseq: extend build coverage for pwrseq drivers with COMPILE_TEST=y
      pwrseq: add defines for return values of the match() callback
      pwrseq: qcom-wcn: use new defines for match() return values
      pwrseq: thead-gpu: use new defines for match() return values

 drivers/power/sequencing/Kconfig            |  4 ++--
 drivers/power/sequencing/core.c             |  6 +++---
 drivers/power/sequencing/pwrseq-qcom-wcn.c  |  8 ++++----
 drivers/power/sequencing/pwrseq-thead-gpu.c | 12 +++++++-----
 include/linux/pwrseq/provider.h             |  3 +++
 5 files changed, 19 insertions(+), 14 deletions(-)
---
base-commit: d4c2d9b5b7ceed14a3a835fd969bb0699b9608d3
change-id: 20250624-pwrseq-match-defines-aec46817e69e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
