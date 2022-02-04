Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F8BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 21:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6S/KVjTlHsW4cJwiXVVaY3czMeDTax37X+DRaYb2sSk=; b=wMYeoODtb5KkTkF5L09anQgj2T
	pseUQ+zWe5Vin/p4oHq3E8yjmpRoR4eMHtiJoCi1yJSDtCYH10P9hnNAHRH03ProsAKtuc7wSRn52
	NwdnhCJuDmNhSZBgAH501Ox640uaZi5RLtDXDRy37CtwNlc195Q3o1yIrCXlMxKhKTJWoR7+VAjjq
	cGaLvQVcQR2ekCiWXBARVaNPFtxqq5yDLVgksOtOJT1KHqty1TC2MeL0MrMC7FnhLLozG0pUTjWA1
	JrDrK3l+F97NHrVCqrEV33TXg62R+3U9TgVTvBQmZfc3HZWP798jY9b6GdYHQ/WHJvhBJYV803bYI
	HR22EEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG6OK-005UM0-Ia; Fri, 04 Feb 2022 21:45:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG6OI-005ULU-7I
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 21:45:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 cx3-20020a17090afd8300b001b87b9c0247so198889pjb.0
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 13:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=RXQ9zkwSxXGia+YhwgGsPcrPrVdaFvM/lO5LjhANYp8=;
 b=72cPjU3xW8fy0ORG354nI1xNq0l92wTwxBtglnv0fqlglT5T9LrAej5Cb/Aly7bq6F
 +lFrkgn0bEq80rfrXvnFBvERAnh2coRqGuyuGNZ3yFK/JB13gGZaL8DIwIxPxn4AfPfM
 mzIC+etEoWihcAVSIeqIU1F506Y1FvZPfz8KTbzUWRdyYAaQoDmelu9cRaJgPbJo+N+v
 sP9QDLSTWBxQduwAEA1sG7AUKJ6g8jLQytLBrqWdQaezL2mnp/kBTCYzT/GcVcVWBdPl
 NyXrKpJZ9qtlGhgCTL25EPp98TAbcBtNXJWQ8juySYwH0i9X0ESS/oNt4oiSm/HwpXw5
 kweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RXQ9zkwSxXGia+YhwgGsPcrPrVdaFvM/lO5LjhANYp8=;
 b=pS99ROvZBJSMjHnJ+noctpRtiZK7USXIWlRpw7IIpnf9XRKNz0iUN+q1Elu2nBlEXn
 qyR5Mq7ZE1zqWkHt/qCziHAO9TRTfJvZ99Dy2jYEgK9mpBaZShItFazXNcFDa4q3xWxv
 Q2DRxwmv4V5+dnJYakgQaAq7X4Wd4gBiFy/50xDu3V9I/7k+bdKiGQiLyFybSaoznLTV
 aQ/M0HmpyAQlUCX09P2VNFNb5oeLW7yzIvGyfU2v0qBAgfIPDKTxL/BUHCXr0yhnVKAL
 o6VLRyd3Ki5RDtBCYWKWxnk4yNSrL2ghh6RPAbFqXdc8D2mNXWm/KSlDT2mkusxQWbZp
 7qzw==
X-Gm-Message-State: AOAM533/9vbQvEQ2ENhvd65zVEQ+uGhg/otj5lFq03wrdeqgdGLXtcpd
 o1jVmL6BoAde82mVtLygi06LN2X6jXeYxQ==
X-Google-Smtp-Source: ABdhPJwlGiBHMIaT1hJmvVYY3KJcfFsZwVOaoOmsAmPKxrtQTNxcG4RbWsH74qryUGdK04AAI17yAg==
X-Received: by 2002:a17:90a:de98:: with SMTP id
 n24mr1071904pjv.87.1644011112830; 
 Fri, 04 Feb 2022 13:45:12 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id t2sm3342218pfg.207.2022.02.04.13.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 13:45:12 -0800 (PST)
Date: Fri, 04 Feb 2022 13:45:12 -0800 (PST)
X-Google-Original-Date: Fri, 04 Feb 2022 13:42:41 PST (-0800)
Subject: Re:
In-Reply-To: <CAM4kBBJqHVX_Q2C0VO7qKNZywRiWbHK9t0G076ov6u+_gwO2=A@mail.gmail.com>
CC: gatecat@ds0.me, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vitaly.wool@konsulko.com
Message-ID: <mhng-2db944e9-a159-4202-ae7b-2af9c59b3098@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_134514_428601_BBD7EEC4 
X-CRM114-Status: GOOD (  19.91  )
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

On Thu, 20 Jan 2022 07:37:00 PST (-0800), vitaly.wool@konsulko.com wrote:
> Hey,
>
> On Thu, Jan 20, 2022 at 4:30 PM Myrtle Shah <gatecat@ds0.me> wrote:
>>
>> These are some initial patches to bugs I found attempting to
>> get a XIP kernel working on hardware:
>>  - 32-bit VexRiscv processor
>>  - kernel in SPI flash, at 0x00200000
>>  - 16MB of RAM at 0x10000000
>>  - MMU enabled
>>
>> I still have some more debugging to do, but these at least
>> get the kernel as far as initialising the MMU, and I would
>> appreciate feedback if anyone else is working on RISC-V XIP.
>
> I'll try to support you as much as I can, unfortunately I don't have
> any 32-bit RISC-V around so I was rather thinking of extending the
> RISC-V XIP support to 64-bit non-MMU targets.
> For now just please keep in mind that there might be some inherent
> assumptions that a target is 64 bit.

I don't test any of the XIP configs, but if you guys have something that's sane
to run in QEMU I'm happy to do so.  Given that there's now some folks finding
boot bugs it's probably worth getting what does boot into a regression test so
it's less likely to break moving forwards.

These are on fixes, with the second one split up so it's got a better chance of
landing in the stable trees.

Thanks!

>
> Best regards,
> Vitaly
>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
