Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787EBCD343F
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 19:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G8yXuzQjbenCW1bKPUs/gvFKTPC2UbhfJ/8lOgCpF60=; b=y3biVM7eO3+Xb2
	mYNDTB+naBpUmOnduDqKykY41AdBmJdPsQYxZ/XDjhqLCFicmMRTeWvjQXDbnGzZVQ7BP8FDO+nHC
	Xpr7YS6+c2Af7RxpNWbnUy0H+/IUqZcbs6/6bJ7QLFUeH9X/qYPgD8jZxfIbsKui+ny04x5PO+ORs
	n6M2q5wb+ShW4oB43cE83InshsGqP/Sx7MLP+63QXVMZn+54kkzrKCG2WYEkqbC3EtTouZPSSjQhR
	ZeHtrDXK7428+gWpDelbExaSnL9lVaYRt18j6KAm/n0vVuCwQWV7GXyKNJWrSAEbyBXehGrb1Xbnc
	5TwfdfrfFzVoPCN8bcCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3lM-0000000Ghbf-3E9t;
	Mon, 18 May 2026 19:36:28 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3lK-0000000Ghay-1xoz
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 19:36:27 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-133466cf955so10195757c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 12:36:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779132985; cv=none;
        d=google.com; s=arc-20240605;
        b=bUo3cbgsMEYB2kDWSDS0CZwa+SGjsJV6+mq9fQk2R+3nDo1X2zGg9/vZdYHvHxMhGc
         XQzAOT8UkyjF1XB7stT8q+kM8a0iI278KLiLPXxSJInDv995jwLmwr3WEVEmY2CCz8Pt
         qZO+EKbKqWiqe2HsxrdAl+ugsnYbM5ztj6NBoVhH+BeJR6IvM24LSUlqNLgG6eI5y2TV
         8m8s9iVJqUn/tDHoJKZMmIFUWGD+R6gHlUeVNGKXMn943eauVIV50RyuWFwGe5ml/LeS
         X8OjLML/EDzzECfO2J1lqWizL0UNPjqStrKPLzRiGa3cDmQKcHp2DAnjUYLmxTDBuxNs
         19rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1BM6kKwgHy2xvm29KSFNMOHdSSP7Z2KyWhC+9ZklWk0=;
        fh=qxyaLjx+R4a9i+p0iT4t3WTOnJmr/XEG6q4c7D/HQNs=;
        b=NBlM16tae+6qbq1W5cNr8mqt7eA5sI9LLheDFDfLXE8zFZwuiqKWBKJJ7UojbNOvkY
         F21SaGbUvvIz1HwySBoeXL0qMdGFIGbLiKpVULEO9GDoLZy0iOm79e9+qKoK81ufOpcA
         NeDKEGUu9jvHuDQBpstOHEFRkjrNFtsSvI7omBMJt4th9yus8DrYSp7ZbhuUQBfvimHd
         QpnmnMZoi0Yt0QmW8h/WwgFY9BDGPSjYfJN9EfxfjYBMl7/gSeqkvrOO3ORFbP1M+MBG
         3yxO0P8UPd0Q7q0zWhP3yUA4OsY2OyxrpMyVfknDkgXr7bcuA+In19hsekdEYGFQRfyf
         iAnQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779132985; x=1779737785; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1BM6kKwgHy2xvm29KSFNMOHdSSP7Z2KyWhC+9ZklWk0=;
        b=JACFvgeeFRymQPlY6cEmzc1lp5I8uQyMM5Sl9wkepc8yEPVnXJTyx5nl7CU4wrDas2
         avUMde3amYrXUojlF8PQpCz6oyhaEC8DYLvWYH5LJwKJ1eOWHoHe6Fc4/C38pgFpfXjy
         6SxFb1mflkRbb7ju4At1EcXb0+5v61mRuglDyjhpJwPeV9b900+hHUPdu6nwCJgA6h9c
         ZvcjUxHEcIkuVmnCCXKp+lRu/mgtnDFfqhEoXRygucc2fnqXE8A4uopLvAwM3x9MmP5t
         phibPo6TK8Pxm3JXu83XrcxEKOevDqxy9i4bfdsdy+WhG21jwgIt876wXYMbQ6Gk0Ssi
         BgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779132985; x=1779737785;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BM6kKwgHy2xvm29KSFNMOHdSSP7Z2KyWhC+9ZklWk0=;
        b=QhAnEkAHH05HOsfOGGky0HLPIobXnp3SgTduXtrQa+FrR4X2VV65PALFQSz0eTI41r
         SKjJd04o24j+gp8AnsMxlU0cDZmPVYaOItkRYbkKvR+f88W+I2zPr17F5NCouziJiqXF
         w39fHVXXiD5k6f2op0FoF3ypOZ63G8BvOJRknVtUb0BlgN4vC/kFhvDJ9KQ1OP0cpSXc
         7V/HZfZfHnQODWVfR6Ulz5camyRgtK6nUBnKpKAhs+2UkDrKa7NLSpyKz9PFEqX7gvHr
         VOYLRLmlqKGqMlsg2fJGnxT6chtXoBAXnB/Cr4JBC/ojKSmwSu8cnEw2cd+jPEwMZ9EY
         q+rA==
X-Gm-Message-State: AOJu0YwlpGGV7QWMPEuXtUdfB8tWHgRLXURnXNX5ayh5ZB9buGeV64Y3
	WtW2bx29fIVdgaI9y7UYD9UkWpv6PpMufFIUO0J0FISVppf6I3EAdOEyG6QmKZbD8Hlu2o/aikG
	GCmGerWWSIkfQuKMjdQXYR5sApFQNn+EGlgkW
X-Gm-Gg: Acq92OFAD+FxzwFBWOJuRfEuWnzoKDm8sW3d1/KBZDE6CryiZjUX6VpBu7u4OJPqW5m
	dpRyji5nlqoSJ39BqBvpCJZkHhXWtq+46DRm6X94pq72zlCbE6jjf7y12PjXkXpioQJGaHuy3YL
	+NeBdfaXuol4oW+K0v18SFeCjKrwosbmjPZv/u0UCpuvQQg+fS/LmipAF26PWqeFJdDWsoCeKHp
	0scdFN4VAIAx8qMUTh0eCcP7nTNEAEcCbe73GclKWRiu/yuAag5ETWUIYsW7RB9KC7ZhMZ/xdz1
	qCnpSBw=
X-Received: by 2002:a05:7022:7a2:b0:12d:ce36:8930 with SMTP id
 a92af1059eb24-135044193aamr6618540c88.3.1779132984899; Mon, 18 May 2026
 12:36:24 -0700 (PDT)
MIME-Version: 1.0
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Mon, 18 May 2026 22:36:12 +0300
X-Gm-Features: AVHnY4JIj5mcfDbBjCTuHmPk4TSdB0pXwYy6_NAVcglEZZw7fy8onxmNpDNSvyc
Message-ID: <CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com>
Subject: Booting v7.1-rc4 hangs on a single core CPU, bisected to ff1c0c5d07028
To: linux-riscv@lists.infradead.org
Cc: tglx@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_123626_509220_6FB1F570 
X-CRM114-Status: UNSURE (   6.79  )
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

Hi,

booting Linux 7.1-rc4 on my Allwinner D1 (single core RISC-V) board
hangs during boot.
The last messages are MMC related, but further testing revealed that
the system hangs at  msleep()/usleep_range() calls.

I did an assisted bisect which points to this merge commit:
ff1c0c5d07028 Merge branch 'timers/urgent' into timers/core

I tried the suggested workaround "revert clockevents.c to the version
from 09c04714cb455" and it fixed the problem for me.

Can anyone with a single-core (RISC-V?) system confirm this? It seems
to be no issue on SMP.

Best regards,
Indrek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
