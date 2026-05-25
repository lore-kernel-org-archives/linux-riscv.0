Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425C7CD5BC9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoEDJ5h9lxedWqVzjNrW1+GqhvqOqx5LPekgD+z9BnA=; b=yHO7KYZKcf0I7Fk8bBj5wpopTh
	j2gyhKscI3ZQzbJIcnD9ud30S1bi7g9HapFZiTqGrQDLF93dC5Q2bnfwME4GhF1s/O7pShL+7r23h
	ID6z6m+KRm8ubpAuLusA/BXMfbgam+9nUAfL2P/eygRVVFoKS4G5gh9+tNmkCBnir/48VOiX/Vm+Z
	buBBcn4KwNKjheQoyyOgcNe1uDqUJLPJMqG7uAjUKrnNqe/jVi/Ec5qJy7/U4V+C0jQVdl6u23QwA
	UDoL+cqYxj6avsbxMBt+iZsQhnS2TlQYCF3HQQ1YYh2JtoU5CgjXmQA/gazdurSF6bYOpmXaqmWHJ
	5Pf6PN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYQX-000000003Km-3JXV;
	Mon, 25 May 2026 16:45:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYQR-000000003JI-41d9
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 16:45:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43fe608cb92so5892235f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779727510; x=1780332310; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67F6STg17M288NH/Kzfu1U3GX4bjSdjuVgcfWDSoVZo=;
        b=oN2CNONNKwqOk5flWNT9rbSmgEsU//sPxONwTJkzoISU0F4AvMYI24viZmLTzR79qU
         dNQ/fWNEIhbSFoiMkYGsE4+SUn2FpGsd9B11UBw4pwQbE+PSfvKWQ5h9HAlxnswxeE0J
         1sOg8ptxOIk2zZlCKqkXicFT9wczWeoTvF7uyfxr53KqERPlaWpWgiD3lklMmpoqRbko
         zleYbSokjtgOtqurH7m/7Qf5JFa2wXidb3s2BN2vbwBBkmkoZcqS0Yv3SJLniUzG+y67
         B5Opgx6FCTKdw4qP2p8qDzujXdiL3voXN5S8UQixfAGkoNzDY8L26mYidKYJeK0Ql0Ou
         FhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779727510; x=1780332310;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67F6STg17M288NH/Kzfu1U3GX4bjSdjuVgcfWDSoVZo=;
        b=Eb2tiYf6ZIdPqWXx2M0QEecr1GxwR9EZITpPeNibiVQiI9HxvAEzkSuILKsgQx48fU
         xMTjgdobeu9CxAjAb1ioRIHJLsE7kb9s40WY8juQvRp/E5dn+tXTJZhploOG1uCURlCw
         Op+d15YQWmItcw9UnXe3Bxrb61JBIhNZnfsianuMNS/MQQndOt5FxrSBOzAUYCf91r6J
         trG1LQJvpMPxCdTKAUbygaVAmIPzgX6Ddu3xuYOtjQpQ2YhYBgN4GwpMLFiSmxLS69uD
         KT1CUZYOHuBR+ETn/FDIZihvoxV5HrAZb4BjeQtmLL55zm6emXfJy9HQ5nkOGl3QxTY8
         UB+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8pJc7GbxnBO6zreDJA370n1SbCsyAq6/Tml8wWUeimMeODBSOxd4zghJpwtpJ9Olo/+GcHzDWVpmP6Nw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAdjgAxkXVWIVqkn3Qtl0Jk0n8oEBBk4HBi96edDP9G7n//PCN
	gSPzfT5ZoF322lrm0TRNNYkRzsNBcr62BspSAYYpQG8qI4w9kzjVOYFm
X-Gm-Gg: Acq92OH0kQSJg2OyT5lEevXz8cR2PYnio+WjgghPWCz8ojqs3H3YHnvUkGPQj68gYoq
	5bSwvv8mWi/YeOz7ZyGEMGpWy2A+EeSKPHNDByZNpBF7W1jT9BuLqGtBQsfKhVGk6HQQIi4esRW
	MAsTK8Rt/DNUwz2fqqzoF1gG7ma5f430EFw8jlIha4wbg6qlpYKevmL7y0OnWF31OtFNEA9OS6B
	u4bg/qm9af+sMvClYxPZQaVjbkgo7HaYFbrUTU63Dbpl6B50707800T6uI38KysprjeA3ff5RJV
	dc6sEis/r44UknexLRRxTDxmsT/MNWGInyK/H6EEJj0NFMvgo+bG7dTeHwh2vtblc4+8u8DqsUf
	HYrHTSrFmguL+tGlxeNnBAlS5dZL3rYQtoYuelOSHoeHwGcW6XT8A95rMtHHd146WS94a0RDpgL
	WgvN1xqtP/YT5Swxk1WBaDHpFFe5V7MjkpI+1pI3iATS3XbAEYfErJhoX953KsOJM=
X-Received: by 2002:a05:6000:2c10:b0:43d:7a97:78b5 with SMTP id ffacd0b85a97d-45eb38d63a7mr25843635f8f.33.1779727509412;
        Mon, 25 May 2026 09:45:09 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-131-96.net-htp.de. [89.182.131.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e363sm29230186f8f.28.2026.05.25.09.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 09:45:08 -0700 (PDT)
Message-ID: <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
Date: Mon, 25 May 2026 18:45:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Trevor Gamblin <tgamblin@baylibre.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4>
 <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
 <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com>
 <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
 <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_094512_026127_51775075 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Javier Martinez Canillas <javierm@redhat.com>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, Margherita Milani <margherita.milani@amarulasolutions.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, Vincent Legoll <legoll@online.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgSWtlciwKCk9uIDI1LjA1LjI2IDExOjM2IEFNLCBJa2VyIFBlZHJvc2Egd3JvdGU6Cj4gSGks
Cj4gCj4gU29ycnksIEkndmUgYmVlbiBvbiB2YWNhdGlvbiBhbmQgSSBoYXZlbid0IGNoZWNrZWQg
bXkgZW1haWxzLgo+IAo+IEVsIG1pw6ksIDIwIG1heSAyMDI2IGEgbGFzIDEzOjExLCBUcmV2b3Ig
R2FtYmxpbgo+ICg8dGdhbWJsaW5AYmF5bGlicmUuY29tPikgZXNjcmliacOzOgo+Pgo+Pgo+PiBP
biAyMDI2LTA1LTIwIDAzOjUzLCBBbmRyZSBIZWlkZXIgd3JvdGU6Cj4+PiBIaSBUcmV2b3IsCj4+
Pgo+Pj4gT24gMTYuMDUuMjYgMjozNSBQTSwgVHJldm9yIEdhbWJsaW4gd3JvdGU6Cj4+Pj4KPj4+
PiBPbiAyMDI2LTA1LTE1IDIyOjU3LCBZaXh1biBMYW4gd3JvdGU6Cj4+Pj4+IE9uIEZyaSwgMTUg
TWF5IDIwMjYgMTI6NDg6NTggKzAyMDAsIElrZXIgUGVkcm9zYSB3cm90ZToKPj4+Pj4+IFRoaXMg
c2VyaWVzIGVuYWJsZXMgY29tcGxldGUgU0QgY2FyZCBzdXBwb3J0IGZvciB0aGUgU3BhY2VtaXQg
SzEtYmFzZWQKPj4+Pj4+IE9yYW5nZVBpIFJWMiBib2FyZCwgaW5jbHVkaW5nIFVIUyAoVWx0cmEg
SGlnaCBTcGVlZCkgbW9kZXMgZm9yCj4+Pj4+PiBoaWdoLXBlcmZvcm1hbmNlIFNEIGNhcmQgb3Bl
cmF0aW9uLgo+Pj4+Pj4KPj4+Pj4+IEJhY2tncm91bmQKPj4+Pj4+Cj4+Pj4+PiBUaGUgU3BhY2Vt
aXQgSzEgU29DIGluY2x1ZGVzIGFuIFNESENJIGNvbnRyb2xsZXIgY2FwYWJsZSBvZiBzdXBwb3J0
aW5nCj4+Pj4+PiBTRCBjYXJkcyB1cCB0byBVSFMtSSBzcGVlZHMgKFNEUjEwNCBhdCAyMDhNSHop
LiBIb3dldmVyLCBtYWlubGluZQo+Pj4+Pj4gY3VycmVudGx5IGxhY2tzIGJhc2ljIFNEIGNvbnRy
b2xsZXIgY29uZmlndXJhdGlvbiwgU0RIQ0kgZHJpdmVyCj4+Pj4+PiBlbmhhbmNlbWVudHMgZm9y
IHZvbHRhZ2Ugc3dpdGNoaW5nIGFuZCB0dW5pbmcsIGFuZCBwb3dlciBtYW5hZ2VtZW50Cj4+Pj4+
PiBpbmZyYXN0cnVjdHVyZS4KPj4+Pj4+Cj4+Pj4+PiBbLi4uXQo+Pj4+PiBIaSBJa2VyLAo+Pj4+
PiBJJ3ZlIHBpY2tlZCBwYXRjaCAxLTMsIGZvciBbNC80XSBJIHRoaW5rIGl0IHNob3VsZCBiZSBt
ZXJnZWQgYWZ0ZXIKPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNTEzMDcx
OTU4LjI5NTc0LTEtYS5oZWlkZXJAZ21haWwuY29tLwo+Pj4+Cj4+Pj4gSGkgWWl4dW4sCj4+Pj4K
Pj4+PiBUaGF0IG1ha2VzIHNlbnNlLiBJbiByZXNwb25zZSB0byB5b3VyIGVhcmxpZXIgZmVlZGJh
Y2sgSSBoYWQgZHJhZnRlZAo+Pj4+IGEgbW9yZQo+Pj4+IGNvbXBsZXRlIGR0cyBhZnRlciBhbm90
aGVyIHNjaGVtYXRpYyBjb21wYXJpc29uLCBidXQgSWtlciBhbmQgSQo+Pj4+IGRpc2N1c3NlZCBp
dAo+Pj4+IGFuZCBvcHRlZCB0byBhdm9pZCBjaGFuZ2luZyBzY29wZSB0b28gbXVjaC4gQW5kcmUn
cyBzZXJpZXMgaW5jbHVkZXMKPj4+PiB0aGUgYml0cyBJCj4+Pj4gd2FudGVkIHRvIGFkZCBhbmQg
bW9yZSwgc28gdGhhdCB3b3JrcyBvdXQuCj4+Pgo+Pj4gSSBoYXZlIDQvNCByZWJhc2VkIG9uIG15
IHNlcmllcyBhbnl3YXksIGRvIHlvdSB3YW50IG1lIHRvIHNlbmQgaXQ/Cj4+Cj4+IElmIHlvdSBo
YXZlIGFuIHVwZGF0ZSB0byBtYWtlLCBwbGVhc2UgZG8hCj4gCj4gU28sIGhvdyBoYXMgdGhpcyB0
dXJuZWQgb3V0IGluIHRoZSBlbmQ/IEFuZHJlLCB3aWxsIHlvdSB0YWtlIGNhcmUgb2YKPiBzZW5k
aW5nIHRoZSBsYXRlc3QgdmVyc2lvbiBmb3IgdGhlIE1VU0UgUGkgUHJvPwoKWWVzLCBpbiBmYWN0
IEkgYWxyZWFkeSBzZW50IGl0IGxhc3Qgd2VlazoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvc3Bh
Y2VtaXQvMjAyNjA1MjAxMzA2MjQuMTc2MzQ4Ny0xLWEuaGVpZGVyQGdtYWlsLmNvbS9ULyN1CgpZ
b3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgdGhhdCAodW5sZXNzIEkgbWVzc2VkIHNvbWV0aGluZyB1
cCkgOykKClRoYW5rcyEKQW5kcmUKCj4gCj4+Cj4+IFRyZXZvcgo+Pgo+Pj4KPj4+IFRoYW5rcywK
Pj4+IEFuZHJlCj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzIQo+Pj4+Cj4+Pj4gVHJldm9yCj4+Pj4KPj4+
Pj4KPj4+Pj4gQXBwbGllZCwgdGhhbmtzIQo+Pj4+Pgo+Pj4+PiBbMS80XSByaXNjdjogZHRzOiBz
cGFjZW1pdDogazE6IGFkZCBTRCBjYXJkIGNvbnRyb2xsZXIgYW5kIHBpbmN0cmwKPj4+Pj4gc3Vw
cG9ydAo+Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vc3BhY2VtaXQtY29tL2xpbnV4L2NvbW1pdC8y
ZDc3ZTU3NzEwOTk2N2VmNjVmMjY5YzFmYzFkNmE2NTlkNDI2MGZiCj4+Pj4+IFsyLzRdIHJpc2N2
OiBkdHM6IHNwYWNlbWl0OiBrMS1vcmFuZ2VwaS1ydjI6IGFkZCBTRCBjYXJkIHN1cHBvcnQKPj4+
Pj4gd2l0aCBVSFMgbW9kZXMKPj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3NwYWNlbWl0LWNvbS9s
aW51eC9jb21taXQvMjU4NWM2MGNlMmY5NzdiMTNmMTRhNjdkMWUzZWQ5YzczZmQ3ZjM4MQo+Pj4+
PiBbMy80XSByaXNjdjogZHRzOiBzcGFjZW1pdDogazEtYmFuYW5hcGktZjM6IGFkZCBTRCBjYXJk
IHN1cHBvcnQgd2l0aAo+Pj4+PiBVSFMgbW9kZXMKPj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3Nw
YWNlbWl0LWNvbS9saW51eC9jb21taXQvYzc2ZTJmMDU4Y2JjYWI4NGU0YTcwM2YyNjg1N2E1OGJk
ZjZhMDA0Mgo+Pj4+Pgo+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+PgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
