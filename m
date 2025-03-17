Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9753C35FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YY7sfUp4Dkd7J0znp80tetqH06PntQgfnXOH/gbz4OA=; b=Q2PcxfRPWtBs/I
	lT7SswtUoZy+TVXU05UXfhMEoH8GmlLmO4RI4M2euOskOVtPDLOOdqq6gBd74Cjvoz54IemzuUg1Y
	Gk3VTVq8SAznWCt97ZUZTqDp+ViAQLhE1nA2EM2xifwlishCMhdN+1zAXWkB+Ww3h2OTgqXRhO6mh
	sA3ga57rIcwzi27Kig/eni0NVy+sQGfe/Czvn0BLzlheO76S/UmMIez8DAD1pMYcvbMuTQxLMkbvU
	KLV5ZnF5ZNE3/OVDlFP6rN2NaLO0JRC/F8IreCNUvZ6d2uJWCB6NegvWTmWEoPXDbfdmXqTRDafF1
	iN9CN1/3NhpQEZMC55hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA6I-00000002exk-3q46;
	Mon, 17 Mar 2025 13:01:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA1F-00000002dzC-16DP
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 12:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742216194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pLLA8B7Q6RruRJ/SeEP0F06UuUK/GekT/XdbY6Zuva8=;
	b=dpw8Ef9fZMrNYIlqz5K7dGdJoS+7uFtQcPQgZDId4Sjlk4ccdU2o+aKI6mLF6GB16WjOGR
	7sZV1nVK/v7xUxmVXZJgcrxb76/F36vdhGBMI6RSGwsaJY55KTKkywRKWAieuveJzA1DAa
	2xTV0QHrUvMr08QEgNDC+gYP9TSyIe4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-gIeiXOH0N7O89Bxsn3IHmg-1; Mon, 17 Mar 2025 08:56:33 -0400
X-MC-Unique: gIeiXOH0N7O89Bxsn3IHmg-1
X-Mimecast-MFC-AGG-ID: gIeiXOH0N7O89Bxsn3IHmg_1742216192
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so17994425e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 05:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742216192; x=1742820992;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLLA8B7Q6RruRJ/SeEP0F06UuUK/GekT/XdbY6Zuva8=;
        b=POALIpEeQ1C58seYGYT1vvPf6t5L7ewVJLWVagiBIGoKhi5SJnIgzemRDnpOqDqk1Z
         7/v14DNi9DpbdsCLz+1S/ElaQAc087iKlbrROBG0DFhkVRAcRrCYjhWRH8NmrFMBKKF7
         rXJWSqSqIgaD2f4Hf8ZipoX7DIW5Eh5HmAH0v5ENgPd+AfVwSX9vFLxCycqw8skv7aa/
         RyEjvK0WfHbt441gh8n9AshDb2ca+/Pj5Q52CEUn7ZofDrKZ+RwNQTFg3jbtaEBd+55Q
         gYh+zcoN3vOUgxJhibQCck/hH0b4gHIhbyywZv3bPniXOrsUkN28kPPWRtd6COEL3sfy
         3o3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4z88gaX8l3PVy2oC00ztyphsnktXrFz4URgwi0Rvfw32VfbqaNxwK6CzBKY6XvLS0kEbgMHwVcYnzeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBVtgkcooS37hlsflFEf5A/E7DnjtoItxglvrMeQv9GnQO3kBB
	uV6bouPEn/+8UTEQZA5/mCx2yFBOg6PeP7BPP/x+pbStDxab1LJ7jQ3E79A/GO85yMxUElJ2jLI
	fVJFoFJ+X4GVG27WySn7ygu0VmRzWJ+fGG5tTpA4U9ntMktA4Zjn1fRKc22ccROCx3g==
X-Gm-Gg: ASbGnctgiJcHDmDTfCh2EPisKWEP4gFNeAxNvXaXASr7/S6W1AN8bIvMOCwNppFarcr
	kiAyVEKgVwoKL5tT+7y0ufTf1VGO/FG1iIxgiwZL3Wa76W1xDvjjU3udX50xwGqABqmJLp0z6Ie
	BtfoPH11QgF5QuEi9QdGRNawXoHcMGQpTqYDFFdZT14mbx24rDUE8wwOT/H3Wamc43xcov8xDAz
	wqhrmge85FTZnL124THvQrG+7x6HEtMXAFbXHCz6BXnaiPW291bAC2vmaBv6ByF1TwgBVahiGvT
	9DzH1Z6v+ZcZKITDTZ1EtXd2M7ptvTRDOSD5gnCPLMZ5RYWvSLzsNs49S5AggOGbQ7MYVx0GsQ=
	=
X-Received: by 2002:adf:a189:0:b0:391:2a9a:4796 with SMTP id ffacd0b85a97d-3971e2ae2fdmr9145130f8f.18.1742216192256;
        Mon, 17 Mar 2025 05:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIpr8LRCQQZUxAWE1Jo22GeaEAUfQFRwAkofiJzd6KgF5dHT33ZaPc1Wl2+/7G725sqDyAdQ==
X-Received: by 2002:adf:a189:0:b0:391:2a9a:4796 with SMTP id ffacd0b85a97d-3971e2ae2fdmr9145110f8f.18.1742216191872;
        Mon, 17 Mar 2025 05:56:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fdda32fsm104214085e9.4.2025.03.17.05.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 05:56:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
 <linus.walleij@linaro.org>, Yixun Lan <dlan@gentoo.org>, Conor Dooley
 <conor.dooley@microchip.com>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not
 default to y unconditionally
In-Reply-To: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
References: <6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be>
Date: Mon, 17 Mar 2025 13:56:29 +0100
Message-ID: <87msdjdddu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s-86GeYFjDftE6sWic9NZ10N678Jrj_rnj6JD3cPKa8_1742216192
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_055637_379287_773262B3 
X-CRM114-Status: UNSURE (   5.37  )
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

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> Merely enabling compile-testing should not enable additional
> functionality.
>
> Fixes: 7ff4faba63571c51 ("pinctrl: spacemit: enable config option")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Indeed.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
