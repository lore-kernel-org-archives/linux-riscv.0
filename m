Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B33C28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 20:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wEPwc6h9ihcaESrlm/w5pnirNMYNTEfTFfx5xyOsWpo=; b=4oteQX0mtTbJ+i
	EYT7ee3b9Qm5bJ4yPbH09w3k7x93CaVL7C0y4iHAIQPc4JfaNceT3qkzVjF8Rv7crXaZLw/8Rl9ps
	uZIhNqlxIP+8Dw2HYh0I2qy5eeV9O+tRLnKQZu+NJgndGyUCznyW5maNVd4xN448By6VTpr5sSBiq
	e6IadAqUO+eI6YzRNN5B2adUMps0tDuabUaGqUSKnk2gcxxMYA97rhqwtjHwfrb40WOOZfkbMXIh7
	lV013FxwuIG8PjQ6gEPF4leVQyxqezmzPbKRzAEGvk24KJPUWV6zgioXHhd7DIq30Ya+LOaRBFrQO
	1S199snMY0Yemkpbbm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyz1a-0000000Gdl0-26La;
	Sun, 30 Mar 2025 20:12:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyz1W-0000000Gdka-32a4
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 20:12:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2240b4de12bso44221845ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 30 Mar 2025 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743365569; x=1743970369; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vhb4LT6KQWXG3zGa3NfUUmWT42ubKxYSBSNseCuqZQ8=;
        b=lO4SA5vMN3e37X3zVcutIFsyVIlcOWDf25+UZYYFpWrDg7hlU4HJbHhhfjog5j19RZ
         zOHF0z3HrMOWGE7CO7aqLqxOVQmUidWEFtQHzqdp8AkvejRPklhxTaYdiSOb7OirG0Rq
         yrfG7Yvxbc7RZ3dsN/rR3x0HtNQj+55dvuP+7loZgpGy0cgdXyh7jomxmCG9oQZu3kNm
         R51fh6X2rG6ZQu3in4fDUvj7piRX+sqrRUa9MyVTMxikHL/sbQSDQoiWjlUuguhbeZl/
         AIYNoEwnaso+FnzmnBw4R9rXLvSJt+k/I3mblAhnplk+tVTKyHlDlYTaggWmfEmC1z56
         98Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743365569; x=1743970369;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vhb4LT6KQWXG3zGa3NfUUmWT42ubKxYSBSNseCuqZQ8=;
        b=RrE21UR5wZxLh7S3Ec/4Yogz0bFNaffUgGrpyA/B384X17XuRHDt69htgk+FHWPmuP
         1/iQFVAuYPfnC164luV0OD/RTfN4xdeHSxxl5wuwPq22K1i3BA++iZcBeciVrPWHwrmf
         rPSeRtQHF0RN2M32RGrx+/kqzdS0dF5oqWYaigV7TmTrPxxJTRLBOarexmSdpXBX7yof
         qxpHfj/QXxg9Uu2D56cA22YYo44Uy+EL+7KYOr0sFFvEnO3ppusfkyQ9B8Tsm2gcdtsC
         LCuaLiTOBigEkurb1GDCdkAAS1NU4DmXpUg11z912mX8fdQkB+/NTVmOzCCQ98dOorK5
         0CgA==
X-Forwarded-Encrypted: i=1; AJvYcCWNdZqeFGAIRU+o9nXVRHWGT2/2iOp2FrjUitCP/lU6+PiMgiKcFZY4usvTsEMKmWkbukPxzF3Nsbil9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9dlxX7fTGriWAJ6GPuMu0jiRthg5Z+il3P4M5dPS+eTo/0bvR
	ZgSp23NODSL5LOSgwNjo+m1h5Y5HeKoIEuEE7IZAlKW0WdqufVLE
X-Gm-Gg: ASbGncsM7DfEFPLiaVnSH5r+p59Zx2JQtJO8RASX0oOcsUZc8RNvFL+m+KicsZblZtZ
	LT7cGhDX5Co2v0qdAvm0V1xM43KRYm7zPwFtYHCy6B5tZGHeBEo8deFyYq5cWeWSz8G7vcuLssZ
	qoZi8ajjXgygK3I0TopUVlCbQMxpzkCtn9orDkQ3rC9yHzQclj+dYgay/Ziq1i37rM/HNuwFnU4
	RqF6ENiLM82fiiCF/UTciojoCzqi5l4nn4j4olgm8nqLwyTKWSp0kJJUXaDEB++USscdfVje6oD
	njcN0CFb4G1zRqE57YVADI5ymcf6+A3SzWbyjlrqjmrcT1XaXw==
X-Google-Smtp-Source: AGHT+IF/x0K5aX2kTh2Wm50DBGGQO1b046arFWIUjKHrMmPbur7FoU4pZm4minYgXwVl1aTeQwvC5Q==
X-Received: by 2002:a05:6a20:43a3:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-2009f5bbad3mr12328737637.7.1743365569477;
        Sun, 30 Mar 2025 13:12:49 -0700 (PDT)
Received: from [192.168.0.33] ([136.24.137.112])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b8adb70sm5132840a12.47.2025.03.30.13.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 13:12:49 -0700 (PDT)
Message-ID: <32a55bf7-ffc7-4383-ab61-fd4d75f46b3a@gmail.com>
Date: Sun, 30 Mar 2025 13:12:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org
From: William Pierce <wgpierce17@gmail.com>
Subject: [BUG] Module load relocation hashtable size can become huge and
 unallocatable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_131250_773215_AFA31D34 
X-CRM114-Status: UNSURE (   5.38  )
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

Hello, I have a kernel module that requires a huge number
of relocations upon loading.

On other architectures, it loads into the kernel just fine.
However, on riscv, while allocating memory for its relocation
hashtable, it ends up requesting 2097152 elements to kmalloc_array.

Right here I've dumped the values by recompiling the kernel:
num_relocations: 1630985, hastable_size: 2097152
https://elixir.bootlin.com/linux/v6.14-rc6/source/arch/riscv/kernel/module.c#L734

which kmalloc_array->...->___kmalloc_large_node->...->
__alloc_frozen_pages_noprof can't handle and returns
"Cannot allocate memory" on insmod.

How would it be recommended to fix this?
I could imagine allocating a more discontiguous data structure
to track the relocations or otherwise reworking the tracking to
do the relocation tracking inline.

Thank you,
Will Pierce

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
