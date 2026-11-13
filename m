Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A977D606A323
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H/l733N0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cmVLAtvR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1/b3c38nR8Z3xMY71vWyKj3KaYdbko9Zz1/3ILb/WrU=; b=H/l733N054yEU7f6DkU1PXVBQr
	1jOQjZWreTKCNYDGEetr3KB9oLXWaYaVij5Ke9IWbdZlKv+tr65TZV8JWvi2x6ijtLk31jj5r/D0y
	K308/AkNb73VrJzYepgo+Mh+Hg7JWRf+Uziv7NIkIFHLV6cYpLACAfdE+lSdLCMr00JgPSlJHPz6/
	MtnFg98KoUe1f8qz8imziI62TAddjSvoGKH7ZakD0o3XxyFzazXF0c4yTWBrVVrtlOGzNZJG4AC/H
	v6Qp+dDZgslBKfZgNPGZsV+456kqZFSUf0sohBKG4bIyj93C7DlzQjYzW7coAHQeyppt055TI4Y2Z
	/EHwm5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqhE-0000000CmQ3-3zcd;
	Fri, 13 Nov 2026 12:48:00 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqhC-0000000CmOd-1OfQ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 12:47:59 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2edcf6c3a57so1434125ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 04:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794574077; x=1795178877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+1V56suEOcrMa2DtNDFiSwLo3XA/LJsS2pjnPnOvVY=;
        b=cmVLAtvRUUDHoPxz2QPbzxN8oN5W5NdG5fIIfp3+ycl52Y4ScNIvI9fnIHnrtf4xtL
         SQQeYFbrGK1p3dwOHw/YlvRAdpzz8t/TWYIYtIUXfe3qEyCxOdBIdq0fwnodEeKlV5i2
         j4l6Z2AK2oDke/qRlwoT3CeJMPNN7NmKG0u6c1gh/W30LVOhc/1lIvxJrY/XgdGj+kK8
         BlqQ2pgTEiY/freO5bqXHh0iRRhRIWGCi8BAdQd+3ipOEM4n7JgpTTRIqqn33bkSEGdn
         Ogi0UXJSTC4mryZL0iI9kK9m5IfoC0X0Y8ANOzU7XPfQl1rVWRV3dfnsgXewLv1pQVEX
         2flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574077; x=1795178877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+1V56suEOcrMa2DtNDFiSwLo3XA/LJsS2pjnPnOvVY=;
        b=qZ2Zd+0QpfchSvY2QxYpxXAZDEuFQe/GYQSjVvlKC/qIPbhgjPTGHggBynkA5oXTby
         b2SD+51wKFNSOP84JEFIMuWrpOrwaY4B3AnrmhTVvkcLse7piWr8+WA2i374KdyGLiVP
         +HgwP3CTPOk/Vti4Ur8D/SN27DI7DRFF6JjlKP/2Do7Tsl0kNt52cO3NMVdczvQ6+ek7
         5m5G+uNZMf9f59Br6C5fsCI34JAtBlveTAVSrT9MnhBGAS6sWD8i+5vDSMFWzJggbrVv
         cVcHR7MMUupvuBbTeSFsT9kxgXMxpuykXDfzUc6jPU8KvteV1u73BRL65O4oBPBlEe4K
         E3iQ==
X-Forwarded-Encrypted: i=1; AL+hErGmDYWeR4j5xMDdHvd1Qa9Ezj6AvzwpZq2z4LefZoua1Y+NhohFpQQoCEF+o1earYenJIMqNkAgOiqsiQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+RXiyeNpF5ihBZrJyzyYtyHHhssAnt9VfMbLbEGRvnVBF9xu0Z
	NeQxrHZsyvxN6fx+rcz1rnMKuup/yeXe2QlwwicIAmHk3HXryykDMjKGYHX1tXat
X-Gm-Gg: AYBFou0LJDS/zyYdDYUkvvq6vdCYLy5qEHF1LI2LNsd1wH7wvsrzeQwlPVWuly8sw3V
	U8E/Uhh8FkAz0U+jCXFKpo80J/3Itd9VUBLFj9Ov8hfAm7MBjmE8H4lNoeINmWlcliKQCpfvgUU
	SsU1m1qJ+2YjWPBZ4RSAKE5etIgyHq291USyTjXsTNnNcLDvkN8s7YruoLjGwor/BQdQeOHjsLc
	XnWCUAO6i1drugLL7Nr3EnXfrBoyzaGDwzYDQGfM0U0jQTzNdyJRrprF2lL04gOj5jvgnHUN/Qd
	ZtdOkOLZNpSCUCGm3hm+v5SfI0ZCs9bj6vwsoSPQoxKe/LEO8HY+oNglGGOyaj1pq7uQNLyijzt
	UtEjPbr11oqBlLDlvz+Dz/OT/Zb8f3ztUXCHgDVMZ2xelLSHOn3dJTWgLLFp3R4Ac5+1cPwYu44
	wBoqrtQZ8+dsGfDKg8RG83cdbobpviDj+ZQBwYoGdIrs0c/E19t9/D/7lOIzRUpmYBZDmUAIYgy
	Yh4NIUK7774dePA5JY4JtRlrlk31QM3QX4NOGySv69/+4j+0SRYNsjZJs0r5/oI1//HqRatq0Uy
	eFqfCebdj/fMh7B0ioTbb3dlZCiDxvqtwj3hthNaeNUHTacVKjQo7K56SlQ2FYTk9umvu2RBaOW
	UXl9u/kJaD478N6cgVvV543Yq
X-Received: by 2002:a17:902:f712:b0:2e9:65bd:62c7 with SMTP id d9443c01a7336-2ee0d366bbemr37294935ad.0.1794574077436;
        Fri, 13 Nov 2026 04:47:57 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm9382095ad.22.2026.11.13.04.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:47:56 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: AnnanLiu <annan.liu.xdu@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Date: Fri, 13 Nov 2026 20:47:47 +0800
Message-ID: <20261113124748.339778-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_044758_381175_FFA25C2D 
X-CRM114-Status: GOOD (  14.81  )
X-Spam-Score: 1.5 (+)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Jan 25, 2024 at 05:46:40PM +0800, AnnanLiu wrote:
> Add the watchdog device tree node to cv1800 SoC.

Hi Annan, Inochi,

This patch was sent before the clock driver was merged, and I could not
find a newer version on the lists. Mainline and the sophgo for-next
branch still have no watchdog node for CV18XX/SG200X.

Annan, are you still working on this? If not, I would like to pick it
up, with credit to your patch.

Inochi, before I start, is this plan fine?

 - Put the node in cv180x.dtsi and leave it enabled, since it does not
   depend on the board.
 - Use the clock controller instead of the stub clock. In the TRM clock
   table, CLK_APB_WDT is the only clock for WDT0-2, fed by xtal without
   a divider. The counter clock is selected by reg_wdt_clk_sel in
   top_wdt_ctrl (top syscon, offset 0x1a8, xtal by default). Only the
   RTC domain watchdog has a separate clk_wdt, in rtcsys_clk_en.
   Should the node use <&clk CLK_APB_WDT> alone, or &osc as tclk and
   CLK_APB_WDT as pclk?
 - Keep the reset (RST_WDT) and the interrupt from this patch. The
   vendor DT has the same interrupt (58) but no interrupt-parent for
   it, and the TRM interrupt table names 58 "WatchDog1", so I will
   check it with the pretimeout test.
 - Test on a Milk-V Duo 256M (SG2002): timeout reset, pretimeout
   interrupt and restart.

Regards,
Chen-Yu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
