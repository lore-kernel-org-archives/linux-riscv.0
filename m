Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCABFC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 07:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/XXwi0mRqhuQBVOVuvzYlwq4EZwgoiV2Oxbyv5zvig=; b=mgP/BQkxwmXq2z
	TFZ4ESXQeXk1f1oIiUvX3IDqrjsUNopha5qYVpKXCsV9IAbkXB6kPAdNa6d3Dat8W+Y6YW7B+zk81
	20m0OLEl4z00v6Fyik5GoHrIBQTaPsxa0wBkSQiYof44iV1M4qnupb5/X/vZeJQQd/+Ob8d78OxqF
	7O2hwRTr0HCEv7kE50BClfNI0uilHB0YvHwyfxq8+5QHAOiuXSbqeT6DMBocnY/8PuAElarZoJ+83
	NMqJWdWZm9II/1gauJg+THDkj0434e7lFcjYyINoDlO75S1N7qq8emhaxD4z/4Rh8calPRSqEPevH
	LzhPN3/kTeSf5XxGmsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pplUZ-00A0ts-0w;
	Fri, 21 Apr 2023 07:47:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pplUW-00A0se-2l
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 07:47:38 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-63b73203e0aso12502371b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 00:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682063255; x=1684655255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+szQLnykesBFXcAq23XEggqpIQQDxm1SpvIgtBdDdQc=;
        b=ilzo9c2eLpG5BOdzTnJ1tkqhp9s2JwqSPj4VzslIQPFHhDhVdpoBWfev2lcvMWYGAk
         LWFmGUCMpF5uNIxObmAY1y7Cwz0tVv3fXlx7DirA+zGhp0gHsbVrJYts4KlIEMaVNShW
         s58ijis6EBKvlJ4RD7wg+QyKC9HgwxlOoMmGiStZytqdwsRGkEPAbnd97VSChuXp0WX2
         +zQZucIclSJNEB8LrJuUWNbLETDbXuARP7J4BpZwlsp3F2KaeVnEGE3ElxagEGNuNPMX
         MhhrdCYxE4HJypzTxNex6giAt99IH51nzCLsiUbRV5I8Mu3122JtZN6LienGlMgmPFwP
         f7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682063255; x=1684655255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+szQLnykesBFXcAq23XEggqpIQQDxm1SpvIgtBdDdQc=;
        b=WgSFF0FkHumlQTHathUuj+5Y0m0VLxYTLwUyJyGmXB8ZTWqGHjtk2uRKVTeVXuggp6
         kv9/aGNXxSjCBGl7tt/61RklaQ2xqlvagRGFW6Pi1jArD5IdhPuCVJZQyiBoEm8M9DXV
         Vn3r/kVrwe477SplckCFG9P+VRz3Lt7AkUIfx4XWf4qJOgpJ2prSRFdmKJGEyFA57bby
         YfDFpQgeln5Nw6MvJYHSuG2eye7h30KIdUsOZFhi7CUsnmFRfnNxRpA2Eo0q0fzNCN7b
         uFEPjJnfY1Zg0Xg6weBcUMUBjiuYJlwN1rOxUfXw2qGCsRq/NB8zD5SP128iWtc+GYhx
         5KPQ==
X-Gm-Message-State: AAQBX9e50lJcYmWdlqenBK456f2Nmd9uhabNEsB2qkwAD2l0qWYDbsSk
	U62VdSI8BY+jSFemfEcc2TNNPw==
X-Google-Smtp-Source: AKy350YWXAjbfegp64SHi2kVBPvjPJX53ws5n0MUPi+U6yw4/3MYRHocvwLpECOt3NyF2XecW9aODA==
X-Received: by 2002:a05:6a20:3d17:b0:ee:4210:6ca with SMTP id y23-20020a056a203d1700b000ee421006camr5099315pzi.7.1682063255147;
        Fri, 21 Apr 2023 00:47:35 -0700 (PDT)
Received: from localhost ([122.172.85.8])
        by smtp.gmail.com with ESMTPSA id x7-20020a056a00270700b0062ddefe02dfsm2464680pfv.171.2023.04.21.00.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 00:47:34 -0700 (PDT)
Date: Fri, 21 Apr 2023 13:17:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Mason Huo <mason.huo@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shengyu Qu <wiagn233@outlook.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/3] Add JH7110 cpufreq support
Message-ID: <20230421074732.hazan2cpmozpht6x@vireshk-i7>
References: <20230411083257.16155-1-mason.huo@starfivetech.com>
 <CAJZ5v0j_MCv6e08qYKMhiZ2kKzovO+W4scMAKUokNJvt2myS-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0j_MCv6e08qYKMhiZ2kKzovO+W4scMAKUokNJvt2myS-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_004737_336649_2F97DF40 
X-CRM114-Status: UNSURE (   8.59  )
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

On 11-04-23, 17:58, Rafael J. Wysocki wrote:
> Viresh, can you have a look at this, please?
> 
> It is very similar to the ARM thing AFAICS.

Sorry, I missed your email earlier. I have already applied the cpufreq
specific patch now.

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
