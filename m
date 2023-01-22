Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0E3C25B4E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqxYFnvLOdst8eNj+29L8GXU0sq8AkksSwxJTS+Tqm0=; b=ysVHxqZEWFDq6N
	RBY1xWquRdZkwz8f31bu53ol3XoAygJwLbr6Ti3Fhi0Fslh1IflJRn183VrZNEiUSf+feVJ/UJc6Y
	HMG0K4prHpXe2O9k+502Xi9/O9KXmy5uazcoYfdANvCGTssHyFETSNXTeMGXwJwKRxGHGJJapjkQ3
	vmFIH+SXXwi9CJw/qOBjaqnNPdnkaB2qR65ADX4pdjB2/F7sxnxDBk5Fv8tGEf2Yz4ZmdTJ/Ar2VZ
	qWFza9Xw+OFLonWmuhBJMJHmit5yvMarJquM7CYG2u/m0XZ3qxSsVAafarFx+I20m5jvph5rG902h
	DjnYKRhoHlcblGn/yijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYyH-00FGSD-Os; Sun, 22 Jan 2023 11:57:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYyE-00FGR6-IV
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 11:57:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id b7so8484859wrt.3
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 03:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ckWviSxANZfcro+bBRfyc+cenkmtjOkiW7r6SzucWlg=;
        b=rVyqAJqcbEVO2mLYQVAhfnqaxyKeML/dcpxmRaA391AWy18uZOcTusGjMi44ncpTql
         vRUlbx31k3vofUNP4vsPJVAi8lmlvkVa9EF7D+g1STXssK/sO9udFfYn+8KZstXrK7qh
         xd8yLliT4+F15t5bWD1hE7T1GDf9FwKdq6LRDIE6AKZfPND9W8ihbB18IBlG77AI1lAD
         h2yHlmJaQeszTJT/hh3lV1J+dPT8wAe85E0VKkfG7d3OdVi0bTLkjAqcxHch+rOespJa
         a741p3AQgK6ZAVKTC3L2Wy3ECwJcIx3YubDD3GwhhX5WXjHjZWZq6eG8muWvlHTdzBqb
         Y8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckWviSxANZfcro+bBRfyc+cenkmtjOkiW7r6SzucWlg=;
        b=an/M3XJFayCGCGqMbYyFIDc6HG6QAuxzjA0T/Wd1aJVCrrdjJbp/kDCRtPE0jd86ie
         vAka8gtA4BQjUGWSK6IzA4+T8ulGAp4HfeXHC0axMJn5xsWgZ6JXC7iCjeVdNiQyFYb+
         vmLQ2y1Tq7GCCTuBavjTaDeb4qToQL3tghslFWdISp0y/uiE1q1+T+sBpOWMlA8ihU/C
         bUjRFmo/+JS5Z4i/71uZkEF72sFo2yNbuedg9yM2BEjj8SQ5VoPI6I3YDEp+n2gOwyIG
         k8kHekGz0S94PGmAi7TFqutBrtgXYpQc0jqpDFEDLaJbkRS/u0ZU4ZnGg6RpJ5srgT/V
         Hf9Q==
X-Gm-Message-State: AFqh2ko1cIFwgs5ZDg09b0Q0ugpwOJM/OaLLSIAOuOHL1qdnwv61HxIe
	ho5cLdZJZY/ITi/xx6VOTh0xpw==
X-Google-Smtp-Source: AMrXdXvUmSo3jcsu3xojfTukvrhpzxz6e7Xp9tLFomGzgShSJjiyaBJUGl7NNs6LSU7eztbkOMG0ag==
X-Received: by 2002:a5d:5224:0:b0:2bd:bbf7:1f87 with SMTP id i4-20020a5d5224000000b002bdbbf71f87mr20620225wra.60.1674388629088;
        Sun, 22 Jan 2023 03:57:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d16-20020adfef90000000b002b9b9445149sm3306165wro.54.2023.01.22.03.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 03:57:08 -0800 (PST)
Message-ID: <3043df6d-8cc1-6969-09d4-50ad6195c924@linaro.org>
Date: Sun, 22 Jan 2023 12:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 29/31] kvx: Add support for cpuinfo
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
 <20230120141002.2442-30-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-30-ysionneau@kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_035710_669039_ED4FA7CA 
X-CRM114-Status: GOOD (  12.48  )
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
> +static int __init setup_cpuinfo(void)
> +{
> +	int cpu;
> +	struct clk *clk;
> +	unsigned long cpu_freq = 1000000000;
> +	struct device_node *node = of_get_cpu_node(0, NULL);
> +
> +	clk = of_clk_get(node, 0);
> +	if (IS_ERR(clk)) {
> +		printk(KERN_WARNING
> +		       "Device tree missing CPU 'clock' parameter. Assuming frequency is 1GHZ");
> +		goto setup_cpu_freq;
> +	}
> +
> +	cpu_freq = clk_get_rate(clk);

What about cpufreq? I don't think this is useful.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
