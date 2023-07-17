Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A145EEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+y5ehv9KBbZVpfwnaJ0yxNhzhCWn1G3+nzEAhZV1kWk=; b=O1ulWLljnmJCSu
	tE4TMLh8Hdsxqn0/k9jylRqdNw2C4yFQfQweWcy7/UbVbj8qxkCuqGZnZPQP/5ZpZ7pJbxcy6b4Cc
	KfZn7G9tgpYfybdvQc7WknwyCjlGlYd5lH7LifdO+RLtGZLFp0UTA+dMrTcY2xuoSJKS51o34x+5h
	qiLI6t12fCwLSVEhejW03WMgKAGHPul+60LZhOe/ihlar4Zer0w/ydcXML73FW2VBjGdolJNAQ6Uz
	zDd5T7XgxrfvYomAg8QIL345uL9LhbQIueJHzXW80TaCm6kSTv5B+OqNzlicC6s4cNqf+2oyTSkf2
	H4CAWlXugw+uM2LoKR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0dM-005inB-0V;
	Wed, 19 Jul 2023 06:26:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0dL-005imU-0b
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Oyy/hqOdv+k0nTAkjs+7RYMgFYdulT0nhGoNzbzeMig=; b=DUqEd5azp70SN0hcv7R7Z0N3W/
	YREfsBZpKK3NrYsnMe/oHRZ2ArPYY2Skm31KJCuEhZg0SgO0sUxjl0Spy+LPp1YYupiKYLQ0Zcitb
	FEniUKTqrxhpaDSBt9geNVHLAh4jIp2dIbSzjfy5wspU1q/DMlS67Y1Jy5LaQggApAMFoPGMrnqMN
	2xvS+44+W5NKrZlh9d1vZjyz/+TA9bqCe9RzVBB+ClT3I/1QKXXuoDG4IcdIATU9xAuTM2nSIJrCo
	1SxkzgV7XNBA7ZKBRKBvKqyYHm0pIKeSmA3k0K95aIhUsomlywsjbar3KOiLfOoxGFBTM4APcCS0j
	WIFgwrnA==;
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLVGF-009NOh-2J
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 20:56:14 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1b730eb017bso3386039fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 13:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689627239; x=1692219239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyy/hqOdv+k0nTAkjs+7RYMgFYdulT0nhGoNzbzeMig=;
        b=KJTf9YmZ+opwlSlKQtj4qmVAgcviWKLlE18bPJ9PK2xx2vbd1cglf/B19eHyMCF/iu
         Eo/LO0A/WooxN5UAWv3ScN8m/gCHPScAd1o8ZsTnssQOVautf5+DNwlXfqz2MzgkWZ/e
         bX5C/SPhH1uy1+IfbnoAxp108QlYMtrHQK59JmnuHeuXgWbVGu3YO42QzGuG5u7RkEdr
         oHzNxQ4hcPd/NvOcdLGlAatT1hr1aZ0yu1Letu3MtHfILsfG72e/s4DAm48dG6rMbobc
         NpbivKFS98tExj0Qk/X0qClcS/8nQ5Rz0KBZRGMZH8gxRbYknPYghwWTPxJqFzB+Soz4
         MlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689627239; x=1692219239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oyy/hqOdv+k0nTAkjs+7RYMgFYdulT0nhGoNzbzeMig=;
        b=cIcCbRt6U/y3ZE4ur6wzJ//RBxIjOKnoZ/zJxA0gK2SIe54+PmnIxaDc6RuE6WSsEw
         EZuz+QusL9bzOqB0LnzearWrx44CJ3L7SjUsZ82hf3/aFBBOsoxh9HijKHdx7zhjdIEj
         7MmV6HmNKBLxQwvY2VGrcPZFlpKAM0XK8wJPY5EAvjXr4U0H2pQ0Mmz5geRxvBAaRSI1
         5A+GHSpoWo++2Pnho4q4US7k6udRJiMiDYuTHF8gPjGJ4c32/kp3i5W8p81g3LroI4a4
         FiGtAjSU/ewifBKekVI/H019R+HNBazimLnJhF/xhp6sRhnDAJBfdOkZFdj5gH7emZVv
         s5NA==
X-Gm-Message-State: ABy/qLYBX+3dwWSghDZoRa6loFkuRoqI1+CT6JOhakOn3bKgvLR38bfV
	BMQkGJxVO1TDSZtC5e6FjmK6Jw==
X-Google-Smtp-Source: APBJJlFdP1Af7JGzTPtkK/vllQtffloe3sX9PaU93xyPQ8qir6P/+bH6Lv7otG/v4/4fcg4rtzqtJg==
X-Received: by 2002:a05:6870:fba0:b0:1b4:4a2e:b698 with SMTP id kv32-20020a056870fba000b001b44a2eb698mr13093826oab.47.1689627239068;
        Mon, 17 Jul 2023 13:53:59 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id z8-20020a63b048000000b0053031f7a367sm206991pgo.85.2023.07.17.13.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 13:53:58 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] gpio: sifive: Module support
Date: Mon, 17 Jul 2023 13:53:55 -0700
Message-Id: <20230717205357.2779473-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_215609_142409_6E7825CF 
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

With of_irq_count() exported, the SiFive GPIO driver can be built as a
module. This helps to minimize the size of a multiplatform kernel, and
is required by some downstream distributions (Android GKI).


Samuel Holland (2):
  of/irq: Export of_irq_count()
  gpio: sifive: Allow building the driver as a module

 drivers/gpio/Kconfig       | 2 +-
 drivers/gpio/gpio-sifive.c | 4 +++-
 drivers/of/irq.c           | 1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
