Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAACC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 19:46:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DB322BEF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 19:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42DB322BEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xb2jyArY3a5/DaawMLFtL8u8RDlh83rGhytG84eXqSk=; b=gd/u7Av2iSiJxiXSS0ksFpLQy1
	uaqw63mQxnXX7vJ+MbOBESeKfurxvDIKIkh5zs8yslaQYZJC7UWnmwiDrjZ/secz4KkywwDyRYsNM
	ZGj2h70Ud2eFZLKAc7Phi21d3Jv2DgJRP3fw+fgrlA4zhgs0wc95G0M1T15QOjqjRSmOEAzL7Ojy/
	wcY2zOt/DPxIh8mp9zeE2OnnYu3p8OXgq7urAj8Q0hQERh2uBkLtg8iF4ttG3VDaL1uA/OAjJ/r24
	uhIKGU6Y5XCuOG9kUJdlQvRmRI2VizdmARf+WSfuq7d6OCpndCJjq07lLZa+egBnWZG49TG67GLJw
	VMmLUm4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz38n-0006nK-HS; Mon, 11 Jan 2021 19:46:13 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz38k-0006lj-LH
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 19:46:11 +0000
Received: by mail-lf1-x135.google.com with SMTP id a12so1277696lfl.6
 for <linux-riscv@lists.infradead.org>; Mon, 11 Jan 2021 11:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JvMy3L9QNmsGKgVZKfbdC340c0gFWd8CrD1qVz5RsO4=;
 b=sPp3XDYEH6oYLgxmKSkpyAlA6ZweADfIMjvLfHv2wPzGaNNrhidJG0CWzoiedf/DOj
 aalvWRNwoE2RfbRjQr12LP947WQA5tR97OmRvinKdfsHp1dfbRSShYmiKemnr8omI28y
 U5nvi1coo6NgM8DVmD6/uOrDWjw6fCeNT4Ac0KpiknPkHmoujEdy4t8KilMxpN8Eirhn
 eDHSBAQCF0rQj1cNYXt5Qo4EjhTb1BJsj6yplzN4sNVsbQs8isk4JTFTjkMpRA8XE4kq
 MTYYMV9crfJumgupqYQLGcvPz+KYPxK4LgGnGUuKXNKQpGxXtwBk65amTkIYo5oIKpoC
 XALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JvMy3L9QNmsGKgVZKfbdC340c0gFWd8CrD1qVz5RsO4=;
 b=LX9uKO5LOrd6/ZySze4oOnNPGOZlgqVDRJFD3f/1YDVrbd8sw4y3YtpFwqQ1gpcjH9
 +dREqOfXkXAcGf8N7fE7ll3TUDC+kCYmDE3n/6XaIb8LBCUacqdzXTnvQHsweR3Emj0r
 jQ2mVC+XcACnx3D23ieARbDzR7cH3qpXPIZfjUA7oCQ2DpBsWdgV4+ljsj1FEiLKLBks
 pLco3Sw1g67RnvqQ5F5p3Ccnh0bsbP93bL7tPt2LRYZkQ/cuV6nQ8hV0D4OBoKs/gsJy
 lqi5BICCcB40vQZeY8THzA2ZrWLuHzCKcezfzOvvfMrfoWtYjPonKqxi2/6F8t2o3gsT
 Qzlw==
X-Gm-Message-State: AOAM5325HF7KeWWQkOm7KF/h/yeaR9C2zToYohkLRx45hoZh77E36PD3
 zz4x2Vq4u+uFHBcsAClwm55bq91d7n7VRgAvuBQ=
X-Google-Smtp-Source: ABdhPJwpjPS1hMIFbau6K0ME+HxOaKt3xEuWr8Y8uOpmS7WWDQA67Y2V3JWRz6O4bbF6hIHn2GFGdsJketDy0VOP0SA=
X-Received: by 2002:ac2:4463:: with SMTP id y3mr496815lfl.94.1610394367183;
 Mon, 11 Jan 2021 11:46:07 -0800 (PST)
MIME-Version: 1.0
From: Paul Thomas <pthomas8589@gmail.com>
Date: Mon, 11 Jan 2021 14:45:54 -0500
Message-ID: <CAD56B7fYivPF33BhXWDPskYqNE5jRxd-sA=6+ushNXhyiCrwiQ@mail.gmail.com>
Subject: net: macb: can macb use __napi_schedule_irqoff() instead of
 __napi_schedule()
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 netdev@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_144610_792290_802930AE 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hello, recently I was doing a lot of tracing/profiling to understand
an issue we were having. Anyway, during this I ran across
__napi_schedule_irqoff() where the comment in dev.c says "Variant of
__napi_schedule() assuming hard irqs are masked".

It looks like the queue_writel(queue, IDR, bp->rx_intr_mask); call
just before the __napi_schedule() call in macb_main.c is doing this
hard irq masking? So could it change to be like this?

--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -1616,7 +1623,7 @@ static irqreturn_t macb_interrupt(int irq, void *dev_id)

                        if (napi_schedule_prep(&queue->napi)) {
                                netdev_vdbg(bp->dev, "scheduling RX softirq\n");
-                               __napi_schedule(&queue->napi);
+                               __napi_schedule_irqoff(&queue->napi);
                        }
                }

-Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
