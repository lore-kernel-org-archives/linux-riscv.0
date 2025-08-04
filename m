Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF39AC87FDA
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 08:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1qUMERHdDEcETI6GVGvgBwKcpVRhctSWavR1/2hbvE=; b=GMdWQcDWTsVKtc
	oN8hFPqJH2PwT67mJ9IoZi6Syn6ugYdfel24XeAGEpC/4M3XmJULPwrDeNPJD+7jqbFswb/30MbnW
	6B+QXibvxj7KWou5WNu0jcndqa1DjewcrNy/W4/tKU7Wt7KO05nfoqgme430H2t4kXAr3mqtFiFiO
	Jk0Pj6gPKk8ltAypjlrFE6UF0SFjaC5WWelR2tZG8h/imNtZqSedztsC0Pg7J9mG9nVKm8NGmZAuI
	RG9r7fNJRnKpb6lcsGGGL6UUq6rt3GeQM5npSry4OL/JlDw/fYjzi3llmgF4Z1NrGmvPqzMtL6vWF
	lZzmbTlx00vn3LqF54VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqso-00000009zX6-0Vhe;
	Mon, 04 Aug 2025 08:49:26 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqNM-00000009vC7-2Sq8
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 08:16:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b7823559a5so2410952f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 04 Aug 2025 01:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754295415; x=1754900215; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEeVCTU26A2c9mzwa89W6JCorn8Fiao7bTSPK85CQbI=;
        b=J4vHusl/DyaoSnucZ9ha19QOSCPTzucPtmL0gWhKwrHMyCXobORqkyJTr+Rc1nb3B7
         yH5PkIIt+QGZ06oriXYpJO8XYx4/H0CXuZZx9TMacdNjiy0ZzaxO8XGhcAkqXkCaE+BE
         zSRdySkNJW3veuhoD9zts48h7+zxxxc5tj5Cr9oYUoWrj4m6YelxFfgzYoHmTfIuevHd
         I0ysc0+9pT4OW+UBWCa3/cv1/wA5D0/t/s1QeLRJD+zdfvZodNv9itQEz6aP0RMqK1ZC
         aKLkPrmehy2LYbREr5pbg9/Ew7Qj9g+xOWFhZuQBUxhmZ5LxcwBoVquApZBURkuJjDCb
         Jvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754295415; x=1754900215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OEeVCTU26A2c9mzwa89W6JCorn8Fiao7bTSPK85CQbI=;
        b=jonPg4hVfNC8qwd+D51qQAA2UaK+mD7A7lfdqN/+nzqPz5dBDtOUwMGnnkJoflpx/0
         UJOJ291ma0OPIha23PuP/HOlG8RsV4bMLYqkKxA4koGB4Ed7Sr1AQNXBB6LtN+AKHQDT
         vIxLNsL2R/4/5fVjlawFwW583d5HE3RHifCje55DPzSuHjTL1xYAAhT1tC+14Wo33/1Z
         gMbC/Z8SZvJWxayXmZfHAIbTovs6BPKb2N5NXpXjYrFLKKNMPJOyLUsCD5Syd+Gy2rOm
         Sm6ngDtCDc/wSCYcYrwyuXYWsBo7sDQ3sYAdaeobUA71CEnhat5XHkS/2El0UvI5HfR1
         Q8/w==
X-Forwarded-Encrypted: i=1; AJvYcCUcXR3idX54OYaxPM12KSF97VmvyqbE5HuFao0vM0T2rQWEiKxbrMX1E1pLyGFS4WDrU2d/lAbnAqLU9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJfc+Id3ev5POxTW88sdHpt5EZWAD1pLLyekFSaV8uE5U7jUKu
	oA0mIC5OdRmfOnz+RJAr1FrWBi3qf83qNuhCIr9N5O5MqiXM16Q2l2TSaoWwmG1pNO1PHTQyRn3
	jPwaQmDg=
X-Gm-Gg: ASbGncsro2dENNk9CmlbRqkIY5b0EPlSRwj9dkKS9K0GiJ/M7arOZ2deXgctuqaMu88
	VTLEYCZsS84801tVyiKc2UAj47ycY542nQl9tY+3HqjH2Bs8/82JeEG+zhgPSHnrE5QBbi90pKE
	WEKpl9NlBBpNLiw8ZZZ94FITYP6ORMkrUbwjpsHdFPuEdU5X/jdcnxOQZXcWBGEaAecUoFI1S8W
	5MnYo+zTQGI+YFLIlSEwq3yPNLS76+IywCCkxjJmlo7I4lDj0Rp/Qh6PE4Q1+a7Q/hluz1B05uI
	HXOD+BruZmEyWcDUHB/5pDFNZ0SRDRfFsjNKcl2hvopb3TZVkgLV+rrzBDl2Nj8AqpCfjo03MvL
	+NEc5AnA+TwrbNG6Qlr1mOL9Gca2nR/ipsZp0QIh6Ub3FS3J7Y56lK4vFE1WRIpapOJE=
X-Google-Smtp-Source: AGHT+IEgZO9itT+bxvDLwpYlCFZ5OrvDEOn0OKR5gnR2Rd15k7AEooLseENSSAxxm1NkLlFQ8LzEcQ==
X-Received: by 2002:a05:6000:2481:b0:3b5:f93a:bcc with SMTP id ffacd0b85a97d-3b8d94c1ceamr6822762f8f.35.1754295414943;
        Mon, 04 Aug 2025 01:16:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453aeasm15083572f8f.40.2025.08.04.01.16.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 01:16:54 -0700 (PDT)
Message-ID: <d9a98d98-16d7-4d3d-b968-bcd34c8dd0f4@rivosinc.com>
Date: Mon, 4 Aug 2025 10:16:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] riscv: ptrace: Add hw breakpoint support
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta
 <debug@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, WangYuli
 <wangyuli@uniontech.com>, Huacai Chen <chenhuacai@kernel.org>,
 Nam Cao <namcao@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Joel Granados <joel.granados@kernel.org>,
 Celeste Liu <coelacanthushex@gmail.com>, Evan Green <evan@rivosinc.com>,
 Nylon Chen <nylon.chen@sifive.com>
References: <20250722173829.984082-1-jesse@rivosinc.com>
 <20250722173829.984082-7-jesse@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250722173829.984082-7-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_011656_633350_1B30727B 
X-CRM114-Status: GOOD (  28.64  )
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

CgpPbiAyMi8wNy8yMDI1IDE5OjM4LCBKZXNzZSBUYXViZSB3cm90ZToKPiBBZGQgYWJpbGl0eSB0
byBzZXR1cCBodyBicmVha3BvaW50cyB0byBwdHJhY2UuIENhbGwgZGVmaW5lcyBhIG5ldwo+IHN0
cnVjdHVyZSBvZiAodWxvbmdbM10pe2JwX2FkZHIsIGJwX2xlbiwgYnBfdHlwZX0gd2l0aAo+IGJw
X3R5cGUgYmVpbmcgb25lIG9mIEhXX0JSRUFLUE9JTlRfTEVOX1ggYW5kCj4gYnBfbGVuIGJlaW5n
IG9uZSBvZiBIV19CUkVBS1BPSU5UX1ggd2l0aCBhIHZhbHVlIG9mCj4gemVybyBkaXNzYWJsaW5n
IHRoZSBicmVha3BvaW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUBy
aXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgg
ICB8ICA0ICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaCB8ICAzICst
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL2h3X2JyZWFrcG9pbnQuYyAgICB8IDE0ICsrKystCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgICAgICB8ICA0ICsrCj4gIGFyY2gvcmlzY3Yv
a2VybmVsL3B0cmFjZS5jICAgICAgICAgICB8IDkzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiBpbmRleCA1ZjU2ZWI5ZDExNGEuLjQ4
OGQ5NTZhOTUxZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nv
ci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+IEBAIC0xMiw2
ICsxMiw3IEBACj4gIAo+ICAjaW5jbHVkZSA8dmRzby9wcm9jZXNzb3IuaD4KPiAgCj4gKyNpbmNs
dWRlIDxhc20vaHdfYnJlYWtwb2ludC5oPgo+ICAjaW5jbHVkZSA8YXNtL3B0cmFjZS5oPgo+ICAK
PiAgI2RlZmluZSBhcmNoX2dldF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdzKQkJCVwKPiBAQCAt
MTA4LDYgKzEwOSw5IEBAIHN0cnVjdCB0aHJlYWRfc3RydWN0IHsKPiAgCXN0cnVjdCBfX3Jpc2N2
X3ZfZXh0X3N0YXRlIHZzdGF0ZTsKPiAgCXVuc2lnbmVkIGxvbmcgYWxpZ25fY3RsOwo+ICAJc3Ry
dWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUga2VybmVsX3ZzdGF0ZTsKPiArI2lmZGVmIENPTkZJR19I
QVZFX0hXX0JSRUFLUE9JTlQKPiArCXN0cnVjdCBwZXJmX2V2ZW50ICpwdHJhY2VfYnBzW1JWX01B
WF9UUklHR0VSU107Cj4gKyNlbmRpZgo+ICAjaWZkZWYgQ09ORklHX1NNUAo+ICAJLyogRmx1c2gg
dGhlIGljYWNoZSBvbiBtaWdyYXRpb24gKi8KPiAgCWJvb2wgZm9yY2VfaWNhY2hlX2ZsdXNoOwo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKPiBpbmRleCBhMzgyNjhiMTljM2QuLmE3
OTk4ZWQ0MTkxMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRy
YWNlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKPiBAQCAt
MTQsNyArMTQsOCBAQAo+ICAKPiAgI2RlZmluZSBQVFJBQ0VfR0VURkRQSUNfRVhFQwkwCj4gICNk
ZWZpbmUgUFRSQUNFX0dFVEZEUElDX0lOVEVSUAkxCj4gLQo+ICsjZGVmaW5lIFBUUkFDRV9HRVRI
QlBSRUdTCTIKPiArI2RlZmluZSBQVFJBQ0VfU0VUSEJQUkVHUwkzCj4gIC8qCj4gICAqIFVzZXIt
bW9kZSByZWdpc3RlciBzdGF0ZSBmb3IgY29yZSBkdW1wcywgcHRyYWNlLCBzaWdjb250ZXh0Cj4g
ICAqCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2h3X2JyZWFrcG9pbnQuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2h3X2JyZWFrcG9pbnQuYwo+IGluZGV4IDQzN2ZkODJiOTU5MC4uYzU4
MTQ1NDY0NTM5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2h3X2JyZWFrcG9pbnQu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2h3X2JyZWFrcG9pbnQuYwo+IEBAIC02MzMsNyAr
NjMzLDE5IEBAIHZvaWQgYXJjaF91bmluc3RhbGxfaHdfYnJlYWtwb2ludChzdHJ1Y3QgcGVyZl9l
dmVudCAqZXZlbnQpCj4gIAkJcHJfd2FybigiJXM6IEZhaWxlZCB0byB1bmluc3RhbGwgdHJpZ2dl
ciAlZC4gZXJyb3I6ICVsZFxuIiwgX19mdW5jX18sIGksIHJldC5lcnJvcik7Cj4gIH0KPiAgCj4g
LXZvaWQgZmx1c2hfcHRyYWNlX2h3X2JyZWFrcG9pbnQoc3RydWN0IHRhc2tfc3RydWN0ICp0c2sp
IHsgfQo+ICsvKgo+ICsgKiBSZWxlYXNlIHRoZSB1c2VyIGJyZWFrcG9pbnRzIHVzZWQgYnkgcHRy
YWNlCj4gKyAqLwo+ICt2b2lkIGZsdXNoX3B0cmFjZV9od19icmVha3BvaW50KHN0cnVjdCB0YXNr
X3N0cnVjdCAqdHNrKQo+ICt7Cj4gKwlpbnQgaTsKPiArCXN0cnVjdCB0aHJlYWRfc3RydWN0ICp0
ID0gJnRzay0+dGhyZWFkOwo+ICsKPiArCWZvciAoaSA9IDA7IGkgPCBkYnRyX3RvdGFsX251bTsg
aSsrKSB7Cj4gKwkJdW5yZWdpc3Rlcl9od19icmVha3BvaW50KHQtPnB0cmFjZV9icHNbaV0pOwo+
ICsJCXQtPnB0cmFjZV9icHNbaV0gPSBOVUxMOwo+ICsJfQo+ICt9CgpIaSBKZXNzZSwKCllvdSBj
YW4gZGlzY2FyZCBteSBjb21tZW50IGluIHRoZSBwcmV2aW91cyBwYXRjaCBhYm91dCBpbXBsZW1l
bnRpbmcgdGhpcwpmdW5jdGlvbiA7KQoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gIAo+ICB2b2lkIGh3
X2JyZWFrcG9pbnRfcG11X3JlYWQoc3RydWN0IHBlcmZfZXZlbnQgKmJwKSB7IH0KPiAgCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYwo+IGluZGV4IDE1ZDhmNzU5MDJmOC4uOWNmMDdlY2ZiNTIzIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYwo+IEBAIC05LDYgKzksNyBAQAo+ICAKPiAgI2luY2x1ZGUgPGxpbnV4L2JpdGZp
ZWxkLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2h3X2Jy
ZWFrcG9pbnQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvc2NoZWQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL2RlYnVnLmg+Cj4gQEAgLTE2NCw2
ICsxNjUsNyBAQCB2b2lkIHN0YXJ0X3RocmVhZChzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWdu
ZWQgbG9uZyBwYywKPiAgCj4gIHZvaWQgZmx1c2hfdGhyZWFkKHZvaWQpCj4gIHsKPiArCWZsdXNo
X3B0cmFjZV9od19icmVha3BvaW50KGN1cnJlbnQpOwo+ICAjaWZkZWYgQ09ORklHX0ZQVQo+ICAJ
LyoKPiAgCSAqIFJlc2V0IEZQVSBzdGF0ZSBhbmQgY29udGV4dAo+IEBAIC0yMTgsNiArMjIwLDgg
QEAgaW50IGNvcHlfdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwgY29uc3Qgc3RydWN0IGtl
cm5lbF9jbG9uZV9hcmdzICphcmdzKQo+ICAJCXNldF9iaXQoTU1fQ09OVEVYVF9MT0NLX1BNTEVO
LCAmcC0+bW0tPmNvbnRleHQuZmxhZ3MpOwo+ICAKPiAgCW1lbXNldCgmcC0+dGhyZWFkLnMsIDAs
IHNpemVvZihwLT50aHJlYWQucykpOwo+ICsJaWYgKElTX0VOQUJMRUQoQ09ORklHX0hBVkVfSFdf
QlJFQUtQT0lOVCkpCj4gKwkJbWVtc2V0KHAtPnRocmVhZC5wdHJhY2VfYnBzLCAwLCBzaXplb2Yo
cC0+dGhyZWFkLnB0cmFjZV9icHMpKTsKPiAgCj4gIAkvKiBwLT50aHJlYWQgaG9sZHMgY29udGV4
dCB0byBiZSByZXN0b3JlZCBieSBfX3N3aXRjaF90bygpICovCj4gIAlpZiAodW5saWtlbHkoYXJn
cy0+Zm4pKSB7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3B0cmFjZS5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMKPiBpbmRleCBlYTY3ZTlmYjdhNTguLmI3OGNmYjBmMWMw
ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wdHJhY2UuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3B0cmFjZS5jCj4gQEAgLTksMTEgKzksMTMgQEAKPiAgCj4gICNpbmNsdWRl
IDxhc20vdmVjdG9yLmg+Cj4gICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4gKyNpbmNsdWRlIDxh
c20vaHdfYnJlYWtwb2ludC5oPgo+ICAjaW5jbHVkZSA8YXNtL3N5c2NhbGwuaD4KPiAgI2luY2x1
ZGUgPGFzbS90aHJlYWRfaW5mby5oPgo+ICAjaW5jbHVkZSA8YXNtL3N3aXRjaF90by5oPgo+ICAj
aW5jbHVkZSA8bGludXgvYXVkaXQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2NvbXBhdC5oPgo+ICsj
aW5jbHVkZSA8bGludXgvaHdfYnJlYWtwb2ludC5oPgo+ICAjaW5jbHVkZSA8bGludXgvcHRyYWNl
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9lbGYuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ3NldC5o
Pgo+IEBAIC0zMzYsMTIgKzMzOCwxMDMgQEAgdm9pZCBwdHJhY2VfZGlzYWJsZShzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKmNoaWxkKQo+ICB7Cj4gIH0KPiAgCj4gKyNpZmRlZiBDT05GSUdfSEFWRV9IV19C
UkVBS1BPSU5UCj4gK3N0YXRpYyB2b2lkIHB0cmFjZV9oYnB0cmlnZ2VyZWQoc3RydWN0IHBlcmZf
ZXZlbnQgKmJwLAo+ICsJCQkJc3RydWN0IHBlcmZfc2FtcGxlX2RhdGEgKmRhdGEsCj4gKwkJCQlz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsJc3RydWN0IGFyY2hfaHdfYnJlYWtwb2ludCAq
YmtwdCA9IGNvdW50ZXJfYXJjaF9icChicCk7Cj4gKwlpbnQgbnVtID0gMDsKPiArCj4gKwlmb3Jj
ZV9zaWdfcHRyYWNlX2Vycm5vX3RyYXAobnVtLCAodm9pZCBfX3VzZXIgKilia3B0LT5hZGRyZXNz
KTsKPiArfQo+ICsKPiArLyoKPiArICogaWR4IHNlbGVjdHMgdGhlIGJyZWFrcG9pbnQgaW5kZXgu
Cj4gKyAqIEJvdGggUFRSQUNFX0dFVEhCUFJFR1MgYW5kIFBUUkFDRV9TRVRIQlBSRUdTIHRyYW5z
ZmVyIHRocmVlIDMyLWJpdCB3b3JkczoKPiArICogYWRkcmVzcyAoMCksIGxlbmd0aCAoMSksIHR5
cGUgKDIpLgo+ICsgKiBJbnN0cnVjdGlvbiBicmVha3BvaW50IGxlbmd0aCBpcyBvbmUgb2YgSFdf
QlJFQUtQT0lOVF9MRU5fWCBvciAwLiAwIHdpbGwKPiArICogZGlzYWJsZSB0aGUgYnJlYWtwb2lu
dC4KPiArICogSW5zdHJ1Y3Rpb24gYnJlYWtwb2ludCB0eXBlIGlzIG9uZSBvZiBIV19CUkVBS1BP
SU5UX1guCj4gKyAqLwo+ICsKPiArc3RhdGljIGxvbmcgcHRyYWNlX2dldGhicHJlZ3Moc3RydWN0
IHRhc2tfc3RydWN0ICpjaGlsZCwgdW5zaWduZWQgbG9uZyBpZHgsCj4gKwkJCSAgICAgIHVuc2ln
bmVkIGxvbmcgX191c2VyICpkYXRhcCkKPiArewo+ICsJc3RydWN0IHBlcmZfZXZlbnQgKmJwOwo+
ICsJdW5zaWduZWQgbG9uZyB1c2VyX2RhdGFbM10gPSB7MH07Cj4gKwo+ICsJaWYgKGlkeCA+PSBS
Vl9NQVhfVFJJR0dFUlMpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsJYnAgPSBjaGlsZC0+
dGhyZWFkLnB0cmFjZV9icHNbaWR4XTsKPiArCj4gKwlpZiAoIUlTX0VSUl9PUl9OVUxMKGJwKSkg
ewo+ICsJCXVzZXJfZGF0YVswXSA9IGJwLT5hdHRyLmJwX2FkZHI7Cj4gKwkJdXNlcl9kYXRhWzFd
ID0gYnAtPmF0dHIuZGlzYWJsZWQgPyAwIDogYnAtPmF0dHIuYnBfbGVuOwo+ICsJCXVzZXJfZGF0
YVsyXSA9IGJwLT5hdHRyLmJwX3R5cGU7Cj4gKwl9Cj4gKwo+ICsJaWYgKGNvcHlfdG9fdXNlcihk
YXRhcCwgdXNlcl9kYXRhLCBzaXplb2YodXNlcl9kYXRhKSkpCj4gKwkJcmV0dXJuIC1FRkFVTFQ7
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBsb25nIHB0cmFjZV9zZXRoYnBy
ZWdzKHN0cnVjdCB0YXNrX3N0cnVjdCAqY2hpbGQsIHVuc2lnbmVkIGxvbmcgaWR4LAo+ICsJCQkg
ICAgICB1bnNpZ25lZCBsb25nIF9fdXNlciAqZGF0YXApCj4gK3sKPiArCXN0cnVjdCBwZXJmX2V2
ZW50ICpicDsKPiArCXN0cnVjdCBwZXJmX2V2ZW50X2F0dHIgYXR0cjsKPiArCXVuc2lnbmVkIGxv
bmcgdXNlcl9kYXRhWzNdOwo+ICsKPiArCWlmIChpZHggPj0gUlZfTUFYX1RSSUdHRVJTKQo+ICsJ
CXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWlmIChjb3B5X2Zyb21fdXNlcih1c2VyX2RhdGEsIGRh
dGFwLCBzaXplb2YodXNlcl9kYXRhKSkpCj4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4gKwo+ICsJYnAg
PSBjaGlsZC0+dGhyZWFkLnB0cmFjZV9icHNbaWR4XTsKPiArCWlmIChJU19FUlJfT1JfTlVMTChi
cCkpCj4gKwkJYXR0ciA9IGJwLT5hdHRyOwo+ICsJZWxzZQo+ICsJCXB0cmFjZV9icmVha3BvaW50
X2luaXQoJmF0dHIpOwo+ICsKPiArCWF0dHIuYnBfYWRkciA9IHVzZXJfZGF0YVswXTsKPiArCWF0
dHIuYnBfbGVuID0gdXNlcl9kYXRhWzFdOwo+ICsJYXR0ci5icF90eXBlID0gdXNlcl9kYXRhWzJd
Owo+ICsJYXR0ci5kaXNhYmxlZCA9ICFhdHRyLmJwX2xlbjsKPiArCj4gKwlpZiAoSVNfRVJSX09S
X05VTEwoYnApKSB7Cj4gKwkJYnAgPSByZWdpc3Rlcl91c2VyX2h3X2JyZWFrcG9pbnQoJmF0dHIs
IHB0cmFjZV9oYnB0cmlnZ2VyZWQsIE5VTEwsCj4gKwkJCQkJICAgY2hpbGQpOwo+ICsJCWlmIChJ
U19FUlIoYnApKQo+ICsJCQlyZXR1cm4gUFRSX0VSUihicCk7Cj4gKwo+ICsJCWNoaWxkLT50aHJl
YWQucHRyYWNlX2Jwc1tpZHhdID0gYnA7Cj4gKwkJcmV0dXJuIDA7Cj4gKwl9IGVsc2Ugewo+ICsJ
CXJldHVybiBtb2RpZnlfdXNlcl9od19icmVha3BvaW50KGJwLCAmYXR0cik7Cj4gKwl9Cj4gK30K
PiArI2VuZGlmCj4gKwo+ICBsb25nIGFyY2hfcHRyYWNlKHN0cnVjdCB0YXNrX3N0cnVjdCAqY2hp
bGQsIGxvbmcgcmVxdWVzdCwKPiAgCQkgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25n
IGRhdGEpCj4gIHsKPiAgCWxvbmcgcmV0ID0gLUVJTzsKPiArCXVuc2lnbmVkIGxvbmcgX191c2Vy
ICpkYXRhcCA9ICh1bnNpZ25lZCBsb25nIF9fdXNlciAqKSBkYXRhOwo+ICAKPiAgCXN3aXRjaCAo
cmVxdWVzdCkgewo+ICsjaWZkZWYgQ09ORklHX0hBVkVfSFdfQlJFQUtQT0lOVAo+ICsJY2FzZSBQ
VFJBQ0VfR0VUSEJQUkVHUzoKPiArCQlyZXQgPSBwdHJhY2VfZ2V0aGJwcmVncyhjaGlsZCwgYWRk
ciwgZGF0YXApOwo+ICsJCWJyZWFrOwo+ICsKPiArCWNhc2UgUFRSQUNFX1NFVEhCUFJFR1M6Cj4g
KwkJcmV0ID0gcHRyYWNlX3NldGhicHJlZ3MoY2hpbGQsIGFkZHIsIGRhdGFwKTsKPiArCQlicmVh
azsKPiArI2VuZGlmCj4gIAlkZWZhdWx0Ogo+ICAJCXJldCA9IHB0cmFjZV9yZXF1ZXN0KGNoaWxk
LCByZXF1ZXN0LCBhZGRyLCBkYXRhKTsKPiAgCQlicmVhazsKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
