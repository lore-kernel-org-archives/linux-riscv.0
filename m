Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04505CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKdCxK96uqkv95maIzqfljWc/8zrcJUoNe0BDMVA4Sk=; b=d74mLk0wyBVFU6
	YF/HotYwgBs61rKXEXZJg4k3P1fKimfY3+Q3HYtOS0WccymfP+WeYe8UjCHVIpLfO+7qd/uU15S4H
	1Y8Abnsho4AZJ4NOOJvwARJ85f0XBIV39y7qw1O7vrfbRSkulyDNy0pxy2/qNoYeX1YoWJPC5I8hP
	45RPrrKX4Kd4jOVkemyImlJqqBSGg530ReiRR38kDzG7d++z9VGubmM3nWKiYDfm9z8clN4fN5BKA
	ONzpQM3TZj+2pv2fwhzHxOWIM8xMa6B31EQU1C/g+5sKFy/K7LQPHh34lHuCRtw8DPtBXy1gN/1mf
	FTaMTZ+UWDSCHbF0MxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAMJ-00FJuX-35;
	Wed, 18 Oct 2023 17:29:27 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAMF-00FJrp-2R
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:29:26 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c50906f941so81117341fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650161; x=1698254961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAT+E2Mqww2+Xf9ub965fid4r/e0BGLFO3gBSbvEEyQ=;
        b=zjcX6SVNMusu7rm3vT75jx2mppkx9neKNcV9fFBs3NQ4l+B6N0DbMNC0Y2eziCrREL
         qhx11OZihHyrOqDP8RTlIQgFCWlZcfTWFDkvghKTsQ6sObqEmll7UKYZBD2h/2jv5L46
         vfwGIX2OOiESw+QoecLHfZw6jRW62YU1oGIPqOXRdAvVuHsMaqgbOl+Dr1UW5FDESDHC
         vdlw0rbjrYKjXWHks0eMhOSq37llPto44LlpeZjRmvvAh+U4xvTBhjb+mjhi0Nv6GFox
         mB44wRFTNtNshWh0yFqSP05PfWdybwBJFLb/T4QRQCHOp9fnhdcRyNuzOxudh6Rgn75E
         FWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650161; x=1698254961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rAT+E2Mqww2+Xf9ub965fid4r/e0BGLFO3gBSbvEEyQ=;
        b=k33PLywj0OocvVc8hJ31YU4LDbnIlPCWu2U/RuEpyfhrz1+4qe5CmHD4qAfP3x0Csw
         f1rKsvzBzcWbP3KX22CLI55x1D8qIkVNUtmqyzDdyvTHxXyUXtTqymdbfPsji43SsJHj
         q1PZ/O5nmCz1Wx5X8fzoEwXLKYEi5yEM9G40cB2Ul+lLTQlWS813xfYNo+ryFWv9034V
         hMlfTF+l1lno3Cijif+2iBekAMyh/Vm9L5gBS+/AYt9ryILFR6MZEjnVjoYeTy/CdWHy
         +9pG33G4kkKDYEc/5+V9XzyKP5ZVuiLrVPmQNfZrD5Ke5zIOAnsfotueqgQ1NAYrHdor
         7GJw==
X-Gm-Message-State: AOJu0YwxGVv/HVZ3kS2C8i8aZDxPn99Nskqp+YLKezFGLTEcTEsRaXdU
	0e9GSZyRMYcZVE4Z9MansJ6vsUqkj8D5uldPr2W5XA==
X-Google-Smtp-Source: AGHT+IEfrz0unC2GiQPrG2JuKmc9QnUuo5JLCp2+gYk1KnHMA7dr2bOwgXlPjCwKOCgOOnKI1jFbT+XgHxTamtCDl18=
X-Received: by 2002:a2e:b5da:0:b0:2c5:25f3:8e1c with SMTP id
 g26-20020a2eb5da000000b002c525f38e1cmr3998973ljn.21.1697650161325; Wed, 18
 Oct 2023 10:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-16-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-16-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:28:45 -0700
Message-ID: <CALs-HsuG7FRpbaJaj+q4gEhJnAyVvZv8osDCJ4irrXEJaMd=hQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/19] riscv: hwprobe: export Zvfh[min] ISA extensions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102923_793262_B79B3B23 
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
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHBvcnQgWnZmaFttaW5dIElTQSBleHRlbnNpb25b
MV0gdGhyb3VnaCBod3Byb2JlLgo+Cj4gTGluazogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2Zp
bGUvZC8xX1l0NjBIR0FmMXIxaHg3Sm5zSXB0dzBzcWtCZDlCUTgvdmlldyBbMV0KPiBTaWduZWQt
b2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgpSZXZpZXdlZC1i
eTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
