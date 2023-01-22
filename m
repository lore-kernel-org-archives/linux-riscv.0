Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE14C25B4E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdW1oq0r45f4lVsvM3mQ8n3nFwuUoyQs3au//8xlAwc=; b=IcmmIF3mD+Gi4g
	chtJ2sde9j8Qug4NrzCrrr1MjimhR8Se7saT5MY49fv6qQDaIlJAxpLwbIg4SSDQFfZLuOwST1T4p
	aOhn5jYeClRjbxH/an+p1Sg5smd2y24OuK+ykPd9cWVEI2fDA1Qi9ilHvBG2Kqbb6nwMKsLq1X3iq
	dT+Dyx8Q+cv69AGmqvQiObJOlJWJBpJoL2nqAXumFL69ADuPMymab53xKvl/9aqDmpjpSF73XVdLV
	t8nA0KzuHL/fDH2YCcbYWqjNySEI6HSuBEJiy0+61gqvIfftkExuavKafb9Xt1u2pKJuEh4O6HtDR
	OKYHvYGG0ezmffpWaEeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYw7-00FGAU-I0; Sun, 22 Jan 2023 11:54:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYw4-00FG9Q-2v
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 11:54:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so8781969wmb.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 03:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLe1tCHvsXuqDEBtfO7OY5kLhydgi9CnGmhErJAm6aY=;
        b=s0BAxEQrg1XNDKd+RDJjQ/lqdPTA7p1sTOMmyByolojk0mvaFqzqmy7GIdrIZxmIOf
         nFUchdZptB8ZVzLanP/34atcmww1mMSAPnOW6ClddkbiU7eDltZQOUDza6VkttvsUHfc
         VQreJV0TXJjnpWyAigdZSH569OgxnVx8rooyMeC0XkS7AD9xKYSlxnN4RqPAyi5VpF7k
         CoH7kaCdBdozNk9M+weoHgP1irBiEMfOD3knAU/SvcsagkDEAe+ceFKjExWCJUNouNc/
         k5Jv6eqzFnOZo2sgqVpIZZUumFywQQqcWtw67WTGWBMxjS7Nexwmrc+zVtNxlk1/BNXb
         5cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLe1tCHvsXuqDEBtfO7OY5kLhydgi9CnGmhErJAm6aY=;
        b=ljbTeeOTHqkHrvT1XGaOx5Dd5XPBIrr9+eymlD+ZyPhUk26yMeuYUn8MVYod1DatfI
         GpBgo4FPimOpYrsJljQ1HSRMeZQOuDjUIh3G7gX8xZuaqjGElsfMQzWUjh8co3FMr4NT
         pNPdsITUckYjc7YqcW6UuAfa2Po+5sn/8Xtc7IyEw62BhWsnkTVsOVsLQ6UWON6Nhvze
         dIDXo1KQEE7vwXj2KswGOekKK6XEO1+M7yHZZ1edV4r5pnY+dql+oVhFDqhr2BLuyUCq
         7WDAd4A2O4nt0wCrHeWs8ghlmiBBxgn0H/Xw/2rw6Xi6gupQFSgjxJ45PGs4SkVWK8UR
         Wf9w==
X-Gm-Message-State: AFqh2kpuR5MnPziWXk4czpC/oI+eSit76tJnhhxBeMw8IsBAz+wWM+xE
	OyUtTop6d+2vN9aCidnNYn7Sag==
X-Google-Smtp-Source: AMrXdXvuCQdb16Nj82HEsGUUdIjG5ZPXUogSicV9IYHza0HEoyjvxXi4JXn+3h6rll38KtJXF4JaFw==
X-Received: by 2002:a05:600c:1508:b0:3d3:5166:2da4 with SMTP id b8-20020a05600c150800b003d351662da4mr20299706wmg.8.1674388494495;
        Sun, 22 Jan 2023 03:54:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m37-20020a05600c3b2500b003daf681d05dsm8320826wms.26.2023.01.22.03.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 03:54:54 -0800 (PST)
Message-ID: <995eb624-3efe-10fc-a6ed-883d52d591bb@linaro.org>
Date: Sun, 22 Jan 2023 12:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 31/31] kvx: Add IPI driver
Content-Language: en-US
To: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
 Christian Brauner <brauner@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jules Maselbas <jmaselbas@kalray.eu>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Clement Leger <clement@clement-leger.fr>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 =?UTF-8?Q?Marc_Poulhi=c3=a8s?= <dkm@kataplop.net>,
 Julian Vetter <jvetter@kalray.eu>, Samuel Jones <sjones@kalray.eu>,
 Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis <tcostis@kalray.eu>,
 Marius Gligor <mgligor@kalray.eu>, Jonathan Borne <jborne@kalray.eu>,
 Julien Villette <jvillette@kalray.eu>, Luc Michel <lmichel@kalray.eu>,
 Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet <jhascoet@kalray.eu>,
 Jean-Christophe Pince <jcpince@gmail.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Alex Michon
 <amichon@kalray.eu>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 John Garry <john.garry@huawei.com>,
 Guangbin Huang <huangguangbin2@huawei.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Bibo Mao <maobibo@loongson.cn>,
 Atish Patra <atishp@atishpatra.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Qi Liu <liuqi115@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, Alexey Dobriyan <adobriyan@gmail.com>
Cc: Benjamin Mugnier <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-32-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-32-ysionneau@kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_035456_215108_D9A295AA 
X-CRM114-Status: GOOD (  10.34  )
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

On 20/01/2023 15:10, Yann Sionneau wrote:
> +
> +int __init kvx_ipi_ctrl_probe(irqreturn_t (*ipi_irq_handler)(int, void *))
> +{
> +	struct device_node *np;
> +	int ret;
> +	unsigned int ipi_irq;
> +	void __iomem *ipi_base;
> +
> +	np = of_find_compatible_node(NULL, NULL, "kalray,kvx-ipi-ctrl");

Nope, big no.

Drivers go to drivers, not to arch code. Use proper driver infrastructure.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
