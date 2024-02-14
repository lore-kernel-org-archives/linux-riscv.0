Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE9AC48BED
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qs/nzOc1h2/F8TUB/mnAOsxiV03Hqt04JkCnsAS/lfE=; b=kLHZ5jmVRKBwRK
	aFZy4y3QagVzCZ9Xsmq1MVd8RHXq++dKhv0Gs98NjnFt6dAdOK0kpy72rsY2jMdiyV23/q65HOXh9
	jDIYJxIEwS+QYL+x8EiZF8TDX6NlTjJ3d/Dxxh/ms9EmokcHOOTvd0serJA61kdvSvuo+LCjJR18J
	jM03tBxI3ObkOYhxSPsf0WVkJoUaaemHYE/NnT4MIvnI10DU6Y9NffRoy2L6Aubo+1t33EnznR/8I
	rl70vqt/RK1I8Dmfz3qoTljGkr2Lt+r9M8vZP5tKHmUn4GYF6LWHAmcquHqoxRNJOhQG03FUent3e
	s68ZAminbGkz1XnjAWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raB9g-0000000CCdE-48IQ;
	Wed, 14 Feb 2024 09:02:12 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raB9d-0000000CCc7-22BD
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:02:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e0dcf0a936so376915b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 01:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707901328; x=1708506128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PG0IiU/s69rauKmwQQKq0QDss70qdtIt7mVzhoYNTgg=;
        b=Tf8ENOhepJ4eZunopEe5u03crJbvxuVggiNI34B9DPxc63xNkFRO3MkeZd3c1xoFYU
         h1akrEFzRHmor4/19f/6mQ2H5if+wa4V202nRGZC5lM4fVEqXyIwrrGnZSFpP1wlngDQ
         n3xi7mWHzfJpZJaA138m+R9Pz5IhyiOxKyzocPY38wfv+qDkzWYUwSp2haTcgVoQK43D
         SCHQXotpQJIFtkik+QUfX7mmGWQIDrV83uaaYZljbokog05P6LG771vxLsVu4e7l6om/
         AVU9mS9/sYErDDmYvgs1rXKcVeku8v1rL+jQNf9aO/CXiW1sreh6p9SpO0lvR6mP49es
         0iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901328; x=1708506128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PG0IiU/s69rauKmwQQKq0QDss70qdtIt7mVzhoYNTgg=;
        b=LeEo2ZNArsA0EuG59SBRqH+VTqyzgu9eJNU3HF7wFXPuADEfwIESpTGPbPuhqOhVug
         VIsIsD845PZFCLE5Q13t+OFL7tIm8yM1gU0QakcxjmnThkQILV617HWxMZONEr4fwRtT
         A3IDaq9lGTl1Go0dqOscsNzLDRec5TW3P2xVl9xVLaaOB3rL9CqAjlr6BoPpATGT1X8S
         IKqgQ22XGVMVuZKCj+fYTZ4vdPlokvad5N/mqX7QVfHQdkIbawLe6Ts4OWu/MgZrfsKo
         MeRQsVZA5p5xu3KRbfOu97q2/GcQI7RX9lXiwCwelA4DnTA94rNytyuAplitHSKwnPuJ
         QgeA==
X-Forwarded-Encrypted: i=1; AJvYcCVNX2z/xPgmvtdHevb8NaRNwEHVQpbGI6EEBl97rneFW1UXkuvjFaqFLkwkzxxnj8qkMRRsf6D4p4yPFq+CRvFmgpm7e9oeAWRJR9qTMzwv
X-Gm-Message-State: AOJu0Yw/NHvuAXU/6LA5n5scd+ExzvLmqmEADbq7x+WcKxrxE30+Y6DX
	QGBGdyKomhecddSy1mSTezkFAdbfLpJ5tFvxtIpUUtnjZGbrNCOWF/xsassc8GyDT4XiA8MlNWV
	o
X-Google-Smtp-Source: AGHT+IFZDfQZGItnAQkonqR/Yikgb4B5zLgUFibXDBjJa1njdREAj5ps9BVVaW/vzNwOz21QNCGcMw==
X-Received: by 2002:a05:6a21:3997:b0:1a0:587d:5664 with SMTP id ad23-20020a056a21399700b001a0587d5664mr2415076pzc.15.1707901327898;
        Wed, 14 Feb 2024 01:02:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwx8T69DaHtqPp+CeSq/WLrl/IdHgV6ExI7p/7RvPuv2E7ZTW1x36XoZ7PISg15xVLh/f2Yoh66AZ0ddPdxoWYRc/Ddqchz4mt4vauHE5KkKyhxzoxytAfLtOxiQlLneN61j5HrOVOZ0OqZU830b3Z59XwhPJl6OxtE2a46ojK0hFnlLheuEcNfvhL/FFGX6NIxwyvJm+QIPMCzVbJM2jJtUIygOpb/QKOxPPwS6OA
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id m25-20020a638c19000000b005d7994a08dcsm2476681pgd.36.2024.02.14.01.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 01:02:07 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	Stefan O'Rear <sorear@fastmail.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH -fixes v3 0/2] riscv: cbo.zero fixes
Date: Wed, 14 Feb 2024 01:01:55 -0800
Message-ID: <20240214090206.195754-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_010209_727370_9D8776AA 
X-CRM114-Status: GOOD (  11.15  )
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

This series fixes a couple of issues related to using the cbo.zero
instruction in userspace. The first patch fixes a bug where the wrong
enable bit gets set if the kernel is running in M-mode. The second
patch fixes a bug where the enable bit gets reset to its default value
after a nonretentive idle state. I have hardware which reproduces this:

Before this series (or without ss1p12 in the devicetree):
  $ tools/testing/selftests/riscv/hwprobe/cbo
  TAP version 13
  1..3
  ok 1 Zicboz block size
  # Zicboz block size: 64
  Illegal instruction

After applying this series:
  $ tools/testing/selftests/riscv/hwprobe/cbo
  TAP version 13
  1..3
  ok 1 Zicboz block size
  # Zicboz block size: 64
  ok 2 cbo.zero
  ok 3 cbo.zero check
  # Totals: pass:3 fail:0 xfail:0 xpass:0 skip:0 error:0

Changes in v3:
 - Drop patches added in v2
 - Check for Zicboz instead of the privileged ISA version

Changes in v2:
 - Add patches to allow parsing the privileged ISA version from the DT
 - Check for privileged ISA v1.12 instead of the specific CSR
 - Use riscv_has_extension_likely() instead of new ALTERNATIVE()s

Samuel Holland (2):
  riscv: Fix enabling cbo.zero when running in M-mode
  riscv: Save/restore envcfg CSR during CPU suspend

 arch/riscv/include/asm/csr.h     | 2 ++
 arch/riscv/include/asm/suspend.h | 1 +
 arch/riscv/kernel/cpufeature.c   | 2 +-
 arch/riscv/kernel/suspend.c      | 4 ++++
 4 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
