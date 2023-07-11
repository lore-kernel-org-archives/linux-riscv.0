Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38A2EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Q3r7A5Y/uYLuHxMPmT3HiEWicclP1Zph2hGWwGsf14=; b=KpqyCCd3BanTYw
	RBhxw2VlXITg9Fl+E16KBkKwuVP9QopwAcIrCADYisS5Fw+aJQ+sUN9829PrPXdrvT/yE680kKHXe
	ufsBtrpLj6ETUMbLn9Asd60Hh/mQhwI5pmZvd5XQPEI2QBxOWdMvZbb8qOdESaxhLGBTbf38cHAKH
	l1D5nhXyW5qQCl0x6rw6+ThmSRP5otx37qFwjq1DcPQlrcgZDY6TYbglo74yXH6p8Jdss2aU8O2R/
	3ksU+V0Uf0y2zeHddXPKdbOeBzVMBXyu8mxYoamhOAbNBBDBNmfyc5MzPbR51XFTQK7j4lMOKwbiS
	Zgh/zStnqmY7juAVsLag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDVK-00Ezap-2Y;
	Tue, 11 Jul 2023 13:34:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDVG-00EzZY-35
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 13:34:08 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fba1288bbdso8357006e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689082441; x=1691674441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qN8Q+JhIAZh1V0mpeTmIC5QOKGMEQ2W1clMbASVjbLM=;
        b=BbpzShutPyBrqeIoJORso+sXdXknsiz2pVP48UM95hQnRySnaZpOOjBKcBIoocSIu4
         Algif1HyS54jAHNKOFHD6kXB39V27U6QiFz/cwn3qaHH6ngGfnMKxgdlk+YF1ezmj95J
         8mUagbbofTzHYE4yMkLzeKAg12ifkJRk741ndAsFUa9VvpdJK9m/CfsSUxc/Mqw/OxWx
         IheEfQqAeD7MWLkT2UibIdU07+mi6Hj4vHUhukbnkugAnlmRJgR4Ydo+e4j/3e5wE+1E
         +1AD53D4uZULQ0hX7nG/qDRgqj/+TVkBSB4KUEsVbRycACh7Y2BPY3kfD7Kak8pimxGo
         eZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689082441; x=1691674441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qN8Q+JhIAZh1V0mpeTmIC5QOKGMEQ2W1clMbASVjbLM=;
        b=dv6nyUMBkSY/YMlbrTEc4gqw2tb5rc65SEyAFyTfG49jY6NOfBNlVttbNIn5vEev5o
         vAEPUuDZaHovDvhHIJv17Fv4ERqC9xhYqEHRnGP382KThZuFeYj63eSRnAJUalsT5q6w
         CuMUMImfa7JoHOmh/ftVpmB2h/PjIxFZy3WkQdtJD3s/QRDPPZwq2IIxZQhN8Ki+aqvy
         bQP/hpuPSAQ2oFStz6hYr5CXgSvtVMFBSZ4jwyWdlmxQpB5XxzOB7HjHvcNQA52NtXlY
         +XZpRPJnN6hXgEuV97VF/GXgsI3t6fuSURJPbnN0KhbDk+RI9ld5adX5dQnpNQiF92Fk
         Wphw==
X-Gm-Message-State: ABy/qLaqGFnBYtQCPm4PVBEsExEGV/+idMj6jqRboDESmocejMqfoEGe
	xjVzeCbTCw92t6wyra/C5Lw=
X-Google-Smtp-Source: APBJJlGRVZBwQlFNC+2pI9O1NHH7DgBE5TQjOppzT0vddtCbubmYb+hEMte4IF3+mR+Wt/SMdksv1w==
X-Received: by 2002:a05:6512:33ce:b0:4f9:596d:c803 with SMTP id d14-20020a05651233ce00b004f9596dc803mr17001670lfg.53.1689082440726;
        Tue, 11 Jul 2023 06:34:00 -0700 (PDT)
Received: from andrea.ba.rivosinc.com ([2.199.74.220])
        by smtp.gmail.com with ESMTPSA id v15-20020a056402184f00b0051df6c2bb7asm1276862edy.38.2023.07.11.06.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 06:34:00 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH 0/2] riscv,mmio: I/O barriers fixes and cleanups
Date: Tue, 11 Jul 2023 15:33:46 +0200
Message-Id: <20230711133348.151383-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_063406_995856_9152E3F7 
X-CRM114-Status: UNSURE (   6.34  )
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

Andrea Parri (2):
  riscv,mmio: Fix readX()-to-delay() ordering
  riscv,mmio: Use the generic implementation for the I/O accesses

 arch/riscv/include/asm/mmio.h | 72 ++++-------------------------------
 1 file changed, 8 insertions(+), 64 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
