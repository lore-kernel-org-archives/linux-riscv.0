Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA71C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 18:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7HaWMaA++kO6n0UvWtypzDfO2YPOGhrUdBgipAFtBnw=; b=dqR0Aq0itUuMrVOUqKdXXiUndt
	G0L5e6sj2G8PGhXn5ta1vd9lP0+1MzHbnh2YBzNibCjkxmP4/tMJvxAl29p376Jxk8q27KyxA4RbG
	uWXUDthUN7JIH7yAiEhF9c7bwV2bm3sJlGfXgEcV3yc4ewW2Wl/yn/4lGtMfHHnObD2np6jJhWFqx
	l3ZQ6CoNSdR5NkW6z2/R3ol18vq8VOhbGuzkL/60cJH6NtgpPWvjvabm2925mWna3WDXPwIbPoEg7
	cpP2O29j5IYKc4AV2oUs8o2OAQQI44u3JofamIV7j78fpg3yajs+HzpTWKRoXnjAE7VyhnWTQidS6
	HKtrepfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrlDM-008ylZ-Ra; Thu, 19 May 2022 18:49:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrlDK-008yjM-4g
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 18:49:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id n8so5565845plh.1
 for <linux-riscv@lists.infradead.org>; Thu, 19 May 2022 11:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=01qmh032EmJ/n0ECrOiGeBteM36sTTPd0nlmkRs/6e8=;
 b=XbHmoB6Z85gi/6T5+gmzQO553YV3GfE10qSwob9ZxdGx48W15or+f9OvG+7s/jBCCR
 YTuLnidrrSiqN6/+6P7R+zCgLTtx3VLMToQV7ZvSlpmIBb1XdW6F5rsLiEiVoYT7Fjp9
 YqzYMny4ZA5GghebTDB9sLXLbXFFE/Gc1YULSPYLory7L97oJ5f1+cxPtOrl3MMWoEqq
 GbN1R0a1cOjMn11U147/AxtwiIc/2MJM2HJkGwpSZOljmRyFzDuugnBWRw0Av780zKLh
 4mSmnH094cxFZuh9QsiMYWnncBUhDB6RfamcZEBEYPB5nyQ/Ak616ylDL98QqDoqUdTv
 CkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=01qmh032EmJ/n0ECrOiGeBteM36sTTPd0nlmkRs/6e8=;
 b=D7OhWHWpgdsqElPTMWvK61X2cW3eb/WZzrAcIr+cR8WVgvSmR9tCeY3OIgFNVCdPKV
 TlmN8l6o4B0RYxEduN8twrW0uN0iygHgF/d0sq0nv0LmMTBVCc9Rqh6XXdUlug0Hj8zo
 uFguROcNx4hhja1Q07BuXJLpQyvCy8mIR5xNV+vBYnw4OIQKzY2GNNxZd3hB1ACXrJ+P
 eTQc53EL1ksqntvzsqTVSiIs/5IjlSxeVUrPwCf5v7CtLDrbE6zNjbTSWOaGeY6ctvPV
 ZPO31ELs5dAI+MWukQt9rEw+098eeWoVERspVz+KMi9lsjKlTwoLTIDPcX4kPv6oWAqT
 jkEw==
X-Gm-Message-State: AOAM532YJPu2Tgmgv1TI5CcU3UxYhogAYuiJzOdJn0dJrBu9WzT12eR+
 GrMoNLPCzD8ifRhd+3qfMdBOvQ==
X-Google-Smtp-Source: ABdhPJxchEn9n4UjBLGu26EPugm+yJbovxNp3OgA5DHh1wxw1Q8rIWTjtTppEehhJjnYsU3PcO65Pg==
X-Received: by 2002:a17:90b:4f8d:b0:1df:efcb:942b with SMTP id
 qe13-20020a17090b4f8d00b001dfefcb942bmr1221534pjb.129.1652986169348; 
 Thu, 19 May 2022 11:49:29 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 f16-20020a17090a121000b001dc1950ead5sm136711pja.38.2022.05.19.11.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 11:49:28 -0700 (PDT)
Date: Thu, 19 May 2022 11:49:28 -0700 (PDT)
X-Google-Original-Date: Thu, 19 May 2022 11:46:23 PDT (-0700)
Subject: Re: [RESEND PATCH] riscv: dts: sifive: fu540-c000: align dma node
 name with dtschema
In-Reply-To: <5ea0ddc9-c4b1-a2c6-059c-5e47ec076bca@linaro.org>
CC: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 krzysztof.kozlowski+dt@linaro.org, aou@eecs.berkeley.edu, robh+dt@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzysztof.kozlowski@linaro.org
Message-ID: <mhng-090c7f80-bbc5-4e28-b89a-1a0384a305f9@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_114934_207038_7A097412 
X-CRM114-Status: UNSURE (   9.49  )
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

On Tue, 26 Apr 2022 00:56:39 PDT (-0700), krzysztof.kozlowski@linaro.org wrote:
> On 07/04/2022 21:38, Krzysztof Kozlowski wrote:
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>
>> Fixes dtbs_check warnings like:
>>
>>   dma@3000000: $nodename:0: 'dma@3000000' does not match '^dma-controller(@.*)?$'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Hi Palmer,
>
> I already resent this patch, pinged. Can you pick it up?

Sorry I missed this, it's on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
