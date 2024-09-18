Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C189DCDD543
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CdTR/Poj74YMpLmqHrMuuOrfM/qlaWwUO3gL+OEgH8=; b=yfze03rHQrilVy
	XrptMXVsvAQIzpv4BMMq0lYNYZMtGeGKl/3kfIhrMMoq16ozAFNTADm9ZkvywvQrj1eYvuoT7NlEb
	aFsSTacx4rgRmYeUlDWpU8NHKVbIxkOKOFyN6rEgR3BR/ZymHRZK9ARDX+RSfUSIGcDsJpoqIm9B7
	nAk4J3hM4XQvODWJ/V5A8oSr+JX6W+8sxSfcvWeVvdlxvRjog9BrZVQ+AfJbijK4/bsH9mKSFzZdX
	TUTWUQj2Ravh1kX5cFJc8c+3GAKSSLGTMQfL5CfgDHZeEGzfSimvPl0HO3jB+FWbBRn8N6eeaGmMH
	Qg95khrmLUqsoG1onb2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqwvw-00000008ZIW-1qRw;
	Wed, 18 Sep 2024 15:49:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqwvr-00000008ZFq-3SWJ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 15:49:34 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D0DAA3F45F
	for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1726674569;
	bh=F+xAcdwvemJXFq2JmBI2yNArggYzfuI0I0zCGmRTnl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=OwQiA+nMeXHJKlN5TECfwAlSGuje/Uy4qwnr30eorW7W8zizeZf61JytfdxKx8c1S
	 E5HDUJfDcIGCfSWgdZu5WnubzHu5GKnj2gLdqivZ0WbbI4GSNfjsbFEf2sWzDH+CAx
	 1gTz6kKLNZBPdKWhCwDOS/ygGiY3bNJNEy0GawFo3wnTgpjYitNQa9KUnyGTbCKXgQ
	 1eWj0fp9LLJAYo/uO5JuH8rF7CdpPZE/1o//DHvUVN+XG2+E4dgPYL4aohrzP3t+pb
	 r6Dh3y4tKolZuTEdHfGxXlOVSaz8UfKTj6zfmseNm346xHx1d/xr/hzczpHq8hLbSG
	 6wM3xnUUP/+4Q==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42e611963c2so23496205e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Sep 2024 08:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726674569; x=1727279369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+xAcdwvemJXFq2JmBI2yNArggYzfuI0I0zCGmRTnl8=;
        b=QJKsNJLDpUg82MXd4TJ9gcph1GnMZWVp1dRhKPuet5VpVdAlfgVYPKEy39zAZe3T2W
         h351QlqVJpIc+RcssPvm/6gSQM/wL1Vz5Q7p0jk5bk/bp1vna+LfrW27NEGHkeUUzLaH
         7fuL5J5hD/z2JTuOOtFVlrlqEqxtH6sYlPTqKTWStQvnqVrOt0fpzwEnKyZuIBUNN3fG
         j5FWDaheyJLkH6jGAjkgA3hjL9CAjs9q/DqKo50Rz5Bs8PenGHHzk3f2EiNLnsvNd1fr
         4jxnqxdyPqOTmNeSfL02pslR1iqPJR9LGKqhdCCKYDayMeHHL5RlFSpE0Cd4F1H7aQ2v
         0UsA==
X-Forwarded-Encrypted: i=1; AJvYcCVheuS3fYnqOEAoRFTfspQ0nP+cl2tffUcijfMSmgbRzovrWQte5qz89lO2uS9qnAch+eEvQQiHYLkJ7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUbkAzieXTaJyGTyd8IdGimmict9zX38ymWgE+ZExMV/SChQgq
	i1FjaPmy6N4+urNd4xPbjamU2sr/3mwINH3zAicTwQbrWIxBJXkw9HsvuUl7AKQJsihBUaKKhjZ
	+tyutM8/JZA8SKD6036PVWg03Ozv0tkdU76VPvKFPXZVhrJe2JzPAJNxtJK6W8gZW16qhTJ1bV6
	al0Mp6Tg==
X-Received: by 2002:a05:600c:4e93:b0:42c:ba83:3f01 with SMTP id 5b1f17b1804b1-42cdb540288mr156767815e9.8.1726674568849;
        Wed, 18 Sep 2024 08:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExAlrcNId5RFaxWnWQbjyD7bs3F/Z1jJ/Y8qRGrKFZW3zH9kusnRT07hhPZ09WpG/efGfuSA==
X-Received: by 2002:a05:600c:4e93:b0:42c:ba83:3f01 with SMTP id 5b1f17b1804b1-42cdb540288mr156767565e9.8.1726674568334;
        Wed, 18 Sep 2024 08:49:28 -0700 (PDT)
Received: from [192.168.103.101] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e72e4a46sm12643718f8f.14.2024.09.18.08.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 08:49:27 -0700 (PDT)
Message-ID: <620daf0d-caf8-4fe5-901e-2abadb751392@canonical.com>
Date: Wed, 18 Sep 2024 17:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel>
 <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel>
 <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel>
 <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com>
 <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
 <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com>
 <20240918-4e2df3f0cabdb8002d7315d9@orel>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20240918-4e2df3f0cabdb8002d7315d9@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_084932_232377_8113B033 
X-CRM114-Status: GOOD (  11.63  )
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

On 18.09.24 15:56, Andrew Jones wrote:
> Thanks Heinrich, I had also forgotten that distinction. So the last
> question is whether or not we want to reset mstatus.FS to 1 instead of 3,
> as is done in this patch.
> 
> Thanks,
> drew


If the FD flag set to 3 (Dirty) indicates that "the corresponding state 
has potentially been modified since the last context save". Upon context 
switches the value of the floating point registers has to be saved.

The value 1 (Initial) implies that saving the registers on a context 
change is not needed.

3 (Dirty) is the safest choice. This is why OpenSBI is also using it.

For reference:

3.1.6.6. Extension Context Status in mstatus Register
The RISC-V Instruction Set Manual: Volume II - Privileged Architecture
Version 2024-04-11

Best regards

Heinrich

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
