Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A91FCD5BAE
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hPlY0//2R8gdbquBJ+ORJk8AW/87yiK8lXdS4xTBPCA=; b=uo/BEF28j1ScWG
	arm3Fn4VBETEBQbZRBht3JrTEOTi4/JTUgoKue9wzglSrMscZ668P8DbUHqlAtohKjjtgvbYon8RB
	fQdbMErOkGiy1cWQqQ9v5N4InEunpuIYBQhi2QFdZkrP6U9CXG7C08f7IfvdjlE/de5GsHh94sVg3
	R+ZWv0iPQtyhiAv3djBrLHw32rbCpl2pXNa1NMlD5EhzoSIDjzLoBqF1/5d6Atb5K9qyZfBvtXuGX
	e0MVWr/o3jyJHO3KO4W341c3HVy/L6ZHpdXcQGIhyHVonA7FDg8Qa4JlR5LD5cf883lr1/R6Bra3R
	73tzp6AVEguuFLl7lhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBJa-00000008F6j-2ity;
	Thu, 05 Sep 2024 12:10:18 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smBJX-00000008F5N-45RX
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 12:10:17 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3df0dc53ec1so439885b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2024 05:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725538214; x=1726143014; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha5Zf1HaPH2gPY3Z++jYDIyKBqU5jbdT8Whm7IqAb2o=;
        b=MiBrXu6m397kijWhQJCsWogwgm2VNBOIYSfSV6OuhGsyGj75GYcFobJxjeUqz/wLLI
         elmck17jFnyN5ZliirFKu+xHz54WvPKh/X/h92pzk+gFbu3DT92aeuDCqjeS9YSuUPi+
         IDnsXkanYnLvmSZRKDYq3O4ocYy013VMV8e6+/jO3NEypj7cptUSmFePxZcfOxCnv5es
         nvluojWJ5J9WlcP5CKZWs/xfp7IW+LrPAh7PjOOTh3NR9S48D/dOIYAuzoOEhZrvaHUd
         ZiM1bikxjWo4mGM3WL+CKNRyj1S4QzHvfry8UNDGSSCsA79wrX+dAKweuBcUtl/8MJxb
         Mumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538214; x=1726143014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha5Zf1HaPH2gPY3Z++jYDIyKBqU5jbdT8Whm7IqAb2o=;
        b=mocolylID4atv+rqUJAfAp8vCBKnNgmywtlTBpah19WZeEL2iTAUc2+oW5P4wtpMXW
         K+WBdwS4GNvRPRoYmg/bU44tOYKjQqbmdqduHuDXtqTTnF0Fc3qy3qQyf00DAUsNOZjm
         nQTnQPEYWVFLNq2y6nQLOHRqtZRmw/kXFygczJ3I64NTZgUXCnCoNUSEeuOQA/1rllI7
         YopgU1yH+bNJOTOMSNd4RDLY96oHA7Cx/XKChtLrNlZ1zkYRjicLX1HrGiBx2G/M9v2a
         7TrcLhBRqG9Bh19NpFJEhe6Xhrv5egJzE4J/SQM2ylRhDY1NtFgRi181zPotPM9JHlg6
         NoMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWixALK7h8V/iI4iTDl0vUHEu//BHsAJam8/ugS6FR/ALNG1HcmmUU9p9Hjtq1qD9QGLZ9r0Dpd8KBicA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8L6wzg3jxfB1amPcTo7mlbEuwS7endojRjmZzpWd79uF99T3D
	nnSVCz44b2nis9iOW7kJMiABau+ij9biN+SwWt0ycxqlIJtQSBJC
X-Google-Smtp-Source: AGHT+IGJvHRHIxP0i3HI3L6UuZmSa++0i9QDMBoTgYvhTm3lYqbQEvy9GjgzIuMBQhis16h3LJn2mQ==
X-Received: by 2002:a05:6808:2e85:b0:3e0:1c90:cfd with SMTP id 5614622812f47-3e01c900ed3mr2516507b6e.9.1725538214078;
        Thu, 05 Sep 2024 05:10:14 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3df11882be0sm3187232b6e.48.2024.09.05.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:10:13 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH 0/2] pwm: Add pwm driver for Sophgo SG2042
Date: Thu,  5 Sep 2024 20:10:06 +0800
Message-Id: <cover.1725536870.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_051016_039348_F6BBC840 
X-CRM114-Status: UNSURE (   8.21  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add driver for pwm controller of Sophgo SG2042 SoC.

Chen Wang (2):
  dt-bindings: pwm: sophgo: add bindings for sg2042
  pwm: sophgo: add driver for Sophgo SG2042 PWM

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |  52 ++++++
 drivers/pwm/Kconfig                           |   9 ++
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sophgo-sg2042.c               | 148 ++++++++++++++++++
 4 files changed, 210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sophgo-sg2042.c


base-commit: 431c1646e1f86b949fa3685efc50b660a364c2b6
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
