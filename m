Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7CCC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 19:56:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B87E2072E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 19:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A8GEZXrO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B87E2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tg5DqzuE9c2ZCrmsymWlfW2jsIBx+Ew3d+gtfLgvedg=; b=A8GEZXrOq6p7064LymXFpdIWW
	93DxSnL9UaNI3D6HjSbpzUTAjMjDjRAn26kCEUeKsX7RU1J5y/tj1XfkVCF5B5oMTMQZIp/BsZhlM
	QbWk7Rn25+P1T7bCFx8Fdk5QAayK9gq+otcD/OZ6tBFop44YtsYO2NvA2HS8yXsfPLoG1ZjEpR/Qg
	IZDpnv+gZ9QJVb7/7orPkIg1/ceN5CBHhnTHGZV4fVuP0EW2COxrqByjGYjwKAUM1EqNplpsSBxlq
	riExn3TY+CykY9jgNoe8ynq7dJND4d9Z5Jl7XkIHXYYZsROqQSJPARysqGsAtZucoKpKOPMmCU6o8
	Q5mEHg0Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k09EM-0000q3-H2; Mon, 27 Jul 2020 19:56:14 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k09EJ-0000pW-DM
 for linux-riscv@lists.infradead.org; Mon, 27 Jul 2020 19:56:12 +0000
Received: by mail-io1-f66.google.com with SMTP id w12so4684115iom.4
 for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2020 12:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=C8UHP2DIuI2PhUn6nQlydwILHy7h5veWF+bWL7pWmYI=;
 b=JjbtgMMqqfMSmYNmjB99xhfhC0whG6+dftmLlDzprpL5rsnHMREK6Bc/hQsIYI9h8M
 mWa9EC0IGfUj7I/LA8dB/ykrhRZKFMPzbFo1zKHEa6xm7PdF/fqoYA4umrrr3mV3W7H4
 EJKfGpodO406K35Ypo19g4MyhqY0Ta2prWXkIXQGRGfsfyxcRbCavcTlGKmSm5MKp2+h
 xyFLVGoU4AQFPaDUAaXseqjEQAqyYiqseX5sa943afp62ra4rrHYU//aR5BAf0i5LsDb
 mp9x/XKKkVyJAInls+lqB/rllJo6vyzPsBVzLkXuadLaAIDhLhudqbebRQu/dLV9UsKf
 lEGw==
X-Gm-Message-State: AOAM530SeLP56NZ2ZM+JGH5U4E0WeIW5fklJoN3pzKVxglN0x3oDZG4s
 36Br3VmP6hQKfVuhBfskbw==
X-Google-Smtp-Source: ABdhPJwE+bqEac4f3wM8AlVwnQRJLKAVkJx8XhPsguZt8wv7uHc9/LrC6MgxM35EmhAD4wDtwDAGKg==
X-Received: by 2002:a5e:9519:: with SMTP id r25mr21081467ioj.199.1595879770589; 
 Mon, 27 Jul 2020 12:56:10 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id r2sm6613651ilc.58.2020.07.27.12.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 12:56:09 -0700 (PDT)
Received: (nullmailer pid 777930 invoked by uid 1000);
 Mon, 27 Jul 2020 19:56:06 -0000
Date: Mon, 27 Jul 2020 13:56:06 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <anup.patel@wdc.com>
Subject: Re: [PATCH v6 4/4] dt-bindings: timer: Add CLINT bindings
Message-ID: <20200727195606.GA777876@bogus>
References: <20200724071822.126758-1-anup.patel@wdc.com>
 <20200724071822.126758-5-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724071822.126758-5-anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_155611_496236_C591908B 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berhing <kernel@esmil.dk>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 24 Jul 2020 12:48:22 +0530, Anup Patel wrote:
> We add DT bindings documentation for CLINT device.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Tested-by: Emil Renner Berhing <kernel@esmil.dk>
> ---
>  .../bindings/timer/sifive,clint.yaml          | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
