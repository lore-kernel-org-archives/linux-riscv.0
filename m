Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BE8FA3743
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 23:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/u+3pDNSsDggM4BDaWe6xFOo/hs/n+FPGVPQ39YlM8=; b=2jcpHdViSKjuxh
	EXXjR7heuB0c7BKBPh84DMEptzA8QqjRosJIichQ3pBBcKpttkPGJrLralMUOxg1voRWu3cg/y8GI
	z6oDn/RBfzgkkQPH93znFa9LbkvGFpd2QaC9wRb1T6zrMmXjeOlvwqTDiW/eIww9RKwroSxKFPAzd
	m5X5ZIl5fcc1iLKV6twe9B6CcmXsh/qcZGG023GtMC8Q7WHDZKZLeydhUCLa5jGF5tmd3xSILdfad
	BY6RzmZA3fCNYfdT6h4HZH5sVEGxFaovlzw1z1B0JaReDIBmzk+tEhxxK2oVo/yTQgrY0X8oDWGBD
	quFGwDeUjoB1fyUH4n1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooByJ-00FAtj-C6; Thu, 27 Oct 2022 23:07:35 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooByC-00FAq1-7D
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 23:07:30 +0000
Received: by mail-pj1-x1035.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso2938848pjc.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 16:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzI3t5d3liRc7hxlBh0IDGSGnHWX+yq/w4U9J6lQZx8=;
        b=byyQvlyCXCqEAdL5xERGkdxMKFN4si4YldC1ATlpNeVRfFStfcHU9AKbtkCtniLh1p
         uXMBMfvgijysL9RYs2zBD2kHkQbwtflDGvV0Jw5ONpAPWNi04gO+/f7hM8q0H5/mfcgB
         4k9bLjKPZfxTQRPDN7ERedmAU8Mz/PO1IqpPs0oWrmDJfHPeRQ3Vk2GeQkEivomXbJ2q
         G8fkrpmqZkzES6ska5+SoDJFnPJ8XNr30h/BgzoAgkxIK1g8PjKXVWC85CCbnrene8PM
         0g3J3sWGIDa9UZ84rl54XS8WgeXOTvtTIzfkKxkDJvAcYFIukpPEO5mkd1cCDiriDS7i
         3/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzI3t5d3liRc7hxlBh0IDGSGnHWX+yq/w4U9J6lQZx8=;
        b=icFqNAzYK881BMF34rdXsacGCwl2Av94KgoPv4YCXYSnBlX+xihEj2Fhzo37pcZKCK
         6fAvsaXh+tLPbAiAprfz6SlS6rqrDqtMkxD26R6u3FXmeVlQBEkd/ao55SXPhkrJXBEL
         Qp4mkuifBpz+pTaFy/S7gQhvS287s+kwT3C0mdvNZlWSlVYNQtJtYOfyuVpmMx9+dbfX
         Kn/oA+Rf3fJyh399Yi4wFVMhx97apBKMYa6wOfOB13BWturgyQbMnrrXQ9wdQ9IOhFno
         FBGossEjJ5mbQwRtegIZJx/Wd6ETW3c0r/CPcPTqdd6vQEwxfyxq7SnDUZtGi+H01+Z5
         ocZg==
X-Gm-Message-State: ACrzQf20d8jAJRmXpJHN2Ve1Wjie6sjnjJOBca05kmgNAk9nEvuMxt3T
	m40BQHdy9D34ucneLXeeMXLr/w==
X-Google-Smtp-Source: AMsMyM5ToU3WxdwsAIWxf7cPdbB/NPue87UNhaVnFffRRFyIB6epnEQLe4bWM3MGcu28DLAUQGQBIQ==
X-Received: by 2002:a17:90b:3715:b0:213:2d7:3164 with SMTP id mg21-20020a17090b371500b0021302d73164mr12800187pjb.191.1666912045501;
        Thu, 27 Oct 2022 16:07:25 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g22-20020a635656000000b0043c7996f7f0sm1513639pgm.58.2022.10.27.16.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 16:07:25 -0700 (PDT)
In-Reply-To: <20221009083050.3814850-1-panqinglin2020@iscas.ac.cn>
References: <CAOnJCU+GHzFSzSdvZKBrFeF4WqPvC5w0r1f4r3S8hLbOagPKgA@mail.gmail.com>
 <20221009083050.3814850-1-panqinglin2020@iscas.ac.cn>
Subject: Re: [PATCH v1 1/1] riscv: mm: add missing memcpy in kasan_init
Message-Id: <166691074047.22328.1696025995994116764.b4-ty@rivosinc.com>
Date: Thu, 27 Oct 2022 15:45:40 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
  alex@ghiti.fr
From: Palmer Dabbelt <palmer@rivosinc.com>
To: panqinglin2020@iscas.ac.cn, atishp@atishpatra.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_160728_518683_8A5B0891 
X-CRM114-Status: UNSURE (   8.17  )
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

On Sun, 9 Oct 2022 16:30:50 +0800, panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Hi Atish,
> 
> It seems that the panic is due to the missing memcpy during kasan_init.
> Could you please check whether this patch is helpful?
> 
> [...]

Applied, thanks!

[1/1] riscv: mm: add missing memcpy in kasan_init
      https://git.kernel.org/palmer/c/9f2ac64d6ca6

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
