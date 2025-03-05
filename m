Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDE6C28B24
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJEvfU69PAgTNPIBfhxmjp9X1CMUlS8lz0f4j9Y9ax0=; b=wRqNYpt/jXd9aw
	/wWJGnGoIHT+h+3/n40UWiLG2s0WSXILvFwVoMzmfEV4U0PhENAdad+BKHmWVr0qtzQbx6a/vxGH7
	ONt/Qf8krd99OlDfuF/YVmxH6hHA5LaZSd0t5QGiKaH+YqP1689SuCCd9Ndosd6MR0WVhr5CK4Do6
	JZB2Oltw/K2KBFzY43t/Uhvrd0ynJL/EPcjjbsAzI4A82ovfgekY6uSZJt/RcEb2R6FoOohVsNED4
	QBLn5GXbR/SG1nSHKLOZPdg0ZdrahN89UHm+8v7QoQSueeBjtY7RX0btdzQERcSstpawZKwSEpOvk
	t0y6lRRKwgXLqLm85qqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqHh-00000008STw-32zp;
	Wed, 05 Mar 2025 15:03:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tporx-00000008CUb-357B
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 13:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741181583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0dqn34a07lKcr5dJFV5JIso+d1clQqATo1u77Mk28XM=;
	b=MW5Dm8lJVGRiY//t0XtdIlKaFxu0uCaJr2/kZrSVvwqsByhKqLxW5zQYqQ78eTlywIAGCC
	m4fzCGMOQ1CkCcFzd9D1iHR/kuWgvD//8TWUnh8xNDNzHI66XOrhtH2FpRK/h3fZQ6L5F8
	JSI9wFRgGMEygcH34vFP20R1pS9ggbE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-eKVhEOOnM4mCiA39hVNXDA-1; Wed, 05 Mar 2025 08:31:49 -0500
X-MC-Unique: eKVhEOOnM4mCiA39hVNXDA-1
X-Mimecast-MFC-AGG-ID: eKVhEOOnM4mCiA39hVNXDA_1741181509
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43943bd1409so49562175e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Mar 2025 05:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181509; x=1741786309;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dqn34a07lKcr5dJFV5JIso+d1clQqATo1u77Mk28XM=;
        b=t1LZ4xZ9T0F0Z0lxCxrni1NgC8xFjea9dOqDfTDNMaamy+HrMPqmaa2jEmXxcHyH3E
         wEO5+PlqgTau4Ot4aP+GcMLtQQLx/C2zDADhlwDdR1pbk13wV8DvDZoGyNAqZ4/xBjuT
         Hi/LZ0qHdtNXxcO77V6jfJgXoObFNmEtHdSAiF1oteKqaUDlCG3iluRPWcjWRH2921TT
         HC+ds7+tAbg6WtZj5tFPIHVT5gKB8knWGAeB4GkRlrh4DIDbjvj/f4IHUdFjpgOsAq3F
         0l+e9CqLOrEGAJXj06PilJtmWEc3DVo/b622vh0l8LIUQl3jfg0vaisOfIrMJRFr2Vzf
         PaGg==
X-Forwarded-Encrypted: i=1; AJvYcCUEQp2ys5tpZBv6IfMh63LJI1JdGwmofek0YeriPedV96JO6QJM1fPZTYZ0bBbNDvWmmZVQ9rCDBDx4rQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqsT0ySPFuj9ppBBUXcz+gmHLau4r7C+QKr3V20EzMefPxV+gA
	67//2pCpUFtG5giokDj1eYdfSovPJHnOW7eCAtFADTzmr8EJFUemk91jJKGneSnw5K4DzbTG1KR
	PpvLQgeYU6KO6RJZDgodIzqXiOnVefC1olubD1yhn6D4EhflY/4tnsm8UnjT1NyvM6Q==
X-Gm-Gg: ASbGnctar++tVoMfmH8LZlH6tB+RySBBIQZ/cLFqpbEDJEDr9Ygme0sQRXxQ4CvjAXf
	Mn6D6D+h4dF51sI78ck0lAVeGehnblY8xl0Q3mDecBrREgqYkQhG3q9iGsd6ttgVEUQlklfLBad
	jHHz9Sm7c6XzhQ47dVQTlYkXC9PgSaoFhAZW3NwrmQOHC8Tl7Y82jiODOgoDuq35EnSlTqBIodc
	+JR3g0kUkO+35zaNqt/QIa0sG7TgUFTpRYzyeTchQLDNRX/w/y3ECS67PV/lLuvNh18eXCr6mUP
	LEUPbAGGRr6D9ZLphQFm81xpLjMK5VQ80yVjkIBGjTWXgkrvOgtYaELec0QlOXnYBasb4z0tBA=
	=
X-Received: by 2002:a05:600c:4ece:b0:43b:c94d:e1e2 with SMTP id 5b1f17b1804b1-43bd2ae54bcmr21140245e9.25.1741181508717;
        Wed, 05 Mar 2025 05:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7F9v/2ONxk8xFOjzjpCwwBkyc6Bvd4KwZ9m8e5e3MHZoEGLxssf5K5UetRRU+tpmyYly/Lw==
X-Received: by 2002:a05:600c:4ece:b0:43b:c94d:e1e2 with SMTP id 5b1f17b1804b1-43bd2ae54bcmr21140075e9.25.1741181508323;
        Wed, 05 Mar 2025 05:31:48 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795da5sm21372477f8f.15.2025.03.05.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:31:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
In-Reply-To: <20250305102710.52762-1-brgl@bgdev.pl>
References: <20250305102710.52762-1-brgl@bgdev.pl>
Date: Wed, 05 Mar 2025 14:31:45 +0100
Message-ID: <878qpj8uym.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U6shhQx_soAI2JTQ17knASHNBKvBiCsoIPlnGAuUn_Y_1741181509
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_053305_836140_0DBBAAC6 
X-CRM114-Status: UNSURE (   6.64  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The mutex initialized in probe() is never cleaned up. Use
> devm_mutex_init() to destroy it automatically.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

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
