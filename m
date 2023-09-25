Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58447CE7AB1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KecoMs7TX8ajhI3/sXLmsNJQMm6jNDJ5DJ9/rn5qfrg=; b=vY4IiKLt9mi+sm
	Yt+r+H2rROsswpgm7WNM0CjwWUSnN8+WZmf4zVazsRj8ZSpTbc6GhRWOVZ+jEX5iE074t6Nob2seg
	WWcIxVn7xJHtpO6DKOKU+Cex2DicuRYzS/bg/CDrN75QwhreOrOHCihQyLfSacEZw9DxvBaoHRJc/
	eY+8zHR0vi8n7EDn3e+DwOZKvpwveSp1i4EsjNxuabhhL2J++kTpyLyaNGLe7uH2egoGQovtgBnL6
	dxhNVr71OvN61AG9dS1yxOo/3tnyohUqY8JqLP2Llc92Nhy7jcvQ/VvDBBItjU4JidRUuK2u45XWp
	BSDojeJ42qNymgl+PvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkpY1-00ElSQ-02;
	Mon, 25 Sep 2023 17:39:05 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkpXy-00ElRp-2D
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 17:39:03 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-65afba4cfadso23006536d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695663541; x=1696268341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hTbKVRUtifK600GcTuB6H5T7Hq7nQwjgpsYUbwhLkRs=;
        b=SVKNeCBO+b/r33IkGmB4PU54U5c/A0QWmwGMuUgDaqtZOZiLRu+CGr3x2nEkv+yoz4
         RcPHdcimnER0WcrWu1eBrwQXuJWBVhjHA4y5M0VdrfWo7lYVz1i1zU0dWZRGWgtCuDET
         uvQTQ5Pu3AdHuGL8OdGVgbWt1bdsgFZsoDjmLdJso+Tp/6WmgFD/uCPF/JEQU7Ssjfmh
         XWNnmHa9oWfnqOPFE9QQziPysDdST/xiNRuIWiMr58z9j6SZVK1xEZw/MLdwJbPfIiYK
         SoHZArhc2I1DgpSKZFKoeVRZD/MsttKpj9JQBDIeXW3TwA0kLLTLKk36PDTWxU0IczZ2
         nnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695663541; x=1696268341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTbKVRUtifK600GcTuB6H5T7Hq7nQwjgpsYUbwhLkRs=;
        b=nP86G+NglhL9f3qM3VDf10iqnx0X6ai6JVjidDHZmGj+ZkDerz4kd8U3UOE785XfT2
         H4yptbl0b3W48BkqLC/zvG/FtwcCZPROSnCRNbHLe80h8NG5JTc8kQbWXa9Lm7sp5FmJ
         T32EwyBBNhLS1g3jdNMIhrqY3vAwVIXFdmxkIJ/WbSk74N162wSVMgzfA2NyXg/A0fBd
         H4cRfIvrVCem1TVTuzyyJW6d4TodxtybO4oAwD6mcu9TJZSGVgY4PDbDmYg7Iym8Rc9X
         4zJ5lIhR3hW5P24kRqutCgGOiwU8JuR71yL3x1S8IFYZy0e0+zbymPqyENNpXc0+1RgE
         AtNQ==
X-Gm-Message-State: AOJu0YynmIFtsfQ3EjMi0eBOfD7AMJJ2YVa/kBN7eK9DtavIZt7Gfq/K
	ySGfBSelQIUuxtjwnxI7oDssKA==
X-Google-Smtp-Source: AGHT+IG+tSQcs5F1udgePekSyNFg4nS/3ON6TuwwuW4o4BqlQE4HXLo3X3tpbTYJLPBv/LJ1Cwr8Wg==
X-Received: by 2002:a05:6214:4307:b0:647:22cc:1784 with SMTP id oe7-20020a056214430700b0064722cc1784mr8149193qvb.15.1695663540981;
        Mon, 25 Sep 2023 10:39:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:75e1:d26a:c179:14a3? ([2600:1700:2000:b002:75e1:d26a:c179:14a3])
        by smtp.gmail.com with ESMTPSA id ph7-20020a0562144a4700b00655ebd053dcsm3167034qvb.82.2023.09.25.10.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 10:39:00 -0700 (PDT)
Message-ID: <a43ef21e-ce26-45ee-be28-526238e3e88f@sifive.com>
Date: Mon, 25 Sep 2023 12:38:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/6] riscv: dts: sifive: convert isa detection to new
 properties
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Chen Wang <unicorn_wang@outlook.com>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
References: <20230922081351.30239-2-conor@kernel.org>
 <20230922081351.30239-4-conor@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230922081351.30239-4-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_103902_750870_52CD3F44 
X-CRM114-Status: UNSURE (   8.93  )
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

On 2023-09-22 3:13 AM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert the fu540 and fu740 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 15 +++++++++++++++
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 15 +++++++++++++++
>  2 files changed, 30 insertions(+)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
