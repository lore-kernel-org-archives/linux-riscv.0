Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB95C636D3
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPKutOjtNaIHSCMQ/8Yc3llTWu1aoH+0OjDSWFQD/ok=; b=ub8TgQEi8Fo/uH
	P5sm4Op9ZZjh0QnEn5scukQl9nrmeJTo7WpEzAU2vy9rfF/b9TQoE4667BjQTSfTf6/XnPwbgSHLB
	W567radAyx/4ZllXYF07amDVvcAagDSc1gw7is9rtbSzkfOq9oY5GWA0dP3lqAmVBhdQAUI7k6fg2
	P4XjoxMGGKk5ecblhuEvnqRaJ8RNL+hbbm9njiuzEcwiWGiiHxSvbGvVCVOdrTTXzdkeYnRDd1zDe
	hMFhtCyjQGnKBW15+dVg86Vb6m1d14Ya+7lwuET9Gw72d4BNQdfvgVRhH9dibCSVUG1yUVFer4oDT
	jyKhM0tColbyG5E1ZWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZ33-0054eI-4x; Mon, 30 Jan 2023 18:38:33 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMZ2y-0054bQ-RG
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:38:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id r8so5735090pls.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xohq9EbIgnc/tnqstvxCmfauz3n996rqPi/cWgUMr6Q=;
        b=LXSBMegShi0AqqFqiTiUbP486qAalHpzG9jEwHOpWkywKB5M/JiK3nIvk2xq3F1CVR
         kZVlfXrQ6xdddsDSbPVNH5XO7bls0jat7fFvi2rhSXS5LUKQvfwqjrmUyijF1jf8VfMw
         ChhomwkuEiTOGzPRARg2Wuh/spIgxBClvx7LpbIE1Z62mTU9+VjAfbnWt10lXXdMeTaI
         IL23w74uELZATYSRl4wXG52IccPfI9kEiqwV7GvLNJZa85MueTXBCi8Qqw40JbILhu0z
         3wn5TMZ6WB4px2k3n/SC5rLVGke1IQ/jb+TgW6FW8EPz3oz1FAHVCDbb0sbQCrlE+vfl
         3E9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xohq9EbIgnc/tnqstvxCmfauz3n996rqPi/cWgUMr6Q=;
        b=fdMEmdj+XF98xcG2zSh0ekRHXnFC9RAHCCTQfBh6exqebJQ0sGg2hEX0BL+zAF3sSJ
         SttAOKMhfk4+wlde2/gIlwSVoK/5eKk5DHmOG7LAgFhpLjpNxDMJFxhjpmNYFKfTr2K6
         JQla7+TpijXS7ttvvMObSZjd2i4/NJzbRgsyvZJjKk9aThpgev8bkPxNdQwy5MgV3O0h
         HpPot05Wn2REUzEYr4TKPwO+NeNPjBoaBWpUOGiDTnQK4un0CAwhsXz77xDoQhIoB5PC
         iRJO+GhNcQW4C4rc2KwWvGA3+FGcwZenMwBmzYsIMvO45SlI7xrrYVxXaIdR5YCIieif
         3LmQ==
X-Gm-Message-State: AO0yUKUqme8+yYBBz3ifrOH9+wwJLgol59wBI0/eLb0ZvxOtNdgQfe7E
	wDInPuwASfeOZEXewHNzOzpURg==
X-Google-Smtp-Source: AK7set//AqkY7CCOSrgU+8ZYT1p/+L+gcQCLHh8Fcv3EKveF23rBrl7NO/JgNrZgRZcZYyGySuLKmQ==
X-Received: by 2002:a17:902:d491:b0:196:2e10:ba5c with SMTP id c17-20020a170902d49100b001962e10ba5cmr11701106plg.49.1675103906085;
        Mon, 30 Jan 2023 10:38:26 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709028f8100b001888cadf8f6sm8144091plo.49.2023.01.30.10.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 10:38:25 -0800 (PST)
Message-ID: <c5470393-af09-e86b-b388-d6b830451e8f@rivosinc.com>
Date: Mon, 30 Jan 2023 10:38:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
To: Andy Chiu <andy.chiu@sifive.com>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
 greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com> <Y9GZbVrZxEZAraVu@spud>
 <CABgGipWndcnUxUvWtyxyETtLaJT42VaZoiat7uDmnOjREEt9tg@mail.gmail.com>
Content-Language: en-US
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <CABgGipWndcnUxUvWtyxyETtLaJT42VaZoiat7uDmnOjREEt9tg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_103829_073005_72D3C9E3 
X-CRM114-Status: UNSURE (   9.15  )
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



On 1/29/23 22:38, Andy Chiu wrote:
>>> +     default n
>> I forget, but is the reason for this being default n, when the others
>> are default y a conscious choice?
> Yes, I think it could be y if V is allocated in the first-use trap, as
> far as I'm concerned. Hey Vineet, do you have any comments about that?

Yes I think this can be enabled by default now that everything is 
allocated on demand.
FWIW thread_struct would have 5 word overhead due to struct 
__riscv_v_state but nothing I would worry about too much.

-Vineet

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
