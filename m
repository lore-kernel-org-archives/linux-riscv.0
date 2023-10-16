Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266F8CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 07:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUVnOWbfyn/iGFIxKseh0BzBn1oW4VrjuAcppKRoDpY=; b=M/xgkHCk28lGHz
	UbYzHP95dWYqLVh70b0adaUJJk+ivGLig/5JQB0cET8b/gmiS9+AzxQetCyWlZn/K3VTb4tnCpgi3
	UstXwCpb2iID1MneXFlYUWNU/e/36GaiclwwQM6i5PuYS5xvp1rdLclS+J9FhwYnSOV7v5CU0vRgm
	gwo2n+HXP1634CRmdppEyY2ZeQYS/JCYiYR1vuvQo2WhmWeoSAoXUZI5T7RB6LUHVD96OM8oO7OzV
	3ZSbiu+8gY0qd5Pc0o2tEQ8MVJZoqAqYP653NURfxvCy/pQPtX4Hz9VPhwNWP+qjq62My6Cp+SxZe
	rqCB6inOz75JgGKG3DTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHx0-008dfU-1y;
	Mon, 16 Oct 2023 07:23:42 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsHww-008de8-2w
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 07:23:40 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7cc03dee5so51681647b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 00:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441016; x=1698045816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxKu2BfOe9aY6IVd/hySwpz3FIXqdj+qJLdSdMka9oc=;
        b=NbWDkgGDf8kjdmDNVdELyaIup8+sVZgZ1xM0zNPMYL9A/Df5AKIqfXY5athjJuyIKt
         qUexoAD3DFIZpVynBfG9Wl8ixyqfjkdT7PokXByYFcT1kKs6+J5vUv1h1ViQXXOPssiS
         LOta9wl64QfHLMbdkhXUZQgBzBk9WiSCZIF0cRmxtuTi+BylPQiuk/F7FJ1IZmvpzhQ6
         dqxj2YYFC887Y/H+XFDBwRqnRDz95XMIgrCYZOSql7qpLRcUx2Q4L9rJjm/7+WzZQvOn
         n2rMkRLhQjepZQTDNwLmGG2ImCiLUZqngeMsVFVeCwuzi4tCvMBFfFfVhayD7LsVd6CN
         TVNw==
X-Gm-Message-State: AOJu0YxJLMsV8G+dFQeqw/Kt9bz4vQV/+HyjFzkBjTUumJLzz20dL1QC
	gsYia4SONCwMk/SRFII5E14bHqV4wS2lgg==
X-Google-Smtp-Source: AGHT+IHo9FzHy521OOLE/FaqHv/H/6K9y267NMetGoqVS1tkmjjPdzYgoXCwE94H1yJS+0TbF71CcQ==
X-Received: by 2002:a0d:c8c2:0:b0:586:a689:d28a with SMTP id k185-20020a0dc8c2000000b00586a689d28amr33859137ywd.34.1697441016184;
        Mon, 16 Oct 2023 00:23:36 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id h83-20020a815356000000b005a82f14b8dbsm1998385ywb.49.2023.10.16.00.23.35
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 00:23:35 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a7eef0b931so51987557b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 00:23:35 -0700 (PDT)
X-Received: by 2002:a25:d0d6:0:b0:d9a:54d2:3af3 with SMTP id
 h205-20020a25d0d6000000b00d9a54d23af3mr18123368ybg.51.1697441015007; Mon, 16
 Oct 2023 00:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231009-approve-verbalize-ce9324858e76@wendy> <20231015-qualifier-campus-97bf09059d51@spud>
In-Reply-To: <20231015-qualifier-campus-97bf09059d51@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Oct 2023 09:23:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
Message-ID: <CAMuHMdUTiod7o9+DG70sNWr=GGFwBeCagj=OrRp0Dn_jPDbakw@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 0/6] riscv,isa-extensions additions
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_002338_951108_BDF4E7A3 
X-CRM114-Status: GOOD (  20.82  )
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

SGkgQ29ub3IsCgpPbiBTdW4sIE9jdCAxNSwgMjAyMyBhdCAyOjIy4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+Cj4gT24gTW9uLCAwOSBPY3QgMjAyMyAxMDozNzo0NCArMDEw
MCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gTm93IHdpdGggdGhlIFJGQyB0YWcgZHJvcHBlZC4g
VGhlcmUgYXJlIG5vIGNoYW5nZXMgaGVyZSBmcm9tICJSRkMgdjIiLAo+ID4gb3RoZXIgdGhhbiB0
aGUgYWRkaXRpb24gb2YgdGFncyB0aGF0IHdlcmUgcHJvdmlkZWQgYWxvbmcgdGhlIHdheS4gSSBo
YXZlCj4gPiBub3QgYWRkZWQgIlpmaCIgdG8gdGhlIFQtSGVhZCBiYXNlZCBzdHVmZiwgYXMgSSBj
YW4ndCBhY3R1YWxseSByZWFkIHRoZQo+ID4gZG9jdW1lbnRhdGlvbiB0aGF0IHdvdWxkIHNob3cg
dGhhdCB0aGV5J3JlIGVuY29kaW5nLWZvci1lbmNvZGluZwo+ID4gY29tcGF0aWJsZSB3aXRoIHRo
ZSBzdGFuZGFyZCBleHRlbnNpb24sIHNpbmNlIGl0IGlzIGFwcGFyZW50bHkgb25seSBpbgo+ID4g
Q2hpbmVzZS4KPiA+Cj4gPiBbLi4uXQo+Cj4gVGhlIGZpcnN0IDMgYXBwbGllZCB0byByaXNjdi1k
dC1mb3ItbmV4dCwgSSBleHBlY3QgdGhlIHJlc3QgdG8gZ28gdmlhCj4gdGhlaXIgcmVzcGVjdGl2
ZSBwbGF0Zm9ybSBtYWludGFpbmVycy4KCkkgc2VudCBteSBsYXN0IHNvYyBQUiBmb3IgdjYuNyBs
YXN0IEZyaWRheSwgYXMgcGVyIHRoZSBzb2MgZGVhZGxpbmUuCkZlZWwgZnJlZSB0byB0YWtlICJb
UEFUQ0ggdjMgNC82XSByaXNjdjogZHRzOiByZW5lc2FzOiBjb252ZXJ0IGlzYQpkZXRlY3Rpb24g
dG8gbmV3IHByb3BlcnRpZXMiIGludG8geW91ciB0cmVlIGZvciB2NiwgaWYgdGhhdCBpcyBzdGls
bApwb3NzaWJsZSAoSSBoYXZlIGp1c3QgcHJvdmlkZWQgbXkgQWNrZWQtYnkpLiBPdGhlcndpc2Us
IEkgY2FuIHF1ZXVlCml0IGluIHJlbmVzYXMtZGV2ZWwgZm9yIHY2LjguCgpUaGFua3MhCgpHcntv
ZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQg
VXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVy
dEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRo
YXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
