Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881BEEB64DB
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 00:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baCxYYfoLhtHXk+7jcEh46pBcwUcBf/7/sRu+hH1t5Y=; b=DwSc/tu35yMuBa
	Hfdjb/7hdSpDIlNVxWzm5rloIYwtqqQDM0baExizDHVx2fcT67tYvEzCbwDbLEbz+DV6Os3X0Nj5H
	LgWdWsumitg5AL4kJ5Vk8vAst6uNgO2tfCmaGPYu22i//eqvGoSibIns15pMBChUyKUPqLHOcemph
	3uP6QqtlJdOIWGSMQgX7E1RH3iHdIpCeYv35wjTPOuPzYbVKJqUjNQkaedmQre2ipokRvOOT+aF9P
	avhz09Y29cB/+/jf1lI5wm8mitp6bkn8NRwRj8ft+0sdkqVmwomqJwdLkk8Rj3Tk6ypmdXCPiykz0
	yA3RvMT2UUk8mqij2g+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgS-009on3-33;
	Tue, 20 Jun 2023 00:57:24 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgM-009oi9-2A
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 00:57:20 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-553ad54d3c6so810484a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 17:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687222637; x=1689814637;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRom180+ATZtgmyPRPdQxtGMIDvHG/58KwOF2Gsfd7g=;
        b=CkvcwqYH/SA5Ms6ONtC0mRosDGng6jZiToLgTHz1hGKxWc5yivcLEK01aCfLcq7eBG
         /uGkXUu9EKUbYdrrEXEjfdLXVKey/HRU1qwqGGpO09itGaTHSwKPbnGVgZsyWnLrX7t7
         5C3nzr5IvmOdPNbR5BsavXGU7uGuSjI5p0tvmCH2a4jAjDpfGCpbWvYpo5yKiij/BoVf
         YJTK1uMPmMwUUUV1y5BO16kLKtwj7yTpqK5opPGqt5C0neAJ30tIccBv7l8cg21DXS0q
         cH0TbljYvq3NDHHMOLcJ/SQRa33SY8LyKxn31ExJwCDHVx8qLyRees1j+fqn+cFtL8ek
         ClPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222637; x=1689814637;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRom180+ATZtgmyPRPdQxtGMIDvHG/58KwOF2Gsfd7g=;
        b=cD+icDw7NdW3BuaB4AJyhK5SonA+EHQv0EP+LyqibsUfZoMapoaNUnrxv31cUxH5G9
         iPJJiPfymD79pQ/gI8kcJi8kq1EJiJYzaKmifA02RKgJpskWtrYFjJ4VDl+Abj5DABsl
         3bBsFM/pb5kIjIiaj0xHA/cqlA8+zIWJqBTFkhomxkzrupURdPHF5H9ueH8f6Oky4scn
         urR6clNDbmw5Yfdm/pVpwF6JdKlQN5TH7tWxjnDCWSTIWIaabUfUHEFncxuKNZ6+Ddp+
         8N4JjkHJiQTo19n86LMzGzkVP3MOvgotFP50k4aE6rPLtkBNXGHaCFCootCTxt8qfRs6
         uHHQ==
X-Gm-Message-State: AC+VfDyFu8HVb4uYEVMA1vtFcx/jS1Pw38KL9w58t7lLhoHP8gToMV2P
	0bcbe8VZCbkC5p+z4Hp3NvCJS+lcu9suqUEf+04=
X-Google-Smtp-Source: ACHHUZ6sAzMneIYhOdpTkZKgfiElyvst2qwHku16IuuLibRfnlo5qgTwJjp4nMxsX6IV05ei7Eaorw==
X-Received: by 2002:a05:6a21:32a2:b0:11f:3553:5c8a with SMTP id yt34-20020a056a2132a200b0011f35535c8amr5409311pzb.12.1687222637386;
        Mon, 19 Jun 2023 17:57:17 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e80f00b001b024ee5f6esm385131plg.81.2023.06.19.17.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:57:17 -0700 (PDT)
In-Reply-To: <20230522025020.285042-1-songshuaishuai@tinylab.org>
References: <20230522025020.285042-1-songshuaishuai@tinylab.org>
Subject: Re: [PATCH V2] riscv: hibernation: Remove duplicate call of
 suspend_restore_csrs
Message-Id: <168721242544.30028.11015895389526975730.b4-ty@rivosinc.com>
Date: Mon, 19 Jun 2023 15:07:05 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, suagrfillet@gmail.com, mason.huo@starfivetech.com,
  leyfoon.tan@starfivetech.com, ajones@ventanamicro.com, jeeheng.sia@starfivetech.com,
  Song Shuai <songshuaishuai@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_175718_704636_45B126ED 
X-CRM114-Status: UNSURE (   7.84  )
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


On Mon, 22 May 2023 10:50:20 +0800, Song Shuai wrote:
> The suspend_restore_csrs is called in both __hibernate_cpu_resume
> and the `else` of subsequent swsusp_arch_suspend.
> 
> Removing the first call makes both suspend_{save,restore}_csrs
> left in swsusp_arch_suspend for clean code.
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: hibernation: Remove duplicate call of suspend_restore_csrs
      https://git.kernel.org/palmer/c/c6399b893043

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
