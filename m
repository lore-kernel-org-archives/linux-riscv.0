Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095D1C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMk0/0le8Kte+IirzPTw3ukzWMqwVEUP3JDEX4Rutqk=; b=Enp2WizBTXTven
	ap70wuBWN9n4oK088m+gNZiZj8j+d3Nn8sP+OS1JuLe3g7doI6miHYZGZZ4NQAgskt+9jhOjD96+P
	QImbdf/UxSLcO8/QGDGGcgKIxe3RWLIjD1GdPSASL3d4dHvn9BMS4Ft8q1fjCcgKsd29308S7Ks0i
	MTvb0OSmKwPXQNYHzNuTpBUhdW5Ouhq0GnKqmpzkL1EbL/T0bko56t3nhxFh8FewUQfmMFPgfo/EG
	9LXGgJ+8krmuUJkRq2SRARvY9i7qCDnNyVPPUxMlemCIEACRg0+1YLSZZeialq5B3SAnkSXOopnLQ
	M0a0G2132iyrEzak2Yng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8MXs-008krc-2n;
	Wed, 29 Nov 2023 15:32:12 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8MXm-008knb-32
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 15:32:11 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5cc589c0b90so69565307b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 07:32:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701271923; x=1701876723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4vTG8Hn0SjV13nxaNu0/LCBSnyuhM59vYVhKd+lgjk=;
        b=r01j7GXTurw5RjHPCg+BZbvsc0NhvlIOU/81NXdMI4k5hn4y0cY/JBkJG5UeMhpzDF
         1rCr7DweB0JDZYe2Ida93TouiQuJx6g1PR00PVPreTtuuJ2zIF4ysDiwiyZ1QSXsQuUP
         O+kBcFjKWtlmPAVQyROgUw6gLcKlMXp9UlK5lbt6bSemQoL7tS/900mllkZC2BSXnci3
         hKbONg36GkaalaFuBbJw3kGDQRtnb9YAVC5boudt9UHUBXXtqKBXhQqFg5uhbDcEMdoE
         5GQ8qlDbLPNHzlWmd3MEZUaICLOCgz4NlQfZZbC18kNjjv1ckCq7/xXxCvXBrN6qRsUN
         dkfA==
X-Gm-Message-State: AOJu0Yyef1M+KULTAiuk24FGWLp322Cnk96nBlYs8v/4BsTy1q9ugfNY
	NFu2ogFhl8Av/3mEZxINfhu26hP8KZ9PJQ==
X-Google-Smtp-Source: AGHT+IGBWhS2c8IYmEYtw2WB7ed88yK9Cr+9/xZLGxGHtPsPmBFBCOJtnDWKyjrqZZe8RG/11PGU9g==
X-Received: by 2002:a81:7384:0:b0:5c9:cb4c:35df with SMTP id o126-20020a817384000000b005c9cb4c35dfmr20454834ywc.37.1701271923058;
        Wed, 29 Nov 2023 07:32:03 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id b126-20020a0df284000000b005c5a08c5c15sm4612305ywf.136.2023.11.29.07.32.02
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 07:32:02 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5cd3c4457a0so67206817b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 07:32:02 -0800 (PST)
X-Received: by 2002:a81:9a97:0:b0:5d2:b29a:5e08 with SMTP id
 r145-20020a819a97000000b005d2b29a5e08mr1119149ywg.17.1701271922781; Wed, 29
 Nov 2023 07:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20231017104638.201260-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8t3sGn83vpgjECf5dw=bbz2yPXpnn+v2Dx2q3yJRPsKgA@mail.gmail.com>
In-Reply-To: <CA+V-a8t3sGn83vpgjECf5dw=bbz2yPXpnn+v2Dx2q3yJRPsKgA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 16:31:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMRj4quvO87LbLHCCLr14EK2AXsvr_muTDrBrA8+BMjg@mail.gmail.com>
Message-ID: <CAMuHMdXMRj4quvO87LbLHCCLr14EK2AXsvr_muTDrBrA8+BMjg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add missing port pins for RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_073206_986096_FA4D1215 
X-CRM114-Status: GOOD (  22.08  )
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

SGkgUHJhYmhha2FyLAoKT24gV2VkLCBOb3YgMjksIDIwMjMgYXQgMzo0NOKAr1BNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBPY3Qg
MTcsIDIwMjMgYXQgMTE6NDfigK9BTSBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwu
Y29tPiB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGludGVuZHMgdG8gaW5jb3Jwb3JhdGUg
dGhlIGFic2VudCBwb3J0IHBpbnMgUDE5IHRvIFAyOCwKPiA+IHdoaWNoIGFyZSBleGNsdXNpdmVs
eSBhdmFpbGFibGUgb24gdGhlIFJaL0ZpdmUgU29DLgo+ID4KPiA+IENoZWVycywKPiA+IFByYWJo
YWthcgo+ID4KPiA+IFJGQyAtPiB2MjoKPiA+ICogRml4ZWQgcmV2aWV3IGNvbW1lbnRzIHBvaW50
ZWQgYnkgR2VlcnQgJiBCaWp1Cj4gPgo+ID4gUkZDOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzIwMjMwNjMwMTIwNDMzLjQ5NTI5LTMtcHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tL1QvCj4gPgo+ID4gTGFkIFByYWJoYWthciAoMyk6Cj4gPiAgIHBpbmN0cmw6IHJl
bmVzYXM6IHJ6ZzJsOiBJbmNsdWRlIHBpbm1hcCBpbiBSWkcyTF9HUElPX1BPUlRfUEFDSygpCj4g
PiAgICAgbWFjcm8KPiA+ICAgcGluY3RybDogcmVuZXNhczogcGluY3RybC1yemcybDogQWRkIHRo
ZSBtaXNzaW5nIHBvcnQgcGlucyBQMTkgdG8gUDI4Cj4gPiAgIHJpc2N2OiBkdHM6IHJlbmVzYXM6
IHI5YTA3ZzA0M2Y6IFVwZGF0ZSBncGlvLXJhbmdlcyBwcm9wZXJ0eQo+ID4KPiA+ICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDdnMDQzZi5kdHNpIHwgICA0ICsKPiA+ICBkcml2ZXJz
L3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMgICAgIHwgMjYzICsrKysrKysrKysrKysr
KysrKy0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNDIgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRp
b25zKC0pCj4gPgo+IEdlbnRsZSBwaW5nLgoKQXMgdGhlIGtlcm5lbCB0ZXN0IHJvYm90IHJlcG9y
dGVkIGEgYnVpbGQgaXNzdWUgZm9yIFBBVENIIDEvMywgSSBoYWQKcmVtb3ZlZCB0aGlzIHNlcmll
cyBmcm9tIG15IHJldmlldyBxdWV1ZS4KRG8geW91IHN0aWxsIHdhbnQgbWUgdG8gcmV2aWV3IHYy
LCBvciBkbyB5b3Ugd2FudCB0byBzZW5kIGEgdjMgZmlyc3Q/CgpUaGFua3MhCgpHcntvZXRqZSxl
ZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVy
aG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51
eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9w
bGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJu
YWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
