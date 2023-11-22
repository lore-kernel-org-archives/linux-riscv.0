Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33407C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cA8RHWwWPvuRDgv/ECA+Artg3gtejl0xwqF/s0ImOY=; b=oqF1CwY64p4GY6
	BZDpolpN92qzBSD7DaFQujjd8jdhKfy1Oosr3XLpRIGMkD/CZlnW19dqONlPF8A9Y0y9MEFPN4n37
	NM6ikHQXfF7Ofu1G8CSl9shWpqNOqPFi5jwNW85UNUb0lRc3dVX9ixaf5ebxLItZjAaY5Jm91EU4h
	6i0zupkI1QO3lXui+qpnSMGNXSycwm39SLgD95mm9B7nTX9kgszmCD2JPVsHrKBVMBQfb6qTIH7Dk
	DbjQ/yipjDZCY1sKYHGAAgjMK6gid6Pxz2nFy0fIIFfTY7bqwiCpVgx5WiqXjhH1h99aUOhhidlf5
	zFS+zNOdEXxDqk62I8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qBP-002UaC-2E;
	Wed, 22 Nov 2023 16:34:35 +0000
Received: from mail-yw1-f171.google.com ([209.85.128.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qBL-002UYn-0k;
	Wed, 22 Nov 2023 16:34:32 +0000
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5cc66213a34so9261887b3.1;
        Wed, 22 Nov 2023 08:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670870; x=1701275670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ophsLbscDpT/fxf0eBhWE8ZK8OIp8kFL24DJaRjaQW8=;
        b=AHClDcY1GHJOsTjKxFamwKM6sHq/6SDHl8a4Bp7yjf/YxG2Z0RLxRsRvA5aY1cBksf
         9uVap2oCKVzYcWCsYVIJ/p2fn/oqU4u8HpQnYMvL/ZUz0/l+heWihBkGBa0uOO5f7uik
         WtyTMvSXA/hYXcGF8nsPAmUZ40yrKRFJw9zndQPq5iDNZ6oHWHibvwPVEQpbDZ/xsLRV
         LT6c++uMed496xakRxgd9lX/WKaTJvwNfzPjCK0idPOeN/MtbZcxCkqsvoMnNF+pIRC0
         7AuttS9awBdF9S2ecD9/gKCSRqT5NYbpNwyQ6vijERhSvnnE7tG/DYpzAL55d99482dW
         ElbQ==
X-Gm-Message-State: AOJu0YyRyHGpz3avzYFSfUsuSx341gS04rffN5TRsFEDE0HMYKmcQzt3
	53hh2FtCSWOKaAJGplRiPFr6MV1uiPTrPQ==
X-Google-Smtp-Source: AGHT+IED8jH3h2oS3Eb3O57oWe4eS8Nsp3itA3LK2zU7lQkB2Ld6/hhvYp+LgcH1D6uwUIoC101Mwg==
X-Received: by 2002:a25:ec0c:0:b0:d9a:d196:67c1 with SMTP id j12-20020a25ec0c000000b00d9ad19667c1mr2462333ybh.10.1700670870024;
        Wed, 22 Nov 2023 08:34:30 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id j203-20020a2523d4000000b00da0c49a588asm1457388ybj.8.2023.11.22.08.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Nov 2023 08:34:29 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5ca9114e0e2so35656237b3.3;
        Wed, 22 Nov 2023 08:34:29 -0800 (PST)
X-Received: by 2002:a0d:cb58:0:b0:5cb:576a:ec1c with SMTP id
 n85-20020a0dcb58000000b005cb576aec1cmr2804676ywd.9.1700670868874; Wed, 22 Nov
 2023 08:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20231122121235.827122-1-peterlin@andestech.com> <20231122121235.827122-13-peterlin@andestech.com>
In-Reply-To: <20231122121235.827122-13-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Nov 2023 17:34:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHx6FoTCZZqaUAES5wJ=JBu7iLvVtNdBZAHB9mgBX4Gg@mail.gmail.com>
Message-ID: <CAMuHMdWHx6FoTCZZqaUAES5wJ=JBu7iLvVtNdBZAHB9mgBX4Gg@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] riscv: dts: renesas: Add Andes PMU extension
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_083431_276399_71698AE8 
X-CRM114-Status: GOOD (  13.42  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgMToxN+KAr1BNIFl1IENoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4geGFuZGVzcG11IHN0YW5kcyBmb3IgQW5kZXMg
UGVyZm9ybWFuY2UgTW9uaXRvciBVbml0IGV4dGVuc2lvbi4KPiBCYXNlZCBvbiB0aGUgYWRkZWQg
QW5kZXMgUE1VIElTQSBzdHJpbmcsIHRoZSBTQkkgUE1VIGRyaXZlcgo+IHdpbGwgbWFrZSB1c2Ug
b2YgdGhlIG5vbi1zdGFuZGFyZCBpcnEgc291cmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUgQ2hp
ZW4gUGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPgoKUmV2aWV3ZWQtYnk6IEdlZXJ0
IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9
cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhr
Lm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
