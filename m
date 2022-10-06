Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D49EC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 19:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FT//O03WfmhfW98SNAuoWNacUaij3tLx0D6SoC2JaCA=; b=QEduJivAWFI6e2ZtQQ+2BcS0KV
	rhyN0tB6/bmqvf5GoMBQSj7ohxRaxb+wiNTSs/prImOtnaskw+hmAkS0G4GAbA93NZgrN74WRGQW7
	jFQAowrPU9K7LG9r7ch9+0WGTIagNfg8n0gfmcDPqJq3S3H1Bxf2XT/2Pu19mCxUmJQF3+X/oj5fK
	7jZJJ8lSKnKZfOfCH5iIwApdZDGzsWq9StDnVfPS9/ljb1UsiDEpodz84PCGq6kTWteeDoJW8EmBk
	dojjmT99gytMv501RrStIDTD89TkLUSTlIPmpbpxlEanNPWRMLNPHuI8fxUrQYC3lZUJ8Q1gh9IwC
	hgtRPqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWzU-004sXy-Tx; Thu, 06 Oct 2022 19:57:08 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWzR-004sV3-Nv
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 19:57:06 +0000
Received: by mail-ej1-x62c.google.com with SMTP id 13so6977195ejn.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=FzDBQgeenYz98cMigSKdVu7xeQpatYn3iou13ef5DUM=;
        b=VK9CAsOqjh9sIFKGJF8ui25fWqXCpV6Y9ZF3OpPhWdITMwBm5KWkWMpJY8rX8nJeLi
         YxxiZJ3BPivOL1vv9rNw3kqx2fPcP7fdimyXQpO6Ulmsm4ImjspLs5nfuym5CyH/t2cK
         u+yL6sPfkLlW8zV3piUhjbEDhlw1s881msYUSGDPbz3v8Vl1pcMN6Xcg6GQQztBeNdDu
         95+0gTM+1Q92XjNNa7u3zuMONUlUY5INhruV9rpgEy25aqgA7j8zvRunsacngys6dgiP
         UMDy11PcyYp4CkwlV4LEYIqK50JmCss2c+wAZPDRvHXXPa0Oz/hhoSKl88nHVyBu3ZJC
         rEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=FzDBQgeenYz98cMigSKdVu7xeQpatYn3iou13ef5DUM=;
        b=kzqC11gBhKaCrZXBtBNmZODstbg2Rx1bmGQOXytZFgc2FY6FZrXoT3TQoZBGrrSSgJ
         5sW/A2QKqqz7RXN2xSC+v3B3k+qJlkgsBZXA36zOzLPy6NGx5QD1kIuBwmyesq/vwPdz
         ocUZ0dblbYgeEED5aOVcd8WCAx6nMx+mapK/zuJvfPhzgBjb8sQGVIkiRAd9bDMAhoJI
         r5tBS65XPsD2Z6PdlT4FV2BrWDEz1wSZNjQy2kohowsYH0CdWQt+ANQ4fnQgsnNy9/hW
         aPoqDTiRLabUnZbEy7eoszKDcP6H4Kubh4r2RAEhK/CxBiVbQoS1TbFn3tdlzOsq/EZA
         C2LQ==
X-Gm-Message-State: ACrzQf1cRwAVV3+asS79NYfBnqGOkK4CCfyVfsTXC6THlBzarmaycKbt
	TBMvnstebEh8WYLBIx88uT0=
X-Google-Smtp-Source: AMsMyM6Nvl2ShN7zvVJrfRyUXbpjNK/pIFJJssOc6Ye3kZWSIEbGfj5pGB1b2wNuH2Nhbu2lImlIkQ==
X-Received: by 2002:a17:906:fe46:b0:730:ca2b:cb7b with SMTP id wz6-20020a170906fe4600b00730ca2bcb7bmr1261622ejb.703.1665086222249;
        Thu, 06 Oct 2022 12:57:02 -0700 (PDT)
Received: from [192.168.0.100] ([46.219.3.46])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906949500b0077f5e96129fsm122802ejx.158.2022.10.06.12.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 12:57:01 -0700 (PDT)
Message-ID: <20282242-5cad-42be-ce6c-834b0e7ef269@gmail.com>
Date: Thu, 6 Oct 2022 22:55:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: conor@kernel.org
Cc: PH7PR14MB559464DBDD310E755F5B21E8CEDC9@ph7pr14mb5594.namprd14.prod.outlook.com,
 c141028@gmail.com, coelacanthus@outlook.com, dramforever@live.com,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, xc-tan@outlook.com
References: <Yz8r71PjHlpLy+kR@spud>
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
Content-Language: en-US
From: Eva Kotova <nyandarknessgirl@gmail.com>
In-Reply-To: <Yz8r71PjHlpLy+kR@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_125705_819401_8B493B4C 
X-CRM114-Status: UNSURE (   4.92  )
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
Reply-To: Yz8r71PjHlpLy+kR@spud
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Patch "[PATCH v4 2/2] riscv: Allow PROT_WRITE-only mmap()" applied 
cleanly over 5.19, fixed issues with OpenJDK.

I assume this is not yet merged into linux-next, because problem 
persists there, hope this gets merged soon.

Thanks,
Eva


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
