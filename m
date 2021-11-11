Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11178C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 08:11:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB68E6108B
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 08:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB68E6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UTBInwVv3eGEbx5InpxL31XGHOKbGkEQ9ejlITVPlUE=; b=ahtQSyusr2Zy4V
	Vsni5kC60GB4Xooe0B/avZ0/1hMAUWD/A6lO3k9CLr+vZ/JIrzCxQv1X2Ch9fKILFgeeTesECeFYw
	a+dWzysSupb1/ga40jZS8WMSC5uiwHUKE21E6EkXZNzqUQyo6hf5Rcsn0H1ESBTUtuo+KpMkU+TcJ
	65GTEzVCMbxyyrOpYfW9AAU98p8SklwuPj2jvnCIs1qDyVNxte83MjPqH7tAHodtqxLBAwK1lods+
	oFMCxpZgcw6HP5tdKsdGB3nZg5sB4YAtppaczT4XBX2Sqoq6GXKnnyFxLQjV+ma81q3O4wTHDzjXU
	QWOrg8V94TGQsRVVbWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml5Az-007TO6-5y; Thu, 11 Nov 2021 08:11:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml5Au-007TLk-V7
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 08:11:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id q17so5122410plr.11
 for <linux-riscv@lists.infradead.org>; Thu, 11 Nov 2021 00:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:from
 :subject:content-transfer-encoding;
 bh=yNSirYkAL0GzOeAjCmF42Cxqbkg2RfYhpsxeeXtqLVI=;
 b=YxQDvo5yFc90CR2Yr4v8J29xpd60ACrQ7o30IImtbzT1jzNeHqQVFCPFwpw2FMLuht
 dSkjp1L9TqDDfqI6N0VtElMy/1G//L/a3FJWQ+DK2W7C1kBwxxTp9S5+yytxXja0AhNw
 ZdCvPN6DiZ0Z9+6MXG33v7mDxdqXSlimO9IAJ1Xz9edFHYwZ3LBAEn6MGXB5/cBu1Lac
 ao+FUaAJX8nbzUYrv6laNFtbBDBmE66KSMzU3n+KIT7HcP12ZOitjEaYgY16qp1i65g/
 n0qN4tJNjEpE8vDj3yMQhuvJwai6Qx/eJ68bi38AXE4MYakUKcW2zsl5QiHQZm450nvz
 0jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=yNSirYkAL0GzOeAjCmF42Cxqbkg2RfYhpsxeeXtqLVI=;
 b=Usn2z6Xt7PanG3PF+60oE82l4n0JUlQ0NxZKE+M1zIIeJnDJTyc9Mefc9J1ZOUXLMR
 7rvWJwPtpnPZXWz8gA12x3N13ZzGnZZG4F/oeqEJ7cskQQKmcVwVE1PersKaebUtIb+5
 HYzSsPwXtOeMYm1zNNXLxoOByKl3pAaoNJgnGLIrbi0qip4vH4FYY77h+7hqCiI9Nhwa
 jsAgz3GwoaMU6cDlvYSU3BwT29ZhQT+uigHPnHv0rL/xF4pxOxtQEfvyzX68mngvqjbT
 KGJf4ypDrdhWGaryoFJ60tUQFbMLzQrU553PS+v8mjhMtnwbLVrplkenK5NiM2XseQU9
 TOJQ==
X-Gm-Message-State: AOAM533duY+H/NNBXW2hmAKGIXwPbflbi4yXIGlun21wQnFfgopwPtKk
 qGqI2b2zDhR5/a9EDTTzSPw=
X-Google-Smtp-Source: ABdhPJzTziz7Ws17oXahqJmAwC6rIUPyhjace0Jhpsp8QVUq7otmp8ktJ7zMefh5iXpKNc/Wrls+Lw==
X-Received: by 2002:a17:90a:bb03:: with SMTP id
 u3mr14361249pjr.85.1636618268175; 
 Thu, 11 Nov 2021 00:11:08 -0800 (PST)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id h3sm7598574pjz.43.2021.11.11.00.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 00:11:07 -0800 (PST)
Message-ID: <6ebbb5e0-c2bc-89ce-2cb8-4f537c5aea13@gmail.com>
Date: Thu, 11 Nov 2021 17:11:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Subject: [PATCH v2 0/1] __asm_copy_to-from_user: Reduce more byte_copy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_001113_073436_06D4559F 
X-CRM114-Status: UNSURE (   6.72  )
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


I tried building the kernel on both starlight and unmatched successfully
with v2.

---
v1 -> v2:

Fixed the kernel panic when the page was not allocated for the address of
REG_L and REG_S.

The REG_L is loading the data from main memory to register and REG_S is
storing the data in register to main memory. In these functions for copying
between kernel and user space, the kernel will not automatically trap and
recover the page faults. Adding macro for them.


Akira Tsukamoto (1):
  riscv: __asm_copy_to-from_user: Improve using word copy if size is <
    9*SZREG

 arch/riscv/lib/uaccess.S | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
