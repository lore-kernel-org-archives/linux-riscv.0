Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77C2C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 03:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YkqrzckMWh4OvmC5MRajHn5+yGIl3J4Q9j7VBAP206c=; b=eeK
	GyrSdJM5+iC42DoedMQkupawyQY7Q26kWjQIMfmIuPGt/srSYIlkuJH9eJoargtVk0v14jo2sxrEU
	gAZ86D9oe37ORaZM1tb7YlM+vgmCcWzCZwmbG8L8/qb5h3gi8z1R6B8QaU6BIgSKfCxf77cccjNYl
	3U0pY1QFuJNrRMdabamQWoiqzEgnL3WTljUOPr1tsR4PIkahQSd38U+p8CczcPpr7A8DRip4uelXt
	CmoMh8WZ/EdN9WwnYGqrSxDySPXztq6KIbmt4ujrgiGOeOZoRetKoTflpVuHujcIP2wyQGQFtjZcJ
	Me5W0c61z9D4RKeC7+fWcGL7BmS0Z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZOD-000dhw-OU; Thu, 02 Mar 2023 03:13:53 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZOA-000dh5-NP
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 03:13:52 +0000
Received: by mail-lf1-x129.google.com with SMTP id m7so20359494lfj.8
        for <linux-riscv@lists.infradead.org>; Wed, 01 Mar 2023 19:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gy2spJrRv8c9pxvMpe9hjScocqIfMnsVlwLx8hf66zg=;
        b=o8blclsJ4xN3z3mUuU1n6y+tRFLmMFBB/JQt1tdXgTSIImTFGTGXv9a3bjLoHTVtzp
         wVo4izX6jFp1PsNFHxm8U89euT3Cch6pVmFN8/1+yPTpJ1NhuJcU/7V1PwesJ/zmSH/8
         E0kdgOedqDmvFJyk4oFnHYWmsAIz09SsRHjbXtrjwErhmhqrO8+Cj8vGyz6i4FX2OPV2
         v6ARNOgAV55KBHguWrwmisrO/3GSmNLXo+mNQb5AwgG/BfWN2MtlTEW80TNqdrLQtPSC
         Xu1+pMxjiaUcxU3BqtRMWRWQF8GistzcejdTdCPd05czMCEFeJt6ffbsHUTrq/FrQYQb
         LxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gy2spJrRv8c9pxvMpe9hjScocqIfMnsVlwLx8hf66zg=;
        b=FeEKx9EiFXLYleLHm21NTuC0dWkjJYxBexFXyQad1+Vhkg+IENf8bKdqh4QRkkipzi
         whTdRLCyQTjydj0uvifsUmPOqfdXDDn9xBya+7t70eq21NgaIJ46Qae7+kmP27g3uA29
         r39Hv03VopH7y9jpF3jzaoxSD4C2NaklLo201S5/udEEX9LLzNeW9391DxsWmEnwv2Ze
         4/lK3d4wseM38DJLOHh//2yuvb9XetK/X+OvqBUXjUJdvVKbkqugmed95ST+2krZ9cdF
         y1GugGvjLHz3FQE5ShzyRnKZ4BTqkPtXzqy3+rHWeO0ZRz+Ilq4CoxhjYcxQfxPc80Uc
         GHWA==
X-Gm-Message-State: AO0yUKXOD7Lh/S6XSmkzhxN0Q5OMrYH7WUYKXSh4AaAEwOu+SY/AzujE
	W36uNi8uVbB2qUoS88ow7le3WmlzSmFsFu0QH/UMp4W26V2/uVxd
X-Google-Smtp-Source: AK7set+/zQLBRR+V2DudvPvpx0fnrQGnH596TT2OL5Y2yanfAhicJkFrnP9+SvvzTeRfLDx9D3DXWvDaAGLAqW8YiJg=
X-Received: by 2002:ac2:4c0a:0:b0:4db:f4b:a552 with SMTP id
 t10-20020ac24c0a000000b004db0f4ba552mr2567391lfq.13.1677726827840; Wed, 01
 Mar 2023 19:13:47 -0800 (PST)
MIME-Version: 1.0
From: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>
Date: Wed, 1 Mar 2023 22:13:36 -0500
Message-ID: <CAD7mqryyz0PGHotBxvME7Ff4V0zLS+OcL8=9z4TakaKagPBdLw@mail.gmail.com>
Subject: RISC-V Linux kernel not booting up with KASAN enabled
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_191350_815960_B8EB2E4C 
X-CRM114-Status: UNSURE (   7.51  )
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

Hi All,

I observed that RISC-V Linux hangs when I enable KASAN.
Without KASAN it works fine with QEMU.
I am using the commit ae3419fbac845b4d3f3a9fae4cc80c68d82cdf6e

When KASAN is enabled, QEMU hangs after OpenSBI prints.

I noticed a similar issue was reported before in
https://lore.kernel.org/lkml/CACT4Y+ZmuOpyf_0vHTT4t3wkmJuW8Ezvcg7v6yDVd8YOViS=GA@mail.gmail.com/t/
But I believe I have the patch mentioned in that thread.

My kernel config:
https://drive.google.com/file/d/1j9nU7f9MxCc_i-UHUCTvo7o6nDrcUz0w/view?usp=sharing

Best regards,
Chath

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
