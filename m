Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF32CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juAHsvWm74Wxm2zPkg5P3tOIn8kippxp3FNjzMmoP4k=; b=VIIlJ4Mp9MAWoz
	7Uy/8wTvn5SO7lPaf0tXeemG0F+VZRvO/8jBPGaSkS/2WtAHjHo69pGl9tkyXoRBPGVypf72OSEu6
	e2OO5HImdI4HfGmWuqtKovVaYaVVCaNyYaTES86oYFx+vCDI0PT7CtjQJ9SJDznbf9MRNhOHg/ztO
	SWAP8K0FYr0H6tw+OaJqON4CBQzC0yufK6FET4lygalBPYhtuaNMz85IdVtgIuTluWy8N8chFqgpL
	1xDScyw6fRN/a83Zi81jD/nzavXZh7ZzRgtAhH8E3Tffy2z8uTt89Pc0yDV8LEQVa/PtIjnrM76Po
	Opj6h8dMaFT6fdf8FwWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmiz-001lzi-0R;
	Fri, 20 Oct 2023 10:27:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmiv-001lzG-2Z
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 10:27:23 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9c603e235d1so96389166b.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 03:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697797638; x=1698402438; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O9G9iqXSn4bIWBu+1DJE9aW2IMSJDKBdGcQ03iTHUdg=;
        b=fiqqrd2FldpLtvWn9FXzNFtI/fw++wccAJwI9nWMu0JxXSq/m1wHxOIWMgqeJFo6ho
         1dHf8KJRphXYlgzsenzZoPMOFeMhsPqRqhZyEqpMp5FrdBpnoniehC4AsNPfse1MF9Nm
         zVqqE1N0HvRuHNyc03h5xCVrWCRfvIQA1s1LoZ50/RzliJ0GUhGqERMNwbIcfHg+eKUn
         Tf+9oY3ykUO4HwHlL6sJcnvEMvo2G2jed19IxXiWkVRN2KuQHnX3EbwUz07AQ+mujfWS
         kH2cX880r/g82p+kBKBKM5pMxNigl9BzPIv493UW5q6+m8qg+nfvKRLdo9xjtsJa5gt3
         NmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697797638; x=1698402438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9G9iqXSn4bIWBu+1DJE9aW2IMSJDKBdGcQ03iTHUdg=;
        b=GB4IirsaRbUgyjeSqFJ3jFuHpGUe4nqgOR/09vs/yWdg5eJ4vIhr8mHJVLftw7JoJv
         jsZuCO/Q6qAbg25XKQTT+gjin/QEyFLjBat3OgYztjoyZ9+xJDxH72avSNLf0D3QF0gx
         NbzHwrccN6menCcXZFZFJQVwBmeNzZWj9K9MxSYb4omeLS/YgYKVRzxm/XGqeRsP8hBB
         oe7qV36AgNZEVpfZAnwr7LeYrgc5UdLNAMY9agCP+kfB3GMprsuUbNO9OMVdWB7q+22w
         aYqzL5Qlu4VD4szdt7W/UgMrCmhJqN6RH0ZdJCSVcCl9e1m3Ag86p0lOZGEScXKfYu4T
         FDLQ==
X-Gm-Message-State: AOJu0YyqL9xH5B9sXVthImozIe549SFD5EXzTM2xe5dLZq0dwVn1lKBT
	Ulkwg7INYn5MkV5kw+dRd4WH9Q==
X-Google-Smtp-Source: AGHT+IHZl6pUqwMf9CFUA2xEvYwgpCp82Av0Lk//UAONUT1SVS4Axb4Qd2P3hrYxgtOT7flTfwUbaA==
X-Received: by 2002:a17:907:3f85:b0:9be:6ff7:128a with SMTP id hr5-20020a1709073f8500b009be6ff7128amr1087855ejc.67.1697797637704;
        Fri, 20 Oct 2023 03:27:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a19-20020a1709065f9300b0099e12a49c8fsm1215456eju.173.2023.10.20.03.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:27:17 -0700 (PDT)
Date: Fri, 20 Oct 2023 12:27:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
Message-ID: <20231020-cee6ba8c9b3dc3c2a984fbb5@orel>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
 <20231018-flagpole-footpad-07a6228485f3@spud>
 <844f6f35-3125-4014-852c-9ad7aee19ddc@rivosinc.com>
 <20231019-flatten-showbiz-127b2e917a7a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231019-flatten-showbiz-127b2e917a7a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_032721_858397_8B4E1362 
X-CRM114-Status: GOOD (  17.02  )
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

On Thu, Oct 19, 2023 at 11:22:26AM +0100, Conor Dooley wrote:
> On Thu, Oct 19, 2023 at 09:26:31AM +0200, Cl=E9ment L=E9ger wrote:
...
> > BTW, wouldn't
> > it make more sense to get rid out of the unsupported extensions directly
> > at ISA string parsing ? ie, if kernel is compiled without V support,
> > then do not set the bits corresponding to these in the riscv_isa_ext[]
> > array ? But the initial intent was probably to be able to report the
> > full string through cpuinfo.
> =

> Yeah, hysterical raisins I guess, it's always been that way. I don't
> think anyone originally thought about such configurations and that is
> how the cpuinfo stuff behaves. I strongly dislike the
> riscv_isa_extension_available() interface, but one of Drew's patches
> does at least improve things a bit. Kinda waiting for some of the
> patches in flight to settle down before deciding if I want to refactor
> stuff to be less of a potential for shooting oneself in the foot.

And I recall promising to try and do something with it too, but that
promise got buried under other promises... It's still on the TODO, at
least!

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
