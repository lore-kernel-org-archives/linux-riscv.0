Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2FCC25B4E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0WpFfSmAoyqlK+5uU4pf+Th94wqF+6gQfedTbLdUr0=; b=NPRlrh+p5H/KQ9
	XDjvKI8RCVr2TDkZR5JQ9jga/m4S65IR/YxRFkPgccDTo1Po06IzIF4Lq07JTxz0fl5AUUbBDLyE2
	mSB6x4ArPRy4dXytav8sQrxMPwk8Fde2dl64o9DNmydtLElHRzVh6C8Tr86nRX2Ktml1sTX3wP4yn
	P6JR68H5RN2FR396mqmyIoNXrj34acPFfxwg+ZcU9LeIT8I3o9llBRnImpcbfDp02wSh886AXVwgD
	JCnJ4OT7pfqaGU3gQtxwZ0J66B+VHwycerhjIStLesQvq/Av2UOsm7WoLQm3YKh9PJ5S11WU/pPJ3
	opJaOXHxXMcCeJZnp3xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYrj-00FFTw-QQ; Sun, 22 Jan 2023 11:50:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYrh-00FFSk-13
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 11:50:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so6678343wmq.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 03:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0EpkB2BBdVigwr5Td9P+HmXwToYi435KgLDWMOa4EE8=;
        b=g350tC/bvusAYh/X3+8GDAjg5idkp9I5MV0amVsIN+5wug1msuq8w/VaT+8oH/vGyA
         4GKFOPjFL6Ac2+9nSGiuNg6F8TtWQEHJ6j2E5oNAoHWpKeFa1UQ52Rxbmr+yB+CK9A2v
         PTOsLCIlrvzztSp1ssFX2TTRMIrIVBnISwsh6HZjXrtQyQyVs2P92QfGFSnTIXIUcjPM
         Vg1+Ns354Zd7kGDqMhGBeyFnPVa4Q9LqfUuI2Jp7Oi/kHDY2YnyL8OuqO0vtgvny/AML
         EGNTAES6cDIR7Eocc01jfD3eD28k5YFfFC7FgvglqRRNifg67r929gnlJe0i4Hh3guqd
         JJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EpkB2BBdVigwr5Td9P+HmXwToYi435KgLDWMOa4EE8=;
        b=jrfqd8tnfRnxJDKadWNcyJ7xPMcUQC6ZPaVTcsheApxz2YIbpsTnNLlBe4GhtL/nJ7
         T1iVh4WcuG2R/qal53rt8nVKBrAUWSX9MzNJSeMy+WdwKdx0K/mLRvzP7T+8hPNta+n1
         SWjKu4Et41CvfC4Ft30o8TgUioHsBA0h7nAAhSk2C0cDL+meEGQpg8z5sKQQcC8Ej9IV
         WUQomLbF6l9tBsRp+OHg3lEm7bSBp+j6+iCK+OFnJrlooeeYuo1wApm/K48uNM+iqKAR
         mSH+sRK6NKg1otv/CJZQX0YIwEVLvEgAjIMphwm5NF52aEFqFFFC/nWOM46TWmDPFi04
         CHBg==
X-Gm-Message-State: AFqh2kqB8DEHnxT2P4mvWsQlFCCDxnZxcCxPQOKX3z4kIWfgLjBDVuLU
	tO19elhK1wag+taZHYQ4u2BkEw==
X-Google-Smtp-Source: AMrXdXvaWQ3NiM1uiaHGSPzJg1g++T4pemcHh7xrDRxj9Aer0pOjcC8iWTUXjRv5iTAL5OdTQdwkyw==
X-Received: by 2002:a05:600c:2284:b0:3d3:5c21:dd9d with SMTP id 4-20020a05600c228400b003d35c21dd9dmr20563566wmf.19.1674388222395;
        Sun, 22 Jan 2023 03:50:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c40-20020a05600c4a2800b003db16770bc5sm7460685wmp.6.2023.01.22.03.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 03:50:21 -0800 (PST)
Message-ID: <57fa51fd-fd3a-f08e-d3de-06a24d1b6ea1@linaro.org>
Date: Sun, 22 Jan 2023 12:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 06/31] Documentation: Add binding for
 kalray,kv3-1-ipi-ctrl
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
 <20230120141002.2442-7-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-7-ysionneau@kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_035025_121972_C9E465F1 
X-CRM114-Status: GOOD (  12.11  )
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
> Add documentation for `kalray,kv3-1-ipi-ctrl` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray/kalray,kv3-1-ipi-ctrl.yaml         | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml

Wrong directory. Interrupt controllers go to respective subsystem directory.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
