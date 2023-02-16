Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F09C636D4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 00:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QYvb4QXh36GhfG9ZLPquU7MiUKKuBvZ6ZxmXeQFrGbI=; b=A04K9plQ5L6PdO
	IoJ0meSDM++ndYDmIQTubQEs1D36/twZCVQsHtFTb05ndMIwLIyBh5Nd34oESZLM+d1DTagP4ElbI
	3KGRvyusuSOtZ5OyHZL8CnnGBiG5TxI2rePkgDdT+4u1fT5nbvb2vl+WtrMdgMJ7bxaHNkh3qpkV6
	Jq4b9W0qLGNsylbyvBK1ZWPdK0BWbjzHdmHzzFoQ0kk8eOnQoAfQfvidE2/rpukbB2Qm/fEp2PYY6
	ZivlGUCLK8T5qCzFlmNXJTGvABQ4LnHzAxHNTaewjGAiSDzGsRnEgVwtTJg0rvIgSm2eFiezYmg7D
	as4WPRlIeDSsSPYcHd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSS2b-0086Q2-Kz; Thu, 16 Feb 2023 00:22:25 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSS2V-0086P4-Ot
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 00:22:23 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-16debd2786aso794305fac.7
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 16:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AMXukqDvX/3C642BYoybg8JEa1hXYfLb8MP0efI+FPc=;
        b=UnPOO69RarNSdV31t1C+rNvSjwYtjMpnsVrccZdF63GYj3sN3k6fLbYWpY59JX9kva
         kLbZtiBZpsysra+84WLoETOkWV5XCh8teIpQb1zXfbUZ1PpkOWATW5mSRq3gy8g75JSW
         b8OV6bHOwIb7wsl7b9G40VTozEKb+sbfJpDfOXi6HmdoFzcYVuFSxYPfi6Fm8pWxPCRv
         kpXXBYOxft9h3NtqrE5nkkESd6lxGRYv99ykNnzf400IAzbRnCN0RTJrleUM/0DL5iES
         TS3fNQvmvVAXmlkticb2d2AwMob5TwtnDDaG2GzG4d4HPH+aesO8Z9/rXslvYTIfxpX9
         2zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AMXukqDvX/3C642BYoybg8JEa1hXYfLb8MP0efI+FPc=;
        b=Nt/hVaCmNecPn91ZJR1Vu9ClBVoAlo/J3sPoG6GDchtAcgvxdoIzs1Omj5yLgJEoWE
         LvZAFeTdRFOq0t8iaZm8/HR29R2Qj3qTkz46a3Z+FJAPKeDsUIyYR7RYFQebQ//hUloG
         dz1QIYrRQE+6DXSXDxWttOoswYqlbHQHm3OnRe80ceHXVVQWXU5u0eBSM5JTi4PBqXKX
         aEP9BcWEarWhn8irN8aaL5kpXJbjtFuq2MJijPHT3SciRNVzFEypiV+5mea7T4PvI0yr
         u3c3JypfQcWk7lIFy+oPidWiZZIxCw9GQBT33yJojwC9O8x9vKCaK3iz7Xzp2h3h9X1N
         yEHA==
X-Gm-Message-State: AO0yUKWRzIpSQF669WKvoc8EgThQo4ZDFzO6SLeVbsyILnK6s853A+Cz
	iaFHeltGp3eUs0i+NPNHHtobwVBhsSA=
X-Google-Smtp-Source: AK7set9irrI40oEZYjRRyk2fUkRIOV2kSHnevv5KDEk1GDlUfpf0Ps/QDvIADtFnWfcvPcFG7I6dmw==
X-Received: by 2002:a05:6870:4191:b0:163:367c:bdb3 with SMTP id y17-20020a056870419100b00163367cbdb3mr2328031oac.42.1676506936772;
        Wed, 15 Feb 2023 16:22:16 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id du25-20020a0568703a1900b0016a310dc4a9sm59727oab.9.2023.02.15.16.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 16:22:16 -0800 (PST)
Message-ID: <a4b42c22-9302-e142-68c2-45703eb7e1c5@roeck-us.net>
Date: Wed, 15 Feb 2023 16:22:13 -0800
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
X-CRM114-CacheID: sfid-20230215_162219_836003_9475B321 
X-CRM114-Status: GOOD (  28.84  )
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

T24gMi8xNS8yMyAxNDowMCwgSGVpa28gU3TDvGJuZXIgd3JvdGU6Cj4gQW0gTWl0dHdvY2gsIDE1
LiBGZWJydWFyIDIwMjMsIDE1OjQzOjEwIENFVCBzY2hyaWViIEhlaWtvIFN0w7xibmVyOgo+PiBI
aSBDb25vciwKPj4KPj4gQW0gTW9udGFnLCAxMy4gRmVicnVhciAyMDIzLCAyMzo0MDozOCBDRVQg
c2NocmllYiBDb25vciBEb29sZXk6Cj4+PiArQ0MgSGVpa28KPj4+Cj4+PiBPbiBTdW4sIEZlYiAx
MiwgMjAyMyBhdCAwMzowODo1NVBNIC0wODAwLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+Pj4+IE9u
IDIvMTIvMjMgMTE6NDcsIENvbm9yIERvb2xleSB3cm90ZToKPj4+Pj4gRnJvbTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4+Pj4KPj4+Pj4gR3VlbnRlciByZXBv
cnRlZCBhIHNwbGF0IGR1cmluZyBib290LCB0aGF0IFNhbXVlbCBwb2ludGVkIG91dCB3YXMgdGhl
Cj4+Pj4+IGxvY2tkZXAgYXNzZXJ0aW9uIGZhaWxpbmcgaW4gcGF0Y2hfaW5zbl93cml0ZSgpOgo+
Pj4+Pgo+Pj4+PiBXQVJOSU5HOiBDUFU6IDAgUElEOiAwIGF0IGFyY2gvcmlzY3Yva2VybmVsL3Bh
dGNoLmM6NjMgcGF0Y2hfaW5zbl93cml0ZSsweDIyMi8weDJmNgo+Pj4+PiBlcGMgOiBwYXRjaF9p
bnNuX3dyaXRlKzB4MjIyLzB4MmY2Cj4+Pj4+ICAgIHJhIDogcGF0Y2hfaW5zbl93cml0ZSsweDIx
ZS8weDJmNgo+Pj4+PiBlcGMgOiBmZmZmZmZmZjgwMDA2OGM2IHJhIDogZmZmZmZmZmY4MDAwNjhj
MiBzcCA6IGZmZmZmZmZmODE4MDNkZjAKPj4+Pj4gICAgZ3AgOiBmZmZmZmZmZjgxYTFhYjc4IHRw
IDogZmZmZmZmZmY4MTgxNGY4MCB0MCA6IGZmZmZmZmZmZmZmZmUwMDAKPj4+Pj4gICAgdDEgOiAw
MDAwMDAwMDAwMDAwMDAxIHQyIDogNGM0NTIwM2E3NjYzNzM2OSBzMCA6IGZmZmZmZmZmODE4MDNl
NDAKPj4+Pj4gICAgczEgOiAwMDAwMDAwMDAwMDAwMDA0IGEwIDogMDAwMDAwMDAwMDAwMDAwMCBh
MSA6IGZmZmZmZmZmZmZmZmZmZmYKPj4+Pj4gICAgYTIgOiAwMDAwMDAwMDAwMDAwMDA0IGEzIDog
MDAwMDAwMDAwMDAwMDAwMCBhNCA6IDAwMDAwMDAwMDAwMDAwMDEKPj4+Pj4gICAgYTUgOiAwMDAw
MDAwMDAwMDAwMDAwIGE2IDogMDAwMDAwMDAwMDAwMDAwMCBhNyA6IDAwMDAwMDAwNTI0NjRlNDMK
Pj4+Pj4gICAgczIgOiBmZmZmZmZmZjgwYjQ4ODljIHMzIDogMDAwMDAwMDAwMDAwMDgyYyBzNCA6
IGZmZmZmZmZmODBiNDg4MjgKPj4+Pj4gICAgczUgOiAwMDAwMDAwMDAwMDAwODI4IHM2IDogZmZm
ZmZmZmY4MTMxYTBhMCBzNyA6IDAwMDAwMDAwMDAwMDBmZmYKPj4+Pj4gICAgczggOiAwMDAwMDAw
MDA4MDAwMjAwIHM5IDogZmZmZmZmZmY4MTMxYTUyMCBzMTA6IDAwMDAwMDAwMDAwMDAwMTgKPj4+
Pj4gICAgczExOiAwMDAwMDAwMDAwMDAwMDBiIHQzIDogMDAwMDAwMDAwMDAwMDAwMSB0NCA6IDAw
MDAwMDAwMDAwMDAwMGQKPj4+Pj4gICAgdDUgOiBmZmZmZmZmZmQ4MTgwMDAwIHQ2IDogZmZmZmZm
ZmY4MTgwM2JjOAo+Pj4+PiBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMDAgYmFkYWRkcjogMDAwMDAw
MDAwMDAwMDAwMCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwMwo+Pj4+PiBbPGZmZmZmZmZmODAwMDY4
YzY+XSBwYXRjaF9pbnNuX3dyaXRlKzB4MjIyLzB4MmY2Cj4+Pj4+IFs8ZmZmZmZmZmY4MDAwNmEz
Nj5dIHBhdGNoX3RleHRfbm9zeW5jKzB4Yy8weDJhCj4+Pj4+IFs8ZmZmZmZmZmY4MDAwM2I4Nj5d
IHJpc2N2X2NwdWZlYXR1cmVfcGF0Y2hfZnVuYysweDUyLzB4OTgKPj4+Pj4gWzxmZmZmZmZmZjgw
MDAzMzQ4Pl0gX2FwcGx5X2FsdGVybmF0aXZlcysweDQ2LzB4ODYKPj4+Pj4gWzxmZmZmZmZmZjgw
YzAyZDM2Pl0gYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMrMHgzYy8weGZhCj4+Pj4+IFs8ZmZmZmZm
ZmY4MGMwM2FkOD5dIHNldHVwX2FyY2grMHg1ODQvMHg1YjgKPj4+Pj4gWzxmZmZmZmZmZjgwYzAw
NzVhPl0gc3RhcnRfa2VybmVsKzB4YTIvMHg4ZjgKPj4+Pj4KPj4+Pj4gVGhpcyBpc3N1ZSB3YXMg
ZXhwb3NlZCBieSA3MDJlNjQ1NTBiMTIgKCJyaXNjdjogZnB1OiBzd2l0Y2ggaGFzX2ZwdSgpIHRv
Cj4+Pj4+IHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KCkiKSwgYXMgaXQgaXMgdGhlIHBhdGNo
aW5nIGluIGhhc19mcHUoKSB0aGF0Cj4+Pj4+IHRyaWdnZXJzIHRoZSBzcGxhdHMgaW4gR3VlbnRl
cidzIHJlcG9ydC4KPj4+Pj4KPj4+Pj4gVGFrZSB0aGUgdGV4dF9tdXRleCBiZWZvcmUgZG9pbmcg
YW55IGNvZGUgcGF0Y2hpbmcgdG8gc2F0aXNmeSBsb2NrZGVwLgo+Pj4+Pgo+Pj4+PiBGaXhlczog
ZmY2ODlmZDIxY2IxICgicmlzY3Y6IGFkZCBSSVNDLVYgU3ZwYm10IGV4dGVuc2lvbiBzdXBwb3J0
IikKPj4+Pj4gRml4ZXM6IGEzNTcwN2MzZDg1MCAoInJpc2N2OiBhZGQgbWVtb3J5LXR5cGUgZXJy
YXRhIGZvciBULUhlYWQiKQo+Pj4+PiBGaXhlczogMWEwZTVkYmQzNzIzICgicmlzY3Y6IHNpZml2
ZTogQWRkIFNpRml2ZSBhbHRlcm5hdGl2ZSBwb3J0cyIpCj4+Pj4+IFJlcG9ydGVkLWJ5OiBHdWVu
dGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4+Pj4+IExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDIzMDIxMjE1NDMzMy5HQTM3NjA0NjlAcm9lY2stdXMubmV0Lwo+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29t
Pgo+Pj4+Cj4+Pj4KPj4+PiBBcHBseWluZyB0aGlzIHBhdGNoIHRvZ2V0aGVyIHdpdGgKPj4+Pgo+
Pj4+IHJpc2N2OiBGaXggZWFybHkgYWx0ZXJuYXRpdmUgcGF0Y2hpbmcKPj4+PiByaXNjdjogRml4
IFpiYiBhbHRlcm5hdGl2ZSBJRHMKPj4+Pgo+Pj4+IF9hbmRfIGRpc2FibGluZyBDT05GSUdfUklT
Q1ZfSVNBX1pCQiBmaXhlcyBhbGwgcHJvYmxlbXMgb2JzZXJ2ZWQgd2l0aAo+Pj4+IHJpc2N2NjQg
Zm9yIG1lLiBXaXRoIHRoYXQsCj4+Pj4KPj4+PiBUZXN0ZWQtYnk6IEd1ZW50ZXIgUm9lY2sgPGxp
bnV4QHJvZWNrLXVzLm5ldD4KPj4+Pgo+Pj4+IFVuZm9ydHVuYXRlbHkgSSBzdGlsbCBzZWUgYm9v
dCBmYWlsdXJlcyB3aGVuIHRyeWluZyB0byBib290IHJpc2N2MzIKPj4+PiBpbWFnZXMsIHNvIHNv
bWV0aGluZyBpcyBzdGlsbCBicm9rZW4uIEkgZG9uJ3Qga25vdyB5ZXQgaWYgdGhhdCBpcwo+Pj4+
IGEgZ2VuZXJpYyBwcm9ibGVtIG9yIGlmIGl0IGlzIHJlbGF0ZWQgdG8gYSByaXNjdiBwYXRjaC4K
Pj4+PiBJIGFtIHN0aWxsIHRyeWluZyB0byB0cmFjayB0aGF0IGRvd24gLi4uCj4+Pgo+Pj4gSGVp
a28sIHdvdWxkIHlvdSBiZSBhYmxlIHRvIGxvb2sgYXQgdGhpcyBwbGVhc2U/Cj4+PiBUaGVyZSdz
IHNvbWUgbW9yZSBpbmZvcm1hdGlvbiBpbiB0aGUgTGluazogYWJvdmUuCj4+Cj4+IGp1c3QgZm9y
IHRoZSByZWNvcmQsIEkgc3RhcnRlZCBsb29raW5nIGludG8gdGhpcyBub3cuCj4+Cj4+IFN0YXJ0
aW5nIHdpdGggbXkgb3duIGNvZGUgWzBdIG9uIHRvcCBvZiA2LjItcmMyIEkgd2FzIGFibGUgdG8g
dmVyaWZ5Cj4+IC0gcWVtdS1yaXNjdjMyIHdpdGhvdXQgemJiCj4+IC0gcWVtdS1yaXNjdjMyIHdp
dGggemJiCj4+IC0gcWVtdS1yaXNjdjY0IHdpdGhvdXQgemJiCj4+IC0gcWVtdS1yaXNjdjY0IHdp
dGggemJiCj4+IHRvIHdvcmsuCj4+Cj4+IFNvIG5leHQgdXAsIEknbGwgbW92ZSBvdmVyIHRvIHRo
ZSBtZXJnZWQgZm9yLW5leHQgYnJhbmNoIHRvIGhvcGVmdWxseQo+PiBzZWUgd2hhdCBjaGFuZ2Vk
IGJldHdlZW4gdGhlIGFib3ZlIGFuZCB0aGUgZm9yLW5leHQgY29kZS4KPiAKPiBTbyBub3cgSSd2
ZSBhbHNvIHRlc3RlZCBQYWxtZXIncyBmb3ItbmV4dCBhdAo+ICAgIGNvbW1pdCBlYzYzMTE5MTll
YTYgKCJNZXJnZSBwYXRjaCBzZXJpZXMgInJpc2N2OiBPcHRpbWl6ZSBmdW5jdGlvbiB0cmFjZSIi
KQo+IAo+IGFnYWluIHdpdGggdGhlIHNhbWUgdmFyaWFudHMKPiAtIHFlbXUtcmlzY3YzMiB3aXRo
b3V0IHpiYgo+IC0gcWVtdS1yaXNjdjMyIHdpdGggemJiCj4gLSBxZW11LXJpc2N2NjQgd2l0aG91
dCB6YmIKPiAtIHFlbXUtcmlzY3Y2NCB3aXRoIHpiYgo+IAo+IEFuZCBhbGwgb2YgdGhlbSBib290
ZWQgZmluZSBpbnRvIGEgbmZzLXJvb3QgKGRlYmlhbiBmb3IgcmlzY3Y2NCBhbmQgYQo+IGJ1aWxk
cm9vdCBmb3IgcmlzY3YzMikuCj4gCj4gSSBldmVuIGZvcmNlZCBhIGJ1ZyBpbnRvIHRoZSB6YmIg
Y29kZSB0byBtYWtlIHN1cmUgdGhlIHBhdGNoaW5nIHdvcmtlZAo+IGNvcnJlY3RseSAod2hlcmUg
dGhlIGtlcm5lbCBmYWlsZWQgYXMgZXhwZWN0ZWQpLgo+IAo+IFFlbXUtdmVyc2lvbiBmb3IgbWUg
d2FzIDcuMi41MCAodjcuMi4wLTc0NC1nNWEzNjMzOTI5YS1kaXJ0eSkKPiAKCldoZXJlIGRpZCB5
b3UgZ2V0IHRoaXMgdmVyc2lvbiBvZiBxZW11IGZyb20gPyBEb2VzIGl0IHBvc3NzaWJseSBpbmNs
dWRlCnpiYiByZWxhdGVkIGZpeGVzL2NoYW5nZXMgb24gdG9wIG9mIHY3LjIuMCA/IEkgdXNlZCB2
Ny4yLjAuIEkgYWxzbyB0cmllZAp0aGUgbWFzdGVyIGJyYW5jaCBhcyBvZiB0b2RheSwgYnV0IHRo
ZXJlIHdhcyBubyBkaWZmZXJlbmNlLgoKQWxzbywgd2hhdCBDIGNvbXBpbGVyIGFuZCBiaW51dGls
cyB2ZXJzaW9uIGRpZCB5b3UgdXNlID8KCj4gSSBkaWQgdHJ5IHRoZSBvbmUgZnJvbSBEZWJpYW4t
c3RhYmxlIChxZW11LTUuMikgYnV0IHRoYXQgd2FzIHRvbyBvbGQgYW5kCj4gZGlkbid0IHN1cHBv
cnQgWmJiIHlldC4KPiAKPiBPbmUgdGhpbmcgb2Ygbm90ZSwgdGhlICJhY3RpdmUiIDMyYml0IGNv
bmZpZyBJIGhhZCwgc29tZWhvdyBkaWRuJ3QgcHJvZHVjZQo+IHdvcmtpbmcgaW1hZ2VzIGFuZCBJ
IG5lZWRlZCB0byBzdGFydCBhIG5ldyBidWlsZCB1c2luZyB0aGUgcnYzMl9kZWZjb25maWcuCj4g
CgpNeSB0ZXN0cyB1c2UgcnYzMl9kZWZjb25maWcgYXMgYmFzZSBmb3IgMzItYml0IHRlc3RzLCB3
aXRoIHZhcmlvdXMgZGVidWcKb3B0aW9ucyBlbmFibGVkIG9uIHRvcC4KCk9rLCBJIGdhdmUgaXQg
YW5vdGhlciB0cnkuIFRoZSBiYWNrdHJhY2VzIGRvIF9ub3RfIGFwcGVhciBpZiBJIGp1c3QKdXNl
IGRlZmNvbmZpZyBhcyBiYXNlLiBJJ2xsIHRyeSB0byBmaW5kIG91dCB3aGF0IGV4YWN0bHkgdHJp
Z2dlcnMgdGhlCnByb2JsZW0uCgpUaGFua3MsCkd1ZW50ZXIKCj4gU28gcmlnaHQgbm93LCBJJ20g
bm90IHN1cmUgd2hhdCBtb3JlIHRvIHRlc3QgdGhvdWdoLgo+IAo+IEhlaWtvCj4gCj4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
