Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8FFC77B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 31 May 2023 06:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ge4xUo1QQ0LHbqInNikdKrm6exa5IdbGYvZxEZuqC30=; b=XTjmlfTqeKiFCj
	zM//zP6zXWR21aK07rYncwFDEznX0HgG22Duo0uMjy66bCUYOI6+Qv/J7jrkKgdjh8iTRLHN8J5mf
	rvjS+T9HSdeXDF8yVZMVUhLSmCBXpnQw/CbTDPbXdAc+O00xJwrYwY7UjbLb91IptJrwsxubXclnY
	4GRugQqnw1O+4+WBMabgxJXzXakDXDPLbZK31UtdidvwHP16WV64oNToyISsWGlqjq141kCPHQHpf
	RDh6ULzNPitCVbRvUrfoveMkytF60vfNCfgWDJaFdz9ltMOdiQYL8Vaol1LmOEg1AWewQ2tL6Hp+/
	k/Rr7jZv5KD2/sMNsn8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4FgD-00GLFK-06;
	Wed, 31 May 2023 06:51:33 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4FgA-00GLE0-2U
	for linux-riscv@lists.infradead.org;
	Wed, 31 May 2023 06:51:32 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96f683e8855so768875466b.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 23:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685515889; x=1688107889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j8KIRkSeQpAAw2eR4yzI5lu3pYKOIqBElBCoG4tj2Oo=;
        b=QffMaphaCoZ9MsLlJH4EYBJfwdueijKDixcU+L4mAd16ePYDj0K5aB4E+PgA/s9Mzp
         lSJonPXOH8QCQHTTrHZbytT3t9Wv2XsAxdhFQKkRzLZhe/KB4KfwBzClynOcLPSdo2c1
         Y1hjwnCON7+/bNk7ME5Q8Ka+n7IUT+ARV8MrH8g6JZHFIZCnZ7+/mCu5x48ohbyQ+JuE
         DEgb2uuU/K2Z/mUFiz/ghvaTG8DwZMv5cvaQST7IyYMCFH+uPErFkZmxUddEeuJGmq4M
         SyTKhva1ZjnWqm62IlQeTaV5tj1Vo+NQ+/OZayWr4yGZQNEBo0sNhAooxpFfX9peBgX0
         5vWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685515889; x=1688107889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8KIRkSeQpAAw2eR4yzI5lu3pYKOIqBElBCoG4tj2Oo=;
        b=UsMnVFPYXLjcca3sFTTGNEsp8E2XSvtpdiLqBqvTtc9jRqqm4ub/pbyA6dcsL8HcBT
         wpwKB45bT7IDd3oQ5smLQw1J16pH6MwpuSe9O7fhwm8RVP/YYJ/yD7bqj+18zNPM4LRh
         3Q4MQv/mR3Nwi60jZUyXMc04d6G7YJrRw/lgvQn+qCiciL6SW8MF6H0bUjnbtCU2pUcj
         rxkiJRDOskd3vwCYL6DaX3SJ32aQVmBzaiNEuhnU1qRjL+3bE/hU00XL58pl1Otfj81E
         bkNg3Mt6rKt+G0zPylNrDiRzx/F3D+xdIn8FkvxiEP1wGLktOGnO+alSkz5zzp5ublx9
         5jNw==
X-Gm-Message-State: AC+VfDwDUY7bROLuWuv9pmseUkbTjWdsHBCqGI5JRefSuKdV2cl/DTjy
	HCV3UBaZJmOXboJidpV+yFuKzQ==
X-Google-Smtp-Source: ACHHUZ41+Df1JF3rXv8WCdc5cE6mupu5PE4dFHFEEKvM7CJGANm6pLKrWAUKpgejEfJB4tpS9+W3aQ==
X-Received: by 2002:a17:907:7291:b0:96f:4ee4:10d4 with SMTP id dt17-20020a170907729100b0096f4ee410d4mr4511643ejc.43.1685515888922;
        Tue, 30 May 2023 23:51:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090648cc00b00965e9a23f2bsm8410703ejt.134.2023.05.30.23.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 23:51:28 -0700 (PDT)
Message-ID: <ed4c3564-4083-5568-f999-cfd7f02544a7@linaro.org>
Date: Wed, 31 May 2023 08:51:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org
Cc: conor@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, olof@lixom.net, palmer@dabbelt.com,
 robh+dt@kernel.org, arnd@arndb.de
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
 <ZHbpb98Yn7SDZ4XZ@debian.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZHbpb98Yn7SDZ4XZ@debian.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_235130_836692_3ED0579B 
X-CRM114-Status: GOOD (  12.77  )
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

On 31/05/2023 08:30, Bagas Sanjaya wrote:
>> +appropriate time later.  Most importantly, any incompatible changes should be
>> +clearly pointed out in the patch description and pull request, along with the
>> +expected impact on existing users, such as bootloaders or other operating
>> +systems.
>> +
>> +Driver Branch Dependencies
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +A common problem is synchronizing changes between device drivers and devicetree
>> +files, even if a change is compatible in both directions, this may require
>> +coordinating how the changes get merged through different maintainer trees.
>> +
>> +Usually the branch that includes a driver change will also include the
>> +corresponding change to the devicetree binding description, to ensure they are
>> +in fact compatible.  This means that the devicetree branch can end up causing
>> +warnings in the "make dtbs_check" step.  If a devicetree change depends on
>> +missing additions to a header file in include/dt-bindings/, it will fail the
>> +"make dtbs" step and not get merged.
> 
> Sounds like passing `make dtbs` is a merging requirement.

And why shouldn't be?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
