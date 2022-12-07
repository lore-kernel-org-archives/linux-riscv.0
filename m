Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64D4C3A5A7
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 02:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:
	Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XP2RbspZNa7gSSNMWi/eqrtXvQus0Ce+rBnKxOyy6aQ=; b=lm9mY7RYtcY/GM
	BOG0ZCHvAoObIeLRasKLbQ4nf7eGZtb/Dl4b7/cpaSJPRmZY/pQ/UfSCqnbV0C34+IdjXCPydV6va
	vDnCYY5GRAbmxyJKR/CF0egBp3/WxRIu47QqswE9r+QeiMxKqAe5dwz0TlVEzo7hEBued4xPG+xm4
	LDuQ0Iw+LjmzZ4URI/DVPg0xKQfjq8n6FKmbCjz5zDbvcPvp7xBhgCN6OeuO9PzSrpR8V8fMTuDSZ
	0uDU0OhzLz/Q36z2G/ALkCOE5m7SdVG2oTy6b2XIWX1+0Jy7vBSqIHQ31yCERBTsWM1cZczclHp0V
	voPt9rPiffkRQmFvth+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsQ-008KqG-Jh; Wed, 07 Dec 2022 02:09:38 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2jsM-008Kio-Ss
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 02:09:37 +0000
Received: by mail-pj1-x1035.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so118048pjr.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 18:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=CbWldWcTMLO8acSRZXLCDUkoVLBt22x2J6AeFwtNFY4=;
        b=s1X2kVKArj2tIGTws6oUw7qoIBNePTGyco+oLuuEmaL5oIGrcvqaFOhhNIKUTPrtcG
         CmBuUR5JjrwTxw2xnDGAjABi1on/JTmSkRhk6Q5w9SZV5UQtukHVlxTRlkQofavVsG/p
         JhcmcM3vu6oX9TaFL7M4AOG5FmLh5lLy+WpqeYX+bSpRC5bQp9TTccUfpIfQL+4UlTa6
         bvzU2/mc/WtWYXjiDhtyeAD/z4EwoctGnYtHjflcieSzogODycT2dtNHw1cXFhCrJnto
         /E+FInY7QGu6CA3bO9Zn3VQyU9KyRuK3iKgK7ybZojFcYrBgNp7dFcaEwPo0e6IZMXKS
         SSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbWldWcTMLO8acSRZXLCDUkoVLBt22x2J6AeFwtNFY4=;
        b=02rD6b6Tke3e1G/YoIngroB5TpC1awV5wuxpP9unGzLaj6+4WXchlZ5lGuxyluHv3c
         HKYYTwX9aq48FqD2jgPKTbfe39TA/WT0Yccx0Kp9aZgTELAQ8fXXwurRFfQKBttCd0Cg
         8ZFS0mJVGWPZdrZXZS4DRxHnfW5LMPtHA9ZnxK1HLN2DWGPMg65zWKNlYnrBt0CWq9uc
         /v1UEjE2w0YD53D9vRE1/KAsecQjTTWq00PKyUcDEatVbbuoEzRROmfGsgY3j6FkRqP6
         b0nmwyHiai6joFQQULbOFbS1QY/lduebhtgLjWIeO6LTTJlCPOqnnyyyesPrUKqy7eZz
         TjWg==
X-Gm-Message-State: ANoB5plL9QmHzKy6cRUaYzOWzFLNSowiVuwgefLtErhuvNkbugzXwlR3
	4zBdIbj9R8djXRdcoZUyxSqXTXmXE7l9p4Qk
X-Google-Smtp-Source: AA0mqf4ks+39PArQBYkgeJqe1IpVwB6dqEAvDNIzAEc7JYlLt0HWuo7JtaxikWfYpBGXLUPociGO6Q==
X-Received: by 2002:a17:902:6b85:b0:187:3c62:582c with SMTP id p5-20020a1709026b8500b001873c62582cmr72079556plk.114.1670378972183;
        Tue, 06 Dec 2022 18:09:32 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id f205-20020a6238d6000000b00574679561b4sm12332510pfa.134.2022.12.06.18.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 18:09:31 -0800 (PST)
Subject: [PATCH v3 0/4] Documentation: RISC-V: patch-acceptance changes
Date: Tue,  6 Dec 2022 18:08:11 -0800
Message-Id: <20221207020815.16214-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_180935_204210_52CA691B 
X-CRM114-Status: UNSURE (   6.25  )
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

This has a small textual change since the v2, but any change to the text
is pretty important so I'm sending out a v3 rather than just silently
squashing it in.  Folks seemed generally OK with it, so unless there's
any other feedback I'll target this for the merge window.

Changes since v2 <https://lore.kernel.org/all/20221013045619.18906-1-palmer@rivosinc.com/>:
* Remove the published timeline wording, to match the standard Linux
  policies.

Changes since v1 <https://lore.kernel.org/all/Yyn9FJ4iuzJTfO1T@spud/t/#mcc9b5e547a2ca2b25d7f78a4d2572f39ddc5593e>:
* Various minor wording changes.
* "UEFI forum specifications" instead of just "UEFI specifications".
* New patch 4 with implementor -> implementer
* Atish and Conor's Reviewed-by.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
