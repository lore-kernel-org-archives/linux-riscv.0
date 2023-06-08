Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE62BC7EE25
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 18:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFrIaQnZV0GLT+UBzSL5msQW2fI3OUTuyGlOdirP8YI=; b=1649BjCoGeFqHC
	apQy70La8M0/LL1Tv0WTc0IhR+8KwcjHBzGsX6SxPwAd1VfLyDcJJ1bKI/GU/59u4G1qjN8J/G1UT
	YHHhlJayLLOCKQc6HkuIvmfopUJBU4cEKsNkx5dasmobELl4JEpqqDTlEe/GtbAHt4ICWI1BxWIBz
	6Qq6ItYACRhuNLQucMqUBz0tpWv3fVCQuepvxZpw2FcPE3BgfBD+yfCoDkkZutI/3q3SYIaZ5b6Yt
	C7R1VU3m7Xsc39Y+bgrPcDj7tnx64cAgy98zphWiy8amBBkqATLsDh+57+mtnyct2V7XsLU7D1dRe
	THgmjLYAazaXeQxc0ESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Klv-00ADmu-2U;
	Thu, 08 Jun 2023 18:54:11 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Klr-00ADiX-0y
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 18:54:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-651e298be3fso926126b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 11:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686250440; x=1688842440;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fJEHFi97DlbjmCUi9KJ74Rwm7pWeUSTdC5PB7cfCM4=;
        b=EoG2H7AxXXooNLAjrSxKqHnNGdrPa6YAxcOyK9Mn0Xm4mKDG8T+aHYaB0PZrmUkQGC
         t3Z5SbYWDYLEVkfJnPmL6qGXXgU2TNc2S6DitaYcaOn5zc1DuWGhvV5cmBj2I90aVPPE
         K27vKR1T2dJ/FR3aiiS4zF3FzxcpW7s2yig8vdN44eseE70dCfL8h6pd7Na5rUTp1EbC
         5v6aP8SOb2N27R166/EO0ntvoSVHINTwoFprmmXubwUen0+juEa36jhngnANtjSkf7YX
         RUXq7ZhO/yRTpRctQUIYHovnHXbBah7t7KKuO//zOlfCrVZZeiVtsl9vz8tlmtgpbfyl
         EUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686250440; x=1688842440;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fJEHFi97DlbjmCUi9KJ74Rwm7pWeUSTdC5PB7cfCM4=;
        b=KVWn9vV9a0lPx0vMMRRBmuT0MB0jkKM9TRquchJXRGa9kaeEFTJr7Vr8FvaVYmSjf6
         uIecC6g6B9zSQrYvx3BCPMEk3uJeBgyzCSKeODDmziAYKjfZwMirEUtww/02WehjhVoN
         Ieym6MO3Yjki/Ucmsxhfy8f1HQkYSt4n42+CCCYlyVBzKw59COFu+hjvvc5n9xWHqnqY
         TVojAYSBiagAgGSDTjt8g4A9lxzXbUbH6qvjTkq+vgtSlY70O758xeNWeksAfhhd+QZf
         1sm3mXD5u0vfnICL+ByTqmgcLLvI96wzBdRY5UaSR10bCUNK8m6S+tcr9QOgCM4jMvKd
         hbpQ==
X-Gm-Message-State: AC+VfDwrQK0EZzH5IXfaOKd6qDf4HT2pr2vTldvujiYBme+IYaG+kbRw
	25w4lLalwtWRXgVi31I/iUm6OA==
X-Google-Smtp-Source: ACHHUZ6qOJ2APMDbRsU8BHeHOmULCkvsbeS3GA8+hyX5g4Fxgp48D1t8zMsAuTJKR14dbFoJ3Jgz7Q==
X-Received: by 2002:a05:6a20:4429:b0:111:97f:6d9d with SMTP id ce41-20020a056a20442900b00111097f6d9dmr9156712pzb.62.1686250440273;
        Thu, 08 Jun 2023 11:54:00 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id c14-20020aa7880e000000b0063d46ec5777sm1394121pfo.158.2023.06.08.11.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 11:53:59 -0700 (PDT)
In-Reply-To: <20230504072910.3742842-1-ruanjinjie@huawei.com>
References: <20230504072910.3742842-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH v3] riscv: fix kprobe __user string arg print fault
 issue
Message-Id: <168625043497.19063.14436590324361967786.b4-ty@rivosinc.com>
Date: Thu, 08 Jun 2023 11:53:54 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Ruan Jinjie <ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_115407_339603_61D33338 
X-CRM114-Status: UNSURE (   6.01  )
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


On Thu, 04 May 2023 15:29:10 +0800, Ruan Jinjie wrote:
> On riscv qemu platform, when add kprobe event on do_sys_open() to show
> filename string arg, it just print fault as follow:
> 
> echo 'p:myprobe do_sys_open dfd=$arg1 filename=+0($arg2):string flags=$arg3
> mode=$arg4' > kprobe_events
> 
> bash-166     [000] ...1.   360.195367: myprobe: (do_sys_open+0x0/0x84)
> dfd=0xffffffffffffff9c filename=(fault) flags=0x8241 mode=0x1b6
> 
> [...]

Applied, thanks!

[1/1] riscv: fix kprobe __user string arg print fault issue
      https://git.kernel.org/palmer/c/99a670b2069c

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
