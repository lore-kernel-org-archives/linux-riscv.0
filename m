Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5CEC38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 18:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OutTi2Z/BFxJ+iBXnGg0JoaVYc6xgu3KO9pX3h816h4=; b=vAjTTYIlan4Isb
	Oc/FQ1RGJNm+h5pXG3vxLg8xK15wmBoLPXRTEr76o1YU0AcPkMha7YUxF9yAOU44NgwSzLJDn5YnH
	Zg0QvfESl0zOldwwt46Ip79VNC3Yv9/4NvcRHLt00seeHz08690Op/xRGUTgj2JWbuU/QuS6iF63a
	oa+zq1hhaDwPzsmkpXwBqmMKRpHaAkNrESXaemFKFpeQwCqj0DeqQD41Iah3CzESEjJqj/+chECPE
	rcotAuDz6wc10jWnWnNAYNz29Ls+WksoJy5dAGeqKeM9t1G7igVzh0FVyq6/QflqXccOm9n69+PQw
	Goett5jhCwLZiUmYHD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWM2i-006b9E-NW; Thu, 08 Sep 2022 18:14:24 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWM2e-006b7r-TT
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 18:14:22 +0000
Received: by mail-pg1-x52b.google.com with SMTP id r17so5075290pgr.7
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 11:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=eMRpvkz5BHGreaY+PFzuwrNAMyJo1PrgAXdebzyX1bQ=;
        b=EAxgJt6mMMItIbhwv7qA+mTjUUPZvXlnbr28f8qnEOfklqfv8N6sl5jr03xZo8m7wk
         O33rZvP4lC2AXuGMkCcO4A3sK7x02HGPc8tEF3CaJjVhYDJ1gfkchwRH/WHIokemDGn+
         /U4Y9R+uW0qlwl0cB9bp/3Tf2xD9On15uwwQgU/9iFZOf7S/M20oQJL9aR5eQdM/lsEN
         WPfqAnH8fRjIo0OaSB4x0i7NxhhiKmxLACM3YK429Dg7ztSxuP8Fi60r6+gzic99t4Gm
         u3ZYmid9TNY1uJNg124RKrdlEThEO6V8U/IfbB47DxoF5DuFNapU1EgwbTOIlm8tbvA9
         o4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=eMRpvkz5BHGreaY+PFzuwrNAMyJo1PrgAXdebzyX1bQ=;
        b=CnXJwaXa6utRlmziMjeNATJa/ZS1d21d/BnUvwYFR0I8bYlWP/FyUMIt9CHJIlJqrl
         AeW1Ud3jJ5Ze5yLs+fXtZjiCR2EV3GL/B2GvGdatV5Kx/X64XQ0w81NFK8frFETkoAJ/
         J44JmqusGVhnCeJ0Sym3hl18bZacY7Ofsq5sbIKI1oh+AijrG095NiNu4Uk1IkeqZsWa
         0VwY2m7fSBv+GhhA64B0mVnW7izvVWcNkqA3uGPqkKfHdW8x0gNnv3um1zCpJKtlIJ+s
         KDlbEFLj+5HfcyWVcRYl0R21vXrnM1AYCZMU+U6C2MWYHwOXH5HlyXrPuRs5KfOrAGet
         TJbg==
X-Gm-Message-State: ACgBeo2YAe1mI9nQBv8oinY7708mtEUsP95W+ae4LszLkSKOLoMskkrl
	97fEO8n4AtNHcuC1U5mHaeufSQ+1eb5ZIBq6bf0i4A==
X-Google-Smtp-Source: AA6agR4WLD24aEKV4Oh0WDDE40IxlBZK61fbyCC5sRP9hW+BrEfQofo5Xlteox0NOcEaFLEubNVXfkCyuOC1shnFH0Y=
X-Received: by 2002:a63:8a4a:0:b0:434:c99c:6fd4 with SMTP id
 y71-20020a638a4a000000b00434c99c6fd4mr8584040pgd.24.1662660859653; Thu, 08
 Sep 2022 11:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220908170133.1159747-1-abrestic@rivosinc.com>
 <CANaf2scedFxwDwBYNwk-9Y_p4O7Sc62FFjZPptdZeAs4H4JGiQ@mail.gmail.com> <CANaf2scD5QtgZuAXru5=uaZOkAQ_seHbJO0YKmT07DCTDLwKQw@mail.gmail.com>
In-Reply-To: <CANaf2scD5QtgZuAXru5=uaZOkAQ_seHbJO0YKmT07DCTDLwKQw@mail.gmail.com>
From: Andrew Bresticker <abrestic@rivosinc.com>
Date: Thu, 8 Sep 2022 14:14:08 -0400
Message-ID: <CALE4mHpz6DpV+jq2uqic7DCqv3a0qcYqov8+wjhZSVx5-2nkEw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Allow PROT_WRITE-only mmap()
To: SS JieJi <c141028@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Celeste Liu <coelacanthus@outlook.com>, 
	dram <dramforever@live.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_111421_188757_FC998282 
X-CRM114-Status: UNSURE (   9.85  )
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

On Thu, Sep 8, 2022 at 1:28 PM SS JieJi <c141028@gmail.com> wrote:
>
> > https://fars.ee/1sPb, showing *inconsistent* read results on -r- pages
> > before/after a write attempt performed by the kernel.
>
> That said, maybe prohibit mmap-ing -w- pages is not the best fix for
> this issue. If -w- pages are irreplaceable for some use cases (and
> hence need to be allowed), I'd suggest at least we need to re-fix the
> read result inconsistency issue somewhere else despite simply
> reverting the patch.

Ah, this is because do_page_fault() also needs to be made aware of
write-implying-read. Will send a v2 shortly.

-Andrew

>
> Yours, Pan Ruizhe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
