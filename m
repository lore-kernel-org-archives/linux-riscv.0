Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584E0EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 23:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5Ls+lnOm4MepP07FVnz6p+6OrMQm5qH1H16RBFpPNY=; b=LmLOZLdFGYqILb
	stEAl+wLvIAf30SvrxlvEdhkbj7+6+xR+zQGdmp/33z9SbIwMJtIGFnCb/WB916KyUFlBYKh940dC
	fUiczaEy3YC1qYsXemno5hYSU98cVx5d1T/YvQtX0OVwy2Henbd1KWefDjQuYtzTJZFXE8lQOFgyK
	wpCA/4XPmZXMFc6mhdUNj3pSv3Eu3XVnVYMNWHOMoryu4UZVnM7QsmCY07MYq3jXoYl1ZpHxIFscP
	7sVT7OJZW2oCV4J2e6aHmcDOwjXWeMK+D9J/J3QSiS/wuu9BwW6Euct36nsPfBUurIPxhU4OQov6v
	Pe4IuhMYkcG9RZwSvgdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0O-008tuG-1q;
	Sun, 25 Jun 2023 23:18:52 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDZ0L-008tsX-2P
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 23:18:51 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6b74e2d8c98so178468a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 16:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687735128; x=1690327128;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDL2PKiCA+/rhTNU/RAXiTe/8UXzMDcm38qWTk5tJaQ=;
        b=tu7dW0UyTp0mbURYV03AZvvKUB4EVAEcPqmwPKifx/K6gEigd69ommTY9v5e4nGdRx
         /0otvCAopXVymmCSoHypSyDlf9xa1cF4Kmctg6BScYq6FYWD3JBeImtg6vw3uF1qmWPr
         ReafK4WQwDw0MvGYascISNXIOH3YJzftIe5cHHdtQSYmeu+RO97F22cpndpVWDwvL3hx
         HTQg7aaiwXj5ZcRhLWvILn0XjjqgAkdkibWIlxI5mVQZtEVNWDFKv7tl3qKIltrGD5ja
         8+CvrypKjlJYVZA48SrlVUr31ndK+p9YAsamy6n1kZGIXiCOZh0jFUzwSBBHpbM92Ji0
         cneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687735128; x=1690327128;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDL2PKiCA+/rhTNU/RAXiTe/8UXzMDcm38qWTk5tJaQ=;
        b=iLoQGf1jgRMhNHlzwBi/aEreTPKeDlnYWLON1iIRLIjbHWBhJQ9m50eoxC7M9h8/yP
         60f4x+L2zdTmO0onRV+LAnUrXEVVuuZMFe/2tLNW22qqQU1Z33HTIS3OX0REHZYzqNj3
         puodvoYoaP1XxHRgkv/Qm/zU/7WpYO5gZyvNjwIBK23VNhGhUHqYMntcEVguK+L5F/OH
         aCd7oRnW8B/hJXruRbkdAtAf985vnwiGWrZeoOOT7hNB+p7Qh7jCvmWh5hGun51394mc
         eRapxvskDO2pQN/yIYFkpZtGZEzE7g3DgUVOgKsrGHjTg0EklLHU4VgbzbbrW9hr97z/
         Jc0Q==
X-Gm-Message-State: AC+VfDz6C/1ydPjme8IW/D0s7BczGahlPuYUJzIiGjK/gL8YAO6u9BlY
	tU+4IclOLeckJXHveEsXHJQfOQ==
X-Google-Smtp-Source: ACHHUZ4/jIK86E2AaG1hAy2VpPXCHPHwDhZQtOvqja6+oaQ8pw774vDwDuHysXGDTibRWjqAJFzsWg==
X-Received: by 2002:a05:6830:14d4:b0:6b4:7292:5a1a with SMTP id t20-20020a05683014d400b006b472925a1amr21628341otq.28.1687735128612;
        Sun, 25 Jun 2023 16:18:48 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p19-20020a62ab13000000b00678afd48250sm188041pff.218.2023.06.25.16.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 16:18:48 -0700 (PDT)
In-Reply-To: <20230614013018.2168426-1-guoren@kernel.org>
References: <20230614013018.2168426-1-guoren@kernel.org>
Subject: Re: [PATCH -next V13 0/3] riscv: Add independent irq/softirq
 stacks support
Message-Id: <168773507359.1389.408207279075698188.b4-ty@rivosinc.com>
Date: Sun, 25 Jun 2023 16:17:53 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>,
  heiko@sntech.de, jszhang@kernel.org, bjorn@kernel.org, cleger@rivosinc.com, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_161849_782479_09731AF0 
X-CRM114-Status: UNSURE (   9.06  )
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


On Tue, 13 Jun 2023 21:30:15 -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This patch series adds independent irq/softirq stacks to decrease the
> press of the thread stack. Also, add a thread STACK_SIZE config for
> users to adjust the proper size during compile time.
> 
> This patch series belonged to the generic entry, which has been merged
> to for-next now.
> 
> [...]

Applied, thanks!

[1/3] riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
      https://git.kernel.org/palmer/c/163e76cc6ef4
[2/3] riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK
      https://git.kernel.org/palmer/c/dd69d07a5a6c
[3/3] riscv: stack: Add config of thread stack size
      https://git.kernel.org/palmer/c/a7555f6b62e7

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
