Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645AEEE3F3F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 23:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5sDOBRXXjvpMXnB9iFX3x2TjszQcRblNgws4THgwpY=; b=BvKmVLO/JUHSHXwk/Fue1oVKQg
	VeSSIQtCymHA/TFHxLEmcuXSlZm/7Gv51IafCvFgDxBzuOV9YGbFLn9P3EZlgeylfdhcTP3bbzwHb
	eap0wDlkZAPuZmEY2mnwLeozrntVUjZrefLOYIoyzZUdn9oiNRIfLWjhICCusbtKdpJBsC4UJnRYe
	yheWNAebRucWO8iNhwGa1ccj4lwdW0nNfbKPMlFzAtuZZPwKPEzXAYhmcChurWRTJhVx/joC/iY0d
	ya708QKqFbQG6nInBcpW55VHUAH/qptwEHPZKknjFJWnnEBRSniUPCDK/OXBaXLoD9LU+k0QS+WJd
	rZjDgyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCuA-004Hy4-2A;
	Tue, 12 Sep 2023 23:34:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgCu8-004Hx1-19
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 23:34:50 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c3a2ea2816so30115ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 16:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694561685; x=1695166485; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H500R7KXtKHiSjqNGrh9ix7Bt5gTMBgVSxiIDYkrDUs=;
        b=TzOJV/ImhcRAmow4/abRUwNDxpDKlFj0+fKmkFy/D5QngCCGcl+TmvoXE8RKwUyhh4
         TpJP9OpQ1L7iO0bTJzSqt7WUpYMx+O5gw3101SUjBCy/cUZjwgE5NAgLUv2UVLOeyMl2
         HD+j/nX6e16c+WZJrL5JnOMLPwHnnkekan0Kpq1eIjJxA4wfbOYvshFzHfj6RdrqiqEY
         yQJi1XFyq6s7yMb0xIpwrqRY56IshoXnN+X6OWlU2m+Fw3llurcDGtguYAWdkWeavmZ1
         frYZEpdAclVtnHtqjXpuzLYpZuYyW07JUzlWST0GwLL9be9OSK/pL8hIzcn/a0sODd8a
         iRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694561685; x=1695166485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H500R7KXtKHiSjqNGrh9ix7Bt5gTMBgVSxiIDYkrDUs=;
        b=POKp25s6LsVk/tOvcVHb4cSCuwWgEUr+oXyG00nyE3wZgMh7rWc0ovGuDAgckuNpQz
         SJ0RXh4Sn9iqgXwTzzO1YnfSTXGwk7bgoT1Znt27Y3wSjAC6RhGwztWjYPYYuQ050bGz
         b0oDZJd+UkJPH2Rfdm20KYGImAG4AbELS39vYW8yD3bcGy3vHRy7MTIFdxR4P8JmJMtv
         FJcshPxfQjDJn7XXmOHrhHGVUVrY0Wfhtg7KZAcC7oMYILiiJLXTsi81FNtgDJqQgnPg
         dqVHx50vYmugPLmDer0qTxQUnClzHUULHMsh7bhgp/4WQJbzOXUf/2fnLZ6aa/jr9XXJ
         k+sg==
X-Gm-Message-State: AOJu0YxLDA0laeTfRpBBIpfH8gQz8hQwc1lahNItXfQZ1fgvLPbjqtX5
	5LvR8sxtIu3UjpKBPx4ndeAOfA==
X-Google-Smtp-Source: AGHT+IEOSomxv+JSs0gTTEy/GpNE7HFvipjdqNezdLOo+qdj7aoqFTtvQct64/g6MlRQUG4OnJrypA==
X-Received: by 2002:a17:903:283:b0:1af:90ce:5264 with SMTP id j3-20020a170903028300b001af90ce5264mr41414plr.27.1694561685058;
        Tue, 12 Sep 2023 16:34:45 -0700 (PDT)
Received: from google.com ([2620:15c:2d3:205:94b7:2050:b571:8164])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902bc4800b001bf846dd2ebsm9002100plz.303.2023.09.12.16.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 16:34:44 -0700 (PDT)
Date: Tue, 12 Sep 2023 16:34:36 -0700
From: Fangrui Song <maskray@google.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v9 6/6] riscv: Use --emit-relocs in order to move
 .rela.dyn in init
Message-ID: <20230912233331.zejmknzcm5mwzzcz@google.com>
References: <20230329045329.64565-7-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230329045329.64565-7-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_163448_394895_91145D8D 
X-CRM114-Status: GOOD (  10.50  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023-03-29, Alexandre Ghiti wrote:
>To circumvent an issue where placing the relocations inside the init
>sections produces empty relocations, use --emit-relocs. But to avoid
>carrying those relocations in vmlinux, use an intermediate
>vmlinux.relocs file which is a copy of vmlinux *before* stripping its
>relocations.
>
>Suggested-by: Bj=F6rn T=F6pel <bjorn@kernel.org>
>Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
>Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>---
> arch/riscv/Makefile          |  2 +-
> arch/riscv/Makefile.postlink | 13 +++++++++++++
> arch/riscv/boot/Makefile     |  7 +++++++
> 3 files changed, 21 insertions(+), 1 deletion(-)
>
>diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>index 860b09e409c7..7dc6904a6836 100644
>--- a/arch/riscv/Makefile
>+++ b/arch/riscv/Makefile
>@@ -8,7 +8,7 @@
>
> OBJCOPYFLAGS    :=3D -O binary
> ifeq ($(CONFIG_RELOCATABLE),y)
>-	LDFLAGS_vmlinux +=3D -shared -Bsymbolic -z notext -z norelro
>+	LDFLAGS_vmlinux +=3D -shared -Bsymbolic -z notext -z norelro --emit-relo=
cs
> 	KBUILD_CFLAGS +=3D -fPIE
> endif
> ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>[...]

(Not subscribed.
b4 am https://lore.kernel.org/all/20230329045329.64565-7-alexghiti@rivosinc=
.com/
neomutt -f v9_20230329_alexghiti_introduce_64b_relocatable_kernel.mbx)

This commit 559d1e45a16dcf1542e430ea3dce9ab625be98d0 introduced --emit-relo=
cs to arch/riscv/.
I am concerned that --emit-relocs's relocation-type-changing behavior may n=
ot be desired and
any new use could become problematic.

https://sourceware.org/bugzilla/show_bug.cgi?id=3D30844 "ld riscv: --emit-r=
elocs does not retain the original relocation type"

If either -mno-relax or --no-relax is used, --emit-relocs should be fine.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
