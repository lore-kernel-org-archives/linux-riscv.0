Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A279AEB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWVi0H1+WQ+AZNfgXXL2K5xpaSHsnt++KssK+0oK9K0=; b=VErinXbaD50TFu
	PTYYbR2nFH3UU5HolGBqpAV/P76lIUaW5i0DmemDM1wuoL8aJMPzC4xYTXXDRHboZlD2eeZPqcMJ5
	BQ1VzH0EgZpIpei0IIPgd9Ozrf35m+ponBgd/HK4cX+1Lgme3dzQddHjU0EvJlWrze6JilJxJQkLC
	D/mp2QNTOsVoC12PvWZOjJAe22hJDPUut9FbIzcypsz5YfzN9XuecGIrsGYyvBqG0esxRI/A1g0hf
	qtT1cbuXC+o1se/3AionhM7uAK7AiKjWkRSfI7UjUkehi9wu/xGG+eYgFbOq+cKL1INjlkoEJhHpY
	1KPUizSmJIuEFHogcx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFdQ-001iYR-0p;
	Fri, 16 Jun 2023 20:01:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFdM-001iX2-26;
	Fri, 16 Jun 2023 20:01:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31360631A5;
	Fri, 16 Jun 2023 20:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2656AC433A9;
	Fri, 16 Jun 2023 20:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686945683;
	bh=NNR06pawYLcrluh/DT0ZjxTIOvEpuKGIsr6P52TLsXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nN/7beEvgALVGQkGDEWMU+WqmdryAGMT4sVLSi7IEGH0/JtCnmrU3kw5AqPLNEEt2
	 b6emvhoGN8eTdLfEDtNYs26stQbDj/4s/lj/H7doGiv19RIkQeGdhKyNqG1Qjo7N6h
	 zQTAaJBX00GGP97q/gkRiV+5kyjXHPHnjAye9DI90OZEFDTXx9TQNSqKb0n9w0bzYW
	 yxHLnA4zTvHmfaAjtSOfNR3JJPDo/DMYbNlXcfilvYl1IRgxPyH9NdLZUlPRpYsdUE
	 wHxG+Bo6kDlJfk/kU/gHZcMukITMi2cUkAY5BsjH4quq3iBvEGr92lAorvbxrlQ5vA
	 zG5Aco1x2X+Sg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f7b641f54cso1563912e87.2;
        Fri, 16 Jun 2023 13:01:23 -0700 (PDT)
X-Gm-Message-State: AC+VfDxp5Y88bhA2cX9fm8uU2a6wi1dRKrkeS53gHQrX3xzebjg7vClI
	rBGDA3OPQwXlp2wp5PV3oG0SNVyHUy5dM0t2oCU=
X-Google-Smtp-Source: ACHHUZ5JqRMNnpRMFCyZiMjc+UWPs6A2cx1mTw/2r3SQw3woyTfRJjaUEkhnoXK7xbHKeHI/ilSSCGbka/vlr73Fo7g=
X-Received: by 2002:a05:6512:60a:b0:4f8:5635:2ccf with SMTP id
 b10-20020a056512060a00b004f856352ccfmr2048673lfe.8.1686945680955; Fri, 16 Jun
 2023 13:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-7-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-7-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 13:01:08 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4J+rFvh9WJVWLZxFHtcYxahYk=NoKYdU9FMibZU8986w@mail.gmail.com>
Message-ID: <CAPhsuW4J+rFvh9WJVWLZxFHtcYxahYk=NoKYdU9FMibZU8986w@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] mm/execmem: introduce execmem_data_alloc()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_130124_767277_D646444F 
X-CRM114-Status: GOOD (  23.32  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTo1MeKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2Vy
bmVsLm9yZz4KPgo+IERhdGEgcmVsYXRlZCB0byBjb2RlIGFsbG9jYXRpb25zLCBzdWNoIGFzIG1v
ZHVsZSBkYXRhIHNlY3Rpb24sIG5lZWQgdG8KPiBjb21wbHkgd2l0aCBhcmNoaXRlY3R1cmUgY29u
c3RyYWludHMgZm9yIGl0cyBwbGFjZW1lbnQgYW5kIGl0cwo+IGFsbG9jYXRpb24gcmlnaHQgbm93
IHdhcyBkb25lIHVzaW5nIGV4ZWNtZW1fdGV4dF9hbGxvYygpLgo+Cj4gQ3JlYXRlIGEgZGVkaWNh
dGVkIEFQSSBmb3IgYWxsb2NhdGluZyBkYXRhIHJlbGF0ZWQgdG8gY29kZSBhbGxvY2F0aW9ucwo+
IGFuZCBhbGxvdyBhcmNoaXRlY3R1cmVzIHRvIGRlZmluZSBhZGRyZXNzIHJhbmdlcyBmb3IgZGF0
YSBhbGxvY2F0aW9ucy4KPgo+IFNpbmNlIGN1cnJlbnRseSB0aGlzIGlzIG9ubHkgcmVsZXZhbnQg
Zm9yIHBvd2VycGMgdmFyaWFudHMgdGhhdCB1c2UgdGhlCj4gVk1BTExPQyBhZGRyZXNzIHNwYWNl
IGZvciBtb2R1bGUgZGF0YSBhbGxvY2F0aW9ucywgYXV0b21hdGljYWxseSByZXVzZQo+IGFkZHJl
c3MgcmFuZ2VzIGRlZmluZWQgZm9yIHRleHQgdW5sZXNzIGFkZHJlc3MgcmFuZ2UgZm9yIGRhdGEg
aXMKPiBleHBsaWNpdGx5IGRlZmluZWQgYnkgYW4gYXJjaGl0ZWN0dXJlLgo+Cj4gV2l0aCBzZXBh
cmF0aW9uIG9mIGNvZGUgYW5kIGRhdGEgYWxsb2NhdGlvbnMsIGRhdGEgc2VjdGlvbnMgb2YgdGhl
Cj4gbW9kdWxlcyBhcmUgbm93IG1hcHBlZCBhcyBQQUdFX0tFUk5FTCByYXRoZXIgdGhhbiBQQUdF
X0tFUk5FTF9FWEVDIHdoaWNoCj4gd2FzIGEgZGVmYXVsdCBvbiBtYW55IGFyY2hpdGVjdHVyZXMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChJQk0pIDxycHB0QGtlcm5lbC5vcmc+
ClsuLi5dCj4gIHN0YXRpYyB2b2lkIGZyZWVfbW9kX21lbShzdHJ1Y3QgbW9kdWxlICptb2QpCj4g
ZGlmZiAtLWdpdCBhL21tL2V4ZWNtZW0uYyBiL21tL2V4ZWNtZW0uYwo+IGluZGV4IGE2N2FjZDc1
ZmZlZi4uZjdiZjQ5NmFkNGMzIDEwMDY0NAo+IC0tLSBhL21tL2V4ZWNtZW0uYwo+ICsrKyBiL21t
L2V4ZWNtZW0uYwo+IEBAIC02Myw2ICs2MywyMCBAQCB2b2lkICpleGVjbWVtX3RleHRfYWxsb2Mo
c2l6ZV90IHNpemUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmYWxsYmFja19zdGFy
dCwgZmFsbGJhY2tfZW5kLCBrYXNhbik7Cj4gIH0KPgo+ICt2b2lkICpleGVjbWVtX2RhdGFfYWxs
b2Moc2l6ZV90IHNpemUpCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQgPSBleGVj
bWVtX3BhcmFtcy5tb2R1bGVzLmRhdGEuc3RhcnQ7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGVu
ZCA9IGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMuZGF0YS5lbmQ7Cj4gKyAgICAgICBwZ3Byb3RfdCBw
Z3Byb3QgPSBleGVjbWVtX3BhcmFtcy5tb2R1bGVzLmRhdGEucGdwcm90Owo+ICsgICAgICAgdW5z
aWduZWQgaW50IGFsaWduID0gZXhlY21lbV9wYXJhbXMubW9kdWxlcy5kYXRhLmFsaWdubWVudDsK
PiArICAgICAgIHVuc2lnbmVkIGxvbmcgZmFsbGJhY2tfc3RhcnQgPSBleGVjbWVtX3BhcmFtcy5t
b2R1bGVzLmRhdGEuZmFsbGJhY2tfc3RhcnQ7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGZhbGxi
YWNrX2VuZCA9IGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMuZGF0YS5mYWxsYmFja19lbmQ7Cj4gKyAg
ICAgICBib29sIGthc2FuID0gZXhlY21lbV9wYXJhbXMubW9kdWxlcy5mbGFncyAmIEVYRUNNRU1f
S0FTQU5fU0hBRE9XOwo+ICsKPiArICAgICAgIHJldHVybiBleGVjbWVtX2FsbG9jKHNpemUsIHN0
YXJ0LCBlbmQsIGFsaWduLCBwZ3Byb3QsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YWxsYmFja19zdGFydCwgZmFsbGJhY2tfZW5kLCBrYXNhbik7Cj4gK30KPiArCj4gIHZvaWQgZXhl
Y21lbV9mcmVlKHZvaWQgKnB0cikKPiAgewo+ICAgICAgICAgLyoKPiBAQCAtMTAxLDYgKzExNSwy
OCBAQCBzdGF0aWMgYm9vbCBleGVjbWVtX3ZhbGlkYXRlX3BhcmFtcyhzdHJ1Y3QgZXhlY21lbV9w
YXJhbXMgKnApCj4gICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIGV4
ZWNtZW1faW5pdF9taXNzaW5nKHN0cnVjdCBleGVjbWVtX3BhcmFtcyAqcCkKClNoYWxsIHdlIGNh
bGwgdGhpcyBleGVjbWVtX2RlZmF1bHRfaW5pdF9kYXRhPwoKPiArewo+ICsgICAgICAgc3RydWN0
IGV4ZWNtZW1fbW9kdWxlc19yYW5nZSAqbSA9ICZwLT5tb2R1bGVzOwo+ICsKPiArICAgICAgIGlm
ICghcGdwcm90X3ZhbChleGVjbWVtX3BhcmFtcy5tb2R1bGVzLmRhdGEucGdwcm90KSkKPiArICAg
ICAgICAgICAgICAgZXhlY21lbV9wYXJhbXMubW9kdWxlcy5kYXRhLnBncHJvdCA9IFBBR0VfS0VS
TkVMOwoKRG8gd2UgcmVhbGx5IG5lZWQgdG8gY2hlY2sgZWFjaCBvZiB0aGVzZT8gSU9XLCBjYW4g
d2UgZG86CgppZiAoIXBncHJvdF92YWwoZXhlY21lbV9wYXJhbXMubW9kdWxlcy5kYXRhLnBncHJv
dCkpIHsKICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMuZGF0YS5wZ3Byb3QgPSBQQUdFX0tF
Uk5FTDsKICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMuZGF0YS5hbGlnbm1lbnQgPSBtLT50
ZXh0LmFsaWdubWVudDsKICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMuZGF0YS5zdGFydCA9
IG0tPnRleHQuc3RhcnQ7CiAgICAgICBleGVjbWVtX3BhcmFtcy5tb2R1bGVzLmRhdGEuZW5kID0g
bS0+dGV4dC5lbmQ7CiAgICAgICBleGVjbWVtX3BhcmFtcy5tb2R1bGVzLmRhdGEuZmFsbGJhY2tf
c3RhcnQgPSBtLT50ZXh0LmZhbGxiYWNrX3N0YXJ0OwogICAgICBleGVjbWVtX3BhcmFtcy5tb2R1
bGVzLmRhdGEuZmFsbGJhY2tfZW5kID0gbS0+dGV4dC5mYWxsYmFja19lbmQ7Cn0KClRoYW5rcywK
U29uZwoKWy4uLl0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
