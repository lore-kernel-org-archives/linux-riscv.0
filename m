Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2998C54731
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFAOKAcG4KoJH67/w/JbDchAgmuemC6s1Qdrxhdle4Y=; b=v47z9uQOfF+VCB
	ootLsTK8WJGxPj2JRTN/WnP6LDs5E1vDRhgyXqE//JZYhEBJstaiPMMWTxfwUkGUQIq62Lbtb2n6w
	4zzlYGmitZDSkIQjAKnEwKOSBRFbOo+ONzQ90Lc0V6C3n3HfMS4EogzuutJ+k54c23/Fi87hzb/lg
	Q22LNhJ5w53PFtgvWhP6RHkmyBOBwVPTE2N4M/5bGp+jbP0UfbEubI/W5tWYVZacL8W1259vo06IF
	X3XlqYJ32DN5kz2YklaV0fU/hikI9WgKHoD5FHEFfKay9YpLRTU5cPjgxi4JedUNKYNbAVic+fox5
	pRZp/gtzmCZPoM3OH5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siz45-0000000C4YZ-1UOE;
	Tue, 27 Aug 2024 16:29:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siz2V-0000000C45q-14Vw;
	Tue, 27 Aug 2024 16:27:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ECFD5A4252C;
	Tue, 27 Aug 2024 16:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE6CC581BB;
	Tue, 27 Aug 2024 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724775636;
	bh=Nq+N2JRm3qs/YfyiIeI6nh9WFZTDcrLh7AvXtVujdoc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kMTKuI5rfdZ7S/J978dFx/vEVmxDYHpINBaSPMCrIlVb15gdSLENBvbIDc1bqVGMv
	 uhev6qlAyNA+RqfXkZihFS4wf63LI0MZUMP8yRL0V+0Uyf108AmHRyh4PwP3GGT2lP
	 qGviXwLk9n1XV20/5uupk7bLBAkB+aW3maMGy7KDuu1dIxSfRQLVtu5XOXIMJc04Lg
	 yItklsEHDP+v6nftf63HtbRXg5qaQB1wXMTiGFwWEGoOMjni3xbOLgQCpx5mygys64
	 KyJDBEuKGeloEihQul1Db2k6hAG0kNAGzxEFhYqz4e6DnntH46T1yhq5l5aFAJKoQl
	 XR7hIjmWVQruw==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-270263932d5so4031623fac.2;
        Tue, 27 Aug 2024 09:20:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVN3lcjuSCHFqdI4ZaFEQPSqFqrIPPmQSqqNo07n9VcqS5SvNamki7+7Ayy1hi0pvkXB7ntNs91vY4tWRI=@lists.infradead.org, AJvYcCVVp8BZ6LTfoD2YkaCyq1kiVRpUfWKxhr0PyMI/C4XD2Cq7ERs8dE4Os4uH0YzLtvGRtkPQtVLctPRVheykEMCW@lists.infradead.org
X-Gm-Message-State: AOJu0YxaFWIkQmPygRW15RQkaGfUxCzdVrQztAJhtC4WXkXTbT4WmLke
	91+dqk7I9FASc1xFLa+29HcXqZtTmLqJMAaziB8DQLm/dwmNSWXvW9M3Lr+WSAbTrOH3uJYs8zT
	NSTRxM5zsFUbA8MhdCiOEviexQI0=
X-Google-Smtp-Source: AGHT+IEcevmf56HaHFi76opfMbCV8B1aBMG9slI81zTpqBsgMvZDsrfuxYvsyZ6B/GpsYTnUSrI2yl5r0i6NGyBQDqc=
X-Received: by 2002:a05:6870:82a1:b0:270:735:96e with SMTP id
 586e51a60fabf-273e6465ed4mr15637051fac.12.1724775635797; Tue, 27 Aug 2024
 09:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
 <ZrlgVUXC_dCW9ISM@sunil-laptop> <87mskzcnmf.ffs@tglx> <CAJZ5v0imJcU4cwDuZKEvGf93fZm4ea4s2Ocp3Cnfb3+nBQ0-Gg@mail.gmail.com>
 <Zsy3o_N8hvc6GfTp@sunil-laptop> <CAJZ5v0hxoT9tBjm3xRPU4fHx3MgHfYAx_Vyf4oe2toa3GWAN+Q@mail.gmail.com>
 <87jzg3c7bz.ffs@tglx>
In-Reply-To: <87jzg3c7bz.ffs@tglx>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Aug 2024 18:20:24 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iMpaxBevgPWmD2Ym_JG1ChkjzVFf22fV7Xw8-ssg9+Ag@mail.gmail.com>
Message-ID: <CAJZ5v0iMpaxBevgPWmD2Ym_JG1ChkjzVFf22fV7Xw8-ssg9+Ag@mail.gmail.com>
Subject: Re: [PATCH v8 00/17] RISC-V: ACPI: Add external interrupt controller support
To: Thomas Gleixner <tglx@linutronix.de>, Sunil V L <sunilvl@ventanamicro.com>
Cc: Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Anup Patel <anup@brainfault.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Robert Moore <robert.moore@intel.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_092727_442463_B0374BE8 
X-CRM114-Status: GOOD (  17.16  )
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

T24gTW9uLCBBdWcgMjYsIDIwMjQgYXQgMTE6MjLigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAyNiAyMDI0IGF0IDE5OjI3LCBS
YWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDc6MjLi
gK9QTSBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPj4gVGhl
cmUgd2lsbCBiZSBhIGNvbmZsaWN0IGluIFBMSUMgaXJxY2hpcCBkcml2ZXIgZHVlIHRvIGEgcmVj
ZW50IHBhdGNoIFsxXS4KPiA+PiBUaGlzIHBhdGNoIGlzIG5vdCBpbiBsYXRlc3QgUkM1IHJlbGVh
c2UgYnV0IGluIGxpbnV4LW5leHQuIEkgdXN1YWxseSBiYXNlIHRoZQo+ID4+IHNlcmllcyBvbiBs
YXRlc3QgUkMgcmVsZWFzZS4gU2hvdWxkIEkgcmViYXNlIHRvIGxpbnV4LW5leHQgaW4gdGhpcyBj
YXNlCj4gPj4gYW5kIHNlbmQgdGhlIG5leHQgcmV2aXNpb24gb2YgdGhlIHNlcmllcyByZXNvbHZp
bmcgdGhlIGNvbmZsaWN0Pwo+ID4KPiA+IE5vLCBwbGVhc2UgZG9uJ3QuCj4gPgo+ID4gVGhhdCB3
aWxsIGJlIHJlc29sdmVkIGF0IHRoZSBtZXJnZSB0aW1lLgo+Cj4gQWx0ZXJuYXRpdmVseSB5b3Ug
Y2FuIHB1bGwKPgo+ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3RpcC90aXAuZ2l0IGlycS11cmdlbnQtMjAyNC0wOC0yNQo+Cj4gd2hpY2ggSSdtIGFib3V0
IHRvIHNlbmQgdG8gTGludXMgbGF0ZXN0IHRvbW9ycm93IG1vcm5pbmcuIFRoYXQgY29udGFpbnMK
PiB0aGUgY29uZmxpY3RpbmcgY2hhbmdlLgoKU28gSSd2ZSBhcHBsaWVkIHRoZSBzZXJpZXMgb24g
dG9wIG9mIHRoZSBhYm92ZS4KClRoaXMgaW5jbHVkZWQgYSBmdWxsLXN3aW5nIHJlYmFzZSBvZiB0
aGUgbGFzdCBwYXRjaCwgd2hpY2ggSSBob3BlIEkndmUKZG9uZSBjb3JyZWN0bHksIGJ1dCBTdW5p
bCBwbGVhc2Ugc2VlCgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9yYWZhZWwvbGludXgtcG0uZ2l0L2NvbW1pdC8/aD1ibGVlZGluZy1lZGdlJmlkPTVkMWI1
NDk4ODNjMWJiYTMzMWM0MTllNDkxZmRhOWJiOTM0ZWEyMDIKCmFuZCBsZXQgbWUga25vdy4KClRo
YW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
