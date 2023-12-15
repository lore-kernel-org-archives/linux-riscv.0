Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B674C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSoIgwMDblGgYdfwBTfmHJV4dl0kIrEYEo6AG1DsWNs=; b=U8a8f7Wp2wtpWL
	2TxqcvDnLEskeB8V9vdkHNPAZsdRnidM6UQbTBlXXU/EEybVo+s1ZJIGM9IeFTShZYrMdKQZ7Lq/x
	fgQPzwHlBqxytwDHbwYwM/pX6xUALIO8lAnijufixXFoyst6sMMtoydEF+gZRMPSI50TrnY5zRPU2
	Kb82ITl6iqMmtKSUZkBUwsISV5g4WQIKw55ZpTiESHYAKzL5t/MzpnASyOl1SE/oxmNZxD3/G2Bhp
	5uMIciwkD5zrMHEqa7G0NlVvTerGCXh8ueD1UScNPm/bpvn69ZSD2MMZ292J3UHNKgWs0W7ckv8Ur
	AfucRDsp9WS/Kgqr6www==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEFHI-004YKA-0y;
	Fri, 15 Dec 2023 20:59:24 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEFHG-004YJO-0a
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 20:59:23 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3ba4850f65dso80122b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 12:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702673959; x=1703278759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lV7l2nTXRo6puPksf2Bwbtc+9l9srdKWeAOzTx3pqZU=;
        b=lk1qpl0bEQGmCEoWNf+iFQ0dUavGkGrBFenSkjxGvF5KW9mfLlbJW2AV25mro9iIZ+
         CAMCCXqXL1J4zPb3nFAHMMNTRMCq2TfT19i+5mEUwtjCPXF+7tDPtTj8SnCAuuibQxRY
         FwNUjdOw/b//O3cOTQfGYSQPZmY9xdzHja2Bvq3m3vz7CnCwGPjYU4kj3+hya8d6XXoH
         jpfjA0xIgpFDhkWcQMV1NQGDbA+80W/XEDxkFISbo4NJMTwKbsmXUhabSgdYwKJ6YyQM
         PZeqhmyPqewqolrtxxqGL7M/ob+yHmiH4cgg7xlDb5qPxmzXw7Wa/+OdnZXToZJAeKcn
         k4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702673959; x=1703278759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lV7l2nTXRo6puPksf2Bwbtc+9l9srdKWeAOzTx3pqZU=;
        b=B53vFpkCRO6ss5LDtw7A2Wr0/srthn9apWv28V+XUt70fWoGT/+mAzy0k/xTIk1czq
         eIVkLdkT5JgjNoq6IOXKK2Jq0iFy6vYJItavfEkinQE/ozlylIcMys/Nh08DUezvP4Nq
         YMIRBZ6mNC3kp/rhFp8FaJ/nXiR2KUF+bRkd9iGk8OI2G2/fCO4Onnqj7gZxOS4zN1Eu
         G5RCny+bVj4afOGE6NOrOPYiZvqeZrZ3Sv33NKLqI5muC2r9Yiwe2x5tOyPVirmYS4Ty
         yD+CkkcaIxktqkhWzEeRmVe7UpxiHTc2Vw7ICRBWF+d2bI8R8rbtNvQNpJOqTmY8Z5w+
         s2xw==
X-Gm-Message-State: AOJu0YyXDEJQIBDpMwYIGwgctUVOC86x14fza+evjFbk9ozR4UH/yFe4
	6vN+PHyWG8/+yM/LMs4JJJd0rw==
X-Google-Smtp-Source: AGHT+IEe4Kr9nZGM8rgYvZk36QtswTXFAg2l00r9jHu+UOaHWgP1pqPIoOBpVHQ2/argXUQTanExYw==
X-Received: by 2002:a05:6808:1a0e:b0:3b9:da30:77fa with SMTP id bk14-20020a0568081a0e00b003b9da3077famr15925945oib.2.1702673959682;
        Fri, 15 Dec 2023 12:59:19 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:18ee:711a:b78b:5489? ([2600:1700:2000:b002:18ee:711a:b78b:5489])
        by smtp.gmail.com with ESMTPSA id v16-20020a0cf910000000b0067a53aa6df2sm7151683qvn.46.2023.12.15.12.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 12:59:19 -0800 (PST)
Message-ID: <65fd52f1-6861-42b0-9148-266766d054b1@sifive.com>
Date: Fri, 15 Dec 2023 14:59:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: net: starfive,jh7110-dwmac: Add
 JH7100 SoC compatible
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_125922_280306_09650461 
X-CRM114-Status: GOOD (  14.21  )
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

T24gMjAyMy0xMi0xNSAyOjQ3IFBNLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiBPbiAxNSBEZWMg
MjAyMywgYXQgMjA6NDAsIENyaXN0aWFuIENpb2NhbHRlYSA8Y3Jpc3RpYW4uY2lvY2FsdGVhQGNv
bGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgU3lub3BzeXMgRGVzaWduV2FyZSBNQUMgZm91
bmQgb24gU3RhckZpdmUgSkg3MTAwIFNvQyBpcyBtb3N0bHkKPj4gc2ltaWxhciB0byB0aGUgbmV3
ZXIgSkg3MTEwLCBidXQgaXQgcmVxdWlyZXMgb25seSB0d28gaW50ZXJydXB0cyBhbmQgYQo+PiBz
aW5nbGUgcmVzZXQgbGluZSwgd2hpY2ggaXMgJ2FoYicgaW5zdGVhZCBvZiB0aGUgY29tbW9ubHkg
dXNlZAo+PiAnc3RtbWFjZXRoJy4KPj4KPj4gU2luY2UgdGhlIGNvbW1vbiBiaW5kaW5nICdzbnBz
LGR3bWFjJyBhbGxvd3Mgc2VsZWN0aW5nICdhaGInIG9ubHkgaW4KPj4gY29uanVuY3Rpb24gd2l0
aCAnc3RtbWFjZXRoJywgZXh0ZW5kIHRoZSBsb2dpYyB0byBhbHNvIHBlcm1pdCBleGNsdXNpdmUK
Pj4gdXNhZ2Ugb2YgdGhlICdhaGInIHJlc2V0IG5hbWUuICBUaGlzIGVuc3VyZXMgdGhlIGZvbGxv
d2luZyB1c2UgY2FzZXMgYXJlCj4+IHN1cHBvcnRlZDoKPj4KPj4gIEpINzExMDogcmVzZXQtbmFt
ZXMgPSAic3RtbWFjZXRoIiwgImFoYiI7Cj4+ICBKSDcxMDA6IHJlc2V0LW5hbWVzID0gImFoYiI7
Cj4+ICBvdGhlcjogIHJlc2V0LW5hbWVzID0gInN0bW1hY2V0aCI7Cj4+Cj4+IEFsc28gbm90ZSB0
aGUgbmVlZCB0byB1c2UgYSBkaWZmZXJlbnQgZHdtYWMgZmFsbGJhY2ssIGFzIHY1LjIwIGFwcGxp
ZXMKPj4gdG8gSkg3MTEwIG9ubHksIHdoaWxlIEpINzEwMCByZWxpZXMgb24gdjMuN3guCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IENyaXN0aWFuIENpb2NhbHRlYSA8Y3Jpc3RpYW4uY2lvY2FsdGVhQGNv
bGxhYm9yYS5jb20+Cj4+IC0tLQo+PiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxk
d21hYy55YW1sICAgfCAgMyArLQo+PiAuLi4vYmluZGluZ3MvbmV0L3N0YXJmaXZlLGpoNzExMC1k
d21hYy55YW1sICAgfCA3NCArKysrKysrKysrKysrLS0tLS0tCj4+IDIgZmlsZXMgY2hhbmdlZCwg
NTUgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4+IGluZGV4
IDVjMjc2OWRjNjg5YS4uYzEzODBmZjFjMDU0IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+PiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+PiBAQCAtOTUs
NiArOTUsNyBAQCBwcm9wZXJ0aWVzOgo+PiAgICAgICAgIC0gc25wcyxkd21hYy01LjIwCj4+ICAg
ICAgICAgLSBzbnBzLGR3eGdtYWMKPj4gICAgICAgICAtIHNucHMsZHd4Z21hYy0yLjEwCj4+ICsg
ICAgICAgIC0gc3RhcmZpdmUsamg3MTAwLWR3bWFjCj4+ICAgICAgICAgLSBzdGFyZml2ZSxqaDcx
MTAtZHdtYWMKPj4KPj4gICByZWc6Cj4+IEBAIC0xNDYsNyArMTQ3LDcgQEAgcHJvcGVydGllczoK
Pj4gICByZXNldC1uYW1lczoKPj4gICAgIG1pbkl0ZW1zOiAxCj4+ICAgICBpdGVtczoKPj4gLSAg
ICAgIC0gY29uc3Q6IHN0bW1hY2V0aAo+PiArICAgICAgLSBlbnVtOiBbc3RtbWFjZXRoLCBhaGJd
Cj4+ICAgICAgIC0gY29uc3Q6IGFoYgo+IAo+IEnigJltIG5vdCBzbyB3ZWxsLXZlcnNlZCBpbiB0
aGUgWUFNTCBiaW5kaW5ncywgYnV0IHdvdWxkIHRoaXMgbm90IGFsbG93Cj4gcmVzZXQtbmFtZXMg
PSAiYWhiIiwgImFoYiI/CgpZZXMsIGl0IHdvdWxkLiBZb3UgbmVlZCBzb21ldGhpbmcgbGlrZToK
CnJlc2V0LW5hbWVzOgogIG9uZU9mOgogICAgLSBlbnVtOiBbc3RtbWFjZXRoLCBhaGJdCiAgICAt
IGl0ZW1zOgogICAgICAgIC0gY29uc3Q6IHN0bW1hY2V0aAogICAgICAgIC0gY29uc3Q6IGFoYgoK
UmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
