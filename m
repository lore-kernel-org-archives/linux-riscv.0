Return-Path: <SRS0=bvH1=PU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8700AC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 02:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C342084E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 02:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SeeEi682";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BX15Vu/e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C342084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kIKWTOhTj+3HSLcxzJ/NOFxGw7ucHqJQwwFNHaxuWE=; b=SeeEi682THMBpK
	4TudB57QsvEg109HIhgYPhnpz7HtBtl2hCuJHfMZMgFvYJYYnFBas6+BBYGnno8mX2LU9x3v4+LAP
	YKORHHEwVbGPZna2BXCfQ/KWU8WUATyucrVkh/niESav6favxjgyusRZkEjIDxKMdmtHIzze1Yq64
	30JZjJ3IApe/QVGg2K64/NggZ2L+z/L5R1qp3W63Mm3LBqJR1oakxzw901pr9y1+PmgqXYDkG2/lm
	CdOuRq7LwN5li6Alku+CnFhZHzPOI0TN7D+F0ePHSlPSJuXBjYGs/86EhVRgIxl9GTXo3qIa9S/zX
	9TwTqMZ3VvRtRQHSIDUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi8hu-0000YC-1r; Sat, 12 Jan 2019 02:07:30 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi8hq-0000Xo-93
 for linux-riscv@lists.infradead.org; Sat, 12 Jan 2019 02:07:28 +0000
Received: by mail-pg1-x541.google.com with SMTP id v28so7051041pgk.10
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jan 2019 18:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=WUYxqEBLAWdKwx9jSHSlJcfQJizx3bVbCo6NWuPJtIc=;
 b=BX15Vu/eL431OimxTdscWvbRzBpeUyRidoSWXdjfntlf89/WhYjH5ASZSqYKC6MsoO
 whWD8pdAZdEM/SHpb1QgWGOV3FvqGs1XvE3c2h/vIWMDw8hGKoD6kpSSkvkY8xYk4lkf
 KXXVl5d/k1g+T5akL5YplWSmDXavJ/c+6hD2xC32KoBUxWCFH2HUpuZQXu5N4u+EkzhQ
 8ukxuqvQOjE4apEYbb7gwrTp5MJ50xGmB/ZBtAsfqg3knUORz49mvH9M5f6CEcOeGYMd
 eczQ3gXN1UazJs7IU6aMDNh0Acmout+hd2iqBZjwvRTSRAzETIBUwIbxknkil9LKbTfG
 gAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=WUYxqEBLAWdKwx9jSHSlJcfQJizx3bVbCo6NWuPJtIc=;
 b=IbLsRU9J8CK6NnKEQZYQHwrEfgb0xdvj/8wUKmfwUWTwe/Pof7ZHjwdYTbeQi4KTxG
 kDjpfMR+/D+S/vyT0zVBBbs2lOST4Wp3EkoqMky12wsjWmv60NV5mRYqFpkDEZGaBE9N
 emy3sTO4zQQ/sfbXQteSD5ay0EgmL3KP72WIuZUO0hmSVLSQrQDvm7AlBOKi85naBsqX
 stn2im9AmAKm6caLbhgH7Zx4oezM3M9SuPAySn0ifMSJ/tC+evKQMobDf+XH1mgMNRFF
 CRrXod2LXlpL8WhGGRwguBKshBJTHxMOjIrXXWrr9xKNTUjrYzOTsnAyjAYrp9SPgh5Q
 Nc0Q==
X-Gm-Message-State: AJcUukdOPmkwYK0yioD/UsDPO0uYETbyR86lCG4d3rdU/7id3QiR/KAH
 2zmVNdIHIQr89rgKJSTNeYYmdXg6u6Q=
X-Google-Smtp-Source: ALg8bN66h1ixfV8Ud5dcJ3dL884rN/RW0/4Dp5V7rGFYFFDbTjSzDDXn/LUVcSK/miT8nagJ8kd9ow==
X-Received: by 2002:a63:66c6:: with SMTP id
 a189mr15494643pgc.167.1547258845208; 
 Fri, 11 Jan 2019 18:07:25 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id c13sm160617376pfe.93.2019.01.11.18.07.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Jan 2019 18:07:24 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Fri, 11 Jan 2019 18:07:23 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH v4] RISC-V: defconfig: Enable Generic PCIE by default
In-Reply-To: <20190112004117.28265-1-alistair.francis@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1901111806590.3094@viisi.sifive.com>
References: <20190112004117.28265-1-alistair.francis@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_180726_848843_B769E860 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 12 Jan 2019, Alistair Francis wrote:

> Enable generic PCIe by default in the RISC-V defconfig, this allows us
> to use QEMU's PCIe support out of the box.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
