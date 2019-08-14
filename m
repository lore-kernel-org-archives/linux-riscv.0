Return-Path: <SRS0=pZSk=WK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084E1C32750
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 02:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D440B20842
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2019 02:24:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bfk0kN0j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="hjIYO+1d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D440B20842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6q9ofnkY3xnG9MzJ/FN5yxvJepCh0HxxrGWMo6ezAg=; b=Bfk0kN0jGx0CJ3
	eccNVMSneePlaitlZTwkQMyTa4HS0PoJd4kSaiUk/Z/e0DegqY+6uZtmFLS9nlORQA/E0NIKOXOo7
	h9uIP2zuWWOscHWBlKZqJYteqsovHVe93/O7Z8duNV491D+kF6jwMxWr+uth7zKgXUG6bi/1NYp5M
	k0SL7Gp0qwb3KH3mTGQMgU9v2YJ3rrZ5a4BOebIx9BhRC9Z2aEPyioO0VlPcw+yl08cLCiGPpEEPh
	/XGRbNaHA7E2b40fcv6B7xlXI0osDpXpCYgMG2IL23SDht23+BjbH9dkN9zHCC6Fa9AB2wCZxn3t5
	DWMfutaSErMMpLAPPKRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxixb-0008Vy-MJ; Wed, 14 Aug 2019 02:24:23 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxixZ-0008V7-QZ
 for linux-riscv@lists.infradead.org; Wed, 14 Aug 2019 02:24:23 +0000
Received: by mail-oi1-x242.google.com with SMTP id m206so70796765oib.12
 for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2019 19:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=1G/a7WS8pUpL1zmvbKTHzrkVwD487e3W+2smn5ktODc=;
 b=hjIYO+1dYGPbiBq+dHbXBz3TuAYU415ba+1qYeiXmxFN4NqMFXVq7AezPzQ5RozDKt
 OhVMOWSsix2AGx/5/KosEclzeVG+q4u4QX6T9v01GB2WbUHzhz+qKUgSqqvElDNcxguA
 QAdWWDM0D9Fj4YUN2+SKnPEtgzLmRpQ3y6nT6JZdgsFTmheqoPdPSl710HrUWFxn1xx2
 3sxXG13GhNUL+0YVJq/Fz2comXRXfon8+AUK8elZg51t2o8dQcKuUAKho0OPCl9ISl/l
 LSkGWZOSVuTWk5+OCzWwwN5CH7GdzBhxogTwKdH9DHY/CN1agrEx5q/hdh32dTkjHcql
 9KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=1G/a7WS8pUpL1zmvbKTHzrkVwD487e3W+2smn5ktODc=;
 b=gNXGspbpUYbaCX2YjjHktyhn4frNNKSiBjV7B1jmvIKaskYdCpeIVptj9A50hR0NY3
 ff5X/4YNJacoQYKeOQZry/q0aaf9CHC1xAbZuyzW0PuAvxeb2d4P1hi2jeSXSGYAzPH9
 9cwbKYtwLn1ClO5jgCbIXtZLbaiZyAVQrsU8TpI7GPlbbGKTUdc+eCQUyB8o8y8+QvYf
 XJjnNBCdknIPn5g0cvco35LUumN9zcQaJHaDECCa9ON/DCnF83fIBg0OhnTZEMZmxoJi
 mDSchJat6b4lBH9fR8/LbPwm0Vd/ZnBSrTSM6YY8yFMySbC1TaLYl+f9rJDKJgMolGnb
 RwIA==
X-Gm-Message-State: APjAAAWIII5SmeWLv5ZZRTK+5O7lylDki+/EGXigbH88t6n7vhlGk58n
 jcDJcgNHVkQtnRiEAEHqBN1Asg==
X-Google-Smtp-Source: APXvYqx1NahTVPRWa7m2oJ0W4YhsQAxXbI6gehhVtgk+OAiDDzj+CshHjmVcVPHC2vZxZqmTXgtrNg==
X-Received: by 2002:a02:a18e:: with SMTP id n14mr980021jah.84.1565749459743;
 Tue, 13 Aug 2019 19:24:19 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 y5sm114834811ioc.86.2019.08.13.19.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 19:24:19 -0700 (PDT)
Date: Tue, 13 Aug 2019 19:24:18 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH 1/2] riscv: rv32_defconfig: Update the defconfig
In-Reply-To: <20190813233230.21804-1-alistair.francis@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1908131924100.19217@viisi.sifive.com>
References: <20190813233230.21804-1-alistair.francis@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_192421_972985_8AC4AC2A 
X-CRM114-Status: UNSURE (   7.32  )
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
Cc: alistair23@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 13 Aug 2019, Alistair Francis wrote:

> Update the rv32_defconfig:
>  - Add 'CONFIG_DEVTMPFS_MOUNT=y' to match the RISC-V defconfig
>  - Add CONFIG_HW_RANDOM=y and CONFIG_HW_RANDOM_VIRTIO=y to enable
>    VirtIORNG when running on QEMU
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Thanks, queued for v5.3-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
