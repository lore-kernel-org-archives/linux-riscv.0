Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772D4E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Dec 2024 02:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kJ0jmJdIRgcxw8s02NxSV3vVIVtzCL/LBkZj4O+H1I=; b=gq73fdcrE9Lp6Z
	uD8TB9zugqsK2tUTfImdxXolxk8KZ0jjsgAsCSuTGEam1bLnWVdmPCd+S5oQIJZaOsBwO/T1xImrg
	1hgNv4R26EgWNDP3YtfoBXp9Q1fL6hmSWoPdRGr/b6oT9MMg67Cki/YVdE2DW16sKPrqQY++cEn/k
	eBThz4bsvNK3Uz+/Zr9P/jNIY4jf80hYfp7OmQZ7ij6l7GXsqkzgqgHjzecLjiAPc5t/lzIjo4B/f
	jaWuJYSbW6r9Pp0E4rt5DCDLSHBUWcCAqFER23zStYuo9Cyz6rqqKww7WW5ypuPDyd8ysXQkj6SQ3
	PbG+SSQYhOxzwPGhdP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQHIM-0000000D7GC-1BzB;
	Wed, 25 Dec 2024 02:38:46 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQHIJ-0000000D7Et-2759
	for linux-riscv@lists.infradead.org;
	Wed, 25 Dec 2024 02:38:44 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2a3c075ddb6so2549103fac.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 18:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735094321; x=1735699121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjXOWRpiQMd4VH9hyxNW0+HHQNcFqQA5E8bE7AsgCuA=;
        b=OsCzZY0jPmh2SB/v3xp8z3OUR8uPRQmh9mV7gB3zyByITd6rjpeIExpepeH2nDjmlo
         ZdqOVWSSDgc1gdctNYwnrIHHYCfZzM68IEcX1H2GASEpWLm6ao0SvEfgNR5RDxt95frj
         V++iALfgPtk+viENzyq3sI6hfAVwwKsVfszocpD4qKDaQTXtvvz0x7nTtLXOtqZ3s5ct
         XrIaqlJa3/Q+7dNlV54wjlAHb6my/Yeo4KeEW5fS8VdEXGA/9LZ3Org4Kfa95tsAEN0e
         D5+JHYf//l1yUhopg5+5S70XxKPHSo+P5UIFWlFs+PEOYy2eMH8IYAPQ2Koiu8CKxiAa
         3K7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735094321; x=1735699121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjXOWRpiQMd4VH9hyxNW0+HHQNcFqQA5E8bE7AsgCuA=;
        b=MaeHR9lhoQYqQJYqPeXp2da6FhYIhVDguBertAoLQ2kjBaQHZB/Ysi0/dOCQOHRiix
         r8yR1EQkY2bw0Z8MMYu6gVkDdIHBLmp3Uxw3U1tIn0YWYDeA9YnmbUrsY6aX/GoLtvZw
         fXAqDYZRrYhbcZrDHAXDvcqsMSocAOwgmOUwY3iaWrT5GK/Subos+kIHLqmo6zxUsh3k
         qNWy22V2aNzR1JQnwNtSSA8lylSds1eer8uSnN6CbySwtZmTj2SPx8m9HClFuC9YBynJ
         4UtKO8RP3ong0ACg+49D1b2avB9aXJSl1a3ZQZrBDEJVpIU9/lZmtHh3TB9WqCf4CGk/
         XdDA==
X-Forwarded-Encrypted: i=1; AJvYcCUAQWwDf3f88paNKoaUHurmCGE1gw03hToKYcNwUB9cUSL2Esin2iaCInyupHyjGI9xNGyVP7kfzSIH1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YypIf0PGPTIddo7bfXf0cxmMDAdCRl74bmHWFQqZonDHGheYFgF
	BuC4UBzWyA9MBRLfzi1FYWSflWU1b23EbpFeIS6JwJzwNOH/XfetuFALfyz5RsXVZej9VSz9zwC
	Aw2V9qApo9M1f3/MEExYWmEDNByi7AJv5FncQjg==
X-Gm-Gg: ASbGncuaMlI3y4L+F/O9rhRBOJAmUxdyHjHGvzLvcxOABgKEzTr4VbjP6P53OR6V8ao
	XWhSkecrEnOQfIB0YMv0WI7wUkvOWccNznO/NGHgU
X-Google-Smtp-Source: AGHT+IELCT9fApH8+jyspDJA5PirW+nQQXliNle4cBghNvQBW+qTZhbIDS/wj13Tri3AVMpTwgDNVTIs6LtNDPN0H1A=
X-Received: by 2002:a05:6870:b9c4:b0:29d:c999:b90c with SMTP id
 586e51a60fabf-2a7fb00ba26mr9518618fac.1.1735094321735; Tue, 24 Dec 2024
 18:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20241224123946.97486-1-cuiyunhui@bytedance.com> <20241224-2148923339996d2eed033b7e@orel>
In-Reply-To: <20241224-2148923339996d2eed033b7e@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 25 Dec 2024 10:38:30 +0800
Message-ID: <CAEEQ3wnfmkm8GHTGPH6W-syUHcfotTp5ijQxNxdQ6uiRao3fQA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] RISC-V: Enable cbo.clean/flush in usermode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, charlie@rivosinc.com, samuel.holland@sifive.com, 
	cleger@rivosinc.com, andybnac@gmail.com, alexghiti@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_183843_691608_BCAD96BA 
X-CRM114-Status: GOOD (  21.98  )
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

SGkgZHJldywKCk9uIFR1ZSwgRGVjIDI0LCAyMDI0IGF0IDEwOjEx4oCvUE0gQW5kcmV3IEpvbmVz
IDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAyNCwgMjAy
NCBhdCAwODozOTo0NlBNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gRW5hYmxpbmcgY2Jv
LmNsZWFuIGFuZCBjYm8uZmx1c2ggaW4gdXNlciBtb2RlIG1ha2VzIGl0IG1vcmUKPiA+IGNvbnZl
bmllbnQgdG8gbWFuYWdlIHRoZSBjYWNoZSBzdGF0ZSBhbmQgYWNoaWV2ZSBiZXR0ZXIgcGVyZm9y
bWFuY2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVk
YW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA4
ICsrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKPiA+IGluZGV4IGMwOTE2ZWQzMThjMi4uNjBkMTgwYjk4ZjUyIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+IEBAIC0zMCw2ICszMCw3IEBACj4gPiAg
I2RlZmluZSBOVU1fQUxQSEFfRVhUUyAoJ3onIC0gJ2EnICsgMSkKPiA+Cj4gPiAgc3RhdGljIGJv
b2wgYW55X2NwdV9oYXNfemljYm96Owo+ID4gK3N0YXRpYyBib29sIGFueV9jcHVfaGFzX3ppY2Jv
bTsKPiA+Cj4gPiAgdW5zaWduZWQgbG9uZyBlbGZfaHdjYXAgX19yZWFkX21vc3RseTsKPiA+Cj4g
PiBAQCAtODcsNiArODgsOCBAQCBzdGF0aWMgaW50IHJpc2N2X2V4dF96aWNib21fdmFsaWRhdGUo
Y29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKPiA+ICAgICAgICAgICAgICAg
cHJfZXJyKCJaaWNib20gZGlzYWJsZWQgYXMgY2JvbS1ibG9jay1zaXplIHByZXNlbnQsIGJ1dCBp
cyBub3QgYSBwb3dlci1vZi0yXG4iKTsKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gPiAgICAgICB9Cj4gPiArCj4gPiArICAgICBhbnlfY3B1X2hhc196aWNib20gPSB0cnVlOwo+
ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IEBAIC05NDQsNiArOTQ3LDExIEBAIHZv
aWQgX19pbml0IHJpc2N2X3VzZXJfaXNhX2VuYWJsZSh2b2lkKQo+ID4gICAgICAgICAgICAgICBj
dXJyZW50LT50aHJlYWQuZW52Y2ZnIHw9IEVOVkNGR19DQlpFOwo+ID4gICAgICAgZWxzZSBpZiAo
YW55X2NwdV9oYXNfemljYm96KQo+ID4gICAgICAgICAgICAgICBwcl93YXJuKCJaaWNib3ogZGlz
YWJsZWQgYXMgaXQgaXMgdW5hdmFpbGFibGUgb24gc29tZSBoYXJ0c1xuIik7Cj4gPiArCj4gPiAr
ICAgICBpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1pJQ0JP
TSkpCj4gPiArICAgICAgICAgICAgIGN1cnJlbnQtPnRocmVhZC5lbnZjZmcgfD0gRU5WQ0ZHX0NC
Q0ZFOwo+ID4gKyAgICAgZWxzZSBpZiAoYW55X2NwdV9oYXNfemljYm9tKQo+ID4gKyAgICAgICAg
ICAgICBwcl93YXJuKCJaaWNib20gZGlzYWJsZWQgYXMgaXQgaXMgdW5hdmFpbGFibGUgb24gc29t
ZSBoYXJ0c1xuIik7Cj4gPiAgfQo+ID4KPiA+ICAjaWZkZWYgQ09ORklHX1JJU0NWX0FMVEVSTkFU
SVZFCj4gPiAtLQo+ID4gMi4zOS4yCj4gPgo+Cj4gVGhpcyBsb29rcyBnb29kLCBzbwo+Cj4gUmV2
aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4KPiBidXQs
IGFzIGEgc2VwYXJhdGUgcGF0Y2gsIHdlIHNob3VsZCBhbHNvIHByb3ZpZGUgaHdwcm9iZSBzdXBw
b3J0IGxpa2UKPiB6aWNib3ogaGFzLCBpLmUuIGFkZCBaSUNCT00gdG8gdGhlIElNQSBleHQwIGtl
eSBhbmQgYWRkIGEga2V5IGZvciB0aGUKPiB6aWNib20gYmxvY2sgc2l6ZS4gQW5kIHRoZW4sIGFz
IGFub3RoZXIgcGF0Y2gsIGFkZCBhIHRlc3RfemljYm9tKCkKPiBmdW5jdGlvbiB0byB0b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9od3Byb2JlL2Niby5jLgo+Cj4gVGhhbmtzLAo+IGRyZXcK
ClRoYW5rIHlvdSBmb3IgeW91ciByZXZpZXcuIEV2ZW4gdGhvdWdoIGh3cHJvYmUgZG9lc24ndCBl
eHBvcnQgWklDQk9NCmN1cnJlbnRseSwgdXNlci1tb2RlIHdvcmthcm91bmRzIGNhbiBzdGlsbCBi
ZSB1c2VkLgpBbHJpZ2h0LCBJJ2xsIHNlbmQgdHdvIHBhdGNoZXMgbmV4dCB0byBzdXBwb3J0IGh3
cHJvYmUncyBleHBvcnQgb2YKWklDQk9NIGFuZCBpbXByb3ZlIHRoZSBjYm8uYyBpbiBzZWxmdGVz
dHMvLgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
