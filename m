Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A79EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5v4OuxpsdoyXV99khOz23TLMCsmDSa+sx66AU2f0eRg=; b=tyn2zsIU6A7Wt+
	BzZpDoFP/WJIT8ygeKdp/GeJn0LJOicPML5IxxRVgcKQUEpJsmXCa/KckJPajK5U9JBMa2rjO0/6u
	j4mptbNEB1yYkK5i0BptCNdWGiyCdnKkSU2CBK/zRzIgavCmnYatyOOjNugVLqtAhEnyOCp61lNyZ
	DwpAXDOdReCtwcGBJxwmHR5lKxvp85kOMXwOjdeJmX/2j7PVFPWwL0uroUYWWFhSpB3HNNaeoyH2S
	86E1wgmbisyRZtUvodR1wfFW57+23Kh06bs50GsDsHBhTD6e21eqXArKDLnO/XoW55eL4/Eyi7bw9
	I9SBBDqhtEpm3oTvVcPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBh45-00CBGX-0q;
	Tue, 20 Jun 2023 19:30:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBh42-00CBEx-0j
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:30:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b51780c1b3so39659675ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 12:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687289453; x=1689881453;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSlhmSL2kU9Xbi63wct+B70WsJdLHYOGLNkscGggduE=;
        b=flNLHVIr+QyF5Nx1TtqrBWSHkg9WFJWdlhg0ySaMqu1C8VEP09aNmL/u3czZfQJjPF
         YQfAhACPaswaYkR2llW4D0KiaDZPZfD1d6zybjKZPkybBIEvBku3+M6FfxJeqw2P6GaD
         FM9pdZdmkSfSyBJ0bclyVG4yh4R+4ev6VORg8zjrGTrr9+KPZOcFhigYnb0t+xwUWlZT
         LIgYvj/J7Af9yHevImDGlg/WBUPTaJ/G83zve8hzr4XzOPzugGvIlg1qpMDkv7ZSGHK7
         IrpzjGBqD68/DUOgWPzLK+Ek5N8EdBvIQry6W8QZJStsObyuTq9k+QRC0v5zMGXewp1s
         AlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687289453; x=1689881453;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSlhmSL2kU9Xbi63wct+B70WsJdLHYOGLNkscGggduE=;
        b=DXJF5+Cbn8VKu9vndHkjl52J/4dQvQ38leBMv3U2C3eOUhiSw8+p1Fpx+rs1XiGTKx
         /CyTI/H+zHXODKwm34I0psj+QuXLiGs5TVvc/ugwcwGHeKtozCl+/us1yasPTOLptfKx
         MKpYW1TlcUB/XndgrXxuRtedrL2DCO7YwohiDjC1JOvSO96eru5wYK50JY4fsFQBZduY
         w7/TFohepRWx7IW9dZfNzMVMsgVkD0VrG/62IJFnr60eK6FxQUOz9sE0MwQie3YzUF+5
         klUdpFHyUM3q9dS0Z7ilzIof59KUhvJefnPxbFZTmGM2kJ5B6tSorBS2VnfpiOAH2eiT
         hUwA==
X-Gm-Message-State: AC+VfDzd7J1sFazeOL5icGlUqKDbTQTcqdwWtDsSGo94QJi1sxVvFnrZ
	EalH+wiIDZB6K6Y93sXjqAOc+A==
X-Google-Smtp-Source: ACHHUZ6xHwg6uQ16euXDtpmFrxepvcbcTpjPEhdF6d8QU10aa+wOO+jkalRWbMhkjV6A1/gDwKjOtQ==
X-Received: by 2002:a17:903:2284:b0:1b6:66f1:35b3 with SMTP id b4-20020a170903228400b001b666f135b3mr6878161plh.50.1687289452723;
        Tue, 20 Jun 2023 12:30:52 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id im16-20020a170902bb1000b001ae59169f05sm1989478plb.182.2023.06.20.12.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:30:52 -0700 (PDT)
In-Reply-To: <1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn>
References: <1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn>
Subject: Re: [PATCH] riscv: uprobes: Restore thread.bad_cause
Message-Id: <168728927546.19726.7304186466225291370.b4-ty@rivosinc.com>
Date: Tue, 20 Jun 2023 12:27:55 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Tiezhu Yang <yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_123054_264909_737F9247 
X-CRM114-Status: UNSURE (   6.81  )
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


On Sun, 23 Apr 2023 09:42:26 +0800, Tiezhu Yang wrote:
> thread.bad_cause is saved in arch_uprobe_pre_xol(), it should be restored
> in arch_uprobe_{post,abort}_xol() accordingly, otherwise the save operation
> is meaningless, this change is similar with x86 and powerpc.
> 
> 

Applied, thanks!

[1/1] riscv: uprobes: Restore thread.bad_cause
      https://git.kernel.org/palmer/c/58b1294dd1d6

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
