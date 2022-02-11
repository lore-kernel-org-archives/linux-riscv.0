Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16A1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 01:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0wNvokHfxPr+bG+tV9h6eNlKeP5CBxKRzTnWFZcOHA=; b=MkguUx4ZZ4hOqA
	ssCOWyQhDfnmR96GkkXukU059CbofKgEBeRsVZ51o9v1KPUrnbFCSJLAqQ3K6vIgJm78i1QtnfGPK
	KOjYzbrAL/3nx/T+9zaMC6kwT3Iv11C5oIWDhP8LfL8G1qgd/uJxC1fjJvWpANSL4geCBEa7KzP3O
	gGcUadqCxESE5ofuL4abJ0DfSSUDlrO0+ApAe50GDWpjBJZbn1pUgAk/B9SX+hTrYRAkpYA8IWV5A
	XdrzVrd4S9KXafp/1tiVmS7ADMWjVfs2H/YnKcOqnTRypO2YchVC5IjzH0hmGpL/SoAZk+aSXD/zK
	/LPyrmDgqpV6RtxmUQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIKbp-005POq-SB; Fri, 11 Feb 2022 01:20:25 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIKbn-005POM-Gi
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 01:20:24 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id v186so20663659ybg.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 17:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FxR2tCd2kQ2slz4IkVSpQwFsX+MPwtsdOXOlbt9nOOY=;
 b=UQnBoKSK7byn2I0KnUJSpQUYM33v2c1HGs/VbASBlEP3xui+kZkgyeCWVxp5XUdfx2
 AHCPQcjBpxGE16zdapg1W5X8VEzI6TfhymRx0nBgsvzGJ1IOGwlPD8rn59ZxC0Fa0d25
 3n2KxZYmaA/Xwu7CiH7povjf+KUmXmiOw4OgnjfEopvWVGYUGczJNe7Ir0zbFMC2Vhn3
 3Y0yk0SeMEfqjl7X+OvgxEfW2jgPdi8BB1vmotBZMER7Fco/IGR9T7RrOPS/DyyJvKtU
 0YfR/aJGhOxmpuDFWH+sf+g07IM9XxmI25DHNNX8WdX4LJvC3lDksGovzt+GUoka/84o
 x6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FxR2tCd2kQ2slz4IkVSpQwFsX+MPwtsdOXOlbt9nOOY=;
 b=n0ueJHuy3IuYoUpFx+4s5EflrQTef3HYpOrfFe0Yjt354u/RoX63WD8vqAizHxu0bD
 HJy+RXTvRZDqoID7ryABO7b72cBn4u0xcn4jJnZtXrlTUXeK5RgyWTCKbeuqBjW0wUYh
 Xk2rd+JGCM1CA6MVSmEXQayEGyZ/zydLqUXozinVlTluyQM/oOTWh25DAXoa1kyUcK5R
 +RG/rtlzIBNs2ngosIvY6Cw4EglNi8YFDZ6c7x8ceEC8T6KTGeVTKoecTgnSBjAZ0zZd
 RIidnvOMgqYQJqZXjynAv2qsWlSyHuNJI0i6QNybpPxU+XjwWiNnmSwKF1M5wIsTi5Bo
 F2+w==
X-Gm-Message-State: AOAM530Odk6NCXASykKUbR6fRvSiuxr/zZjR/euUAk3OOlP+SfU4kQc2
 KZMJ9tD7xHX/kJBqogvyXzdioJADjUV6C7NS7U7BVmqmAKmYAg==
X-Google-Smtp-Source: ABdhPJxvvbhC/Ip2xmkeo9KyLe5UWlcZ2Cjmmt6Q2osiy0C19S3Zfn9E7oHXfdrmpct5QTha34v/loucubB8P31MPwI=
X-Received: by 2002:a25:5143:: with SMTP id f64mr10175550ybb.520.1644542422611; 
 Thu, 10 Feb 2022 17:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20220209182822.640905-1-seanga2@gmail.com>
In-Reply-To: <20220209182822.640905-1-seanga2@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 02:20:11 +0100
Message-ID: <CACRpkdZmWAhToG5m0pqzpE6G-xZKnqYPS5GZnyLfzs0XQ3CfJQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: k210: Fix bias-pull-up
To: Sean Anderson <seanga2@gmail.com>
Cc: linux-gpio@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <dan.carpenter@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_172023_582754_7386EE99 
X-CRM114-Status: UNSURE (   5.63  )
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

On Wed, Feb 9, 2022 at 7:28 PM Sean Anderson <seanga2@gmail.com> wrote:

> Using bias-pull-up would actually cause the pin to have its pull-down
> enabled. Fix this.
>
> Signed-off-by: Sean Anderson <seanga2@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
