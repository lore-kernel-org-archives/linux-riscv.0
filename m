Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6019BC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Oct 2022 19:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=mNzRGZyCbDPZSotjjLYY0HtPyRFKvpOL94+bNlVraso=; b=q63m5IoZL/VulNc4t1ZzVIKBAZ
	lpO+Jx6/JtQAPz2JO+cM6s/O0rE4IAI4cl1Ufc91++XpAneLdO8hSXuVlhJk7ac5XhgzkWodaURJR
	sbSZeYBOyH76o7+PRuZoAXHjO/BU0EE/lKZpvy3khvAAUFZcf+Rm1aaTr7+BlyidA5e1uJYZ5r4mz
	0ItLopEb/LRM3aCC44MRw014NjBTGX/bmkdFVNxYLQVUV+vjaNXTvvIs9AkDS4rHvVEsIjCiyoAfY
	+T5j691PSsPsftDnLWVLghrenHlRTr+0XUUIKRnh1QTzgFHhTgVagY2LLleo6a/6Dvjz4fTuuD+/R
	BqdZIsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiL7A-005eoB-UH; Tue, 11 Oct 2022 19:40:32 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiL78-005en9-OM
	for linux-riscv@lists.infradead.org; Tue, 11 Oct 2022 19:40:32 +0000
Received: by mail-pf1-x432.google.com with SMTP id w2so14526439pfb.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Oct 2022 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+shlKfDsLFTceKW+59V6+472TY2BoFXSdseGTm3kLU=;
        b=Bu1BlJFHGwktTve40DNIGWtdyziYSZMWKlPxhM22FvRzDI+0O3L9f1yPoo2tF+rBqh
         ojM8wGYpNeFmkIa7PjJS9+lx6tnEcff23bUQ1AFIb36QS3MI1WXy8/EPVPmk/aI2NomP
         jzPlMSt4Szw2jZKdjD1ojZTWartdQE7yWsV19IGpEAdaKA/EOOEGKtn7j6ntPyQMWJH9
         8GsX4Hy0Zru1wOpztHGosUX0+vQHjNPhA6U34z+GPsxbz/gApMeHzelErS9+szq2Jlt3
         +5boQqg2mP8h0HVYWYnnVBdmHyQnx+b7FryM1KwebnD588TMQisrVnS/xKLtRJo36jYA
         fFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+shlKfDsLFTceKW+59V6+472TY2BoFXSdseGTm3kLU=;
        b=l1vhDFurTOpGv9On2jg/7c+KGYM6r1diaiDgBxzylhdBeCAjgheAtYjuHbHDz+Bi9k
         BogyT1HeZ/ty247I8YJkTH34Twos4QTPFz+ty00/Cep7GaLiEi32DAuuCYiVXQRAKFdN
         lIy54lz0E+Vgv5AhUA5JWjgB8XZrIZXTsIA8UelR5PKdQs68yzlIa9F2s1AJs1Fx6B0c
         J9yZR16bi3TR0ISMUIUw0HlaA8aZv9mVed+9ns8n/5WX65qwombSkzPnoAjLoETAu3y7
         iwKF3GFYrzjSSTex/O8ql+WrHJl/X81Y+xzKWNmx6MjARqXlGcl+FYYXwFpaLr/SslKO
         1Dxg==
X-Gm-Message-State: ACrzQf1svMAQByAzUiwkYcWjAH3eFceDd/YIt5OGalG/7AhOMNIM4tim
	4YPUFeIh0z0tNCBun+VrtOdHjg==
X-Google-Smtp-Source: AMsMyM50hNH4XVFVNgXVgLJfqqCz/FTGmtX69a1LkqgjO732ttFps1Y8BHQSJ5m/Engi4ZsZ7shxkw==
X-Received: by 2002:aa7:88c4:0:b0:563:9fe9:5da9 with SMTP id k4-20020aa788c4000000b005639fe95da9mr7197675pff.41.1665517227798;
        Tue, 11 Oct 2022 12:40:27 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 197-20020a6214ce000000b0055fe65e9203sm9492837pfu.0.2022.10.11.12.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 12:40:27 -0700 (PDT)
Date: Tue, 11 Oct 2022 12:40:27 -0700 (PDT)
X-Google-Original-Date: Tue, 11 Oct 2022 12:40:25 PDT (-0700)
Subject: Re: [GIT PULL 0/2] microchip maintainers updates
In-Reply-To: <Y0W1RCmy7DOkJw4/@spud>
CC: conor.dooley@microchip.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-c6e49911-7ee7-4618-8958-02821e53df72@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_124030_815841_2DBBBDF1 
X-CRM114-Status: GOOD (  17.90  )
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

On Tue, 11 Oct 2022 11:26:12 PDT (-0700), Conor Dooley wrote:
> On Tue, Oct 11, 2022 at 11:20:29AM -0700, Palmer Dabbelt wrote:
>> On Mon, 10 Oct 2022 15:17:03 PDT (-0700), Conor Dooley wrote:
>> > From: Conor Dooley <conor.dooley@microchip.com>
>> >
>> > Hey Palmer,
>> >
>> > Two maintainers changes that I posted on the lists a while back.
>> > Neither applied at the time b/c the maintainers entry was being updated
>> > in the soc fixes branch and in some for-next branches at the same time
>> > and they conflicted.
>> >
>> > If you could pick the two that'd be great.
>>
>> So you want me to just pick up these patches?
>
> Please.
>
>> That's OK, it's just not a
>> pull request and that's what the subject says.
>
> Sorry about that. I'd seen people doing it that way for trivial
> patchsets, eg to arm-soc for dt-bindings, to signify that they
> were intended to be/ready to be picked directly. I'll stick with
> "pull" for tags only in the future.

No problem, if that's what folks do then I'm OK with it.  I just hadn't 
seen it before so wasn't sure what was up (doubly so because you send 
you'd be sending a pull).  They're on for-next, hopefully patchwork 
sends the email too...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
