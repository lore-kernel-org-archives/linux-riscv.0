Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB64C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruEj52fVRI9olsg6vzk4Ja8z/7SBKO9EOkaLAQQXeJw=; b=YfyqSKYw2FhGOL
	zs9s3349bsY4ReiWy4YS6Wkv/Xymu1lK+sOw0fGtgTCw6C63VlX/XMrmiuEapap5m5nlvJ8rwCLts
	zYWRviQWTGLZFhaH0RoyegQmqg78piMIM4xUjCVaux1Y6Yr/1kUzI3723PGeMmbTRU98ChLfn0+kq
	71Io2rUCiLX1W8SiONEvTiwVWzYAgJpHBCnk0sxR1a+8AWeYKxVf0sDvIoQskzo5Ggo2Nb/FMAkqi
	8y5wSft8/PLwpe9FjUoFUWM1w+QT1oaaY2cRU0myKc9TBZoYNlM67wwXYb02eHQUR521VVyfDoKAG
	nPy0JKbVamg3Qs9YBXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q80YX-00GSYm-08;
	Sat, 10 Jun 2023 15:31:09 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q80YS-00GSXO-2L;
	Sat, 10 Jun 2023 15:31:06 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977cf86aae5so419530966b.0;
        Sat, 10 Jun 2023 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686411060; x=1689003060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxPCqAAcwCfGdUZiMxaBjYAZU0A3wquYmcYNKNjhuUY=;
        b=VW/oFge+/+Orjlr3UpOgqadtUtBJ58tLJh7c0ptmvXHTALLI1Zz51N8TQSh9+aWdzL
         7VvgNo2iitsbJxxSrRsWx2ElXrUNQuqwp58AqaSWSR4MSb2p9jFQXMx61pVnLw9CzoxG
         +r0AdHepDGV1z/buMuMRwTLzgjk7Czyiwrfdwe7PF5abkrNROckIPIIXpr7LBt7cY1sp
         EGzLGx82Tf4t+lCcuIQJGM9ENkfSvd62acQeVjSUx6IeJnINgNEDTEQ/AnZoyEfE7ybl
         KA2+DI0SydJ5SmngpTSk2UYMStrAzFTfDFZ5jYHKRZcjhkat9scfDh6JIkCrSwnTMZ4g
         7YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686411060; x=1689003060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxPCqAAcwCfGdUZiMxaBjYAZU0A3wquYmcYNKNjhuUY=;
        b=Uzg6gd72NnUg7z/iOGATDeZK3eFNYYFUhvJEx3BldusRcE4De8jFJQKBON844ITRUZ
         XrSqWLRHSCWaiKgMx5QuBffDxZQR/+8HQ5zBkrtnESVdxoX4kmFz4awf5mppaENOH7hf
         sFyTxf61wAadeEBB5I0G3WmRK5jVRBn5V2iccU9n9U8O14dmoeb+jHXzCZ3EV3mnOrGU
         kRDpZkqzs7XFwEgq06uwQf3Oo4MbN+7+YotGZcgWm+5SDDIFbLOp77sM2EGBHf+vUTA3
         xBJ1cbpmaILvbRJtGcmBdivStrIj23V7qJxcBLcDyO4yB15Vdvw0ICBSy196lNPqwmAD
         M4wg==
X-Gm-Message-State: AC+VfDz4Ez04UhXDFN9eAv4D7FOKbSLMLGZkFyamG1vhBlQOoTA36bZ2
	4mmzVAdrxbEpmcxAwmz9r2wgvJaqTEEtOCMiWGo=
X-Google-Smtp-Source: ACHHUZ5ze2gv8QfGmKLPkmbnKeZqHcnYPyn27zxIIkW9XeukUemNkvD0q1gl/Wy1GyoPAlHRwGYvRgduuF0eBtVKhis=
X-Received: by 2002:a17:907:c15:b0:97b:4c8f:c44f with SMTP id
 ga21-20020a1709070c1500b0097b4c8fc44fmr3530103ejc.46.1686411059681; Sat, 10
 Jun 2023 08:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230610141739.999268-1-bigunclemax@gmail.com>
 <20230610141739.999268-4-bigunclemax@gmail.com> <20230610-rehire-amid-2517f43504c0@spud>
In-Reply-To: <20230610-rehire-amid-2517f43504c0@spud>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sat, 10 Jun 2023 18:30:48 +0300
Message-ID: <CALHCpMiEmc8L=O86_x7-KkBHFwf2QpuP0M7ugz7dNPr71cpJmQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] dt-bindings: thermal: sun8i: Add binding for
 D1/T113s THS controller
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_083104_770441_2BE0176D 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

0YHQsSwgMTAg0LjRjtC9LiAyMDIz4oCv0LMuINCyIDE3OjUyLCBDb25vciBEb29sZXkgPGNvbm9y
QGtlcm5lbC5vcmc+OgoKLi4uCgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF4aW0gS2lzZWxldiA8Ymln
dW5jbGVtYXhAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1ha3NpbSBLaXNlbGV2IDxiaWd1
bmNsZW1heEBnbWFpbC5jb20+Cj4KPj4gV2h5IGRvIHlvdSBoYXZlIDIgc2lnbi1vZmZzIHRoYXQg
YXJlIGJvdGggeW91IHcvIGRpZmZlcmVudCBzcGVsbGluZ3M/CgpTb3JyeSBmb3IgdGhhdC4gSSBh
Y2NpZGVudGFsbHkgc2lnbmVkIGl0IHR3aWNlLgoKLi4uCgo+ICsgIC0gfAo+ICsgICAgdGhlcm1h
bC1zZW5zb3JAMjAwOTQwMCB7Cj4gKyAgICAgICAgICBjb21wYXRpYmxlID0gImFsbHdpbm5lcixz
dW4yMGktZDEtdGhzIjsKPiArICAgICAgICAgIHJlZyA9IDwweDAyMDA5NDAwIDB4NDAwPjsKPiAr
ICAgICAgICAgIGludGVycnVwdHMgPSA8MCA5MCAwPjsKPiArICAgICAgICAgIGNsb2NrcyA9IDwm
Y2N1IDA+Owo+ICsgICAgICAgICAgY2xvY2stbmFtZXMgPSAiYnVzIjsKPiArICAgICAgICAgIHJl
c2V0cyA9IDwmY2N1IDI+Owo+ICsgICAgICAgICAgbnZtZW0tY2VsbHMgPSA8JnRoc19jYWxpYnJh
dGlvbj47Cj4gKyAgICAgICAgICBudm1lbS1jZWxsLW5hbWVzID0gImNhbGlicmF0aW9uIjsKPiAr
ICAgICAgICAgICN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwwPjsKPgo+PiBJcyB0aGlzIGNhbGli
cmF0aW9uIHJlcXVpcmVkLCBvciBvcHRpb25hbCwgZm9yIHRoZSBkMT8KCkNhbGlicmF0aW9uIGRh
dGEgZm9yIHRoZSBEMSBpcyBvcHRpb25hbCBhcyBmb3IgdGhlIEg2LgooQnV0IHdpdGhvdXQgaXQs
IHRoZSBzZW5zb3IgZGF0YSB3aWxsIGJlIGluYWNjdXJhdGUpLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
