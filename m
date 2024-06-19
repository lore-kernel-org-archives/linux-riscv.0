Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EEDC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 01:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moFKOjIW9biQioPEeSv7FlzBwZEy+7C48+OkHjRsJCM=; b=tZobeV5F7wk67M
	CmQQfbpaP77LmUZxohb4n8tW78YBIsFNaTUjm5yjJBgevPtOfu4FRvy3aWe4djf4aBgYZsNp5Pume
	WPUZx0LTjqGJ8po8URpMlKaLiB7qmeLr9tCyWEYIHrqU3HbFkVKyQ0VBes2f4xFLBUAUhG2mzrefx
	7UcfbDcScO2T8H7qxLjc3lZq6qtPoe9pd6iWrc3QbEcC26tY1Wrwt/y4KgBvhh9jfdO+rOyZeEMSR
	8ysY8MeIhc7+GrzbSLvBlmp1Uzhq0hvqd3bST/nyL1AZt/A6U7JIplOj7TS+WmukMal5R/qQf+qnu
	cpVNWi1YScdhfjlXn5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJjxo-0000000H5vN-18r5;
	Wed, 19 Jun 2024 01:18:16 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJjxi-0000000H5uQ-11ZO;
	Wed, 19 Jun 2024 01:18:13 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so105592431fa.0;
        Tue, 18 Jun 2024 18:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718759887; x=1719364687; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ey5yiVQA8LBP/6zYkNpIcrvI4fFdl2/Q3IQajczTvLM=;
        b=jrQ8KBw6iR555mdoCAdEkS2FybW9kjBwBXEkIgAoeGJHTceB0/lD0AcYLweSsBoxHx
         Fkd1Iwv3WLxq5y8aPxBhyG4sJw9uThwkT/0Y5h/FlG9+TooQ3lK8UpbwD4Ec9Mz+yRoC
         upO8GorHJMEbC4cxiNhHSpVSuR04QcJT4PDEwYgbL4VsmBNBz681A0kS31EIkrnwotOP
         SAjE58YFbmFk0R//SGH+uWDKhVXGNlH1yZFN1vYtOV2ECTHWVw174p+yOCbP6Iy/zs3d
         BQ7ASEwuDcoBG1BzO98p9meuFmTjq0bz42cCLGpXRlHGu4vbE82wTczy412rlZOmgAu2
         sGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718759887; x=1719364687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ey5yiVQA8LBP/6zYkNpIcrvI4fFdl2/Q3IQajczTvLM=;
        b=MKddbzcy6Gs+voFAolxABp6pdfYk0M+PzS5iuEAHCaOaTZPB7edkmryHwP7aORPPi0
         TBE0VBdkb4lruw16Z0NXVHzdBcJmg26XNOeMIvujJWlvz6vteff/2Eu8sYHpE+D+2Ra+
         1FPXXqbSxN4/84tcNbBXV7eiWQm/8HrzDCZvMTeBm2lliX0oqBt+T/qsP/eLkjQoKBEO
         C+32wcGcFOLx3V/K3Y+Pq2JENY6FwBZam4oiG9eBA0yEyrDmuujtoVT8cE9Wjj1bYHv+
         GbRMIQ8cNwH4nrmK9rRPv8YyPlrqpZYVgfwRBv16y2UbCoclGbfrrGQG+3iyU0Ia82M1
         4S7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPbBY6WqYcQcYyNjJa0f106DduoapxekWvxxdO3bPfaGQdD6gBKzYw08fadDcgwCdgvFzANFIp0slpaqU7COz7CDKBgDDXOU6NxFrKDnkbpncNpHDx1XdiyWCOJk9gqt7NKvhc35J3Sa4qVaIX9gm3XuANJeM=
X-Gm-Message-State: AOJu0YzndZOP9n//y4TV+tbps08eqU5q1vk5SzrVwXt3UISXOZu+2tG8
	ZNI02OOPbXWLoMZDvLTh7HS9Vi8qLEwXjZFssYGZTNTTvxAFaQOcPQI1TW7fu6Ly116BXn/jyLl
	fKHFAqMelYAHHw1mURU7pTQdig9E=
X-Google-Smtp-Source: AGHT+IFiTPEbVFgx6S7H+uJNwNOLjAFLVL5/Vnh5jjNpcZV25rpymoEhI57ECx4iXoR1vGPAbIVLdQm2Xan1iCOIji0=
X-Received: by 2002:a2e:9f02:0:b0:2ea:ec52:f594 with SMTP id
 38308e7fff4ca-2ec3ced1896mr8494161fa.29.1718759886352; Tue, 18 Jun 2024
 18:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718268003.git.haibo1.xu@intel.com> <f1f96377b8ecd6e3183f28abf5c9ac21cb9855ea.1718268003.git.haibo1.xu@intel.com>
 <CAJve8o=8thBhU3NyTaS6sE9rQ1VR_Qf4O8FkAxpmp1q8P-6VaQ@mail.gmail.com> <20240618151820.GA2354@willie-the-truck>
In-Reply-To: <20240618151820.GA2354@willie-the-truck>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 19 Jun 2024 09:17:54 +0800
Message-ID: <CAJve8o=-bZhQS289jwxG=Aq2BOXk5OzdgPKT=nFE9yw_HYYnQQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] ACPI: NUMA: change the ACPI_NUMA to a hidden option
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_181810_337630_8B64E7BA 
X-CRM114-Status: GOOD (  19.22  )
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
Cc: Alison Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Zong Li <zong.li@sifive.com>, WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Haibo Xu <haibo1.xu@intel.com>, Baoquan He <bhe@redhat.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, linux-riscv@lists.infradead.org, Robert Richter <rrichter@amd.com>, linux-acpi@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, James Morse <james.morse@arm.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, arnd@arndb.de, Charlie Jenkins <charlie@rivosinc.com>, Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>, Zhao Ke <ke.zhao@shingroup.cn>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMTgsIDIwMjQgYXQgMTE6MTjigK9QTSBXaWxsIERlYWNvbiA8d2lsbEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDE3LCAyMDI0IGF0IDA5OjM0OjE4UE0gKzA4
MDAsIEhhaWJvIFh1IHdyb3RlOgo+ID4gQENhdGFsaW4gTWFyaW5hcyBASHVhY2FpIENoZW4KPiA+
Cj4gPiBDb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoaXMgcGF0Y2ggZm9yIHRoZSBB
Q1BJX05VTUEgY29uZmlnIG9uCj4gPiBBUk02NCBhbmQgTE9PTkdBUkNIIHJlc3BlY3RpdmVseS4K
PiA+Cj4gPiBUaGFua3MhCj4gPgo+ID4gT24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgNDozN+KAr1BN
IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4geDg2L2Fy
bTY0L2xvb25nYXJjaCB3b3VsZCBzZWxlY3QgQUNQSV9OVU1BIGJ5IGRlZmF1bHQgYW5kIHJpc2N2
Cj4gPiA+IHdvdWxkIGRvIHRoZSBzYW1lIHRoaW5nLCBzbyBjaGFuZ2UgaXQgdG8gYSBoaWRkZW4g
b3B0aW9uIGFuZCB0aGUKPiA+ID4gc2VsZWN0IHN0YXRlbWVudHMgZXhjZXB0IGZvciB0aGUgWDg2
XzY0X0FDUElfTlVNQSBjYW4gYWxzbyBnbyBhd2F5Lgo+ID4gPgo+ID4gPiBTdWdnZXN0ZWQtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gPiA+IFN1Z2dlc3RlZC1ieTogU3VuaWwg
ViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJv
IFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9hcm02NC9LY29u
ZmlnICAgICAgICB8IDEgLQo+ID4gPiAgYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyAgICB8IDEgLQo+
ID4gPiAgZHJpdmVycy9hY3BpL251bWEvS2NvbmZpZyB8IDUgKy0tLS0KPiA+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCj4KPiBUaGlzIGxvb2tzIGZp
bmUgZnJvbSBhbiBhcm02NCBwZXJzcGVjdGl2ZToKPgo+IEFja2VkLWJ5OiBXaWxsIERlYWNvbiA8
d2lsbEBrZXJuZWwub3JnPgo+CgpUaGFuayB5b3UsIFdpbGwhCgo+IFdpbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
