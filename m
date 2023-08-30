Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63253C6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxJFWZOkbKYzIzfY53kfQ8rCYKaIcQOVwnwqYch1ORA=; b=sitjgs9+nsyaQx
	FJ/1Onk0Dqxrq0hCOvI45S+awn7WQVJjY2f4tpdvGVRRhMzdSuYa47ChXExV6v/WaEUe1dr+MoNbI
	fnwgMJnFXpQcPE0nhFsPwUbGoG6mx0jUhij/VdYkUOAHbszafcoUJzhZNvnpX2w0rAMON05JVbz80
	xtTFcwh8CDQpW9GyeplBKET5QXlyH5nx/jbLSqJt73y1ibwGuLPxsUh/2nGoddbt39qWNW4QGnkxU
	vawUG+Nww894iyfhkzi/fI42EkBlKKUiBw/7+N8qb35ehkPZ17EoJC62N24Wh5v5apBNu4Jc4noe7
	CDhs0vJNakvN3R7gLXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLBj-00DZEM-1e;
	Wed, 30 Aug 2023 13:24:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLBf-00DZBw-1h
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:24:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bc0d39b52cso34503055ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693401887; x=1694006687; darn=lists.infradead.org;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cS6Q9Nda6J5ktOOJj5rlj7vp4gloDffAAQTkHig3BuQ=;
        b=2gmbqi5HpF2Ln3gmb5QDo0HWw0LWGFdgxufDUfTw3nLTtZzhsUu5GMunDF1pNIGH7p
         HnkVOkveKWSyXPR5SVr1B3y4w4JHFl6SCkA9owmr8qG7Qg4zmqf/WQbxGBhaB6f0as/3
         LOQt+Obm4x24/TPHZJpHv4jzPL17aM1TqdIp3xrzdZvS78OOiKoqurVFuEi7CLD7zCy5
         vZD49wN78Ta9jWDu3kXlYpzEzdzqvqjj5uhSkSUc6w+6peEgs5McivQfAAXaiwvtEqn0
         gTfoAD3nDPTzSQUBZSY69gcYcW2mgz2V8hAKAUuzt93rnqqF2Iki0YIMVChjeTXU9K2c
         k/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401887; x=1694006687;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cS6Q9Nda6J5ktOOJj5rlj7vp4gloDffAAQTkHig3BuQ=;
        b=luHlQ+mAQjmWbaLp2gA7/MyWv3k0i5SvWQyf3EbBGfUywVoPNxQGRsxrckhXNLb7tR
         qOL/yvIKSeTDyH7Fea0jHOvGDeo9NFsu/YKD6+I8WTzpW3dh8AfAtYwEtZi23Vrn1cxG
         0Kw2z67DpNA6nsH0nx//uCNcfijAL+f6QpgbHkS2bSh2NNuTT5nSbawQ6Cv8y80TpCXj
         vUtsWvel2EySDYNeTXpnw0m8SnsV02r0TUzay8zwgdDtMrXzQX3X+mdn3XImtbdwx2fO
         fSxq/r13jE9gwanIKidLEW+gSOtuH9gfNY98nrKLnTxf+2xtGM0oE5rJBBwRt8wJfU1o
         OuQg==
X-Gm-Message-State: AOJu0YwKk24hdOfwLIf6zOYhcTnztT5LJPEwCsBMW8/TZmCI8H7Pb1Ys
	9znFDf7gyoKn3kHpM8itBzSizA==
X-Google-Smtp-Source: AGHT+IGW5G1y37EAqJFJzOnhtad780Rl1Is3xQMmrx5OuV3OLnESR1H70dQS/JXhixw9HWX9IZgKug==
X-Received: by 2002:a17:903:22ce:b0:1bd:b8c8:98f8 with SMTP id y14-20020a17090322ce00b001bdb8c898f8mr2328919plg.4.1693401886986;
        Wed, 30 Aug 2023 06:24:46 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902d3c600b001bdb0483e65sm10980620plb.265.2023.08.30.06.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:24:46 -0700 (PDT)
In-Reply-To: <20230725053835.138910-1-namcaov@gmail.com>
References: <20230725053835.138910-1-namcaov@gmail.com>
Subject: Re: [PATCH] riscv: remove redundant mv instructions
Message-Id: <169340187984.2480.1255424893144645227.b4-ty@rivosinc.com>
Date: Wed, 30 Aug 2023 06:24:39 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Nam Cao <namcaov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062447_565448_A3BBF458 
X-CRM114-Status: UNSURE (   6.36  )
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


On Tue, 25 Jul 2023 07:38:35 +0200, Nam Cao wrote:
> Some mv instructions were useful when first introduced to preserve a0 and
> a1 before function calls. However the code has changed and they are now
> redundant. Remove them.
> 
> 

Applied, thanks!

[1/1] riscv: remove redundant mv instructions
      https://git.kernel.org/palmer/c/10f763532d58

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
