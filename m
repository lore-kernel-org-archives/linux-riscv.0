Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49534C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bLieVjm5rBoy0bHoBqwgQtI9wjyYsJZBdisOht747s=; b=BaZkvqWm+ivXRo
	L/oIo+TGN9A+5hV2/46COWTf0ojwGdmVVcNCbFkZo/ewwEYlYZ3teLsM0PgQknAPHbo4760P/xVJ6
	/jUCyai6QctJcwvZBa2nMTbdS9S+xHQC2rqX7pdkWtcNWmr0+aT3E0D0DY8HVDKU/OHXDbXSLlO7Y
	QVFOQjvsNuTxZ6ndzOrWlGZUvIn8Zf+CkFa2207hQ/yXGeJXK8oVQE1xBXnjoYkE+/LAwdDuppTnH
	TjxKqCIoVqPd4c3AwRkvWjIXJE3BIdZCMmjthABBASk8a2A47iskhNGDqQnMnCFdXmwR/JmroTgn0
	iM4tijbl+tYbfGLzszZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYwQ-000DUY-7v; Wed, 13 Apr 2022 09:05:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYwN-000DTF-9s
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 09:05:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 h126-20020a1c2184000000b0038eb17fb7d6so3513476wmh.2
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NDtSKId3t6dVkA8YfqUQPPECjRhEPlDuS/Z/pAcPWM=;
 b=TuU29OnmVZBwDVSbKNjQMlspssMwQ0smsXVpvEekZAZYhMZ6rmcAtcUd71RRjOL277
 u6oyzNzv/A4ja7FzUqeBmT7WN1zE8/44iI/RvZ7P8smd6U4gAXVE8TQL/19+8C3+KPUv
 yBdRoUcWVJnyaqmXn/p5q9phVKTEcX9VLnba+gP/K4wx9g/FlU70zOXwqNnh5QQbNhqK
 nDYMONLJMbgaADuYmicO3KSDVch4RAKY461SnjN+MOe/GOELjayUmzGF/V1/T2RM2Mnv
 r/sGs1uE7Cvf9/P+VwBq0QFg4Qcavl40LxXI7JiXW34D5+6iGXS69QhIxsLs4kRvyi2f
 KhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NDtSKId3t6dVkA8YfqUQPPECjRhEPlDuS/Z/pAcPWM=;
 b=jYjWz3bDkjGpvNts5ZAVYTbciMPIgbojTmL6vWWtP/otyDGp864k7Xv2KQvVe/33wM
 aUIVsCzyZvMBjXWVTzH38OcgThNT8nPV3SJuedaRUJXkOV1yHa/ohIZDvU+NsdQbLGFo
 RUO5diDlXGjDxKkF3YwZgoKxVQmyPwNNJnZcJNY0wp9IPg6jg30bfLap4SfsRRGOYR4G
 UHfKTLbuXSdxMft9pIviA0vFt8utJElw8ww2h1Ti300UjcCTkGR2HqvhMjyq04W6PrB0
 zWD5Dk8qZOLAVKEdHL7PsNqoniIqBM8aeB7YnkLNnc5zz7Lgc6IbRoWypkCLY9vAhUwQ
 1L2A==
X-Gm-Message-State: AOAM530TTWaXF6pEQDvmGP4Y+Ha/K+iyT2SRELyGCT/+iAE3fvLp2n08
 Fm3p9SSdPaB0GWe01wPj9yAZBU7lMecmlMdWZxOewloFjrQ=
X-Google-Smtp-Source: ABdhPJylOEa/v15SyQPNZavNcci4UoiyZBtHsblEWuNg3HE6JBWlJPfFv0k6WcrfgqyGBjMmc+alxMQUkxaGdQ6vvWc=
X-Received: by 2002:a1c:3bd6:0:b0:38f:4e30:6c2f with SMTP id
 i205-20020a1c3bd6000000b0038f4e306c2fmr791293wma.66.1649840728817; Wed, 13
 Apr 2022 02:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-2-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-2-heiko@sntech.de>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 13 Apr 2022 11:05:17 +0200
Message-ID: <CAAeLtUBrmBg1E=AdAkOQwMPYu74WtL2YuEacLdNA69PqqkDnyg@mail.gmail.com>
Subject: Re: [PATCH v9 01/12] riscv: integrate alternatives better into the
 main architecture
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org, 
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org, hch@lst.de, 
 arnd@arndb.de, wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com, 
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com, 
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com, 
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_020531_429026_2131C04A 
X-CRM114-Status: UNSURE (   9.83  )
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

On Wed, 13 Apr 2022 at 05:04, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Right now the alternatives need to be explicitly enabled and
> erratas are limited to SiFive ones.
>
> We want to use alternatives not only for patching soc erratas,
> but in the future also for handling different behaviour depending
> on the existence of future extensions.
>
> So move the core alternatives over to the kernel subdirectory
> and move the CONFIG_RISCV_ALTERNATIVE to be a hidden symbol
> which we expect relevant erratas and extensions to just select
> if needed.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
