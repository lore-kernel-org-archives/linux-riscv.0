Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BEEC4708F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 21:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4C261132
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 21:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4C261132
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=pQvsKd6JCszF/dckyZ3Z8zgl+I8xhtBSpzS1K6zOTjY=; b=4Q9dqqjtkMLVF0ekMhiy1zIH3y
	0lOsQn1pxtrr+EkaCtJ/BZ49AOEFFJbb26va9X01A8nrO4R1kN/C4Bn70mJm6OcIP0DYth6D+omVd
	OfVRkPKT2pJVtl077C9Jis7r8ewmYY+uDlAKGlpq2L36Nf387hwoW9iZnAAqZM9j8BpgFxk82hZ9B
	NC3ArG6geplCbU9DyogBksVIn60Adhyv1s3MDv8RmE04oORwU9i1v5Hn9wCOAsZMXT0schXqiskEZ
	AvyehABQrvz1G7bN+m8l2k/ky3O139DFekAsz9eiZyjohG3DTS7MOIOLaISB9iv6YiEF4sgBsdFG3
	h6WKEDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln6D4-008NYa-Aj; Sat, 29 May 2021 21:09:30 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln6D0-008NWL-Ok
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 21:09:28 +0000
Received: by mail-pg1-x52b.google.com with SMTP id i5so5336131pgm.0
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 14:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8r50WTYijVxw13w+Cbl0B/a8grECRXS0efGfJBQBVbo=;
 b=PBNynF5n2iXQe/+sssTBzt+gMIs+NXmjTog4xShBRczk86R+NMYtPGbqrvT1uGgFvi
 y8xKRP38wrBGyf2e7wWlP0eeLc0rsArRKi1vFVBLa6lbKTRRKsgkx+tPBDvNbigotovP
 8PSspNUgOVnqazvOGVUXmFzu8DZ5yqhYZ54hQnm04cH/zReTEdwSoTTRz2DTjafV42Pk
 0YG2nFsdsVR1BspmBgODXxuqC2VBsm9VFx2gy6MNui+3hcaoFxsllYcxmPpAFl8Qi7zs
 PCRlCWxcLB21/9hTjxhiPGvs7yMCmrhbVpueQ/jO/+f+CV066JcJ9AGrqf553ZIq4y3g
 ZP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8r50WTYijVxw13w+Cbl0B/a8grECRXS0efGfJBQBVbo=;
 b=cOaXXc6RwPWWSYWwCxnZ352n1BtrQrOYmE1QUBgcO3NcfKNm2GPK97QXTS2plMBFNh
 SB0g3QznCSlTIoPnBdpbLlitfjADwCyT7G056d/uBUUotMKM6YSJ/jR4TnISOvi/f85P
 YFruyaiz8NtoStZvb6W7qlmER6zKm5jqC94DIgtgPoTjxmCM3fr5cUWzli0ChLRrw7ri
 BFkCFiUgL1uW1KKrGluPd++8AyBl3EIE2iGTBogmYp4+V7FdltAvknzgcP5KmiYg5PUS
 rJ144HCkcFVcxgt40khUqUWdto//OJJcSuW2wgtRlzgVxMn5j5g6VIgMcmqpMkrow7g7
 6d3A==
X-Gm-Message-State: AOAM532lxykOLHjc1z77eQwtr/cipgD+AWdG7b68QquvxGCrsqnsEgEd
 ZJuluBhmVSphDPWjvzDg+dxmZw==
X-Google-Smtp-Source: ABdhPJwPn0+uGvchgpImUmRLtYMKtuL//7Wv0+g7ZeOxfdVONPvEborW1k4FjfBCMS6GGHxB0hG5tA==
X-Received: by 2002:a63:1443:: with SMTP id 3mr15524590pgu.69.1622322565931;
 Sat, 29 May 2021 14:09:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c17sm7686313pgm.3.2021.05.29.14.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 14:09:25 -0700 (PDT)
Date: Sat, 29 May 2021 14:09:25 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 13:56:03 PDT (-0700)
Subject: Re: [PATCH] riscv: mm: init: Consolidate vars, functions
In-Reply-To: <20210517224001.42424097@xhacker>
CC: alex@ghiti.fr, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-42fdf6d2-5e43-4e39-abae-971f47e6ff69@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_140926_903517_7C97D075 
X-CRM114-Status: GOOD (  18.99  )
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

On Mon, 17 May 2021 07:40:01 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> On Sun, 16 May 2021 21:10:48 +0200
> Alex Ghiti <alex@ghiti.fr> wrote:
>
>> Hi Jisheng,
>>
>> On 16/05/2021 15:19, Jisheng Zhang wrote:
>> > On Sun, 16 May 2021 21:15:56 +0800 Jisheng Zhang  wrote:
>> >
>> >> From: Jisheng Zhang <jszhang@kernel.org>
>> >>
>> >> Consolidate the following items in init.c
>> >>
>> >> Staticize global vars as much as possible;
>> >> Add __initdata mark if the global var isn't needed after init
>> >> Add __init mark if the func isn't needed after init
>> >> Add __ro_after_init if the global var is read only after init
>> >
>> > Hi Alexandre,
>> >
>> > I think kernel_virt_addr can be removed, users can directly use
>> > the KERNEL_LINK_ADDR MACRO. Maybe I miss the reason of intrducing
>> > it in commit 2bfc6cd81bd17e43 ("riscv: Move kernel mapping outside of
>> > linear mapping"), could you please comment?
>> >
>> > Thanks in advance
>>
>> kernel_virt_addr will be used when I push my relocatable series since
>> then, the kernel virtual address will be different from
>> KERNEL_LINK_ADDR. I agree this was not needed in 2bfc6cd81bd17e43
>> ("riscv: Move kernel mapping outside of linear mapping"), I'm a bit late
>> in pushing the relocatable series.
>>
>
> Thanks for your information. I think kernel_virt_addr could be __ro_after_init
> But I will keep it unchanged until your relocatable series.

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
