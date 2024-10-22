Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5885D1CDD2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMeOPiHvQO008zcuopax3rBoAoF8vSBd6oZcvfj8HGA=; b=3NU1lOG0JtvFAH
	kEmJefWLmYzo+Go7Q87N1jfbuMz6vpuG4sWgDW0JKDFJaW6GThHK3/bFbmHju64IxFsI/1kZbg6Mo
	GMp/uAIAKklarEBGBX+noi4+2PBS0t+KWuTTYQ6zMR/Ciuz8DKPht4fX4aniPnFYx6UQdwSIdzU+2
	YuVcpctDhWyeEfSoEntRaBEd+Add/ngrT+0OhFQsI0GvMFC7FMLayB2lEsxIpkMR5OlIEwBgYbzCs
	+4z30oqGoy0SdQgM42q1PmEt+gJAEftbU0hbbB8wlHTiYlFZdakqXVcpRI+xNRcYJ7HosHlocsgV4
	NIrQGPKImrItVtnbGRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Bw0-0000000AV2h-1eQX;
	Tue, 22 Oct 2024 10:16:16 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Bkl-0000000AT1z-0Tri
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 10:04:40 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso4162933b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729591478; x=1730196278; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MOb3/YiZFds7rNs+QE+YkdVNWGtcSeJSYIfyVNEkARQ=;
        b=MaBROPx7r2SMyajPGNIe+JswaHuPgjdZzc3B7AR0zg8mc2EPEb+Q8BQaONoDiTvifr
         T1zSpqaLIkjYtJMpw3YyVgLT6HiC4lljSl+wgafmZhcJsE4rTiT+zG3DdpW8D7Vzn+pi
         FBgFAr7XWrH0xyQQuBS2IfggJb4WyLIeGrX6JZGphMSyxvbRNcIpe4VuOhL2qrkHPW6Z
         RdHdvz95ObB0Whl7RW5xWxDL7wK5PlBPj+31f4XSmA/DBcXUrSDHDLRBAQLo4EHrfy04
         QJlHRkI4PgrumBOo8B26XE5qD9akV04Q4ahJ6xrZaQMters3kCClQUvzfbe1WUl9UZzn
         Kk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729591478; x=1730196278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MOb3/YiZFds7rNs+QE+YkdVNWGtcSeJSYIfyVNEkARQ=;
        b=XGTMMScZv/BCKsNYhNnArBOWTUVeRTL3Mm54r7dIH1TCLZQQMcf6Wq2sFAqbbg+P46
         s2aVYo/IAW38qZD4Tq1hZbVNXOWKaN7P30TkSIRL2ngkHIbjqaCqrYXIPxlA4xNwphxR
         iUDvjKQ95OjrX3ZfOb78ccbR+U0tdBISRJ6PZYnBwcon4oBfWqwLjULWJ91czZMSL9wA
         D7r0ilkkNcJ6iqmWcSx1bJtUafa+l4db26Jk2zFnUUn0I4OOE73GaY/q9CDwOsQV/Oi7
         IYB1jHiuhQr7CpIAzhQ6FyuE/lNns8X0zymEOpJkMgBRFIXN1GPT+ZGtirufMIf1ouSg
         mDPg==
X-Forwarded-Encrypted: i=1; AJvYcCUsfOrBHzlGsnEgtUy6b8beSWsZi9a9oxDVzvKrtEK/EfUQ/qor03rs78CYO94BvfGsZ57/yV0W1w28XA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaNtCl8x1Os5/g14VEgabkN2g5W/hJAutSIgSaoAx6XaHrPWV6
	JelJCnKrF9VJfNx/tXbUnpFjy1Cw0cJvXZOW3QiM1QR7ZKQuGhIs
X-Google-Smtp-Source: AGHT+IGOk/LQ50NJpN2PWIn4JJAGyCC+Hy2bBsADd10/1fceblYcgZvJdY8CU9OM6Rlaznscb8QJnA==
X-Received: by 2002:a05:6a20:b58b:b0:1d4:e638:d066 with SMTP id adf61e73a8af0-1d92c4a1c30mr20381950637.6.1729591477771;
        Tue, 22 Oct 2024 03:04:37 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1407f63sm4377863b3a.204.2024.10.22.03.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:04:37 -0700 (PDT)
Date: Tue, 22 Oct 2024 18:04:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: dts: Replace deprecated snps,nr-gpios property
 for snps,dw-apb-gpio-port devices
Message-ID: <d5vjohhftbx5zlsay6hfij7p5qbcrrebnj2sspsdtkgrkz4scq@aifcdtxcqqqd>
References: <20241022091428.477697-8-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241022091428.477697-8-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_030439_173170_3C37AFDE 
X-CRM114-Status: UNSURE (   9.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 22, 2024 at 11:14:30AM +0200, Uwe Kleine-K=F6nig wrote:
> snps,dw-apb-gpio-port is deprecated since commit ef42a8da3cf3
> ("dt-bindings: gpio: dwapb: Add ngpios property support"). The
> respective driver supports this since commit 7569486d79ae ("gpio: dwapb:
> Add ngpios DT-property support") which is included in Linux v5.10-rc1.
> =

> This change was created using
> =

> 	git grep -l snps,nr-gpios arch/riscv/boot/dts | xargs perl -p -i -e 's/\=
bsnps,nr-gpios\b/ngpios/
> =

> .
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Please add Fixes tag.

Others LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
