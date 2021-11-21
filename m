Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C035C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Nov 2021 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJ6NHqgqViwFYMGA5Ns0XFVpzirvnEc45/gZuv0Jzn4=; b=0U1OMYt8H+JsuY
	+G9LA3N7D9PX1p78yxk0GlONbjdqoyTBv9AB8p/66UhPF11SZiWV/WzCQFRskFYbApYoTreLGS5dD
	giBPIPHFUEYw2sWZx3nsFv5vIV91H617WEYboTDXzb6GOf2SqozwEfEXXkAlQrPO6VUtFdyX0gNTD
	MbUQeGqonYwMDNys3Vqo6OeJpnU1VYZ2IDFyIrDTvaVY3uM1QWP6PuVcbzmgDgqYtY6Oz7um2IK15
	z+Xkyov9jFWx+ZiFFTQAmtikSadpbycB3scZGANSVknXU5lzcAJ4H9iJfyeUpSB6rBN4Sg59u+aau
	N0HWqTRMEa14gWc/3WYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moqaS-00E3Ga-JT; Sun, 21 Nov 2021 17:25:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moqaP-00E3G3-Ua
 for linux-riscv@lists.infradead.org; Sun, 21 Nov 2021 17:25:07 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id ADF793F1A9
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 17:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637515504;
 bh=kZq5pPsma0owINBv5hr75ENNQJHBAu3bptY+ZTWWILM=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=DkrOKqkCgqPe8G+3/RueiefdRcI3DazxJIdMq9Mzp/gnG6pYn/Jw5yaKlgkhaGPoh
 uwJEa9BCnP2x3W2QBGk/nq9mmpnZe5vvmehA9J2hAK36kCAAwt8C4SthKLO2BjKjR0
 KDWCZV5yDZyVH0dqiQKGLkvc+Bbn7TGaRAa5sKkI2vPTwDPkQVaVENV8jofE4TPevE
 bw8aOKSIhBmsztKfdJi5Q1eNcPtGuLtsR4D5gL82c482qUELrTOBx7SlZEOIrjlLzu
 yolUTEtOaW3yLFLNt8TD23yxNb118EL1LH39Eucj5wXL9aJi6ufBe30SZODQmu/EJb
 Tg2wr0JVurdmg==
Received: by mail-lf1-f70.google.com with SMTP id
 s18-20020ac25c52000000b004016bab6a12so10355865lfp.21
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 09:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kZq5pPsma0owINBv5hr75ENNQJHBAu3bptY+ZTWWILM=;
 b=qlf9BOhbcUB+HVNNu+2HmsZVbf6E3ICYZ3oLQDSDki069YWojiyzij7p8vh3NiomJp
 kEvron4joOXH03hpLIvrOjOTNLoNYcuZJBQ+zqHYfbeLmo54oJEEnEGgAKT2Sb55d8yy
 14l1QbUlYrayW5cD0rJAI0QmWU0uYZr0GV+6cmQYs7WzJC1322UJ+MKCqvbYiQek5cca
 ewKJjkKjLAa1TY0jMxnusy69mZ7cj1sPturwK/o6rR8bIhf+XGCjdwEPId0FpHWHCjOK
 hN1oe+qWGNFR6V28nMqnIqkNyNVByg+ARNI6Lg5OSjbjijINoVRSTVo1cNMoA8usfWVw
 JflA==
X-Gm-Message-State: AOAM533bzckkBEW7l4nhiFRm6a6L1PS9ha4NH/RYvwwQGgrID4h05/wF
 +YcwRFTzYURZHPnMSWq6NA5roJmXMP0Yu+0WeX6sCZRErHhGvrp+K7WDE544ljYTnvfzlMXi+ls
 hsIhE6YRvEcPOoqsOIa6adXKh9YEVirHLD+wFye6PapcOyA==
X-Received: by 2002:a05:651c:1548:: with SMTP id
 y8mr45618960ljp.458.1637515502995; 
 Sun, 21 Nov 2021 09:25:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2f8OnhQj9sQ62rbV2mdM7eBIr9lOMtV63HTcWuDmQo4H5u0BxfwIDpl7Rc0NkZyH5hM5VIw==
X-Received: by 2002:a05:651c:1548:: with SMTP id
 y8mr45618947ljp.458.1637515502822; 
 Sun, 21 Nov 2021 09:25:02 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 c1sm633211ljr.111.2021.11.21.09.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Nov 2021 09:25:02 -0800 (PST)
Message-ID: <3b627657-b2ed-13bd-f97e-363cc734da00@canonical.com>
Date: Sun, 21 Nov 2021 18:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 6/6] riscv: dts: sifive unmatched: Link the tmp451 with
 its power supply
Content-Language: en-US
To: Vincent Pelletier <plr.vincent@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
References: <378c64fb868b595430b0068a9af10fdbeceb8e12.1637362542.git.plr.vincent@gmail.com>
 <ab42d60d325249d805d99db1c3981dd1fe9422eb.1637362542.git.plr.vincent@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <ab42d60d325249d805d99db1c3981dd1fe9422eb.1637362542.git.plr.vincent@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_092506_151651_809850F5 
X-CRM114-Status: GOOD (  11.16  )
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

On 19/11/2021 23:55, Vincent Pelletier wrote:
> Fixes the following probe warning:
>   lm90 0-004c: Looking up vcc-supply from device tree
>   lm90 0-004c: Looking up vcc-supply property in node /soc/i2c@10030000/temperature-sensor@4c failed
>   lm90 0-004c: supply vcc not found, using dummy regulator
> 
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> 
> ---
> Changes since v2:
> - Fix end-of-commit-message separator so change lists do not end up in them.
> Changes since v1:
> - Remove trailing "." on subject line.
> - Added a commit description.
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
>  1 file changed, 1 insertion(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
