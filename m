Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD2AC25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0RMwK9BKuTGzVr+Cx4WAxIa63WyBi80lR6nZ5IFvxY=; b=Ewlz3vUhz+uRmu
	e0SLYzOVKrtHWNVWuw1BUOlrMMAlHse+tf8yYmO0t6voayhkQdXdt0rolF0rOB++saUPCGmS6G/pK
	hS7V69k9F0nxUqG7wFuJTp8/WqgPeuO1l+mSA8r2FnJDaqyT+zQiAx+D+F047pI2+o35XbO2glY1m
	VqHTV13xkQJVepUBFkErX40t+N/BsOc2mkiJTp/gHBYDFh2QDvLWCay6Z1XYQFtGPuyFFGXcACgw6
	718zzgUNLIFazsjPIdFMzbRGDXV6itqyJsLl19Z0GxE2OYJJZUcdGQsPHoetZnVskcZ5+x8Zyc+wn
	SD7q4Gz2wP9gfj0+ZJrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEORU-00000001UrQ-0w1b;
	Tue, 04 Jun 2024 07:18:48 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEORQ-00000001Upn-0ROQ
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 07:18:45 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-6c5ab02e57bso157043a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 00:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717485522; x=1718090322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IN4YotoHrJqUzJm3B5rfjHxZ9heuhTQwYjd8l3vWTCM=;
        b=rXP9FShMwirWltH+HOY4Cvgnl62WKQoHl3WP5cfOISSC5IHNaht9Ky6i1UWkLlAizk
         ALItI6cZEDgb06JscJptZkkdzG/0hsgXxTFNF68OGiEhFrlx0Yiykok5/5TqrJaxmJ/s
         DQ6FhTL0X546L8qZ4UH45gJl62NWVdVR9IT0s3RSZEIytPAQ8QPI0L0zA1XvOdcBKQZ/
         k+FU8Hti7NTj+3HYUj7Ip3z+Kk2+5dtx1w5k1YFCxwvfUGqdqh67HHGV3kUUzSZiwvRw
         KpAZsturh27jbxzwZLuMT2LJRgeCYZq+P922pLSiDTFVKg/sRnzXdiQAQoNp+7OubXSN
         C7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717485522; x=1718090322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IN4YotoHrJqUzJm3B5rfjHxZ9heuhTQwYjd8l3vWTCM=;
        b=Lel/Mfswkqf/T9rDn8RN4IXwMlt0uQld2sKPUfpY2BDEWNy4cJD9JVdn/X/73nV0B3
         oxikDNPazXQtYNGfnCyFXAaIXKVDqfaA7glSvke5qHi7uqMUEtz0k8urMKkjfj2Lf54I
         VjQGwOnpzHIP+1xaHxgtWA5TqkKihCYdEn7629XxHgigrk0IsjUBiF5Iy6PxmYNXEgIH
         ypbsZlXMpsq5qaHPDgtlrhwK/v90lQoBcX/AgydWvyCJot/7/l78dvFPWxnFS4FPkyhp
         1WUAUwx20qc0FtyHRMFwlLG6M+t90hxPHNV00E8QY/QbXuNMv/4jbmKfQG8OBuut2suA
         FJJg==
X-Forwarded-Encrypted: i=1; AJvYcCUEbOHkIZmRcSRte6xjRdCbThj7OuB6Gkp7wNhNA6bjR3j7xXc84B//M1dehM6fhvB3fQkSylmHamfiyrirgZNSEIdq1LxqyH7Xysa1g30+
X-Gm-Message-State: AOJu0YxBuQK8mbx0jLNtCMy3G0brZRzAtz06pqhvdh765+wxv7zyLY17
	h34B3LDzgTExYK2sYHHAxJlXfIp4ycVPMJw7/CMh0Z5j/1HzsZtm+4XHRk+djUk=
X-Google-Smtp-Source: AGHT+IFWL8L1FbR0wZ7pGG9sTqaIq8MsqqTQdkXuTxrZK9vhL+JYsZ64DIfumPIQtJaghfe3mvA/Mg==
X-Received: by 2002:a05:6a21:33a1:b0:1b2:63c3:274c with SMTP id adf61e73a8af0-1b26f35e160mr12461974637.6.1717485521635;
        Tue, 04 Jun 2024 00:18:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:d768:c577:5bf0:47ab? ([2a01:e0a:999:a3a0:d768:c577:5bf0:47ab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1aa9dce87sm8984869a91.21.2024.06.04.00.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 00:18:40 -0700 (PDT)
Message-ID: <06d8ae43-4aad-4637-a33b-9bae91b23872@rivosinc.com>
Date: Tue, 4 Jun 2024 09:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, corbet@lwn.net,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, anup@brainfault.org,
 shuah@kernel.org, atishp@atishpatra.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <mhng-d5016935-99b6-4dc6-bbd2-ed84eb834f98@palmer-ri-x1c9a>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <mhng-d5016935-99b6-4dc6-bbd2-ed84eb834f98@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_001844_153858_1020C8DC 
X-CRM114-Status: GOOD (  11.47  )
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

CgpPbiAzMC8wNS8yMDI0IDIzOjEzLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBXZWQsIDIy
IE1heSAyMDI0IDAwOjIwOjA5IFBEVCAoLTA3MDApLCBjbGVnZXJAcml2b3NpbmMuY29tIHdyb3Rl
Ogo+Pgo+Pgo+PiBPbiAyMS8wNS8yMDI0IDIxOjQ5LCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBP
biBGcmksIE1heSAxNywgMjAyNCBhdCAwNDo1Mjo0OFBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIg
d3JvdGU6Cj4+Pgo+Pj4+ICtzdGF0aWMgaW50IHJpc2N2X2V4dF96Y2FfZGVwZW5kcyhjb25zdCBz
dHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhCj4+Pj4gKmRhdGEsCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHVuc2lnbmVkIGxvbmcgKmlzYV9iaXRtYXApCj4+Pj4g
K3sKPj4+PiArwqDCoMKgIHJldHVybiBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlz
YV9iaXRtYXAsCj4+Pj4gUklTQ1ZfSVNBX0VYVF9aQ0EpID8gMCA6IC1FUFJPQkVfREVGRVI7Cj4+
Pj4gK30KPj4+PiArc3RhdGljIGludCByaXNjdl9leHRfemNkX3ZhbGlkYXRlKGNvbnN0IHN0cnVj
dCByaXNjdl9pc2FfZXh0X2RhdGEKPj4+PiAqZGF0YSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjb25zdCB1bnNpZ25lZCBsb25nICppc2FfYml0bWFwKQo+Pj4+ICt7
Cj4+Pj4gK8KgwqDCoCByZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShpc2Ff
Yml0bWFwLAo+Pj4+IFJJU0NWX0lTQV9FWFRfWkNBKSAmJgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoCBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsCj4+Pj4gUklT
Q1ZfSVNBX0VYVF9kKSA/IDAgOiAtRVBST0JFX0RFRkVSOwo+Pj4+ICt9Cj4+Pgo+Pj4gQ291bGQg
eW91IHdyaXRlIHRoZSBsb2dpYyBpbiB0aGVzZSBvdXQgbm9ybWFsbHkgcGxlYXNlPyBJIHRoaW5r
IHRoZXknZAo+Pj4gYmUgbW9yZSB1bmRlcnN0YW5kYWJsZSAocGFydGljdWxhciB0aGlzIHNlY29u
ZCBvbmUpIGJyb2tlbiBkb3duIGFuZCB3aXRoCj4+PiBlYXJseSByZXR1cm4uCj4+Cj4+IFllcyBz
dXJlLiBJJ2xsIHByb2JhYmx5IG1ha2UgdGhlIHNhbWUgdGhpbmcgZm9yIHpjZl92YWxpZGF0ZSBh
cyB3ZWxsIGFzCj4+IHJlbW92aW5nIHRoZSAjaWZkZWYgYW5kIHVzaW5nIElTX0VOQUJMRUQoKToK
Pj4KPj4gc3RhdGljIGludCByaXNjdl9leHRfemNmX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNj
dl9pc2FfZXh0X2RhdGEgKmRhdGEsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKPj4gewo+PiDCoMKgwqDCoGlmIChJ
U19FTkFCTEVEKENPTkZJR182NEJJVCkpCj4+IMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFM
Owo+Pgo+PiDCoMKgwqDCoGlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9i
aXRtYXAsIFJJU0NWX0lTQV9FWFRfWkNBKSAmJgo+PiDCoMKgwqDCoMKgwqDCoCBfX3Jpc2N2X2lz
YV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRfZikpCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pgo+PiDCoMKgwqDCoHJldHVybiAtRVBST0JF
X0RFRkVSOwo+PiB9Cj4gCj4gQXJlIHlvdSBnb2luZyB0byBzZW5kIGEgdjYgKHNvcnJ5IGlmIEkg
bWlzc2VkIGl0LCBJJ20gdHJ5aW5nIHRvIHVudGFuZ2xlCj4gYWxsIHRoZXNlIElTQSBwYXJzaW5n
IHBhdGNoIHNldHMpLgoKWWVzLCBJIHdhcyB3YWl0aW5nIGZvciBtb3JlIGZlZWRiYWNrL1JiIGJ5
IGl0IHNlZW1zIGxpa2UgSSBub3cgaGF2ZQpldmVyeXRoaW5nIEkgbmVlZC4gSSdsbCBzZW5kIHRo
YXQuCgpUaGFua3MsCgpDbMOpbWVudAoKPiAKPj4KPj4+Cj4+PiBPdGhlcndpc2UsCj4+PiBSZXZp
ZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4+Cj4+
PiBDaGVlcnMsCj4+PiBDb25vci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
