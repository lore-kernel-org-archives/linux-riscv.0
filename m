Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB2CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 19:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0hb/JvZNd9KnNyjzECXiSLEr+O0/BtmR+FjodoY3Qo=; b=aJn2Sh1s9i6CXN
	7EYFyCEhdGtJjpkrv2lnKvG69XhlbpRSjqcqclBE487yztvPQwY67NgB0dQm6vwBk5avnllSrKmr5
	XKjloF6i/wdVKQmrb3+/ciEcHoYmgWFIVU8C3EUB1kZC6AzM4gyOvYtQ+RlnyYWXp6oimt6nYwYrS
	JqxFsggAXhFhqHIkK1V+JMHu+GaQmJGZFe/kNTIPdQqdc6NC3m6bUgoota+kShGZ6QRp3thYRrFhp
	Ll3iRuItEMSACEWjsz4rKYUb70JgJr1I513iwPduaObgswMhESbMDRW20QajnYfav9p4zudVamRZ1
	BFupWqAjRewWoAgbEZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG27w-000k7L-2s;
	Wed, 20 Dec 2023 19:21:08 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG27t-000k6v-1p
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 19:21:07 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dbd532e6e8aso6708276.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 11:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703100062; x=1703704862; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps3P/pvG74IGGnT8GqUmphrkn8oo7nKEcsYAKREB89c=;
        b=IuDTdEKH8It2kAEUHAfuO8KexFCNYYLuNCNfWhRSl11KPTyLI0UBX5O1ezQASF9o1e
         r3tiuPjXvwu+apeazZV83axo4K0dSYGSrwFJHy99eIKgGuwhTrb+3GVKV6kWlTOxKkEf
         Odn83xoZ8pK4/rAfxUSRlXnD0mBhi72bxd/3W8v2RzZFmPhBt6qA9vqCpPewwqLl5gwj
         MXzIbaV8grPG7QS3Jslj+3tb7LHE7/cyEp/MU8MwNsBaiECQhdk78Y1Fb9AzicIt8gal
         jy5oTv7jLIHBvpuhCtLF30lYPqTNtL9FITbaWNFn+ALRZX53x0Q5KE+b18K3fOWSux06
         nm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703100062; x=1703704862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ps3P/pvG74IGGnT8GqUmphrkn8oo7nKEcsYAKREB89c=;
        b=NmCV0ZwSEXXySaB82qk630TbdG5gPisRvf/iVFaNagzvz7gHqldMnWWSLSI6c2Imwj
         SWRvKc/IBhswSRrRpTEeP4GphSxxWCu3muyQAhnRNA3rhKyCkiODMYojkXCheg88uWpf
         OMC+04wk6muatJ6UVQFoIqzzefZ+zsZPPuI+jDkn/1l0cJRmtHPPe79Za0ppk0vHvgVQ
         1/FWfPJXLw3GA4fDDkicmnp9wq5QGuXjamU6OAgIU6Wcis9PwuK6Ma5CLDMzGZy0XYwK
         EIIDMQ9650Mvw3kCfgMOyDC+yBjDCMSrg6V+mEExiCCmHV18/rJbIpR9qOMvdY006b5z
         FhkA==
X-Gm-Message-State: AOJu0YwRQRIoWC134hYonXROx07T7L9askCJmgNZnzgqf7kHV4/mZDIw
	N9f4Xw04V1daA/ZRmVzJs1pLsV5eHpBAgSztVupC+g==
X-Google-Smtp-Source: AGHT+IE0/lC2Cx520RUvUKQoxpsf0wmqJ8BQXaOwxQm86Cv5E07vosKnSijGbt5II7X94Q8Sms9uxQ9pRCNxE/GNr9k=
X-Received: by 2002:a25:1c1:0:b0:dbd:b165:43d with SMTP id 184-20020a2501c1000000b00dbdb165043dmr247285ybb.18.1703100062573;
 Wed, 20 Dec 2023 11:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com> <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
In-Reply-To: <20231215143906.3651122-2-emil.renner.berthing@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Dec 2023 20:20:51 +0100
Message-ID: <CACRpkdZf09uKr+ka0_rsw5kHMjjQbaGypn2fx2-QobLFBKYrtQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_112105_675360_08A45B5D 
X-CRM114-Status: GOOD (  15.38  )
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

SGkgRW1pbCwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIEZyaSwgRGVjIDE1LCAyMDIzIGF0
IDM6MznigK9QTSBFbWlsIFJlbm5lciBCZXJ0aGluZwo8ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fu
b25pY2FsLmNvbT4gd3JvdGU6Cgo+ICsgIFRoZSBUSDE1MjAgaGFzIDMgZ3JvdXBzIG9mIHBhZHMg
ZWFjaCBjb250cm9sbGVkIGZyb20gZGlmZmVyZW50IG1lbW9yeSByYW5nZXMuCj4gKyAgQ29uZnVz
aW5nbHkgdGhlIG1lbW9yeSByYW5nZXMgYXJlIG5hbWVkCj4gKyAgICBQQURDVFJMX0FPU1lTICAt
PiBQQUQgR3JvdXAgMQo+ICsgICAgUEFEQ1RSTDFfQVBTWVMgLT4gUEFEIEdyb3VwIDIKPiArICAg
IFBBRENUUkwwX0FQU1lTIC0+IFBBRCBHcm91cCAzCgpSZWFsbHksIGV2ZW4gaW4gdGhlIGRvY3Vt
ZW50YXRpb24/IElmIHlvdSBsb29rIGF0IHRoZSBsYXlvdXQgb24gdGhlIGFjdHVhbApjaGlwLCBk
b2VzIGEgcGF0dGVybiBlbWVyZ2U/CgpJIHRoaW5rIHNvbWUgdXNlIHRoZSBub3J0aC9zb3V0aC9l
YXN0L3dlc3QgYXMgZ3JvdXAgbmFtZXMgd2l0aCB0aGUgQkdBCmNoaXAgZmFjaW5nIHVwIHdpdGgg
dGhlIHBhY2thZ2UgdGV4dCBjb3JyZWN0bHkgcmVhZGFibGUgdGhlbiBpdCBpcyBhIGJpdApsaWtl
IGEgbWFwLgoKPiArICAgICAgICAgIGZ1bmN0aW9uOgo+ICsgICAgICAgICAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcKPiArICAgICAgICAgICAgZW51bTog
WyAiMCIsICIxIiwgIjIiLCAiMyIsICI0IiwgIjUiIF0KPiArICAgICAgICAgICAgZGVzY3JpcHRp
b246IFRoZSBtdXggZnVuY3Rpb24gdG8gc2VsZWN0IGZvciB0aGUgZ2l2ZW4gcGlucy4KClNvIHdo
eSBpcyB0aGUgb3BhcXVlIG5hbWVzICIwIiwgIjEiIGV0YyB1c2VkLCBhbmQgdGhleSB3aWxsIGJl
IHRoZSBzYW1lIGZvcgphbGwgcGlucyBJIGJldC4gTW9zdCBkcml2ZXJzIHVzZSBhIHN0cmluZyBp
ZGVudGlmeWluZyB0aGUgYWN0dWFsIGZ1bmN0aW9uIGhlcmUuClN1Y2ggYXMgImkyYyIsICJncGlv
IiwgZXRjLgoKTmFtZXMgdGhhdCBhcmUganVzdCBmaWd1cmVzIGFyZSAqaW1wb3NzaWJsZSogdG8g
dW5kZXJzdGFuZCB3aXRob3V0IGFjY2Vzcwp0byBhIGRhdGFzaGVldC4KClRoZSBwb2ludCBvZiBk
ZXZpY2UgdHJlZXMgc291cmNlcyBhcmUgdG8gYmUgaHVtYW4gcmVhZGFibGUsIHN0cmluZ3Mgb2YK
bWFnaWMgbnVtYmVycyBhcmUgbm90IGh1bWFuIHJlYWRhYmxlIGF0IGFsbC4KCj4gKyAgICAgICAg
ICBiaWFzLWRpc2FibGU6IHRydWUKPiArCj4gKyAgICAgICAgICBiaWFzLXB1bGwtdXA6Cj4gKyAg
ICAgICAgICAgIHR5cGU6IGJvb2xlYW4KPiArCj4gKyAgICAgICAgICBiaWFzLXB1bGwtZG93bjoK
PiArICAgICAgICAgICAgdHlwZTogYm9vbGVhbgo+ICsKPiArICAgICAgICAgIGRyaXZlLXN0cmVu
Z3RoOgo+ICsgICAgICAgICAgICBlbnVtOiBbIDEsIDIsIDMsIDUsIDcsIDgsIDEwLCAxMiwgMTMs
IDE1LCAxNiwgMTgsIDIwLCAyMSwgMjMsIDI1IF0KCm1pbGxpYW1wZXJlcz8gVGhlbiB1c2UgZHJp
dmUtc3RyZW5ndGgtbWljcm9hbXAuCgpJZiBub3QsIGV4cGxhaW4gd2hhdCBlYWNoIHNldHRpbmcg
bWVhbnMsIGkuZS4gdGhlIG51bWJlciBvZiBtYXggbWljcm9hbXBzLgoKQXQgd2hpY2ggcG9pbnQg
dXNpbmcgZHJpdmUtc3RyZW5ndGgtbWljcm9hbXAgYW5kIGEgdHJhbnNsYXRpb24gdGFibGUgaW4g
dGhlCmRyaXZlciBtYXkgYmUgYSBiZXR0ZXIgaWRlYS4KClRoZSBvbmx5IHJlYXNvbiB0byB1c2Ug
b3BhcXVlIG51bWJlcnMgaXMgaWYgMSwgMiAoZXRjKSBtZWFuIHNvbWV0aGluZyBsaWtlCiJudW1i
ZXIgb2YgZHJpdmVyIHN0YWdlcyIgd2l0aCBhIGN1cnJlbnQgb3V0cHV0IHRoYXQgdmFyaWVzIHdp
dGggdGVjaG5vbG9neS4KCj4gKyAgICAgICAgICB0aGVhZCxzdHJvbmctcHVsbC11cDoKPiArICAg
ICAgICAgICAgb25lT2Y6Cj4gKyAgICAgICAgICAgICAgLSB0eXBlOiBib29sZWFuCj4gKyAgICAg
ICAgICAgICAgLSAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIK
PiArICAgICAgICAgICAgICAgIGVudW06IFsgMCwgMjEwMCBdCj4gKyAgICAgICAgICAgIGRlc2Ny
aXB0aW9uOiBFbmFibGUgb3IgZGlzYWJsZSBzdHJvbmcgMi4xa09obSBwdWxsLXVwLgoKSnVzdCB1
c2UgYmlhcy1wdWxsLXVwIHdpdGggYW4gYXJndW1lbnQuCgpiaWFzLXB1bGwtdXAgPSA8MjEwMDAw
MD47CgpObyBhcmd1bWVudCB3b3VsZCBiZSB0aGUgZGVmYXVsdCBzZXR0aW5nLgoKTm8gbmVlZCBm
b3IgY3VzdG9tIGJpbmRpbmdzLgoKPiArICAgICAgICB1YXJ0MF9waW5zOiB1YXJ0MC0wIHsKPiAr
ICAgICAgICAgICAgdHgtcGlucyB7Cj4gKyAgICAgICAgICAgICAgICBwaW5zID0gIlVBUlQwX1RY
RCI7CgpQaW5zIGhhdmUgcmVhc29uYWJsZSBuYW1lcywgYnV0Li4uCgo+ICsgICAgICAgICAgICAg
ICAgZnVuY3Rpb24gPSAiMCI7CgpXaGF0IGFib3V0IGZ1bmN0aW9uID0gInVhcnRfMCIgaG1tbT8K
CllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
