Return-Path: <SRS0=iqkr=RH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EF3C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 19:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713F520823
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2019 19:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uQH77KZA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EBzZyfjR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713F520823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=3ei+9U6hioWXpJBT8Y54CnHavbjEl+EpMEGEFtzb8ns=; b=uQH77KZAzbW4tWO3m1I+xT2Wz
	h7tj021KY6Lr81zIISnCsPzm+fIieCLE/00KhISydafxWefsXlQiostEAtkDLioX4TpDCe3q3s/Yh
	WGGxl8LG7M5oQR/EQgbHHzzHwj0B+NTStLAxFc+ahm+c6SAtIe2FWuAGZGUt7QgRSWaQS66Xad+gI
	UeOhkm0Mm0TQnd0Wb+6AINjkAaRmrE8d9Y65n5r89XPVPLjS9fBmqlr5msBFznC/67Qd2028fA/Pw
	QH0fcxT4oLRLHfw64xk8CJSGMTtG35F5WzdJiKimJycFgKAoLU4EmokJ2qn+7Z825QFUhYVXDJ9JT
	2pMcWRUzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0tdI-00039u-6T; Mon, 04 Mar 2019 19:52:16 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0tdE-000397-JV
 for linux-riscv@lists.infradead.org; Mon, 04 Mar 2019 19:52:14 +0000
Received: by mail-pg1-x543.google.com with SMTP id h8so3811091pgp.6
 for <linux-riscv@lists.infradead.org>; Mon, 04 Mar 2019 11:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=u2JwMPkXahrcjaXSTN2edPrnsueKt8E7HcOE5LuwXGM=;
 b=EBzZyfjR6uTKlbm5plvgqoa4trJSq0hfNhvwyj0jDZj08RxgDbqg4b6nRnglA26f69
 goPEItVPzb3RUE7xh4XCmFyVQCUzlkFQpiC5MwDhlFa1YsaGVBzHFROYc7BdFfMra8lZ
 7OzXGR9b8ZlZ7JLT/SuTqrXFc2vgspBkMxMi1zDKU58/d24Blqa+Vr2LhA0LGPxPeboU
 rFxbYZkiZLMQl7QbaoxHyanEqHZVLBoBvlImyED/yHrfJzOP+6UrqED0cc863tSMuD9Z
 wX/NPm1ERPg0VHH6nJx36nzdedPeWpYFU64jIi5Zp+0pe8MRIwb8h+FJd2Vy8ZHjcxsS
 Clzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=u2JwMPkXahrcjaXSTN2edPrnsueKt8E7HcOE5LuwXGM=;
 b=mQreLCW9I8JwhT82g/KaOcxxaNxjzMcSZ2tuStF66XBb4xb3AoS8CrNz4HitU1VlPD
 +rLf9+L0Qy9AqAUmopoBc/2DqnnpFHZHMTnEn+9vJboQaPYy6KydcQzYqeh5jzfYQiLv
 P0LJoodwC3J8fTzSkgptNKEbr2cssydrrypOs8mAL0B1LTeFQEh9uVU5ij6eL5cYEglm
 u6XKxYV5PV9VwPsZ3ajgPWyAg8TKX4U725YOZ46kVxhGsEu4+Z2i77s4oO6x2b5kR2Ap
 xSbgmSMp3PM6n5KI3AIzNXLXi4GMR3DOE4JaZmYwx9yNMqf4/E39pL7jB/wkyqqe/vx4
 uLmQ==
X-Gm-Message-State: APjAAAWUSubTMvk2toot2LpzBuSRUj5/uQ52Z+cyTOlNdhUuJAhP41oE
 NXSgx+SmZsLDeDXhlfaj46gY9KfdMv8=
X-Google-Smtp-Source: APXvYqx/uztNHG1glavRluuV6vhWfBK4go8X3t8WdZB1V+wV3tJWYiVJzPzlQ/YPFjGRxggubW6pJw==
X-Received: by 2002:a65:5507:: with SMTP id f7mr19734536pgr.44.1551729131153; 
 Mon, 04 Mar 2019 11:52:11 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id p2sm13719782pfi.95.2019.03.04.11.52.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Mar 2019 11:52:10 -0800 (PST)
Date: Mon, 04 Mar 2019 11:52:10 -0800 (PST)
X-Google-Original-Date: Mon, 04 Mar 2019 11:52:08 PST (-0800)
Subject: Re: [GIT PULL] Fixmap support and MM cleanups
In-Reply-To: <mhng-af9b888c-c585-4598-a59f-1255441ba3fb@palmer-si-x1c4>
From: Palmer Dabbelt <palmer@sifive.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-c1cf3829-0ec4-42c6-89c5-220206612e28@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_115212_670926_6A82A4CD 
X-CRM114-Status: GOOD (  13.46  )
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
Cc: linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 04 Mar 2019 11:31:15 PST (-0800), Palmer Dabbelt wrote:
> On Thu, 14 Feb 2019 00:26:33 PST (-0800), Anup Patel wrote:
>> The following changes since commit d13937116f1e82bf508a6325111b322c30c85eb9:
>>
>>   Linux 5.0-rc6 (2019-02-10 14:42:20 -0800)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/avpatel/linux.git tags/riscv-fixmap-for-palmer-linux-5.0-rc6
>>
>> for you to fetch changes up to 49f4f73f51bed5b840ea4f944cfb7f4fbc78a86a:
>>
>>   RISC-V: Free-up initrd in free_initrd_mem() (2019-02-14 13:32:25 +0530)
>>
>> ----------------------------------------------------------------
>> This tag contains RISC-V fixmap patches.
>>
>> ----------------------------------------------------------------
>> Anup Patel (5):
>>       RISC-V: Setup init_mm before parse_early_param()
>>       RISC-V: Move setup_bootmem() to mm/init.c
>>       RISC-V: Move setup_vm() to mm/init.c
>>       RISC-V: Implement compile-time fixed mappings
>>       RISC-V: Free-up initrd in free_initrd_mem()
>>
>>  arch/riscv/Kconfig               |   3 +
>>  arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
>>  arch/riscv/include/asm/pgtable.h |   1 +
>>  arch/riscv/kernel/setup.c        | 130 +-------------------------------
>>  arch/riscv/mm/init.c             | 156 ++++++++++++++++++++++++++++++++++++++-
>>  5 files changed, 207 insertions(+), 127 deletions(-)
>>  create mode 100644 arch/riscv/include/asm/fixmap.h
>
> I can't seem to find this tag.

I found the v2.  There was a merge conflict, but I think I have something 
reasonable on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
