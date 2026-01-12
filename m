Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30FFCF45C4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 18:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fEEhoJuKTsbL6HnTswgzdUoTbwcQDiSAGEULOIqBDw=; b=Y67BJizdRy/hNR
	iaO1oi3T4VqA9FhijNED9A5qLd2NrDvUDb16KV/tIIMmsXmYWA3zRvagKZcb+wo57NcrLLRjKPLKq
	PdY8ZHkNitwpve/xnS4z6eOuYyKJ7xJDigiWMVrA+QnwYNaibrhMo+GkxlFcXUJnZnlgxEg2C8FnH
	ToNhH5q/pXZ1GTXB1ZPk/efEK8iVINEDtgcbhWQnDz9QHTj/JaT0XBd5wEq52X/Y8GQf7uUsKtkt3
	UiaAh4aZNSD7LLEdKX0nVFiTvXWirWSM9UXOnvM1TfunhzJSa7gdpbgY1DT9YshUIvZJ6eyRKrkKs
	s6zb1Di4wHD6+P1i74xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMed-00000005w3S-2K8y;
	Mon, 12 Jan 2026 18:28:39 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfMeb-00000005w2z-01KJ
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 18:28:38 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81c72659e6bso4050266b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 10:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768242515; x=1768847315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ww8dTKlL8svqCEt09b6zV77XCKA9IZGYTWQfhZDLVCg=;
        b=aZU31QDcwcItmTv006OYV51jYe+/fJycr1DUL0a49z6wJTlVOYPrfXSrE3XG/WG804
         GilG6IpQd9ORHGYTOlCYs0U14hQm3m9eK9xrIZwoY2W6MyFHv58Y4eQZY0ogVD9a0mkv
         CJTzOsD5UMl/7J44iiPgBsZq11emib7l/v4p0LQrDxFhepObo6J62U69/Clijc5N1Rn8
         JZJQ7qzWNcvgCh3dyLF65gkXR/MXH7HvVlTHm8NIaAROxrjmcO3nCxkZ+aBQltHi2TdX
         6ZuGNQ6bJ0ZkhWGMHrcmSptk4Ie/3YNb8zdjXyYvWMKAiKWesn+WA1sJAvr/iB2DfyKt
         mJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768242515; x=1768847315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ww8dTKlL8svqCEt09b6zV77XCKA9IZGYTWQfhZDLVCg=;
        b=R32GZDDK6RoVFH3w1wGQOabBNF/4rFAwdCNJtDjxUddrTUINbCYjuKrTUsdpWFygJQ
         EUoT6dB+lYRweD5/JW1SCNf+PCql8SD4HngBOqbLcd1hyFMwqSROE3sshvREG1GBSbtg
         guocQzBry/O73BANvH0ZB9RsT2I9e0MTZLUabPZuSAVJ6yaUx1iq/S4hpk4pTUJlA8N/
         7ys/ggr7AdzHcLAqCTySLPGQXNljPMGw+IBgmJ4EoyZLq/7PiqmUG1zfGwfYnyUkGXt0
         QfUrPu8Dz4eKinDH8LgX0ES6lSc67XGoECq/RZI6uiN/FSRuSebbaalowqLVE6XgnCQx
         9tOA==
X-Forwarded-Encrypted: i=1; AJvYcCW1TzM/y+0L3ojfRwmN1s9EvEeHpTms3ay9uMJ1zwFECNBZ5Q0RySCJsJ0CRikCyZrnliQh4evxGSIYlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVVxnyi+GCjfICh4xm8l8k3Ay0zIIxAw/mcZpIk0OMRr3DNDwy
	qbS7POpSX6DHvjxgwKjmBI9u4v6Btiwq7cR2qJgHLKuhxFaAbn66JWdz
X-Gm-Gg: AY/fxX6MtwYBC2KPjoVsnlV/l74I0nZuCElL5X17lW8a3HXX9IxeCSDlF5MSpMvH/KI
	pLFb/QX23df2CX+Gom9pmuPJq56BDmSHHbTbrbLqGCL40qT4SWrYJvkJtodefd/v8UY7thqxhVt
	mcgcK8zf0mEGK94aU9HbcsED76vTrn6E2Qo7wTODSfMRQLTzuimD3onC68epuLCDLA751mRw0ma
	xzLpMCzgWf+ph9xTrcUu3xLiTf78Cp+X1NtN0iwnZ6iKy42w6JQ50SUh34xhldsdlqWFKOkbZfQ
	u1F2KE6dNI+/yjkXAHqzG1L8gasem8SaEoVnUs77E0Ds00NPWgxY4o0bcS6VwOjp0d6qzbNGL/y
	Iq1VuGKSDb2gxDaQe/lLRo6EsxTtCQRfZdPBjh8vjQcnJluoytk9XAlXuxBLrhu5AYF+NC2hf8W
	xvZlberQtguHbASWI=
X-Google-Smtp-Source: AGHT+IFZO3R6LvzZZWvRh7XqITfngO5+nReNnVMEJVA3rCLts9qeDuKg3uj6KFcpivQl1tEiXHJ8jg==
X-Received: by 2002:a05:6a00:909d:b0:81f:4f74:2246 with SMTP id d2e1a72fcca58-81f4f742549mr4264740b3a.16.1768242515448;
        Mon, 12 Jan 2026 10:28:35 -0800 (PST)
Received: from [172.16.233.96] ([118.143.118.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6c8199f4sm6462596b3a.68.2026.01.12.10.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 10:28:34 -0800 (PST)
Message-ID: <b39e9af7-bdbf-4e02-ab7e-ec24626cada4@gmail.com>
Date: Mon, 12 Jan 2026 10:33:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv, bpf: Emit fence.i for BPF_NOSPEC
To: Lukas Gerlach <lukas.gerlach@cispa.de>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, tech-speculation-barriers@lists.riscv.org
Cc: bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 luke.r.nels@gmail.com, xi.wang@gmail.com, palmer@dabbelt.com,
 luis.gerhorst@fau.de, daniel.weber@cispa.de, marton.bognar@kuleuven.be,
 jo.vanbulck@kuleuven.be, michael.schwarz@cispa.de
References: <20251228173753.56767-1-lukas.gerlach@cispa.de>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20251228173753.56767-1-lukas.gerlach@cispa.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_102837_051626_68F76211 
X-CRM114-Status: UNSURE (   6.52  )
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

Hi Lukas,

Please also check out Ved's response from the Speculation Barrier TG:

https://lists.riscv.org/g/tech-speculation-barriers/message/21

I think the best way forward is to wait for the TG to clearly define
speculation barrier instructions, and use them for future cores. For
existing HW, emit a warning and do nothing. I don't want to see bpf
doing fence.i universally for all riscv. Neither do I like it guessing
this and that specific core implementation needing fence.i or not. We
simply don't know how each vendor design their cores. Let the vendor
tell us what's the best instruction to use for our existing HW. E.g.,
for JH7110, it's really U74 from Sifive, so we can ask them to fill-in
If we absolutely want fence.i as a best-effort kind of approach, then
I strongly suggest we make it opt-in. I'd imagine it'd be a very loud
noise if folks found the bpf perf on riscv suddenly regressed.

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
