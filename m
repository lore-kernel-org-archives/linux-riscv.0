Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E429FC27C52
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 21:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZzM+vGMi4lwc2QAdcPxvgs8+HqFxdWFtus+ka6npa4=; b=vUcq7iZwPvJaoE
	ARWlfwJhWJdSV5kplMZUo1qoMtKShJ5V7NT42Ttu/n50cd4umR4Iq8wyrrX4JfJ06TdDBl0pUjqww
	nktbh6hiB2XtYj2ThOqD6TinIXeu+2mgEI1L9LQafxNDnjQzoE8eLQiZub+DqP15jPqINSi5hVnus
	I5t6bA9HpaqYLH8jeQLmEpNsxeZsBYOi8tRLdF4g9U1EzHH3umSNonjCSK6qUBTVrzlIBNG+KEofZ
	FjkHZzBbEn6lJae+SRqJ+RWfYQ5THsdGyfdB5eCZArx7Zimi+5shrQTlgCpPCcxtyI1vS0G7WbhgE
	Ws4ttcge4Q/dZxmp7/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFKmy-0000000BRrh-3B5t;
	Thu, 06 Jun 2024 21:36:52 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFKmv-0000000BRqG-0KuE
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 21:36:51 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2e724bc466fso18546871fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 14:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717709802; x=1718314602; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcryKK7kTWiDtQCjYQE4qGpsb9Vm4BBeEiEnHId7EzM=;
        b=CtSyDSVyhcdFUcfGrSLdmuZ8Iarjy1x5YimCwlx1ck9L9UtupcSmPPkSGL2mlXxaE8
         BuaxYDa3E72HGK7wUesI9wXZjWt1YyQDncWL0j2wVDHLeAvHk1TO6wQn7XsF9YUhoOj9
         D400hwjGohWzb9Nqd/wZrCM749n/hJSVMo+V9yeDd8y594ec/XrfAo3r2ERJpqp1xkeH
         dWECwSEDBkeQds47pbIVp9QZEMRh5vno/pvriZqI/YkzUpAyqn5aDZi5TZdN2e4+DTlt
         S2HqW/JK0cqVVFyZaCLcbb//Xidj7MQfesGvFx7e0HVqcIXKg9l0vx6Ez2ndFewuCaB6
         i+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717709802; x=1718314602;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VcryKK7kTWiDtQCjYQE4qGpsb9Vm4BBeEiEnHId7EzM=;
        b=QrWxofOna/9EjJ5TortupVpMg7Z07zWId9n856tKaBm1fDRWqZLlw133gsLG1h9D+N
         9HzFC6ecDIpJxk++XNqF87LOTlaOLIQRjMufpnTgSdNJTa3/NDfWmiovNmr0Ga99amoa
         816pcsG+dEkDQOCJzaSlv5gscjYlFMsbIogAZ6xg/BKlIJNhOYJFxhMvB5RegUua/Mv8
         iMVIuSMGPyRH3o1MDogr++FskMjygFwLqdp3wGqY0SHzNa3YD6o4d2kyNVy7dV/UFfXT
         zJCfCmykOIWT4V0Voo8Dp4rZGNjsaj57wJ86G8GJ0Rx2CrMk/6rH3OPT3dk3CDSc6Ypi
         yqLg==
X-Gm-Message-State: AOJu0YxfcGcQTcgMiolO5XS3FgDWqv/3XJymd1Gu4zX8Pfi2AqzYGPkx
	KbThOWOx1E54TdPJbSd/f94k8kWOM7GwStYVArmZ4vhIt/gYEQLN
X-Google-Smtp-Source: AGHT+IGl0C52Wui+goLhQA3www4O5VrcWzWpbeBnhAJxbmNg9La8PjNTvS4RjGhcOnNX+xhK+fJIRg==
X-Received: by 2002:a05:6512:5d5:b0:52b:829c:34da with SMTP id 2adb3069b0e04-52bb9fdd1a8mr567346e87.59.1717709801544;
        Thu, 06 Jun 2024 14:36:41 -0700 (PDT)
Received: from localhost (5cfc9638.dynamic.mv.ru. [92.252.150.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e1a2esm310704e87.44.2024.06.06.14.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 14:36:41 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 07 Jun 2024 00:36:40 +0300
Message-Id: <D1T9B0RLBAB6.2TS7V4IYKR84M@gmail.com>
Subject: Re: [PATCH 2/4] riscv: entry: Balance vector context nesting
From: "Matthew Bystrin" <dev.mbstr@gmail.com>
To: "Samuel Holland" <samuel.holland@sifive.com>
Cc: <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240530001733.1407654-1-samuel.holland@sifive.com>
 <20240530001733.1407654-3-samuel.holland@sifive.com>
In-Reply-To: <20240530001733.1407654-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_143649_174217_544AA974 
X-CRM114-Status: GOOD (  10.25  )
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

Hi! Thanks for the patch!

On Thu May 30, 2024 at 3:15 AM MSK, Samuel Holland wrote:
> Vector context management is the last thing done before jumping to C
> code, so it should be the first thing done after returning from C code.
> This also improves efficiency: riscv_v_context_nesting_end() clobbers
> the saved value of the status CSR, so currently ret_from_exception()
> must reload it. This is not necessary if riscv_v_context_nesting_end()
> is called first.

IIUC this patch do not improves efficiency by itself, because reload of CSR
stays in place.  What do think about applying here s1 register related changes
from the next patch?  Is it reasonable?  Or you can describe this patch in a
different way, like it makes preparations for efficiency improvements.

-- 
Best regards,
Matthew Bystrin <dev.mbstr@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
