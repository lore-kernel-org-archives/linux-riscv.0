Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F0EC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 21:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQVQqyqR4WqW9FqnAU9TVfMlkprZhAo3D/0pKM9CSD4=; b=mLVdVI+GqvatUS
	J+y7nyCLKQIKOI4jS8uyQy6jWAV+TMFeKU8SHUC6ytCTL2P0fCYrLREWbyKwj2wZ3vxhcExpovFn1
	lsXcgCGIrwoVe9shHggbIRm0hKgIAwBFuceeg7Lht3zKNT9Otj49vA7IBwPt2OKWrHJZ0U0zj1d2y
	xywuXSJkHwEb1GPl4YFPQr8Mae2nN5ZWHCBOZYSwAVEm4UPh+NW3fpr9BHThhcdecH6kvKaZskGVB
	cwG2PSHkFq5dfILIQjDb83WGMV7Ob4646qFnn2xHg4iwdMjVWrXcYIIv4z0opnuSP4uWipUdUha+y
	aqwR/yyqpt03Lvo4dXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oalDf-007Gdb-DR; Tue, 20 Sep 2022 21:55:55 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oalDa-007GcH-KA
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 21:55:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id y136so4031452pfb.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 14:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=moSdgyUQl//VdZ9FP+Uw4o8zPHAVDSY+Cj1OuTJQUDw=;
        b=mHxlbgZpxeAXsEQunnTmzHYHyl0SxcZ4dsdNRzQT7muGS5AG3abMLk7v8XqMHso292
         FCoYGbuYLfeIpKsAt1gji+9UZyNwaJCWrd5x4ncRiDELmD+QByaXzb8oes5O9SKDsHSo
         JenxGWE+f9EhUa+GwAvtCzeTV7uYbq/f/yOWsbULWm3NEbvH6tgwVPBcjTy2ZxK85SDb
         5itDN5pXlZk7e5fEkwUl41zL3QwMGB5sLUBYWq8HEeLBqCfN/cvzSZEdbOAdfldBg7oK
         6uBcMW+6EGRm8f5ziIZvB6bRpIW+Jpr/z3sQZSlZa9/0x8OPm6+3q+hLQWKsLhUHl7BU
         JrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=moSdgyUQl//VdZ9FP+Uw4o8zPHAVDSY+Cj1OuTJQUDw=;
        b=Q4e8cgcdDJY4QnmSZJkHKDeN33Eo6AdWVYC6tJ0YHSHq2UxNQKlz1Tyle54qrYcRe1
         Djsf4TtzZOuISkm424k8s20wfg5oYJXMvjwQtqmBxQsKJZu9lfOk7cqVGo+/ykR6WO65
         wQj+6KaA0EHYvEQmBcm9HoZpNSM60nKinjSBp/GnJoPWTQE/bvx/+Q3PklJGLWbSpp0q
         HE0keyD2N8JL69KI5qVciMp6lUz4T0tFzRrAL49ez8CWdA1NxKt7TDSJf3qgkil3S7AZ
         X1O7+AB07yMXVjFswBvJe3qNS3Bnq33I8e9NwadK9+uJeAvIFWLTCko7nGmtkJTyYmQr
         lv/A==
X-Gm-Message-State: ACrzQf1hJPNrO4wadot8igss5jvCLmJSv0KpJIyXuPAWnDtPGeHv9zJf
	sbqJsQRspYyqySLBc1fBimo=
X-Google-Smtp-Source: AMsMyM6MCtPVOyUx9VroC4l7EuR8z9rxuYzk3M8uylCRz0MfBOPdI3/5Q01ELslA/pYqwvBc104hvQ==
X-Received: by 2002:a63:20e:0:b0:439:34d7:5e16 with SMTP id 14-20020a63020e000000b0043934d75e16mr22099878pgc.373.1663710948369;
        Tue, 20 Sep 2022 14:55:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902f35100b0016f1ef2cd44sm367378ple.154.2022.09.20.14.55.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 14:55:47 -0700 (PDT)
Message-ID: <edd24375-2529-bad3-acd2-f1d7b01e63e8@roeck-us.net>
Date: Tue, 20 Sep 2022 14:55:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] riscv: enable Docker requirements in defconfig
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: heinrich.schuchardt@canonical.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
 guoren@kernel.org, mchitale@ventanamicro.com, arnaud.pouliquen@foss.st.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <mhng-3d4c5572-e386-45d8-9ed5-fd6971a60237@palmer-ri-x1c9>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <mhng-3d4c5572-e386-45d8-9ed5-fd6971a60237@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_145550_728706_FFD57AE3 
X-CRM114-Status: GOOD (  14.08  )
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

T24gOS8yMC8yMiAxMzoyNSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gU2F0LCAxMyBBdWcg
MjAyMiAwODo1ODo1MSBQRFQgKC0wNzAwKSwgbGludXhAcm9lY2stdXMubmV0IHdyb3RlOgo+PiBP
biBXZWQsIEp1biAwOCwgMjAyMiBhdCAwMjowMjo1MUFNICswMjAwLCBIZWlucmljaCBTY2h1Y2hh
cmR0IHdyb3RlOgo+Pj4gVGhlIGRlZmNvbmZpZyBrZXJuZWwgc2hvdWxkIGJlIGFibGUgdG8gcnVu
IERvY2tlci4KPj4+Cj4+PiBFbmFibGUgdGhlIG1pc3Npbmcgc2V0dGluZ3MgYWNjb3JkaW5nIHRv
IFsxXS4KPj4+IG1ha2Ugc2F2ZWRlZmNvbmZpZyBlbGltaW5hdGVzIENPTkZJR19TVEFDS1RSQUNF
Cj4+PiB3aGljaCBpcyBlbmFibGVkIGJ5IGRlZmF1bHQuCj4+Pgo+Pj4gTWFueSBvZiB0aGUgc2V0
dGluZ3MgYXJlIGFsc28gbmVlZGVkIHRvIHJ1biBhIGRlZmNvbmZpZyBrZXJuZWwKPj4+IG9uIGRl
ZmF1bHQgZGlzdHJvIGluc3RhbGxhdGlvbnMgb3IgdG8gcnVuIHNuYXBzLgo+Pj4KPj4+IFsxXSBo
dHRwczovL2dpdGh1Yi5jb20vbW9ieS9tb2J5L2Jsb2IvbWFzdGVyL2NvbnRyaWIvY2hlY2stY29u
ZmlnLnNoCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJp
Y2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPgo+Pgo+PiBUaGlzIHBhdGNoIHJlc3VsdHMgaW4g
KG9yIGV4cG9zZXMpIHRoZSBmb2xsb3dpbmcgYm9vdCB3YXJuaW5nIHdpdGggYWxsCj4+IHJpc2N2
MzIgYW5kIHJpc2N2NjQgcWVtdSBib290cy4KPj4KPj4gW8KgwqAgMTIuMjc4MDE0XSBERUJVR19M
T0NLU19XQVJOX09OKCFsb2NrZGVwX2hhcmRpcnFzX2VuYWJsZWQoKSkKPj4gW8KgwqAgMTIuMjc4
MjE4XSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxNDAgYXQga2VybmVsL2xvY2tpbmcvbG9ja2RlcC5j
OjU1MTAgY2hlY2tfZmxhZ3MrMHhlMi8weDFjMgo+PiBbwqDCoCAxMi4yNzg0NDZdIE1vZHVsZXMg
bGlua2VkIGluOgo+PiBbwqDCoCAxMi4yNzg2MjNdIENQVTogMCBQSUQ6IDE0MCBDb21tOiBTMDFz
eXNsb2dkIFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOIDUuMTku
MC0xNDE4NC1nNjlkYWM4ZTQzMWFmICMxCj4+IFvCoMKgIDEyLjI3ODc5MV0gSGFyZHdhcmUgbmFt
ZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+PiBbwqDCoCAxMi4yNzg5MzFdIGVwYyA6IGNoZWNr
X2ZsYWdzKzB4ZTIvMHgxYzIKPj4gW8KgwqAgMTIuMjc5MDI0XcKgIHJhIDogY2hlY2tfZmxhZ3Mr
MHhlMi8weDFjMgo+PiBbwqDCoCAxMi4yNzkwOTJdIGVwYyA6IGZmZmZmZmZmODBhOGVhNTAgcmEg
OiBmZmZmZmZmZjgwYThlYTUwIHNwIDogZmYyMDAwMDAxMDdmM2NiMAo+PiBbwqDCoCAxMi4yNzkx
ODBdwqAgZ3AgOiBmZmZmZmZmZjgxOWZlYzUwIHRwIDogZmY2MDAwMDAwNDk4OTVjMCB0MCA6IGZm
ZmZmZmZmODE4MzM1MjAKPj4gW8KgwqAgMTIuMjc5Mjg3XcKgIHQxIDogMDAwMDAwMDAwMDAwMDAw
MSB0MiA6IDJkMmQyZDJkMmQyZDJkMmQgczAgOiBmZjIwMDAwMDEwN2YzY2QwCj4+IFvCoMKgIDEy
LjI3OTM5NV3CoCBzMSA6IGZmZmZmZmZmODFhMDAxMzAgYTAgOiAwMDAwMDAwMDAwMDAwMDMwIGEx
IDogZmZmZmZmZmY4MTg5MjVlOAo+PiBbwqDCoCAxMi4yNzk1MDJdwqAgYTIgOiAwMDAwMDAwMDAw
MDAwMDEwIGEzIDogZmZmZmZmZmZmZmZmZmZmZSBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKPj4gW8Kg
wqAgMTIuMjc5NjA4XcKgIGE1IDogMDAwMDAwMDAwMDAwMDAwMCBhNiA6IGZmZmZmZmZmODAwNjZk
ODAgYTcgOiAwMDAwMDAwMDAwMDAwMDM4Cj4+IFvCoMKgIDEyLjI3OTcxNF3CoCBzMiA6IGZmZmZm
ZmZmODFhMDI0ZTAgczMgOiBmZmZmZmZmZjgxODkzNWIwIHM0IDogZmYyMDAwMDAxMDdmM2UyOAo+
PiBbwqDCoCAxMi4yNzk4MjVdwqAgczUgOiBmZmZmZmZmZjgwZTI3NzA4IHM2IDogMDAwMDAwMDIw
MDAwMDAyMiBzNyA6IGZmZmZmZmZmZmZmZmZmZmYKPj4gW8KgwqAgMTIuMjc5OTMyXcKgIHM4IDog
ZmZmZmZmZmY4MjQ5ZGExOCBzOSA6IDAwMDAwMDAwMDAwMDEwMDAgczEwOiAwMDAwMDAwMDAwMDAw
MDAxCj4+IFvCoMKgIDEyLjI4MDAzN13CoCBzMTE6IDAwMDAwMDAwMDAwMDAwMDEgdDMgOiBmZmZm
ZmZmZjgyNDc0MGFmIHQ0IDogZmZmZmZmZmY4MjQ3NDBhZgo+PiBbwqDCoCAxMi4yODAxNDJdwqAg
dDUgOiBmZmZmZmZmZjgyNDc0MGIwIHQ2IDogZmYyMDAwMDAxMDdmM2FhOAo+PiBbwqDCoCAxMi4y
ODAyMjddIHN0YXR1czogMDAwMDAwMDIwMDAwMDEwMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAw
IGNhdXNlOiAwMDAwMDAwMDAwMDAwMDAzCj4+IFvCoMKgIDEyLjI4MDM4Ml0gWzxmZmZmZmZmZjgw
YThlYmE4Pl0gbG9ja19pc19oZWxkX3R5cGUrMHg3OC8weDE0YQo+PiBbwqDCoCAxMi4yODA1MDVd
IFs8ZmZmZmZmZmY4MDAzZDY0OD5dIF9fbWlnaHRfcmVzY2hlZCsweDI2LzB4MjMyCj4+IFvCoMKg
IDEyLjI4MDYwOF0gWzxmZmZmZmZmZjgwMDNkODkyPl0gX19taWdodF9zbGVlcCsweDNlLzB4NjYK
Pj4gW8KgwqAgMTIuMjgwNjkwXSBbPGZmZmZmZmZmODAwMjI2MmM+XSBnZXRfc2lnbmFsKzB4YTYv
MHg4ZjYKPj4gW8KgwqAgMTIuMjgwNzcxXSBbPGZmZmZmZmZmODAwMDUxZGE+XSBkb19ub3RpZnlf
cmVzdW1lKzB4NjgvMHg0MTgKPj4gW8KgwqAgMTIuMjgwODYzXSBbPGZmZmZmZmZmODAwMDNhZjQ+
XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4MTAKPj4gW8KgwqAgMTIuMjgwOTc4XSBpcnEgZXZl
bnQgc3RhbXA6IDI5MDAKPj4gW8KgwqAgMTIuMjgxMDQxXSBoYXJkaXJxcyBsYXN0wqAgZW5hYmxl
ZCBhdCAoMjg5OSk6IFs8ZmZmZmZmZmY4MGE5NzYxYz5dIF9yYXdfc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSsweDU0LzB4NjIKPj4gW8KgwqAgMTIuMjgxMTc2XSBoYXJkaXJxcyBsYXN0IGRpc2FibGVk
IGF0ICgyOTAwKTogWzxmZmZmZmZmZjgwMDA4MTJjPl0gX190cmFjZV9oYXJkaXJxc19vZmYrMHhj
LzB4MTQKPj4gW8KgwqAgMTIuMjgxMzAzXSBzb2Z0aXJxcyBsYXN0wqAgZW5hYmxlZCBhdCAoMTg2
MCk6IFs8ZmZmZmZmZmY4MGE5ODA5Mj5dIF9fZG9fc29mdGlycSsweDNlMi8weDUxYwo+PiBbwqDC
oCAxMi4yODE0MzVdIHNvZnRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDE4NDMpOiBbPGZmZmZmZmZm
ODAwMTZmYzg+XSBfX2lycV9leGl0X3JjdSsweGI0LzB4ZGMKPj4gW8KgwqAgMTIuMjgxNTY0XSAt
LS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPj4gW8KgwqAgMTIuMjgxNzM1XSBw
b3NzaWJsZSByZWFzb246IHVuYW5ub3RhdGVkIGlycXMtb24uCj4+IFvCoMKgIDEyLjI4MTgxNV0g
aXJxIGV2ZW50IHN0YW1wOiAyOTAwCj4+IFvCoMKgIDEyLjI4MTg3NV0gaGFyZGlycXMgbGFzdMKg
IGVuYWJsZWQgYXQgKDI4OTkpOiBbPGZmZmZmZmZmODBhOTc2MWM+XSBfcmF3X3NwaW5fdW5sb2Nr
X2lycXJlc3RvcmUrMHg1NC8weDYyCj4+IFvCoMKgIDEyLjI4MjAwNF0gaGFyZGlycXMgbGFzdCBk
aXNhYmxlZCBhdCAoMjkwMCk6IFs8ZmZmZmZmZmY4MDAwODEyYz5dIF9fdHJhY2VfaGFyZGlycXNf
b2ZmKzB4Yy8weDE0Cj4+IFvCoMKgIDEyLjI4MjEyNV0gc29mdGlycXMgbGFzdMKgIGVuYWJsZWQg
YXQgKDE4NjApOiBbPGZmZmZmZmZmODBhOTgwOTI+XSBfX2RvX3NvZnRpcnErMHgzZTIvMHg1MWMK
Pj4gW8KgwqAgMTIuMjgyMjQyXSBzb2Z0aXJxcyBsYXN0IGRpc2FibGVkIGF0ICgxODQzKTogWzxm
ZmZmZmZmZjgwMDE2ZmM4Pl0gX19pcnFfZXhpdF9yY3UrMHhiNC8weGRjCj4+Cj4+IFJldmVydGlu
ZyB0aGlzIHBhdGNoIGZpeGVzIHRoZSBwcm9ibGVtLiBCaXNlY3QgbG9nIGF0dGFjaGVkLgo+IAo+
IFNvcnJ5IGZvciBoYXZpbmcgbWlzc2VkIHRoaXMgcmVwb3J0LCBidXQgSSBkb24ndCBzZWUgdGhp
cyBub3cgYW5kIGRvbid0IHJlbWVtYmVyIGhhdmluZyBzZWVuIGl0IGJlZm9yZS7CoCBBcmUgeW91
IHN0aWxsIHNlZWluZyB0aGUgaXNzdWU/Cj4gCgpZZXMgYW5kIG5vLiBUaGUgYmFja3RyYWNlIGlz
IG9ubHkgc2VlbiBpZiBDT05GSUdfQ0dST1VQX0ZSRUVaRVIgaXMgZW5hYmxlZC4KSSBkaXNhYmxl
ZCBpdCBpbiBteSBib290IHRlc3RzLCBzbyBJIGRvbid0IHNlZSBpdCBhbnltb3JlLgoKR3VlbnRl
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
