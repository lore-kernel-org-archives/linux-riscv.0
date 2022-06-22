Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81250C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jun 2022 03:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ImCkuLB5y8M1Pvj6Vt9X7scNt7RU8T2PKs6dLn8cgM=; b=NJW3ziwFVK9tHl
	AaNV4/a2dJh6m6DTPXEIGe0wwis4IvX1e15GmmwVgkyh+Lhktfl+WXd6fEBVx15zIyIQ4SHWECAz5
	BWQrS+9bG162G7uxZR7uQdblR2dkbTFktCTbpLVtgpWMPZ0UU8B5FAACz7nbKz7L4joNty6JjXHNK
	YXC36/Usg3jyzZXlOY2Vrwpmjs5E4ULXYeRc53oGvEoZEMfeAld0GX6y6cpitz1+NbjaDVU69B2Tv
	j6JMeKEcT940k3skQLYwDL4gzZ+69fTz9MVVNChhPsXbQsnLDYBHp75fGIgo+rXRKRnvPengpbRB0
	5AcTWIKp5ILUKTajGIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ql5-008HhS-2U; Wed, 22 Jun 2022 03:10:23 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ql2-008Hgo-VR
	for linux-riscv@lists.infradead.org; Wed, 22 Jun 2022 03:10:22 +0000
Received: by mail-oi1-x231.google.com with SMTP id bd16so19537923oib.6
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 20:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FACxbqess0Pows5/Tzswl5y1waAC4sojiXabClOWhFQ=;
        b=DiB9bZ5be8Rk6ThORaXRfqlJvLIplqBA1rG4IAnxfUJP/TKDMXYIW9kXoijspHvjRQ
         ny5lrbejL89s3dg5MBonkXpAJfTfq6LysdWduwsS2jTqEOBGFVBrPTFUQhm4hM91yi1h
         fDD9a98h26aFzh9xxPwHCjPc5iyRUrcZpL2ITkkTLs4/EZhZ5P8vEsHRYz+jXO9nkyAD
         s+CZ2yL7n5OgyBZk2jlSw6EEPV99uo59Cf5VJ/dt6P8QLKApoYPLa0/2iNHNNwqMuqTu
         kAJR6iPw+BJuyarqgyyi3AGohpP2ZJV7et5DeoWtDKBwVyOdKtnEPg6JTEKxX3FeXUT2
         BYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FACxbqess0Pows5/Tzswl5y1waAC4sojiXabClOWhFQ=;
        b=FRvNDl9KYCu9EpB73whJT1hTa9D7vWBjPsTow3UtzWbFbNT/Krob5401w8iuuS/EXn
         FUtz1uJohU87/O7KHBty2BXe5vGq68NwarjI3hzqO0ryCipae9TTCcuwVnBrpiOWnXfn
         Z0cJOILWnDBEoA3D4KV6pfb2qy3wGHyGGhjbGzqbuKZQMs7WYP58uzuCd2XkfrGgtU4E
         0LKQFhZxoPJ7x3nE1IrzqI0epFUj/GiOkojY0frzLafxgAQGIF7g/SNMVgRsjIIHXC3R
         RFsm2VKYd0tAuj5+9cOvkEKUGG3cXoMOaBgWaTssIrocZN1TleGLfuxiXuz3Ac0PVGjo
         2xZw==
X-Gm-Message-State: AJIora+91eC5163cNKUgRGyajBhpBY720mONpMGYI2msXvTAu/yRV29n
	2OwsCpJQgi97o8syUj07Yi7D3R5SsjTG3CUk+XQIdA==
X-Google-Smtp-Source: AGRyM1vcp3QQY9elvVpTAygpjR2XrlZ2bVmjlkkgbXEQ0+1DHHwlXjP5EuCc5Ey6+JmWdHgoPXaeJgXkXORhzfdz/LA=
X-Received: by 2002:a05:6808:1485:b0:32e:c704:bcb with SMTP id
 e5-20020a056808148500b0032ec7040bcbmr704189oiw.195.1655867417948; Tue, 21 Jun
 2022 20:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220610074459.3261383-1-andy.chiu@sifive.com>
 <20220610074459.3261383-2-andy.chiu@sifive.com> <YqMzV/kXeHso3QW+@sirena.org.uk>
In-Reply-To: <YqMzV/kXeHso3QW+@sirena.org.uk>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 22 Jun 2022 11:06:48 +0800
Message-ID: <CABgGipVH08Wpxh1pEqUyebWTVKE=Fx5EBfpn-jRv2YLTUU19wA@mail.gmail.com>
Subject: Re: [PATCH next 1/1] spi: sifive: add PM callbacks to support suspend/resume
To: Mark Brown <broonie@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_201021_098183_8F198862 
X-CRM114-Status: UNSURE (   5.87  )
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

> Seems like the clock managemnet could usefully be done as runtime PM
> too?  In any case, that can be done as an incremental change.

Thanks for the suggestion. We will work on it soon in the future.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
