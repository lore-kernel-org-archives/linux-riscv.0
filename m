Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23DFC77B72
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 19:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Se5xnBtMpe1/OEzkCnlk/ua0NLNZqepPBXFeMMGPus=; b=mDbwVZovQkvtit
	RAzbwZqenvA3+MtH5AkkT318YtBTKjjiHexm5dZsTcd250XMGJpXsR0j4SWAnzsl5aZnoplZKtEGo
	KfhFkw/S3fsSwdEE/MMk1iN9wfuYPfmEtokQOrJn86blCQOwj87byvNOzqJrrxolhMVD1NKRWOZC7
	WK78hd56c8OKGYaZe6WdZGg2Muj46HT8oWaBuVqxsWkYfkwDaq3vEFeLW5QwxBGVwL4QSZnqReTM3
	GgYZFN8Xz4fV/s/3hBi8daIhwKw5sGYlSWeVkmZhr4gu9O/KBcdPw+q7r60PJ4qsGjA2X5vTt/zZp
	Mi9/CFBY7w1dTQKanrkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnOec-00APrw-15;
	Fri, 14 Apr 2023 19:00:14 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnOeV-00APnh-2D
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 19:00:09 +0000
Received: by mail-io1-xd36.google.com with SMTP id bw15so2020246iob.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 12:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681498804; x=1684090804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWR09PnwXA83YCTdrYoULV0/Df8/NB3IaqlxX19sB5E=;
        b=sS9TNcxHWLjDdEZTybGm8OXLbHVx4dLpkhAHGEU00ZQQv4wuc8sm7L9HUctfE3wcIw
         LjkFzJmhjiqwr2tqQpSbDZpDkVK1kGk7LRKUhmU1deWP6w0z1UEN80Ssj0v9B4E2l7n1
         MMz4S0zQoXw+Z4rQan8za66ztL7n/GI8bfDPFominYq9g70Nru3tO7F76iJKef3BYzAl
         K7pVDgr0XyGKQ+dEhv9ZtXYOLOHdQvdW//SQmMOCH3J7Q+gLQM9JkWBzvn5aGsmrC8ze
         jjDPNguPhnKDRDNmfzf2xQPjyp6b5bTg8XWl4ZRxD5QeCKfJ0+lEPfktogDg1Y6y1J3Q
         3bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681498804; x=1684090804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWR09PnwXA83YCTdrYoULV0/Df8/NB3IaqlxX19sB5E=;
        b=YVG3uXQ/MvSikpg2yNbZojQY0zf7eH1bPp6tk9yXktXwwYvRImjapHTtFogYgSem8i
         YV5eJm9IRG12nxyL+iqMXsjLyJSxuLOEIuLGOgNO0njkv9oCwjrkvAP/fufMyXdi/Y8D
         3R7war8MXbZqt8jLFFeMCHy5UZJ7ctXOdYDw9xw1bosy3u270q5c6Dd9y3toyAVWnH57
         ym7p/t/U88BQodXLVCaN/ybFHbnUDkG/iop/LCDoF/ccc4grd6+aB643mdLnqTt2DzmI
         p0ZIVTAiy7xGIEzB6Eu1dOql2gX4tLnH3RJL4QDZskDkfgpwDaSh5l86V2Z4YI8q3QEe
         PpYg==
X-Gm-Message-State: AAQBX9fSBSUbrl6zG8YDkBplCos0z/spLvuaTdUKjkH5u4OjiDXHxrle
	gSvnj330KmRani/mfvneCTb62nUgDwLqNOsCHvM=
X-Google-Smtp-Source: AKy350bBMFShfeoZZt2QjaqsfgTvtxSX9IZEiShxzW3qpTYXC1IhCI0f2JRNozkCVFDD/ZX6hBW/RRG4mX1gkr4y3LM=
X-Received: by 2002:a02:628f:0:b0:3a7:e46e:ab64 with SMTP id
 d137-20020a02628f000000b003a7e46eab64mr2919644jac.1.1681498803871; Fri, 14
 Apr 2023 12:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412110900.69738-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230412-cheddar-prune-5ce03ccf5581@spud> <20230413-aorta-unheated-c9bb35411fb2@wendy>
 <CA+V-a8uksWMihUadYc_dCoef7vaC5ncOicX0oGpSP9HRnHgScw@mail.gmail.com>
 <20230413-staunch-superman-e71fd3303176@spud> <CA+V-a8sGsbz5snMzc7JqFVktafzvEJTq3RNH+ndNBV6Fxj5bbQ@mail.gmail.com>
In-Reply-To: <CA+V-a8sGsbz5snMzc7JqFVktafzvEJTq3RNH+ndNBV6Fxj5bbQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 14 Apr 2023 19:59:37 +0100
Message-ID: <CA+V-a8vV0rnOo6bLmegu5gAqA3-jfOn6hknG12jAtYXce0haLQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
To: Conor Dooley <conor@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_120007_750233_268EDC66 
X-CRM114-Status: GOOD (  16.59  )
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

T24gVGh1LCBBcHIgMTMsIDIwMjMgYXQgMTA6MDbigK9QTSBMYWQsIFByYWJoYWthcgo8cHJhYmhh
a2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMTMsIDIwMjMgYXQg
Nzo0NuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4g
PiBJcwo+ID4gPiBkbWEtbm9uY29oZXJlbnQuYyBhbHNvIHZhbGlkIGZvciBSSVNDVi0zMj8gSWYg
bm90IHRoZW4gd2UgY2FuIG1ha2UKPiA+ID4gcG1lbS5jIGNvbXBpbGUgY29uZGl0aW9uYWxseSBp
ZiBETUEgbm9uLWNvaGVyZW5ldCBpcyBlbmFibGVkIGFuZCB3ZQo+ID4gPiBtYWtlIERNQSBub24t
Y29oZXJlbnQgZGVwZW5kIG9uIDY0Yml0Lgo+ID4KPiA+IENvdWxkIHlvdSBkcm9wIHRoZSB7cyxs
fWQgaW4gZXhjaGFuZ2UgZm9yIHtzLGx9dyBpbnN0ZWFkLCBvciBhbSBJCj4gPiBwcm9ncmVzc2lu
ZyBldmVuIGZ1cnRoZXIgaW50byBicmFpbm8gdGVycml0b3J5Pwo+IEp1c3QgdGhlIGRpcmVjdCBl
eGNoYW5nZSB3b250IHdvcmsgaW4gYWRkaXRpb24gc2hpZnRpbmcgKyBvcmluZyB0bwo+IHRha2Ug
Y2FyZSBvZiA2NC1iaXQgd2lsbCByZXF1aXJlLiAoQ29ycmVjdCBtZSBpZiBJJ20gd3JvbmcgaGVy
ZSkKPgo+IEkgd2FzIHdvbmRlcmluZyBub3cgaWYgd2UgbmVlZCB0byBzdG9yZS9yZXN0b3JlIHRo
ZSBzMCBhbmQgcmEKPiByZWdpc3RlcnMuIEkgc3R1bWJsZWQgb24gYW4gWDg2IGltcGxlbWVudGF0
aW9uIHdoaWNoIGhhcyBjYWxsIFswXSBpbgo+IHRoZSBBTFRFUk5BVElWRV9YKCkgbWFjcm8gYnV0
IGhlcmUgd2UgZG9udCBzdG9yZS9yZXN0b3JlIHRoZQo+IHJlZ2lzdGVycy4gSXMgdGhlIFJJU0Mt
ViBpbXBsZW1lbnRhdGlvbiBvZiBBTFQgbWFjcm8gZGlmZmVyZW50Cj4gY29tcGFyZWQgdG8geDg2
Pwo+CkkgZGlkIHRyeSBhIGNhbGwgd2l0aG91dCBzdHJvZS9yZXN0b3JlIG9mIHMwIGFuZCByYSBy
ZWdpc3RlcnMgYW5kIHRoYXQKZGlkbid0IHdvcmshLiBTbyBJIGhhdmUgcmUtd3JpdHRlbiB0aGUg
YXNzZW1ibHkgY29kZSB3aGljaCBtYWtlcwozMi1iaXQgUklTQy1WIGNvbXBpbGVycyBoYXBweS4g
T25jZSBkb25lIHdpdGggdGhlIHRlc3RpbmcgSSdsbCBzZW5kIGEKbmV3IHZlcnNpb24gb2YgdGhp
cyBzZXJpZXMuIEhvcGVmdWxseSB0aGUgbGFzdCA7KQoKQ2hlZXJzLApQcmFiaGFrYXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
