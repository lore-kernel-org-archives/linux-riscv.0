Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0626CDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=64612/iAsToi3sasA3/rmBGWtAM++YbA7TF6TIuKRrc=; b=RDC9AaILwhG+jh
	sCy6he2CXs6c1dt/S9ploPU4+0QYjRinKW/3EUGEQzrukB7ncWmw84VN1Xa/So4DBBCWYoSBZudjr
	4KgS5Tm30CCQ+t56yDsslK+/JbxkKlVXrtrLU8x5mcCzRCjs6lFRAJZnFbDBA+gHQyl5KK7X1FojE
	8WOBfJP04dZzbArx6M9XpIn7Cx9mNc557xYOFaVVK5EaWV9qq5bNt1BVoBxPGNDkqJ+uQaLGC5bNx
	AVkjQx3CgJgvDSN3zxOB0UJoo2kRECjZ25zaVVHVaT+QsUxZtAnOaqZ2UWE1fmP4mFisLlXhAA3XZ
	Xyyt+78KJfl1iVbPkspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtALD-00FJQv-1p;
	Wed, 18 Oct 2023 17:28:19 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtALA-00FJPP-1I
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:28:18 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507a936f4a9so5189321e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697650094; x=1698254894; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LrEh3D+kI7ficihoTElbPnijf/y0H7CK010e9QE4avk=;
        b=XrgzGfRUWW0nsWKDnfT3i1C6HfnkZVJfngeYoZ/PCTpFyOe5rDkcv8HlX9Y84ol9p1
         T4aAuMjS0I0zxcm2ycxZxQfcc7lSHMhYeH/WOTBz7oxrvKx1Y15cCM62//kTCyCpiTri
         DzSK1+71KaWoNvt7D3saZ2VftZYCtC+ZZGIT0axXbzu4Q0efM3v61/nUZJThGyE3XEr+
         jHdOWEyj+tqvXE3Ri3+BJ22Y5M5Fhx6q5B0Qdp1fLd33duQMwo3COktND/qwbvf5OmR/
         qgfkQUEJGKTxObegGdVcY/yigQdBZHeeMMohSLbDSZynwMK/IskA3Kl6Frup7LcSqwHQ
         4kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697650094; x=1698254894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrEh3D+kI7ficihoTElbPnijf/y0H7CK010e9QE4avk=;
        b=kyvRL7JW8eNZ3drj6Al7a79NDSN3JrwEv4utbJ77gdBGEkPp0D7tMCr5bc/rn+zpJB
         dcjJRoLFWwCK8xV/f5/lza9yGtTk3PmCPCKwvQvtimLsgsYAZcvLnGuTZDvyjMqX9+eR
         ZLL7Yv4+UnKTwL8FCbXRq4ORyMNepuAmK4n7g3L/cLVZCtcbaZlKXLPRaEjNBlDGDYAO
         RTlsMWdvRXfWM7Pr8WNdrNOFU3G22XhygX+sjyAWEXYBmPCMtP+gMl/8gj+7PRyjtDQH
         uyIhlRZE0vuJDUhwPAyojKOcRQf3t4l7bZw1/gTm+1MmW1PoXC7wh2W0ST14SF0ryn8l
         ZvoQ==
X-Gm-Message-State: AOJu0YxM2qaVmAWttaYbcak1XD5mHPYYU4SHQvyqPKjo+7qgmPicLiJu
	t27uyWBsfqqaEaDwYSWNHniDv/k7Arh+KsJeChFbjw==
X-Google-Smtp-Source: AGHT+IGxURJL+uaaxpc+DcFmneehkFpVo2DZ+kcpkWCrSxLf8LioRAC7Aw8ZZqtta+v5ZKsd1Py4IEcwvCF/w36lIAw=
X-Received: by 2002:a19:2d4c:0:b0:504:7f58:6dfd with SMTP id
 t12-20020a192d4c000000b005047f586dfdmr4318597lft.2.1697650094002; Wed, 18 Oct
 2023 10:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-7-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-7-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:27:38 -0700
Message-ID: <CALs-HsvCGmo9N+cNUJwZmiHdd2N95nFFCxMfWRaOkWVg7v74Mw@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] riscv: hwprobe: export vector crypto ISA extensions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102816_444062_EBE16913 
X-CRM114-Status: UNSURE (   8.42  )
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
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHBvcnQgWnYqIHZlY3RvciBjcnlwdG8gSVNBIGV4
dGVuc2lvbnMgdGhhdCB3ZXJlIGFkZGVkIGluICJSSVNDLVYKPiBDcnlwdG9ncmFwaHkgRXh0ZW5z
aW9ucyBWb2x1bWUgSUkiIHNwZWNpZmljYXRpb25bMV0gdGhyb3VnaCBod3Byb2JlLgo+IFRoaXMg
YWRkcyBzdXBwb3J0IGZvciB0aGUgZm9sbG93aW5nIGluc3RydWN0aW9uczoKPgo+IC0gWnZiYjog
VmVjdG9yIEJhc2ljIEJpdC1tYW5pcHVsYXRpb24KPiAtIFp2YmM6IFZlY3RvciBDYXJyeWxlc3Mg
TXVsdGlwbGljYXRpb24KPiAtIFp2a2I6IFZlY3RvciBDcnlwdG9ncmFwaHkgQml0LW1hbmlwdWxh
dGlvbgo+IC0gWnZrZzogVmVjdG9yIEdDTS9HTUFDLgo+IC0gWnZrbmVkOiBOSVNUIFN1aXRlOiBW
ZWN0b3IgQUVTIEJsb2NrIENpcGhlcgo+IC0gWnZrbmhbYWJdOiBOSVNUIFN1aXRlOiBWZWN0b3Ig
U0hBLTIgU2VjdXJlIEhhc2gKPiAtIFp2a3NlZDogU2hhbmdNaSBTdWl0ZTogU000IEJsb2NrIENp
cGhlcgo+IC0gWnZrc2g6IFNoYW5nTWkgU3VpdGU6IFNNMyBTZWN1cmUgSGFzaAo+IC0gWnZrbmM6
IE5JU1QgQWxnb3JpdGhtIFN1aXRlIHdpdGggY2FycnlsZXNzIG11bHRpcGx5Cj4gLSBadmtuZzog
TklTVCBBbGdvcml0aG0gU3VpdGUgd2l0aCBHQ00uCj4gLSBadmtzYzogU2hhbmdNaSBBbGdvcml0
aG0gU3VpdGUgd2l0aCBjYXJyeWxlc3MgbXVsdGlwbGljYXRpb24KPiAtIFp2a3NnOiBTaGFuZ01p
IEFsZ29yaXRobSBTdWl0ZSB3aXRoIEdDTS4KPiAtIFp2a3Q6IFZlY3RvciBEYXRhLUluZGVwZW5k
ZW50IEV4ZWN1dGlvbiBMYXRlbmN5Lgo+Cj4gWnZrbiBhbmQgWnZrcyBhcmUgb21taXRlZCBzaW5j
ZSB0aGV5IGFyZSBhIHN1cGVyc2V0IG9mIG90aGVyIGV4dGVuc2lvbnMuCgpzL29tbWl0ZWQvb21p
dHRlZC8sIG90aGVyIHRoYW4gdGhhdDoKClJldmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJp
dm9zaW5jLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
