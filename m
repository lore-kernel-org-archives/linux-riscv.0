Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEF1C7EE29
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 01:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=f+/ZpvxQg6s6yVwaUo1T8qG/48vYg/MCQ8RI6n4leX0=; b=f2MUWSimT7JumTWl9UV6cGibcl
	VBbsP147hAp4g6x6/MQilHPvtz6P4xJ0vUgy0bC4xj/0x0tvvH5B7W6jI0cvEww7KFcAe3flGmfmw
	NRxsdtlemfSIMySjdcobuk92Xg3NN2+Ay025diODlWr4pcn9y/crE4oI6VR3+vkHBj4siOA9aWF29
	+KRI++ors2/OXkLt5P8oBIA2BqobD3S7olZ4NltoGk7lIKKukHdUMcCMSsO4DrIerayLnhBHWHGES
	66zGO5yDRmAlHcanSY7R52HSUQIW8kfmJCN5arhYGeRdWafgGhZ6W3sk87CNf3V+FrVmMKPAZNO/A
	PNSLhAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1dJw-00C1jv-0D;
	Wed, 24 May 2023 01:29:44 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1dJs-00C1ic-2d
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 01:29:42 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64d5b4c400fso249953b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 May 2023 18:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684891774; x=1687483774;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ovs5IDEUt1HNCdjzOE1h75uJJvQKIJ+i/NKnFH6yQjY=;
        b=gNIWrdMP8NyKVYUYP4pw0tVp1AEQl8s0FnZM6sfdnLouw7sRoSspjvwNjZFP213FA8
         deD89aXfjMPjsShZh+v0ww8X7Kvbf8/0SoncN2PA5tLW85kBf5yhGhZuVX0JAUN7t5dH
         iNO89PkFhHBvc0a21z+sAUUCOQTUOGbZuQ4eYebIAryWP7W2pU8ZvY1YYg5Frgh7nx5S
         6ueyxSE6jO/9LZtwgx/7XkKq6QvdSSXAr5uFrgY1fXeEcWsTAtcxXRIkjI4n4BsMUB2e
         wYAdrV3pSCbqKEF7/bKXqonOK0Yhep7nTgpW6AjKsh9vpyMTJiKW9YfAY3wJSnAtPgff
         CRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684891774; x=1687483774;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ovs5IDEUt1HNCdjzOE1h75uJJvQKIJ+i/NKnFH6yQjY=;
        b=UFYz9X4asAOoRCu8vKvXxsqVdz0b83voFFCNPdbYzFJS+3f1CVxDKee4sHKBOsv7DT
         AA7LJqv/nDK4wvfSgVZN+u2kuNCj9CVafe3G83bCoXbiONNVdVac6wzsHg98BK37rCDa
         jge9fk0T1ABZvd9xUDfcpWdGKG1Uxan5iKrkirSNrY/M9/0cMAMv6h0zu37V7FNvdyeH
         Vp8NYdSZPIWsOezQGBl29jaKeYcxOpz33Oaf0d/px4ZCe7fbmzByUT5PDeR/opglC6VQ
         1E7MIHyfI5/My6+H1N7LrCzhZoHBhhriYYNzFWIlnslOESRbK+Rdo1OgAPP5i7QHjBVZ
         75Wg==
X-Gm-Message-State: AC+VfDx8rvw4/I9PTHfhXRafsTHoaF+dBzvDRaavjAC3g4mxIaIjPbCH
	7wjbJ5k4fMhqNfOEgGepAOcYEKrndl7uIcTW4xQ=
X-Google-Smtp-Source: ACHHUZ5LGknBqn9oBQPkYn8OEkWZnDWjHIE4aCSA3ijt5LvQi/WrEj3XBhXeAob+CdbOOeFVA+G8sA==
X-Received: by 2002:a05:6a00:1486:b0:63b:64f7:45a0 with SMTP id v6-20020a056a00148600b0063b64f745a0mr1158431pfu.12.1684891774395;
        Tue, 23 May 2023 18:29:34 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l19-20020a635713000000b00530621e5ee4sm6663669pgb.9.2023.05.23.18.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 18:29:33 -0700 (PDT)
Date: Tue, 23 May 2023 18:29:33 -0700 (PDT)
X-Google-Original-Date: Tue, 23 May 2023 18:29:08 PDT (-0700)
Subject: Re: linux-next: Tree for May 15 (several RV64 build errors)
In-Reply-To: <e2279988-03b4-9670-6f1c-c360c478b38e@infradead.org>
CC: alex@ghiti.fr, Stephen Rothwell <sfr@canb.auug.org.au>,
  linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-e172207d-d67d-46ab-ab95-85f0a854ace2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_182940_855648_354AB79B 
X-CRM114-Status: GOOD (  16.64  )
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

On Tue, 23 May 2023 17:22:20 PDT (-0700), rdunlap@infradead.org wrote:
>
>
> On 5/23/23 06:07, Alexandre Ghiti wrote:
>>
>> On 23/05/2023 04:28, Randy Dunlap wrote:
>>> Hi,
>>>
>>> On 5/19/23 03:42, Alexandre Ghiti wrote:
>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .data LMA [000000000041a000,00000000075bffd7] overlaps section .text LMA [00000000000f09d4,00000000033562ab]
>>>>>> /opt/crosstool/gcc-12.2.0-nolibc/riscv64-linux/bin/riscv64-linux-ld: section .init.pi.text LMA [00000000033562ac,0000000003359137] overlaps section .data LMA [000000000041a000,00000000075bffd7]
>>>>>
>>>>> I'll check this one too which seems to be related to kernel/pi introduction.
>>>>
>>>> Thanks to Bjorn: this is caused by XIP_KERNEL, which is known to have limited size, hence the overlap, so no fix for this one. Is there a way to exclude this config from randconfig?
>>> Does this mean exclude XIP_KERNEL or something else from randconfigs?
>>
>>
>> I meant excluding XIP_KERNEL from randconfigs: it has very strict constraints regarding what can/can't be enabled then it needs human intervention to make sure the error above does not happen. So I would not bother testing this in randconfigs if possible.
>
> I can exclude it from my randconfig builds, but I don't know of a way to exclude it from randconfig builds in general (i.e., for everyone).

Arnd had suggested a trick related to menus that would result in 
randconfig never enabling some config.  It'd suggested for 
CONFIG_NONPORTABLE, but we didn't use it because it'd reduce randconfig 
coverage.

Maybe we should add a CONFIG_VERYSPECIAL of some sort and hide things 
like XIP behind it (maybe M-mode too)?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
