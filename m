Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CA4CE8D6B
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 01:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwadprVhrpZOU3mpNRSwrqo8ooGGzhxVVc3O3Feb/4k=; b=lDoKybJdK0zklw
	/QFf/d8PoCBTY7xFtl/X00+bitMypdxK+oc3dBLVuwpmo5Rjk9hEoONs5kgsc9Q77z24CkTjhatwu
	jDfKsfE0MDjfC/76HpkF83ldi80PdqEoQlxEWkS7LXgpH59oAxQ29JtzdDAHICSKUIGs358toOVJy
	A1mBX/0GOlZRBA/AEaYwoCLqVDsYPd2vInKQPw2IUKjXoZk2+H0LMncXPF2+rAi4Ol8YF/Wm/cyo2
	OkBFapkVuQwLUKdbPS3PWwbWj5Qib2G10w/Fr/lRSSt2h2vXhyfv5mBLFQWLJJiHNW4l8+qFkdjxP
	AQXZG8M2MrKouXzDZ4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLANr-0000000H7Wa-2lEV;
	Tue, 18 Nov 2025 01:19:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLANo-0000000H7W5-2Rrq
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 01:19:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-297e982506fso59575665ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 17:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763428788; x=1764033588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JBgoq+z6jGecNEGkZTUmDc8yTXhWwsgJ8qD9aHwpDI=;
        b=l212GiQKMSRUfnW25iN9pJSvbbSvTKhrlahQMJm5c7t/iHk2N2srG8NaABU4B0wyI8
         NaezQ58P4XYyyPrUpZ2ng8SF0MPIwo/NcDVxw19QCB7CRRANI5ZFF6Ysrp3NiLL302Xi
         bpKfc5y0KVBYlHErmmZ4aIJ0QuKujm9kgw67cGETpZ5X9oKP5mjVCj7FMvYg/1hvGObC
         ILj9ZPvPDqQVNPqEuH8m8Wqwe4bUeNbZGMMBYyaeYpVZOQUA02NojZJnP8v35GIacUzs
         cMlq9nOuqhZ7HYc7G+FK26qShtDDO1Pq85U3fczj1m3oVbnp1c3Aag7Jvg5jrKnsAZL8
         FDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763428788; x=1764033588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JBgoq+z6jGecNEGkZTUmDc8yTXhWwsgJ8qD9aHwpDI=;
        b=sAlA2eM+QWiPxy0WAYBWKVdvklZorSRrluNV/5eQHyIgzQSvXBr68V/hnkVdlkG0dB
         TJZZpAahIYVmzSmPssnHgPNa2r6Utzx1oKg8tct9C3qabpwExS8L4vl9lvZ/RGFNODIP
         d1xsair/uF7Zpwav0YAjzbST0eM4SIt5AXStFhMOT0BFokm0B3DdQtJkcyr78/oOlxos
         CJDNQI6dJulRPd8eJVrUCTdAzYOVYwtGtVSQhW1NawkJvA08jfdJa0QlE/EK12kQRKU9
         G4kj08tU2bUDn4dq4d+9XJTjyMby9gFrD5MY7XOTe7zt+Q3vW19dpxeC3d7SLhtwEbfs
         QK5A==
X-Forwarded-Encrypted: i=1; AJvYcCVciwoCNmphDFqSx7+7EfdeTPJiB5P5jvGzkhP1xFAGbntEmxn8Oc4JgffmRjhlZ6WBphFOz6EHcoT5wA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyOIdjMaRm67sMgtRCVe1C9xKDW1/61Sjy6FiPEFdHNoPhUALl
	gz1KIK2jOKD2+bsOKhIPgVXoKBnhoT826iWF6qGukcmbPDYRvsTFMmwM
X-Gm-Gg: ASbGncuJU3Y+cAlG1nnmnLIPd0jy6aWp83HsUop0pkx+8zcx3OBevorBqH8hVHB/57c
	TDEKrTQVxF4cEgj0UoDJAOWNZT//6yHpuWUioQTMB1jYTChW3slIEixOIPRzFIAYBSmed877tYr
	fdyf197EUK4ByZkbZrw3JwbEu2v+5/2a2bp64WXJblle0b2O9YuMptE0iywVvKUUtKOlbmMPixz
	InFppTr4Y4UywYEcXizSN4u4NPji+OSxC7gpncHjQks41MW94nUHbl4mlkSo8jt0msqafMYihrt
	DwGRiVNh+uNL/+1ioEL7HUjA4TnVEzlGK2pqiWqqnMJF9coVpvKo9tSKDP2FWtaePNmgwGuKJfO
	G45i+GuimLjPivbE9d5sCKo53//PwpbOXNvWBOqOlawa4IrvaqTpIwcGOVEe+/v76oIRzXzHpUh
	8bxsI8JyPYMhd9TwbHJKVG0j2ZjQeIwY8=
X-Google-Smtp-Source: AGHT+IHAlVYCgwLwhG5dvCsbxSy4/6DoRbKsslM0o7aXrisHTVE8SaDF04sXPQlYXdqI+lq/6xvytQ==
X-Received: by 2002:a05:701b:281b:b0:11b:9386:a381 with SMTP id a92af1059eb24-11b9386a5e1mr2777708c88.48.1763428787615;
        Mon, 17 Nov 2025 17:19:47 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm53255982c88.0.2025.11.17.17.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 17:19:46 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 0/4] Add SPI NOR DTS node for SG2042 SoC and boards using it
Date: Tue, 18 Nov 2025 09:19:12 +0800
Message-ID: <176342869620.638242.11529006624321296909.b4-ty@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
References: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_171948_626603_CE1A70A0 
X-CRM114-Status: UNSURE (   7.70  )
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

On Tue, 16 Sep 2025 21:22:49 +0800, Zixian Zeng wrote:
> [PATCH 1/4] and [PATCH 2/4] are copied from patch set [1]
> [PATCH v4 4/4] with content changes:
> 
> According to SG2042 Pioneer and SG2042_EVB_V1/V2 schematics, SPI-NOR Flash
> cannot support QSPI due to hardware design.
> Thus spi-(tx|rx)-bus-width must be set to 1.
> 
> [...]

Applied to dt/riscv, thanks!

[1/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
      https://github.com/sophgo/linux/commit/59dc89fdfe0bbcce186116651bd017cfb9f70fc0
[2/4] riscv: dts: sophgo: Enable SPI NOR node for PioneerBox
      https://github.com/sophgo/linux/commit/f49314cbbc98f9ab2bf4eb82ccacbf79f179db6c
[3/4] riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V1
      https://github.com/sophgo/linux/commit/11f4d84c9f724ec4c6810567d6b9713b054bb28b
[4/4] riscv: dts: sophgo: Enable SPI NOR node for SG2042_EVB_V2
      https://github.com/sophgo/linux/commit/af5eb17ff893bf6e52680a31059e1816749c2d20

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
