Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A8CCCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 10:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izPcHkLTUiZaQZKFTpPORM1nkTfv8AUtCEhxuD047gw=; b=QpDqM8AuuF0EMQ
	3yO/X7vMDjTgL7W8ZA66zc2tWkimnd67JkqtbTs47PKjQF+NMlrqNTxBtox8qt492PpUWk7i8L90v
	Zrgxp6+2QmO4DkBMlO3+b46Z6FUMVvRj/gfk2G1TJrOheI0HS4IZn6qlRMvUj3tjkqWvLkzZt/FBp
	JqLlfcziljfezj+xvb0ciUhbgxY4GdAvxt3623SGpAMS3YRXMW2DedOjG3g7wngK4zOSnaGlglRG4
	VcFgOkqEPGHXWbU+JxhltIh0PLuBc2KZwpeeYGY1x8f8F9femEe4dwj4c3nZAZ9rUwPJ758cOmHG7
	vh7e09W/cyhYxogMBHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3gj-00000000phS-07b7;
	Wed, 29 Oct 2025 10:45:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3gf-00000000pgs-0Bsh
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 10:45:55 +0000
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C69BD3F5B5
	for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1761734744;
	bh=0tyHkxDgHNgvSmrogo42iKYjIzo7rgV6g6hOBIWoz3c=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=rp6J1FUSoDZ7Ftphd2LlVZyoVkx7RbpltjIflfEg094YWlob2A769aNRhjoFX8FDJ
	 hGm5og7bnPXAcTQS89rNin0jXzlr1kuAsQILYWKeu5vcVVU1AGqqAkRDpc12dUX54K
	 NrzScCJ89rZYjSQgunN9sktSStT1WJk7UVuacVI2KDgKvCC8YdzUS2KJYPaodFoOm1
	 2IgTSt657T0ErftKOyHEDBkvh9tsgZ6tEoTWNTminlONl1tNShKKW73Uat92iWW7p8
	 Srv6W2xvJ4hclPxXVh+8LgGfn+u/VeB8jSS7F/Ubx9s+VfJV8FUetOuHgmmNslpEZw
	 TihMEDQsI/iUQLZr+edpVoocKjz1jPR+6xeOBbeGIBdhr2NwXdmOO7xUcpFyoVdsdy
	 cd5HI0Rs2ZQ5VtosfQAwW34BcKpX0vMlhuWnUXg5OEMulgZ97W/PC3gB/4BU0Z9HgX
	 0DL7BhqSfJG9lzLR+SdL5usna3Cpku22AAXxSrwPH7jbYPdlJloaBoJ5aRPa0Uk7sF
	 53rNr9VPKiSJvSTksFcQ0bquZOFvGDJYZB8PvH32ZVB3/bRSQzn8397N9ol/tWVb/w
	 CuBLH8yStmxsjOt1H0KJCG29DHXd3s0VT8JBtUqWFTytrORFtEgXpvzqeoIGhf1/Wt
	 PXlq/HeUE3LhjHDy9G37F37Y=
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-934c1af8bb8so9585533241.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 03:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734743; x=1762339543;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tyHkxDgHNgvSmrogo42iKYjIzo7rgV6g6hOBIWoz3c=;
        b=Ysavc7IEFqeFNXFWY+1EFZTbQh/RJb8KRFKrGmHplA0Oq5r7gySxoUXuMN9GmkOAJX
         tsnAYNzJigC1UqXV571O7/KVRv34j4oBvRU01THLPT5ocezZQonTfZIrCDC5Xl/aJN0h
         tvgTjIs+1Y4RPpQGTb6GEP5RF9Zy230EQF305PvQMMwcVoV9DP9wISn8JlJKlGNR0EG9
         kawNpLEOMB1vGAPLxRwXGwHUFHS0dlUre8rfgE0qQnr5g9XefyUy+z372MCU30SsBFAO
         U0JrYEW7sAV9ItwdP536x5LwdJZfD25OyAcYeNKAY6/1Zs9zGmcDDKaMV+KHsZZtSP17
         q3ug==
X-Gm-Message-State: AOJu0YxNQut72ZLKjZn/htWfm1HVqfWBTivor9XaWGMXboPxbFb+I6oq
	nkoAy51VC3Ujov1HXyytvSft/k83G1s/99mKmfbYf4YKSV5qJMDsFJDBl9VBW4nJ5MgcKoUw6gr
	V7rlHQwq7DoqWCkiA/D3lVoXChEtP8L4VHSAsg+wyJb0EA8mOEl5Jy61jFTYsPQ5SRQDHpVl048
	9z3ZGko/k6uU21AoPyNxxxQ3YwQ2ARjDvEND3f7zgZaSpS9e/uAvL8o+mfAOdu3eKCplm3
X-Gm-Gg: ASbGncsuvcYoN7fXp/kR/1a6XZeFcWPi7A/StD/yCZXqyWh3Xqy5NS1vKkZqZ7mEyje
	PhTzVo2jqB5qKrL+6T6Gjn84egBLD6I/B/Jboo+bGolURca7cxjE/niA3DOpGUS/HggPKz4ZNnW
	OlJFqVUr9OFP6f1eZuzgTnl1zb2OuNfPrw3I7nIoWrrwDFP9xP/pEfRor+xw2WYKA0JwIpKln6G
	QI6+Rn7tB6V
X-Received: by 2002:a05:6102:66cb:b0:5db:3c5b:abe7 with SMTP id ada2fe7eead31-5db90577019mr433731137.4.1761734743676;
        Wed, 29 Oct 2025 03:45:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOVt8iQYzU/SmRrxo+cWMPRTylIgThuFXCVvWS3O6j7CcEyxEorxIzby6E/hdIkwnQRzyJ6Gq3Z30LFhvJABU=
X-Received: by 2002:a05:6102:66cb:b0:5db:3c5b:abe7 with SMTP id
 ada2fe7eead31-5db90577019mr433723137.4.1761734743376; Wed, 29 Oct 2025
 03:45:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Oct 2025 03:45:41 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Oct 2025 03:45:41 -0700
MIME-Version: 1.0
In-Reply-To: <20251029094429.553842-1-jiangfeng@kylinos.cn>
References: <20251029094429.553842-1-jiangfeng@kylinos.cn>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 29 Oct 2025 03:45:41 -0700
X-Gm-Features: AWmQ_blVMwdcu26nurRyUZs5wcTHqNKLb4D73h1KM2q_eXnA-ueZisVJmUt935s
Message-ID: <CAJM55Z9SMwV0Lrf2i-D+1fe4L+v1M6aC1hrQoOWi6Rc1PA-XTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Build loader.bin exclusively for Canaan K210
To: Feng Jiang <jiangfeng@kylinos.cn>, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	masahiroy@kernel.org, nicolas.schier@linux.dev, palmer@dabbelt.com, 
	pjw@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_034554_586237_AE4E4883 
X-CRM114-Status: UNSURE (   5.98  )
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

Quoting Feng Jiang (2025-10-29 10:44:28)
> According to the explanation in commit ef10bdf9c3e6 ("riscv:
> Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210"),
> loader.bin is a special feature of the Canaan K210 and
> is not applicable to other SoCs.
>
> Fixes: e79dfcbfb902 ("riscv: make image compression configurable")
> Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>

Sounds reasonable to me.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
