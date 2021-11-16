Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D78C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 10:37:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B69E263217
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 10:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B69E263217
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blm5/T1P1LIqug6Ci1KRjP+7Q3/G4FA66xrjitNLXuI=; b=HR+o7YCCojWulB
	G7yzxNCLh75xb6ZHDShCagwnQp/Fxop4bcr5EaQP+FdlyRtDXVs34Rsy9nvSR05V/VH1oTkAuDDv4
	iWg43eaotQ445jPmlhWdDcINi/T366pcG7ZybSImzbTY1RjKSYFWC3ifC691AiRBP/kIbqOCmic1W
	wMxIWsyGdQMyXfmJ3kZjFevzAIvbxE8giVND4JeEzyqvVFovYDGPRxqAiFIFNf8dGh8tV7j3Yg+GT
	Llt+uz4YfrLftNKOeZU98/hd9a3LamqHCamNfzXa4JCQdyXrNDhjXhmvYZYl5un+ng6XEqXHFQIrW
	d+eKizF9RH/yfw4P4chA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvqG-001EOj-UM; Tue, 16 Nov 2021 10:37:33 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvpl-001EFy-Rx
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 10:37:03 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 91CF63F1A5
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 10:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637059020;
 bh=Rs8pRAwylSdVZbUXUVB02RWUHaE1gIerW6xLTR92IXQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=RcVR/YuRr7BZlfllK18uvvUlqsjunJKnG08LryAyj5oO0S4kNDQ8DgXhffvHKGo2Z
 Lc5RAj0GbarzYTt3x7brSHTzR5pdr+5AQDy3Bd7RHEQxtqs4IHXEev4o9gHEFWpKNm
 iNUkWb6FmMQm/2hUCLCcSo3BcgeWIs66h9QUenrX7sVZBwDkxrIjqAiQKP0M/qULlU
 Ej7PrjtIAXwwWvCCkHja53+TV+5cgFKEQGj0IF4wYP7vh8O3UygtAugO7Eo5JHxyRF
 UTe6zfoYLp7jqxoFU2hZsUEXnLeEc9u3XP4rGXeDGk3nm2jUw/6GFLKLmKMhMdHs3h
 VRHJo8ReLu/IQ==
Received: by mail-lf1-f69.google.com with SMTP id
 i1-20020a056512318100b003ffd4e89eb9so7970278lfe.19
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 02:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rs8pRAwylSdVZbUXUVB02RWUHaE1gIerW6xLTR92IXQ=;
 b=mtRaLW1H7/YWsZS4h11zjrl2t4ukqd5DjYGmiMIXit3t3PTKKqGPU1RYM1cH4BGwjt
 HibNQM9Eq0wbq1T79j4Ma8ATn+YAP4lOsQHxXwnrIS+y11Gcd50uUQiYBwUzyiAX3rMD
 Gs1CjPWYEoHMfxZtQmVGL5lWkMYNdeoZwFwHqGdoE6jkmff9pK2Ta4oiHA5HgFHjImrB
 bsl6wm9Ckj47AjDSboShe9qBDFLXXysAz0T05UrfkdoUNdl/BHHQzXz+XFJEBA1/hbmq
 7avfloB5ax1UCYKrpEngjvxi7EyhFLKAEeCfkfTJ7bXVexApDFnG3kbpdT4Itgf+iRPu
 OahA==
X-Gm-Message-State: AOAM5323f+KNRaJFlBtfBGH19lOfn5tkaBA5r8bblToILKoVtV6Hy7FH
 924JEJgcm/3HLGZbLxA+btExc0tFC3G/M016IvfqcuPK/5sZRGB0bDzEz5S7bhbdbKuL0J0had2
 LPO7gIqeEhb6AyUshxz7Wy7C8OP6LXh0yxbpqVmkqVmxSzw==
X-Received: by 2002:a2e:8e38:: with SMTP id r24mr5827485ljk.450.1637059020005; 
 Tue, 16 Nov 2021 02:37:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwI5ZHM+AIMN6ts+F4NnPm2rE+VPGifbLdwRRS/m4kJ8bR1uXC0Zpc1MJ201Ku2BEErQMkUVQ==
X-Received: by 2002:a2e:8e38:: with SMTP id r24mr5827458ljk.450.1637059019797; 
 Tue, 16 Nov 2021 02:36:59 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 d19sm1722714lfv.74.2021.11.16.02.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 02:36:59 -0800 (PST)
Message-ID: <7f5f11a0-44bf-17ee-379b-b6cf1103bf8b@canonical.com>
Date: Tue, 16 Nov 2021 11:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Name gpio lines.
Content-Language: en-US
To: Vincent Pelletier <plr.vincent@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_023702_089267_49E789A8 
X-CRM114-Status: GOOD (  11.57  )
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

On 16/11/2021 01:52, Vincent Pelletier wrote:
> Follow the pin descriptions given in the version 3 of the board schematics.
> 
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Please do not end the subject line with a dot.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
