Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B7EC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Dec 2021 23:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=76nnb30KfsE1L1SvSFI9sJwCT0odgjtgL3mj3vOCtZQ=; b=DaHVbwnBf8IhgJ
	ffTLX7aokgjlv6hXxDelBTFntcEXH11bQFFWhpt64cz5DdTPBbRrst/KYyyCZesHvA+qjAhxSv0WX
	4jSjafKk2QYMfvTnXP3LsDWMiojYTel2HAl5osv86w02eCtAqthatI6J1bzgcJc22fRic4kml9Dw2
	KLn/9TLGek/r3mwKbooywjxURpYVS1TPAglVrH/Pj51OixKbwVcK34P37eLqsT/w5LUHV7Tt3FO5L
	TyDWt+5Gmb5rdlGx8PLcUi1wULzC4nBZPyfPjeB2jNzWKLnWt5LVnnkOyCaZkuKgEyNit415RK5jF
	5tWjlleJZFrWfljMQIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0tvy-00EX91-Ut; Fri, 24 Dec 2021 23:25:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0tvw-00EX8J-5S
 for linux-riscv@lists.infradead.org; Fri, 24 Dec 2021 23:25:09 +0000
Received: by mail-wr1-x432.google.com with SMTP id v11so19728752wrw.10
 for <linux-riscv@lists.infradead.org>; Fri, 24 Dec 2021 15:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CBWI94DnAbuhdlI8jpyRcjT77P/sUwa6Q+G0yKJaxQQ=;
 b=QMSCoNEQcDJcNrvfqRwfymcwEDL37lsh89/EIODzCg7becUZ9M0aOlPdTl0gtd1WMI
 pLN/0cB89YMdxs8I75iLYYmUn09Chq1kPZB4+FPCnFUAQyFmdisdIm+AocxFdvJ/aAax
 LAx5PvCJIpvK0Z1shGhYAUj5In85pxuN33Dpq6Xht9tH+yCCuMzeCwSYaaoVpvx6gfhP
 xfnrAgPKabnzTyAWPB9X8zRIbdnNcFft6YRLtF6TO7fgD6Yfk/UWNozB+fPPPurWV/xJ
 ac2gj465VkRf0BBDTPl4Bk4eDQlFb96SzgDpvzVM6+WAXAI0YJUTe9iNU8fgsvNzd5Ij
 emVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CBWI94DnAbuhdlI8jpyRcjT77P/sUwa6Q+G0yKJaxQQ=;
 b=ofuDYt9CPuJUbOH7OeeDzqUJl0oMES+WhU5l4JWSQOLHYnaZCX2UVYhCbgVz3rmk4x
 TeQFkWLLA1qiyoU/HtjQOTRPrCAcSt+w1hueuNf0B/4ZKwkbJiGiKrDC2eax7nLMijIc
 N3NEFqPFy2ba/bkvyaXwar86mg9Ond22Cl/q3/fUJj/2akhp28jbiCCV6eeyP8OED8T+
 Kpzn+qNok/WO0uRd7u9i0kFfvBsyeanJa/JhX9JDyhgvu/MjujUV2091LosFNgFkhpsR
 afvEsJOvnLvJOaEGly7qhSqdPQl6Ajuf5j683DitWNJ66cGyoK0PRhPzL+FGQaGyk1P+
 Eiaw==
X-Gm-Message-State: AOAM5333f5BTtYIkWjv/VSwgKM5r4MbMW+mKIja/YzHwx7grvZEABeqw
 LzORppFNfGWdzJX4JEiDka9NYQ==
X-Google-Smtp-Source: ABdhPJxo4AHSt7YwUTMDC+sX6bSs8y00mJ4xSqoQ/5X1pHjUvUNc0OnM2ORuKgSXV9zwfbGFws98qA==
X-Received: by 2002:a05:6000:168c:: with SMTP id
 y12mr6066606wrd.409.1640388304934; 
 Fri, 24 Dec 2021 15:25:04 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id o12sm9779882wrc.69.2021.12.24.15.25.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Dec 2021 15:25:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v1 2/2] dt-bindings: riscv: Add DT binding for RISC-V ISA
 extensions
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20211224211632.1698523-3-atishp@rivosinc.com>
Date: Fri, 24 Dec 2021 23:25:01 +0000
Cc: linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Message-Id: <3188F71E-93A4-452E-A730-A2F393067346@jrtc27.com>
References: <20211224211632.1698523-1-atishp@rivosinc.com>
 <20211224211632.1698523-3-atishp@rivosinc.com>
To: Atish Patra <atishp@atishpatra.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_152508_240360_5284ECEE 
X-CRM114-Status: GOOD (  14.74  )
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

T24gMjQgRGVjIDIwMjEsIGF0IDIxOjE2LCBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0aXNocGF0cmEu
b3JnPiB3cm90ZToKPiAKPiBSSVNDLVYgSVNBIGV4dGVuc2lvbnMgY2FuIGJlIHNpbmdsZSBsZXR0
ZXIgb3IgbXVsdGktbGV0dGVyIG5hbWVzLgo+IFRoZSBzaW5nbGUgbGV0dGVyIGV4dGVuc2lvbnMg
YXJlIG1vc3RseSBiYXNlIGV4dGVuc2lvbnMgYW5kIGVuY29kZWQgaW4KPiAicmlzY3YsaXNhIiBE
VCBwcm9wZXJ0eS4gSG93ZXZlciwgcGFyc2luZyB0aGUgbXVsdGktbGV0dGVyIGV4dGVuc2lvbnMK
PiB2aWEgdGhlIGlzYSBzdHJpbmcgaXMgY3VtYmVyc29tZSBhbmQgaXMgbm90IHNjYWxhYmxlLgo+
IAo+IEFkZCBhIG5ldyBEVCBub2RlIGZvciBtdWx0aS1sZXR0ZXIgZXh0ZW5zaW9ucy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIHwgOSArKysr
KysrKysKPiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gaW5kZXggYWE1
ZmI2NGQ1N2ViLi42YzRlZWNmMzg5YTkgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiBAQCAtNzgsNiArNzgsMTUgQEAgcHJv
cGVydGllczoKPiAgICAgICAtIHJ2NjRpbWFjCj4gICAgICAgLSBydjY0aW1hZmRjCj4gCj4gKyAg
cmlzY3YsaXNhLWV4dDoKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsgICAgICBJZGVudGlmaWVzIHRo
ZSBzcGVjaWZpYyBSSVNDLVYgaW5zdHJ1Y3Rpb24gc2V0IGFyY2hpdGVjdHVyZSBleHRlbnNpb25z
Cj4gKyAgICAgIHN1cHBvcnRlZCBieSBvbmUgb3IgbXVsdGlwbGUgaGFydHMuIEFsbCB0aGUgbXVs
dGktbGV0dGVyIGV4dGVuc2lvbnMKPiArICAgICAgc2hvdWxkIGJlIGxpc3RlZCBoZXJlIGFzIGEg
Ym9vbGVhbiBwcm9wZXJ0eS4gVGhpcyBzdWJub2RlIGNhbiBiZSB1bmRlcgo+ICsgICAgICAvY3B1
cyBvciB1bmRlciBpbmRpdmlkdWFsIGNwdSBub2RlLiBJbiBjYXNlIG9mIGZvcm1lciwgaXQgcmVw
cmVzZW50Cj4gKyAgICAgIHRoZSBjb21tb24gSVNBIGV4dGVuc2lvbnMgZm9yIGFsbCBoYXJ0cy4g
VGhlIG5hbWUgb2YgdGhlIGJvb2xlYW4gcHJvcGVydHkKPiArICAgICAgbXVzdCBtYXRjaCB0aGUg
YWN0dWFsIElTQSBleHRlbnNpb24gbmFtZSBpbiBhbGwgbG93ZXJjYXNlIGZvcm1hdC4KCkkgZG9u
4oCZdCBzZWUgd2h5IHRoaXMgbmVlZHMgZXhwbGljaXRseSBjYWxsaW5nIG91dCwgdGhhdOKAmXMg
dHJ1ZSBpbgpnZW5lcmFsIG9mIGNwdSBub2RlIHByb3BlcnRpZXMgKDMuOHA0IG9mIHRoZSBEZXZp
Y2V0cmVlIHNwZWMgdjAuNC1yYzEgLwp2MC4zLTQwLWc3ZTFjYzE3KSwgbm90IHRoYXQgSSBsaWtl
IGl0LgoKSmVzcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
