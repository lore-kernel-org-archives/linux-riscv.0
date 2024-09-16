Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D132BC3ABB2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 12:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaA3RZbD8A7hWWKI27LyJ1hg5PKjyMaZmlZb0OiDaTY=; b=DVrbQMbV4lICUC
	6tLdsJO8UyEVbCfn4gRuwERBeTSp/56YeOH8S2RUqStiAX3dvmZR8C4ptRneKwQ4VJOgshM4ogu8C
	/Eo0vMvn8Ure0LtFC5wm7wLoptPpQuT35qYIea+7H+Djd+wiUcwINnZmmTZJ02Ilx28t8AnklyeCh
	uOm7+nbWOsO+7c59IVAsBbCKnirsi5usXzWswkpMqTA0FZkQGwoHXb95wOtPdkTpqLjZ82Kd0asPX
	Mgq/aERbkafgKCX5DXQ/ryOaIJLJb/ZCmJ/buj26Xehet5APFnYAwd44cOXIZI74lTUC6t8PXNJNr
	ZoLRatznIqpUK6RVRB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqB0a-000000040eb-1jJd;
	Mon, 16 Sep 2024 12:39:12 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqAzZ-000000040Qu-0kwv
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 12:38:10 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a8a7cdfdd80so496823766b.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 05:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726490287; x=1727095087; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KNBeOEHGq7Pser7VzvbTspy/A3zYw7bZRrBFbZEGNjk=;
        b=AhS7/ue8IzwXpzziNuvR6h/BD4V0e9shvJKDtmzV/b6w7oHVnYuw/KpN4q7LmQsP2r
         79ITb/v0QFBXE7riSCXuf9+1ma0SJI4ANJ53IlIInn8xfI2cbcsO5yamWpKPG/22gmy2
         zmQcz0bA8y2CBdtc4mswr3u1Qur6fvubiKtxPa4ZnzxtLT3APpnX0vZ6Iv/q8iu63SN/
         NtUfq3fNmIwcaoh7UZeYt5beTC2YD2On0w1lPCRgbYuH0HbmzHiPRb1/twOFGuCwENIZ
         WqbhVkgEo4OnNHOIqXWzEK7Zkmcy4QCveEA7wFfArTKkmWxUPElv7sH93/+R5sVAivBE
         +gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726490287; x=1727095087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNBeOEHGq7Pser7VzvbTspy/A3zYw7bZRrBFbZEGNjk=;
        b=iJRHORjZ+VT/QEEPAfLy9Um4SyNukO8nkaBpiMG97th+Rem22o4vWkCxWyLyNAmlfa
         RFFn6gaHe8DGFl6giIgPYQg4qjeXx6M1AHM2qjhtfn2252c0geaP89Ojg58Va9/jEC6r
         UQZk9geb10dN5zj5Brc5sLCOOQeeUPCKw4Gt5T4uyg5cxYZOcBB/pntCyDAQX7y0pr6f
         vGyQevrVMd0jZbb29MncEO5gvg7ScxsAUu18z8iN3Kyz2Kzqlv5ljg2L0AF+mH30Ta57
         hySiUQxLuIBeNxTofihh8/lN5lpvoGRQVn8jybc1iZAKLCdNAQj4QuHxyBw7hszm4Gxu
         IQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCAYt454zcm+SlOQcrvWsQyG0RRkW0zb0VHBBkkLo/D7psFQHQfTt0FCrYjn91PyYHbkA9gKEQXxlsbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5TBEa3t3oPRtbyDPYZz0Hmd+YVZxx9KhQwpqXXceDKx4+p/ST
	YNtUOAtla/iTDdvAIzXDNim3/sx1+RzfSQYM/1PG1UlOI+O+wpN1KKMdKwoZT2M=
X-Google-Smtp-Source: AGHT+IGOZcpAXmdIVEV2vYM9IhWJaJecvzLcXzXO10w2tECmYppWvm9paxVvWFyfXx7MUbTlLrDpRQ==
X-Received: by 2002:a17:906:f5a9:b0:a8d:51a7:d5ec with SMTP id a640c23a62f3a-a9047b4af68mr1200972366b.13.1726490286251;
        Mon, 16 Sep 2024 05:38:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3a0fsm308834866b.117.2024.09.16.05.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 05:38:05 -0700 (PDT)
Date: Mon, 16 Sep 2024 14:38:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: perf: add guest vs host distinction
Message-ID: <20240916-6f21ff3d12224f366ccaac6e@orel>
References: <cover.1726126795.git.zhouquan@iscas.ac.cn>
 <c62057d587f075a64442df1038fe27b52b89c997.1726126795.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c62057d587f075a64442df1038fe27b52b89c997.1726126795.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_053809_248685_BC1A9DD0 
X-CRM114-Status: UNSURE (   9.46  )
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

On Thu, Sep 12, 2024 at 04:00:29PM GMT, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Introduce basic guest support in perf, enabling it to distinguish
> between PMU interrupts in the host or guest, and collect
> fundamental information.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/perf_event.h |  7 ++++++
>  arch/riscv/kernel/perf_callchain.c  | 38 +++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
