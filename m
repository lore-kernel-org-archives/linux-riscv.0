Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16C3C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 05:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88988610E5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 05:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88988610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bk0xkP6+uYcQN0rTaX/xb+DkejbeKLuPx2KjZPYrnE0=; b=2/ZoOm5kKX9v4y
	8hUO369v9MJFuKdQv8Udd+UPvhbDKgNuou77D5hjm7NCHrXvWzn8HnB3xcOTprORr6sckP7HdGpvN
	x2MRuFyR7SJPHOqSp0mxUKmh/oqO3kQMA/yLfGU70z6ARGUhatPB1PaZ9IBad8k5CjQRskRk9KJrf
	1tfk7XW1wF1eO0G4yIzN6Io8zx5wC6aquV5WAdJukUb1jbuUIzRYUz3nAxaCaFGUMnpn2QtYo9aaU
	wuKg0K1UgVj/rfnUq/9Sr/3uV0UUPvdPFpvYXSJ11TXEkOUKC6/3W+Ak7yXrY+HfaL19pNbRcYqGc
	Dk6gWxenx/Meeg0El8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYijy-001eDD-O6; Fri, 08 Oct 2021 05:48:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYijv-001eCV-Uv
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 05:48:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id s15so26081414wrv.11
 for <linux-riscv@lists.infradead.org>; Thu, 07 Oct 2021 22:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xza3FZu4/45i3mPqxeQ2Q2oi0Y+FkLNAPOGd2b40l+w=;
 b=g75tY/NDC5XJY7BXDLhtUI+ly8rpIHUO0hAfLxt1Lqp0TuKXjBW2VpXfF5DB4muVTE
 TapcRhfi+n4hY2hJVfWQ7NCZgn8Y1NnhG8nqFHjPIgoYZrGPm3sfl+jzTD/4sqchekSQ
 Z84RnZPfXJb4euhKwhKR21JWlxMKAxmc/xuglDMYa9rnMBaAvuigGOiOAljwLUixTnVX
 TZUEkBDK3iGQAugiI3ys4ajhotgoSgQcBq5cqZLGZXS6TzqXhuCsTM3LlZ3iahdnRzgM
 BYW64aE7+OwwSceG8moDoPNHocI60+o6SmKvOvUENyLfWxLQsd69SBeB5u8AdBsm7pq0
 yVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xza3FZu4/45i3mPqxeQ2Q2oi0Y+FkLNAPOGd2b40l+w=;
 b=SjZB6quLShmI0yj+BShMZjcD5l28SQlbfUmHetuS+7eqr/e9K20OsMNsl6P6C1ujZ1
 9fbWC//tSLencSkWbDOPmHmZmcdKINxzATmu626YV34vn8uTHwYQ35PVQu03f4HiR/aZ
 M8I2YsISa5wKf7kT3F0ylrCB5iGhr1jGUoNz+ZdRmvmBGZut+qer3K16M/2S4hpk3UIE
 M42v+XlwnL+lOcwRGdvCbHgSdeVO4I1CROCD7Prp0vy7UFa4gF451W76g3Wbp5RaXRaV
 +z1VUpcUFYYgToBEIqOL9ZMSBsxtX0A2Ezm/WT3gvD668o6VIDswEpVmaXTRq35mz+Cd
 cMKw==
X-Gm-Message-State: AOAM5300DL1Y4pY+bZA/Mtd1B8v5u6PpC8oZ/+5ap/EokZMI3m39MLbr
 FTfIwJn/rlFbm1jedp49xJwFkDwXiuMideGCFrYeSg==
X-Google-Smtp-Source: ABdhPJy9UbYUMVl4HBmsmA6GSsZCNVNCqohyBOf6eLhBVYwyPCiXWpaOFeF4fRn+cVVaHILtjVVGPf4oUNk8A3ScN7Q=
X-Received: by 2002:a05:600c:4111:: with SMTP id
 j17mr1359473wmi.59.1633672094680; 
 Thu, 07 Oct 2021 22:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211007123632.697666-1-anup.patel@wdc.com>
 <20211007123632.697666-9-anup.patel@wdc.com>
 <1633661172.604098.1409593.nullmailer@robh.at.kernel.org>
In-Reply-To: <1633661172.604098.1409593.nullmailer@robh.at.kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Oct 2021 11:18:03 +0530
Message-ID: <CAAhSdy1VnK9qKcJN42f9g5j7C1WNkzjpj6QQVFKD=2d9cYzDtQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 08/10] dt-bindings: timer: Add ACLINT MTIMER
 bindings
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <anup.patel@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 DTML <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_224816_019777_B87F7C6A 
X-CRM114-Status: GOOD (  17.63  )
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

On Fri, Oct 8, 2021 at 8:16 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, 07 Oct 2021 18:06:30 +0530, Anup Patel wrote:
> > We add DT bindings documentation for the ACLINT MTIMER device
> > found on RISC-V SOCs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
> >  .../bindings/timer/riscv,aclint-mtimer.yaml   | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml:31:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
>
> dtschema/dtc warnings/errors:
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1537679
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.

Sure, I will fix the "yamllint" warning in the next patch revision.

Let me know if there are any other comments.

Regards,
Anup

>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
