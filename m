Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E54FF532E9
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 07:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8V24oKvRK6xE696vU01UuUlK2aunHS7YAGGNgArimM=; b=pF8+RPC2AI7z2J
	QAJdtZQRDt1IRw77fEjXi2Svw7oNAd2n33swwfB8hDWLhzMT/2M39lnSTY2CNyr6FZ6f4+chMuJiV
	w9CiW4zkBqLqnEkhtcsBJZN6WnfXexWSXMjzkoWyKK8xpoi2NZTWNmfO719swWeAZAPJ7jH7fHEVe
	I7ZP+vDmeGXOBy888anQrtTqpP4dEIcR703DKD8q0X+ZKEmnDtr6sA7A21E5pyDRX7k+2EAtVWpmW
	dei4wybECy/0RSfpAs0pck0PSlDPrgrMtBWDboCJ69u0ojkpsjdxG0yZ4IQA4+ZdRLwUdSeMVDNSi
	P4qjKSQOM+BDNrRo37WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wc8-00000000vpu-22QS;
	Tue, 24 Mar 2026 07:55:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wc5-00000000vpY-3v97
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 07:55:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774338944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sOje9mFQgZLabauafbcXtKwoL6t2U90aeB7/bcx32R0=;
	b=ebUITmBwt4ivKUQkuNed9kyt4sH31Z8h3ZrbL7RGq+EM3gR23LI9MGVM1HzxZiDsJctNld
	PHMSbF4syNeGzPk11zB7kmAEhG3/tZKpBk5m8C/z0dHsIeyykBRLcwpB3PCOg8grW4WkDO
	t1GMIaJ15jTt6TRVBYAJMk9NNmnzgOE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-X2-AHHxvOhepe_nxMSSuzg-1; Tue, 24 Mar 2026 03:55:42 -0400
X-MC-Unique: X2-AHHxvOhepe_nxMSSuzg-1
X-Mimecast-MFC-AGG-ID: X2-AHHxvOhepe_nxMSSuzg_1774338942
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-439bab2d095so3738620f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 00:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338941; x=1774943741;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOje9mFQgZLabauafbcXtKwoL6t2U90aeB7/bcx32R0=;
        b=sCruPPDFAROjXIl4Lrdd+cNBrJtnq65TwelZ2P6N/80LNcM+CtGahcV4eWd4nhlHtz
         Gxbj5xPNMgNGz/z5odypT5Uke1jlzCX5x1kL/ihxlnGsANAXFVej7C9yHE3vjMV9RMPC
         oqV0StAlb+yEWsaXeZR8HG9KPKwqR7U8TXmlo1XuGhfHUf0Yav3tAxzDQKWOJf1IUkRW
         JdiBKXTG9J+slWXJ8kwWmEgXQd2rcNAtxcB7n0byH5qf47yr3wTL2LQ/8m2/ooybRCpr
         9b4G3stqA6V45wG018bb6sJKddWh5tGLR5N01/7Rspg0nv2I9xXACgoXV61pPnvDD2wP
         m4Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXz6Vw6rJ/QkryfF5BQ8m4gPeVVz+d5wPxGooVCiV9IMk3jbtO8Pk1botP3OtBhyWEEd28w8pZeVJ9gxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykZ+tT8dfT+RCoGEnRXivE5aU5+2YT8X4vSBUhWC7f3D2hGO6p
	wrp9UCLxOuKWcRPLV331gjKGxr68UjmGr2XG53tC02lYLQCsbVwjApwyFPLeaPb74/hfxR3+M+f
	gMgkL4HDqOC8qTc6Od9+P+dAoc14FakQjjmBB/h4QlAonInSPZ1fE7Vp4DWYuExlZ/FVlNQ==
X-Gm-Gg: ATEYQzzOdDpSwtiaGTnlzJMfOYWfEQsdrsAuL7190Wka9p9Ms97HLlSk07s92/klAh2
	RroNsi5i7P3R16jPOXW/3U+eZIfPjCQ5Uicr8icNMPOatsjCsKl13rOM7Xr9P88yTpKtxD6QCd/
	0wZtI+3ezz0hUKeJKoRCpC69m7sWUES11EPUaI4pRvWWOpA+3W1lQxzqiVFT28sNWpGNYiJALdx
	t4gqJDL5llfiD33k4zuBzLS6XdiONCxLuahg0nUPqXtP077SdEkAtyqysA9Sq1ylOlPjPiWdvRk
	DkyxYgnjY4u1D93c95RWCAsJOxMiSDCHTmnfbMydf5mW6qWXjxzZs3yVwnyexw4a23LZvvKRRGb
	mYkO34yBSdqoct6168/D3U1xoGPiOfwP0RancoyHC7Qra0ZSiKPuBnhYv+ndHMF8td0ZMcOPGW0
	zXU1yi
X-Received: by 2002:a05:6000:1843:b0:43a:580:eb02 with SMTP id ffacd0b85a97d-43b6428976emr24163907f8f.49.1774338941592;
        Tue, 24 Mar 2026 00:55:41 -0700 (PDT)
X-Received: by 2002:a05:6000:1843:b0:43a:580:eb02 with SMTP id ffacd0b85a97d-43b6428976emr24163874f8f.49.1774338941179;
        Tue, 24 Mar 2026 00:55:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0b0csm34387215f8f.15.2026.03.24.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:55:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 2/6] riscv: dts: spacemit: add 24c04 eeprom on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-3-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-3-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 08:55:39 +0100
Message-ID: <87fr5p8xvo.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aXYAQ6fYUcTp43EJlCstCjxzVugcPNtwCrmQx9sdFT4_1774338942
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_005546_043194_04AED433 
X-CRM114-Status: UNSURE (   9.55  )
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

Aurelien Jarno <aurelien@aurel32.net> writes:

> The Milk-V Jupiter board includes a 24c04 eeprom on the i2c2 bus. The
> eeprom contains an ONIE TLV table, which on the board I tested only
> provides a product-name entry. Expose it via an onie,tlv-layout nvmem
> layout.
>
> The eeprom is marked as read-only since its contents are not supposed to
> be modified.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
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
