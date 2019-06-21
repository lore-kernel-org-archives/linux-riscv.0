Return-Path: <SRS0=JY4f=UU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8807DC43613
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 06:35:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D0D020679
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2019 06:35:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipQrhLMD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmzOwQgh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D0D020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=r2xFfDmgoYcbAxsyZBui4wmL2U9YK+YERqRh6RZ8AIA=; b=ipQ
	rhLMDaxlwb5pwUECkKpsL7Y1UeWkX7JdEKkO9pIj9LtUxLfsxruAx5z56vgEophv4ne4dcdwnafEP
	JoKfOIDCm1nOwiEU852HgaC9bxPjuLrAZ5g1XM5rYFDFDy+e1OtCvGJ2yvzkRcEv/KpdKIA7Dev3Y
	E7fZ9ab0NQ2XUdKtPsrmuXUgoKiqEJjx8HJzJl0KTDpt0LCPDW6+W+0xupYtjZEK11DjqbGRmg6rJ
	IjyKilN0zcq/bMna3XWtLb2vIxv0s1QSyoneIZWBE75KDtdAAzAjcHu15T8JoTAyDZkKNsAL/B8CS
	9rrYB4eTYGZ7LOrv8QxaqM9zd1KVReA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heD8Y-0005SZ-6s; Fri, 21 Jun 2019 06:35:02 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heD8U-0005Ru-W7
 for linux-riscv@lists.infradead.org; Fri, 21 Jun 2019 06:35:00 +0000
Received: by mail-ed1-x530.google.com with SMTP id i11so8489322edq.0
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2019 23:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=AJwOFT336pRewwqTK3hiA6FdgUJgh5KXqADy/U9ogLs=;
 b=kmzOwQgh2QIt+p67Z/QaPDUDmseqkbMCuJEZEcBDUcvXHozNQN0Mt8fU0lLCqOwhwh
 k5ONbf56jmZYGgzjhPRein34f/3ljy6felp5esNULTNQBNwWVgpYldeQ9co4edso2/NB
 tdWiae8haLGHshbEF0olcm8MRoVnDDw9sg+KThhDhUBtIKiEPVeL6m1XMgUqaz94Oaqj
 f/XNpyeWNoslEZ8KlLPkpxjQqnQrPw7gzEM57UxsJYnBvvUWFwhJCdg5SphNZmXUeENg
 N4kDjhZJZ0anOt8nZGizd3LJH8fobbtBalGAO3U8RIVdp63O8NPF8MUXy+8TWQE/u+Ss
 tffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AJwOFT336pRewwqTK3hiA6FdgUJgh5KXqADy/U9ogLs=;
 b=BP2+N7UzIIN4wv9Tj/UOQIByaqyuQMpokNZqcImEq0QY5nlQIfH9Ad0qFNpjsKwWYj
 rf6Ze2uHgAMgtU36LLeu60tRMC0JZMQgmFFdeiMWFYKZKa9CTVoGYMP9hEtebKe5dAEx
 +1erkX2CHUUTkHC3OAd/aXr31EPGuK11zu+4oY4wvoGwZbsF80CTHO3sAKIFxJxfxtFA
 9hRGLGmaRMg89z4TemT60AtBFizEC/ruxceREcFKfyAhIizTICAba/P5VvJRFCbfJojc
 tN/W+0khZeUxaCuhuYpE5WU3nALB5KeKAbPNBNFOLdgtKcIo1Zaidj8Q8l1CjRyxzAji
 7YlQ==
X-Gm-Message-State: APjAAAUm3NJuyyyYXVUeMv6kXG5GNguEX8+eAbMLPGpCP2QViTSHrIBN
 Q64fZIGFAyGVsxqtfm1vvJi/VKGN83rrctuoLwdWGIkp
X-Google-Smtp-Source: APXvYqwA6PfdTFcuhi1YgCs9J1MFKalMA4hmSphVNAdHrIxdxBisYKB6pJqP0ByYNjzQUJjMoRE3aQHdmwVHL9b5hvs=
X-Received: by 2002:a17:906:4f8f:: with SMTP id
 o15mr15191714eju.129.1561098897370; 
 Thu, 20 Jun 2019 23:34:57 -0700 (PDT)
MIME-Version: 1.0
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 21 Jun 2019 14:34:46 +0800
Message-ID: <CAEUhbmVqB+WpsZYbwLj4ZAAL1aESbNO_6roHdq=EfxgjDbcRTg@mail.gmail.com>
Subject: sifive-fu540-prci.h license (included from fu540-c000.dtsi)
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_233459_107644_6156F21C 
X-CRM114-Status: UNSURE (   3.74  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

I see fu540-c000.dtsi is dual licensed under GPL-2.0 OR MIT. But there
is one file inclusion:

#include <dt-bindings/clock/sifive-fu540-prci.h>

This sifive-fu540-prci.h is only licensed under GPL-2.0.

I think this prevents anyone that has GPL contamination concerns from using it.

Would you please consider making sifive-fu540-prci.h dual licensed as well?

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
