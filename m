Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DEBCD5BC2
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 10:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ol4f4Yf0PvD/K0DJG4WR3s99eJBxxXIRNRwkBlEtIQ=; b=YbEMI3F2nS//8M
	QwQh95pJSexlc1iRfl5mtU8CwNAUx35X/jOS3mC614ll4MTX0f8UHJmjKJlGv1TgHNBFPkQxHi23M
	c7Qx40YFCVwSP+9ZK2KgfUGaOxwgKjDjsBHX4oukz5RXRgmYuaAlJYOSU97ZAGWYmj596rRCmrKoC
	ELyd1ZL4Q7Qr6zHw4+O1EjjQ5FZTOGiWMK6xXYRpkZu15yQ1nA/jLRD7JQ3mbCewq84D/hZ2V6v2R
	P8Btht0k5Nrzw1hZdWj/qV4vfgpdNeGunkLkQwkySSW9kDAvMGgtCVTah4oiiwT+lZOvQWLDBqKWu
	czfp443yw84gzFTAcXUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUzN-0000000AL4q-2tbX;
	Thu, 13 Nov 2025 10:55:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUzM-0000000AL4b-0Hsi
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Nov 2025 10:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:References:In-Reply-To:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oYLy6f12Q2Jboam6/0ZuloRUuDWcgvKk36LE2LNyfbo=; b=djIm/G7Q7kK/puxT9X3B0LhhPN
	Yr07R3zuWXcS4YCs6ghiKGJsXIJMlp1Rfnth0qzjy2tSVBeePUBfwOEej6jd/9vND4Dv9bWUeNyeE
	CjEH8a6v6FPXzlsSfyTUkm8f2+7coKGr68L5yCxM6ANYIUXqKRX8WXLiCMdgR/eowxwEOeW7tyRw6
	j41RrncxRxvjvgdFCSqPwqG312K6KEiCwfZ9HX7T3mw3IN2Pk6Gf8Xlpd0PKU4oQbltfy4AAsjwRl
	xrYBq2u+A3Pyy0olpmQOynsTwpiJN8/YVbZ+NQjOS8jPKQUMhGtckbfv8WsPucmitcK8zbRETnwpK
	Yrov9vxw==;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJU7X-0000000HZgE-1rKC
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 10:00:11 +0000
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so100620866b.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 02:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031328; x=1763636128;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYLy6f12Q2Jboam6/0ZuloRUuDWcgvKk36LE2LNyfbo=;
        b=huGtXNEXxX8qsgol4rwLaP3+djRcJAYJDgxNTGKuYxL0tMKuItz+z7fLwNBN/Zs3BT
         7uVw27zD3dRysjfhjHvS9IFz7NkiqhvBQF4oADhkQb32zEq+cG/eU/48ebgNSjB03EMo
         RQBf08LLTNSRQf1P6+NS/XIlfdc9aLgVoHORpRFaGTT5GMY6iriz4e/MnWyE1g9qBQpD
         lacMJ2RCnztc+OZHbGKwNBbrF7lmApsJk6cMKNkfR9HOVm7StYcCgbSO7J5hgO84xpfW
         BqWnInMuguZcnyfbNzwUhiuP+DcacrMGEjHW0DBuYcPjy8QyppUcigSrx/mU4tOUdfN1
         8qQA==
X-Forwarded-Encrypted: i=1; AJvYcCUN6BuOLoXZeS3PlkVz2+NPGTdCiQC615Dh5S4B7kkqTMZDIYYpq/sWaE+rIXfgKCHjyVucKduFvXp/Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxSwmZRPQFzK8f/1uKDAuPzEEtDBW+FJQW2/FGqDD9nztqD+By
	VH39d+h3rNyYL+MwbGsfiHIseFGwNBCoEgaZ8ZgFBknCnGdMHJjdOqeq0yU/URwJ75YTima5hVC
	BooHntn7QaXp7CsDRdyNRlrj1cicfbaE=
X-Gm-Gg: ASbGncuaCecDoru/S0O6FbuuE1GDdqJhvpPfRNp5xrUhXgjG9qnK7WP79NWOJcHo3E/
	RsHoh2E466W7Ojp8GxbcrrweZSfvIarPuDXkCbNvFHN4sobMatYZZxhrWvlzHGRxLVhLG3xe+MB
	H8sufku5/FneDfRqByY+RficUAtLz861kIHTuYOdBcGNzhjJSI/dRmQKWHUt56o5CpZJb2bJcS3
	+6D6pe6I008tPz8YnPanAwD9bzkEjnSXNy/wPsFhnK6OyvATj7cSzn22sw=
X-Google-Smtp-Source: AGHT+IFCyVqsw2+mgz8mfuCEPNfXp0t+5XcyTI715hdb63+s/UhCXEFupENodKnAqz5ba3myi1+u0of84SAgLVZPwRQ=
X-Received: by 2002:a17:906:dc8c:b0:b72:a899:168d with SMTP id
 a640c23a62f3a-b7331a048efmr738157166b.13.1763031327797; Thu, 13 Nov 2025
 02:55:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Nov 2025 02:55:27 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Nov 2025 02:55:27 -0800
MIME-Version: 1.0
In-Reply-To: <20250930100318.2131968-1-uwu@icenowy.me>
References: <20250930100318.2131968-1-uwu@icenowy.me>
From: Emil Renner Berthing <kernel@esmil.dk>
User-Agent: alot/0.0.0
Date: Thu, 13 Nov 2025 02:55:27 -0800
X-Gm-Features: AWmQ_bkFwDX5GCFZoiVVhocVq5p5vwtP3bOMdOUIgJzbGU6s45NPbnBPHC3DIsQ
Message-ID: <CANBLGcxoD5w7ApN9mNHWym2oo5XscV7B0rrU5MF68wiS52Eecw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: riscv: starfive: add Orange Pi RV
 board compatible
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>, E Shattow <e@freeshell.de>, 
	Icenowy Zheng <uwu@icenowy.me>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Zhu <michael.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh@kernel.org>, Yao Zi <ziyao@disroot.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_100008_424537_AC238586 
X-CRM114-Status: UNSURE (   4.65  )
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

Quoting Icenowy Zheng (2025-09-30 12:03:17)
> Orange Pi RV is a newly released JH7110 board by Xunlong.
>
> Add a compatible string to the starfive platform DT binding.
>
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>

Hi Icenowy,

Thanks for the patches! Now that E's patch is in Conor's
riscv-dt-for-next branch
will you be sending a v3? Also please add a cover letter when you do.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
