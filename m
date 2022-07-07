Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA0BC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvB94/W2nsdK7fX1de9JVJr91icjqdmE3oBAl3gnVHw=; b=SfGEUQw5mq49Xk
	1eoSzkAkih8oFtpt+S10XnP/XiZR3fPYB2Aw1puMOJ9vgQSk75xvvWfOYk7oVuKGm1N1NvdwnswQE
	ZDjbWPeDk1L+t1XBom1MBz6HcKI9DxE/6Zu1HRFMLPgDhYuxD6tkN3JitaL57iE/D6nI2OstEC/2R
	mWwrCJcrvrJNFnh1r7GfQoVDsdFv9njaALU/WXdbWkmj1yMEu0x4lkt0nQwWUCqp8QJ+F7oJ1N+m0
	Uka/6gF4tHuqGBCCU3vXdvd5E46vV9s/zaXJvcP12r/dCmeFRN1iTBJNQXpEK6dB1EfEggSCYWrXB
	mcll+FroYtfisXCJpGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9S74-00GPHX-By; Thu, 07 Jul 2022 14:04:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9S72-00GPG9-30
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 14:04:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id t17-20020a1c7711000000b003a0434b0af7so10799488wmi.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 07:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=jEk7NQXnrRcwYUUJ7a7WbG8rsOi2ymPcZ84wetxtqz0=;
        b=AOWvIcbSWkXTHu2AyWWwMx0Pcw9RfA0RIOMce0F6xF6TWRm+4arX8XHMnUQ1BDsrND
         uji0RSPNHvFYEYbbsLOcsIOfnFGVx2zMm/ypEOAtp4/Z9i4tVIXPoY1daT73KwPJVSsb
         SF/uGsXEYDl1kb9O+mHm2zyGS+fDNJQg2iqdT/zO3yD63ffwrnN5oGKs0yXlfGxlnSIu
         xLhiZZcZPbNw2Xvb0UKq/I50jszmSrD5n4PCPROVHv8k5qqqZBXguXUcijEzYe+Ur4M5
         2A3/A2rStZHOk3vY+heAGPCqamUWuK5XAaJGZKkQmoMA6wAIpNWSqL+OAX83Q9tJ5wqb
         knkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=jEk7NQXnrRcwYUUJ7a7WbG8rsOi2ymPcZ84wetxtqz0=;
        b=fsVQKSiEZwDAVPivsiwJAbXyCZxjGoyR07KWDlkN2NUTBcYrrQYMS5l0noY0m8HMCx
         3QUueWINIRwvgsY+c63Wipu7YHaC7XYraIVsNr3UeSLE4ojOoFTU0qvAxtFxUUqZmaaj
         80eLsHQ9PNWp0onwnxQtdbRzFc2EFn1q1t877n2076RtZ1LuYqXghCiQ6p9VhTOF23+T
         LM0s3L2CmDcDUWR7MaWDX9tIWJJILzt1lQTgFIob+B+eJC0AYzfbUnr6Clx670EJUgVb
         dfCWSTpleTpsZTd6yqEuNz4Q1fD5ZrnqjBHaP4VHWGuetYI1H3AQtZA8p+l6S0TIA7fM
         lwKQ==
X-Gm-Message-State: AJIora8vp+e3j2PUx+WL9M6P3Gg0VL6oyKng616R/jMSM1dyJ34KIhsi
	Mk7A2QXzYWqSbeZiXj31ls4=
X-Google-Smtp-Source: AGRyM1ufjsg/wTW3PHpDdJTz6e2emaA2g04EF1PgS0QMd/gU63XDp1oe2Z/NS8DgwtI15WHr6GXYtw==
X-Received: by 2002:a05:600c:354d:b0:3a0:5847:9a1 with SMTP id i13-20020a05600c354d00b003a0584709a1mr4561497wmq.142.1657202648588;
        Thu, 07 Jul 2022 07:04:08 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:613:1800:e04b:ee8c:3bc3:648e? (2a01cb0406131800e04bee8c3bc3648e.ipv6.abo.wanadoo.fr. [2a01:cb04:613:1800:e04b:ee8c:3bc3:648e])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003a199ed4f44sm19990769wmq.27.2022.07.07.07.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:04:08 -0700 (PDT)
Message-ID: <ee708c61-474a-ce89-3e8d-4c2e0bee30e4@gmail.com>
Date: Thu, 7 Jul 2022 16:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: dlan@gentoo.org
Cc: andrii@kernel.org, aou@eecs.berkeley.edu, ast@kernel.org,
 bjorn@kernel.org, bpf@vger.kernel.org, chenhengqi@outlook.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, kafai@fb.com,
 kpsingh@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, songliubraving@fb.com, yhs@fb.com
References: <20220706140204.47926-1-dlan@gentoo.org>
Subject: Re: [PATCH] riscv, libbpf: use a0 for RC register
Content-Language: en-US
From: Amjad Ouled-Ameur <ouledameur.amjad@gmail.com>
In-Reply-To: <20220706140204.47926-1-dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_070412_198851_12ADCE85 
X-CRM114-Status: UNSURE (   4.28  )
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

Acked-by: Amjad OULED-AMEUR <ouledameur.amjad@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
