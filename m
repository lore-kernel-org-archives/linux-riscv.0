Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026FAC76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 09:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IO/clUmAwWcUGOJrDr2xO0kwUdFOLBjIzj4h4bWTc9A=; b=WmB2w6Cwd7aIpE
	Tzuj/kbwJXWhk6U0ScwdOa/gZQk4p3+noLgQWywj8hCaLEn1jm+Ky8vmQtIqZurM6Gp1uslpujv+r
	lPTXPtqvtpx0L9qVvf3V6wo/qLf7KjzXw1pirfZsX89yaJQl1PjCnH7NS+esxM7as3PkpFprDnFcL
	ZREfW/j57Ul8ZS4SU7tr+zIHu2zfSv3nsWFUrjUAqw4DKrt65x6J6hrBMme+APO4Fcs5y+wpjTn5s
	lVSMB1RwMglH1E8KPDBLLBw85YV9pZTZEfHr83ivYkX5Fmi8x8PzRH35pXfU99LJHWYtoHaeYdnCz
	9R8BdvRRp80/GTobjs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzVq-003yFE-2B;
	Wed, 05 Apr 2023 09:33:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzVn-003yDz-2G
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 09:33:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id l12so35495410wrm.10
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 02:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680687182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+m6lntKXuHckes3DfOCLKyfUm4RY1tSieGlGMdRdeCg=;
        b=ovQ3eb1eiAQwqbo5Ec1rsGTce+Hz+32WrCzTCV6aKN7VzI1t4WTQw+oi5Fjm2tx9ED
         U2PLKAiosMdQeR7Kkq4DSD9rqJjesQPtz0iZSEb7eXbSbTNSow2QT+s6rufHSiuQosKa
         BBYiEAEslILdu1TIp0BUOeiJSb1WUTPzbKIV26qCpu4lIhlb/AcewWwRltj5jdlAzBZ5
         /n6V3UzQce7EFM/A/DlgNUEX5Iq0veIkKxpe/lw9Z594oiA4n/TAkEb7ebKyjKkVcFUq
         JcXG+bAOF2T3hOwYu4OUr5B6YAZw0RkrUJEmwBPsQiySJx/lS0eoCWjMoLpGDbByT/Kf
         MxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680687182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+m6lntKXuHckes3DfOCLKyfUm4RY1tSieGlGMdRdeCg=;
        b=J0Pf1CZE6bwXwHEZGdmzCynyAbBtuBEQ1j5w4qgaYc6KEqC4L2uoUfBcBI00KApPne
         6WzRLVQ+OgLRtPLTuhLLog5tKwcQbQ+wElP7QE+ITzzCrBUhdlokXfQos26O1erQCuxQ
         Ng0/487HE5z+wFO8+LwNc3LKqrxEsIf+9MZhiBEU+sDTVc/Yod05sgi1KTn7sn2g0trj
         iIsMb9k+I255DclYiSmb1+YxocmS1Ni+8BS8tJv+Z14QMqJBiImmtVxysWXeH2qpCAIw
         +wQNtUUulcxBQbh/uAq2u6PZfmcOn280Rx+tHGzSdCynQHFKCEJEpkCmwG5LyJ4bwUNB
         h3qA==
X-Gm-Message-State: AAQBX9dkkaTWhMOBqxJX/vktpvjs5ywMJ7LpUgibVrcbuvpNminVG07I
	ljWNIMbuTaJbO1+0g4ZfC/c=
X-Google-Smtp-Source: AKy350bEmXKhbpOLml2JKednF6JyosoF9/Y0Oyj1dYtb90pMMFwBNblSBshHAYOgh5VmCXkMUWMlIQ==
X-Received: by 2002:adf:dc01:0:b0:2cf:9889:8428 with SMTP id t1-20020adfdc01000000b002cf98898428mr3327565wri.35.1680687181685;
        Wed, 05 Apr 2023 02:33:01 -0700 (PDT)
Received: from [192.168.2.202] (pd9e5a520.dip0.t-ipconnect.de. [217.229.165.32])
        by smtp.gmail.com with ESMTPSA id y5-20020a1c4b05000000b003ede06f3178sm1599550wma.31.2023.04.05.02.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 02:33:01 -0700 (PDT)
Message-ID: <0c433e15-640e-280f-fcb0-a8fe081d1bcc@gmail.com>
Date: Wed, 5 Apr 2023 11:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V4 22/23] platform/surface: Disable for RISC-V
To: Sunil V L <sunilvl@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-crypto@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
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
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20230404182037.863533-23-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_023303_761600_66B2BA27 
X-CRM114-Status: GOOD (  20.08  )
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

T24gNC80LzIzIDIwOjIwLCBTdW5pbCBWIEwgd3JvdGU6Cj4gV2l0aCBDT05GSUdfQUNQSSBlbmFi
bGVkIGZvciBSSVNDLVYsIHRoaXMgZHJpdmVyIGdldHMgZW5hYmxlZAo+IGluIGFsbG1vZGNvbmZp
ZyBidWlsZC4gSG93ZXZlciwgUklTQy1WIGRvZXNuJ3Qgc3VwcG9ydCBzdWItd29yZAo+IGF0b21p
Y3Mgd2hpY2ggaXMgdXNlZCBieSB0aGlzIGRyaXZlci4gRHVlIHRvIHRoaXMsIHRoZSBidWlsZCBm
YWlscwo+IHdpdGggYmVsb3cgZXJyb3IuCj4gCj4gSW4gZnVuY3Rpb24gw6LigqzLnHNzaF9zZXFf
bmV4dMOi4oKs4oSiLAo+ICAgICAgaW5saW5lZCBmcm9tIMOi4oKsy5xzc2FtX3JlcXVlc3Rfd3Jp
dGVfZGF0YcOi4oKs4oSiIGF0IGRyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL2Nv
bnRyb2xsZXIuYzoxNDgzOjg6Cj4gLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDoz
OTk6NDU6IGVycm9yOiBjYWxsIHRvIMOi4oKsy5xfX2NvbXBpbGV0aW1lX2Fzc2VydF8zMzXDouKC
rOKEoiBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHIGZhaWxlZAo+ICAg
IDM5OSB8ICAgICAgICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21w
aWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKPiAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAuL2luY2x1ZGUvbGludXgvY29tcGlsZXIu
aDo3ODo0NTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDDouKCrMucdW5saWtlbHnDouKC
rOKEogo+ICAgICA3OCB8ICMgZGVmaW5lIHVubGlrZWx5KHgpICAgIF9fYnVpbHRpbl9leHBlY3Qo
ISEoeCksIDApCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCj4gLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozODc6OTogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xfX2NvbXBpbGV0aW1lX2Fzc2VydMOi4oKs
4oSiCj4gICAgMzg3IHwgICAgICAgICBfX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1z
ZywgcHJlZml4LCBzdWZmaXgpCj4gICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
fgo+IC4vLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6Mzk5Ojk6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyDDouKCrMucX2NvbXBpbGV0aW1lX2Fzc2VydMOi4oKs4oSiCj4gICAg
Mzk5IHwgICAgICAgICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBp
bGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9fKQo+ICAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fgo+IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozOTozNzogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xjb21waWxldGltZV9hc3NlcnTDouKCrOKEogo+ICAg
ICAzOSB8ICNkZWZpbmUgQlVJTERfQlVHX09OX01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fz
c2VydCghKGNvbmQpLCBtc2cpCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5o
OjU5OjIxOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6LigqzLnEJVSUxEX0JVR19PTl9N
U0fDouKCrOKEogo+ICAgICA1OSB8ICNkZWZpbmUgQlVJTERfQlVHKCkgQlVJTERfQlVHX09OX01T
RygxLCAiQlVJTERfQlVHIGZhaWxlZCIpCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+Cj4gLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaDozMzU6
MTc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDDouKCrMucQlVJTERfQlVHw6LigqzihKIK
PiAgICAzMzUgfCAgICAgICAgICAgICAgICAgQlVJTERfQlVHKCk7ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgIHwgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fgo+IC4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmg6MzQ0OjMwOiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6LigqzLnF9fY21weGNoZ8Oi4oKs4oSiCj4gICAgMzQ0
IHwgICAgICAgICAoX190eXBlb2ZfXygqKHB0cikpKSBfX2NtcHhjaGcoKHB0ciksICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2F0b21pYy9hdG9taWMtaW5zdHJ1bWVudGVk
Lmg6MTkxNjo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6LigqzLnGFyY2hfY21weGNo
Z8Oi4oKs4oSiCj4gICAxOTE2IHwgICAgICAgICBhcmNoX2NtcHhjaGcoX19haV9wdHIsIF9fVkFf
QVJHU19fKTsgXAo+ICAgICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9wbGF0
Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvY29udHJvbGxlci5jOjYxOjMyOiBub3RlOiBpbiBleHBh
bnNpb24gb2YgbWFjcm8gw6LigqzLnGNtcHhjaGfDouKCrOKEogo+ICAgICA2MSB8ICAgICAgICAg
d2hpbGUgKHVubGlrZWx5KChyZXQgPSBjbXB4Y2hnKCZjLT52YWx1ZSwgb2xkLCBuZXcpKSAhPSBv
bGQpKSB7Cj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4K
PiAKPiBTbywgZGlzYWJsZSB0aGlzIGRyaXZlciBmb3IgUklTQy1WIGV2ZW4gd2hlbiBBQ1BJIGlz
IGVuYWJsZWQgZm9yIG5vdy4KCkNPTkZJR19TVVJGQUNFX1BMQVRGT1JNUyBzaG91bGQgYmUgZW5h
YmxlZCBmb3IgQVJNNjQgfHwgWDg2IHx8IENPTVBJTEVfVEVTVCBvbmx5LApzbyBJIGd1ZXNzIHRo
ZSBpc3N1ZSBvbmx5IGhhcHBlbnMgd2hlbiBjb21waWxpbmcgd2l0aCB0aGUgbGF0dGVyIGVuYWJs
ZWQ/CgpJJ20gbm90IGF3YXJlIG9mIGFueSBjdXJyZW50IHBsYW5zIG9mIE1TIHRvIHJlbGVhc2Ug
UklTQy1WLWJhc2VkIFN1cmZhY2UKZGV2aWNlcywgc28geW91IGNvdWxkIG1heWJlIGFsc28ganVz
dCBleHBsaWNpdGx5IGRpc2FibGUgQ09ORklHX1NVUkZBQ0VfUExBVEZPUk1TLgpJbiBhbnkgY2Fz
ZSwgSSBkb24ndCBzZWUgYW55IGlzc3VlcyB3aXRoIGRpc2FibGluZyB0aGUgd2hvbGUgcGxhdGZv
cm0vc3VyZmFjZQpvciBvbmx5IGluZGl2aWR1YWwgZHJpdmVycyBmb3IgUklTQy1WLCBzbyBmb3Ig
ZWl0aGVyIHNvbHV0aW9uOgoKQWNrZWQtYnk6IE1heGltaWxpYW4gTHV6IDxsdXptYXhpbWlsaWFu
QGdtYWlsLmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFt
aWNyby5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9L
Y29uZmlnIHwgMiArLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdh
dG9yL0tjb25maWcgYi9kcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9LY29uZmln
Cj4gaW5kZXggYzExNGY5ZGQ1ZmUxLi44OGFmYzM4ZmZkYzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvcGxh
dGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL0tjb25maWcKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIG1l
bnVjb25maWcgU1VSRkFDRV9BR0dSRUdBVE9SCj4gICAJdHJpc3RhdGUgIk1pY3Jvc29mdCBTdXJm
YWNlIFN5c3RlbSBBZ2dyZWdhdG9yIE1vZHVsZSBTdWJzeXN0ZW0gYW5kIERyaXZlcnMiCj4gICAJ
ZGVwZW5kcyBvbiBTRVJJQUxfREVWX0JVUwo+IC0JZGVwZW5kcyBvbiBBQ1BJCj4gKwlkZXBlbmRz
IG9uIEFDUEkgJiYgIVJJU0NWCj4gICAJc2VsZWN0IENSQ19DQ0lUVAo+ICAgCWhlbHAKPiAgIAkg
IFRoZSBTdXJmYWNlIFN5c3RlbSBBZ2dyZWdhdG9yIE1vZHVsZSAoU3VyZmFjZSBTQU0gb3IgU1NB
TSkgaXMgYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
