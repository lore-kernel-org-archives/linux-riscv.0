Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66180C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBPL+NIsnB8rAdgSyKtOsN8oigSz4VVemOZUKiCN300=; b=OOqv4ktRo5EEvs
	c5tSxrpOQGFhMa3pG7x5czNu1sdi049etWpUyk4EqthCTsmYRHL3V/NGoE/GHgiatIZKsUCrIYE0e
	AWqRcEDTFMfh/0gy4tVCApb09PKxggVc54bw1Vb7ElEedVdSmZ9766tHNPcwAnJ/ugsClioJIoJVt
	JTx/ju02XSiWOXCaJfQt8Uy6U2JxTQV2dJYGXX/en9AVK0HMVGBQvmDB23jUGJ0iGA3/D7I6fkqD9
	8T05WopT34bj6FNzl4Qzewi2SEjuCXZhSNw4A9AGzxfXZIusG72KOsx72Amo7K6n3lvSSq61GwRhm
	rXDrchY11hRkj8xRONrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXvt-009oe2-Dm; Fri, 26 Nov 2021 09:54:17 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXue-009nzl-Ak
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:53:01 +0000
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 120A84000A
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637920379;
 bh=Rk34jEXKQhoSDB2KTAe8ZDdW7Vi0P4kVsQnJWBFuqbw=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=qHJZXguyh8fqjyruOcvC7+S0j1kJUYUqs9swPKrRfyFwkDeboR7mWSqJqAq2rcjgG
 Q2yqWjLx4iuBx+n3yvhaFzCschrhPBxoiWFtDeaB7GWYCZj468wz/4g/9QqOySnbVr
 u/66uH6BXajis5KL5+N5kFuNZdmLR23iTjgDqNoriL+Xa0jt8AievlrXRy3hTXGw2l
 staGxCLSmRHXk85A5BK9I2A4l7Y2yhGyhSiv2oFgS+6MmRec2UAPMZUCq2MsQF4K0I
 nTmCjBT8h8nwmsa3YehO+eofbCgYAzU+ZLnjHp0qh32D9O+wSIgfmcDAoVgRTmqc7L
 M3qI/MPmKFSIw==
Received: by mail-lj1-f199.google.com with SMTP id
 p21-20020a2e9ad5000000b00219ee503efeso2978144ljj.14
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rk34jEXKQhoSDB2KTAe8ZDdW7Vi0P4kVsQnJWBFuqbw=;
 b=FjW7CDiwDAH+z1ySzYvsp4HIftLxGVLss3PnLY2eQ12RxvrCGpKV294XlL16BX9gnm
 8fDsf/Cou5jmtpfSDZCOAqCwqWKP+/vVX2QsN9MdmQB+sjFEGKubD0zccsgQljJnk4Z0
 olgfxSLUdgYa+QNqEpVleiHjDOOfNv0z15KBGuqnopCFcj9BFtUfpwjUuUnhn8SJM1gA
 3/JICdpKS6DUmMrhAiX7aJNwhfWaD3iEcAXW8ryYoSKvlXdoyMfuMd87i5yZNeOCqeAC
 nRzngUoaVBDzWy4XGOLtXskHZ//88o8YP90UpbtQaZCmZO4oq8mNmCR3EiZpEcJk20II
 8reA==
X-Gm-Message-State: AOAM5338uGvp1xMugG1LkVUKrsHLAUMgvJetLBmx/NPd+inhUU66yPS+
 AgHs1tlqw9VXwj23AzMap0FsvZr+9LaV6pQQWsLnzV76AUZuZ4mZASl7Dvb+shbIsBVbJjXo3nE
 4n5cVO5i68p4Fxea7xnk0pCLsYN2bOErcVwIJo84Ja21RAw==
X-Received: by 2002:a05:6512:3e0c:: with SMTP id
 i12mr28026720lfv.121.1637920377564; 
 Fri, 26 Nov 2021 01:52:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynBnI4C4Rtk/4gi52BCMnUZO7KrwsYMMmAzjwq3DuH746SZA1MbEXQ7YACcy/dxO8Ghca/rA==
X-Received: by 2002:a05:6512:3e0c:: with SMTP id
 i12mr28026694lfv.121.1637920377375; 
 Fri, 26 Nov 2021 01:52:57 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 k15sm468248lfe.15.2021.11.26.01.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:52:57 -0800 (PST)
Message-ID: <715ff4c8-69e5-dba3-7d32-95172c5b616f@canonical.com>
Date: Fri, 26 Nov 2021 10:52:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 4/9] riscv: dts: microchip: Group tuples in interrupt
 properties
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-5-geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125153131.163533-5-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_015300_572738_2D4CDCB4 
X-CRM114-Status: GOOD (  11.92  )
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

On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in the various properties containing interrupt specifiers should be
> grouped.
> 
> Fix this by grouping the tuples of "interrupts" and
> "interrupts-extended" properties using angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
