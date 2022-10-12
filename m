Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0B9C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 23:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37qJv6l+wNvHxFDTutCHTucns1teDRKc4uP6c7P2Aw8=; b=Ixmls25Vev2d4N
	KEoabLurEKaURkHyGKXxin0Z5jGGtAwyMgVBN44im/FOjmc2/WpG1HgTXUDqF8BhvDaLZ3mfAWsU5
	rcpa171dfgYDmjkmhUZFhoY6L+wBuQw040+0UBRW34CXMn7ix2LytjjETz2y11byskZJCKeb1/Uac
	PHB69IKvEKUVEYH3chQuoRYp9qVAahkuxfSfUTc5zT9oWciybWW2X55REh6o00cNmaDc/bUjD4Grt
	SwciFP6+OvOFUqh74F6SBHXbtl/VlmUImyYip7FsXd9uT+xECVBXQ9pEcp9sgf6WqVjqkV4o9bV9V
	ZvUXYLQRZWee6BGqL+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oikmB-009eoX-VN; Wed, 12 Oct 2022 23:04:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oikm6-009enT-DT
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 23:04:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id z20so226101plb.10
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 16:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvHjbtVLBPb6g6OBwqchP+WNssUbRFfZvkESQo/heEM=;
        b=luUi3pWBgatBPjt1A2Hij6HNuhOnAWA1PcwKOOJSteCsdjbCFYHbC86x9XDX7uaDnj
         chj+ZpyG6PacPsJnxlBQCtqR5WpTpg7zGwp+u7tDnQMKdOS2NSY6HUtqOVOMrZbkiARQ
         Nu8xkZDQ4hY6ZsmySyzJx3dAkUdr1cUo+WIZQz9qxD4RoLwJqvQJBICoz/xDrUbvmen4
         CFvr/jsV6p/eItcnORbQhHdVWVo7OCXObcK4iyzPuFrWmcsNBkRdtzzPJLI7Nly9AsXe
         bOEzgWSE83QDVeA03sXjfQ7NRrD9gA7FR+RUVn1UKStP2ZspfJ+p4cNE3iUhzLGmd7Qc
         akTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvHjbtVLBPb6g6OBwqchP+WNssUbRFfZvkESQo/heEM=;
        b=SL0oS7OpPUkpxcI21yXl/uUioJLo7YF4yGveuZI+ZWr2GlI9nQomhdV0fUjk9ZFcqs
         91z7HKjXXRV8CVeRjSORg9pEP6UEZKskEJpXUfiq9JPcRRKn0+8f4/Z2EVAh5jbjlQ8D
         kgoMzwc7Bly+jJMUFwqudjst5Q5lxmur4dwvWXYQxi1KzL/0WtFZK+FfjbCKIL8+czqE
         nX1nXSh/H2GOPgE/lCsBe4qXw5qyasTelCgl/kDTZD34JR5okT9jQTXboHqsHfD/SOX9
         ZXMj30R4SNavvaDrJAcpkw6tqccC1Q+6ajbBLEYghx4jcSbHeOMf3FbfhOoBcOER5fb1
         5fog==
X-Gm-Message-State: ACrzQf2yvrC9Jfc3aTfqpIcnD8Y5PbzWV4mzYuTF1zxuugQHSB2lXTdI
	1cEwsUXOPyvTP+eaA8fzHvwRWw==
X-Google-Smtp-Source: AMsMyM6/xEb0p0gbgV55RRT1I2qt1qDgbGVk56ob/OBHdZ0I3S0u7maVFhLfS7aoNUkCO0CHRe/QYg==
X-Received: by 2002:a17:902:c94e:b0:181:4ab4:179b with SMTP id i14-20020a170902c94e00b001814ab4179bmr24456112pla.126.1665615867186;
        Wed, 12 Oct 2022 16:04:27 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n9-20020a170902d2c900b0017da2798025sm11244686plc.295.2022.10.12.16.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 16:04:26 -0700 (PDT)
In-Reply-To: <Y0brVcwYZnoU0ewX@spud>
References: <Y0brVcwYZnoU0ewX@spud>
Subject: Re: [GIT PULL] Microchip DT for v6.1
Message-Id: <166561247399.8863.16595545197819064003.b4-ty@rivosinc.com>
Date: Wed, 12 Oct 2022 15:07:53 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-0fa43
Cc: conor.dooley@microchip.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_160432_691354_E5091446 
X-CRM114-Status: GOOD (  10.93  )
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

[trying b4 to merge a PR for the first time...]

On Wed, 12 Oct 2022 17:29:09 +0100, Conor Dooley wrote:
> Hey Palmer,
> 
> Late as previously mentioned since I had to wait for the reference
> design to actually get released - there's an -rc1 up on GitHub for it
> now that people can actually use :)
> 
> It's all been in linux-next for a while, apart from the HEAD commit that
> is a fix I added last week rather than send you something I knew was
> wrong.
> 
> [...]

Merged, thanks!

https://git.kernel.org/palmer/c/90e0d94d369d

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
