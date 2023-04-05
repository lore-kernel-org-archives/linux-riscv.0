Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA60C77B60
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QipjgnRbGpOKs9YGPkOOPDzltd7DfqMkgA74SxYum+8=; b=ym5UO2neCVU6w7
	YkTX4szJAkDEammc/6Qt5hau7tTf1pxdP5OY0X8JARO9lKfCIQo7C3YoNUUHcK6cXLmeCpeDidwfl
	Asi/kTpvbRkuC+Gy//GbNHeHPG7FyuWon2CyAS+ciuXl/L48q1zhN8vkfPxxzyAjnCYQiBr2zzhQm
	QYpnkVWusR96hHMepB6Be9T6uY+S0xl6dfjxxWfblq3AdOObWGy3hfGhx5kY+RGRsTrEv/5U1OyEI
	ZIyljtgLZI9Lty9hLHq8taBXnjFZ8Gf86OvG1WCEtn5f5K3DeXIGiGn6gwasEx3uyR5EChK18vOiJ
	ETLe5TUGlcnhEylb8b5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1Qk-004Hn5-0L;
	Wed, 05 Apr 2023 11:35:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1Qh-004HmA-35
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 11:35:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id j24so35918749wrd.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 04:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680694553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FlvKXsC33Y3r1CipsD3fypO8/mtd2VSfqMY0AAuYEJU=;
        b=lORbIDSoT/048s2YK0Ooqaq76pp9nO16IgSl7E0zcw4519qRfB2EB9bS33CYOOkI5J
         pfTaClxlRxqDfVRYTx2Z+UgdqAZLwhJB9A5pB14jcytveOARMJzLG5xpjgyCQ8NG+8lz
         ev3K604YpC9YuL/r728Z1Y9hLVtLsaw+N/7x4L7nFGT0fiuzIfjnVXthx/T5amkZgCq0
         pEEuVse58fqlV2CyoHyzTOON/kzCpp1NDkIarzhDQElXYaKK062+3PuMCp88nlhfHLQh
         IU1Fh5+UUIInU8suruQpN1cboZlK59YnMqsD0tiYx/ZtqdSFCdDLQzmdD790LguYejUB
         v8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680694553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlvKXsC33Y3r1CipsD3fypO8/mtd2VSfqMY0AAuYEJU=;
        b=mJHGO+7eEE46dQc7ZKfoA0edxXmQ7lVMXeTS2v9KfUVvkDKFc/X3BaY6GwIw+JB+iJ
         tdWLpWRu6FdwE6xEQPbYolzvJWuCoSnjIGjzIf+alGIh7fL3eg5DAQajhITYPfNHm4aY
         ikYexws6ChIUlEFRKl0LZV7ht+yacWUtI3Elsd1JMKQ1RT3GywWksqh+R7fb/hwaR3YU
         Shsz6AS+XNjgbNOvZf5LQJrG/WUF0CrXHhC/Epyd01CkQDMcvQ7UZxgOB+rrJvnRLbjY
         cVHfgWmrNd0qM2Uv88kLQ/MbXU9+iTHpcJdR0rvbJUHxrzOB28pkCbQv8FGky8y2vVGu
         xCgA==
X-Gm-Message-State: AAQBX9ffktAyUf3GKRQzOpFETyhwaHaWk42vdkjFZ12juNIi4oUpV32O
	VpVFlPu4wIrJw50l9tU2RXJsIYnT8Ws=
X-Google-Smtp-Source: AKy350aseZzBCum6L3ZdzJV0ccP/niUOapvEPnQGYI92PSTLWqPEIZgktt6CkrodRO1mno8ot6F6IQ==
X-Received: by 2002:adf:f004:0:b0:2cf:f01f:ed89 with SMTP id j4-20020adff004000000b002cff01fed89mr4390917wro.24.1680694553507;
        Wed, 05 Apr 2023 04:35:53 -0700 (PDT)
Received: from [192.168.237.204] (s-8d3a2aa4.on.site.uni-stuttgart.de. [141.58.42.164])
        by smtp.gmail.com with ESMTPSA id r7-20020a5d4987000000b002ceacff44c7sm14806432wrq.83.2023.04.05.04.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 04:35:53 -0700 (PDT)
Message-ID: <bedd7426-5875-dbd7-38fe-2e943c7109f8@gmail.com>
Date: Wed, 5 Apr 2023 13:35:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V4 22/23] platform/surface: Disable for RISC-V
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Len Brown <lenb@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Weili Qian <qianweili@huawei.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Marc Zyngier <maz@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-23-sunilvl@ventanamicro.com>
 <0c433e15-640e-280f-fcb0-a8fe081d1bcc@gmail.com>
 <ZC1XUdD3DFnNauQ2@sunil-laptop>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <ZC1XUdD3DFnNauQ2@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_043556_010143_CD7321D8 
X-CRM114-Status: GOOD (  18.48  )
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

T24gNC81LzIzIDEzOjExLCBTdW5pbCBWIEwgd3JvdGU6Cj4gT24gV2VkLCBBcHIgMDUsIDIwMjMg
YXQgMTE6MzM6MDBBTSArMDIwMCwgTWF4aW1pbGlhbiBMdXogd3JvdGU6Cj4+IE9uIDQvNC8yMyAy
MDoyMCwgU3VuaWwgViBMIHdyb3RlOgo+Pj4gV2l0aCBDT05GSUdfQUNQSSBlbmFibGVkIGZvciBS
SVNDLVYsIHRoaXMgZHJpdmVyIGdldHMgZW5hYmxlZAo+Pj4gaW4gYWxsbW9kY29uZmlnIGJ1aWxk
LiBIb3dldmVyLCBSSVNDLVYgZG9lc24ndCBzdXBwb3J0IHN1Yi13b3JkCj4+PiBhdG9taWNzIHdo
aWNoIGlzIHVzZWQgYnkgdGhpcyBkcml2ZXIuIER1ZSB0byB0aGlzLCB0aGUgYnVpbGQgZmFpbHMK
Pj4+IHdpdGggYmVsb3cgZXJyb3IuCj4+Pgo+Pj4gSW4gZnVuY3Rpb24gw6LigqzLnHNzaF9zZXFf
bmV4dMOi4oKs4oSiLAo+Pj4gICAgICAgaW5saW5lZCBmcm9tIMOi4oKsy5xzc2FtX3JlcXVlc3Rf
d3JpdGVfZGF0YcOi4oKs4oSiIGF0IGRyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9y
L2NvbnRyb2xsZXIuYzoxNDgzOjg6Cj4+PiAuLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBl
cy5oOjM5OTo0NTogZXJyb3I6IGNhbGwgdG8gw6LigqzLnF9fY29tcGlsZXRpbWVfYXNzZXJ0XzMz
NcOi4oKs4oSiIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBCVUlMRF9CVUcgZmFpbGVk
Cj4+PiAgICAgMzk5IHwgICAgICAgICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNn
LCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+Pj4gICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+Pj4gLi9pbmNsdWRlL2xp
bnV4L2NvbXBpbGVyLmg6Nzg6NDU6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8gw6LigqzL
nHVubGlrZWx5w6LigqzihKIKPj4+ICAgICAgNzggfCAjIGRlZmluZSB1bmxpa2VseSh4KSAgICBf
X2J1aWx0aW5fZXhwZWN0KCEhKHgpLCAwKQo+Pj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+Pj4gLi8uL2luY2x1ZGUvbGludXgvY29tcGls
ZXJfdHlwZXMuaDozODc6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xfX2Nv
bXBpbGV0aW1lX2Fzc2VydMOi4oKs4oSiCj4+PiAgICAgMzg3IHwgICAgICAgICBfX2NvbXBpbGV0
aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgcHJlZml4LCBzdWZmaXgpCj4+PiAgICAgICAgIHwg
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgo+Pj4gLi8uL2luY2x1ZGUvbGludXgvY29tcGls
ZXJfdHlwZXMuaDozOTk6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xfY29t
cGlsZXRpbWVfYXNzZXJ0w6LigqzihKIKPj4+ICAgICAzOTkgfCAgICAgICAgIF9jb21waWxldGlt
ZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19DT1VOVEVS
X18pCj4+PiAgICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+Cj4+PiAuL2luY2x1
ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDD
ouKCrMucY29tcGlsZXRpbWVfYXNzZXJ0w6LigqzihKIKPj4+ICAgICAgMzkgfCAjZGVmaW5lIEJV
SUxEX0JVR19PTl9NU0coY29uZCwgbXNnKSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNn
KQo+Pj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn5+fn5+fgo+Pj4gLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjU5OjIxOiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6LigqzLnEJVSUxEX0JVR19PTl9NU0fDouKCrOKEogo+
Pj4gICAgICA1OSB8ICNkZWZpbmUgQlVJTERfQlVHKCkgQlVJTERfQlVHX09OX01TRygxLCAiQlVJ
TERfQlVHIGZhaWxlZCIpCj4+PiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+Cj4+PiAuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oOjMzNToxNzog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xCVUlMRF9CVUfDouKCrOKEogo+Pj4g
ICAgIDMzNSB8ICAgICAgICAgICAgICAgICBCVUlMRF9CVUcoKTsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+ICAgICAgICAgfCAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+Cj4+PiAuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oOjM0NDozMDog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xfX2NtcHhjaGfDouKCrOKEogo+Pj4g
ICAgIDM0NCB8ICAgICAgICAgKF9fdHlwZW9mX18oKihwdHIpKSkgX19jbXB4Y2hnKChwdHIpLCAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+ICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fgo+Pj4gLi9pbmNsdWRlL2xpbnV4L2F0b21pYy9hdG9taWMt
aW5zdHJ1bWVudGVkLmg6MTkxNjo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6LigqzL
nGFyY2hfY21weGNoZ8Oi4oKs4oSiCj4+PiAgICAxOTE2IHwgICAgICAgICBhcmNoX2NtcHhjaGco
X19haV9wdHIsIF9fVkFfQVJHU19fKTsgXAo+Pj4gICAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+
fn5+Cj4+PiBkcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9jb250cm9sbGVyLmM6
NjE6MzI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDDouKCrMucY21weGNoZ8Oi4oKs4oSi
Cj4+PiAgICAgIDYxIHwgICAgICAgICB3aGlsZSAodW5saWtlbHkoKHJldCA9IGNtcHhjaGcoJmMt
PnZhbHVlLCBvbGQsIG5ldykpICE9IG9sZCkpIHsKPj4+ICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fgo+Pj4KPj4+IFNvLCBkaXNhYmxlIHRoaXMgZHJpdmVy
IGZvciBSSVNDLVYgZXZlbiB3aGVuIEFDUEkgaXMgZW5hYmxlZCBmb3Igbm93Lgo+Pgo+PiBDT05G
SUdfU1VSRkFDRV9QTEFURk9STVMgc2hvdWxkIGJlIGVuYWJsZWQgZm9yIEFSTTY0IHx8IFg4NiB8
fCBDT01QSUxFX1RFU1Qgb25seSwKPj4gc28gSSBndWVzcyB0aGUgaXNzdWUgb25seSBoYXBwZW5z
IHdoZW4gY29tcGlsaW5nIHdpdGggdGhlIGxhdHRlciBlbmFibGVkPwo+Pgo+PiBJJ20gbm90IGF3
YXJlIG9mIGFueSBjdXJyZW50IHBsYW5zIG9mIE1TIHRvIHJlbGVhc2UgUklTQy1WLWJhc2VkIFN1
cmZhY2UKPj4gZGV2aWNlcywgc28geW91IGNvdWxkIG1heWJlIGFsc28ganVzdCBleHBsaWNpdGx5
IGRpc2FibGUgQ09ORklHX1NVUkZBQ0VfUExBVEZPUk1TLgo+PiBJbiBhbnkgY2FzZSwgSSBkb24n
dCBzZWUgYW55IGlzc3VlcyB3aXRoIGRpc2FibGluZyB0aGUgd2hvbGUgcGxhdGZvcm0vc3VyZmFj
ZQo+PiBvciBvbmx5IGluZGl2aWR1YWwgZHJpdmVycyBmb3IgUklTQy1WLCBzbyBmb3IgZWl0aGVy
IHNvbHV0aW9uOgo+Pgo+PiBBY2tlZC1ieTogTWF4aW1pbGlhbiBMdXogPGx1em1heGltaWxpYW5A
Z21haWwuY29tPgo+Pgo+IEhpIE1heGltaWxpYW4sCj4gCj4gVGhhbmtzIS4gWWVzLCBDT01QSUxF
X1RFU1QgZ2V0cyBlbmFibGVkIGZvciBhbGxtb2Rjb25maWcgYnVpbGRzLiBTaW5jZQo+IHRoZSB3
aG9sZSBpbnRlbnRpb24gb2YgQ09NUElMRV9URVNUIGFwcGVhcnMgdG8gYmUgYWJsZSB0byBjb21w
aWxlLXRlc3QKPiBkcml2ZXJzIG9uIGEgcGxhdGZvcm0gdGhhbiB0aGV5IGFyZSBzdXBwb3NlZCB0
byBiZSB1c2VkLCBJIHRoaW5rIGl0IGlzCj4gYmV0dGVyIG5vdCB0byBza2lwIHdob2xlIHNldCBv
ZiBkcml2ZXJzIGJ1dCBvbmx5IHRoYXQgd2hpY2ggY2FuIG5vdCBidWlsZC4KPiBTbywgSSBwcmVm
ZXIgdG8ga2VlcCB0aGlzIGNoYW5nZSBhcyBpcy4KCkhpIFN1bmlsLAoKV2hhdCBJIHdhbnRlZCB0
byBzYXkgd2l0aCBteSBwcmV2aW91cyBtYWlsOiBJJ20gZmFpcmx5IGNvbmZpZGVudCB0aGF0CnBs
YXRmb3JtL3N1cmZhY2UgZHJpdmVycyB3aWxsIG5vdCBiZSBhY3RpdmVseSB1c2VkIG9uIFJJU0Mt
ViBoYXJkd2FyZSBhbnkKdGltZSBzb29uIChub3Qgc3VyZSBpZiB0aGF0IGNhbWUgb3ZlciBpbiB0
aGlzIHdheSkuIEJ1dCB3aGF0ZXZlciB5b3Uvb3RoZXJzCnByZWZlciwgSSdtIGhhcHB5IHdpdGgg
ZWl0aGVyLgoKQmVzdCByZWdhcmRzLApNYXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
