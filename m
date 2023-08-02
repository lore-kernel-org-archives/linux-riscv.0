Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EB8C001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=LvEzcr8ZueLM5rtwNCwyATbuQfoQRpQsx2e1FntdySo=; b=Npk
	i70pJkhQ07CorK3FqcxD/9AXS3wxQY2sIdBk2p4uTqxzQmXQ5G1Fsr/OtNWhrGFP50RZBS5lftFHC
	1mJ3tFFi3w4ogHpQSTFiAGxbHRnACoJYCqpFAZxliAGtgPV/B0KFedhNkKT3dJ8Vd2HVc8aSpfV+o
	8dKLQT6/ykD1q7+hMgAm+ktZrmDWeCDvzIy91YI/DTjZh5PCArSamVBo5P/BiH4kR+iNkv8swOSdP
	Qvz/WzzWcVK87gZRzgHRhWuVNswBX6msoc5XgEuuW188O3xFvLsId7oMBiW2yoGlMyDKu9KcWNuU+
	4icJ7JfHDaGtH2OyY15DuszNFyQ5+qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRCGW-0051L6-2s;
	Wed, 02 Aug 2023 13:51:52 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRCGU-0051KT-2u
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 13:51:52 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9ba3d6157so106114731fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 06:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690984308; x=1691589108;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iYHXuTq6JA9sdszLQjK/2FAnATmn+MPHQp0NstlHDjg=;
        b=N3gb8F+F+9+mn5uHp3eGC+K6xJDnbjXPCiPokZCXy8no9VQDpJ6ASU+aFy7v/uQ3eB
         HbmafPa6+L6nv8t95F8NiqHg/0pakX/7LXx3jyXwz95QRAkYs4z+pDRmihg4OAwrWMhX
         LoY+7mv8hrASFR6e1oQVycnVkrABOgAPPg2ny0s/xk8QyweL9DZQ7LnCWphCJX7su81B
         OdgyXyAyq2qFkki+JGLmTOBEpPrg+9shT69g9B93LLaQhMt9kCY+qq0v6fskPGGuAJto
         6reTWhlN4at9xspPvX8+B/ZgvmiXunBMjR5AmZNURUeFC2s6KNwVjfrK2VeyVs/ME0Ql
         tFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690984308; x=1691589108;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYHXuTq6JA9sdszLQjK/2FAnATmn+MPHQp0NstlHDjg=;
        b=geWsmJB6mptpKC/W4f/7E7PcWsWrz4G/ZG2/uVHaTooaYUHtFWDr2AUpLsUgEhUTqj
         cqtUzJRdvYvHyn4EMGtUX3ACnWZBlmXMUEv5WOrNTs3bewEU6MYbWAuwVJ4lJ4A30FL0
         QddWvDtsacotL6y8WcIF8T12OVSf6cl6nzQGoFOzR9Rdo4JZJNd1AkDj2QmIytL5wuWo
         5d2ibH1cvLtDcaNfV5/rBSwc6mh8JcGx+qI1M/FOKWZttsl5e1N7lAQLuDvwNiGP2tGA
         a/xaFJpX/xgUz7EAVVjLqZOca/Uywf3u+F+o3zwQqyGFpdJJTUMynRV9MPp3yytgZ5Dy
         VzkQ==
X-Gm-Message-State: ABy/qLZ1ei/x0uBLHLe7v387Y+nSPCzFPogIxiaW7oMLetvdGX0uT2kg
	+OZFs6LAmxF4g4CT5LlFDUB7L0/NZPj4cR9PXieMK8SR
X-Google-Smtp-Source: APBJJlFWtXqWkAT57ThwyLsU6elz3hHJ+j3RmtOccDAiV0pSY+rU6s/BiayABpOeKi8Q4zSIu3JIq1179iXfqPcCR8A=
X-Received: by 2002:a2e:850b:0:b0:2b6:9f95:46d3 with SMTP id
 j11-20020a2e850b000000b002b69f9546d3mr5275947lji.9.1690984308318; Wed, 02 Aug
 2023 06:51:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9cd5:0:b0:2b7:787:e49d with HTTP; Wed, 2 Aug 2023
 06:51:47 -0700 (PDT)
From: Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date: Wed, 2 Aug 2023 16:51:47 +0300
Message-ID: <CAPm8-H43P4WrgibV2MGNFZt7ommkchAeom4m0Kt3N-CsG6D9RA@mail.gmail.com>
Subject: dts - linux,usable-memory
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_065150_936783_898E46E0 
X-CRM114-Status: UNSURE (   4.20  )
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

hello,

  my name is laurentiu-cristian duca and i am an open-source enthusiast.
lately i have tried to use the linux,usable-memory in the dts memory node
and linux freezes.
  if i use only reg, linux boots fine.
  does anybody used linux,usable-memory and can you show a working example.

  here is what i tried
        memory@80000000 {
                device_type = "memory";
                reg = <0x0 0x80000000 0x0 0x700000>;
                //linux,usable-memory = <0x80000000 0x700000>;
        };

thank you,
laurentiu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
