Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DD8C678DC
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MMN8uMjUVazgTH+66iC+p+uua9PmsfmvN4bitsD0fc=; b=AM2Dcb9fWKIL17
	LD9NowU2H3cMhEmWAMaIC3/PAQjMN9pVpRQe3UZhpHqDP7oF2R19Jd6OvUxpqV/P0Bg2OmiJCNL5P
	hlN+HMFvbde8M+aTpyDvkXc3zJdE3cc5+2rEZCHump/f7GNpYTHgx3jXc+1lql6UdnOUI4/IxEuWe
	ZK7a2QbQp3GHeeG6tjZMd4sXF8TrUMZ/s7kl6mtkTyPkLAtMeDsMDDbOC8IQjPAmM4ELKJ0b9SZCy
	MshUzsZSlVoYlnnGJ6rnOnMUPoyTF4oM38a9dgOo75TNz5ZJVGC9ja6zWyklGjfdlkCwWfaUooPHz
	wOPf9psDwNLT6maLIyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMn7-0000000ADD4-0OZp;
	Wed, 11 Jun 2025 14:51:01 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIYv-00000009bBw-3sy0
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 10:20:07 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7d38cfa9773so394851785a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 03:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749637205; x=1750242005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CMngYw0p0kJljlRaE+vGqGJX3Zi/z2Oh3oWxYgFvc0E=;
        b=RPKjp6dPMdRkUCbF1xROcO7KOrHlCvwrIMYwYMhesfvULXyaEUGjkcYThuxlIUNOIb
         3wXr8OL21+nJYxQE0e8hWTbpFzbGcl+yzDa8Rm+UjzfkgtdlSjiVqd3SfcOMo6sWfGFj
         CS4dVVDECaWypVhSJZJhoCok3otwrlFrLKkANX0VJX5eyTNiX/KF/L3bvyiqRr2l8QPw
         y5HJM1KlfZMN3WLl28sspyGGcpe6Hp/bgvHxRhM3ckHPZCiJRjOpi9KaVFbROoBSm0+s
         0oJlvhhaUS+FVuLrGn8j+RsLAJ+QQFGGKHNvGiPhdEakVeSM+kcIwgzxbHYnkrM64tnX
         TbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749637205; x=1750242005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMngYw0p0kJljlRaE+vGqGJX3Zi/z2Oh3oWxYgFvc0E=;
        b=P8zGnCEiPYc7d4m8r1pPXhDngsQX/TUwySUKXHMveavZpqG9vs4rmhCF7TZBg33563
         RBuYtzNnfaaxer1IOER3PZbAkKUlYYGv2yWkEZ/qR9A+SwzhvI6waFZFpNWnInfFDmH5
         IdoWzj9RfFpL5/Q0eXlSnwRSJe6gRroyiA7VNf9LpE29/yLjXe8T5mypqPa/WUkkDVr5
         eDai/jh/Mqk1LXuB2zAoEjMbQF6d4WplJ9xItNOgbu5QcWYKujvimBOINzsXxWiEo9hO
         LfOMJ+CNkV9QS+7obabJZD7JTZn278VvuK0iqGXwW/3cji9aa0xEsXz6FrJwqKwaGxuy
         u3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXAFl3CNwcPojbA/uJnagfa8nvZEh5Y47DZyJ5AH/nBfLVgAdXfMkasIfOyQoQ/M9b2ID25I03Z859W0A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwwv4qVtnNagvLZDF+0N8KFL2Slnc5H3QMgtjPgqbLQXP+Hq5a
	+MDqh9H0w2s1PJ5qRm8NX62Tc2JNV+hgnP+SKTU5RtihYYhQIXzFdsoO
X-Gm-Gg: ASbGncu6lAiYJ2zXhroorssPuHbOTxxUHX7OBSINs9Ul3PeghTK4wIWH3OwISyMlN0n
	quqxBJ5Ymi3GOgM1fPTYghmJPBTlLbFmwgqMrv/ybEd56r55HhgPUeCDAqyMhoZcqgjTQtahrBg
	ACG9DL+PO1BuXBJOhUn8EyHqWjJjvF5nil7AfP+9yZ9hk6VH4Y54DLUgQBUu+hIBGG1BciU+f45
	aA7qHTHwto8jYELkSb0+pzCE6Bg4JG7uUWcSHEQvE6zfbHzz0oSGTZsc7KaOzn1Xsy896v7FEcd
	TGBnr4mG9hKWk3cS3O6UiwfW3WCByJ/14NETdA==
X-Google-Smtp-Source: AGHT+IGwWvOgxGgwWmHI6DFqSfjr/uyZDHPorlij65HU+xBh5KwHFJsTWak5AN3OsIOGWsf82thA1Q==
X-Received: by 2002:a05:620a:2482:b0:7c5:49b7:237c with SMTP id af79cd13be357-7d3a88e40a4mr411224185a.27.1749637204812;
        Wed, 11 Jun 2025 03:20:04 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a536b57sm837492185a.44.2025.06.11.03.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 03:20:04 -0700 (PDT)
Date: Wed, 11 Jun 2025 18:18:55 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Richard Cochran <richardcochran@gmail.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <jhw5maxfyowusq4ik24zrvlpjpj6vk5wqpfj6rhgb6b3muftec@5pumwwambikx>
References: <20250611080709.1182183-1-inochiama@gmail.com>
 <PN0P287MB225839D83F1A65D65D3EA6B9FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PN0P287MB225839D83F1A65D65D3EA6B9FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_032005_964624_5D8926ED 
X-CRM114-Status: UNSURE (   9.37  )
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

On Wed, Jun 11, 2025 at 06:12:54PM +0800, Chen Wang wrote:
> Is it should be v2? I see an old one https://lore.kernel.org/linux-riscv/20241028011312.274938-1-inochiama@gmail.com/.
> 

I think it is OK to treat as v1, as this is originally designed to 
be submit with the mdio driver. I split it due to the dependency.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
