Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE08CDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbnyodVuKLgdSsOaBVtrCAqNaGh05FcyfZR6KF88L60=; b=Uf/LDIMGUmJrU1
	mYIfMDITj0G0W9X56D3KMNqX3ioLGXs+ZTgNcHc1MnDjwstxKWqLTdokgChf+TDbn3xsON7e/UbJa
	KtEOcDsDgQj1TmAX+Ssy79cHPfiALaV0AILS7qtlIWovpTAqpU6wSkwc6BQFitLJ3xiQHD6BJWrQ5
	LLWzRmkBa316nybeH4kQ9Wq5MBI7AZwFQphnZ2VJVPIY9CLJtlPAiJb+y8WMCxMWN+DD1pKgbDVrJ
	KAgAHl6RN9wzeAKxa1SmiOMF0kV0itwPJTanC4h0uatlfV2AwF92zvPla9vGHNnRIUeo0DiBC2LGM
	IsRc3odXGkR1knyGyo8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPcN-00Gs7F-0L;
	Thu, 19 Oct 2023 09:47:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtPcH-00Gs57-2o
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 09:46:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32d971adc2cso543509f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697708813; x=1698313613; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gSJI0J4GVtq5z4H+Knjyf89xMlTd2iwihqRslO1XxI=;
        b=NlwxtSV5yYP6svEtAjc0UrYJWUyPCJqh+MiU0qzso8g5JHvSXhfLT+aUIkaC4GknXT
         pdIYFJWbFqF8QpIyRSYY4vIJx4Pa4f8jp1dNtSbT1OdiBsXiN2MV6rzIj/q0M+2IDTTg
         ywUJbRRVGad+Y0PNQe3NANpHMZcisZC1UX6TRqs+Yn5SlxV6F0unDWcMuk0ANEFQdoSY
         2TW8z4ibABm5rhPY//kuncfWE0Bqx0QtWGo+yyoPSg+yzInBFbR4Souuw5/wWAsA29Cx
         9PLhS2zFRQkiogs8WgIJCIzJLAqF087t6ivyKHHTSovS3SOpNP9fZVhbvIIo9415zLjm
         docQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697708813; x=1698313613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gSJI0J4GVtq5z4H+Knjyf89xMlTd2iwihqRslO1XxI=;
        b=CQfyYY3DA7et5NHnKO0K2ub/fO1uR+s8btkbNyVMDUDu0YUJbjNJojDl5+24VEzhqI
         qs3/MCa/upaLrKraN9Ief2Oqfeic5noPUEllEokio6JxMYXQczS3UhqgaXnaYuLWSGrl
         cZq4f1MkKVdjYGgq6yi2avOf95qK1vi6ExlXbhufu8hMCcrvJ630IcIyQ8gBlyzygqvm
         iiiKDHDNQq3v/m5J8Y8H4e700TT4oQTT6hCzRK78rRnKbx+LfCPabniI5+PjT6qiChEv
         f334YOi3MP75G3VebVDF0RqYUkHD3aTaaNYIiSzmmhFcqvy188djaLluvdvjkmTYbFZh
         qS0Q==
X-Gm-Message-State: AOJu0YyTp5qHbyBr4xchvI2a2IaL8YLu07i/yNIXbt96awlqyuF2rvhT
	9VECa/FfMQd+TNptHfV7udcd5vwV3R2w1508zpIEcw==
X-Google-Smtp-Source: AGHT+IEp9cwDS7FugsmOGBik6CpcSD683Pjyk9iGSH5JgL5wJaPC9ldFPHVkXXRlgk5VZqa1+0FRyg==
X-Received: by 2002:a5d:5956:0:b0:32d:d8ea:47ac with SMTP id e22-20020a5d5956000000b0032dd8ea47acmr1140369wri.0.1697708812764;
        Thu, 19 Oct 2023 02:46:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6933:1fe3:b858:3dde? ([2a01:e0a:999:a3a0:6933:1fe3:b858:3dde])
        by smtp.gmail.com with ESMTPSA id z3-20020adfe543000000b0031f82743e25sm4053835wrm.67.2023.10.19.02.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 02:46:51 -0700 (PDT)
Message-ID: <0b2cbc89-7892-4c43-898c-03757eaaf3b7@rivosinc.com>
Date: Thu, 19 Oct 2023 11:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
Content-Language: en-US
To: Evan Green <evan@rivosinc.com>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Jones <ajones@ventanamicro.com>, Samuel Ortiz <sameo@rivosinc.com>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
 <20231018-flagpole-footpad-07a6228485f3@spud>
 <CALs-HsteDO0PvAKKQje7wU0f4z8w2V3f7WiHh5+LvQeVaSua1w@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CALs-HsteDO0PvAKKQje7wU0f4z8w2V3f7WiHh5+LvQeVaSua1w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_024657_912625_045E51CD 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxOC8xMC8yMDIzIDE5OjQ1LCBFdmFuIEdyZWVuIHdyb3RlOgo+IE9uIFdlZCwgT2N0IDE4
LCAyMDIzIGF0IDEwOjM34oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90
ZToKPj4KPj4gT24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgMDY6MzM6MzRQTSArMDEwMCwgQ29ub3Ig
RG9vbGV5IHdyb3RlOgo+Pj4gT24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgMTA6MjQ6MTVBTSAtMDcw
MCwgRXZhbiBHcmVlbiB3cm90ZToKPj4+PiBPbiBUdWUsIE9jdCAxNywgMjAyMyBhdCA2OjE14oCv
QU0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPj4+Pj4KPj4+
Pj4gRmFjdG9yaXplIElTQSBleHRlbnNpb24gcmVwb3J0aW5nIGJ5IHVzaW5nIGEgbWFjcm8gcmF0
aGVyIHRoYW4KPj4+Pj4gY29weS9wYXN0aW5nIGV4dGVuc2lvbiBuYW1lcy4gVGhpcyB3aWxsIGFs
bG93IGFkZGluZyBuZXcgZXh0ZW5zaW9ucyBtb3JlCj4+Pj4+IGVhc2lseS4KPj4+Pj4KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+Pj4+
PiAtLS0KPj4+Pj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jIHwgMzIgKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0KPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAxNCBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N5c19yaXNjdi5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPj4+
Pj4gaW5kZXggNDczMTU5YjVmMzAzLi5lMjA3ODc0ZTY4NmUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4+Pj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3N5c19yaXNjdi5jCj4+Pj4+IEBAIC0xNDUsMjAgKzE0NSwyNCBAQCBzdGF0aWMgdm9pZCBod3By
b2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+Pj4+PiAgICAgICAgIGZv
cl9lYWNoX2NwdShjcHUsIGNwdXMpIHsKPj4+Pj4gICAgICAgICAgICAgICAgIHN0cnVjdCByaXNj
dl9pc2FpbmZvICppc2FpbmZvID0gJmhhcnRfaXNhW2NwdV07Cj4+Pj4+Cj4+Pj4+IC0gICAgICAg
ICAgICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoaXNhaW5mby0+aXNhLCBa
QkEpKQo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBSSVNDVl9I
V1BST0JFX0VYVF9aQkE7Cj4+Pj4+IC0gICAgICAgICAgICAgICBlbHNlCj4+Pj4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG1pc3NpbmcgfD0gUklTQ1ZfSFdQUk9CRV9FWFRfWkJBOwo+Pj4+PiAt
Cj4+Pj4+IC0gICAgICAgICAgICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUo
aXNhaW5mby0+aXNhLCBaQkIpKQo+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICBwYWlyLT52
YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQkI7Cj4+Pj4+IC0gICAgICAgICAgICAgICBlbHNl
Cj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIG1pc3NpbmcgfD0gUklTQ1ZfSFdQUk9CRV9F
WFRfWkJCOwo+Pj4+PiAtCj4+Pj4+IC0gICAgICAgICAgICAgICBpZiAocmlzY3ZfaXNhX2V4dGVu
c2lvbl9hdmFpbGFibGUoaXNhaW5mby0+aXNhLCBaQlMpKQo+Pj4+PiAtICAgICAgICAgICAgICAg
ICAgICAgICBwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0VYVF9aQlM7Cj4+Pj4+IC0gICAg
ICAgICAgICAgICBlbHNlCj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIG1pc3NpbmcgfD0g
UklTQ1ZfSFdQUk9CRV9FWFRfWkJTOwo+Pj4+PiArI2RlZmluZSBDSEVDS19JU0FfRVhUKF9fZXh0
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+
Pj4gKyAgICAgICAgICAgICAgIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
IGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2FpbmZvLT5pc2EsIF9fZXh0KSkg
XAo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhaXItPnZhbHVlIHw9IFJJ
U0NWX0hXUFJPQkVfRVhUXyMjX19leHQ7ICAgICAgIFwKPj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgZWxzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWlzc2luZyB8PSBS
SVNDVl9IV1BST0JFX0VYVF8jI19fZXh0OyAgICAgICAgICAgXAo+Pj4+PiArICAgICAgICAgICAg
ICAgfSB3aGlsZSAoZmFsc2UpCj4+Pj4+ICsKPj4+Pj4gKyAgICAgICAgICAgICAgIC8qCj4+Pj4+
ICsgICAgICAgICAgICAgICAgKiBPbmx5IHVzZSBDSEVDS19JU0FfRVhUKCkgZm9yIGV4dGVuc2lv
bnMgd2hpY2ggY2FuIGJlIGV4cG9zZWQKPj4+Pj4gKyAgICAgICAgICAgICAgICAqIHRvIHVzZXJz
cGFjZSwgcmVnYXJkbGVzcyBvZiB0aGUga2VybmVsJ3MgY29uZmlndXJhdGlvbiwgYXMgbm8KPj4+
Pj4gKyAgICAgICAgICAgICAgICAqIG90aGVyIGNoZWNrcywgYmVzaWRlcyBwcmVzZW5jZSBpbiB0
aGUgaGFydF9pc2EgYml0bWFwLCBhcmUKPj4+Pj4gKyAgICAgICAgICAgICAgICAqIG1hZGUuCj4+
Pj4KPj4+PiBUaGlzIGNvbW1lbnQgYWxsdWRlcyB0byBhIGRhbmdlcm91cyB0cmFwLCBidXQgSSdt
IGhhdmluZyB0cm91YmxlCj4+Pj4gdW5kZXJzdGFuZGluZyB3aGF0IGl0IGlzLgo+Pj4KPj4+IFlv
dSBjYW5ub3QsIGZvciBleGFtcGxlLCB1c2UgdGhpcyBmb3IgY29tbXVuaWNhdGluZyB0aGUgcHJl
c2VuY2Ugb2YgRiBvcgo+Pj4gRCwgc2luY2UgdGhleSByZXF1aXJlIGEgY29uZmlnIG9wdGlvbiB0
byBiZSBzZXQgYmVmb3JlIHRoZWlyIHVzZSBpcwo+Pj4gc2FmZS4KPj4KPj4gRnVubmlseSBlbm91
Z2gsIHRoaXMgY29tbWVudCBpcyBpbW1lZGlhdGVseSBjb250cmFkaWN0ZWQgYnkgdGhlIHZlY3Rv
cgo+PiBzdWJzZXQgZXh0ZW5zaW9ucywgd2hlcmUgdGhlc2UgQ0hFQ0tfSVNBX0VYVCgpIG1hY3Jv
cyBhcmUgdXNlZCB3cmFwcGVkCj4+IGluIGhhc192ZWN0b3IoKS4gVGhlIGNvZGUgbG9va3MgdmFs
aWQgdG8gbWUsIHNpbmNlIGhhc192ZWN0b3IoKSBjb250YWlucwo+PiB0aGUgS2NvbmZpZyBjaGVj
aywgYnV0IGRvZXMgZmx5IGluIHRoZSBmYWNlIG9mIHRoaXMgY29tbWVudC4KPiAKPiAKPiBPaGgs
IGdvdCBpdC4gVGhlIHdvcmQgImNhbiIgaXMgZG9pbmcgYSBsb3Qgb2YgaGVhdnkgbGlmdGluZyBp
biB0aGF0Cj4gY29tbWVudC4gU28gbWF5YmUgc29tZXRoaW5nIGxpa2U6ICJUaGlzIG1hY3JvIHBl
cmZvcm1zIGxpdHRsZSBpbiB0aGUKPiB3YXkgb2YgZXh0ZW5zaW9uLXNwZWNpZmljIGtlcm5lbCBy
ZWFkaW5lc3MgY2hlY2tzLiBJdCdzIGFzc3VtZWQgb3RoZXIKPiBnYXRpbmcgZmFjdG9ycyBsaWtl
IHJlcXVpcmVkIEtjb25maWcgc2V0dGluZ3MgaGF2ZSBhbHJlYWR5IGJlZW4KPiBjb25maXJtZWQg
dG8gc3VwcG9ydCBleHBvc2luZyB0aGUgZ2l2ZW4gZXh0ZW5zaW9uIHRvIHVzZXJtb2RlIi4gLi4u
Cj4gQnV0LCB5b3Uga25vdywgbWFrZSBpdCBzcGFya2xlLgoKSGkgRXZlbiwKCkluZGVlZCB0aGUg
Y29tbWVudCB3YXMgYSBiaXQgbWlzbGVhZGluZywgaXMgdGhpcyBtb3JlIGNsZWFyID8KCi8qCiAq
IE9ubHkgdXNlIENIRUNLX0lTQV9FWFQoKSBmb3IgZXh0ZW5zaW9ucyB3aGljaCBhcmUgdXNhYmxl
IGJ5CiAqIHVzZXJzcGFjZSB3aXRoIHJlc3BlY3QgdG8gdGhlIGtlcm5lbCBjdXJyZW50IGNvbmZp
Z3VyYXRpb24uCiAqIEZvciBpbnN0YW5jZSwgSVNBIGV4dGVuc2lvbnMgdGhhdCB1c2VzIGZsb2F0
IG9wZXJhdGlvbnMKICogc2hvdWxkIG5vdCBiZSBleHBvc2VkIHdoZW4gQ09ORklHX0ZQVSBpcyBu
b3Qgc2V0LgogKi8KCkNsw6ltZW50Cgo+IAo+IC1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
