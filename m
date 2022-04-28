Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4033DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ati+z41ui2URntW/tVtVq6rh52DsLdfIFyQ08bYFcOE=; b=IaDAqjxJsD+y8w
	Elf67cjCIvkewT93G2n77vHAJ83915Rtz3wCxqZhjMH1ZOA9gYWSlw9+2i4f2cOsZwABBkqofcJZu
	fc4flCQCzry4IZBepHNiKctoBrVVTPKAEXf5ePgv6W6EXo5oeH91eOCa3Im026nBQPe+mTAcqsA6Q
	aVaBKH9u8d17XfgPdGD3s9Apb78uR1y7CwlVlZ20a3IondaMdbeb1xv0PqeR5dXiGgTtpfegmCT2C
	wUwpG1cBxTWg1oBKSyKO4zKYH+lc79Tk0GvyzENW3wR3DsyPzampLDuo08mO9UjhdygAmnrjTCfY0
	4ZRWIrzDh8axBF2RWKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkCBZ-008fG2-7S; Thu, 28 Apr 2022 22:00:29 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkC9d-008eJW-DB
 for linux-riscv@lists.infradead.org; Thu, 28 Apr 2022 21:58:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 n32-20020a05600c3ba000b00393ea7192faso3753082wms.2
 for <linux-riscv@lists.infradead.org>; Thu, 28 Apr 2022 14:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MaZRQfW9ohJvJKT8fr3IXNeI9D+wbcHeG3e4b7bWPpU=;
 b=eOgofK72gkImxI4hgh9lOd09qexGIWZcOs7UK2cyYSGjNF0yp6mnirCmber1YJRVTG
 3f8EI3KDwDDT17DUTUKwEdYqcJdqZz6ukrjMB//rxC4s0+XDuBiGCChZeCoYWnizmKbH
 GCbxNtFjkHDIv3VYfPsrz/xsqGmKFSJjVPTRTCOF2m2FxHYp+M2A7oUUzhzZySjRwDNC
 rT1QDMixTawsiqGq+5s9CHeiD9qK4iZzt1NA/LNKcSFF25ofHK5AP4lVs3Eg8ODdsyyO
 gVx7EbS79Ddy0eRVONG28S9yEj/VUYRIO4v9RPjmQBvWWx7dDseRlNySkU7wqh7rUNYw
 SuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MaZRQfW9ohJvJKT8fr3IXNeI9D+wbcHeG3e4b7bWPpU=;
 b=meu5f+Yci5wNcBWsOwzpI+H7U7hqKq7HRE3sAPkqtmxXi01uiOCTlCRKMVj1RPmWCC
 W7DhW5tzTIK2tsJie+f8uKSKNyTkprTm6KVcj2gUnr8eEpUtELJeD1pgj7BsyccpRttu
 hOHYQSubMw6+seIA7STzuEkFTG3/pIHp/96lUy3HP5Pi5wW/Cgvn2R+sT9lKWtG2GjYq
 LmLccZBGzFPYbkj8wnXvUip4gs7FVMweldqU5Tb9Pa43zqXmxdh/QlEXSdlxg+7gNG0C
 bYBOshIPeO8yn5khb2iE46JCGUy7VH3mUWPxOR7ISkbfyTyheAICEHCT1rZZo8a6z3SO
 JcXw==
X-Gm-Message-State: AOAM533gr0MmMOmWemNvQc3nk8UCDUiMGoiAteaTbfyIUsJU3FcUPEU2
 5Llm1X0AHAutpwuhVxoYMFiYWQ==
X-Google-Smtp-Source: ABdhPJyocbVaYjH3Q5BHW2MBvbFSgOv9X9OMx5MciBZIpQi1J0XZQ8PqOUZVsiDWIcJ6gETxB3vHlQ==
X-Received: by 2002:a05:600c:206:b0:38e:b6b4:a2d6 with SMTP id
 6-20020a05600c020600b0038eb6b4a2d6mr245232wmi.156.1651183100938; 
 Thu, 28 Apr 2022 14:58:20 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.156.77])
 by smtp.gmail.com with ESMTPSA id
 o9-20020adf8b89000000b0020adeb916d8sm896152wra.30.2022.04.28.14.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 14:58:20 -0700 (PDT)
Message-ID: <4eec9cb6-c80e-a5e5-995b-7568d568ad26@conchuod.ie>
Date: Thu, 28 Apr 2022 22:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, Conor.Dooley@microchip.com
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu
References: <mhng-525e0b77-f9af-4cba-a985-f8872835574e@palmer-ri-x1c9>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <mhng-525e0b77-f9af-4cba-a985-f8872835574e@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_145829_690931_93DB94EC 
X-CRM114-Status: GOOD (  21.70  )
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

T24gMjgvMDQvMjAyMiAyMjo0OCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gVGh1LCAyNCBN
YXIgMjAyMiAwMjozNzoyOSBQRFQgKC0wNzAwKSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20g
d3JvdGU6Cj4+Cj4+IE9uIDIyLzAzLzIwMjIgMTM6MjgsIE5pY2sgS29zc2lmaWRpcyB3cm90ZToK
Pj4+IEluIGNhc2UgdGhlIERUQiBwcm92aWRlZCBieSB0aGUgYm9vdGxvYWRlci9Cb290Uk9NIGlz
IGJlZm9yZSB0aGUga2VybmVsCj4+PiBpbWFnZSBvciBvdXRzaWRlIC9tZW1vcnksIHdlIHdvbid0
IGJlIGFibGUgdG8gYWNjZXNzIGl0IHRocm91Z2ggdGhlCj4+PiBsaW5lYXIgbWFwcGluZywgYW5k
IGdldCBhIHNlZ2ZhdWx0IG9uIHNldHVwX2FyY2goKS4gQ3VycmVudGx5IE9wZW5TQkkKPj4+IHJl
bG9jYXRlcyBEVEIgYnV0IHRoYXQncyBub3QgYWx3YXlzIHRoZSBjYXNlIChlLmcuIGlmIEZXX0pV
TVBfRkRUX0FERFIKPj4+IGlzIG5vdCBzcGVjaWZpZWQpLCBhbmQgaXQncyBhbHNvIG5vdCB0aGUg
bW9zdCBwb3J0YWJsZSBhcHByb2FjaCBzaW5jZQo+Pj4gdGhlIGRlZmF1bHQgRldfSlVNUF9GRFRf
QUREUiBvZiB0aGUgZ2VuZXJpYyBwbGF0Zm9ybSByZWxvY2F0ZXMgdGhlIERUQgo+Pj4gYXQgYSBz
cGVjaWZpYyBvZmZzZXQgdGhhdCBtYXkgbm90IGJlIGF2YWlsYWJsZS4gVG8gYXZvaWQgdGhpcyBz
aXR1YXRpb24KPj4+IGNvcHkgRFRCIHNvIHRoYXQgaXQncyB2aXNpYmxlIHRocm91Z2ggdGhlIGxp
bmVhciBtYXBwaW5nLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE5pY2sgS29zc2lmaWRpcyA8bWlj
a0BpY3MuZm9ydGguZ3I+Cj4+Cj4+IEFsYmVpdCBpbiBhIGJhY2twb3J0LCBJIHRlc3RlZCB0aGlz
IG9uIGEgUG9sYXJGaXJlIFNvQyBiYXNlZCBib2FyZC4KPj4gU28gSSBndWVzcywgVGVzdGVkLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IAo+IE15IHNjcmlw
dHMgZG9uJ3QgcGljayB0aGVzZSB1cCB1bmxlc3MgdGhleSdyZSBvbiB0aGVpciBvd24gbGluZSwg
bm90IHN1cmUgaWYgdGhhdCdzIHRvbyBjb25zZXJ2YXRpdmUgYnV0IGl0J3Mgb24gcHVycG9zZS7C
oCBJIGp1c3Qgc29ydCBvZiBzdHVtYmxlZCBpbnRvIHRoaXMgb25lIHNvIGl0J3MgaW4uCgpVaGgs
IEkgY2hlY2tlZCBhbmQgYjQgZG9lc24ndCBwaWNrIGl0IHVwIGVpdGhlci4gSSdtIG5vdCBvdmVy
bHkKY29uY2VybmVkIGFib3V0IGdldHRpbmcgImNyZWRpdCIgZm9yIHRlc3RpbmcgaXQsIG1vcmUg
aW50ZXJlc3RlZAppbiBwb2ludGluZyBvdXQgdGhhdCBpdCBkb2VzIHNvbHZlIGEgcmVhbCBpc3N1
ZSB0aGF0IEkgaGF2ZSBydW4KaW50byBpbiBjYXNlIHlvdSB3ZXJlIGxvb2tpbmcgZm9yIGluY2Vu
dGl2ZSB0byBhcHBseSBpdCA6KQpJIHJlYWxpc2VkIGltbWVkaWF0ZWx5IGFmdGVyIHNlbmRpbmcg
dGhhdCBpdCB3YXMgbGlrZWx5IGFuIGludmFsaWQKdGFnLCBidXQgZmlndXJlZCBpdCdkIHNlcnZl
IHRoYXQgcHVycG9zZSBlaXRoZXIgd2F5LgoKVGhhbmtzLApDb25vci4KCj4gCj4+Cj4+IEFuZCBh
IGxvdCBjbGVhbmVyIHRoYW4gdXNpbmcgY3JlYXRlX3BnZF9tYXBwaW5nIGluIHNldHVwX3ZtX2Zp
bmFsIHRvIGRvIGl0IDopCj4+Cj4+IFRoYW5rcywKPj4gQ29ub3IuCj4+Cj4+PiAtLS0KPj4+IMKg
IGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgMjEgKysrKysrKysrKysrKysrKysrKy0tCj4+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+
Pj4gaW5kZXggMGQ1ODgwMzJkLi42OTdhOWFlZDQgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2
L21tL2luaXQuYwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4+IEBAIC0yMDYsOCAr
MjA2LDI1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ib290bWVtKHZvaWQpCj4+PiDCoMKg
wqDCoMKgwqAgKiBlYXJseV9pbml0X2ZkdF9yZXNlcnZlX3NlbGYoKSBzaW5jZSBfX3BhKCkgZG9l
cwo+Pj4gwqDCoMKgwqDCoMKgICogbm90IHdvcmsgZm9yIERUQiBwb2ludGVycyB0aGF0IGFyZSBm
aXhtYXAgYWRkcmVzc2VzCj4+PiDCoMKgwqDCoMKgwqAgKi8KPj4+IC3CoMKgwqAgaWYgKCFJU19F
TkFCTEVEKENPTkZJR19CVUlMVElOX0RUQikpCj4+PiAtwqDCoMKgwqDCoMKgwqAgbWVtYmxvY2tf
cmVzZXJ2ZShkdGJfZWFybHlfcGEsIGZkdF90b3RhbHNpemUoZHRiX2Vhcmx5X3ZhKSk7Cj4+PiAr
wqDCoMKgIGlmICghSVNfRU5BQkxFRChDT05GSUdfQlVJTFRJTl9EVEIpKSB7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICogSW4gY2FzZSB0aGUgRFRCIGlzIG5v
dCBsb2NhdGVkIGluIGEgbWVtb3J5IHJlZ2lvbiB3ZSB3b24ndAo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqAgKiBiZSBhYmxlIHRvIGxvY2F0ZSBpdCBsYXRlciBvbiB2aWEgdGhlIGxpbmVhciBtYXBwaW5n
IGFuZAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBnZXQgYSBzZWdmYXVsdCB3aGVuIGFjY2Vzc2lu
ZyBpdCB2aWEgX192YShkdGJfZWFybHlfcGEpLgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBUbyBh
dm9pZCB0aGlzIHNpdHVhdGlvbiBjb3B5IERUQiB0byBhIG1lbW9yeSByZWdpb24uCj4+PiArwqDC
oMKgwqDCoMKgwqDCoCAqIE5vdGUgdGhhdCBtZW1ibG9ja19waHlzX2FsbG9jIHdpbGwgYWxzbyBy
ZXNlcnZlIERUQiByZWdpb24uCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGlmICghbWVtYmxvY2tfaXNfbWVtb3J5KGR0Yl9lYXJseV9wYSkpIHsKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNpemVfdCBmZHRfc2l6ZSA9IGZkdF90b3RhbHNpemUoZHRiX2Vh
cmx5X3ZhKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBoeXNfYWRkcl90IG5ld19kdGJf
ZWFybHlfcGEgPSBtZW1ibG9ja19waHlzX2FsbG9jKGZkdF9zaXplLCBQQUdFX1NJWkUpOwo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCAqbmV3X2R0Yl9lYXJseV92YSA9IGVhcmx5X21l
bXJlbWFwKG5ld19kdGJfZWFybHlfcGEsIGZkdF9zaXplKTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1lbWNweShuZXdfZHRiX2Vhcmx5X3ZhLCBkdGJfZWFybHlfdmEsIGZkdF9z
aXplKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVhcmx5X21lbXVubWFwKG5ld19kdGJf
ZWFybHlfdmEsIGZkdF9zaXplKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9kdGJfZWFy
bHlfcGEgPSBuZXdfZHRiX2Vhcmx5X3BhOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0gZWxzZQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVtYmxvY2tfcmVzZXJ2ZShkdGJfZWFybHlfcGEsIGZk
dF90b3RhbHNpemUoZHRiX2Vhcmx5X3ZhKSk7Cj4+PiArwqDCoMKgIH0KPj4+IMKgIMKgwqDCoMKg
wqAgZWFybHlfaW5pdF9mZHRfc2Nhbl9yZXNlcnZlZF9tZW0oKTsKPj4+IMKgwqDCoMKgwqAgZG1h
X2NvbnRpZ3VvdXNfcmVzZXJ2ZShkbWEzMl9waHlzX2xpbWl0KTsKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
