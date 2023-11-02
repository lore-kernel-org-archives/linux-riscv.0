Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8E5C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 22:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I03uUJIqabEkMCDww7c+Ktwr5JGWu5g0uNPk4FH6MtI=; b=HVTsSOh/f0VGSp
	qpRhPlnQJwpnUW8t4tfhKvcitc5F78awACO9p9mIxLSvbeBTrIsV3LvZdgS1SeOsuUODJrFdoMtbC
	0WELICEl79C9r+W6qnV/ZxDMR+pt2ZVhEl4g+4+bYCe8+P5l+G6GK5fcWADC0Rm8wroPLQZPGEx0X
	ydaQ+xCiDupsSyxXoRgpuUHYk7DMgsS40aaHc34X8YJrgE+lJ+Er6JI5YkmUrtFSCLCyIojnpVHc1
	gjEPjcwU/56+Zz2cN0keXNFSNIVwhz9Mo2DrFnedrfRhqO/yJ+1MYeOucQll3OWDpFqlx0K0n6mUR
	ZXtzsJzp7spvCmS/fPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qygOi-00APD3-2K;
	Thu, 02 Nov 2023 22:42:44 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qygOe-00APB4-1r
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 22:42:42 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c5629fdbf8so18744101fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 15:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698964954; x=1699569754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLk43lN0/decQge2BDqiqpNvO2C3WW2dXE9OlxquTBg=;
        b=eot5GKKMyxZ8O4yErqRdneHa5zzOOcvR5Lo9+kmKVw1PcQtZMVml2BRekuUQB6U69z
         QDybfAk6g4fCYS0mmCDO37vg3nmEJ7jwV15aJDQrNGjCE9ar9MaIBw5guRFeUD/gm8gT
         yv/sDAF4uVHmktwOvzYidKs2dnpixgexm1I6PnvVTp0MsGl0jXME9HiRjXoW4do1D/eu
         Ch3uWteFBtFjj/pBRVZ71b3ZTcTN1y5wHn+MBymalyrCqlPcaauRnYPKCBq/fh4fIAnP
         ncNE3fZHf8Z2rSmCoKfBpcX7lT2I+fJGfaALQ8XdH9tewVqNeslKNqQm0xugsBOmILf2
         cKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698964954; x=1699569754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLk43lN0/decQge2BDqiqpNvO2C3WW2dXE9OlxquTBg=;
        b=GRaq5EkSiJXKZDzELXKM9fM95UFqv3F0A6HlLSTyUPazz5jCCSR0QN9oc80quUbjVU
         Li6e2FsNaDmpwsmuD5XwyQaOa0njzQ3IVD4Zj3d+4TAyqX7zO15T4b7+JvyaB2dT3w9h
         Qyog/Q1Nbl7xPhOWsQwyqrBe1yyUCYNQdcHboEn3g3ko7TGrsoD+QohkSvFiMpHA8tgp
         NMVYCObqM9FpGV8IpHSjgtZI3Zo65QZ1SAtKH5aIQLIHkyyZUenZ7Haradql86alZ1Nz
         3jNCmZ0llNByroA+aQTsCqsSkKL7Vxi8KJd+fTCWqbAc4l1TZWw6JZ2NwfSbDTJG1Cez
         Mqig==
X-Gm-Message-State: AOJu0YwkW0/1/emTHKK8ClPFEstNeohGrK3IDSsquTYN+1WTUXQJCxvD
	BJN2xK8Tm9kaQF83Gmc6QGRePl8ce0pgdSAbf6S4ng==
X-Google-Smtp-Source: AGHT+IFzQD/VoMKgUQZ1/ELVgYegKEHGfIHsT6o8UwNGVxE+fI/gR7xwT4rAgd7EQ8711sNoWsVmNHBhhi5Rc1TmdJM=
X-Received: by 2002:a05:6512:69:b0:502:d743:9fc4 with SMTP id
 i9-20020a056512006900b00502d7439fc4mr14246766lfo.37.1698964954318; Thu, 02
 Nov 2023 15:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230915184904.1976183-1-evan@rivosinc.com>
In-Reply-To: <20230915184904.1976183-1-evan@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 2 Nov 2023 15:41:58 -0700
Message-ID: <CALs-Hsu_1x2FpjWXbmioSi6x30NXdNgrQ=t=EBknB0O06DA12A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Probe misaligned access speed in parallel
To: Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_154240_832798_DB7B1631 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMTUsIDIwMjMgYXQgMTE6NDnigK9BTSBFdmFuIEdyZWVuIDxldmFuQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4KPiBQcm9iaW5nIGZvciBtaXNhbGlnbmVkIGFjY2VzcyBzcGVlZCB0
YWtlcyBhYm91dCAwLjA2IHNlY29uZHMuIE9uIGEKPiBzeXN0ZW0gd2l0aCA2NCBjb3JlcywgZG9p
bmcgdGhpcyBpbiBzbXBfY2FsbGluKCkgbWVhbnMgaXQncyBkb25lCj4gc2VyaWFsbHksIGV4dGVu
ZGluZyBib290IHRpbWUgYnkgMy44IHNlY29uZHMuIFRoYXQncyBhIGxvdCBvZiBib290IHRpbWUu
Cj4KPiBJbnN0ZWFkIG9mIG1lYXN1cmluZyBlYWNoIENQVSBzZXJpYWxseSwgbGV0J3MgZG8gdGhl
IG1lYXN1cmVtZW50cyBvbgo+IGFsbCBDUFVzIGluIHBhcmFsbGVsLiBJZiB3ZSBkaXNhYmxlIHBy
ZWVtcHRpb24gb24gYWxsIENQVXMsIHRoZQo+IGppZmZpZXMgc3RvcCB0aWNraW5nLCBzbyB3ZSBj
YW4gZG8gdGhpcyBpbiBzdGFnZXMgb2YgMSkgZXZlcnlib2R5Cj4gZXhjZXB0IGNvcmUgMCwgdGhl
biAyKSBjb3JlIDAuCj4KPiBUaGUgbWVhc3VyZW1lbnQgY2FsbCBpbiBzbXBfY2FsbGluKCkgc3Rh
eXMgYXJvdW5kLCBidXQgaXMgbm93Cj4gY29uZGl0aW9uYWxpemVkIHRvIG9ubHkgcnVuIGlmIGEg
bmV3IENQVSBzaG93cyB1cCBhZnRlciB0aGUgcm91bmQgb2YKPiBpbi1wYXJhbGxlbCBtZWFzdXJl
bWVudHMgaGFzIHJ1bi4gVGhlIGdvYWwgaXMgdG8gaGF2ZSB0aGUgbWVhc3VyZW1lbnQKPiBjYWxs
IG5vdCBydW4gZHVyaW5nIGJvb3Qgb3Igc3VzcGVuZC9yZXN1bWUsIGJ1dCBvbmx5IG9uIGEgaG90
cGx1Zwo+IGFkZGl0aW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZv
c2luYy5jb20+CgpTaG9vdCwgSSBzYXcgdGhlIG90aGVyIHRocmVhZCBbMV0gd2hlcmUgaXQgc2Vl
bXMgbGlrZSBteSB1c2Ugb2YKYWxsb2NfcGFnZXMoKSBpbiB0aGlzIGNvbnRleHQgaXMgaW1wcm9w
ZXI/IEkgaGFkIHRob3VnaHQgSSB3YXMKYWxyaWdodCwgYXMgRG9jdW1lbnRhdGlvbi9jb3JlLWFw
aS9tZW1vcnktYWxsb2NhdGlvbi5yc3Qgc2F5czoKCiA+IElmIHRoZSBhbGxvY2F0aW9uIGlzIHBl
cmZvcm1lZCBmcm9tIGFuIGF0b21pYyBjb250ZXh0LCBlLmcgaW50ZXJydXB0CiA+IGhhbmRsZXIs
IHVzZSBgYEdGUF9OT1dBSVRgYC4KCkFueSB0aXBzIGZvciByZXByb2R1Y2luZyB0aGF0IHNwbGF0
PyBJIGhhdmUgQ09ORklHX0RFQlVHX0FUT01JQ19TTEVFUApvbiAoaXQncyBpbiB0aGUgZGVmY29u
ZmlnKSwgYW5kIGxvY2tkZXAsIGFuZCBJJ20gb24gQ29ub3IncwpsaW51eC02LjYueS1ydCwgYnV0
IHNvIGZhciBJJ20gbm90IHNlZWluZyBpdC4KCi1FdmFuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvWlVQV2M3c1k0N2wzNGxWK0B4aGFja2VyL1QvI3QKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
