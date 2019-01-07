Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13548C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 08:56:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8E7B2089F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 08:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c6jkXdG1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="at7MnrtC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8E7B2089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CydT3RKCBisoFiL9qJRamkOjzvRotnJQl5Loj3xvDXs=; b=c6jkXdG1b/YsEB
	TMdWeHuFfWvAmX1Rdhbk9rTeeLVZdwCLAEw+4AtOcFAXHTT8PvvNFFD+t+GJ09eXIrG465pLrtQx5
	32g2qstx6uHRMzjkUcUD29Hi+OeytxqbA8/ErgP/19CUo5SxiweMBend8dZcws4ZhecPmcVBbzwrt
	9ydhX4EjikzDq+fJMHUgy278XA4+c2LinhHpUtqxckVnrRn9x35VLmBeEKqLbKia9/xumkfSmU9eB
	OJ4P4aWHwa6B/uViZyDF4KamgnbtCGCZaMuvMs/Xi2Ah8Y/VEN/UdQaeVwa0txgDInVTv1Lh2ETVS
	egIGnGI7U8IEe0LtCIPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggQi7-00028j-Vq; Mon, 07 Jan 2019 08:56:39 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggQi5-00028H-0z
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 08:56:38 +0000
Received: by mail-ed1-x542.google.com with SMTP id h15so103637edb.4
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 00:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3QJDlXU6jEsWi1B5HJNrdK28a8zG30jKkE66cy0wHdI=;
 b=at7MnrtC9Fz8B0Il1KsSr2ChLxsnR71uG4379X3xdeg5R2w8xysF07IwbwmpguIi6n
 PjMMlS97qpA53gWp+tjcNHZt61G83+wRHEpALQrZ7G5XLdIQeQaZAJA9T1jXsGdrL77S
 75fZmNkwNCqOKWFx+JqDdtDj4PkUsHGEe8m18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3QJDlXU6jEsWi1B5HJNrdK28a8zG30jKkE66cy0wHdI=;
 b=ZHRZlE8nqrBL2ZRaFKLj1k+kPCSthgulP3u2Az3Ngxp95gfOJmiJFQN2Qeia8zBKKx
 WNSMzSrUkh7sijuIDsMJEYdUSRPmgHqjgzFojfjGoUjtdlHqrR+caqlYqy4zhmoPCld1
 jBbhMVHl7NAExgsC4ZfC8Z+x8MbFdkKqz1O8rwzX98R7kXHu1V0Hg1aU9VqyBfQURjp8
 75fhmhNyXKLvlFp7/RMI7cLCRVEF3s7bd+WTnJfU4ie4h1P/yyfWLq6fHDB4+33cwil3
 x9Y6QXz7r++qoxyHe46iVpBq5szXWMN8NQYFrgaaUiZbd4hzO1/aLCBe6e52rHGdLioq
 r+WQ==
X-Gm-Message-State: AA+aEWb34qc2zOfhu6rywNqAN/g0p+7vMnqiFI+Y+jD3SbDdRNbl1SMX
 U7cHeMYuhUcw63rG0Q0wXOXPaA==
X-Google-Smtp-Source: AFSGD/X/n+YINqJ9uTCHdgCAaL/iERW/gcv4ZJahWtD5xnlatwDxdXIu/mvBlqfSJi5PYLUz1A3L3Q==
X-Received: by 2002:a17:906:5d10:: with SMTP id
 g16-v6mr46408293ejt.212.1546851394320; 
 Mon, 07 Jan 2019 00:56:34 -0800 (PST)
Received: from [192.168.0.40] (29.139.135.77.rev.sfr.net. [77.135.139.29])
 by smtp.googlemail.com with ESMTPSA id
 v12-v6sm20117631ejk.58.2019.01.07.00.56.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 00:56:33 -0800 (PST)
Subject: Re: [PATCH v2 1/4] dt-bindings: Correct RISC-V's timebase-frequency
To: Palmer Dabbelt <palmer@sifive.com>
References: <mhng-9767f556-9f5a-4366-931f-131222d3253b@palmer-si-x1c4>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <a3e05488-053d-ae3e-b342-0799e60b1abd@linaro.org>
Date: Mon, 7 Jan 2019 09:56:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <mhng-9767f556-9f5a-4366-931f-131222d3253b@palmer-si-x1c4>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_005637_081105_61084611 
X-CRM114-Status: GOOD (  19.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 aou@eecs.berkeley.edu, dmitriy@oss-tech.org, anup@brainfault.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, robh+dt@kernel.org, tglx@linutronix.de,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDQvMDEvMjAxOSAwMTozNiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gRnJpLCAxNCBE
ZWMgMjAxOCAwMToxNzoyNCBQU1QgKC0wODAwKSwgZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZyB3
cm90ZToKPj4gT24gMTQvMTIvMjAxOCAwMDoxNCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+PiBGcm9t
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+Cj4+Pgo+Pj4gSW4gUklTQy1WIHN5
c3RlbXMsIHRpbWViYXNlLWZyZXF1ZW5jeSBpcyBwZXIgY3B1IGluc3RlYWQgb2Ygb25lCj4+PiBp
bnN0YW5jZSBmb3IgZW50aXJlIFNPQyBhcyB0aGVyZSBpcyBhIGluZGl2aWR1YWwgdGltZXIgcGVy
IGVhY2ggQ1BVLgo+Pj4gRml4IHRoZSBEVCBiaW5kaW5nIGFjY29yZGluZ2x5Lgo+Pgo+PiBXaHkg
bm90IHVzZSBhIGZpeGVkLWNsb2NrIGluc3RlYWQgb2YgdGhpcyB0aW1lYmFzZSBwcm9wZXJ0eSB3
aGljaCBmb3JjZXMKPj4gdG8gZGVjbGFyZSBhIGdsb2JhbCB2YXJpYWJsZSB0byBiZSBleHBvcnRl
ZCBmcm9tIGFyY2gvcmlzY3YgdG8KPj4gZHJpdmVycy9jbG9ja3NvdXJjZSA/Cj4gCj4gVGhhdCBt
YWtlcyBzZW5zZSB0byBtZS7CoCBJJ3ZlIGFsd2F5cyBkaXNsaWtlZCB0aGlzIGdsb2JhbCB2YXJp
YWJsZSBhbmQgYQo+IGJpZyBwYXJ0IG9mIHdoeSBteSBvcmlnaW5hbCB2ZXJzaW9uIGdvdCBkZWxh
eWVkIGZvcmV2ZXIgaXMgdGhhdCBJJ2QKPiBob3BlZCB0byBnZXQgcmlkIG9mIGl0Lgo+IAo+IEdp
dmVuIHRoYXQgdGhpcyBpcyBhbGwgYSBtZXNzIGFueXdheSBJJ20gT0sgYnJlYWtpbmcgYmFja3dh
cmRzCj4gY29tcGF0aWJpbGl0eSBoZXJlLgo+IAo+IElzIHRoZXJlIGFuIGV4YW1wbGUgb2YgaG93
IHRvIGRvIHRoaXM/CgoKQ2FuIHlvdSBnaXZlIHNvbWUgaGFyZHdhcmUgZGV0YWlscz8gSXMgdGhl
IHRpbWViYXNlIGZyZXF1ZW5jeSBjb25zdGFudD8KSWYgaXQgaXMgdGhlIGNhc2UsIGEgZml4ZWQt
Y2xvY2sgc2hhcmVkIGZvciBlYWNoIGNwdSBjYW4gYmUgdXNlZCwgbm8/CgogICAgbXljbG9jazog
bXljbG9jayB7CiAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7CiAgICAgICAgI2Ns
b2NrLWNlbGxzID0gPDA+OwogICAgICAgIGNsb2NrLWZyZXF1ZW5jeSAgPSA8MTAwMDAwMD47CiAg
ICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gIm15dGltZXIiOwogICAgfTsKCkFsdGVybmF0aXZl
bHksIG1heSBiZSBkaWZmZXJlbnQgb3V0cHV0IGNhbiBiZSBzcGVjaWZpZWQgd2l0aCB0aGUgY2xv
Y2ssCm9uZSBmb3IgZWFjaCBDUFVzLgoKT3IgaWYgdGhlIHRpbWViYXNlIGZyZXF1ZW5jeSBpcyBy
ZXN1bHRpbmcgZnJvbSBhIGNsb2NrIGRpdmlzb3IsIGl0IGNhbgpiZSBkZWZpbmVkIGFzOgoKICAg
ICAgICBjbG9jayB7CiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWZhY3Rvci1j
bG9jayI7CiAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnBhcmVudGNsaz47CiAgICAgICAgICAg
ICAgICAjY2xvY2stY2VsbHMgPSA8MD47CiAgICAgICAgICAgICAgICBjbG9jay1kaXYgPSA8Mj47
CiAgICAgICAgICAgICAgICBjbG9jay1tdWx0ID0gPDE+OwogICAgICAgIH07CgpoYXJkd2FyZSBk
ZXRhaWxzIGNhbiBoZWxwIHRvIG5hcnJvdyBkb3duIHRoZSByaWdodCBkZXNjcmlwdGlvbi4KCgo+
PiBJbiBhZGRpdGlvbiwgcGxlYXNlIGFkZCB0aGUgJ0ZpeGVzJyB0YWcKPj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAc2lmaXZlLmNvbT4KPj4+IFNpZ25lZC1vZmYt
Ynk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+Pj4gW0F0aXNoOiBVcGRhdGUgdGhl
IGNvbW1pdCB0ZXh0XQo+Pj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJh
QHdkYy5jb20+Cj4+PiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
Pj4+IC0tLQo+Pj4gwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1
cy50eHQgfCA0ICsrKy0KPj4+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvY3B1cy50eHQKPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2NwdXMudHh0Cj4+PiBpbmRleCBhZGY3YjdhZi4uYjBiMDM4ZDYgMTAwNjQ0
Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy50
eHQKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVz
LnR4dAo+Pj4gQEAgLTkzLDkgKzkzLDkgQEAgTGludXggaXMgYWxsb3dlZCB0byBydW4gb24uCj4+
PiDCoMKgwqDCoMKgwqDCoMKgIGNwdXMgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdGltZWJhc2UtZnJlcXVlbmN5ID0gPDEwMDAwMDA+Owo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY3B1QDAgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLWZyZXF1ZW5jeSA9IDwxNjAwMDAwMDAwPjsKPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpbWViYXNl
LWZyZXF1ZW5jeSA9IDwxMDAwMDAwPjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNpZml2ZSxyb2NrZXQwIiwgInJpc2N2
IjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
ZXZpY2VfdHlwZSA9ICJjcHUiOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGktY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47Cj4+PiBAQCAtMTEzLDYg
KzExMyw3IEBAIExpbnV4IGlzIGFsbG93ZWQgdG8gcnVuIG9uLgo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNwdUAxIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjbG9jay1mcmVxdWVuY3kgPSA8MTYwMDAwMDAwMD47Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0aW1lYmFzZS1mcmVxdWVuY3kgPSA8MTAw
MDAwMD47Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29tcGF0aWJsZSA9ICJzaWZpdmUscm9ja2V0MCIsICJyaXNjdiI7Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZC1jYWNoZS1ibG9jay1zaXpl
ID0gPDY0PjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkLWNhY2hlLXNldHMgPSA8NjQ+Owo+Pj4gQEAgLTE0NSw2ICsxNDYsNyBAQCBFeGFtcGxl
OiBTcGlrZSBJU0EgU2ltdWxhdG9yIHdpdGggMSBIYXJ0Cj4+PiDCoFRoaXMgZGV2aWNlIHRyZWUg
bWF0Y2hlcyB0aGUgU3Bpa2UgSVNBIGdvbGRlbiBtb2RlbCBhcyBydW4gd2l0aAo+Pj4gYHNwaWtl
IC1wMWAuCj4+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBjcHVzIHsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdGltZWJhc2UtZnJlcXVlbmN5ID0gPDEwMDAwMDA+Owo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1QDAgewo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZV90eXBlID0gImNwdSI7Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0g
PDB4MDAwMDAwMDA+OwoKCi0tIAogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg
4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxo
dHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90
d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3Jn
L2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
