Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947CCC4707C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 19:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgnKNSBmuDH1NGOC/d54pwQBk4lfZvpZM0Wo06qwT8k=; b=y3ohO/lyFE7jkr
	NVbip1Skfk06JqYs/xEHyzFMJZTIsPogkWrSS6buqEjmCqn0fc4cb7WMsw4tdfWGyytMCr8MqRzmj
	w8djgfUUslBGR2XK49smb/9nJ/XSlawcZjMVxkIK4xOA6udXzb/FutZ5smaj5q0Av+pUIe6rqgVtb
	I/vgGzrvczawoQArGjrLFfQYD7fnqDlnCLGb8NYmrdiTcMixb0haW1wt5GK2OU60tmciAUYh8qAPQ
	LaHKgHPBQrtwvAvHDbyvNnL9DIoOYz+ZSrKEbUz0PXhxOr26OpAguoieMTQFmymDb0/10J78rBRmQ
	1iDBPfdQdiXRZpru5roA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rONJl-003k1B-1s;
	Fri, 12 Jan 2024 19:35:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rONJj-003jzb-29
	for linux-riscv@bombadil.infradead.org;
	Fri, 12 Jan 2024 19:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j7IwvYEPmaSHyWVulXMha0dJbxFMc8lO+ii/l4e0nSY=; b=pMPWO5mBIcRg/ART2O+YKR1+2Q
	BOgCjaCSRckkjr1bjisjdD1EKxpmMDEsRJn1uAOe3/GoraCmCS6ncalY4ztPxu9SxyVevx1yg6EvP
	RfV81vwgKYqXuqGbD+uXllldpbSdsYq50DRAwm/kXgW71MTlGfce6EXSEM1niqb5AgIVZs+gZMPhy
	ByN2TNznHqkQSqQ5Swc6QR0XW9kLUy0MRzvQRfKWJYoYnuoZFDcVM78ZYTNr0TbiLRxigOpFXSzfp
	Oxq/RhRt8/+UGe1QzHgpUciX97kmBeV5H4oPww50qcinqN7Xq9QdUWIBpA5o3bTWcj3GN8+TRCKGX
	wNxePYkA==;
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rONJf-00BCbf-1r
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 19:35:45 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-783148737d5so569648585a.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 11:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705088139; x=1705692939; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7IwvYEPmaSHyWVulXMha0dJbxFMc8lO+ii/l4e0nSY=;
        b=Z0+BSm5SsfcI7sS/qup3nBFRmKfzOu76cb6fcGbozABS5NTTMyiRmo8ZP7rjkPCUah
         jHZ3dJ0JHVxbKupljzkz4yac6yc0Ug9Y1NY+YJb4toOVJzKbi06fl55Wm8qO0VocKyKE
         gGpJNlUP+W5OECJ28N61rrf9CY/rs2QEztuBvbST4Hr9Tk+0VQaNmNmSlENTGfWbDU3l
         GiLkwXUyLLFXnEtDXn06GWsJ80IaGla0/JjF/5txs0q5AKTDpXi8j/wwfrYq874ehQq4
         8qQhToCuyMqIotcH/lmIl8MBhnnQsg3gFJOqlUqw8LcEqwUecPr+NxjxoduWgo3kDj6/
         yB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705088139; x=1705692939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j7IwvYEPmaSHyWVulXMha0dJbxFMc8lO+ii/l4e0nSY=;
        b=KqOK/qjaS90t5mEEoFzmxW39bDVdOYo6rAOxECNZF8T3TfFVxw+0INk9BkHlzyzt6v
         0vi4FEphYl+cP4rdvUR20BU3I5Qb3EsFYYD2ndZVqBMU9sdy2ThdQflhBHNnDV8uu8HE
         /YcDGaMwtZjnZ2G9OigUkCyodSy522rd1ozOIzn0c9WEG25KagF5n1DSBzkL3+4skxIp
         wYSI4y7YYUTs18hgXXFGw6IWl9Q/oILb05yVAjNJECvCsjcGf4xA5QicnYV/EzciydK/
         BKhO5U76q+ZHlf8jgEBcNJC6nBg+wXQw2ITrjhcRRlSbUU3ylLC3tmktV1HzWvX1SRax
         iKSQ==
X-Gm-Message-State: AOJu0YyehI1iaxXdhx+GaljBS4Ww4Ysyr3LA6FyXV30UyhoUyoNLc/+L
	HxXsT1OuWLVVZN9Nzvg9Y9HbqBu6IuoCFA==
X-Google-Smtp-Source: AGHT+IEn+rIOiYc1vvR4dCLtefqWpSfHzxdJHtOG31fmNn1e26lFQwkxQJsbr+u6jS6ZoVkzx4OjsA==
X-Received: by 2002:a05:620a:2a08:b0:783:4a3f:cb9b with SMTP id o8-20020a05620a2a0800b007834a3fcb9bmr1551707qkp.146.1705088139195;
        Fri, 12 Jan 2024 11:35:39 -0800 (PST)
Received: from [100.64.0.1] ([170.85.8.192])
        by smtp.gmail.com with ESMTPSA id oo18-20020a05620a531200b0078190599d4dsm1279999qkn.39.2024.01.12.11.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 11:35:38 -0800 (PST)
Message-ID: <cd856233-06bb-4a5a-ba12-2996c89cb492@sifive.com>
Date: Fri, 12 Jan 2024 13:35:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] dt-bindings: clock: sophgo: support SG2042
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Chen Wang <unicorn_wang@outlook.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, Conor Dooley <conor.dooley@microchip.com>
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <925d99d5b4ece01337cb3389aaea4b631894dd1d.1704694903.git.unicorn_wang@outlook.com>
 <f88b79c3-e44b-4136-ae56-10e1f2502e2d@linaro.org>
 <MA0P287MB2822C7A3C1DC7786708E860BFE692@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240110-untoasted-underfed-fe81479506f6@spud>
 <MA0P287MB282224A6097B4FCCF721C89AFE682@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240111-jolly-prize-930931cc648a@spud>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240111-jolly-prize-930931cc648a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_193543_905243_68822F45 
X-CRM114-Status: GOOD (  11.40  )
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

SGkgQ29ub3IsIENoZW4sCgpPbiAyMDI0LTAxLTExIDEwOjU4IEFNLCBDb25vciBEb29sZXkgd3Jv
dGU6Cj4gT24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgMDQ6MDA6MDRQTSArMDgwMCwgQ2hlbiBXYW5n
IHdyb3RlOgo+PiBXaXRoIHRoaXMgY2hhbmdlLCB3ZSBkZXNjcmliZSB0aGUgcGxscyBkZWZpbmVk
IGluIHN5c3RlbSBjb250cm9sIGFzIHBsbGNsaywKPj4gYXMgYSBjaGlsZCBub2RlIG9mIHN5c3Rl
bSBjb250cm9sbGVyLiBjbGtnZW4gd2lsbCB1c2UgcGxsY2xrIGFzICJpbnB1dCIKPj4gYmVjYXVz
ZSBwbGwgY2xvY2tzIGFyZSBwYXJlbnQgb2YgZGl2IGNsb2NrcyAuCj4+Cj4+IEJ1dCB0aGVyZSBp
cyBhbm90aGVyIHJlbWFpbmluZyBxdWVzdGlvbiBhYm91dCB0aGUgZ2F0ZSBjbG9jay4gRm9yIHRo
b3NlIGdhdGUKPj4gY2xvY2tzIGNvbnRyb2xsZWQgYnkgQ0xPQ0ssIG5vIHByb2JsZW0gd2Ugd2ls
bCBwcm92aWRlIHRoZW4gaW4gY2xrZ2VuLCBidXTCoAo+PiBmb3IgdGhvc2UgZ2F0ZSBjbG9ja3Mg
Y29udHJvbGxlZCBieSByZWdpc3RlcnMgaW4gU1lTX0NUUkwsIHRoZXkgYXJlIGNoaWxkCj4+IGdh
dGUgb2YgdGhlICJjbGtfZ2F0ZV9ycF9jcHVfbm9ybWFsIiwgd2hpY2ggaXMgYSBnYXRlIGNsb2Nr
IHByb3ZpZGVkIGJ5Cj4+IGNsa2dlbi4gSWYgSSBleHRyYWN0ZWQgdGhvc2UgU1lTX0NUUkwgZ2F0
ZSBjbG9ja3MgYW5kIGRlZmluZSB0aGVtIGluIHN5c3RlbQo+PiBjb250cm9sbGVyIGR0cyBub2Rl
LCBJIG1heSBoYXZlIHRvIHVzZSAiY2xrX2dhdGVfcnBfY3B1X25vcm1hbCIgYXMgdGhlaXIKPj4g
aW5wdXQsIGl0IGxvb2tzIGEgYml0IHdpZXJkIGJlY2FzdWUgdGhlcmUgYXJlIGNhc2VzIHdoZXJl
IGVhY2ggb3RoZXIgc2VydmVzCj4+IGFzIGlucHV0LiBJIHRyeSB0byBkcmFmdCBiZWxvdyBEVFMg
dG8gZXhwbGFuIHdoYXQgSSBtZWFudC4gSSdtIG5vdCBzdXJlIGlmCj4+IGl0IGNhbiB3b3JrIGFu
ZCBJJ2QgbG92ZSB0byBoZWFyIHlvdXIgZ3VpZGFuY2UuCj4gCj4gSSdtIG5vdCBzdXJlIGhvdyB0
aGlzIHNvcnQgb2YgY2lyY3VsYXIgcmVsYXRpb25zaGlwIHdvcmtzIGZvciBwcm9iaW5nCj4gd29y
a3MgZWl0aGVyLiBTdGVwaGVuIGV0YyB3b3VsZCBrbm93IG1vcmUgdGhhbiBtZSBoZXJlLgoKSXQg
Z2VuZXJhbGx5IHdvcmtzIGZpbmUuIFRoZSBjb21tb24gY2xvY2sgZnJhbWV3b3JrIGNhbiBoYW5k
bGUgdGhlIGNoaWxkIGNsb2NrCmJlaW5nIHJlZ2lzdGVyZWQgYmVmb3JlIGl0cyBwYXJlbnQsIGV2
ZW4gd2hlbiB1c2luZyBhIERUIChmd19uYW1lKSByZWZlcmVuY2UuClNlZSBmb3IgZXhhbXBsZSBj
bGtfY29yZV9maWxsX3BhcmVudF9pbmRleCgpIGFuZApjbGtfY29yZV9yZXBhcmVudF9vcnBoYW5z
X25vbG9jaygpIGluIGRyaXZlcnMvY2xrL2Nsay5jCgpSZWdhcmRzLApTYW11ZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
