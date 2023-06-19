Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472EEEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 00:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RY5CZF4Ut0vmgixPs+Ter7UjxZX0Tsr7b/Mx1jLhFVk=; b=AY3ZJQ/eAgubSD
	Ipc8+ct3HEFODPaGAydbKiaw8LD2g4eVv4IIYzYSv6jCE9VC2gyCzt1uMkPMj16WZHnegYyuMpOyA
	b6nRITG1xTYf4EM/GRCy4+ayZQmiHumQem3b5MxFvxCW1cPg5S21qqPyIqQW/NfPbxH7eH2q0BqUD
	/agNWIHTkVQyIzyENZitY3QA5mnfNlJnwgNSYhLb3Xra4HIYoNa5WbF49GTeg2fu0Zt/mXS6LYnDt
	HTpg5UoGlad+6LbQCGuAJLQICS7XbOWWdt9H9GajlY33YYI/xpqxEdmwfaOQaBJjSoGmD7lF0rzIQ
	bKCbm0OJQqzIs8kj+DOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgO-009ok0-0V;
	Tue, 20 Jun 2023 00:57:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBPgJ-009ohD-02
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 00:57:16 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b51414b080so23045555ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 17:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687222633; x=1689814633;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RK14squCbeKoPsCQCR0H5ZCdDbV/RMCZJtq71zSTXQ=;
        b=21fnqWgsivoPu9rVVu13g1NozEOC2Aw60tqpaLkpDW/7a3y6aBglsS7Y05USC3Qdtj
         BQa+iHeWLk9kIZz1YF757OeX5SUJm8wioxsmm5S4V9OKB0MqoAS+xr0yzCZ8tw1lX/MU
         jD2QGIAgANvUjYGboAwy0ChPEj0LPdAYqdaCSIOJ+pKwhBf46a17i/rvzZENMXKzGGIL
         Ir+zn/2d9d2NV23a4ON4tjGaNW023LM9yYdqB2Hix59ldJmzYEoJJSAY0npF55CuYsE2
         RqnvtO7IvRVbhdKzpBkCHh4dOMExw6Fp/89wxjoa5lP/iXDJInYVIdysXhfkqH498ga5
         FaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687222633; x=1689814633;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3RK14squCbeKoPsCQCR0H5ZCdDbV/RMCZJtq71zSTXQ=;
        b=fpE5rNs98MWk76pZQvEo/2lkXFzOB1M8CV4Ujiget/KI0rrQk1u/Hz3Vq4V/HMLZtR
         k4x4qDZkbazF4V2Mo90JDwRuXmI2d45gD9Z7TkWNj0PIQmrPUWUKHQwijoGswxkK+v60
         noBc7hrj8DyazTEVrvocoxfTJT7vhXiMkuXzwabKndkUmSIFMtt3IZ5AbdTprZDxHeHH
         obTrbs3RoEbnQnnRWUvlInad5jlMoND46ClzJPMLxp6Uaz2QKV56zbhhm4MjXfKQ+lbv
         oXsLgF4r53VgKHtC2OMr8LzXiKgC00gp0btmz+TI3awDEQMKouayxxwcJaTikNtoGNDo
         rz6g==
X-Gm-Message-State: AC+VfDxVvZxItBgwmfFoJjkngbxGhe1psLoi+HaTbPa30n4WJrSrjdIF
	ol8FTOdGwhCWJDnYMcL5Qv1Mjw==
X-Google-Smtp-Source: ACHHUZ73e3iBxEqeqetsDPuLqMIpgpyjHLt8ZyiSfI7jt9pjhl2Rqk9kjdT8KjaavMeq54ZJXcfT8A==
X-Received: by 2002:a17:902:82cb:b0:1a6:4a64:4d27 with SMTP id u11-20020a17090282cb00b001a64a644d27mr9032008plz.40.1687222633564;
        Mon, 19 Jun 2023 17:57:13 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001b3df3ae3f8sm343920pld.281.2023.06.19.17.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:57:13 -0700 (PDT)
In-Reply-To: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
References: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] riscv: say disabling zicbom if no or bad
 riscv,cbom-block-size found
Message-Id: <168721242537.30028.15869183331657098513.b4-ty@rivosinc.com>
Date: Mon, 19 Jun 2023 15:07:05 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>,
  Atish Patra <atishp@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Ben Dooks <ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_175715_050239_A52642FE 
X-CRM114-Status: UNSURE (   8.12  )
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


On Fri, 17 Mar 2023 13:45:12 +0000, Ben Dooks wrote:
> If Zicbom is present but there was no riscv,cbom-blocks-size property found
> during the cpu feeatures probe, or the cbom-block-size is not valid, then
> the extension will be disabled. Make the print explicitly say this is
> disabled to ensure that there is no confusion about what is being done.
> 
> 

Applied, thanks!

[1/1] riscv: say disabling zicbom if no or bad riscv,cbom-block-size found
      https://git.kernel.org/palmer/c/c818fea83de4

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
