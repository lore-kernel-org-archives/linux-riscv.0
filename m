Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D79C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 16:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4DF610E6
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 16:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A4DF610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zVXj67G2vQL8c3TGI2TgtaT8S2QU/SzeNdFLsKIOlXk=; b=vE6ertePvpapFj7hS8wwoLabxP
	3BurQkjbAq32AqIs2hkt+cbdYTVYRgKTaIpG6otKvFb/e589crNa015QvS704QISYNSK2EoHgQqFX
	V5DxMBKBbSx1sQKQyyrfW4InR6go4flVjoFeiGIUMb40Z2IEZxm7cBQiEsaROzPpKzh1O9WX6WP5P
	lJIQ1JlcSbLfWE3Aq2qxUcbKfDBYzOsCT82V8eWWNuRUCsrKyw2LNiGMxbomQtSit76AwY/mBi0ff
	k9E+Ns+mloJnxtE/3Y+7pR6M0emdN2kZ86g0FiDiimP//I9GCX+8zPjrfghU6K7UP3lsB/iXaPlus
	Sy//kIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGknh-008w3q-RM; Thu, 19 Aug 2021 16:21:53 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGknd-008w2Y-5L
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 16:21:53 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id B75C8411CB
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 16:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629390107;
 bh=+cZtuR9o2k87pvi0rgBoRi8/bFI7YeJU/qox3v5ZI5U=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=TnGoL60l6+xHV2u2QYgrhlcDga3uUlfW3nSfJY4N0dFtvmlPq0DIy+BdXKWGqr76w
 sfkXI3ySjRtABEQ4fGDJWXxK2AItk+1i2rnn7jEPhzBevRw15eyPUXMTRytZoTfEg5
 +Sx3W00FyMkZGEju+29T60AW27x+m2keMkDyQCBsH9KdG6cOr5EEa8yeeCSyKlI3Jw
 m9Cmra8DxF2aAyZCJdrU7Je+c/eWkjOHYrOgzNrlsWwV63MFmORFGk7MdNhTySqY2A
 QQc+fj+8U27HuW2wdmwkr2cOVdM0s6NdIhjpUKuVJ/RDo8d+O0SZ4wDzbqNvHO5zMe
 wav8AzC9TpSRg==
Received: by mail-ej1-f72.google.com with SMTP id
 o7-20020a170906288700b005bb05cb6e25so2457513ejd.23
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 09:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+cZtuR9o2k87pvi0rgBoRi8/bFI7YeJU/qox3v5ZI5U=;
 b=pPCVq1XdvnkKE3ByEFBsN1/kJKaNEW44ZypaUjZyKjU3slAgB7c2Gcf65j5iXjNhO0
 6Xh0neTCd1oh0NwZOe2wVv6DSD71d29n9UJiRzsKGGI8pDXvlkQvSa9A7dmiY5L2tNum
 lLSBDKiFWaTF67gxdGYrbAqEAG5UfJPXxwzALksBH4O5A58v18VPgq2npaeeQKN/A0qL
 CBWCO+A88Fbsfx3F0D8VQkf8aiSo5NnrY7XIf26mrYn92WLegeR6JoJzNmwMGPR8LUPY
 JixVQW/HQtzCi9zrrVPQhz+W/1FYLVYy+I5Be9aCUFSUxihL/hZhi+h0yrh4R8HDLGZI
 NePg==
X-Gm-Message-State: AOAM533t9kIFeYyHD1gPYPmRt+NEWntEhPkn2r1GDGTMU7qhEM43a1ot
 n7SGZ6mHb0ys+8BGAQQhnNbGXe2BlQKeJjCXzCoX6iei4CVaouikIqVjghaIGlHduxRaCGoUHov
 zimp61kmDUz04SWEDxiG52mipTkNdRvh8Hk51vOyhNKg2nw==
X-Received: by 2002:a17:906:87c2:: with SMTP id
 zb2mr16503213ejb.322.1629390106277; 
 Thu, 19 Aug 2021 09:21:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuaQqSj/y3QMWrvKAdgV8r7CJmiTSZ6zuwkSNkqhhy0AKGNuqM3cQONHkLBZcKm5Sw3vridg==
X-Received: by 2002:a17:906:87c2:: with SMTP id
 zb2mr16503202ejb.322.1629390106161; 
 Thu, 19 Aug 2021 09:21:46 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id j11sm1478832ejy.112.2021.08.19.09.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 09:21:45 -0700 (PDT)
Subject: Re: [PATCH 3/6] riscv: microchip: mpfs: drop duplicated nodes
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
 <20210819154436.117798-3-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4d0d6290-8341-56d8-7902-5a8c36bc7bb5@canonical.com>
Date: Thu, 19 Aug 2021 18:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819154436.117798-3-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_092149_387173_C8AF741E 
X-CRM114-Status: GOOD (  12.82  )
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

On 19/08/2021 17:44, Krzysztof Kozlowski wrote:
> The DTSI file defines soc node and address/size cells, so there is no
> point in duplicating it in DTS file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 5 -----
>  1 file changed, 5 deletions(-)
> 

Now I wonder whether the subject prefix should be "riscv: dts:
microchip:" instead?


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
