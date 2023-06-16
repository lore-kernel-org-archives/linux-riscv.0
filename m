Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EA8EB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 08:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUVj2lpaZ8Q20Jr2cMILf767Fe6e+2O0gWJGNsUGGjI=; b=Fu4trwywran5wx
	wXvHGry6mpiE4TOv57PZcAxtMN0N/LUECa/uVHTmzXyqmOItoaEH9TzNLn9dlDqcEsVaiUVYxtqNv
	Q5Gh7cUh8vHBkAo5iz8p0oER7eUWKwKAracvtEAC4ASov5zfj8Ezzy6RZ/bE5d4CIl6Iq3ZFd4tCF
	rLOXZq3uVSmjj1PbYKdIo6gh70WKxaEWo5uVMKFZd67KciL27eo9qPQ3zlkLJa7ARMQ7R9nt0BVPu
	L/MQCwq7vVRA8j8AofrIQ2l8FfPEILm9MNwUz2JGOCJnpAaDYAZ+5JSzmRnqNam8gCTZ/q0eIhfq+
	YxvbT5AKr+9VWXXmQHig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA53W-00HJ4s-2k;
	Fri, 16 Jun 2023 08:43:42 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA53U-00HJ3I-01;
	Fri, 16 Jun 2023 08:43:41 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5701eaf0d04so5173387b3.2;
        Fri, 16 Jun 2023 01:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686905018; x=1689497018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcAlkMME68B/DMn58wIZvDIpfRVrA5pKETi1cowyEQ4=;
        b=LIShMYjdoGP04ZnI9mYPlm7+KOnQsqxwC3N1HHcwpk+mB25s3KACUgXvZomQesEUva
         8etO1cgSUlojGFMmcnm0VepC1cjTnz+DZxryzhQG0ISyow8S95Uun+nw4r5cQ/Adzjvh
         O5KZdqKIRLIAnZZo2077iRtcyNPverwIdLAun37ln/jyP64+Ntoqe1BrNJn6w8uW3Q4+
         RXjRAsPqoTSD07zBQXRQWz1bUyXXPYm04untstdJp4zIpxs2t6Y4fYl8fKHG6l/Bqhzx
         SHzJqGOMqKsMIj/wWOaBNo4qIlYXcvhNBJoNGtA5QEcFiqHw6HVji1nXXDdQLQUKNEGh
         AHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686905018; x=1689497018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcAlkMME68B/DMn58wIZvDIpfRVrA5pKETi1cowyEQ4=;
        b=koTqyHA0X7ErtcJ0UIB9b0R54wTkOcBTG0g9ZmjInp15NrjXxndqvh1g8bVCwHjIKx
         AFGX+7vedRAEO/1qFvtHesPARBLojWnT8PHP9EZrnasGA1jXrHv3Hrdc1APIgTLOukVr
         KvrCZ8hooZfS+IEZLKpqkjMbbjH8oHqZeYj8gPy0OixGkxJRYRbu0m7DojS+pb86nJBa
         wwUEhMMs1pQEXqcmQS+LE93Cmo0l8cRhMfT+CXG5BYgGse40YfC7rlwj0DdZAB+tDrg1
         1Y6tpaC5+cuwZrIDSWD8O7WSCnie55o2567iX5IXIOt7uxaF7m80KLiHMFkSokVU592E
         Jgzw==
X-Gm-Message-State: AC+VfDyMKHAgpeC31bksH//+m9M82xsuELnRsXAAVp0qv6lk3kXHyjVB
	dbsJYcDp16HE3tXzkpCAa0kTVkeogFdtnl3TYQ==
X-Google-Smtp-Source: ACHHUZ7HXl5yZodGeTdNksuSc50SL1MwuhTSo/SCJY8XtVdKpO+fiVayDP8lN7Mq22lZDtZ8KzYaROiwwX8QDM9oh6M=
X-Received: by 2002:a81:7bd5:0:b0:56c:e2db:8d07 with SMTP id
 w204-20020a817bd5000000b0056ce2db8d07mr1000781ywc.33.1686905018211; Fri, 16
 Jun 2023 01:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230615144423.828698-1-privatesub2@gmail.com>
 <20230615144423.828698-3-privatesub2@gmail.com> <20230616080326.2vtkfeyzwx542hk7@pengutronix.de>
In-Reply-To: <20230616080326.2vtkfeyzwx542hk7@pengutronix.de>
From: =?UTF-8?B?0JDQu9C10LrRgdCw0L3QtNGAINCo0YPQsdC40L0=?= <privatesub2@gmail.com>
Date: Fri, 16 Jun 2023 11:43:33 +0300
Message-ID: <CAF4idNm55=uFUTuoMaFHopMXZA04pQbhQDg4D8kpzp-G7rVSRA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Maxime Ripard <mripard@kernel.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_014340_042405_B4582427 
X-CRM114-Status: UNSURE (   8.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgVXdlLAoK0L/RgiwgMTYg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDExOjAzLCBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPjoKPgo+IEhlbGxvLAo+Cj4g
dGhpcyBpc24ndCBhIGNvbXBsZXRlIHJldmlldywganVzdCBhIGZpcnN0IHF1aWNrIGxvb2suIFVw
IHRvIHlvdSBpZiB5b3UKPiBmb2xsb3cgdXAgd2l0aCBhIHYyIGZpeGluZyB0aGUgdGhpbmdzIGhl
cmUuIElmIHlvdSBkb24ndCBJIHdpbGwgdGFrZSBhCj4gZGVlcGVyIGxvb2sgYXQgYSBsYXRlciB0
aW1lLgoKVGhhbmsgeW91IGZvciB5b3VyIHJldmlldy4gSSB3aWxsIHRha2UgeW91ciByZW1hcmtz
IGludG8gYWNjb3VudCB3aGVuCmNyZWF0aW5nIHRoZSB2Mi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
