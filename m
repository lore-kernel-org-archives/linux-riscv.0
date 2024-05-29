Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C26C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 22:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E5GYwn4+kGHtwUo7dfuAChHLu9GfpEH0utPZdazehtM=; b=oibgrCGrMTzAN6
	A7oakG2W7SlQ48C3xtEle4AzFqivmaEix3n5qmMCnjJFxnKaQ9/y2SyyZdjHcRGZHuN44+SmOd/xU
	N137lbwU/qeXFeQDekkA/+96n+bkZfMFxJqZpGT9mNEFN5dnVZvRShKwNrAzys9QwjtWLP3dNbWpN
	+O41UugPSbXLyKMaaasnV5s0JzwAQd8tYektazn1hEDE/wjMOReF+TfvU8ZkVEGWrDLg3W/T5Qycu
	k+LNSBw8mURn/OwloZPRZzZGFq0+NOM+13iLAToJ2npuuAdH0Jz0ba85KEJyHztanbTR6V76KoXGq
	HdmiQQHbQUOuwfj6FuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRP5-00000005fbJ-0KMt;
	Wed, 29 May 2024 22:04:15 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCROy-00000005faF-2W4L
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 22:04:10 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-794db1ee9f1so20716985a.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 15:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717020246; x=1717625046; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNRVbCxzmmEAj6zXCnapG6pKcGSf1C8RmFzEbJ1ADH0=;
        b=OvtQf9R4PnnKGcRcCre7JbxKk1CJEtWs0oy55FQP9LFyo7IfAkLPCU5oo/4ynTCN9j
         E4hCtj/MNP3PDU/2pH4LbyNafPWanpFkcp0OwWLouEFXIRb0vKE6OEuoeKhJiMKBg8PY
         nnujYIzt6HxuFmFqMuBrnEqmV8SNadINQxr7Ofp24Dk3qjtNvUl1sM/theAW4ktvipsK
         059l6tzw1XtPAMFQWPBpZ1SF2Z99Ezz8U0gkUcjIdqvioCsIv0/9NPwT/+zDY0v5oq6p
         DAGvyxLET5l0AzP8wXiyOymLmD3l0IEk1InI0xJFFQyfVdpjnIk9Yz17+QMVVxo9TpUT
         G6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717020246; x=1717625046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNRVbCxzmmEAj6zXCnapG6pKcGSf1C8RmFzEbJ1ADH0=;
        b=NMpr9/MLSIdskgsToPEon2XSk444IhmMqQKzZv5rqiynOEgX3B7tWKweWDQkj8ci8g
         QRi+HjH4JP5cywIfTPkT6KJ1dKMTrzmcN3bEONxERWF+/h5gtwQFI/+m/kBxqndT2cLH
         nBTAjG9vLGH5QmlAfm/JXjxCdYOdpr9g2LnjF/2845bmMh70oHvIbYxqWirxbqt1zWLk
         oCDJ6HF+saFIJWfmGM54B3Oz7qD+kJx14j4i+HNMs5pc7LFu2h74KxT8CU9JnqHUv5ED
         AzlO7LcNG+Jc51xTaP90r/9Qa1zJQO38DEn07QSiJUVMmCrwVb2JwtRC4YYj7jhSAbJH
         PnSg==
X-Forwarded-Encrypted: i=1; AJvYcCUr4hx6NZ7JpEz6bea1XZgoRrGx4m+IsAi2RnQJ0+uXYJSALKRD9HQaVgDnBLvrdQXGbRtl7TfmG+rM9dL9QfUmxnnVQTEM48qevnXoZiB9
X-Gm-Message-State: AOJu0YxgmngXqxMvw/UeNP/uqkfphOr1vvl8moXG5Y3hvdWeIRz+C/WK
	9VFF55Q5NUrd4koeSGDfe0+TodTGbYxsPgIDMndKDB6iJzoH7C3itKMp0JXG/kE=
X-Google-Smtp-Source: AGHT+IHDZpmmzmoJ+k9ZbeknnEHLbYmkLEOEN+VjMtD7xnzdtBpnugQ1ISqlpwt1UFzDGTypUKf2rg==
X-Received: by 2002:a05:6214:3c87:b0:6ad:6059:208a with SMTP id 6a1803df08f44-6ae0cb39254mr5890786d6.35.1717020245797;
        Wed, 29 May 2024 15:04:05 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ac070d8f3dsm58003716d6.33.2024.05.29.15.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 15:04:05 -0700 (PDT)
Message-ID: <11b3de44-522b-4638-987c-2ca132e84936@sifive.com>
Date: Wed, 29 May 2024 17:04:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 01/18] irqchip/sifive-plic: Convert PLIC driver into a
 platform driver
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Anup Patel <apatel@ventanamicro.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-kernel@vger.kernel.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-2-apatel@ventanamicro.com>
 <CAMuHMdVYFFR7K5SbHBLY-JHhb7YpgGMS_hnRWm8H0KD-wBo+4A@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAMuHMdVYFFR7K5SbHBLY-JHhb7YpgGMS_hnRWm8H0KD-wBo+4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_150408_708030_F5102B79 
X-CRM114-Status: GOOD (  25.73  )
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

SGkgR2VlcnQsCgpPbiAyMDI0LTA1LTI5IDk6MjIgQU0sIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90
ZToKPiBIaSBBbnVwLAo+IAo+IE9uIFRodSwgRmViIDIyLCAyMDI0IGF0IDEwOjQx4oCvQU0gQW51
cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiBUaGUgUExJQyBkcml2
ZXIgZG9lcyBub3QgcmVxdWlyZSB2ZXJ5IGVhcmx5IGluaXRpYWxpemF0aW9uIHNvIGNvbnZlcnQK
Pj4gaXQgaW50byBhIHBsYXRmb3JtIGRyaXZlci4KPj4KPj4gQWZ0ZXIgY29udmVyc2lvbiwgdGhl
IFBMSUMgZHJpdmVyIGlzIHByb2JlZCBhZnRlciBDUFVzIGFyZSBicm91Z2h0LXVwCj4+IHNvIHNl
dHVwIGNwdWhwIHN0YXRlIGFmdGVyIGNvbnRleHQgaGFuZGxlciBvZiBhbGwgb25saW5lIENQVXMg
YXJlCj4+IGluaXRpYWxpemVkIG90aGVyd2lzZSBQTElDIGRyaXZlciBjcmFzaGVzIGZvciBwbGF0
Zm9ybXMgd2l0aCBtdWx0aXBsZQo+PiBQTElDIGluc3RhbmNlcy4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gCj4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IDhlYzk5YjAzMzE0N2VmM2IKPiAoImlycWNo
aXAvc2lmaXZlLXBsaWM6IENvbnZlcnQgUExJQyBkcml2ZXIgaW50byBhIHBsYXRmb3JtCj4gZHJp
dmVyIikgaW4gdjYuOS4KPiAKPiBJdCBsb29rcyBsaWtlIHRoaXMgY29udmVyc2lvbiBpcyBjYXVz
aW5nIGlzc3VlcyBvbiBCZWFnbGVWIFN0YXJsaWdodAo+IEJldGEuICBBZnRlciB1cGRhdGluZyBl
c21pbC92aXNpb25maXZlIHRvIHY2LjEwLXJjMSwgdGhlIGtlcm5lbCB1c3VhbGx5Cj4gZmFpbHMg
dG8gYm9vdC4gQWRkaW5nICJlYXJseWNvbiBrZWVwX2Jvb3Rjb24iIHJldmVhbHMgdGhlc2UgZGlm
ZmVyZW5jZXM6Cj4gCj4gLXJpc2N2LXBsaWMgYzAwMDAwMC5pbnRlcnJ1cHQtY29udHJvbGxlcjog
bWFwcGVkIDEzMyBpbnRlcnJ1cHRzIHdpdGggMgo+IGhhbmRsZXJzIGZvciA0IGNvbnRleHRzLgo+
ICstLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiArV0FSTklORzogQ1BVOiAw
IFBJRDogMSBhdCBkcml2ZXJzL2lycWNoaXAvaXJxLXNpZml2ZS1wbGljLmM6MzczCj4gcGxpY19o
YW5kbGVfaXJxKzB4ZjIvMHhmNgo+ICtNb2R1bGVzIGxpbmtlZCBpbjoKPiArQ1BVOiAwIFBJRDog
MSBDb21tOiBzd2FwcGVyLzAgTm90IHRhaW50ZWQKPiA2LjEwLjAtcmMxLXN0YXJsaWdodC0wMjM0
Mi1nMGJhNGM3NmNhMGU4LWRpcnR5ICMzMjMKPiArSGFyZHdhcmUgbmFtZTogQmVhZ2xlViBTdGFy
bGlnaHQgQmV0YSAoRFQpCj4gK2VwYyA6IHBsaWNfaGFuZGxlX2lycSsweGYyLzB4ZjYKPiArIHJh
IDogZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSsweDFjLzB4MmEKPiArZXBjIDogZmZmZmZmZmY4
MDMzZjk5NCByYSA6IGZmZmZmZmZmODAwNjMxOWEgc3AgOiBmZmZmZmZjODAwMDAzZjUwCj4gKyBn
cCA6IGZmZmZmZmZmODEyZDYzZjAgdHAgOiBmZmZmZmZkODgwMGI4MDAwIHQwIDogMDAwMDAwMDAw
MDAwMDA0MAo+ICsgdDEgOiAwMDAwMDAwMDAwMDAwMDAwIHQyIDogMDAwMDAwMDAwMDAwMTAwMCBz
MCA6IGZmZmZmZmM4MDAwMDNmYTAKPiArIHMxIDogMDAwMDAwMDAwMDAwMDAwOSBhMCA6IGZmZmZm
ZmQ4ODAxODM2MDAgYTEgOiAwMDAwMDAwMDAwMDAwMDA5Cj4gKyBhMiA6IDAwMDAwMDAwMDAwMDAw
MDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogMDAwMDAwMDAwMDAwMDAwMAo+ICsgYTUgOiAw
MDAwMDAwMDAwMDAwMDAwIGE2IDogZmZmZmZmZDg4MDQwMDI0OCBhNyA6IGZmZmZmZmQ4ODA0MDAy
YjgKPiArIHMyIDogZmZmZmZmZDlmOGZhYzQ1OCBzMyA6IDAwMDAwMDAwMDAwMDAwMDQgczQgOiAw
MDAwMDAwMDAwMDAwMDAwCj4gKyBzNSA6IGZmZmZmZmZmODEyOTNmNTggczYgOiBmZmZmZmZkODgw
MTRhYzAwIHM3IDogMDAwMDAwMDAwMDAwMDAwNAo+ICsgczggOiBmZmZmZmZjODAwMDEzYjJjIHM5
IDogZmZmZmZmYzgwMDAxM2IzNCBzMTA6IDAwMDAwMDAwMDAwMDAwMDYKPiArIHMxMTogZmZmZmZm
ZDlmOGZjMTQ1OCB0MyA6IDAwMDAwMDAwMDAwMDAwMDIgdDQgOiAwMDAwMDAwMDAwMDAwNDAyCj4g
KyB0NSA6IGZmZmZmZmQ4ODAwNjEwYzAgdDYgOiBmZmZmZmZkODgwMDYxMGUwCj4gK3N0YXR1czog
MDAwMDAwMDIwMDAwMDEwMCBiYWRhZGRyOiBmZmZmZmZkOWY4ZmFjNDU4IGNhdXNlOiAwMDAwMDAw
MDAwMDAwMDAzCj4gK1s8ZmZmZmZmZmY4MDMzZjk5ND5dIHBsaWNfaGFuZGxlX2lycSsweGYyLzB4
ZjYKPiArWzxmZmZmZmZmZjgwMDYzMTlhPl0gZ2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSsweDFj
LzB4MmEKPiArWzxmZmZmZmZmZjgwMzNkN2FhPl0gcmlzY3ZfaW50Y19pcnErMHgyNi8weDYwCj4g
K1s8ZmZmZmZmZmY4MDZjOTJlZT5dIGhhbmRsZV9yaXNjdl9pcnErMHg0YS8weDc0Cj4gK1s8ZmZm
ZmZmZmY4MDZkMjM0Nj5dIGNhbGxfb25faXJxX3N0YWNrKzB4MzIvMHg0MAo+ICstLS1bIGVuZCB0
cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiArVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVM
TCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcwo+IDAwMDAwMDAwMDAwMDAw
MDQKPiArT29wcyBbIzFdCj4gK01vZHVsZXMgbGlua2VkIGluOgo+ICtDUFU6IDAgUElEOiAxIENv
bW06IHN3YXBwZXIvMCBUYWludGVkOiBHICAgICAgICBXCj4gNi4xMC4wLXJjMS1zdGFybGlnaHQt
MDIzNDItZzBiYTRjNzZjYTBlOC1kaXJ0eSAjMzIzCj4gK0hhcmR3YXJlIG5hbWU6IEJlYWdsZVYg
U3RhcmxpZ2h0IEJldGEgKERUKQo+ICtlcGMgOiBwbGljX2hhbmRsZV9pcnErMHg2Ni8weGY2Cj4g
KyByYSA6IGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgxYy8weDJhCj4gK2VwYyA6IGZmZmZm
ZmZmODAzM2Y5MDggcmEgOiBmZmZmZmZmZjgwMDYzMTlhIHNwIDogZmZmZmZmYzgwMDAwM2Y1MAo+
ICsgZ3AgOiBmZmZmZmZmZjgxMmQ2M2YwIHRwIDogZmZmZmZmZDg4MDBiODAwMCB0MCA6IDAwMDAw
MDAwMDAwMDAwNDAKPiArIHQxIDogMDAwMDAwMDAwMDAwMDAwMCB0MiA6IDAwMDAwMDAwMDAwMDEw
MDAgczAgOiBmZmZmZmZjODAwMDAzZmEwCj4gKyBzMSA6IDAwMDAwMDAwMDAwMDAwMDkgYTAgOiBm
ZmZmZmZkODgwMTgzNjAwIGExIDogMDAwMDAwMDAwMDAwMDAwOQo+ICsgYTIgOiAwMDAwMDAwMDAw
MDAwMDAwIGEzIDogMDAwMDAwMDAwMDAwMDAwMCBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiArIGE1
IDogZmZmZmZmZmY4MDMzZDcyYSBhNiA6IGZmZmZmZmQ4ODA0MDAyNDggYTcgOiBmZmZmZmZkODgw
NDAwMmI4Cj4gKyBzMiA6IGZmZmZmZmQ5ZjhmYWM0NTggczMgOiAwMDAwMDAwMDAwMDAwMDA0IHM0
IDogZmZmZmZmZDg4MDE4MzYzMAo+ICsgczUgOiBmZmZmZmZmZjgxMjkzZjU4IHM2IDogZmZmZmZm
ZmY4MTI5NDhhMCBzNyA6IGZmZmZmZmZmODBjNGU2NjAKPiArIHM4IDogZmZmZmZmZmY4MGQ5ZWVh
MCBzOSA6IGZmZmZmZmM4MDAwMTNiMzQgczEwOiAwMDAwMDAwMDAwMDAwMDA2Cj4gKyBzMTE6IGZm
ZmZmZmQ5ZjhmYzE0NTggdDMgOiAwMDAwMDAwMDAwMDAwMDAyIHQ0IDogMDAwMDAwMDAwMDAwMDQw
Mgo+ICsgdDUgOiBmZmZmZmZkODgwMDYxMGMwIHQ2IDogZmZmZmZmZDg4MDA2MTBlMAo+ICtzdGF0
dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwNCBjYXVzZTogMDAw
MDAwMDAwMDAwMDAwZAo+ICtbPGZmZmZmZmZmODAzM2Y5MDg+XSBwbGljX2hhbmRsZV9pcnErMHg2
Ni8weGY2Cj4gK1s8ZmZmZmZmZmY4MDA2MzE5YT5dIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEr
MHgxYy8weDJhCj4gK1s8ZmZmZmZmZmY4MDMzZDdhYT5dIHJpc2N2X2ludGNfaXJxKzB4MjYvMHg2
MAo+ICtbPGZmZmZmZmZmODA2YzkyZWU+XSBoYW5kbGVfcmlzY3ZfaXJxKzB4NGEvMHg3NAo+ICtb
PGZmZmZmZmZmODA2ZDIzNDY+XSBjYWxsX29uX2lycV9zdGFjaysweDMyLzB4NDAKPiArQ29kZTog
OGI5MyBkNzBiIDViMTcgMDBmNSAwYjEzIGZhOGIgZmMxNyAwMGE1IDBjMTMgNWEwYyAoYTc4Mykg
MDAwOQo+ICstLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiArS2VybmVsIHBh
bmljIC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbiBpbiBpbnRlcnJ1cHQKPiArU01QOiBz
dG9wcGluZyBzZWNvbmRhcnkgQ1BVcwo+ICstLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3lu
Y2luZzogRmF0YWwgZXhjZXB0aW9uIGluIGludGVycnVwdCBdLS0tCj4gCj4gQXMgIm1hcHBlZCAx
MzMgaW50ZXJydXB0cyIgaXMgbm8gbG9uZ2VyIHByaW50ZWQsIGl0IGxvb2tzIGxpa2UgYW4KPiB1
bmV4cGVjdGVkIGVhcmx5IGludGVycnVwdCBjb21lcyBpbiB3aGlsZSBzdGlsbCBpbiBwbGljX3By
b2JlKCkuCj4gCj4gRXNtaWwgc3VnZ2VzdGVkIHJldmVydGluZyBhbGwgb2Y6Cj4gYTdmYjY5ZmZk
N2NlNDM4YSBpcnFjaGlwL3NpZml2ZS1wbGljOiBBdm9pZCBleHBsaWNpdCBjcHVtYXNrIGFsbG9j
YXRpb24gb24gc3RhY2sKPiBhYmI3MjA1Nzk0OTAwNTAzIGlycWNoaXAvc2lmaXZlLXBsaWM6IElt
cHJvdmUgbG9ja2luZyBzYWZldHkgYnkgdXNpbmcKPiBpcnFzYXZlL2lycXJlc3RvcmUKPiA5NTY1
MjEwNjQ3ODAzMGY1IGlycWNoaXAvc2lmaXZlLXBsaWM6IFBhcnNlIG51bWJlciBvZiBpbnRlcnJ1
cHRzIGFuZAo+IGNvbnRleHRzIGVhcmx5IGluIHBsaWNfcHJvYmUoKQo+IGExNTU4NzI3N2EyNDZj
MzggaXJxY2hpcC9zaWZpdmUtcGxpYzogQ2xlYW51cCBQTElDIGNvbnRleHRzIHVwb24KPiBpcnFk
b21haW4gY3JlYXRpb24gZmFpbHVyZQo+IDZjNzI1ZjMzZDY3YjUzZjIgaXJxY2hpcC9zaWZpdmUt
cGxpYzogVXNlIHJpc2N2X2dldF9pbnRjX2h3bm9kZSgpIHRvCj4gZ2V0IHBhcmVudCBmd25vZGUK
PiBiNjhkMGZmNTI5YTkzOWExIGlycWNoaXAvc2lmaXZlLXBsaWM6IFVzZSBkZXZtX3h5eigpIGZv
ciBtYW5hZ2VkIGFsbG9jYXRpb24KPiAyNWQ4NjJlMTgzZDRlZmViIGlycWNoaXAvc2lmaXZlLXBs
aWM6IFVzZSBkZXZfeHl6KCkgaW4tcGxhY2Ugb2YgcHJfeHl6KCkKPiA4ZWM5OWIwMzMxNDdlZjNi
IGlycWNoaXAvc2lmaXZlLXBsaWM6IENvbnZlcnQgUExJQyBkcml2ZXIgaW50byBhIHBsYXRmb3Jt
IGRyaXZlcgo+IAo+IEFmdGVyIHRoaXMsIHRoZSBQTElDIGlzIGluaXRpYWxpemVkIGVhcmxpZXIg
YWdhaW4sIGFuZCB0aGlzIGluZGVlZAo+IHNlZW1zIHRvIGZpeCB0aGUgaXNzdWUgZm9yIG1lLgo+
IEJlZm9yZSwgdGhlIGtlcm5lbCBib290ZWQgZmluZSBpbiBvbmx5IGNhLiAxIG91dCBvZiA1IHRy
aWVzLgo+IEFmdGVyIHRoZSByZXZlcnRzLCBpdCBib290ZWQgNS81Lgo+IAo+IERvIHlvdSBrbm93
IHdoYXQncyBnb2luZyBvbj8gSXMgdGhlcmUgYSBzaW1wbGVyIGZpeD8KClRoZSBmYWN0IHRoYXQg
eW91IGhpdCB0aGUgd2FybmluZyBpbmRpY2F0ZXMgdGhhdCBwbGljX2hhbmRsZV9pcnEoKSB3YXMg
Y2FsbGVkCmJlZm9yZSBoYW5kbGVyLT5wcmVzZW50IHdhcyBzZXQuIFByZXZpb3VzbHkgdGhlIFBM
SUMgZHJpdmVyIHdhcyBwcm9iZWQgdmVyeQplYXJseSwgc28gaXQgaXMgdW5saWtlbHkgdGhhdCBz
b21lIHBlcmlwaGVyYWwgYWxyZWFkeSBoYWQgYSBwZW5kaW5nIGludGVycnVwdC4KTm93LCB3aGls
ZSBwbGF0Zm9ybSBkZXZpY2UgZHJpdmVycyB3b3VsZCBub3QgeWV0IGJlIGFibGUgdG8gcmVxdWVz
dCBpbnRlcnJ1cHRzCihiZWNhdXNlIHRoZSBpcnFkb21haW4gaXMgbm90IHJlZ2lzdGVyZWQgeWV0
KSwgdGhleSBjb3VsZCBoYXZlIHByb2dyYW1tZWQgdGhlCmhhcmR3YXJlIGluIGEgd2F5IHRoYXQg
Z2VuZXJhdGVzIGFuIGludGVycnVwdC4gSWYgdGhhdCBpbnRlcnJ1cHQgd2FzIGVuYWJsZWQgYXQK
dGhlIFBMSUMgKGUuZy4gYnkgdGhlIGJvb3Rsb2FkZXIpLCB0aGVuIHdlIGNvdWxkIGV4cGVjdCBw
bGljX2hhbmRsZV9pcnEoKSB0byBiZQpjYWxsZWQgYXMgc29vbiBhcyBpcnFfc2V0X2NoYWluZWRf
aGFuZGxlcigpIGlzIGNhbGxlZC4KClNvIHRoZSBmaXggaXMgdG8gbm90IGNhbGwgaXJxX3NldF9j
aGFpbmVkX2hhbmRsZXIoKSB1bnRpbCBhZnRlciB0aGUgaGFuZGxlcnMgYXJlCmNvbXBsZXRlbHkg
c2V0IHVwLgoKSSd2ZSBzZW50IGEgcGF0Y2ggZG9pbmcgdGhpczoKaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMjAyNDA1MjkyMTU0NTguOTM3ODE3LTEtc2FtdWVsLmhvbGxhbmRA
c2lmaXZlLmNvbS8KClJlZ2FyZHMsClNhbXVlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
