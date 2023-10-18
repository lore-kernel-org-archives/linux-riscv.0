Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDAFCDB483
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rfzp9t+j6JlBAqytbSbjGNLhaoo7hQ53NkBa6in9Tmc=; b=ymexX9inGsJKgS
	wrDg8BAXKeHttLifCrElpvi5vOpigg8IdoCzPJMe23SC0wkOieaWPo7hZ2Nyz9xUDUVykwa2ohPPS
	5jVDKxLN3d0nIyQy9Yz13Xmf3I6LUu0JKPgVWEo2qKPQe7wKJyzJTqd4FB06ncvPfcUYjDzkDD62c
	nUFia1Ge3v2lFH7IUVgrCat5rhkNjdVxrK3bUNiY88YQcamMI5kpg7hK2LInf4x0/9mEtLQuONbjm
	0I7p8aTAHBSrBVGI5eFuK+D4z++LNoDfuDgsGVrXCyAp/uCZPnuwwF0Zq68U80p9iKZn8zvHz86p+
	IOTQQog7k4U84dYl5y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAM4-00FJnP-0u;
	Wed, 18 Oct 2023 17:29:12 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAM1-00FJk7-0l
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:29:11 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c503dbe50dso86440921fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650148; x=1698254948; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5z7yiUweEg23BwK7zcSyTWxXFB2LkcpzcFHHPWHt2IQ=;
        b=Bdw82imZIFn7T8eB3KFDGgAtLokkBpbmYAm08D48mjQP1BJfz9NjKOgU6aBNVZr18V
         vYtC7k28c7w3t1XEQspgDxTr6+XTE2uHOyuj+ntv5My9RpW6LkxHdZD5X7QOx/powE0k
         E99jqct/TJbzm7TZNHzcy5frWm40tQBwFs+B+aoQwWj+hPcwVhL5dkO6Xg+yrAMQ5iiX
         p7gVDRCqZRay81eJmF7rWdwT6ZKq5YXtJppyOvdzozV/ONv+mpLmm55eLTz/hKT1tLpW
         JHDj34z2/IUsMKxSYx0WTwfLjYweADw310mKr+ZSaEUvP7JaPGvAOw3uOq/rnvPewvBp
         +JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650148; x=1698254948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5z7yiUweEg23BwK7zcSyTWxXFB2LkcpzcFHHPWHt2IQ=;
        b=BfVLhYHlDkTNJQhrgo/S8eXrNZQ7uP8TLlvBhQruA+vDooBeYTl+D1ZKuc0fnXaN7+
         8OULdi8rWVIalTVmOhDrApcp/I1wSG0rEg4AaPkWiH5+OaIRhQJBkdbyCSwQZYkvF/gh
         RSvA+QdezwCn+0uSodCGqDrL3k1kDbrXLU6LNzZXDjKEPIPz3xrmAQ3A5CEU/dozXbv3
         B89lVz3j4tI5iGNFvw4x/3p1kKtQOa67bucCpvWtYmsW8nEFKnzQ+LLZ7Nsrfnegaymp
         JjudOUBmQG/iUt2GvSd6/Go7ThF3Rozu84iB75SnHKePcINcZANOYrmgFlP+X/QCj7v8
         Nf+A==
X-Gm-Message-State: AOJu0YzU/EGTHBesi3DXxwT0505IZOuHIPgd1AqYZjIIdcNav/4CadHG
	TE70iMEh/ylZEz6gbqY76YwRTIZ8X1wQYhR9TLAucQ==
X-Google-Smtp-Source: AGHT+IGo8MWu21Tet2EOfE5+wEjwJOt2gHO9Cv9qIsNHDtqKivVuDg+TfiVa/BHwF8TahWAz+g7w3WQIL7DGU1ZQdrY=
X-Received: by 2002:a2e:a7ca:0:b0:2b9:ee3e:2412 with SMTP id
 x10-20020a2ea7ca000000b002b9ee3e2412mr6279909ljp.22.1697650147521; Wed, 18
 Oct 2023 10:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-13-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-13-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:31 -0700
Message-ID: <CALs-HstrnSM981utJD8tUdjwTc+rLTP9Eiep8A8Pbx29Gz4Xdg@mail.gmail.com>
Subject: Re: [PATCH v2 12/19] riscv: hwprobe: export Zhintntl ISA extension
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102909_277197_6834A008 
X-CRM114-Status: UNSURE (   6.78  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHBvcnQgWmloaW50bnRsIGV4dGVuc2lvblsxXSB0
aHJvdWdoIGh3cHJvYmUuCj4KPiBMaW5rOiBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9k
LzEzX3dzTjhZbVJmSDhZV3lzRnlUWC1EalRrQ25CZDloai92aWV3IFsxXQo+IFNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClJldmlld2VkLWJ5OiBF
dmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
