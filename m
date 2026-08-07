Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51436C5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fB9NVza/8xO8eEo+rs14c4o61mPR9WqNOqdWe5gx8wg=; b=AZ5r5NicUZvFzh
	BSDHt/BcaaOYeRSV1zWtulFfwkbCB9snLmmjAJcN2lG7+m16VqqQuFGz3GImW/wc6DoB4KsfBW6OP
	Ky7khrsWh8xWVCmUembnb/9E+s0tozkTMiy8sANrZ8PC3nMt9dCluWYLHJtyXzl73TmEkMspD+/Na
	MzIPrvWrsyyhxSphZaQa1n4bJWBFdwNbxSyoOAGeeFSzhGzrBmwxzIcMQlgfTri4t8trmhIarh551
	qDw0b0yjQzBbsKVlEYauR3CyrImvNYDfRGgFfEq1yMrn/E/w/F8USHHxJEQXQv9Yz1IKUTkPpgRhI
	qx9zBpkCBUBgemSCkdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEM-00000007HII-2Dga;
	Fri, 07 Aug 2026 07:43:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFEK-00000007HGZ-1gSn
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 07:43:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ubKtK2cT3F7Eeuk7KUajYtaFkIOEcFfT6C7ChKCXeuI=; b=GHdOOZkJIWrNkB4isoLJrahJtY
	tkJs8ux9zJlUmF2t9paCAqbMzxtgF4nrEoJ/yJZReBvJMWyJM7JBHwSy4/A/utUM0A6h3P+0lMxhS
	6BotQ7DjscsJjYKb6NQRCQh7BJTx9lCel/5RXZMK1JxqsRXL+v0/ExRV9bPeirlUg86cs7cqoJaoY
	WCe/DIN4l7a7EucYJSytHoNSvU/V9vg9cd5rMj4PX1oX93zVCa5R9hwKjoNxb8kaSHA+qSbNKkoL6
	dVHX21/RfnK6OBQNDg9JeVHe8tzRWeQ/rCVkrFt/es0cQfVKfH+ktcXSLdwFciBRalGGCyLQKQOMB
	ibQY25kw==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFEH-0000000C9O6-2h8R
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:42:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47de008b020so1078862f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088576; x=1786693376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ubKtK2cT3F7Eeuk7KUajYtaFkIOEcFfT6C7ChKCXeuI=;
        b=CetAnwrsFMrKHFvjkA+fjBR0CkRiQ8rWmljCfxDSnneUtS22QqupMHgiZz7sumOH14
         jNKNFldOKimXTS5qOMLSt1oGKB+kLHlXMz0BSz5448YfuD/M6wkmUdJKAMR1A62Nbl9h
         0pHEGHKwtfU0iNAtGh/Pm3GROTHqB6llwZpNm7GpXNnIG/Bvzf8dOqWfHj6zaYSFkCBF
         nDbCKK9Ud6EWFkL/ve37bIWcQ3pZ4m/H4s0e/VdMFEHC2S9Ziy9fhlO0PDSlnLnJzKbE
         /3ccc7sZq5Bz3Z6yAsP+3/fFNPtnFShja8N1y02gpGbX7XWLMcQ3GH73WXbDZZ5Tn3zS
         yV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088576; x=1786693376;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubKtK2cT3F7Eeuk7KUajYtaFkIOEcFfT6C7ChKCXeuI=;
        b=Q6nwANYQwN3CCuekKuNvD9FZX38Biacxn9YQnsZgua/7BFR41AVerh3KYUblDnsh5n
         M1V2oXUe95Mm6EZwROvkSSf9vaA7hwdx2OsiialDDjGvW55vPdb5DPJgZvJjot/oTPY+
         yjtW12OWmiS4megygs8IRUud1KcSwI5HSn/D7JR4Ba2QNnJrPE7WXNH5F1e6SYCDNWsE
         Zqf3oeEgevLn5ohYLLFtaDN4UAy6GG3sNHNTohcACQrsy29h2VvumPwR1PZXgq4g1nhH
         ixENOX8uQ8NDZ967UkaNYzWDCpTsNbB709BB6+Wp0lE9mzSbl0s7njObQDJ6huQ0HF19
         /i5g==
X-Forwarded-Encrypted: i=1; AHgh+RoaT0RrC8s2X4sZzEIisjiPMZEAnHbsfKlIQWqDsnYAxA1HQwbnsfS5Jpu6Bc5Ewu82s9jZUJkqa7QXPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNOv1zu9r6iiHQSn1T179zdzANJJpHAFL68UN6c+BG10xtPvnx
	XnGS7+gkdPGbRFZMwyDbj94zl1a9cUpDnqD0APWmjnTA84sl7oy6GIjSLRqd2STCbzbI
X-Gm-Gg: AR+sD13SF+0yi5V5ik8d2tQ2Z2XLniSA/LT6fTHOqTSKh5QnCSTeXW47O7af1kqGv86
	+OvePcxeG5RjWpqtYk5xx3poyPbSxndHup8d9irMZSH+0BrHemWAg9MNQvFWbgDyBN/w/ifk0TU
	DHm8Pos+ECIgS7zwEin9LklEFzwB6rqq2bL6BYkFpX+PhuwNRW5DQ350g33V8fwXeSyK2wBZdmg
	w0PdE7zjawKPyMvMq6EYfVzq4VCfBD0Qt5uE7aoluFRb6ORfdaopjutIHAB6CCBQf9byi0HcU3j
	sQ+M3pTmO6rj/nVJ+k6zlngE3ugZ1y1XTSzDclGBjH9nEf12WwMMVsuJii557o0kpDbgXwuxyHQ
	bKyrvNPE+Z+G9QIcKKvsxYj6FPbcQEbqt6Eu7bAms24oljWP+I1divK1Elj3iqpaA5cKRSX705P
	xa5Xvg3WKB/ooqMBuUTQKBHMBc1KxPI24cUFWJ2Myf99SH6ySq60PEFuwOW66ao91p/Cccv5q63
	9ANSNTOZQ4OwvO+rsk2XS+gbQ68Z+Ozmw==
X-Received: by 2002:a05:6000:2889:b0:47f:f002:3656 with SMTP id ffacd0b85a97d-47ff86d5b33mr14529837f8f.12.1786088576046;
        Fri, 07 Aug 2026 00:42:56 -0700 (PDT)
Received: from ?IPV6:2001:8a0:f59c:a900:2600:fba1:8d1e:1692? ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506c0sm3100099f8f.11.2026.08.07.00.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:42:55 -0700 (PDT)
Message-ID: <ba698035-28a3-4b63-b1c9-5393c840d3f3@osyx.tech>
Date: Fri, 7 Aug 2026 08:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Jo=C3=A3o_Peixoto?= <jpeixoto@osyx.tech>
Subject: Re: [PATCH 2/6] virt: bao: Add Bao IPC shared memory driver
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
 aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
 davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
 gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
 jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
 nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
 pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
 will@kernel.org
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-3-joaopeixoto@osyx.tech>
 <lpocmy3nmdcudoewe6uxal4srnd2acvb4fi73fthbruyb3wpo6@ky5cpwirm2vm>
Content-Language: en-US
In-Reply-To: <lpocmy3nmdcudoewe6uxal4srnd2acvb4fi73fthbruyb3wpo6@ky5cpwirm2vm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_084257_824251_4C07B8BC 
X-CRM114-Status: GOOD (  10.35  )
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

Ck9uIDEvMTQvMjYgMjA6MzcsIEFuZHJldyBKb25lcyB3cm90ZToKPiBPbiBXZWQsIEphbiAwNywg
MjAyNiBhdCAwNDoyODoyNVBNICswMDAwLGpvYW9wZWl4b3RvQG9zeXgudGVjaCB3cm90ZToKPiAu
Li4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vYmFvLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2Jhby5oCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAw
MDAwMDAwMDAwMC4uMzU2NThmMzdlMWJkCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9iYW8uaAo+PiBAQCAtMCwwICsxLDMxIEBACj4+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+PiArLyoKPj4gKyAqIEJhbyBIeXBlcnZpc29y
IEh5cGVyY2FsbCBJbnRlcmZhY2UKPj4gKyAqCj4+ICsgKiBDb3B5cmlnaHQgKGMpIEJhbyBQcm9q
ZWN0IGFuZCBDb250cmlidXRvcnMuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCj4+ICsgKgo+PiArICog
QXV0aG9yczoKPj4gKyAqCUpvw6NvIFBlaXhvdG88am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgo+PiAr
ICoJSm9zw6kgTWFydGluczxqb3NlQG9zeXgudGVjaD4KPj4gKyAqCURhdmlkIENlcmRlaXJhPGRh
dmlkbWNlcmRlaXJhQG9zeXgudGVjaD4KPj4gKyAqLwo+PiArCj4+ICsjaWZuZGVmIF9fQVNNX1JJ
U0NWX0JBT19ICj4+ICsjZGVmaW5lIF9fQVNNX1JJU0NWX0JBT19ICj4+ICsKPj4gKyNpbmNsdWRl
IDxhc20vc2JpLmg+Cj4+ICsKPj4gKyNkZWZpbmUgQkFPX1NCSV9FWFRfSUQgMHgwODAwMGJhMAo+
PiArCj4+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgYmFvX2lwY3NobWVtX2h5cGVyY2Fs
bCh1bnNpZ25lZCBsb25nIGh5cGVyY2FsbF9pZCwKPj4gKwkJCQkJCSAgIHVuc2lnbmVkIGxvbmcg
aXBjc2htZW1faWQpCj4+ICt7Cj4+ICsJc3RydWN0IHNiaXJldCByZXQ7Cj4+ICsKPj4gKwlyZXQg
PSBzYmlfZWNhbGwoQkFPX1NCSV9FWFRfSUQsIGh5cGVyY2FsbF9pZCwgaXBjc2htZW1faWQsIDAs
IDAsIDAsIDAsCj4+ICsJCQkwKTsKPiBKdXN0IGxldCBsaW5lcyBsaWtlIHRoZXNlIHN0aWNrIG91
dC4gV2UgaGF2ZSB1cCB0byAxMDAgY2hhcnMgYW5kIHRoZXNlCj4gdHlwZXMgb2YgZmV3LWNoYXIg
d3JhcHMgYXJlIHRoZSBtb3N0IGFubm95aW5nLgo+Cj4gVGhhbmtzLAo+IGRyZXcKQWdyZWVkLiBJ
biB2MyB0aGUgSVBDIGh5cGVyY2FsbCBJRCBpcyBhIHNoYXJlZCBjb25zdGFudCwgc28KYmFvX2lw
Y3NobWVtX2h5cGVyY2FsbCgpIG5vdyB0YWtlcyBhIHNpbmdsZSBhcmd1bWVudCBhbmQgaXRzIGRl
Y2xhcmF0aW9uCmZpdHMgb24gb25lIGxpbmUsIGFuZCBJIHVud3JhcHBlZCB0aGUgcmVtYWluaW5n
IGZldy1jaGFyIHdyYXBzLiBGb3IgZXhhbXBsZQp0aGUgUklTQy1WIGVjYWxsIGlzIG5vdyBhIHNp
bmdsZSBsaW5lOgoKIMKgIMKgIHJldCA9IHNiaV9lY2FsbChCQU9fU0JJX0VYVF9JRCwgQkFPX0lQ
Q1NITUVNX0hZUEVSQ0FMTF9JRCwgCmlwY3NobWVtX2lkLCAwLCAwLCAwLCAwLCAwKTsKClRoYW5r
cy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
