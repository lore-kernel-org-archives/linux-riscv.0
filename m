Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED3DCD6E4A
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 08:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwDu3mLxlBczLJqemRDYSZxYHW69ovb11xYue7JBgPY=; b=aUlJ42JkSLoPdk
	D9PAclS5axrx3tiMLbbWtZNnY+GDFVExHIzWC/0RnR6CmCf4k874oXh1tTP5HJHMur9mnflAbKzuA
	x5UubV+lhX+8aX0i7Ga93bzlHDd3neCQ9se0Il4RfRnVEYYArqbqViLIybNzWTm1/RQ/w2iXilLcM
	4S6vwpMvJ2x8NRZuynIEQxBc5SgRcp6uaC/aLzcX7LrI6E+enslvAULF5giLuhDUoK8xIMwGvQ9iP
	2KIdc1a9zSsBWO80a+utftov1m1pbCXMJ/T5KSUJ/BJEqL+FdyC63aBXiSKFY8sjc6UryeK+B/ty4
	TcO5gmty046APGvTxfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTF2m-00000008XdT-2Du6;
	Sat, 30 May 2026 08:27:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTF2j-00000008Xcv-388J
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 08:27:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4905529b933so62604475e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 01:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780129659; x=1780734459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qddz/zxZpUl2T8fFl77Vhtb+HfEDnwtpIpBzWfm1IYU=;
        b=frf7pzPbKZEkREMcTZQTfeF/gG4064OlPF5ODWlv72b9AU6D08WpLRy1/iY+5lKcBI
         kyAMrlDSXtPi1X2Exm6ag4sVCEIt2UYT5RbO7WrSLbyBdDJELyqu6SGsq9slIE+OdH3v
         cPruounxezK9yaJLkMG2PjeY3Rfpynug+BSOTia8SQc1aTwgHQrTp/26H9r6oBxlfs9z
         l1nDrqQyv0LkjtMvV8G6HiXDj5Dcycq6flpbaoTLMRoCpLS3FJuaz8Q+SpFEJaRSGcc6
         88aoSTd5fm+8J5PtLgMay5QUbd2eSYBcOhi2mJGdfgyPLwSlhh24/Hfd/Huon5hxg4oX
         HJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780129659; x=1780734459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qddz/zxZpUl2T8fFl77Vhtb+HfEDnwtpIpBzWfm1IYU=;
        b=Ibj0nnU14KIkQ0kGW0lYTXzYC4+FmgsdsfDbyTUSCbTFA+jaWgtEYVatoYBkye9OZ4
         K1iICsRectdYpxHqW9pNVufCBuL+YLrVoxXad/5setzR6nx38U0pekwHuM1yNJoATbKF
         nT8OUQYEEmGRW7CK/UgSuLniG2NLlHgb/EJAetGE6pwT3p/+x4nRCCbG2SO7ArgI1ZRT
         NDeu5DhUevpIl8xEgT/btQEcoiQNGKqf8M5d6LnEPNrbE/FdpP6DP4+4Is+yuhvQmFgC
         lUKnbKS7ZZVZrGIRCjOM5YA4E9+RlWI8UiAnWnuOJOWObh3kis6KQIbvD8dNnyZTvrRU
         n6Bw==
X-Forwarded-Encrypted: i=1; AFNElJ8WtW+TUSSIWkU4UVWIA3L+PBPtKg7+8VdDRrDOEsHfRpxYb1psW0lbolQwlsMR8C1VRii7/9rvDFRWKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyStOgmeekpG3PX1K/WpVrnNFOp0bcv7l011ctK+n1s5URN6qPt
	mVcl9Jp17+7M5L0S5LoAblb1Scm4Su2TM1kjDJl1l5pwS/4fwkmRzrwt
X-Gm-Gg: Acq92OGWxBN7pWzyt0Y4dl4I7y/OMdPjMJ/tCkWtiw5SoGylmo3jQZ/kJ5cRosGC3qp
	R1fYLSXYMpfTi2Jl6sLt3fGLPgwDyUfIM8DqBQ0f/DhE7ymfMVXrUtwA9TAxgY+j1JZGRbHZ1Bw
	Jm5SXn/GRNtZijnQJslHLyq5qn+VK6o1RQ8AZ03/k2JLUn7kmLIEYFb3z5LeeBU8oQ7QBdmr7a6
	zjkdkX97eD5iyg3S99g+Q5clmaWOf9vBVpSLpM58Exr3SXjphG0IdX4OSqg5odayO7FlnrXddFD
	M8r1KgA7bqEE+n7wJW5JU0CZpOTw56A+HnbS9+73u8UTlkcEJhRipwFXSTxO3P1OlzVKhb44MhS
	DBTjGd97KZjrLlQ1CrsY6oEF+rgQrFFFQgZIkBSzEhaeDvaGxoHLwMeT4jeJDJSCmoAxQ66vjtW
	t5kacgTwlJHVAV+QEzL9k1vkp9ak06bES96XwzndRs8AaW9S8nv8Apb9Gm+51WQFtL8SgS4TDzu
	g==
X-Received: by 2002:a05:600c:c3c1:20b0:490:9d1b:2022 with SMTP id 5b1f17b1804b1-490a2938ad2mr37014665e9.13.1780129658899;
        Sat, 30 May 2026 01:27:38 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-131-96.net-htp.de. [89.182.131.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0498e0sm42526475e9.0.2026.05.30.01.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 01:27:38 -0700 (PDT)
Message-ID: <1dc5141e-b43e-43ab-a2d5-a04069352941@gmail.com>
Date: Sat, 30 May 2026 10:27:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable PMIC on OrangePi R2S
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dlan@kernel.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, spacemit@lists.linux.dev
References: <20260520100000.575719-1-amadeus@jmu.edu.cn>
 <20260530021021.1167953-1-amadeus@jmu.edu.cn>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260530021021.1167953-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_012741_818120_C30DF90F 
X-CRM114-Status: UNSURE (   9.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Chukun,

On 30.05.26 4:10 AM, Chukun Pan wrote:
> Hi,
> 
>> Enable the i2c8 interface and add the connected SpacemiT P1 PMIC and
>> its associated regulators to support voltage regulation on the board.
> 
> friendly ping

nice to see how all the k1 dts files are progressing ;)

Looking at the two opi ones some bits are still missing:

rv2:
- i2c8 alias
- i2c2 + eeprom + onie,tlv-layout + alias

r2s:
- sys-led
- i2c2 + eeprom + onie,tlv-layout + alias
- pcie
- qspi + spi-nor + vendor partition layout

You seems to own both, do you plan to work on that?

Best regards,
Andre

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
