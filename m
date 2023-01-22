Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C07C25B4E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKxL9+fE7RU/4WlfA3a5y8YDLk8Aj8ixX617e4TUSaQ=; b=sIKwH8omKlN5Bm
	LsTpq+b9i518WTyQGuTdhCsm4AQsYE1xL8lumF+JvEAET/Gd+q+J8hjczUC31kD2JVbNjXd0BZFh9
	hVKnyG1CHjpK+e5cDQA69u0zzKG5imgGdOptKgbtesOUcIjdgnZqdwnZFDGg34LwXnGWnfb9B5W+b
	vmQEqLc075syZwv0Fhhq06XphgDjbUqBZxO4020g1dS9wj62HOGEuOO6iFmcqlUpTt8KdMHs2Uc4H
	yl4xx920F7AmXHkByme8lXx2fnh7yWXCk/TCAfWIucMcPF3jUZupCXu9D1/Jfz5YKu4Aa3q1JNfXQ
	2e8ZfUHjY1J2ZJxQioWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYsz-00FFe7-AO; Sun, 22 Jan 2023 11:51:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYsv-00FFcI-LQ
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 11:51:43 +0000
Received: by mail-wr1-x433.google.com with SMTP id r9so8467616wrw.4
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 03:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QW4gcfTBDAxCEJmp81ra89ieKaIa7EaBAPXtJreoq+w=;
        b=P/0Gb1PCZZIXYu0NV1Ove+/unx34oDiuMeeBcuZho836SMBMbqREXW49kGJekeeYeP
         fzP+MyKIYe2eiBQ7rukcC1sC5RGH0lkRTyftvfk7x8nkdmK2b31SghHLBEmZzx4NBpCj
         ggDUwzAEC9l9h8CA8lfbAlDSU5T0XYkDKHhlfhfERi9QxU9HQhyxryOH1cbFhtWNtsiP
         k2z2Kh4W04yGAltLW5C0VK+2W2aIXIipP3jMn0F9n1UToYwxL/bNIkx8LTwm1LCYrHf+
         MFUwUoTz9F7H8+vCFHV6UacV3C7BlRYLfN5vIHptYZ9r+5wxB7SAjdxVuc7IX5uB+nMX
         QP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QW4gcfTBDAxCEJmp81ra89ieKaIa7EaBAPXtJreoq+w=;
        b=OpPwXCaf8MiL02HtE8+81pkX8qO4OCfAqYlD7rJ5iLhZyIDxuQwU3EsEQjXZkiRp4j
         uaLPOiihMR/q3ieUc43rSOzKkpJcAZ/OrL2nlLRZ/PCHByo0AmiPPPIfEDW1UTQM1M+w
         WGkYE6CGHTdMxjm1MRwntugjLpbDncgAUoPh2v+sYDhMpQWMV8Fg6wEZp914cenTT33N
         FIrbVtsZxwkChOSeeKLC/2IYIk7Kti0s7e4SKSaAS+hGjI35CpQVq/78JrM/TkrtGUEx
         35jYQK9dztUUcBN5goH2lD05ELm7dtns1ZOqD7N1AR9OMbaAJoNGo0pH8I44ojs9jxjG
         m1ZA==
X-Gm-Message-State: AFqh2krOL9STjyX1T9MmMbdbeZneeAK0VfQ03uELza51XvS6kSaUlN/u
	zfw7FJeBFzXeFiZZC4qtH3Stgg==
X-Google-Smtp-Source: AMrXdXu3komgmJz3v4UQ6DFMLR2KXaq2N92Bqckcvh43HhbdmlU07p0tmzT8+sQ+olcM02A9d6D9gA==
X-Received: by 2002:adf:f501:0:b0:2ba:dce5:ee28 with SMTP id q1-20020adff501000000b002badce5ee28mr17537961wro.18.1674388299288;
        Sun, 22 Jan 2023 03:51:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d6787000000b0025e86026866sm3554309wru.0.2023.01.22.03.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 03:51:38 -0800 (PST)
Message-ID: <d02b81ab-fa72-6005-79e9-249225483364@linaro.org>
Date: Sun, 22 Jan 2023 12:51:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 07/31] Documentation: Add binding for
 kalray,kv3-1-pwr-ctrl
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
 <20230120141002.2442-8-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-8-ysionneau@kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_035141_729188_B6631272 
X-CRM114-Status: GOOD (  17.30  )
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

On 20/01/2023 15:09, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Add documentation for `kalray,kv3-1-pwr-ctrl` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray/kalray,kv3-1-pwr-ctrl.yaml         | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml

All the usual comments plus - wrong directory. Power controllers go to
respective power directory.

> 
> diff --git a/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml b/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml
> new file mode 100644
> index 000000000000..968674bb0c63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/kalray/kalray,kv3-1-pwr-ctrl.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/kalray/kalray,kv3-1-pwr-ctrl#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kalray cluster Power Controller (pwr-ctrl)
> +
> +description: |
> +  The Power Controller (pwr-ctrl) control cores reset and wake-up procedure.
> +
> +properties:
> +  compatible:
> +    const: kalray,kv3-1-pwr-ctrl
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    pwr_ctrl: power-controller@a40000 {
> +        compatible = "kalray,kv3-1-pwr-ctrl";
> +        reg = <0x00 0xa40000 0x00 0x4158>;

I really doubt that you tested it... Examples are not run with address
cells 2.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
