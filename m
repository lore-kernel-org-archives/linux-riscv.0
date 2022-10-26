Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0495CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bXwwXI07/ENVYYq2qG5rrUEwFSJmWFeoZ/dRs983Qgg=; b=ZCrSB/HTBAeWzy
	JAEGSsuDDZ2XsgmMzYhSinigaasquQZevUWtb9Y0dsd7pcf0XhHWHiAMcb3BX8dCDDrJ72ySMBz74
	ZtTLkRda5pFqA7PHwEjglo5F8F4eaS5WlQjPH5HLPISbsdyxAORFbQYbeWpiBnioaNVnx65Qi92Vv
	d1Eqp/g2kPv1YFqpM3a9ZUHEC7r5pZrId54kd0kfk1XXH84+exVtcul8OIc7jhz/FfCPM+BMp+4hN
	i0BNxVnK+xGjaMYTYsfnU08Az0Ep/X4ivesHoTYwyoaidi5+wXZwWal3BlGVwC33LqDL9oJcUlvT9
	AiKtqfu5Uinm4rsQHdxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ongmR-009XqQ-MW; Wed, 26 Oct 2022 13:49:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ongm3-009XcY-7y
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 13:48:52 +0000
Received: by mail-pf1-x435.google.com with SMTP id g16so9874947pfr.12
        for <linux-riscv@lists.infradead.org>; Wed, 26 Oct 2022 06:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=perTojXhOIkVoIxZmL7uixXc0TfGA0sMyLeC3fzxIlE=;
        b=aagNXPdSImuDfcBn0cDGfiEdse2Bw1UYAgM4guo6MrC3qWnLgmiceDLl+WlEFpSkC1
         2r3kUh4QRch1dkmg9WPYMl8t0xjUosWVLgpX2r7RC6xaZm6tUMOIfAt6mPHTi6L0YCHi
         f6Xhl2V4Rez5PDqhvK5Z0A9I0pVMM2UPpbKSnMT3mCxVYGNVTELqhuh9LlpIyeReygMt
         tX6GUxHdVIn58/MybOVSnqjmqIN/n4YL070Rg+KYZFnK/UiounvX+lHPwJUVEpmgNs+n
         wTRdbkfGu43nTi5LwoBK0gyF0EFY/5LRxdBKfwgeQ3JiTDb/DTRxrayad8NiyJeoFLcA
         rEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=perTojXhOIkVoIxZmL7uixXc0TfGA0sMyLeC3fzxIlE=;
        b=TcDg2MwwNS5ATMpZes2nrKIpt8xK9C2MQQUotCYYM5oYoiDAYstzRQBvD5kBNK3f56
         ZIkEIHuQxjfxHbPYf3GOcOYUCLhqAekFXBhe8GdvmKWmWS97SqBk4DyJWDuKYWNZgswz
         +BhKGKlW95LYRWeAKRGCnqNOmuu/Bsrn1gfNyEYDUCb8QupWMYoFBnfCXviHVlZfA58R
         PpSm5LHlCPqYW1tOmruS6DpBrRtThrTBpt2PtevOGf2aCj3ZdynfaljH82DoAcCgffkQ
         f+zgsneB7nukLqyK6yjSJTQMGByxYsFVfb/XMHwv5zfHB4SFN7HftnXLmo0okgFg94ic
         6cRA==
X-Gm-Message-State: ACrzQf3aivwvRdgCOPuSw50IroabxJQHISfYCBNp9jCCdN85LdpZk4xV
	6n5r1TP1EdqfBR+21d3ZaxvZRJpauPaB4Q==
X-Google-Smtp-Source: AMsMyM47/2wydw0Q7j/VTrsT+GrAjI8rM35XtHTmTpQM647Z7CnM4cUc7mPeKpbbUfboFyLNyR5wcQ==
X-Received: by 2002:a63:5415:0:b0:439:e932:e025 with SMTP id i21-20020a635415000000b00439e932e025mr37107108pgb.63.1666792128379;
        Wed, 26 Oct 2022 06:48:48 -0700 (PDT)
Received: from localhost ([135.180.227.132])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902e80100b00172b87d9770sm2972412plg.81.2022.10.26.06.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 06:48:48 -0700 (PDT)
In-Reply-To: <20220925004757.9089-1-heinrich.schuchardt@canonical.com>
References: <20220925004757.9089-1-heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 1/1] riscv/vdso: typo therefor
Message-Id: <166679186656.19249.8222101751661120126.b4-ty@rivosinc.com>
Date: Wed, 26 Oct 2022 06:44:26 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
  Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_064851_535892_0805A336 
X-CRM114-Status: UNSURE (   6.77  )
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

On Sun, 25 Sep 2022 02:47:57 +0200, Heinrich Schuchardt wrote:
> The adverbs 'therefor' and 'therefore' have different meaning.
> As the meaning here is 'consequently' the spelling should be 'therefore'.
> 
> 

Applied, thanks!

[1/1] riscv/vdso: typo therefor
      commit: d233ab3c5c5ed4b3d2201bddb71dab5a2946c31b

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
