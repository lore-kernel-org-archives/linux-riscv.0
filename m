Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E6BC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 03:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JP88lZG728pnoaLGCIYxzNtNkAB7yCMMJcKJtHPtnBA=; b=UPiJZBP8lIxohl
	RL9iEIYSOimOuyvX9Ihv+ZsJR1kGk6hQh4/SAt3EYYdjtRv7CWSjCn8EBsXYyJd6wzaVIKIYHAnr2
	RYb8Pz8tF/7H/xq49BAds0wACj2LkCSo4YhbT/WfsIKfKdnCw5BG+haL+sEAsUvLzD+S05I2Ez3u0
	7WPFRUJi3SS38cSeWKSOotBzcbS518mUZgN6uMYcxLDaGptulStbRWEqCIq6DmPpPmhN/oweCqgEC
	3e2e0Sin1yiXmZMOXlQ0aG3G3mBMnF1NvYbyjI6/xCbo+zagRrWf+ti/00X1q4nFb/ykrXEaDkWeC
	VWMQL2Tp7qBZo9u5KPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnG-005wwZ-1A; Wed, 25 Jan 2023 03:49:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnB-005wvT-TS
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 03:49:48 +0000
Received: by mail-pf1-x431.google.com with SMTP id g205so12596830pfb.6
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 19:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnB3T9k3P3og6S/sk7qknvEOozu7/Wm64yCeJMFNdvw=;
        b=0UHXmG29Bqv3FzULtv7f93P1JlBTMyLxN90ylh/ngMm0LpalmWaszBLSFMsxWIElMO
         +DYaA/q7TPMra6BJ7sauV/4sBbvrzWsbkUhpmYwZE9ifocopdsfI8SuBK5Ojt/A5/iGG
         Hi9mImTgQw3xkFSeTV+/9/ApAJsWTC6fAXytmX5sQMTcsQhSjqwsH0506IfuhrctG8I+
         9KnY5vL6M06hmsTRlNzlJJkuMeqKaYQeXYiCSraiOHg25NSALSn+b6lGqavwWvKTIkif
         2o34gq86Fj/T/0rKV6tXXnCmofTEAP304J/SXduO8/LdF99sEUW+f2j/ftO1GIV0+aV4
         7fsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnB3T9k3P3og6S/sk7qknvEOozu7/Wm64yCeJMFNdvw=;
        b=8ANbZqVnEPq69Ng1Rd+Im7f1WKcWIS5bLntN5HYvaSArgmyYKBnQ3nz5Vm4y4sT2Q9
         uFF0saJrUalsBErfDeX4jo40qCJJ0jyCWsNOgJWCW49AGmVS6Mg3HBp76CZDIa6UA7Ky
         qQF1mJbaC+JNmjgQ3vCfZbuCwBAWK8Wghln0IyS0wKVauQhwxiakU3tOLpf+UkevWeRN
         BuxcH0dH+bOXbXYeCpCtZ/FqSrlowwTjdkyT7CjMK2Cklc1HrvYry6EZNRSzmLDObeAl
         Ct3zCG+u8cWclroyGuiSnyWaRiLAbm9CPbfaKc4IYLbVTiFPAf9d+9vKhaMUO+ePb2nc
         nfYA==
X-Gm-Message-State: AFqh2krXNR56gsbzH2Js30TyExbtyibP9BIDOVcs3j+1vpYv+FLoTynl
	qlpFkQqlIegOwNKrP5m0Ih8Z2w==
X-Google-Smtp-Source: AMrXdXu/n9NVSeTxN9w7G+GhXf/V9RpRcEMdIc9rDjNXTtgozjt8JQ1Uf3SOdxgYXJt2eF/quf6/zg==
X-Received: by 2002:a05:6a00:1887:b0:588:cb81:9274 with SMTP id x7-20020a056a00188700b00588cb819274mr44971593pfh.32.1674618583828;
        Tue, 24 Jan 2023 19:49:43 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w17-20020a627b11000000b0058dd9c32fcasm2371918pfc.180.2023.01.24.19.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 19:49:43 -0800 (PST)
In-Reply-To: <20230110080419.931185-1-guoren@kernel.org>
References: <20230110080419.931185-1-guoren@kernel.org>
Subject: Re: [PATCH] riscv: pgtable: Fixup comment for KERN_VIRT_SIZE
Message-Id: <167461852792.4353.8179831324242884848.b4-ty@rivosinc.com>
Date: Tue, 24 Jan 2023 19:48:47 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: guoren@kernel.org, alex@ghiti.fr, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_194946_217220_A293170F 
X-CRM114-Status: UNSURE (   6.26  )
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

On Tue, 10 Jan 2023 03:04:19 -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> KERN_VIRT_SIZE is 1/4 of the entries of the page global directory,
> not half.
> 
> 

Applied, thanks!

[1/1] riscv: pgtable: Fixup comment for KERN_VIRT_SIZE
      https://git.kernel.org/palmer/c/6be1ff430dab

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
