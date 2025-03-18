Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE7FC35FF3
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jpDCcZBYriO8mFtbyYc0dANNIZgRthLr+9Nxrdqt1g=; b=sDsTIElOeB+8KR
	P1oervJ1UFh6RSTdT/GGMRQXQSRjo5XGUK/oQ/jRRaCFAip7PXY2Tzi6WerE/ybtdFNnVofELri3U
	Kd5S/XESQUsciqPzRojThVW4CzIAmgK46ga9qLyUBtXUEPeetxGerMPl4jcsu5+61SzdprdHL1Sy+
	YPojp6up4MXkZ3cAH16rySObvcJLdO5wRxPK1IZFqR6zs2NIK9c8nXVeFcLcBFu0/3Ce4jbty2C6v
	JqU1HNBikU4QqhKrfHPciNdSskw3L1b8MLiQLkaWy0kVSZqpJSVntr0JMD7otKZ4KnjcFzH4GbAZS
	2X0wBtmi82+oq8aUaU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVfw-00000005p5K-267P;
	Tue, 18 Mar 2025 12:04:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVa2-00000005npu-0zBQ;
	Tue, 18 Mar 2025 11:57:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8ADACA43555;
	Tue, 18 Mar 2025 11:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA00C4CEFC;
	Tue, 18 Mar 2025 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742299076;
	bh=CIhTjH9kKlO1VYGiipc2V9drjBD3Ayt0OkD0U7KRb6w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VNZz+D/dtbyshE97W4HnLDn48vAHhWJ1qM3mL/ZcYLXzJCavmJHa91JYiiOlMNJbz
	 3UQHEcUGagflvTa1naQQ3WhxL7VDkHEqM2S7CkzCA9R2QNMrKsOF/87TV8TeAU7pag
	 JnyeHsFK4NM+n6Sd6iwRDBgTTtsst7XHqqi+SMHGvuW0tYLqcabFNOqlgCauzVkD73
	 FEV87vVnNi6+5cugxgHyXPjIWm09qmE4hdd7e5vWrscoz4DVCqYqP4MsFlrfEg/D+e
	 hisoP8e3IL/aZBRIfu7TRQITKlDjGtX7HEA5nLU4mGdskuoLTKP3Pn1CaVYbWjJBBQ
	 A9XO+vMkI9ejg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so8669595a12.2;
        Tue, 18 Mar 2025 04:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUExeOBmX/zLWPoouMBtGnTVddztDmbYXPLoFTsi7WZLz5+CATmFVCCgaNQnK2T6h397YmsbmAN2L0/YQwFkBFA4w==@lists.infradead.org, AJvYcCVJ4YiEq5+eSYPmP0EgeqmaGnSQjR/2uE3lVhucTc6hmPQdyL/svUXPKvfCyhEznqz+Skzwj0PhRks1MxC4L29P@lists.infradead.org, AJvYcCXslvRvQkMR98QPyAYPldX1YMfC4z23AKiRIGiWLqQhvMAvm71kcQnE/VGtksAupbh8HHEv87/IuSnyGbY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Pf89FOYPXveyy6ftxVh7S8BxYXHCOolvbd2yMyg3PA20TgLm
	wdwE119l5ymHgl/lT08tYc0lpNektVHrXa11hLB1wdH5mZ/KG353wFL3c3kHz4BeUnKR4K+wRvA
	wkreDi+OoaBXZgX+Kfb5qbG8c1fg=
X-Google-Smtp-Source: AGHT+IHWKrMLWQmDlK3EXFGkIz3JuWrB7n/PbIZxnJSxvCf68cavwFPKlU+WgeLv6v2/CTfArLyeiik7sHtiA+Oo+58=
X-Received: by 2002:a17:907:1009:b0:ac3:3f10:e8e3 with SMTP id
 a640c23a62f3a-ac33f10ed5cmr1299294766b.1.1742299074804; Tue, 18 Mar 2025
 04:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250115-fix-riscv-rt_group_sched-v4-0-607606fe73a5@coelacanthus.name>
 <20250115-fix-riscv-rt_group_sched-v4-4-607606fe73a5@coelacanthus.name> <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
In-Reply-To: <t2dustbykx2qd24wazjeiw5hch5nwr6z2ewmaf4srg6r2grwrf@rdw47chzkef2>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Mar 2025 19:57:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fTGs-7EXE0EcR=P6GqHF2fokRE-kEte+cDmhjy=FYsA@mail.gmail.com>
X-Gm-Features: AQ5f1Jo4W5NNqo2SfcBdxKCe2OFxQs4im7DaCODl6wEw6MnCM3-sp2pnyba2ZAw
Message-ID: <CAAhV-H4fTGs-7EXE0EcR=P6GqHF2fokRE-kEte+cDmhjy=FYsA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from bcm2835/tegra/omap2plus
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Celeste Liu <uwu@coelacanthus.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Anup Patel <anup@brainfault.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, WANG Xuerui <kernel@xen0n.name>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>, 
	Thierry Reding <treding@nvidia.com>, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_045758_404349_EDC9A886 
X-CRM114-Status: GOOD (  21.88  )
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

T24gRnJpLCBNYXIgNywgMjAyNSBhdCAzOjE54oCvQU0gVGhpZXJyeSBSZWRpbmcgPHRoaWVycnku
cmVkaW5nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAxNSwgMjAyNSBhdCAwNDo0
MToyM0FNICswODAwLCBDZWxlc3RlIExpdSB3cm90ZToKPiA+IENvbW1pdCA2NzNjZTAwYzVkNmMg
KCJBUk06IG9tYXAycGx1c19kZWZjb25maWc6IEFkZCBzdXBwb3J0IGZvciBkaXN0cm9zCj4gPiB3
aXRoIHN5c3RlbWQiKSBzYWlkIGl0J3MgYmVjYXVzZSBvZiByZWNvbW1lbmRhdGlvbiBmcm9tIHN5
c3RlbWQuIEJ1dAo+ID4gc3lzdGVtZCBjaGFuZ2VkIHRoZWlyIHJlY29tbWVuZGF0aW9uIGxhdGVy
LlsxXQo+ID4KPiA+IEZvciBjZ3JvdXAgdjEsIGlmIHR1cm5lZCBvbiwgYW5kIHRoZXJlJ3MgYW55
IGNncm91cCBpbiB0aGUgImNwdSIgaGllcmFyY2h5IGl0Cj4gPiBuZWVkcyBhbiBSVCBidWRnZXQg
YXNzaWduZWQsIG90aGVyd2lzZSB0aGUgcHJvY2Vzc2VzIGluIGl0IHdpbGwgbm90IGJlIGFibGUg
dG8KPiA+IGdldCBSVCBhdCBhbGwuIFRoZSBwcm9ibGVtIHdpdGggUlQgZ3JvdXAgc2NoZWR1bGlu
ZyBpcyB0aGF0IGl0IHJlcXVpcmVzIHRoZQo+ID4gYnVkZ2V0IGFzc2lnbmVkIGJ1dCB0aGVyZSdz
IG5vIHdheSB3ZSBjb3VsZCBhc3NpZ24gYSBkZWZhdWx0IGJ1ZGdldCwgc2luY2UgdGhlCj4gPiB2
YWx1ZXMgdG8gYXNzaWduIGFyZSBib3RoIHVwcGVyIGFuZCBsb3dlciB0aW1lIGxpbWl0cywgYXJl
IGFic29sdXRlLCBhbmQgbmVlZCB0bwo+ID4gYmUgc3VtIHVwIHRvIDwgMSBmb3IgZWFjaCBpbmRp
dmlkYWwgY2dyb3VwLiBUaGF0IG1lYW5zIHdlIGNhbm5vdCByZWFsbHkgY29tZSB1cAo+ID4gd2l0
aCB2YWx1ZXMgdGhhdCB3b3VsZCB3b3JrIGJ5IGRlZmF1bHQgaW4gdGhlIGdlbmVyYWwgY2FzZS5b
Ml0KPiA+Cj4gPiBGb3IgY2dyb3VwIHYyLCBpdCdzIGFsbW9zdCB1bnVzYWJsZSBhcyB3ZWxsLiBJ
ZiBpdCB0dXJuZWQgb24sIHRoZSBjcHUgY29udHJvbGxlcgo+ID4gY2FuIG9ubHkgYmUgZW5hYmxl
ZCB3aGVuIGFsbCBSVCBwcm9jZXNzZXMgYXJlIGluIHRoZSByb290IGNncm91cC4gQnV0IGl0IHdp
bGwKPiA+IGxvc2UgdGhlIGJlbmVmaXRzIG9mIGNncm91cCB2MiBpZiBhbGwgUlQgcHJvY2VzcyB3
ZXJlIHBsYWNlZCBpbiB0aGUgc2FtZSBjZ3JvdXAuCj4gPgo+ID4gUmVkIEhhdCwgR2VudG9vLCBB
cmNoIExpbnV4IGFuZCBEZWJpYW4gYWxsIGRpc2FibGUgaXQuIHN5c3RlbWQgYWxzbyBkb2Vzbid0
Cj4gPiBzdXBwb3J0IGl0Lgo+ID4KPiA+IFsxXTogaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQv
c3lzdGVtZC9jb21taXQvZjRlNzRiZTE4NTZiM2FjMDU4YWNiZjFiZTMyMWMzMWQ1Mjk5ZjY5Zgo+
ID4gWzJdOiBodHRwczovL2J1Z3ppbGxhLnJlZGhhdC5jb20vc2hvd19idWcuY2dpP2lkPTEyMjk3
MDAKPiA+Cj4gPiBUZXN0ZWQtYnk6IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+Cj4g
PiBBY2tlZC1ieTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KPiA+IEFja2Vk
LWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogQ2VsZXN0ZSBMaXUgPHV3dUBjb2VsYWNhbnRodXMubmFtZT4KPiA+IC0tLQo+ID4gIGFyY2gv
YXJtL2NvbmZpZ3MvYmNtMjgzNV9kZWZjb25maWcgICB8IDEgLQo+ID4gIGFyY2gvYXJtL2NvbmZp
Z3Mvb21hcDJwbHVzX2RlZmNvbmZpZyB8IDEgLQo+ID4gIGFyY2gvYXJtL2NvbmZpZ3MvdGVncmFf
ZGVmY29uZmlnICAgICB8IDEgLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkK
Pgo+IEhpIEFybmQsCj4KPiBpcyB0aGlzIHNvbWV0aGluZyB0aGF0IHlvdSBjb3VsZCBwaWNrIHVw
PyBJIHRoaW5rIHNvIGZhciBvbmx5IHRoZSBSSVNDLVYKPiBwYXRjaCB3YXMgcGlja2VkIHVwLCBi
dXQgbm9ib2R5IHNlZW1zIHRvIGZlZWwgcmVzcG9uc2libGUgZm9yIHRoZSBBUk0KPiBwYXRjaCBo
ZXJlLgpJIHdpbGwgdGFrZSB0aGUgTG9vbmdBcmNoIHBhdGNoLCBidXQgbWF5IGJlIHNxdWFzaGVk
IHRvIGFub3RoZXIgb25lCmFib3V0IGNvbmZpZyBmaWxlIHVwZGF0ZS4KCkh1YWNhaQoKPgo+IFRo
aWVycnkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
