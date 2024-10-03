Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFB8CF8551
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 01:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S5ffFfukRLBlXbBLTesNV2hZ96s0Ep61pGn0bZNTCJo=; b=dm/i4pXw8fvpR4
	YSJcgb/sAxfRJUcnNlx1rn30N5vxWWqRubnoTX3+37zCWkwBk6yyXMxwFRKHLahTzt4ncylhjeiKj
	S1CUrBHVuS+sQEbAj1VQ1T09LKzmGxnIp7163H/4OJgqIYEMx6HCeL1n2bBCvakBBGWwRv0xu2VsH
	80o9d3tsNnqFa1SXgxHKmXqr1ids4j7JF8KRj1xok2xB9ctPc15hKE0gmhOwSaOH0BgKAih1SOfpU
	1g4bkaCP4AE9TVQk6EA5VI6Z2FXHm4z+UBAAjnT7/enRJOb8XsBjNIeRZ77fGztMW3Cc+jO1/lKVH
	Kut/++BEm7ZbCssUXikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swB18-00000007xN5-0Zny;
	Thu, 03 Oct 2024 01:52:34 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swB15-00000007xMm-0pGg
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 01:52:32 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5c87f296bceso39421a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 18:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727920349; x=1728525149; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I/rWvsZuJEnymhTDM7Pm8jF+pqqOZ7ND8pv7IT2OCMQ=;
        b=Y2KhD7nDqvY6VM8J3SDEi8zpIf93mXNziFQBCqKmD+VY8lXcBCnjJT2jxuNmKwOlcF
         pQojqJl5zv30k+Y3m15aO9RL0M5XgB73fyweQfYzW6/6ce2LY0vh7XbL0t1kZejpfpbE
         s4dZ4wXwbCFpBrykpjlZHZBih5R4yEX9HNd36DcvnUhKSrUFjZRarK/VFKTN8pqDCxw0
         Ra2N2Mox6SJIvG/Uz4Dt7D3z36proVU7/eoIgdnVdGYjQoEZ7G/7YffC6YRNkamVeEpz
         jv2LI2lpdYABcnyxc/quetFHen2Njx0yrw7FQHEbqHEhxli3UAdRcAFMPaRgGrTJhcRF
         c3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727920349; x=1728525149;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/rWvsZuJEnymhTDM7Pm8jF+pqqOZ7ND8pv7IT2OCMQ=;
        b=TbIp7CWeUAHpR2J5RSQ+sH4qC0Rtffzh4uh5ySAE0k78lq/QE06S7CUDd6DsE02nGk
         QJc2IkWb2HAUK25OcjAQlBS1NVO5+EoZ8ubHUwdF7YVlNeYthADs71WR7h2XZtvR43ha
         o4A4FfbzWe7F41szth2Y/3u6/nalyljM0oZnlAwtTOG8eqg3+2nCPHjLZ1gYKBObaebn
         DDk/p01yNY/OUDFsmYu4Suan5gZ9/z45OAIuSaL/g/QiwWWhU49/uoQM3CIxoLewVi+U
         3h4Xnq6QkXfDUNXPYq/fpOOmHnQZ6r9GbICorLWLAJtmFU/bIeQdhagtpFoLzhgV4/Nw
         8XDA==
X-Gm-Message-State: AOJu0Yw/+mZM4FpraRb2AIad9tWNojFddvTDQD0MyUXyi5LY21lONQ1d
	T56CJroct2T8hB7aI8I4EOynZWulc1hNUvnOizumoaH8I79YTnR7WgacaBj8beniKXErXxsj4tI
	QYf/DLZzln7FHz+qdn+mt31GwZM0=
X-Google-Smtp-Source: AGHT+IHjSofrdU7L5Fw9Rh13LE6vSGJ31h7JyZrmS4tF2mTuJtqY3WvYbVHQ5oopKpupwP3CLt8ritTnQkMoNXATgdo=
X-Received: by 2002:a05:6402:40cf:b0:5c3:c42e:d60e with SMTP id
 4fb4d7f45d1cf-5c8b1715fd1mr1743631a12.0.1727920348583; Wed, 02 Oct 2024
 18:52:28 -0700 (PDT)
MIME-Version: 1.0
From: xi xi <clf700383@gmail.com>
Date: Thu, 3 Oct 2024 09:52:16 +0800
Message-ID: <CADPKJ-5EXJnihARj49cr36Q16ApU_qQeEA0eS=kx21s1oAR=wQ@mail.gmail.com>
Subject: [PATCH] pinctrl: fix Null pointer dereference
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_185231_258224_91E2B3DC 
X-CRM114-Status: UNSURE (   8.86  )
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

From b673ea2897c5efc60b4ad8f9b4a4327ddce0737e Mon Sep 17 00:00:00 2001
From: clingfei <clf700383@gmail.com>
Date: Wed, 2 Oct 2024 23:33:47 +0800
Subject: [PATCH] pinctrl: fix Null pointer dereference

pinmux_generic_get_function may returns NULL, and its retval is
dereferenced without check, which will cause a null pointer dereference.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 1bb78b212fd5..9331f4462480 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -798,6 +798,8 @@ static int th1520_pinmux_set_mux(struct
pinctrl_dev *pctldev,
    struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
    const struct function_desc *func =
pinmux_generic_get_function(pctldev, fsel);

+   if (!func)
+       return -EINVAL;
    return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
                 (uintptr_t)thp->desc.pins[gsel].drv_data & TH1520_PAD_MUXDATA,
                 (uintptr_t)func->data);
--
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
