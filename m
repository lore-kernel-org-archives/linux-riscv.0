Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27ADDC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 22:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhWNx9ssOC5uNPQQTXc7LsmEx9knxY7J2DcwqG8Kjdg=; b=Hcl4nd4gF5F2yF
	I/vj7YcONxC7AohsOIW+G3B8ZAFm7A8QV3DjIkHev8xvq1LOHMSUbnYVuWIRETP0jzLYbYobrtz80
	VadYU5dxps9o9GRCPbN/qnEYg4zFmoFZ+JLMFUz0TwNkM2jaTJORedY0QkGDILDH6K689Pyk4r055
	gdeIg4ERk8XrJrYq5cf+sGK9UU0XAFGLZFtrUOFG3Y45Hl8fKiG9IvV9KrtNaI8YlwMBxv5sJvuWF
	AL8BV8kNohL+o7YGX5fAW4jnmiZh4rBNwBxgnXRj2/8QtBNxcmN4epqX4oGuk5r/EpkECHeIJ7lLH
	WIAI07Gn8Pb0MI5qK9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r31qE-00GuEq-0b;
	Tue, 14 Nov 2023 22:25:06 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r31q9-00GuDe-2n
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 22:25:04 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5bf5d6eaf60so65290427b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 14:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700000698; x=1700605498; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VZH1moAA0yVg/Bb0Aws1epxcC7ep8j8z+Au9OoiC60Y=;
        b=epgP7tHBLOm0WhagOsn/aAzEISQh65faB0gHmElnv7CV1HHv/Xlwhdvt3uMU2R0iCn
         +RleUnUCJnebO46tl7/qMljnvsdiSrLTcPAERPj8q5u86JddoFzjdrZLqfgki0hH9wza
         KXu45hzyyW3ciV9Rfygoi7RZBLHMS4GH3cWPg0wjInwjdvYNhyVgGkREndP/8BXg2Rqw
         Ui6ITBeQIPcRvslw6IWIidhyRX1uE8pDYjm8qwziC+DiPrsRv5zQxIW/+TCqN3oQo14F
         DXNU3880vr54zplJYCpRC1UyKoZE7kEAB5nAyZBrsnjjzRQzYHN7x+LzL86d8VBJiANB
         uoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700000698; x=1700605498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZH1moAA0yVg/Bb0Aws1epxcC7ep8j8z+Au9OoiC60Y=;
        b=sDrFgdauIDxhMPodmFi7Mee57GY6kQDU/fW/zyk5Ky/eFVHgYQHV5Z+3a09eu1s6kz
         mO3drbyDNcdcPgHIYqC7wn360EGMbHkAmjHQwqjAPsTnAhh5Um90GnQmzCTE0pqrRqyo
         TIjA7WU+Xr1xhSNC0nJB2ibrWYR7Em/ZIsQoFYnDX8AZDpkvJzmnSv70Ww6BF2+83gLq
         rksKzUsNRovTYsJa66g4dBdpo40GCQ9E3NUx97uZz5TGFqXhBJkTtSho/ARALay83f5i
         mKLBTr+n9W/ph2TNaoojBR/5DgJtYPPTD++twrrCYss16xR6RFNDtnAPXKdsYBjHtEIk
         ykqA==
X-Gm-Message-State: AOJu0YwaAmsF4Sio1UNDqci3f+A/yJwCijiDCPhRvIBab2G6p37TVxHL
	D1S/awahyTr0LLOc7RW3tdFzMg==
X-Google-Smtp-Source: AGHT+IEz88PTlxccW21WoEn2f42pE+pucQRcPi0Qyotu8SKV4KH1w7/IOT3aZDt9e1YeaqgPDQ7h+A==
X-Received: by 2002:a81:73c2:0:b0:59c:aea:d877 with SMTP id o185-20020a8173c2000000b0059c0aead877mr11208270ywc.40.1700000698319;
        Tue, 14 Nov 2023 14:24:58 -0800 (PST)
Received: from x1 ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m1-20020ad44d41000000b00670c7fd09cbsm3706qvm.95.2023.11.14.14.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 14:24:58 -0800 (PST)
Date: Tue, 14 Nov 2023 17:24:55 -0500
From: Drew Fustini <dfustini@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC and
 microSD
Message-ID: <ZVPzt0w2+wNz6PnH@x1>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
 <20231114-th1520-mmc-v6-6-3273c661a571@baylibre.com>
 <20231114-subsiding-tipoff-f3c15ef22985@squawk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231114-subsiding-tipoff-f3c15ef22985@squawk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_142502_129382_715EAE07 
X-CRM114-Status: GOOD (  12.41  )
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

On Tue, Nov 14, 2023 at 09:24:40PM +0000, Conor Dooley wrote:
> On Tue, Nov 14, 2023 at 04:08:00PM -0500, Drew Fustini wrote:
> 
> > +&mmc0 {
> > +	bus-width = <8>;
> > +	max-frequency = <198000000>;
> 
> > +&mmc1 {
> > +	max-frequency = <198000000>;
> > +	bus-width = <4>;
> 
> If there's another iteration of this patchset, can you use a consistent
> ordering for your properties please?

Bah, I don't know how I missed that. Thanks for spotting that. I'll fix
it if there is another rev. I still need to see if Jisheng's is okay
with the most recent changes in the driver patch.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
