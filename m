Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC11C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K80fpq+faXY91kl/UGpDXnBIKAVG9b+8bbZ6Dz/EqKU=; b=B3MxSy6CfbKh3r
	IpNovnYo7kLyoGMs5XrfAl4XBAmCCDinYU2Z4V3zOZ1vvo0qXiAGA/bytWZGzfsoknmoGV20eAEaR
	ujWh9WBP7FO+PlTBpK0b9qT7qNa88kLmEHJMpqKT7PXjbD3q0d5wk61Hs3pKLOcxN9fpD1e6sdurn
	h6jVuKU4ifeUawc67XeYo9nQ0riz78C+kTCHyegXAh2z3wMdFL7K9J1yIEfVUb8uJrd5IsO2DqWO9
	XRm+wuqQUgjiWnLH9pl2jeLiJMEgK3hsr8uTIp+Rie+CwTovoTSGBw3B8rPYLOANc0OsJXHVLgBzE
	Qy9H7pmcMeRM029aMkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMY2g-004b9H-0F; Mon, 30 Jan 2023 17:34:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXwC-004Xep-Sp
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 17:27:26 +0000
Received: by mail-wm1-x32d.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso3724433wms.5
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 09:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2VAOUAnZrrTaW8atAzm2YZfzH9NyPYsAl1667ENi80=;
        b=YZTDascVmQZqB3c/4sRTKFl51YdSOobEpQyYvVWJDHxbdr+51HsOvDbWgZDJAlwxxU
         1kW0GCyqsz+7tLBi0O19obgVdFbV3SyWwgdHJTYbcLxMhiYKB9C4AiKhdTAIMAnjDHWE
         4zIyP7EyHlc3wUvPuiQ+RWaXwPpz8Z1yNRJJSewe0/SfODzqbcWw+PDSF0muUS9wbbtR
         ZUIB/jdEJoZGh4jCWZ2sWAbF8cYS9j5I2nrBXyLGPUDcXCRMF8urMyaedKIjjgUQxyCy
         vQOjU+S7H1JC5iilU9CIq69NnS0Fap4Cx6gJqvfbdxSXSRb+jcPrhkNHJjA2iM9Deozq
         R4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2VAOUAnZrrTaW8atAzm2YZfzH9NyPYsAl1667ENi80=;
        b=HPITYJWX0O8pQ3TlxS7zWuI0n3KyevBmQ9SOLQf2o+N7etcT+WKN2CuxLYG0avUJAn
         VfKNQ9FYVt9ifYaXzk+E20J/FCsTmOr8i0mmFQQApyyTyLUzyY7NqojCf8IfnLJZL/CC
         RcYU1CKJ9s38mh3/pMwc1mqeV2OjbpzxYwsveoRvaXbokkoBCi48W0Ox44MwVoGJSXSh
         /1rqIOI4Sa7JB1LR4aH6KGtrbw/IvqUep5b/SmGRX6yHyxPACLCvA+jQRA3Y+d+/tbgH
         gHrWkBHu74T9/2P9gwuRGPSp22MxQjiuX5vZvlonPaf17AlYp2kcfaQKgOueHRHNDO85
         83Ow==
X-Gm-Message-State: AFqh2krwAChQf7i1i+XLMs84g25LCDTXG34dwRO7YABiJ4JIuxyk/fHe
	gbzT31JY646KYZXR6JZgmGucMA==
X-Google-Smtp-Source: AMrXdXviQFi3sihPpurt8rdcKqZfVzxFO3/bkpVeQGK/zf7LvG7QPjCQ8MMQgH9HLEbEA7amD+J8DQ==
X-Received: by 2002:a05:600c:c05:b0:3db:3476:6f02 with SMTP id fm5-20020a05600c0c0500b003db34766f02mr36605938wmb.41.1675099639973;
        Mon, 30 Jan 2023 09:27:19 -0800 (PST)
Received: from smtpclient.apple (global-5-143.n-2.net.cam.ac.uk. [131.111.5.143])
        by smtp.gmail.com with ESMTPSA id z24-20020a1cf418000000b003dc36981727sm11203411wma.14.2023.01.30.09.27.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jan 2023 09:27:19 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v1] riscv: support arch_has_hw_pte_young()
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230130104900.muwgikgkvkn2byna@orel>
Date: Mon, 30 Jan 2023 17:27:18 +0000
Cc: Anup Patel <apatel@ventanamicro.com>,
 Jinyu Tang <tjytimi@163.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 yuzhao@google.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>,
 tongtiangen@huawei.com,
 Anup Patel <anup@brainfault.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 falcon@tinylab.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel@vger.kernel.org
Message-Id: <EBC27F74-6AB4-43B3-90B9-107C05467167@jrtc27.com>
References: <20230129064956.143664-1-tjytimi@163.com>
 <CAK9=C2VaxNezv+M=s=ZSA-YDf_17+hcom_z1=_j2YkRHg-yg7Q@mail.gmail.com>
 <20230130104900.muwgikgkvkn2byna@orel>
To: Andrew Jones <ajones@ventanamicro.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_092725_008552_7BBF3931 
X-CRM114-Status: GOOD (  19.37  )
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

T24gMzAgSmFuIDIwMjMsIGF0IDEwOjQ5LCBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWlj
cm8uY29tPiB3cm90ZToKPiAKPiBPbiBNb24sIEphbiAzMCwgMjAyMyBhdCAwMzo1NTo1NVBNICsw
NTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+PiBPbiBTdW4sIEphbiAyOSwgMjAyMyBhdCAxMjoyMSBQ
TSBKaW55dSBUYW5nIDx0anl0aW1pQDE2My5jb20+IHdyb3RlOgo+Pj4gCj4+PiBUaGUgYXJjaF9o
YXNfaHdfcHRlX3lvdW5nKCkgaXMgZmFsc2UgZm9yIHJpc2N2IGJ5IGRlZmF1bHQuIElmIGl0J3MK
Pj4+IGZhbHNlLCBwYWdlIHRhYmxlIHdhbGsgaXMgYWxtb3N0IHNraXBwZWQgZm9yIE1HTFJVIHJl
Y2xhaW0uIEFuZCBpdAo+Pj4gd2lsbCBhbHNvIGNhdXNlIHVzZWxlc3Mgc3RlcCBpbiBfX3dwX3Bh
Z2VfY29weV91c2VyKCkuCj4+PiAKPj4+IFJJU0MtViBQcml2aWxlZ2VkIEJvb2sgc2F5cyB0aGF0
IHJpc2N2IGhhdmUgdHdvIHNjaGVtZXMgdG8gbWFuYWdlIEEKPj4+IGFuZCBEIGJpdC4KPj4+IAo+
Pj4gU28gYWRkIGEgY29uZmlnIGZvciBzZWxlY3RpbmcsIHRoZSBkZWZhdWx0IGlzIHRydWUuIEZv
ciBzaW1wbGUKPj4+IGltcGxlbWVudGF0aW9uIHJpc2N2IENQVSB3aGljaCBqdXN0IGdlbmVyYXRl
IHBhZ2UgZmF1bHQsIHVuc2VsZWN0IGl0Lgo+PiAKPj4gSSB0b3RhbGx5IGRpc2FncmVlIHdpdGgg
dGhpcyBhcHByb2FjaC4KPj4gCj4+IEFsbW9zdCBhbGwgZXhpc3RpbmcgUklTQy1WIHBsYXRmb3Jt
cyBkb24ndCBoYXZlIEhXIHN1cHBvcnQKPj4gUFRFLkEgYW5kIFBURS5EIHVwZGF0ZXMuCj4+IAo+
PiBXZSB3YW50IHRoZSBzYW1lIGtlcm5lbCBpbWFnZSB0byBydW4gSFcgd2l0aC93aXRob3V0IFBU
RS5BCj4+IGFuZCBQVEUuRCB1cGRhdGVzIHNvIGtjb25maWcgYmFzZWQgYXBwcm9hY2ggaXMgbm90
IGdvaW5nIHRvCj4+IGZseS4KPj4gCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6IEppbnl1IFRhbmcg
PHRqeXRpbWlAMTYzLmNvbT4KPj4+IC0tLQo+Pj4gYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAg
ICAgICAgfCAxMCArKysrKysrKysrCj4+PiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUu
aCB8ICA3ICsrKysrKysKPj4+IDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+Pj4g
Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmln
Cj4+PiBpbmRleCBlMmI2NTYwNDNhYmYuLjE3YzgyODg1NTQ5YyAxMDA2NDQKPj4+IC0tLSBhL2Fy
Y2gvcmlzY3YvS2NvbmZpZwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiBAQCAtMTgw
LDYgKzE4MCwxNiBAQCBjb25maWcgUEFHRV9PRkZTRVQKPj4+ICAgICAgICBkZWZhdWx0IDB4ODAw
MDAwMDAgaWYgNjRCSVQgJiYgIU1NVQo+Pj4gICAgICAgIGRlZmF1bHQgMHhmZjYwMDAwMDAwMDAw
MDAwIGlmIDY0QklUCj4+PiAKPj4+ICtjb25maWcgQVJDSF9IQVNfSEFSRFdBUkVfUFRFX1lPVU5H
Cj4+PiArICAgICAgIGJvb2wgIkhhcmR3YXJlIFNldCBQVEUgQWNjZXNzIEJpdCIKPj4+ICsgICAg
ICAgZGVmYXVsdCB5Cj4+PiArICAgICAgIGhlbHAKPj4+ICsgICAgICAgICBTZWxlY3QgaWYgaGFy
ZHdhcmUgc2V0IEEgYml0IHdoZW4gUFRFIGlzIGFjY2Vzc2VkLiBUaGUgZGVmYXVsdCBpcwo+Pj4g
KyAgICAgICAgICdZJywgYmVjYXVzZSBtb3N0IFJJU0MtViBDUFUgaGFyZHdhcmUgY2FuIG1hbmFn
ZSBBIGFuZCBEIGJpdC4KPj4+ICsgICAgICAgICBCdXQgUklTQy1WIG1heSBoYXZlIHNpbXBsZSBp
bXBsZW1lbnRhdGlvbiB0aGF0IGRvIG5vdCBzdXBwb3J0Cj4+PiArICAgICAgICAgaGFyZHdhcmUg
c2V0IEEgYml0IGJ1dCBvbmx5IGdlbmVyYXRlIHBhZ2UgZmF1bHQsIGZvciB0aGF0IGNhc2UganVz
dAo+Pj4gKyAgICAgICAgIHVuc2VsZWN0IGl0Lgo+Pj4gKwo+Pj4gY29uZmlnIEtBU0FOX1NIQURP
V19PRkZTRVQKPj4+ICAgICAgICBoZXgKPj4+ICAgICAgICBkZXBlbmRzIG9uIEtBU0FOX0dFTkVS
SUMKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+PiBpbmRleCA0ZWJhOWE5OGQwZTMuLjFk
YjU0YWI0ZTFiYSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCj4+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4gQEAgLTUz
Miw2ICs1MzIsMTMgQEAgc3RhdGljIGlubGluZSBpbnQgcHRlcF9jbGVhcl9mbHVzaF95b3VuZyhz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4+ICAgICAgICAgKi8KPj4+ICAgICAgICByZXR1
cm4gcHRlcF90ZXN0X2FuZF9jbGVhcl95b3VuZyh2bWEsIGFkZHJlc3MsIHB0ZXApOwo+Pj4gfQo+
Pj4gKyNpZmRlZiBDT05GSUdfQVJDSF9IQVNfSEFSRFdBUkVfUFRFX1lPVU5HCj4+IAo+Pj4gKyNk
ZWZpbmUgYXJjaF9oYXNfaHdfcHRlX3lvdW5nIGFyY2hfaGFzX2h3X3B0ZV95b3VuZwo+Pj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBhcmNoX2hhc19od19wdGVfeW91bmcodm9pZCkKPj4+ICt7Cj4+PiAr
ICAgICAgIHJldHVybiB0cnVlOwo+PiAKPj4gRHJvcCB0aGUga2NvbmZpZyBvcHRpb24gQVJDSF9I
QVNfSEFSRFdBUkVfUFRFX1lPVU5HCj4+IGFuZCBpbnN0ZWFkIHVzZSBjb2RlIHBhdGNoaW5nIHRv
IHJldHVybiB0cnVlIG9ubHkgd2hlbiBTdmFkdQo+PiBJU0EgZXh0ZW5zaW9uIGlzIGF2YWlsYWJs
ZSBpbiBEVCBJU0Egc3RyaW5nLgo+IAo+IEluZGVlZC4gSSBzaG91bGQgaGF2ZSBjaGVja2VkIGlm
IHRoZXJlIHdhcyBhbiBleHRlbnNpb24gZm9yIHRoaXMKPiBmaXJzdC4gSXQgY3Jvc3NlZCBteSBt
aW5kIHRoYXQgd2Ugc2hvdWxkIG9ubHkgYmUgZW5hYmxpbmcgZmVhdHVyZXMKPiB3aGVuIHRoZSBl
eHRlbnNpb25zIGFyZSBwcmVzZW50LCBidXQgbG9va2luZyBhdCB0aGUgcHJpdmlsZWdlZCBtYW51
YWwKPiBpc24ndCBzdWZmaWNpZW50IHRvIGxlYXJuIGFib3V0IHRoZSBTdmFkdSBleHRlbnNpb24u
IEkgc2hvdWxkIGhhdmUKPiBjaGVja2VkIGh0dHBzOi8vd2lraS5yaXNjdi5vcmcvZGlzcGxheS9I
T01FL1NwZWNpZmljYXRpb24rU3RhdHVzCj4gCj4gQW55d2F5LCBJIHJldHJhY3QgbXkgci1iIGFu
ZCBhZ3JlZSB3aXRoIEFudXAuCgpTdmFkdSBpcyBhIGJpdCBvZiBhIG1lc3MsIGZvciB5ZWFycyBp
dOKAmXMgYmVlbiBsZWdhbCB0byBpbXBsZW1lbnQKaGFyZHdhcmUgQS9EIHRyYWNraW5nIGFuZCBz
dWNoIGltcGxlbWVudGF0aW9ucyBleGlzdCAoaXTigJlzIHdoYXQgUUVNVQpoYXMgZG9uZSBmb3Ig
bWFueSB5ZWFycywgYW5kIEkga25vdyBvZiBhbiBGUEdBLWJhc2VkIGltcGxlbWVudGF0aW9uCnRo
YXQgZG9lcyBpdCB0b28pLCB5ZXQgUlZBMjBTNjQgb3V0bGF3cyB0aGF0IGJ5IHJlcXVpcmluZyB3
aGF0IGl0IGNhbGxzClNzcHRlYWQgYW5kIFN2YWR1IGdldHMgaW50cm9kdWNlZCB0byByZS1hbGxv
dyB0aGF0IGJlaGF2aW91ciBnYXRlZApiZWhpbmQgYSBDU1IgYml0LgoKSmVzcwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
