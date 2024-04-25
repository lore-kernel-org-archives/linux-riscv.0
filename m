Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F522C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 05:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DcW12ui3UX4/9f7UIM7WiEeOJTn6bBaWMmvzrDU5UGc=; b=GMyOmLx5ZLa7bE
	EfjhXPzBeflwmI2FwL8YwyW31rz/ohOPUjANzdD9DxHf1lwSHQLYsWGe2jceMZzfYXyz9gGM3mB1r
	RrdS5xS5vF8RUN2b3Liu8JAPuetnOOyL7OsdApuheQQO3unQp6TeHU5Ew1X+qX95oduvr5T9+zgS+
	6VOfksv+3fe+hYxFZkDDdwWoTV48Y7nc3WdxyjuQzhgcAS5DIxKM1NnokrEd+WOb80V0ee9AqxTvA
	aXvLpfGncEvmYno6hTm7DHMqu4+vfmhhLkzhErORsk/55Y93pP1OtSjMAyJpuet4jVhjXJexUbxEA
	hYLVnr5StskQvMJ7Bxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzrSd-00000006zOj-25aU;
	Thu, 25 Apr 2024 05:15:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzrSa-00000006zNT-3WWn
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 05:15:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-41b3d2cbc90so3401345e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 22:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1714022148; x=1714626948; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rPwnOdBG2SaRdsMEeoWl+ELs4tjgPnIwN6XzuY1l5ZU=;
        b=mgL8rFzHrTVrfvz98eGP0zaqvoO++X7Jj+hpOy723Gl6QHJTO0zy336ICrWEEfhR9V
         jifyOdZCTyPK0pkiUrNmMVhqjcYG/Le5V9bXyjWun4GEwfKquS2X1FerrNFeu+9NOrUo
         xBoDQH8Fl7JLMPV2vMqKbRNoxLApl+tCur2K3Dkemy5MUpfBX1w80HchutJxXlxTBwM8
         Z1VqCyKy7tpsfG1/Qus1f5YOfTiCng9CE3Zn6KdZkPJCTduao95dZhGtXiGewwl59xG4
         vpD5Zncvqwu1whzSjZgJgWex/A1bfTK2DiMcWreRpt2ILRmaKS7NMnSB1WrBEM4+ZQBA
         XzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714022148; x=1714626948;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPwnOdBG2SaRdsMEeoWl+ELs4tjgPnIwN6XzuY1l5ZU=;
        b=P3S1hDtXKiSStj7JRzHSYDdHdGjvHSCLqLfrW0DMUtwaXeU2aAIJhHIAFFGInn++5P
         z0pNNTNz0V8FZnC6iyseqtZDNqLsDq4g3udpgWv0Sf/W9tkRI5ODB5HBDvdxdPvAPiOg
         wDjBhM6yKc++U/0d4VDUKW0COIl/B84E/jZTykfTiAwqQP3yoPPoetvqZvHOTYxI8B3e
         DmCTABzb0BUwgQHQsA6huBBJ91/Rncqk+bUUNbk6qmbHRw2bEdzcXvLrfxzyTGKtJRNc
         ZWoomIFeUQ9XkXfF8S8F7yGiTz7cuHQdPEb6irG3+RkejZ+w1HIyh2z0EE/ga9cecm36
         6c7g==
X-Gm-Message-State: AOJu0YztvgaLDiU5QDItxLaTfLfaxUKdUj8Qyf334+09Lcg9yZFoEp6L
	Vyw84xW2nUsPpHHYDnxeTRhaOzJMqoU8bQ2i57v41Q1SofHiyX/SKmxWVOwUni0=
X-Google-Smtp-Source: AGHT+IEeV6TDjrdXaQGoM3HJdzhpudTgWaxacCa4OufB47081/eSEaxVevEOehF0nvVymHPv9aCEUQ==
X-Received: by 2002:adf:f8c4:0:b0:34a:9afe:76f with SMTP id f4-20020adff8c4000000b0034a9afe076fmr2890742wrq.30.1714022148470;
        Wed, 24 Apr 2024 22:15:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b00418f7605249sm23885375wmq.24.2024.04.24.22.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 22:15:48 -0700 (PDT)
Message-ID: <067774d2-ad37-46ff-b90b-7a240473dd67@tuxon.dev>
Date: Thu, 25 Apr 2024 08:15:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clock, reset: microchip: move all mpfs reset code to
 the reset subsystem
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240424-strangle-sharpener-34755c5e6e3e@spud>
 <722f31da34e5e1cfef05fb966f6c8c96.sboyd@kernel.org>
 <20240424-glazing-handsaw-4c303fef4f7e@spud>
 <46c9baab4b3a834c27949b99668a9c30.sboyd@kernel.org>
 <20240424-gander-alibi-87f6e1896381@spud>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240424-gander-alibi-87f6e1896381@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_221553_024666_70883867 
X-CRM114-Status: GOOD (  10.36  )
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



On 25.04.2024 00:16, Conor Dooley wrote:
> On Wed, Apr 24, 2024 at 02:09:44PM -0700, Stephen Boyd wrote:
> 
>> Am I supposed to pick this patch up?
> 
> Eh, you'll probably save Claudiu a single patch PR if you do, there's
> nothing in the clk-microchip queue at the moment & I wasn't going to ask
> him to pick it up until you or Philipp were happy with it, given you two
> were the ones that suggested the change.
> I say go for it, 

Sounds good for me.

Thank you,
Claudiu Beznea

> unless you want me to respin for dev_get_platdata().
> 
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
