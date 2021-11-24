Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86EBC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AiDProSg/l7ODjuX4KJqX6TFUUveM9whyaNsllKCsag=; b=l8gfRjUuVrk+alKjqgur7amqVx
	AOIOAyDc1dHkOvnB7TNM742oWd+bUtemYMhoGWcj4FG6yvXQ8TDqv80+6xxgSzraErDGqRgujV1AO
	Nw8FSfm/weytEo0FUrivO3OB84pexwVokjFKIw+Ix3Ha9c7ShTZZDloadC/M8O+/VyJoYtd/+dunt
	QkbClHbj5wwS8ZsU2Z067DdNmUZXgIdz+O4lDPdgxK0BJMll9R0RYT03PMhY8p2oX6DfK7nsvu1S/
	p7G7P1mulkAGfKeXd2NKEjTKkzxhrdEKdZeCbkknet7EkhdTx0DK/Uy0mJ7t4OOc9FDGSXhnthHBR
	DoaQenqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpvbr-005LpZ-Ho; Wed, 24 Nov 2021 16:59:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpvbo-005LoP-Ac
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 16:59:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id z6so2344034plk.6
 for <linux-riscv@lists.infradead.org>; Wed, 24 Nov 2021 08:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bcwPH4IUoxYLEAvc9qYsPemmMLu4axjVofjC0wCYAEs=;
 b=31HuU+axyab1DhMZw5WtnTUehA2XT1JBW9iMQzIVTKT7O3Xw+jUylpQnUZtoJY0LoK
 Ag/T6K7Tjx3WVWXODhgN2+pMa6/xPet55YpQKMcK1tUBRXAUYP7bbreTwZvbg89D5EIy
 JnoHQD1Z2QFffgKQyjnTFjuR6bGLyQ5CoEOjbAmOFCt6nKueReyk3O94Q8zYReuO97vQ
 7Gl7Wwq+iUEIWajoacZvaH+sR90CBMSefT3hP1EEqNG3754ZXD5JzlIMTmN2YouJeMHz
 0dTRPVxkPAD/eTrZNVSZk5Te05oM1+GczEkf4sbg1TvnDWK2BZnsBFKaPNl0Dm4FZbZa
 /PFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bcwPH4IUoxYLEAvc9qYsPemmMLu4axjVofjC0wCYAEs=;
 b=J7f8gJt5p10+vZX6TIFh30OwVWXEK78lU/AJ0uWQFir0fY/uIhjqs4PpwdUK3WRAO7
 5uooTg4tgnS0GO6HvOpEvbpSsX2ZLZBSZdZZz8xapQtJsUcDNdhJHiLuXTgeWsRViIgs
 daJ8T1MtvfLcBdFhTY7e7V/FRW/pAbWVS6OYhjN7tsTlzVBXmXRE2SE4cH2+pDk7UXHi
 LtEeUrgYIYtyJUH1ZpCwBreJTWl731XJeloGRkno62feqwgdR2X5wnLxs9lD/UA5OPlN
 TSF09WPetWocenWKLh3nDxAZlVWzHZw5T77t1k7Z4JvOiQ5The+KnGvCbHnFMgcf3Vjt
 vLmQ==
X-Gm-Message-State: AOAM530sHG3OEz409VtL2iScsKM8rhtt7cgyu4iAiXBaoGXKUMamACG7
 guJBtjRlb+sG2CEp3jv4RLb+Xw==
X-Google-Smtp-Source: ABdhPJzEpalf2hzWtUEu7Y4rrBtxJjGeJfr/so43vKZ4pg4A2oCP5oLhI2IKs3bTRwsBnUne/Wao8w==
X-Received: by 2002:a17:90b:4f86:: with SMTP id
 qe6mr17360458pjb.224.1637773137608; 
 Wed, 24 Nov 2021 08:58:57 -0800 (PST)
Received: from localhost (c-73-53-62-83.hsd1.wa.comcast.net. [73.53.62.83])
 by smtp.gmail.com with ESMTPSA id p16sm301942pfh.97.2021.11.24.08.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 08:58:57 -0800 (PST)
Date: Wed, 24 Nov 2021 08:58:57 -0800 (PST)
X-Google-Original-Date: Wed, 24 Nov 2021 08:56:59 PST (-0800)
Subject: Re: [PATCH 1/2] riscv: dts: unleashed: Add gpio card detect to
 mmc-spi-slot
In-Reply-To: <CAEUhbmWZL3QoS_qNe8xEPrBWm0+hLauLAhm9-Wxt2jSDntP=5Q@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, david.abdurachmanov@sifive.com, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 bin.meng@windriver.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-83f9d74d-b137-4e1b-91ed-580e02a20243@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_085900_437498_AC1A4B08 
X-CRM114-Status: GOOD (  13.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 08 Jul 2021 06:40:03 PDT (-0700), bmeng.cn@gmail.com wrote:
> On Wed, Jun 16, 2021 at 3:46 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> Per HiFive Unleashed schematics, the card detect signal of the
>> micro SD card is connected to gpio pin #11, which should be
>> reflected in the DT via the <gpios> property, as described in
>> Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt.
>>
>> [1] https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
>>
>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>> ---
>>
>>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
>>  1 file changed, 1 insertion(+)
>>
>
> Ping?

Sorry I missed these, and thanks to David for pointing them out.  
They're on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
