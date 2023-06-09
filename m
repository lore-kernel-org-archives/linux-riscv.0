Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEF8C7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 15:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnEN/hq5TgeyFl3lAq/2piF7+9RQ8IhAQxmSHqLHXz0=; b=J9bRchhMrPT3Cr
	v1pRuxnIofEQwSuqljPN1D9XloEefb98+obbETu63EkoIyNwPzUH3a7yTAzD5mFUP1LhazUjPVljw
	aUkjSC+v6jSRmTNnjcJZyAJZIs+WVbrAyxv1i8+XlNX+DbR28J/MsBK22ehWg62R3Enm0RmBBgpit
	ivZXEamLSGZCcoiI7RzORsoF/v0puwdqpYGAeIc5oLUopZdLmlnla6QJ9shA5uleTV2Yc6/vV1hbg
	BmhnJIdFeSl7mWVPDRjZBEJAJyswqN2uBbFkL/S+e+YbdQuYQtt9V6COyiSA4xqnx/+GTKfXI57bq
	gyAtZSLHcIYk0uoICHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dcv-00DMwR-2H;
	Fri, 09 Jun 2023 15:02:09 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dct-00DMv7-0g
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 15:02:08 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9745c5fed21so282963466b.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jun 2023 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322924; x=1688914924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IaYLdbl/TZHSk2cPY368IzUkxBaN/snAx/dMMgmk2Rg=;
        b=vzheymtmwpwZIbuSILAc2zsNTPEl5DYzgBmnh/ZVozn/aeDp6tpVRPOeaMjulkEeB6
         fnf2eO+/mmhFl2JkN9AWPEYwupg38t8+UPt5/Y8ipIPti07srn5O+uXQSYz+aD6KUdy3
         FRn6ZH+QRsqaynb2l7GGly/98z9QL296yJ+QijHC7gTHx87Znxt6M4eOHfHPzmxeD5uW
         gsVOvh8/xP5TBUHSPjNxY3EDfP+On/RLhyw/7z4SJlBuppcF7ZiW7a0zRxifNUYKsfVv
         s8sr1SiAV9c/1IHFh6s3ROjRyVDN8ecwQoyQdjSJCM7CxK0aiM1madm2mrAjRJerDxqb
         tT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322924; x=1688914924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IaYLdbl/TZHSk2cPY368IzUkxBaN/snAx/dMMgmk2Rg=;
        b=irIJf8xAOmFEItFn72asQW0nx7nVXlxRTcEJjUPRYH8qrqxC0/CiGZPPy/eYUwOdV8
         lST4kuTzZEUlkux/ZBsgiVmpmdAYVzBuUGtp/PPixRL/AbnBkcPp6pdyBxnR2NKGAvUg
         MsHMzEZCTWyksddvvo3LKP5ykCzg79GKev73V6w0sj22Lq7zTZOlFbcVzfeJPI0orv5q
         t/GZHJ/oEgsmWaM1LApBr2LaBCCVUBDl654bC2aeXDMdJvJLL7sh8LctYRRpxwj7b/bx
         LBjXtldLD+yY6x5kuFLzBiCZS6+R17DvpaxVAKMwLbb1dnQsjgmvhEQQt9KAZv+4oCLI
         4LQQ==
X-Gm-Message-State: AC+VfDyoFudoOzHGTnKBbs0ff0cZLHXd1Vwbgx+550rK0BY+jdVAOKpG
	9hfgBVA54gMr3Tv3nPeCad+HQQ==
X-Google-Smtp-Source: ACHHUZ5okxNKnU1pVg+ODHtWvUPjavwqyyL9RFD4S7ut04uQTkmZ0QlpMnrEvvhAED9oZdn7xjGCSg==
X-Received: by 2002:a17:907:3f82:b0:97a:e496:c121 with SMTP id hr2-20020a1709073f8200b0097ae496c121mr1262183ejc.69.1686322923812;
        Fri, 09 Jun 2023 08:02:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id h21-20020a1709063c1500b00978937e9dcdsm1382300ejg.42.2023.06.09.08.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:02:03 -0700 (PDT)
Message-ID: <51ca8020-f1f1-f0cc-7e2c-f3c6ef675484@linaro.org>
Date: Fri, 9 Jun 2023 17:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] dt-bindings: riscv: cpus: drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230609140706.64623-1-krzysztof.kozlowski@linaro.org>
 <CAL_Jsq+5oZdHi6B-R1YUEwSOc8x8Vd9sHt1bgp5ydM_hAQJE3w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_Jsq+5oZdHi6B-R1YUEwSOc8x8Vd9sHt1bgp5ydM_hAQJE3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_080207_266269_9FD74DF6 
X-CRM114-Status: GOOD (  11.60  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDkvMDYvMjAyMyAxNjozNCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJpLCBKdW4gOSwg
MjAyMyBhdCA4OjA34oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraQo+IDxrcnp5c3p0b2Yua296bG93
c2tpQGxpbmFyby5vcmc+IHdyb3RlOgo+Pgo+PiBDbGVhbnVwIGJpbmRpbmdzIGRyb3BwaW5nIHVu
bmVlZGVkIHF1b3Rlcy4gT25jZSBhbGwgdGhlc2UgYXJlIGZpeGVkLAo+PiBjaGVja2luZyBmb3Ig
dGhpcyBjYW4gYmUgZW5hYmxlZCBpbiB5YW1sbGludC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+PiAtLS0K
Pj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgfCA2
ICsrKy0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiAKPiBOb3RlIHRoYXQgSSBhbHJlYWR5IGhhdmUgdGhlIHdob2xlIHRyZWUgZG9uZS4gSnVz
dCBub3QgYWxsIHNwbGl0IHVwLgo+IAo+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgoKVGhpcyB3YXMgb24gbGF0ZXN0IG5leHQsIHNvIEkgYXNzdW1lZCBhbGwgeW91ciBw
YXRjaGVzIGFyZSBhbHJlYWR5IHRoZXJlCmFuZCBmZXcgb2YgdGhlbSBhcmUgbWlzc2luZy4KCkJl
c3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
