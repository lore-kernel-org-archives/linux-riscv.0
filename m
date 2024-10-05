Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C88CCFB42B
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3W+AYIL4SknHDeJ0mhgNn4wp1P7P9Rb7kf2Utao/RcQ=; b=cAmYWiP8SDnhBW
	QIhi4lRufXlXzhOff/i+jlDr7WK0aeAARyjpiKeAAhVH59H241uhoWdegu65LyzXJAtl2JdvVKmdp
	53dJfGg4+s+sf6EI8IGMRjnmwgzl5fecjG8PwDXjAl9ejaC9Cqwh76sRlo/PIjoSpD+lYUeU6tNz3
	3ravjSM4gvcYY8EmJZS7SQRuhY727x/3wpsIaqpckDBHWBtjQV910yJcNCt1Qy5ewtyJpYET2y4cH
	UK6jI2aLuJi0bsQYp61g2eGVE7L9eYIhsoKQzKr+nLQY22v0tw+ivJ/UCskBZeXiOKTDyA73v3C4s
	eo0IiKSaSWR6Z9Ks/QKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAZ3-0000000Fnx0-0ht8;
	Sat, 05 Oct 2024 19:35:41 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAYz-0000000FnvS-3LIY
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:35:39 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e09fe0a878so2289413a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728156936; x=1728761736; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUo8PbLV7DzH/3OkoXZxex7mQaAy2ITOpmg7h/Bwg5k=;
        b=LjFDF9qwlKrmKouqf+Z1y09OLA7SFVq80F6H9RqeK+rkAPqW7pWGGlalYkKXEssdVh
         k38Q5hx2SGrSMdIikf7WWat3EPbU/h5CFSnZr4LDbZAC2AJWjftCPT70IUXMWtXPIdKs
         Fkw2h7I2prKAkZANlxQCONmPhJpotS48xzI8M2M+xvSRA7ZK4fhZ9He8Gem2chQBcq1U
         A3DbAou3vura1POkGZA7xqNkkSJ1yaGG+uLKFVJW7uFaQxR7Q4KZtmOMgIneHqtSkHkA
         ejDXethIU6vOIyZXnY3KlaEkGtTegmsuwqAvc9E157X1juuO5Cy/tw+wqNRklhxmf4TF
         RiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728156936; x=1728761736;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eUo8PbLV7DzH/3OkoXZxex7mQaAy2ITOpmg7h/Bwg5k=;
        b=grMnX1pNJxyCrmERvYynpvEti6Nq2+mrx1EMbZbqNpdKhWf2RrCYvyoZm0pbm3gCLi
         oevlE6CIr0lAEs+4BRRlCrXTYHXYGbkKj3cMo1oAqEqV0vFOMlYNpryBs/Ao5f0QykML
         Fn3WEtybwgoyToycXL4Z2LNtxS8DHRVtTUEA9r130nbAi3ajw64vmCcVxKz37IzJwklG
         T850nSSi2+CBO2pEzSqf4AW0WROqpu1XkSeE7pM5vB6VpyYuNPzu6ubsEIEzbxoH30+g
         r6smtkcGzJKuqSZBJtVf1pHXxVVfKBILOg3qeMAJru8Cyt7CFXEgv0L7U1lbqWhOi4bS
         PKDQ==
X-Gm-Message-State: AOJu0Yxo5dFe0tWkzgvxS2gm34Rl07soCEazdMpxJ4bU8Tm6z1BsltFa
	v0JACPupDTU8wFmQnsq1VKd+r/92AsitJZmiD1bjFjr7m0wdyyDlitcQfDR+QaY=
X-Google-Smtp-Source: AGHT+IHtwrV24xE/l+gDAETrNQXp2UVakTLTo1slvBKGsduAnZc+2iZyU7ukJKrX33skCIK41Z8bZQ==
X-Received: by 2002:a17:90b:1b05:b0:2d3:cd5c:15bb with SMTP id 98e67ed59e1d1-2e1e63698a6mr8331157a91.25.1728156936433;
        Sat, 05 Oct 2024 12:35:36 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20ae6dfa4sm2208372a91.2.2024.10.05.12.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 12:35:35 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH 0/2] pinctrl: th1520: Improve code quality
Date: Sat, 05 Oct 2024 12:35:26 -0700
Message-Id: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP+UAWcC/x3LQQqAIBBA0avErBsYLS26SrSonGogLFQiiO6et
 Hx8/gORg3CErngg8CVRDp+hygLmbfQro7hs0KRrRWQwbcpowlP8nMKOi9wc0Wlyk22rtmELeT0
 D/yGf/fC+H2w6r2FmAAAA
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_123537_896961_643D7B70 
X-CRM114-Status: UNSURE (   8.34  )
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

Two code quality improvements for the new TH1520 pinctrl driver [1]:

 - Linus suggested using guarded mutexs so I've converted the thp->mutex
   lock to that usage in the first patch.
 - The 2nd patch is a fix for a missing return value that smatch found.

The series is based on the linusw devel branch [2].

[1] https://lore.kernel.org/lkml/CACRpkdavPAv2sPRREQhx_A7EtOj6Ld_n+NcO+vH0QCnfVedXKw@mail.gmail.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Drew Fustini (2):
      pinctrl: th1520: Convert to thp->mutex to guarded mutex
      pinctrl: th1520: Fix return value for unknown pin error

 drivers/pinctrl/pinctrl-th1520.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
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
