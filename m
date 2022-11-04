Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EEBC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 22:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I2oygw9Rx0eGkquTksNs863jJcpb51/Inj+3PgUR7a4=; b=jsnWKjJcKGQxYF
	cEa38e45sU7m9k3Ohuh6qkRVEp4h9CwMnrD5Yu621uD9VSuBKvIcMVrdDAiClBsCAUGZeYhDo2C55
	SGo0S2nfD+oXXHRSyqwiLs4p2ZdCR2piPhMB/nyxqI9VJbG6QrC3b7+cOLzDhhbKmlCQCJwbmxegj
	Od+BeHc8IJsCxFzTyVm9y9FvtCoiq27THWHhx7HVBoa5kyIrycEHipG37L9IUHiijQecD3WRuH9CS
	XrVPZpvw42UeVfUqcF1UgizQK7HJ9MXFdXt154jtquZQIc/25WMZxBvvdsdwQeNm0JcA3iKocS1a0
	37xt7cOpVSGFHAFD9bbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4so-005LMH-HM; Fri, 04 Nov 2022 22:09:50 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4sl-005LL9-9p
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 22:09:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id ud5so16748964ejc.4
        for <linux-riscv@lists.infradead.org>; Fri, 04 Nov 2022 15:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E5tz9kDARs7bEUpBgBU6vkYUGWPrxNGs4ZuVgd2D+O0=;
        b=e63z/xZTYHs+wM70ZKty1cPbCAJVughzXg6uyiyaGr4cCcS0EUngASMR2Dey8Nlmv7
         x471ErFdwXhh+agGiW0u8Eq3IYAq9L/OnLJeEXQe+A8bvEWUY8B4ZkTJcJ0B1+m52KiB
         S3AZIRjpXmbUkG4EZ1HigN+/i/Cs9nHE0sy33v10NAHFH3zW4n4RbfKymGQ8putGtZqF
         xxmkin+/H9oOa9ZTnOEa75YpnyUUUNQUJi/FSky8KTyQMHgg0kpT2SFs1RPgwxCDQ+4B
         EBg4GVS+Vk0fjg1pDV9mRzU2JB/QN1Ubeav5I2M8MjtQUXTu3efFkVMRmE9+3e37Iwv5
         u7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E5tz9kDARs7bEUpBgBU6vkYUGWPrxNGs4ZuVgd2D+O0=;
        b=x0Ywos0EVQ2a+yYdYlEvu5fBvlC5eV7QlrMFYOACS3nhbkcRVn4ZxTshc6aL9UVcAh
         IiCvoT3beTrL1imVQ8z27RWWaLTI4YDAkby9nqU2bkdO1uEWmtG8UzVFeA2uEs+9/NPg
         oA56j0O4ooYxAmNYgaSqxgSgotehDx6cKPqP/ka6L0t8ucvO17g1QRmyyJhGN1pfhqsD
         w70JRGMEgnkF0pEUzn9Q5Mffoeoo2Ge/MDLBwRMcJ3GxybNOAk24u6r8pyKMhgY4rVm9
         3T0DIPLntU8rZeEOaWA7to1t4vpxf+o/uaajTCFhcrh+UYMkByHcGPV+tcNp1ikHp52k
         Pa/Q==
X-Gm-Message-State: ACrzQf0xdQUMWqZh5MMchRZsquK+tYK0QL3fD4mvN59O//PuHubl8Qw1
	w/lb4YmhAQIcTbikJUwgb95mlpbCZBrpF5YGmjY=
X-Google-Smtp-Source: AMsMyM7hOSo+MPQXTisKR46l8SXpBysoB5PG9CesHQ2UESeL+vAR1QVi8uCrmFqSUiYhWdkrvAt0e9X58nXzuNA6TwE=
X-Received: by 2002:a17:906:371a:b0:7ad:c01c:6fa0 with SMTP id
 d26-20020a170906371a00b007adc01c6fa0mr32068491ejc.267.1667599781913; Fri, 04
 Nov 2022 15:09:41 -0700 (PDT)
MIME-Version: 1.0
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Nov 2022 22:09:15 +0000
Message-ID: <CA+V-a8u_u9Q6Hb8kOZVKFjGyPsc2HQt88c4y2Nh8dzx0XSebeA@mail.gmail.com>
Subject: [QUERY]: RZ/Five (AX45MP) non-coherent DMA
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <Conor.Dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_150947_360227_CE56745E 
X-CRM114-Status: GOOD (  10.70  )
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

Hi All,

When trying to add non coherent DMA support for the RZ/Five SoC, I was
suggested to use the ALTERNATIVE() macro [0].

My initial intention was to implement the alternative_call_x()
something like what x86 has and from there call the C function, So
while doing some experiments I realized that using the asm "call
<func>" would cause adding the whole lot of registers in the clobbers
list.

As per my understanding the only correct approach to
alternative_call_x() is if the function itself is inline assembly then
we know the exact registers being used and then we could add them
appropriately in the clobbers list.

The problem with the above approach being we have quite a lot of C
code [1] for the CMO and it also requires some register writes of the
l2 cache controller, converting this to assembly would be a pain.

* Is my understanding correct?
* Is there any other approach I am missing?
* Is there no way out apart from implementing inline asm?

[0] https://patchwork.kernel.org/project/linux-riscv/cover/20221019220242.4746-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://patchwork.kernel.org/project/linux-riscv/patch/20221019220242.4746-3-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
