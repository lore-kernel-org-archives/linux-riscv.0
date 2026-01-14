Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468BFD3CC84
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 23:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiISiZa+MwRdZdGvds6p9gHke0mxPxSsuZeIp/eC9jo=; b=XN6rc5GYpj6NNR
	5/LCIq13YkKQW2jDaUE38fSulGB672XJAervR2Scn9JrMq5J0icQVHGwnHt/gJCBsi7eHJeaQzsUF
	kbqNEGckwmOW4Om9UGReVs4BNdFZlq5sibeP+tlYCG4mag2B5QHY4y05A1h/MjZEz0QS0hwyhZtD5
	M5A517JOfqVZoZE7dJ+1u7uUIzX4fUSSZgFwJAvqOUOwOZGhDVKDQk5qFjMC1qj4NKdkVPd16oAQN
	sJPBBo7Iwtqw+LStmJqf8znVS2EV3AZsqluJJUM8NinUfJvw5Nv8Ugg8QEygYK8i3bs+/hTD947Zj
	szNjzp4celAgTz/zoDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAjf-0000000B9XA-3TKR;
	Wed, 14 Jan 2026 23:57:11 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAjb-0000000B9WB-3msL
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 23:57:10 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-3f551ad50d1so131428fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 15:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1768435026; x=1769039826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lrZ0xz6rtJrpX2gJTATZXWCSjCkVy/ptUp7g0PyWV/k=;
        b=Dk//WIJAfm/jYRLCWHWGQ+Mj8XgRWWdp+vv/5N3qilILTteljmcKBNd7GsQcg/dUFV
         iGHWrQbeZog5NeIVawtiiL0tmz+qUwk26qGlEusuv6pUPBwBzAnmk8g/fQuA/Ks8b7Vo
         k7n3inAGpbGV7OGZv+/bymiDjXOGZ6PIE4Z5rUSzk1lCSwyufDRRxNmU5sG5g6nopC8n
         Un2fZH8Be2K/zzcCOgNiggYsww8etgjCw5U/+OVjVAU8SIuqsncOcTUJSoogbedZR9Xc
         Ir3bWRK6EFlSPGOxfJk2Z1mWPF2zxldccEY0ShFe17/HlWTQ1CYMt5O+pyPhkOCDS2+0
         Idxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768435026; x=1769039826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrZ0xz6rtJrpX2gJTATZXWCSjCkVy/ptUp7g0PyWV/k=;
        b=JHZNH+qo3anntB93S4No9VjOnJ+L8PlHoecD71MmRecOI8i1PEuPhe3ZGxlbMzDCoD
         o/l/5dQobCivz4CDTYNJS/JOuChWyfho68rwvjeruWn87c/lvEXWIuPNv0VmSQk+M1Vt
         yqw7QQp1Lk/aMb8ZCV8NOJKyExhgc9px7AvrwKV0mZAkSwUprRQh6ScZtL9RVWfFrLPV
         qSeYJGDke2hanTp5wkHX175uDB6C9AhqedHJ58V5r0eo+OvEKzSIFVA0rtEI9phyMYiu
         ia8JU1Fh9zozxn8pUbuX2GN6Se0PxyNsotdO2gZJZsTyIBnKRbK2giOWqHQjKDRr8388
         a/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUD6F+Vp+Li9rRxiKujpLhfwHQ6g+2fV+Gpys9YjwbpBUsLQR07sXt0Jpz3534FMqGXhSQTthAFHenhzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrDbngQibBvjgQ97fYAv2gJZevzQFLFLe/Z7I//QRWM0pA0RyO
	VzYBdh5nPSz3IbfUrAFHsmUx35Q37EQ6yCusf3AI1W/AbYiFf6YA6DsjMeDZ2JKSKoUWdHjgqqS
	wxQEj
X-Gm-Gg: AY/fxX6+tlQc6ee4Hl8cVpFu+FlNYTxTx8AhZRjMGuXwfLTbxSRVXKYHBvYyp8r+d8Z
	TLFZkqpiyGvSCpWu6K4CvCjpdo+Y/iDkOxs77mO94mQWlqVUFAmHgKLo+erkA1E4kU9F03YBGbY
	j0o/ZyVsCPN+kpyzVQgUGxIMhdma7D+ZsYAQ7c3Ibldd1XxVMcs1bBUodNzliEs01gX6/r9h8rY
	j8hXyaed94g7g2ljEiICbWz9HY3Vs8LYRAH7Hjbwl21rG5IJEpZ94PXQ/swM7Jn8pU2vMynAAhU
	HeAzEKJNkDg3wmLgKyHJe5AiDWMNcfgfrVVwoX4GGzSsrrOHwDRW1VkjSiaTTAevWnXBIXX34uO
	74LaLZ2mB/vsGt4XnUPMYEfQkxeWjqkGYqfjH4C4iz9VqFfz4k5aiOvZ3NyAdVlxuMf6xXzcnPH
	qW2lR+QLIekrxw/VWUnUnUWtlZI7in
X-Received: by 2002:a05:6871:3393:b0:404:2fe7:e184 with SMTP id 586e51a60fabf-4042fe7e4b3mr317528fac.43.1768435026295;
        Wed, 14 Jan 2026 15:57:06 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm17826541fac.21.2026.01.14.15.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 15:57:05 -0800 (PST)
Message-ID: <fd95c2f2-9292-483c-9613-4adf3c65c500@sifive.com>
Date: Wed, 14 Jan 2026 17:57:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
 <20260108-k3-basic-dt-v3-10-ed99eb4c3ad3@riscstar.com>
 <77f9a001-7f0a-4c29-abcb-501e875da117@sifive.com>
 <CAH1PCMZ5rKbG8xEbB9jt6TqyB28T5aLgRtf3iJ8Gt6Fk+3XFhQ@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAH1PCMZ5rKbG8xEbB9jt6TqyB28T5aLgRtf3iJ8Gt6Fk+3XFhQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_155707_966723_D8E7B631 
X-CRM114-Status: GOOD (  23.19  )
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

SGkgR3VvZG9uZywKCk9uIDIwMjYtMDEtMDkgMzo1OCBBTSwgR3VvZG9uZyBYdSB3cm90ZToKPiBI
aSwgU2FtdWVsCj4gCj4gT24gRnJpLCBKYW4gOSwgMjAyNiBhdCAyOjE54oCvQU0gU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Pgo+PiBPbiAyMDI2LTAx
LTA4IDY6MjYgQU0sIEd1b2RvbmcgWHUgd3JvdGU6Cj4+PiBTcGFjZW1pVCBLMyBpcyBlcXVpcHBl
ZCB3aXRoIDggWDEwMCBjb3Jlcywgd2hpY2ggYXJlIFJWQTIzIGNvbXBsaWFudC4KPj4+IEFkZCBu
b2RlcyBvZiB1YXJ0cywgdGltZXIgYW5kIGludGVycnVwdC1jb250cm9sbGVycy4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPj4+IC0tLQo+
Pj4gdjM6IFJlbW92ZSAic3VwbSIgZnJvbSB0aGUgcmlzY3YsaXNhLWV4dGVuc2lvbnMgbGlzdC4K
Pj4+IHYyOiBSZW1vdmUgYWxpYXNlcyBmcm9tIGszLmR0c2ksIHRoZXkgc2hvdWxkIGJlIGluIGJv
YXJkIERUUy4KPj4+ICAgICBVcGRhdGVkIHJpc2N2LGlzYS1leHRlbnNpb25zIHdpdGggbmV3IGV4
dGVuc2lvbnMgZnJvbSB0aGUgZXh0ZW5zaW9ucy55YW1sCj4+PiAtLS0KPj4+ICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NwYWNlbWl0L2szLmR0c2kgfCA1NDggKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgNTQ4IGluc2VydGlvbnMoKykKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uYmU5
MzM1ZmJhMzJjYjllODE5MTViMmI5MWNmMDhjNTVhNWU5NjgwOQo+Pj4gLS0tIC9kZXYvbnVsbAo+
Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpCj4+PiBbLi4uXQo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHhlMDQwMDAwMCAweDAgMHgwMDIw
MDAwMD47Cj4+PiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4+
PiArICAgICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwwPjsKPj4+ICsgICAg
ICAgICAgICAgICAgICAgICBtc2ktY29udHJvbGxlcjsKPj4+ICsgICAgICAgICAgICAgICAgICAg
ICAjbXNpLWNlbGxzID0gPDA+Owo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMt
ZXh0ZW5kZWQgPSA8JmNwdTBfaW50YyA5PiwgPCZjcHUxX2ludGMgOT4sCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmY3B1Ml9pbnRjIDk+LCA8JmNwdTNf
aW50YyA5PiwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PCZjcHU0X2ludGMgOT4sIDwmY3B1NV9pbnRjIDk+LAo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICA8JmNwdTZfaW50YyA5PiwgPCZjcHU3X2ludGMgOT47Cj4+
PiArICAgICAgICAgICAgICAgICAgICAgcmlzY3YsbnVtLWlkcyA9IDw1MTE+Owo+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIHJpc2N2LG51bS1ndWVzdC1pZHMgPSA8NTExPjsKPj4+ICsgICAgICAg
ICAgICAgICAgICAgICByaXNjdixoYXJ0LWluZGV4LWJpdHMgPSA8ND47Cj4+PiArICAgICAgICAg
ICAgICAgICAgICAgcmlzY3YsZ3Vlc3QtaW5kZXgtYml0cyA9IDw2PjsKPj4+ICsgICAgICAgICAg
ICAgfTsKPj4+ICsKPj4+ICsgICAgICAgICAgICAgc2FwbGljOiBpbnRlcnJ1cHQtY29udHJvbGxl
ckBlMDgwNDAwMCB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzcGFj
ZW1pdCxrMy1hcGxpYyIsICJyaXNjdixhcGxpYyI7Cj4+PiArICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MCAweGUwODA0MDAwIDB4MCAweDQwMDA+Owo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIG1zaS1wYXJlbnQgPSA8JnNpbXNpYz47Cj4+PiArICAgICAgICAgICAgICAgICAgICAgI2lu
dGVycnVwdC1jZWxscyA9IDwyPjsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQt
Y29udHJvbGxlcjsKPj4+ICsgICAgICAgICAgICAgICAgICAgICByaXNjdixudW0tc291cmNlcyA9
IDw1MTI+Owo+Pj4gKyAgICAgICAgICAgICB9Owo+Pgo+PiBEb2VzIHRoZSBjaGlwIGFsc28gaGF2
ZSBNLW1vZGUgSU1TSUMgYW5kIEFQTElDIGluc3RhbmNlcz8gVGhvc2UgbmVlZCB0byBiZQo+PiBy
ZXByZXNlbnRlZCBpbiB0aGUgZGV2aWNldHJlZSBhcyB3ZWxsLCBmb3IgTS1tb2RlIGZpcm13YXJl
IHRvIGFjY2VzcyB0aGVtLCBqdXN0Cj4+IGxpa2UgdGhlIENMSU5UIGJlbG93Lgo+IAo+IFllcywg
dGhlIEszIGNoaXAgZG9lcyBoYXZlIE0tbW9kZSBJTVNJQyBhbmQgQVBMSUMgaW5zdGFuY2VzLiBD
dXJyZW50bHksIHRoZQo+IGJvb3QgZmlybXdhcmUgKFUtQm9vdCkgdHJhbnNmZXJzIGluZm9ybWF0
aW9uIGFib3V0IHRoZXNlIG5vZGVzIHRvIE9wZW5TQkkuCj4gSG93ZXZlciwgeW91IGFyZSBjb3Jy
ZWN0IHRoYXQgdGhleSBzaG91bGQgYmUgcHJvcGVybHkgZGVzY3JpYmVkIGluIHRoZSBEVC4KPiAK
PiBJbiB0aGUgbmV4dCB2ZXJzaW9uLCBJIHdpbGwgYWRkIHRoZSBNLW1vZGUgQVBMSUMgKG1hcGxp
YykgYW5kIElNU0lDIChtaW1zaWMpCj4gbm9kZXMgdG8gazMuZHRzaSwgZm9yIHRvcG9sb2d5IHJl
cHJlc2VudGF0aW9uIGFuZCBwb3RlbnRpYWwgZmlybXdhcmUgdXNhZ2UuCj4gSSB3aWxsIHNldCB0
aGVpciBzdGF0dXMgdG8gImRpc2FibGVkIiBiZWNhdXNlIGV4cG9zaW5nIHRoZW0gYXMgIm9rYXki
IHRvIExpbnV4Cj4gY2F1c2VzIGFjY2VzcyBmYXVsdHMgZHVyaW5nIGRyaXZlciBwcm9iaW5nLgo+
IAo+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGlzIGFwcHJvYWNoIChhZGRpbmcgdGhlbSBidXQg
a2VlcGluZyB0aGVtIGRpc2FibGVkKQo+IGxvb2tzIG9rYXkgdG8geW91LgoKSSB0aGluayB0aGlz
IGlzIGEgcmVhc29uYWJsZSBjb21wcm9taXNlLgoKUGVyc29uYWxseSwgSSB0aGluayBvZiB0aGUg
RFRTIGZpbGVzIGluIHRoZSBMaW51eCByZXBvc2l0b3J5IGFzIHRoZSAic3RhdGljIgpkZXZpY2V0
cmVlLCB3aGljaCBzaG91bGQgZGVzY3JpYmUgYSAiY29tcGxldGUiIHZpZXcgb2YgdGhlIGhhcmR3
YXJlLS10aGF0IGlzLCBhcwpzZWVuIGZyb20gdGhlIGhpZ2hlc3QgcHJpdmlsZWdlIGxldmVsLiBU
aGVuIGl0IGlzIHRoZSByZXNwb25zaWJpbGl0eSBvZiB0aGF0CmhpZ2hseS1wcml2aWxlZ2VkIHNv
ZnR3YXJlIHRvIG1vZGlmeSB0aGUgRkRUIGFzIG5lZWRlZCB0byBwcm92aWRlIGEgbGltaXRlZCB2
aWV3Cm9mIHRoZSBoYXJkd2FyZSB0byBsb3dlci1wcml2aWxlZ2VkIHNvZnR3YXJlLiBBbmQgdGhp
cyBtb2RpZmljYXRpb24gaXMgZXhhY3RseQp3aGF0IE9wZW5TQkkgZG9lcyBiZWZvcmUgaXQgcGFz
c2VzIHRoZSBGRFQgdG8gVS1Cb290LiBTbyB0aGUgInN0YXRpYyIgZGV2aWNldHJlZQp3b3VsZCBu
b3QgZGlzYWJsZSB0aGVzZSBNLW1vZGUtb25seSBkZXZpY2VzLgoKSG93ZXZlciwgSSByZWNvZ25p
emUgdGhhdCBwZW9wbGUgd2FudCB0byB1c2UgdGhlIERUQiBmaWxlcyBnZW5lcmF0ZWQgYnkgdGhl
CkxpbnV4IGJ1aWxkIHByb2Nlc3Mgd2l0aCBMaW51eCBkaXJlY3RseSwgaWdub3JpbmcgdGhlIGZp
cm13YXJlLXByb3ZpZGVkIEZEVC4gSW4KdGhhdCBjYXNlcyB0aGUgTS1tb2RlLW9ubHkgZGV2aWNl
cyBuZWVkIHRvIGJlIGRpc2FibGVkLiBBbmQgdGhlbiB5b3UgbmVlZCBhCi11LWJvb3QuZHRzaSBm
aWxlIHRvIHNldCBgc3RhdHVzID0gIm9rYXkiYCBmb3IgdGhlIGZpcm13YXJlIGJ1aWxkLiBJIHRo
aW5rCnRoYXQncyBhIHJlYXNvbmFibGUgY29tcHJvbWlzZSB0byBtYWtlIHRoZSAic3RhdGljIiBk
ZXZpY2V0cmVlIGFzIGNvbXBsZXRlIGFzCnBvc3NpYmxlIHdoaWxlIHN0aWxsIGJlaW5nIHVzYWJs
ZSBkaXJlY3RseSBpbiBTLW1vZGUgaW4gc29tZSBjYXNlcy4gKEl0IHN0aWxsCmJyZWFrcyBpZiBz
b21lIHBlcmlwaGVyYWwgaXMgYXNzaWduZWQgdG8gYSBkaWZmZXJlbnQgc3VwZXJ2aXNvciBkb21h
aW4sIG9yIHNvbWUKRFJBTSBpcyByZXNlcnZlZCBieSBNLW1vZGUsIGV0Yy4sIHdoaWNoIGlzIHdo
eSBJIHJlYWxseSByZWNvbW1lbmQgdXNpbmcgdGhlCmZpcm13YXJlIEZEVCBhbmQgbm90IGEgZmls
ZS4pCgpSZWdhcmRzLApTYW11ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
