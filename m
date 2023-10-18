Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFB9CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9Ttw9PfZ9WNShvVyuJ8syjTbzIvq9/hXI75RXPnpwk=; b=ItGf85+WikfSGU
	Mx0bYggAuMS08mcRHotPm5oYQV5tkqkLY1bhanwLLCYrLlO9TT3aTiOeVMBVa9jQ9+V3RbVmHo3wI
	svjuvayZOOUYw4YnxhvKhcFjvWtI5D7Hf38aolb8QgLtX956owLWtIyYI7MQ6g0BtXqAwk7wmafuk
	8vZ9mFJGFmx9FEKyzNfBmgCQGoTt9TMQnL8IWkRLlbOAtOUzcNeS3hSAPdtaR6vjpPiJBbu+/aHvj
	KWTcw93GB+NbWMcbBUYqkB5DBJ5p0gJKrMxe7IyLKerW8vywM05/tGx8k1fZbhtSOvodiEXFq5U3C
	GbkXTpKGI1gpOujyFkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAMV-00FK1l-1Y;
	Wed, 18 Oct 2023 17:29:39 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAMS-00FJzb-0N
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:29:38 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso69993931fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650174; x=1698254974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DTiAxqcwOSstlD5TGw90ppzIalLYVarQh5g8chQIFI=;
        b=JH44rn/fKSt3ztGGF9G4ce1ZLN0ZwcsLZJdazY2zSIQG6SUjI4Gd2Iin9s7VwJa99i
         jm0IbZ1WgJPdqIvU6gs09LLQZp+7K62iZ2A3xe3xh8GHoFMy0A8OqejM0gwUhHorHVG1
         UavMGoVJRlPr9I6+jPrR8sD/EVcia5EF17zhysd3vYxyoSDekA5J3dQ/pPY553xyHD+f
         /kzFmUhSxZ57Erd/n6Pvpl9b1zwGsd+LxuT0OkFkXLXQbrFcviLjoVn4RCHYG5MlL5HU
         la7cxKhVaX4amoI80IEQW/PiDpP2TFVQA1PlzcdOGM6YATpbbG4fwSvpoR2lKW8Pmk7S
         W7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650174; x=1698254974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DTiAxqcwOSstlD5TGw90ppzIalLYVarQh5g8chQIFI=;
        b=ngopI+TBFvb4QGJfr1alnw6RUqdM91MdYWEqZMhg+97/NknVIt+vMOExwTLGvP+aJc
         JsHPfkIKpFB5VWkMqbJOf9mPbrPaxaASxi+NnCekXS9M0AeSfwaCtL1g2u3UDWJ7Q2NI
         8YhDsqHEBmS+KdVCvPR1WVivJdzqQqQPqFyM2VKo+BevtXldFqFE7zmuVEuFgWnjAZ3t
         kvepJJUBiCEbRrgeOrHZm2HVgM2LSKzZvmqFpMKnmINYHvBF5RleoG6VrndLbFDua81d
         JCcGjJl3LAaV6S8wO2LwtkShaM6H+di+RX+dTntnFXrD5CMstWDr1z35FJmOCZ8Dwdeq
         oGBg==
X-Gm-Message-State: AOJu0Yxuebqhwtr+h1JJVyU6qnDXTX6LyxQd4JlDipg/xRD6hRE9itMp
	HEMsli9zqVBngVBY6n4sMF3Ze7PFtNrlYu98isJE7w==
X-Google-Smtp-Source: AGHT+IGSl/5M58lXn2uBdcMT7VrLiD0NX9sllCftagoL7/hlmkByal0UjqyOgJPJ8Ej/Z6HotqR68XE40MStcyvyXu8=
X-Received: by 2002:a2e:be03:0:b0:2c4:feef:84d with SMTP id
 z3-20020a2ebe03000000b002c4feef084dmr5219935ljq.43.1697650174385; Wed, 18 Oct
 2023 10:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-19-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-19-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:58 -0700
Message-ID: <CALs-HsufTbyShzXmUoczRJikjaHJ5se3Yfcp=fNAGydibZw4Aw@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] riscv: hwprobe: export Zfa ISA extension
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102936_156424_26DF7F2A 
X-CRM114-Status: UNSURE (   6.20  )
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
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHBvcnQgWmZhIElTQSBleHRlbnNpb25bMV0gdGhy
b3VnaCBod3Byb2JlLgo+Cj4gTGluazogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8x
VlQ2UUlnZ3BiNTktOFFSVjI2NmRFRTRUOEZaVHhHcTQvdmlldyBbMV0KPiBTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgpSZXZpZXdlZC1ieTogRXZh
biBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
