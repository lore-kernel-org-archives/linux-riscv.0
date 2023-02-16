Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36851C64ED8
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Httf5dBOBhAKQ0Md9uY6pCoO+OKJNhYSOkalK0SI9Co=; b=ie7DBp+EkaqQ/3
	FiNnELD1wQj58hMTGOMoU3+yHw71BZDFW+eGH6o7vy0IrXW/0W0zXL113/dhxkw8CuUDf4mRLEKAl
	UOczo0wntIOImiWvrkKr8v4u3rOK3cMPat34MFpy/K8YuHwUX2sU4Ek1cXAEcVmmduLkTV/VmszJe
	tqdztLK/qnIp4oZwRG2i2ueu2paXQljJuqvoXp6qTPk7GOXZ+QCS3fFXwOVzaTMI/eC0G1T2tHmfg
	ZNp5gBfTxAgMW8b787IIdc6Ym6JqxrNyWPc1wx0ejlktpe+rk/aeyh/hTSrYDplZCySs+ev+w7WBG
	+bxudvCz0AhAbJYJN6Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSgGp-00Atmd-Ck; Thu, 16 Feb 2023 15:34:03 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSgGm-00Atku-Fl
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 15:34:01 +0000
Received: by mail-oi1-x22f.google.com with SMTP id w11so2020616oiv.5
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 07:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EyzxZhqh6YfkyJvAQfK+TjUN2QvpPZ3g8rfS+Zqgu80=;
        b=NKqyZi6SU+hYRN9sBC0DKa67QByz61rim64w0zLXwj2jTyNCafdtTBeqbGPAhv80Gh
         bSllxp8xNVJ8Lt0mvM0hD0NhliiTvtjx9L0noOZ+NbEIdHy3opepcLaPNmnBTZ8cBNKv
         pnfy7n3ccS5BRW+LvWpcHG4IoFQATGX+n6aiDwjj5uTyvVBaRXFb1nhzAb1r3mw1+N7W
         IcBK0Fk2puGXsViD7hDdhrh89WgzKSm6c1qF4Y8ZEWHO0+hv2S0VWaDS8b+YOdvJOFO/
         GQvzFZK6Kn4d+bKzMH3Tb8ZWih/cjrKU2aKouKoz/GvKhCn+cx7+leK3SgO2lBCWFY7M
         ZihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EyzxZhqh6YfkyJvAQfK+TjUN2QvpPZ3g8rfS+Zqgu80=;
        b=SEMHstm0qh9JdtUUOyMcDY7QMbEI2pn+DjgQ5wyJ0sl42g264QbG/hUOry7vUzp9Tx
         LuFuXwWt+p6H9MUupcAEoEA8waGEU+ukM0fSuMyXHbWAeNNKaj3vyN7yF58P9nNSbbvm
         zmQk5XISlUQ5Uwi3dvN/BdCDZUxfZyQPC033LRQv5TFJdgJjDOEaPFCZ7Xso2xvKl0Ix
         DkPzE+fzljvVZUVQku03bB4Me1n8OernQMvjRe6h6VzhUdbcbUUkznU/OIO5Qef6rj7P
         dVbtUeopqNONvbobqyRKWhGfJkCDanqHcayB49k83QPlJSysYY6X2OQvEjqt1wzGfskA
         1hdQ==
X-Gm-Message-State: AO0yUKVKOTb3VCUJDIn/3WUZpz+PyQqBHMyTO/aUn+i5JALwd7fKG81H
	yqQiO5F/KwilvZUqnualCUI=
X-Google-Smtp-Source: AK7set9Co1Se/I9FuolqXeZ+2ay8FitWhV4owZdfa6ZcXz1G1cuoPT+2kdO2KXeBLKhQhFbXpIOMjg==
X-Received: by 2002:aca:2202:0:b0:378:648:afec with SMTP id b2-20020aca2202000000b003780648afecmr3113820oic.30.1676561638265;
        Thu, 16 Feb 2023 07:33:58 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v25-20020a0568301bd900b0068bbf5f2e49sm756780ota.37.2023.02.16.07.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 07:33:57 -0800 (PST)
Message-ID: <479cbefe-7b19-9d2d-4a3c-2bf25e479ce4@roeck-us.net>
Date: Thu, 16 Feb 2023 07:33:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>,
 samuel@sholland.org, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
References: <20230212194735.491785-1-conor@kernel.org> <Y+q8ZnZ2A8g7BNdS@spud>
 <1944134.usQuhbGJ8B@diego> <45316784.fMDQidcC6G@diego>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1] RISC-V: take text_mutex during alternative patching
In-Reply-To: <45316784.fMDQidcC6G@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_073400_563836_37002D60 
X-CRM114-Status: GOOD (  16.43  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMi8xNS8yMyAxNDowMCwgSGVpa28gU3TDvGJuZXIgd3JvdGU6ClsgLi4uIF0KPiAKPiBTbyBu
b3cgSSd2ZSBhbHNvIHRlc3RlZCBQYWxtZXIncyBmb3ItbmV4dCBhdAo+ICAgIGNvbW1pdCBlYzYz
MTE5MTllYTYgKCJNZXJnZSBwYXRjaCBzZXJpZXMgInJpc2N2OiBPcHRpbWl6ZSBmdW5jdGlvbiB0
cmFjZSIiKQo+IAo+IGFnYWluIHdpdGggdGhlIHNhbWUgdmFyaWFudHMKPiAtIHFlbXUtcmlzY3Yz
MiB3aXRob3V0IHpiYgo+IC0gcWVtdS1yaXNjdjMyIHdpdGggemJiCj4gLSBxZW11LXJpc2N2NjQg
d2l0aG91dCB6YmIKPiAtIHFlbXUtcmlzY3Y2NCB3aXRoIHpiYgo+IAo+IEFuZCBhbGwgb2YgdGhl
bSBib290ZWQgZmluZSBpbnRvIGEgbmZzLXJvb3QgKGRlYmlhbiBmb3IgcmlzY3Y2NCBhbmQgYQo+
IGJ1aWxkcm9vdCBmb3IgcmlzY3YzMikuCj4gCj4gSSBldmVuIGZvcmNlZCBhIGJ1ZyBpbnRvIHRo
ZSB6YmIgY29kZSB0byBtYWtlIHN1cmUgdGhlIHBhdGNoaW5nIHdvcmtlZAo+IGNvcnJlY3RseSAo
d2hlcmUgdGhlIGtlcm5lbCBmYWlsZWQgYXMgZXhwZWN0ZWQpLgo+IAo+IFFlbXUtdmVyc2lvbiBm
b3IgbWUgd2FzIDcuMi41MCAodjcuMi4wLTc0NC1nNWEzNjMzOTI5YS1kaXJ0eSkKPiAKPiBJIGRp
ZCB0cnkgdGhlIG9uZSBmcm9tIERlYmlhbi1zdGFibGUgKHFlbXUtNS4yKSBidXQgdGhhdCB3YXMg
dG9vIG9sZCBhbmQKPiBkaWRuJ3Qgc3VwcG9ydCBaYmIgeWV0Lgo+IAo+IE9uZSB0aGluZyBvZiBu
b3RlLCB0aGUgImFjdGl2ZSIgMzJiaXQgY29uZmlnIEkgaGFkLCBzb21laG93IGRpZG4ndCBwcm9k
dWNlCj4gd29ya2luZyBpbWFnZXMgYW5kIEkgbmVlZGVkIHRvIHN0YXJ0IGEgbmV3IGJ1aWxkIHVz
aW5nIHRoZSBydjMyX2RlZmNvbmZpZy4KPiAKPiBTbyByaWdodCBub3csIEknbSBub3Qgc3VyZSB3
aGF0IG1vcmUgdG8gdGVzdCB0aG91Z2guCj4gCgpBbm90aGVyIGV4YW1wbGU6CgotIGJ1aWxkIGRl
ZmNvbmZpZwotIHJ1bgogICBxZW11LXN5c3RlbS1yaXNjdjY0IC1NIHZpcnQgLW0gNTEyTSAtbm8t
cmVib290IC1rZXJuZWwgYXJjaC9yaXNjdi9ib290L0ltYWdlIFwKICAgICAtc25hcHNob3QgLWRl
dmljZSB2aXJ0aW8tYmxrLWRldmljZSxkcml2ZT1kMCAtZHJpdmUgZmlsZT1yb290ZnMuZXh0Mixp
Zj1ub25lLGlkPWQwLGZvcm1hdD1yYXcgXAogICAgIC1hcHBlbmQgInJvb3Q9L2Rldi92ZGEgY29u
c29sZT10dHlTMCwxMTUyMDAgZWFybHljb249dWFydDgyNTAsbW1pbywweDEwMDAwMDAwLDExNTIw
MCIgXAogICAgIC1ub2dyYXBoaWMgLW1vbml0b3Igbm9uZQoKV2l0aCBDT05GSUdfUklTQ1ZfSVNB
X1pCQj15LCB0aGF0IHJlc3VsdHMgaW4KClsgICAgMC44MTgyNjNdIC9kZXYvcm9vdDogQ2FuJ3Qg
b3BlbiBibG9ja2RldgpbICAgIDAuODE4ODU2XSBWRlM6IENhbm5vdCBvcGVuIHJvb3QgZGV2aWNl
ICIvZGV2L3ZkYSIgb3IgdW5rbm93bi1ibG9jaygwLDApOiBlcnJvciAtNgpbICAgIDAuODE5MTc3
XSBQbGVhc2UgYXBwZW5kIGEgY29ycmVjdCAicm9vdD0iIGJvb3Qgb3B0aW9uOyBoZXJlIGFyZSB0
aGUgYXZhaWxhYmxlIHBhcnRpdGlvbnM6ClsgICAgMC44MTk4MDhdIGZlMDAgICAgICAgICAgIDE2
Mzg0IHZkYQpbICAgIDAuODE5OTQ0XSAgZHJpdmVyOiB2aXJ0aW9fYmxrClsgICAgMC44MjA1MzRd
IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBWRlM6IFVuYWJsZSB0byBtb3VudCByb290IGZz
IG9uIHVua25vd24tYmxvY2soMCwwKQpbICAgIDAuODIxMTAxXSBDUFU6IDAgUElEOiAxIENvbW06
IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA2LjIuMC1yYzgtbmV4dC0yMDIzMDIxNi0wMDAwMi1nODAz
MzI4MjVlMjQwICM0ClsgICAgMC44MjE2NzJdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxx
ZW11IChEVCkKWyAgICAwLjgyMjA1MF0gQ2FsbCBUcmFjZToKWyAgICAwLjgyMjQyN10gWzxmZmZm
ZmZmZjgwMDA1M2U0Pl0gZHVtcF9iYWNrdHJhY2UrMHgxYy8weDI0ClsgICAgMC44MjI4MzRdIFs8
ZmZmZmZmZmY4MDdmOTBlND5dIHNob3dfc3RhY2srMHgyYy8weDM4ClsgICAgMC44MjMwODVdIFs8
ZmZmZmZmZmY4MDgwM2FlYT5dIGR1bXBfc3RhY2tfbHZsKzB4M2MvMHg1NApbICAgIDAuODIzMzUx
XSBbPGZmZmZmZmZmODA4MDNiMTY+XSBkdW1wX3N0YWNrKzB4MTQvMHgxYwpbICAgIDAuODIzNjAx
XSBbPGZmZmZmZmZmODA3Zjk0NGM+XSBwYW5pYysweDEwMi8weDI5ZQpbICAgIDAuODIzODM0XSBb
PGZmZmZmZmZmODBhMDE1ZTI+XSBtb3VudF9ibG9ja19yb290KzB4MThjLzB4MjNlClsgICAgMC44
MjQxNDhdIFs8ZmZmZmZmZmY4MGEwMTg3Yz5dIG1vdW50X3Jvb3QrMHgxZTgvMHgyMTgKWyAgICAw
LjgyNDM5OF0gWzxmZmZmZmZmZjgwYTAxOWVlPl0gcHJlcGFyZV9uYW1lc3BhY2UrMHgxNDIvMHgx
ODQKWyAgICAwLjgyNDY1NV0gWzxmZmZmZmZmZjgwYTAxMTgyPl0ga2VybmVsX2luaXRfZnJlZWFi
bGUrMHgyMzYvMHgyNWEKWyAgICAwLjgyNDkzNF0gWzxmZmZmZmZmZjgwODA0NjAyPl0ga2VybmVs
X2luaXQrMHgxZS8weDEwYQpbICAgIDAuODI1MjAxXSBbPGZmZmZmZmZmODAwMDM1NjA+XSByZXRf
ZnJvbV9leGNlcHRpb24rMHgwLzB4MTYKWyAgICAwLjgyNjE4MF0gLS0tWyBlbmQgS2VybmVsIHBh
bmljIC0gbm90IHN5bmNpbmc6IFZGUzogVW5hYmxlIHRvIG1vdW50IHJvb3QgZnMgb24gdW5rbm93
bi1ibG9jaygwLDApIF0tLS0KClRoaXMgd29ya3MgZmluZSBpZiBDT05GSUdfUklTQ1ZfSVNBX1pC
QiBpcyBub3QgZW5hYmxlZC4KClRlc3RlZCB3aXRoIGdjYyAxMS4zLCBiaW51dGlscyAyLjM5LCBx
ZW11IHY3LjIuMCBhbmQgcWVtdSBidWlsdCBmcm9tIG1haW5saW5lLgoKR3VlbnRlcgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
