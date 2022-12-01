Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E49BC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 11:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jm662ytgpeI4/T/a97U8VzykM8C4ERuMeKW0pjW6Aos=; b=DhPLEERCR2DuWi
	DVYUmyx/mbSp3x/dmfSCPVH6OA2dgMKSi9Up22kGedrV2JOa2XWUXDzYnpB72leObO7dEmzj1Tk97
	lkQL3fR0L1NbSCHAeDuHggsIjiLV0Qf5pZ/W8mekXbE6Fjxbq3vK6zCSckU/LJPIIL5+/bWWddT1z
	k19qMBJjy3w7nkICfZD9KZS4wOE0MBFQe9Su+GzrfyhMyZO3+OEBRKKsjIVHGGJQujJlUk0gOh1u9
	JGOJScVE04SrkSqnk2QCnI+cHnmTj0fq6ZLJ5NMqapCaHUUr5t8icuxZxZ9uET+iLCS9YAjtHaubw
	9dDqvld/VhwW952gHkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hLT-006uPR-Ta; Thu, 01 Dec 2022 11:03:11 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0hLR-006uOM-1E
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 11:03:10 +0000
Received: by mail-lf1-x132.google.com with SMTP id b3so1937751lfv.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 03:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xZPsJdX0DeKIWrtluUWX3HVvTrGo25QoDXGFCZw1PXk=;
        b=Iymxm2gwfFfqDxv99/Cvwgt5Tt86cvRAlbIcRFWVwq86La55pm/Wo85Vda8Abburiq
         +n3izNS6OKkWrKNxSR7d4nYTKkRisuxhy72xbJdZlPGyodm9rRlv79WAHcEZEQh5ODCF
         3bI2VKbSof5THgzSiG1M/osblrxsXxBEwbET9bJM1ToEZYibo54O/MKYhxPMwN2HTEMF
         xzxmqF6zfBPGlwF2GgpYW38omTN4zE/muv5xZer5SOacWpy09fPs11gsgRsHlzgKI4b6
         2CqKCMUboHskQm8xxv8fyveBOPHoYbQbYxdiFH/eY+rnKKTJ82CRWYT5YdyErzWM+iBc
         E1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xZPsJdX0DeKIWrtluUWX3HVvTrGo25QoDXGFCZw1PXk=;
        b=rCVUsVpBxg7CJYSNxDQP7zNykEssnJbHSN5TyxnEAFFdteBFwgxjRVxHSkbYmBaI3g
         tuZValYJ6jjxt5CLljb6HBqku4NBBKWgeH5eDvSIbBnUwtNQLi2hr5TgHNFLF2FhSF3p
         Zxh9Sz5JC2Lx6Ppgoml9vuT9YT7AaDKDpOjS3JIZpgKjdZoeDXnvJbfnUtUwNH24S+sw
         JTDfAz1/f1PieJP9gJyXxsEmv+Of1jb9E1n28lJJE4DAf8e6Yk/Qaw53Nupi6EJtnu47
         ieRpAvKH0KWGKZeZ7aBgH2zl0z3mj7aUqgHfWRIt8hWloyRrnaWp60qBJQIuLZh0gfyU
         QNtA==
X-Gm-Message-State: ANoB5pndT2jdbvBnjAvYiOXCeLKvNYg8zpk3+HNN8VVJ1mRzTk4kGErz
	9RuxFB1OkQv9G5K3u2kdQJCmKSLd/SFVI4H7
X-Google-Smtp-Source: AA0mqf4rvnW0TD1qNBxou5BIbgpN6sDqmoCi83kGXJ7IydthJadNC0OxxCFRj4tbainX/imKqFlpAQ==
X-Received: by 2002:a05:6512:3a8a:b0:4b5:4888:4362 with SMTP id q10-20020a0565123a8a00b004b548884362mr244955lfu.176.1669892585363;
        Thu, 01 Dec 2022 03:03:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j22-20020a056512399600b004b49025f96dsm610425lfu.187.2022.12.01.03.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 03:03:03 -0800 (PST)
Message-ID: <be603b02-9357-431f-0f5a-069659bd6ce5@linaro.org>
Date: Thu, 1 Dec 2022 12:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 4/9] dt-bindings: vendor-prefixes: add bouffalolab
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-5-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221127132448.4034-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_030309_102752_7ADEE506 
X-CRM114-Status: UNSURE (   9.59  )
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

On 27/11/2022 14:24, Jisheng Zhang wrote:
> In the following commits, we will support bl808 SoC which is from
> Bouffalo Lab Technology (Nanjing) Co., Ltd.
> 
> Add bouffalolab vendor prefix binding.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Wrong order of commits. You cannot start using something before adding
its description. This should be the first patch in the set.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
