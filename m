Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D6CC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 19:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VL5jwcYVh02ZA0bi1ReBm26s0PSAVYwaFr75bV6b0Pc=; b=ScvKsM10jDtJcq
	pFEeuuvGgA1BOCGgr2VLip/CGMumo+OnNsTve+eI7XuNbTmnn5WYEy/JnRA78J/vDDer1MmhjJPS4
	rGbXTIOAHqs2y/DdRD541s5OQ/j+g75QMNyAm3qds0hKIFS/MuMue4pznPaLudD3oGprgOrZ7AoCb
	9t8btBUEBT786rTFIcCmkNSNIrYHGaYLmAvoyp0MP/41UNQaBa3eNpmo5086igQeWr7WxsOSXM49F
	eHbb79Eg6wStWQ1L2NIkaf0s66To6mdZYmbvgqIklhRoy0H+3yZYoIe8WroUlwOM3R4Epn0Q+pJNJ
	Zy1B79B8Wyc81h0YZP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWP8-004hmV-0T; Thu, 06 Oct 2022 19:19:34 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWP5-004hkZ-DY
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 19:19:32 +0000
Received: by mail-ej1-x631.google.com with SMTP id a2so6680867ejx.10
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=FbCkYi8dJ9ElHGRGQt2IFM46+KrPD5fVaRWOGONLaDI=;
        b=JVeaJjCYLkob4o3yqCDZuQbZS371HChTl8+NHJmk9+o9pRA1cmELiGihXlf6BEUCtO
         55HKx+CCK17whhaTOyVN1k+BwBHQwV3G7kYN0/GkFPvBuCQZLgC9NZR2+znzCRB7g8cU
         +a3cPzkU/Xhr6iTGPPMzrO79wJOY/UnCx9jwZz+sDKnEZRhPIduUIM7pigCokfJlkaFz
         CZYk9HWyHsBrVQbV4XVf0MOJameb/xloVQrn+kNPMovtXy2U5fBez+h2Y+DeGezVBgZ4
         5V+NpZr6bzptuudQ17bWBLYxO93DspRXjS9+4vei0iAbQlpeGLQlOi6LjWVb8VMu24LI
         +7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FbCkYi8dJ9ElHGRGQt2IFM46+KrPD5fVaRWOGONLaDI=;
        b=d25L0PnRX5cJLZOIXQTwm05YP0n4SUkQu1MG5+qYpu1yv7qn8enmuhGF4pxqH2Z7Kv
         j1Xg4azoUUpTfc/fV701f8rKLeunRynjxYzY3zOzUpYWJQNU9k1INUdYwtCiJ+o503Gn
         yWlGUzERCyQX465LGYOvvwA9J7/0LSXj/TQuC9JSAx+IBx6wcTvo0fEgeosAJ0GZOb8E
         BIsvu7RLkZ8/tPOZK3BQLRw6XbIX7To0XiLUQ9qOt8G3CAWFam+v6GxbZOlH19ellbqj
         1yNVUYe+EXWfEqN06RZO+stVFB9uLTE8kIPcs4KpDP6sF9lKQnis7nqNUxxrPJvJUgI3
         gaEQ==
X-Gm-Message-State: ACrzQf1KQs8jZ8RFITZnL8A2CjTuIepdtXD96FWRvQo1olOO47CWSiR5
	RnnaoszO/YcUUQ9hZSjhMZ0=
X-Google-Smtp-Source: AMsMyM53FZOCoUA0w4qh9AuIlr09DXlrmrGKn0xWHtyK1V+84KnAahKw7odjKpK9lnSu2o/k0WX8Bg==
X-Received: by 2002:a17:907:60cf:b0:782:d3ab:55b8 with SMTP id hv15-20020a17090760cf00b00782d3ab55b8mr1164168ejc.6.1665083967950;
        Thu, 06 Oct 2022 12:19:27 -0700 (PDT)
Received: from [192.168.0.100] ([46.219.3.46])
        by smtp.gmail.com with ESMTPSA id v2-20020a170906292200b0077086d2db8esm91300ejd.140.2022.10.06.12.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 12:19:27 -0700 (PDT)
Message-ID: <a69ee775-e565-3d72-eb5f-8378616694d3@gmail.com>
Date: Thu, 6 Oct 2022 22:17:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: coelacanthus@outlook.com
Cc: c141028@gmail.com, dramforever@live.com, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, xc-tan@outlook.com
References: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
Content-Language: en-US
From: Eva Kotova <nyandarknessgirl@gmail.com>
In-Reply-To: <PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_121931_504565_FC46B5BC 
X-CRM114-Status: GOOD (  10.33  )
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

On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wrote:
 > As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
 > but not read is "Reserved for future use.". For now, they are not valid.
 > In the current code, -wx is marked as invalid, but -w- is not marked
 > as invalid.

This patch breaks OpenJDK/Java on RISC-V, as it tries to create a w-only 
protective page:

#
# There is insufficient memory for the Java Runtime Environment to continue.
# Native memory allocation (mmap) failed to map 4096 bytes for failed to 
allocate memory for PaX check.
# An error report file with more information is saved as:
# /root/hs_err_pid107.log

I bisected to this commit since on Linux 5.19+ java no longer works.
Perhaps some fallback should be implemented, to prevent userspace 
breakage. It is currently documented, that at least on i386 PROT_WRITE 
mappings imply PROT_READ (See man mmap(2) NOTES), this would be a good 
place to start.

Best regards,
Eva

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
