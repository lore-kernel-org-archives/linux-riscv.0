Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BBBEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 00:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47LifAcPiT/S8tVRFQHpcwpcxEMVQCqP5wX92GSnZpU=; b=Qvk7Yj2MaKaFZ8
	po3uqYtiDXlC4r1QQxiqKfT83bMJ7pexoPbSPtpvmvFDyKDJNeFPjPkJuxed4Gx0yWhdfJR/PPbe2
	1EqE//oxO4xXnL0hXU8NPSd0MgpXGAzFopDBPnFG1IadfiR/n7DUOQqprzPB7655w+s+yPXx+N0lz
	Qr4jkKjQwWk5uutcV8kxxf9ABWS3pCn5PfWIVTKp58zwUtBMLUvTLlp7Ah59WYH7Nj8eJvwBvuZqa
	R5QvU8mz1OJpUOLFmnZQKEccpmmBmgzNNzKrp49aaWxKsvgT5Cb2AthR3tN7PCmeW0gZlVK+PbAUf
	RTNDXPKJ10xyBpj694ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgS-009omR-1N;
	Tue, 20 Jun 2023 00:57:24 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgM-009oi4-09
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 00:57:19 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-3f9cf20da1dso41378551cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 17:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687222636; x=1689814636;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgrA10PlHqfUGfzRZzcrXtrkAeSCmc5QAg9LlgetDZ8=;
        b=FNDZS5lsetRtZSn1PvfXIXdbXNMLt+Xn3NNjVym1JoLwcLXGf7cfedR9Y0g+IrPrgT
         0G53k+RT6Qoh6HbJC3mpbatuGpalbeOZawDwpv64uWZpyGJh0ud1LMEB+Y6Ypk4YI2G/
         hrU+G6o5lsdwxvzgTS3MgQ/8t+mXm4/l4CxzPElEvVrv8z4frsifWMcWWfCVfbLdVUVT
         OXIPQeCjFi0lPYlDElB5KK+6gR4u4lHWZ11kN2a748MizOJwIcmQataCi6P5QmmKJuTA
         x1+lHa96+wt++MZvX724HLKshHJ70P43ZstF0acjjSWhenE6A/meO8q2PZLcnK5jEIIU
         rP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222636; x=1689814636;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgrA10PlHqfUGfzRZzcrXtrkAeSCmc5QAg9LlgetDZ8=;
        b=g9RtXZlc3KoLe4X1A1eiIFwOJAhDre5c1F4L7vf9OQlpvGqN0t7RzAtXW80EtYtEF1
         4t1UyaoSm5Ivkp235ULdGPRY+X/y18+JfPy9wI5RTBcloW+2Di+GUVTY/7PmMk6bFLQm
         B71T1QXC6eNefUQxJ8yV0OF4eoyWhPomYmi4P5IaEe/XY/xfEfaNEl6ESl41puDfvfAR
         3VoAWknP9S/lg7J/0sPVVB7C15WAhtNMzvGaq7Bqi45m+PLBauIlDGBikS3ohhUpLEnl
         cgKqNPa1h8yUzETTBE7SbE5qmfNRqRi8mVfxIH57EedF5PC3cy/rK9DtbHEoyq0M6CyZ
         3r2Q==
X-Gm-Message-State: AC+VfDxNA86MByTT2K32+ZmKlDY8QkIGvK8v9vPDYtM/db/EALjdbL0i
	vq6vJAwUVX/RwpHFqIupxWsf46P+kVaffZ4iEu8=
X-Google-Smtp-Source: ACHHUZ6b+THtxPksGqB7NfejvUSscrc9nACIvaaPTW2ypTct6ZfFy/dWI58bE/AsRZKwVf2/mXwozA==
X-Received: by 2002:ac8:5fd2:0:b0:3f6:c0f7:a5c6 with SMTP id k18-20020ac85fd2000000b003f6c0f7a5c6mr15011128qta.46.1687222636182;
        Mon, 19 Jun 2023 17:57:16 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id g6-20020a6544c6000000b00520f4ecd71esm202476pgs.93.2023.06.19.17.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:57:15 -0700 (PDT)
In-Reply-To: <20230519060854.214138-1-suagrfillet@gmail.com>
References: <20230519060854.214138-1-suagrfillet@gmail.com>
Subject: Re: [PATCH] riscv: hibernation: Replace jalr with jr before
 suspend_restore_regs
Message-Id: <168721242542.30028.8232901143224055307.b4-ty@rivosinc.com>
Date: Mon, 19 Jun 2023 15:07:05 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
  Conor Dooley <conor.dooley@microchip.com>, Song Shuai <suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_175718_253392_086D820B 
X-CRM114-Status: UNSURE (   6.29  )
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


On Fri, 19 May 2023 14:08:54 +0800, Song Shuai wrote:
> No need to link the x1/ra reg via jalr before suspend_restore_regs
> So it's better to replace jalr with jr.
> 
> 

Applied, thanks!

[1/1] riscv: hibernation: Replace jalr with jr before suspend_restore_regs
      https://git.kernel.org/palmer/c/650ea2a1dd96

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
