Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551B1C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 17:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TXzHOuYmk/5s3YH/mz9rVXqY4Tuwf4IPM2IA4/5Wd8=; b=DjUOwvlQO9lzIc
	gCZ3MUAtM+4cYpXHkMS0CwjZMJUWk51C6he33/89SKW5hsX6RAD8WqxWMT96dQrqUxlg8aD0ld123
	m+liCWuxbxNvHTrSM4ElTBNPtRGidFBnuuHE6XNXOFKH6JIlEvYpbz1qCLMWdjJi0vUD89mZb7KGf
	BBA7ASVSk6ZY/2FcofxwIbSZVmgdLHIWlEvx8Bsw7xp8Qp5zsZDiKQkHj57ruQmvgLlqmbJ7G0NZk
	AtmdHed8S2G0aiugz1hXpqDnhKinEw8lnRKwEjEbofKpGPecy+LRGvIxclUthBHDxrkrMlkEh3vuF
	B5ajzw1AJ2E/XTAcK6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2wxR-0000000HQxZ-2uGG;
	Fri, 03 May 2024 17:44:29 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2wxO-0000000HQx7-2nri
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 17:44:28 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-6123726725eso4830125a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714758265; x=1715363065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijedQqU8HOiNBFwPGu1UEZ4q1kIgznvtvPEAW7FPwsA=;
        b=AkjEKZvJl9oMv5RMmmnbIuxJUPyBnCyAMlLPugEc6Oj2rp8K3NAbiGAYAUOrrTMtAh
         jf7c37Xrbm11MtyRMv75bXMvwmnxsw6o3aaevaUufBll0Nkt1I2WqDzD5XYpS1GZbbaT
         eK+1pzWO8xadtyn6fGuv94CpSNkevbul9Ut2kMa9eigwYxfKdefgr91hC7MF/QrvBqve
         dY0eIrHnBhypP1nPzY+WZeaWFTKAxOvHfDaCX5DcHQQ6fSLuATc642OrGesg5L47SBUw
         lQ6z0GK0+Ri2j65r8mVwbeSdyBjrYgUbcE6wYrs9rDblDbc/g+8dMGCS5h8WUtOadeLZ
         8huA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714758265; x=1715363065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijedQqU8HOiNBFwPGu1UEZ4q1kIgznvtvPEAW7FPwsA=;
        b=AsdBTmH0lYHlYYiew/kCCDjp9o4JBKrvtc4F8YvTu8vklJ5od7p8wzeHa6rRDXmW/H
         6uwyzQPQg2q5eGxp8jeyS3LYgaQnAjXr3PeJISv55rK8j0RIr+FSIVofTszgIb/xYYuP
         Ye7t6BDTLVNXwXQfiwyAqJXj8BsT2m4d81UT4TFe8llkuV1xAIUJFXoyJwmVdN/eQv73
         gAJF1mpR/+T7yYVX/HZmz65qPgjcMmuolUIMN0A90eT+yxUb7WPz286D9RjTVEpvxNdv
         AJZiKHV0dELNGBqKHeGahTOYw9YvkLG2SLxAaWx7RzcWH25e/H8fGMZxgI5mSX1f+YXb
         niAg==
X-Forwarded-Encrypted: i=1; AJvYcCVLIYwfCZbdVtq+waGplzNkqL1iws/rPXHA8T1Ssb3M+4b1hkGcrCqlazRnOWSAaCRW5EIasNmUPIFjty2MQgc2Yqc9FZ9BLloxmMMZ2Mn6
X-Gm-Message-State: AOJu0YyNvaYxMUxI0cjwklAE/ML8L7yIyZKdgEoEk90g6UBMiNzXTGv6
	PsLvLLU8jrtFfspigy0dp23ndiWlt0Jz3QkhB7ujoJ3AZIxkS3ziCvkqxMDnvDqKG1MAMsOuaht
	IgzFYUMCsP++gJHtlYJQQJHwUditl3uXwQBUWxQ==
X-Google-Smtp-Source: AGHT+IHTYzFBNiLcDTWR/yPQGct/8FSPXfvsO3Z5gfOeTjH+nyp1VzR9kvnu8HckIgSmiSa2bAgk2UJV2RC4c9vY8ZI=
X-Received: by 2002:a05:6a20:6d87:b0:1af:73b1:d199 with SMTP id
 gl7-20020a056a206d8700b001af73b1d199mr3202703pzb.38.1714758265178; Fri, 03
 May 2024 10:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714494653.git.tjeznach@rivosinc.com> <b83f81c04d1f3885d860b1eec03761fe63a33183.1714494653.git.tjeznach@rivosinc.com>
 <20240501145621.GD1723318@ziepe.ca>
In-Reply-To: <20240501145621.GD1723318@ziepe.ca>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Fri, 3 May 2024 10:44:14 -0700
Message-ID: <CAH2o1u63GjMnYrfa8W-c1hdp+TAA0R-FyxXM4dEiFF+KEGWwbA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] iommu/riscv: Paging domain support
To: Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_104426_737057_4DD36D3E 
X-CRM114-Status: GOOD (  38.65  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMSwgMjAyNCBhdCA3OjU24oCvQU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAemll
cGUuY2E+IHdyb3RlOgo+Cj4gT24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgMDE6MDE6NTdQTSAtMDcw
MCwgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4KPiA+ICsjZGVmaW5lIGlvbW11X2RvbWFpbl90b19y
aXNjdihpb21tdV9kb21haW4pIFwKPiA+ICsgICAgIGNvbnRhaW5lcl9vZihpb21tdV9kb21haW4s
IHN0cnVjdCByaXNjdl9pb21tdV9kb21haW4sIGRvbWFpbikKPiA+ICsKPiA+ICsjZGVmaW5lIGRl
dl90b19kb21haW4oZGV2KSBcCj4gPiArICAgICBpb21tdV9kb21haW5fdG9fcmlzY3YoZGV2X2lv
bW11X3ByaXZfZ2V0KGRldikpCj4KPiBQbGVhc2UgdXNlIHRoZSBwcml2IHByb3Blcmx5IGFuZCBw
dXQgYSBzdHJ1Y3QgYXJvdW5kIGl0LCB5b3UnbGwKPiBjZXJ0YWlubHkgbmVlZCB0aGlzIGV2ZW50
dWFsbHkgdG8gZG8gdGhlIHJlc3Qgb2YgdGhlIGFkdmFuY2VkCj4gZmVhdHVyZXMuCj4KCkRvbmUu
IFllcywgaW5kZWVkLCBJIHdhcyBnb2luZyB0byBpbnRyb2R1Y2UgcHJvcGVyIHN0cnVjdCBpbiBm
b2xsb3cgdXAKcGF0Y2hlcyBhbnl3YXkuIFB1bGxlZCB0aGlzIGNoYW5nZSBzb29uZXIuCgo+ID4g
K3N0YXRpYyB2b2lkIHJpc2N2X2lvbW11X2JvbmRfdW5saW5rKHN0cnVjdCByaXNjdl9pb21tdV9k
b21haW4gKmRvbWFpbiwgc3RydWN0IGRldmljZSAqZGV2KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVj
dCByaXNjdl9pb21tdV9ib25kICpib25kLCAqZm91bmQgPSBOVUxMOwo+ID4gKyAgICAgdW5zaWdu
ZWQgbG9uZyBmbGFnczsKPiA+ICsKPiA+ICsgICAgIGlmICghZG9tYWluKQo+ID4gKyAgICAgICAg
ICAgICByZXR1cm47Cj4gPiArCj4gPiArICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmZG9tYWluLT5s
b2NrLCBmbGFncyk7Cj4KPiBUaGlzIGlzIG5ldmVyIGxvY2tlZCBmcm9tIGFuIGlycSwgeW91IGRv
bid0IG5lZWQgdG8gdXNlIHRoZSBpcnFzYXZlCj4gdmFyaWF0aW9ucy4KPgoKR29vZCBwb2ludC4g
ZG9uZSBpbiB2NC4KCj4gPiArICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3JjdShib25kLCAmZG9t
YWluLT5ib25kcywgbGlzdCkgewo+ID4gKyAgICAgICAgICAgICBpZiAoYm9uZC0+ZGV2ID09IGRl
dikgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGxpc3RfZGVsX3JjdSgmYm9uZC0+bGlzdCk7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgZm91bmQgPSBib25kOwo+ID4gKyAgICAgICAgICAg
ICB9Cj4gPiArICAgICB9Cj4gPiArICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkb21haW4t
PmxvY2ssIGZsYWdzKTsKPiA+ICsKPiA+ICsgICAgIC8qIFJlbGVhc2UgYW5kIHdhaXQgZm9yIGFs
bCByZWFkLXJjdSBjcml0aWNhbCBzZWN0aW9ucyBoYXZlIGNvbXBsZXRlZC4gKi8KPiA+ICsgICAg
IGtmcmVlX3JjdShmb3VuZCwgcmN1KTsKPiA+ICsgICAgIHN5bmNocm9uaXplX3JjdSgpOwo+Cj4g
UGxlYXNlIG5vLCBzeW5jaHJvbml6ZV9yY3UoKSBvbiBhIHBhdGggbGlrZSB0aGlzIGlzIG5vdCBz
bwo+IHJlYXNvbmFibGUuLiBBbHNvIHlvdSBkb24ndCBuZWVkIGtmcmVlX3JjdSgpIGlmIHlvdSB3
cml0ZSBpdCBsaWtlIHRoaXMuCj4KPiBUaGlzIHN0aWxsIGxvb2tzIGJldHRlciB0byBkbyB3aGF0
IEkgc2FpZCBiZWZvcmUsIHB1dCB0aGUgaW9tbXUgbm90Cj4gdGhlIGRldiBpbiB0aGUgYm9uZCBz
dHJ1Y3QuCj4KPgoKSSB3YXMgdHJ5aW5nIG5vdCB0byBkdXBsaWNhdGUgZGF0YSBpbiBib25kIHN0
cnVjdCBhbmQgdXNlIHdoYXRldmVyIGlzCmF2YWlsYWJsZSB0byBiZSByZWZlcmVuY2VkIGZyb20g
ZGV2IHBvaW50ZXIgKGVnIGlvbW11IC8gaWRzIC8gcHJpdmF0ZQppb21tdSBkZXYgZGF0YSkuIElm
IEknbSByZWFkaW5nIGNvcmUgaW9tbXUgY29kZSBjb3JyZWN0bHksIGRldmljZQpwb2ludGVyIGFu
ZCBpb21tdSBwb2ludGVycyBzaG91bGQgYmUgdmFsaWQgYmV0d2VlbiBfcHJvYmVfZGV2aWNlIGFu
ZApfcmVsZWFzZV9kZXZpY2UgY2FsbHMuIEkndmUgbW92ZWQgc3luY2hyb25pemVfcmN1IG91dCBv
ZiB0aGUgZG9tYWluCmF0dGFjaCBwYXRoIHRvIF9yZWxlYXNlX2RldmljZSwgTE1LIGlmIHRoYXQg
d291bGQgYmUgb2sgZm9yIG5vdy4KSSdsbCBoYXZlIGEgc2Vjb25kIGFub3RoZXIgdG8gcmV3b3Jr
IG90aGVyIHBhdGNoZXMgdG8gYXZvaWQgc3RvcmluZwpkZXYgcG9pbnRlcnMgYXQgYWxsLgoKCj4g
PiArc3RhdGljIHN0cnVjdCBpb21tdV9kb21haW4gKnJpc2N2X2lvbW11X2FsbG9jX3BhZ2luZ19k
b21haW4oc3RydWN0IGRldmljZSAqZGV2KQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCByaXNjdl9p
b21tdV9kb21haW4gKmRvbWFpbjsKPiA+ICsgICAgIHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2Ug
KmlvbW11Owo+ID4gKwo+ID4gKyAgICAgaW9tbXUgPSBkZXYgPyBkZXZfdG9faW9tbXUoZGV2KSA6
IE5VTEw7Cj4gPiArICAgICBkb21haW4gPSBremFsbG9jKHNpemVvZigqZG9tYWluKSwgR0ZQX0tF
Uk5FTCk7Cj4gPiArICAgICBpZiAoIWRvbWFpbikKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIEVS
Ul9QVFIoLUVOT01FTSk7Cj4gPiArCj4gPiArICAgICBJTklUX0xJU1RfSEVBRF9SQ1UoJmRvbWFp
bi0+Ym9uZHMpOwo+ID4gKyAgICAgc3Bpbl9sb2NrX2luaXQoJmRvbWFpbi0+bG9jayk7Cj4gPiAr
ICAgICBkb21haW4tPm51bWFfbm9kZSA9IE5VTUFfTk9fTk9ERTsKPiA+ICsKPiA+ICsgICAgIC8q
Cj4gPiArICAgICAgKiBGb2xsb3cgc3lzdGVtIGFkZHJlc3MgdHJhbnNsYXRpb24gbW9kZS4KPiA+
ICsgICAgICAqIFJJU0MtViBJT01NVSBBVFAgbW9kZSB2YWx1ZXMgbWF0Y2ggUklTQy1WIENQVSBT
QVRQIG1vZGUgdmFsdWVzLgo+ID4gKyAgICAgICovCj4gPiArICAgICBkb21haW4tPnBnZF9tb2Rl
ID0gc2F0cF9tb2RlID4+IFNBVFBfTU9ERV9TSElGVDsKPgo+IFRoaXMgc2VlbXMgcmVhbGx5IHN0
cmFuZ2UsIHRoZSBpb21tdSBwYWdpbmcgZG9tYWlucyBzaG91bGQgYmUKPiB1bnJlbGF0ZWQgdG8g
d2hhdCB0aGUgQ1BVIGlzIGRvaW5nLiBUaGVyZSBpcyBubyBjb25uZWN0aW9uIGJldHdlZW4KPiB0
aGVzZSB0d28gY29uY2VwdHMuCj4KPiBKdXN0IHBpY2sgYSBzaXplIHRoYXQgdGhlIGlvbW11IHN1
cHBvcnRzLgo+Cj4gVGhlIG51bWJlciBvZiByYWRpeCBsZXZlbHMgaXMgYSB0dW5hYmxlIGFsb3Qg
b2YgaW9tbXVzIGhhdmUgdGhhdCB3ZQo+IGhhdmVuJ3QgcmVhbGx5IGV4cG9zZWQgdG8gYW55dGhp
bmcgZWxzZSB5ZXQuCj4KCk1ha2VzIHNlbnNlLiBJJ3ZlIGxlZnQgYW4gb3B0aW9uIHRvIHBpY2sg
bW9kZSBmcm9tIE1NVSBmb3IgY2FzZXMgd2hlcmUKZGV2L2lvbW11IGlzIG5vdCBrbm93biBhdCBh
bGxvY2F0aW9uIHRpbWUgKHdpdGggaW9tbXVfZG9tYWluX2FsbG9jKCkpLgpJJ2QgZ3Vlc3MgaXQn
cyByZWFzb25hYmxlIHRvIGFzc3VtZSBJT01NVSBzdXBwb3J0ZWQgcGFnZSBtb2RlcyB3aWxsCm1h
dGNoIE1NVS4KCj4gPiArICAgICAvKgo+ID4gKyAgICAgICogTm90ZTogUklTQy1WIFByaXZpbGVn
ZSBzcGVjIG1hbmRhdGVzIHRoYXQgdmlydHVhbCBhZGRyZXNzZXMKPiA+ICsgICAgICAqIG5lZWQg
dG8gYmUgc2lnbi1leHRlbmRlZCwgc28gaWYgKFZBX0JJVFMgLSAxKSBpcyBzZXQsIGFsbAo+ID4g
KyAgICAgICogYml0cyA+PSBWQV9CSVRTIG5lZWQgdG8gYWxzbyBiZSBzZXQgb3IgZWxzZSB3ZSds
bCBnZXQgYQo+ID4gKyAgICAgICogcGFnZSBmYXVsdC4gSG93ZXZlciB0aGUgY29kZSB0aGF0IGNy
ZWF0ZXMgdGhlIG1hcHBpbmdzCj4gPiArICAgICAgKiBhYm92ZSB1cyAoZS5nLiBpb21tdV9kbWFf
YWxsb2NfaW92YSgpKSB3b24ndCBkbyB0aGF0IGZvciB1cwo+ID4gKyAgICAgICogZm9yIG5vdywg
c28gd2UnbGwgZW5kIHVwIHdpdGggaW52YWxpZCB2aXJ0dWFsIGFkZHJlc3Nlcwo+ID4gKyAgICAg
ICogdG8gbWFwLiBBcyBhIHdvcmthcm91bmQgdW50aWwgd2UgZ2V0IHRoaXMgc29ydGVkIG91dAo+
ID4gKyAgICAgICogbGltaXQgdGhlIGF2YWlsYWJsZSB2aXJ0dWFsIGFkZHJlc3NlcyB0byBWQV9C
SVRTIC0gMS4KPiA+ICsgICAgICAqLwo+ID4gKyAgICAgZG9tYWluLT5kb21haW4uZ2VvbWV0cnku
YXBlcnR1cmVfc3RhcnQgPSAwOwo+ID4gKyAgICAgZG9tYWluLT5kb21haW4uZ2VvbWV0cnkuYXBl
cnR1cmVfZW5kID0gRE1BX0JJVF9NQVNLKFZBX0JJVFMgLSAxKTsKPiA+ICsgICAgIGRvbWFpbi0+
ZG9tYWluLmdlb21ldHJ5LmZvcmNlX2FwZXJ0dXJlID0gdHJ1ZTsKPgo+IFlpa2VzLi4gVGhpcyBp
cyBwcm9iYWJseSB0aGUgYmVzdCBzb2x1dGlvbiBsb25nIHRlcm0gYW55aG93LCB1bmxlc3MKPiB5
b3UgbmVlZCB0byB1c2UgdGhlIGxhc3QgcGFnZSBpbiBWRklPIGZvciBzb21lIHJlYXNvbi4KPgo+
ID4gIHN0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfZGV2aWNlX2RvbWFpbl90eXBlKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiA+ICB7Cj4gPiAtICAgICByZXR1cm4gSU9NTVVfRE9NQUlOX0lERU5USVRZOwo+
ID4gKyAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUgPSBkZXZfdG9faW9tbXUo
ZGV2KTsKPiA+ICsKPiA+ICsgICAgIGlmIChpb21tdS0+ZGR0X21vZGUgPT0gUklTQ1ZfSU9NTVVf
RERUUF9NT0RFX0JBUkUpCj4gPiArICAgICAgICAgICAgIHJldHVybiBJT01NVV9ET01BSU5fSURF
TlRJVFk7Cj4gPiArCj4KPiBJcyB0aGVyZSBldmVuIGEgcG9pbnQgb2YgYmluZGluZyBhbiBpb21t
dSBkcml2ZXIgaWYgdGhlIEhXIGNhbid0Cj4gc3VwcG9ydCBhIEREVCB0YWJsZT8gSnVzdCByZXR1
cm4gLUVOT0RFViBmcm9tIHByb2JlX2RldmljZT8KPgo+IExvZ2ljYWxseSBhIGlvbW11IGJsb2Nr
IHRoYXQgY2FuJ3QgZGVjb2RlIHRoZSBSSUQgaGFzIG5vIGFzc29jaWF0aW9uCj4gYXQgYWxsIHdp
dGggYSBMaW51eCBzdHJ1Y3QgZGV2aWNlIDopCj4KCkRvbmUuIEdvb2QgcG9pbnQgOykKClRoYW5r
cyBmb3IgcmV2aWV3LAotIFRvbWFzegoKCj4gSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
