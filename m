Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62412C27C76
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6u9dqWrbtY3Z/LdO7TBLkuSpSRQsWhDvcTk/HQKXxk=; b=AYOVpplB2WhmvM
	DxsJ2qBlYcoT/SubrNcNlGF6c7NiZRf9YQ75nvcj5nFRc76LY64w4TDILkhOFxsdbaDH4KPhNO9KS
	Bx02dHfTOIYuv7RX0gs1ypixNPeY4RrzHJOuLejAA3xntRjzA5XlzOULrmlaoHYSXWpU2oattf2MX
	Hq1hYJUID8YfB1XxDGY9+sDbfX0laZrC5V3bNzjMaDx5kF36ZXoHWfyKkgAR4ALzCOJFh2fkNGSRY
	Wui23PuW9/8l33JEMzybcllyC0VUPRc72SJzFH8Gee+2O4GHOnMQBZJ1dRL6fANPvz2XUWD6vZ54B
	U26WaeqWb1Kf6+x4tklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYva-00FG3y-4d; Sun, 22 Jan 2023 11:54:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYvX-00FG1l-NI
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 11:54:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id z5so8469179wrt.6
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 03:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SufkmAjwbNPzx+QZI0to5Uf48TUW+IZPLNjbNqCZpfI=;
        b=agLJLLTVda4vzbo+pBm1nc5uVfx6hrGX4HQkgIojkD/1cyQqIJv/dW6ozQQZxh9acO
         0GIArSOuUVD0jo2VEYapOBIRUz5rU0ickudZecB/MxBJcXysLhAmHyMc4oBteDTIVZMP
         gWC6imLaRflwc3jb3Je1wClPZlQKNp6xyUYD3v0X33auCHxc+qD/ZA/jJBtt4IwIx7rF
         gSScl4TsJrIet9k0uAS97cSICY1543XxKH25XG+KtqbOQ1xwZB+O3y7k0SPxq0AYdW3y
         nsmpTPaZyS0wpbBSnQCu92eqyFbTR8SK3YHX60WCqpdfFl3mYAplQ0n+AxAh2HMkH8Q8
         TEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SufkmAjwbNPzx+QZI0to5Uf48TUW+IZPLNjbNqCZpfI=;
        b=Do8aG+K7N5NgLnqEl/qjYErzFCVwmOvsiiN+ycUHr7IFGKa1MYmb3gMa9Bj9bb9ARb
         I+nDfEY0nhE23ZQgznftOBkOJ/hokz1gY5uglmG5UJyQ314OlBV/s0d+HhF8Ws7jaNQm
         0jbOHzzaDjJVMyIGB4SjpOvYgsk7d5HRADMKQCmoU0J1uyV0By0knFlLeheIC1QzefxG
         85+sCbJC2TO4c8EhIP0C/E8M2Nm64cWLmZZ5VU1sKPejefPzRGwpcIq42rjWZrOIL6Du
         f7f3I+6sLZAg+BeKF/3fsgQrzdglKIJWP49o0zZwaY4C8qw6CX75Zuo45g0u5IaZdzI3
         WVlQ==
X-Gm-Message-State: AFqh2kqCKuk8Q5TE71uhvoVz4iZfJkmnwatHEMkbf4WFJTpuvW/5C/t5
	Wx0Wcw3dS86iqyhbLybGH+gCyA==
X-Google-Smtp-Source: AMrXdXt21M3CsHbnhN4nC75KtRaK9snE7H1KnN8u8SuCQjR3lZXo7Zes1x4/j1347YU7bM+ZYlALNg==
X-Received: by 2002:adf:e9d2:0:b0:2bd:e6f5:5122 with SMTP id l18-20020adfe9d2000000b002bde6f55122mr17418436wrn.65.1674388457426;
        Sun, 22 Jan 2023 03:54:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ba9-20020a0560001c0900b002b57bae7174sm2174746wrb.5.2023.01.22.03.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 03:54:16 -0800 (PST)
Message-ID: <f69adaf2-6582-c134-5671-4d6fd100fcf1@linaro.org>
Date: Sun, 22 Jan 2023 12:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 30/31] kvx: Add power controller driver
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
 <20230120141002.2442-31-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-31-ysionneau@kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_035423_786167_1A11B764 
X-CRM114-Status: GOOD (  15.39  )
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
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> The Power Controller (pwr-ctrl) control cores reset and wake-up
> procedure.


> +
> +static struct device_node * __init get_pwr_ctrl_node(void)
> +{
> +	const phandle *ph;
> +	struct device_node *cpu;
> +	struct device_node *node;
> +
> +	cpu = of_get_cpu_node(raw_smp_processor_id(), NULL);
> +	if (!cpu) {
> +		pr_err("Failed to get CPU node\n");
> +		return NULL;
> +	}
> +
> +	ph = of_get_property(cpu, "power-controller", NULL);
> +	if (!ph) {
> +		pr_err("Failed to get power-controller phandle\n");
> +		return NULL;
> +	}
> +
> +	node = of_find_node_by_phandle(be32_to_cpup(ph));
> +	if (!node) {
> +		pr_err("Failed to get power-controller node\n");
> +		return NULL;
> +	}
> +
> +	return node;
> +}
> +
> +int __init kvx_pwr_ctrl_probe(void)
> +{
> +	struct device_node *ctrl;
> +
> +	ctrl = get_pwr_ctrl_node();
> +	if (!ctrl) {
> +		pr_err("Failed to get power controller node\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!of_device_is_compatible(ctrl, "kalray,kvx-pwr-ctrl")) {
> +		pr_err("Failed to get power controller node\n");

No. Drivers go to drivers, not to arch directory. This should be a
proper driver instead of some fake stub doing its own driver matching.
You need to rework this.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
