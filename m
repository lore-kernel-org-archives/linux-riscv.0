Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E65C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJqBd/c0pZcADGJTPkiC6LRFA3DSnXxlZsYutdUkDEQ=; b=4Pz9rkzbI3reyE
	jG1vBoK9VoiwDJ0ATcYfBr8PROarNtiypXRC050wgvqVQIOjrD7+q+hCCktQ+ZDPlSvFPWqptG6kM
	1pfL9+A08pOiqn/EhVQRB2OR3iRv0OQeahYQewfAanrmD++BpNsT3byUXq2mKE5D2TePF5Rg2dY6N
	O5Ak2EpGO0zRcDeu7U9CvsURZ2Wk8RuodNTg+Ie6vmQcIo2vY+KNOiBi8rLDYMuPaN3HTrx/6WVo9
	5yn13XLr/67nMT2Qn+tT56oTAJ7W+R9gTtE4UHPwl+vDmckkNCtHvmjo8mZigehktk27uMpDnL4Rp
	NZ5l5XEKdk4oPHa3PDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fsA-00000005q0v-0ISb;
	Tue, 15 Apr 2025 12:58:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fmV-00000005oyF-1QiW
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 12:52:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43ede096d73so39038335e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744721569; x=1745326369; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIpJFzBiRxBxNKge8gwRRjQC9Lg+LdbOBnR/KeoN2F4=;
        b=DpeaVEWwO/Q+Wvf6jfBtfMhkkwCiVpHD1uj3IWB7qtgkJQqHHkFOPaa9YNaJgW7Ulb
         BGVROOBMpofucKAZuDVp1301Xj/rbjvzsbNHoNnnA+oKQXzwaO4jcuWy3MUJi4ajhhIP
         hkgbJI7Cqw4XC0T6qFDK2ShMDjKFU6U3m+j36U8Upli44XPWaC42wy2kXIHTRyDH6XeK
         KrCYnLVVaISSSWQrlh8tb1vLtUqAmxUuwWQts0ze8CowBQ1yKRJ2gijwwjHSEj1UYI5j
         sJgWPWu3wvf8O/SPNMhS0tYLL/9lGoiaOSw8y5v/uySqRK0ahMjUWcUyVQcq4V78BYRr
         9Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721569; x=1745326369;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QIpJFzBiRxBxNKge8gwRRjQC9Lg+LdbOBnR/KeoN2F4=;
        b=qduAZHBxNjKLLiJdE8a3tVb8JI9fv8/uZ7kpnReFyw+O1kJBzdmjN1IO6z++/R5k1V
         2jnSMbWUjsp6Em7LuX1jK1gXnQo1WR4JlUia1tGZ0VsnPCgG0seS46rYZxyigM7b3SDh
         nLGkwZ8teG3bUWCXo3gzHtXov21VKp/U4IbdKM5lvL8Ql1o9FgcR35X3JE2P0AuhT/5H
         NovjCa3G7lDAevp6jnLhultuz5PKTjXBxb/wUw7YNujzGwYAGSltYk7HcIk68//tLSYa
         E2BvfSfDo4bxD7I9H3ZSgpd9355TkHoyOPeYVh25cuphdiicHDpBarE1+g4rEVBiA4Qj
         Z1qg==
X-Forwarded-Encrypted: i=1; AJvYcCUxgRAAqYbc177obrPFyGFonAcUvwLg0GYzwQGbp7cUdjID4O/zjJeeVlciEPJJrPlkWAf8cIUuHGU9qA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybZQ/14ZI6YM8/M7IPwZ7i4xKTTdffrl7sFkLjetRuc1IJt0yq
	35/2c97/k8h628CayWrdHXqG1UrSaDJhuOM7umX9uP+IvcyPs2uOGCK10lZU86Y=
X-Gm-Gg: ASbGnctQRawaUSP0XE9njV7hsF6m1t/uYudGJ/mw3YldzSRwObJMt4J/HH7cIMEEB2l
	boVgYf44FCRIweLktsqs4VVokxziwnI18LsgOE2L+p0mVJS3NQRW8HDyXjXzcYM93ESJ0gFEIiA
	mXUt7xadkx4UAujcghyfFHgZOfX3P/8/sCeTM6tw5MwjQfopEuvZvqLK+Cy2bMCzSRZojvMmf55
	KBkRLboOUgTkr6VEYa56cpWRqH9l1R4qPNZ1yVrUfLBfdUggdqFxFEPDV7nlbdWRbKNZi6xnTLn
	rpiH9CntJLp9PgJygYkof/tG0ClQLG8ZYpVWrPI=
X-Google-Smtp-Source: AGHT+IE8ZFye7fKJN/Lmt/JH+cGrKzkQSrAfNM/hv/kW4P8wD6rvRDacsRLWQTapc+dkn5240h+uDg==
X-Received: by 2002:a05:6000:420a:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39ea51f5d65mr12661246f8f.22.1744721569233;
        Tue, 15 Apr 2025 05:52:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96e912sm14384664f8f.31.2025.04.15.05.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:52:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021938-swan-facedown-e96a@gregkh> (Greg Kroah-Hartman's
	message of "Wed, 19 Feb 2025 15:20:48 +0100")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
	<2025021938-swan-facedown-e96a@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 14:52:47 +0200
Message-ID: <1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055251_645304_BFEBB876 
X-CRM114-Status: GOOD (  10.88  )
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

On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> Add helper functions to create a device on the auxiliary bus.
>> 
>> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> the same code repeated in the different drivers.
>> 
>> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Hey Greg,

Do you need me to do something else on this topic ?

Cheers

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
