Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CF0EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 01:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+lf+tp36LTIKqgLpwxDEopEshi2cGVKqEI/25I1kic=; b=o+iX5vhK1qvD71
	rwuv7ytgZ1O+JrQIb0lWqmWmMMEavfFUOqKub3cTngXP80ocesrchVEf8gmu469Ep55QspZn+vmJy
	OU8l3+ajr6bh7wLzT/jVBPx2SLI3jUAtkdths5w618DKpUN8GhWe0ljTOXSLGDP/+odnQFTCGnoYF
	i0HRERNkLzV0WMK29ILZte+1uN/3jOrsIX70ds7bMoH1mbjVrTf7o2viH/g91KCc9rpAxLc9t6nOJ
	LyfzrGQnnrQzVZu6j4KzQdWReqzJ3YucXuvnuk38fY7bVyzlJ2WigHqo+61gBt/C5yRKPDoGSnGOs
	u+FCVJ/CpdwVIbnmX48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxw9-00BPEH-2o;
	Tue, 27 Jun 2023 01:56:09 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDxw7-00BPDN-10
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 01:56:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so1090993b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 18:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687830966; x=1690422966;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkrRvgy5nafHRE0KaP/3+rT/giny9a8XwLb3pJMVobA=;
        b=iT/RjmlTC3wtzYS/Zfm7kbp69wbOc6cXV+ZPy6Q8/abgWyEunqkt9bpS24jnOob2Qx
         2WSiZs11zIX9akwi2+fIEVDes5sFg9sBSiWbtIkTwqpT6lINGoDxgZdrJ9YcRKnR//5w
         hEoYuNGpKoGVttLEnd1nlmWOF9HUHKJBpMO5XHfvYiRThy31YCAFPUCxrzJQweyLB6vw
         kkaoct7mq6d4GOPk9lwqY+2D842UP/okOXYyRVJYGVIA3oPAd1fxM2ChKAy80tt1asT2
         mWMzIakfu7XxUr799HCw7G7XizWsNHQAyKK72lnLH5oa2EgmleWlw0iAawZJI/9jL9Td
         exhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687830966; x=1690422966;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkrRvgy5nafHRE0KaP/3+rT/giny9a8XwLb3pJMVobA=;
        b=PmqU9nYaTg9fkpMZ96HQRSxnruB5ZVk4uV9Nd2yzgwoYjKP5Z5pSzD0Yo+ox7HUyry
         SMZj2a6FUcEVB2iQIfFA4LlmPhwMv8DioGS8Q6rx+wOw0f4aQnWxmVNdBEv8by1afykD
         aEcbiJLfOQXAlwyCKW+2o0UVP1CuUQzYNR3h+DWDxLq3Vac3uMuscKN96Mcqxsuldpug
         JIvd59XjeQUQewy90YKjXOaDpXw2FU4I8Ks+WcVzkYl4NVT0Y8uTxpMC1iGO2PdqbRqV
         b6Kx1yfmXp/oaMPDc4G1ipTDNQrGBYYlLY92ys9Ts+at/gQzr9CIoItJ1QXDsjUp/pyC
         9ynw==
X-Gm-Message-State: AC+VfDyHGhrYR6gYLZxWzRtyPOwPZ7obwCpthOcov59V917U0KMD079x
	7QSksA5HD52MIGaRRODieQOB53BndYNBmh38oXdVNrIyD3TLOAU7vpDiOIm0HlencNAowDd6DmR
	vnOPVJ+rq4rPrHcmaxyQh2FFT3kkF9RZkODR87jDroNOlMsD1yWLd6iSYH1ce7T7MoT9FNDB71a
	FtxT00eS0QnbAQ
X-Google-Smtp-Source: ACHHUZ71CUwenVHS05uCMzvhegc0ec4HkCF9gWSlLvN0MIP6Fgms7Ba/qjVBl1VE7KwrgArO9gQwww==
X-Received: by 2002:a05:6a20:a129:b0:11a:c623:7849 with SMTP id q41-20020a056a20a12900b0011ac6237849mr17584203pzk.48.1687830965663;
        Mon, 26 Jun 2023 18:56:05 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id iw4-20020a170903044400b001b80104446fsm2643375plb.20.2023.06.26.18.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:56:04 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@rivosinc.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [v1, 1/2] riscv: vector: clear V-reg in the first-use trap
Date: Tue, 27 Jun 2023 01:55:54 +0000
Message-Id: <20230627015556.12329-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230627015556.12329-1-andy.chiu@sifive.com>
References: <20230627015556.12329-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_185607_348372_491B1F9C 
X-CRM114-Status: UNSURE (   8.07  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

If there is no context switch happens after we enable V for a process,
then we return to user space with whatever left on the CPU's V registers
accessible to the process. The leaked data could belong to another
process's V-context saved from last context switch, impacting process's
confidentiality on the system.

To prevent this from happening, we clear V registers by restoring
zero'd V context after turining on V.

Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/vector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index f9c8e19ab301..8d92fb6c522c 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -167,6 +167,7 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 		return true;
 	}
 	riscv_v_vstate_on(regs);
+	riscv_v_vstate_restore(current, regs);
 	return true;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
