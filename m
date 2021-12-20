Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931D0C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 12:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1tIJ9spsJp+y0e32SdGWSBbLaNlvPqZg9MuxP4efKbk=; b=DpQohFawwFJLlDzPJpwskonOKe
	AgQq+Us00k/2e6/GNuz3bjUxcbQUKdgysFXolVywJw4+CIuZWJX2MRuabNbFoEuQvumYVIVHz6G5m
	rgR6DH78KzRQpMD6fg+Agb2u52uy6jJpOdWR4DZbQK52YnJJYueTpaaNs6B/JaBnd5z3OuyanvalQ
	CP/U4rUt/07bCTRM8S8+gsKw2dsiZo/1fICOvJyxHZcwnPRPnXy6uauIwFIMY3VcG6VbcQKhPLx0b
	6rSKfpqf4xKZvV9FMOCEfrNqdykxZYcFSq2QkdRq8qPc5eVhL1OSKruUm/Y2mb3F4cM8MAskPyhIY
	5Ed3mTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzHgl-002FoB-Gv; Mon, 20 Dec 2021 12:22:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzHgh-002Fjx-US
 for linux-riscv@lists.infradead.org; Mon, 20 Dec 2021 12:22:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id i12so6738628wmq.4
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 04:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TSCuxY5wqMw0R+REWpFrewafdOovZ1sGHeMcm+IFJO8=;
 b=LW1kmrl01uNavpeUR+eQGG79Lhg+30st2BcLbsxDBjDezq5+dvLIkE0dW6y6YSHbFg
 evIVqfSTj9XOXN6oRFpoVGG8nvmjXUfZ0pVOmgYqNRc2EuYLCnbhQFXR3IAeb7ea1mCQ
 XVxs0nWfyF7vylGFUP7vfrCs39PmyC8o6RVRKLzVUh/fHhpBPqLHRkGc03tLJkkEnw3F
 lAxstS5F+E6tRFtRQuO+YPf+UT1M+BH7HM5W/m3YidHsLg4+gIjIBZTy7ddpUH+/RcBn
 cJYvrAGpYvvLysHrOqAlAEZ+/o55Maqnxq4vxDZrX+PxponvFtKqFk4fUS1FIiiDMu+9
 oZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TSCuxY5wqMw0R+REWpFrewafdOovZ1sGHeMcm+IFJO8=;
 b=sfiuJtT69AqcqsgkhPrmNUA202hoOvep2FPPOzp2yHhVPhkBnO/h2CTJxcQhmYd/WI
 046Fx0xMG8xscsyrqg1tIQ/5Fzf94qb9bZz8LfFiIyDraUUBkcBhr3PGjjPW1ytAtlkC
 Uhah35Qhnuu6SjKdHWq+84Xc6JsaZzjXn2k3mlcMAeY+ZjUPkZzPN1ugd1f1ZpsRjn7P
 tahGdaYGn7BWeh7RJ4YuTxAf465STDNnPDIJqhYPT7qr8+JhaPcX05o/iZ8FRJ2FL2N3
 mX1XZJByoi6Q0E7PAaCl30SvbeUXAWZU7n7etQMW14f/aAgrD8DbIb2BkukaF+hcftlg
 LkvA==
X-Gm-Message-State: AOAM532+B5NezStRmgwo+eenAScGqcpzuU50tJM7qpYcFqkKXXhqYzsI
 cOnBxQQShmsveEMdCBAq0bN0QWQc0XB9kA==
X-Google-Smtp-Source: ABdhPJwUebx4frNTkSpn3y/kryQAmzKe+4PoR1IZphY1WuZESeVcxGZ8e0fuyeiupuhBiP8RI2yZVQ==
X-Received: by 2002:a05:600c:219a:: with SMTP id
 e26mr13754698wme.136.1640002957948; 
 Mon, 20 Dec 2021 04:22:37 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:ac6:da31:b84c:183?
 ([2a01:e34:ed2f:f020:ac6:da31:b84c:183])
 by smtp.googlemail.com with ESMTPSA id j14sm15234410wrn.88.2021.12.20.04.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 04:22:37 -0800 (PST)
Subject: Re: [PATCH v2 0/2] dt-bindings: timer: sifive,clint: Miscellaneous
 improvements
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <cover.1639662093.git.geert@linux-m68k.org>
 <88170fb7-f348-1227-cf8c-863306986917@linaro.org>
Message-ID: <7269ab52-f80b-001a-abf4-cc4744747450@linaro.org>
Date: Mon, 20 Dec 2021 13:22:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <88170fb7-f348-1227-cf8c-863306986917@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_042244_033255_5D566AE5 
X-CRM114-Status: GOOD (  13.85  )
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

T24gMjAvMTIvMjAyMSAxMzoyMCwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4gT24gMTYvMTIvMjAy
MSAxNDo0MywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+PiAJSGkgYWxsLAo+Pgo+PiBUaGlz
IHBhdGNoIHNlcmllcyBjb250YWlucyB0d28gaW1wcm92ZW1lbnRzIGZvciB0aGUgU2lGaXZlIFBM
SUMgRFQKPj4gYmluZGluZ3MuCj4+Cj4+IENoYW5nZXMgY29tcGFyZWQgdG8gdjFbMV06Cj4+ICAg
LSBTcGxpdCBpbiB0d28gcGF0Y2hlcywKPj4gICAtIEltcHJvdmUgcGF0Y2ggZGVzY3JpcHRpb24g
YW5kIGRvY3VtZW50IGxpbWl0IHJhdGlvbmFsZS4KPj4KPj4gVGhhbmtzIQo+Pgo+PiBbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMTEyNTE1MjMxNy4xNjI5NTgtMS1nZWVydEBsaW51
eC1tNjhrLm9yZwo+Pgo+PiBHZWVydCBVeXR0ZXJob2V2ZW4gKDIpOgo+PiAgIGR0LWJpbmRpbmdz
OiB0aW1lcjogc2lmaXZlLGNsaW50OiBGaXggbnVtYmVyIG9mIGludGVycnVwdHMKPj4gICBkdC1i
aW5kaW5nczogdGltZXI6IHNpZml2ZSxjbGludDogR3JvdXAgaW50ZXJydXB0IHR1cGxlcwo+Pgo+
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwgICAgICAg
ICAgfCA5ICsrKysrLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPiAKPiBQbGVhc2UgcmVzZW5kIHRoZSB0aW1lciBiaW5kaW5ncyBjaGFuZ2Vz
LCB0aGUgR1BVIGFuZCBOQU5EIGNvbnRyb2xsZXIKPiBzZXJpZXMgYXJlIGNvbmZ1c2luZyB0aGUg
YjQgdG9vbHMKCk5ldmVyIG1pbmQsIEkganVzdCBub3RpY2VkIHRoZSBWMyA7KQoKCi0tIAo8aHR0
cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3Bh
Z2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4g
VHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
