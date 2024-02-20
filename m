Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310FEC5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1azJtyeIUEkC3dnL/nUqegVBgJ/H5Xl91N4cC77Nz8s=; b=4ygQRvNvg13kyn
	LjPcC6qGZivnaDsNQeQKRC7yXJgLxJ6cL6pPQBVlV5C2aui3qZ0wftrk5qOSwSAyvxaeSopcXjjJj
	p0kHUTxWiKsIGygL0aKhZrd6CLRJRS32b8DSdcjtPdydFDORWi4YkXAsuB5ZUWy2fxYU3Quh4P5ff
	RCNFheCUleyg0t0xLCkyBRm3RvAhVpcYn6OUsXOdwG3poXCk6Bj/SuuWU2SsaPM11WFbcxOHFfhpy
	XYLxorNVYDeCpDaBLM1MdwtBAFCoPWU77RDBbe/kllg25dHoFRUdHM/jvyhWAam8pElipwRQ0DXgr
	wS/CFWTkUxcqpoSTQ2gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTSp-0000000FYn5-2yZf;
	Tue, 20 Feb 2024 16:59:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcTSm-0000000FYlJ-18OM
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 16:59:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4126e9d587dso2492165e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 08:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708448362; x=1709053162; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EviEX8TRRD/2iXyTrJZUWCxAWI35FiIxGgn/BSnnfY=;
        b=RDDo7+rJ2pYzz736fv0nFD28+70dnxTM/KA6f4beQVjfO8T4yblFAkC2uhBzVGQh0B
         Ev8BBEmEVIWEC1IL4ijLe5OlsszkrKx/CwBTZ8W5OEMKS4OQooOz0zVY/H4Oc5o7QQ5O
         V8E4oY74oorU2dE2Qaiu2SYjH7+B9ZGoD8HCVSXpP2oONeLgYwWEJuFG1hf0c/i+Ij1k
         NycnsP8UKiowFF48x2MLJs1WT5/6biFrvLy28DjA2JdWNkzF3YrD4vI1vXTE3Qf1emFP
         akvFETrLg42uh3dlbQ7jTMO3YIg8SuDVvhcEhNU8seBtrF4t3H/5aiQkNdsgiQatFnxq
         A8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708448362; x=1709053162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EviEX8TRRD/2iXyTrJZUWCxAWI35FiIxGgn/BSnnfY=;
        b=RwvbniE6lvkRMlNu0AFG4yGPxGx5oWETKnJGfJGzWY7s8i80HDFamPUgjm/cKyoxYa
         KXFLtyo/lIHuJTUCZ8D6dFbHM1Vp69Ns4AQwnUFY6cXr+smZUikt26iykeK00TwcWuFt
         exCdEUu5/PQa24fGRD3/9/P6efVItBI4x/p6T+vt4NvhzX1vfnhoUbe+Tn1mkzY0O2WE
         ibxI4MRThkF6DIs3beHr/M1V9GUmkL+myl6p3SiqibLbJpOFpSSccpV4M67OxwXTtyQK
         Ke/Y6bzGqjE4g06r0PtQeq1a43jiPnOvvqGj2Rk7choZJUtI+z6fb4oym8jjrDWLutKZ
         qqDg==
X-Forwarded-Encrypted: i=1; AJvYcCWB8L9nwt46MC0g0f5oOU6knG3JafxPjpI7g36uwiFeS25Dmgb8e/7ZzJ/y/JOfjkasyRVaqkZVLC5RCOXm5A8EPBQi8OeHBEJpDorWhaGw
X-Gm-Message-State: AOJu0Yzt15uf8pE6l9eBfWIJ77LgUTGec+0UkNjizjIFbpq7yYQyyLRI
	Iac/XDxeGk+7lTckkoqBjTq39nYYBfrMJganzoZStH2ddHPrkuJ8jwbH/bPocjg=
X-Google-Smtp-Source: AGHT+IGQxErl3whqUl2JduTZmonP9tZ9r2pRvNgP2swc0PUclE5cXdKNpnDIqc/OizhzpT3qAwPiUQ==
X-Received: by 2002:a05:600c:3513:b0:410:7d33:25ba with SMTP id h19-20020a05600c351300b004107d3325bamr10725379wmq.4.1708448361744;
        Tue, 20 Feb 2024 08:59:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:6202:c7ea:a0cd:ad4a? ([2a01:e0a:999:a3a0:6202:c7ea:a0cd:ad4a])
        by smtp.gmail.com with ESMTPSA id m15-20020a056000008f00b0033b728190c1sm14059504wrx.79.2024.02.20.08.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 08:59:21 -0800 (PST)
Message-ID: <54d2ad13-9d9c-4ec0-96d7-95a54d54a29c@rivosinc.com>
Date: Tue, 20 Feb 2024 17:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: hwprobe: export largest userspace address
Content-Language: en-US
To: Stefan O'Rear <sorear@fastmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Robin Ehn <rehn@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>,
 Jessica Clarke <jrtc27@jrtc27.com>
References: <20240220110950.871307-1-cleger@rivosinc.com>
 <00cae989-9640-4931-9683-dd889cd6b7db@app.fastmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <00cae989-9640-4931-9683-dd889cd6b7db@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_085924_588901_10E4F3DA 
X-CRM114-Status: GOOD (  23.81  )
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

CgpPbiAyMC8wMi8yMDI0IDE3OjUwLCBTdGVmYW4gTydSZWFyIHdyb3RlOgo+IE9uIFR1ZSwgRmVi
IDIwLCAyMDI0LCBhdCA2OjA5IEFNLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+IFNvbWUgdXNl
cnNwYWNlIGFwcGxpY2F0aW9ucyAoT3BlbkpESyBmb3IgaW5zdGFuY2UpIHVzZXMgdGhlIGZyZWUg
TVNCcwo+PiBpbiBwb2ludGVycyB0byBpbnNlcnQgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBmb3Ig
dGhlaXIgb3duIGxvZ2ljIGFuZAo+PiBuZWVkIHRvIGdldCB0aGlzIGluZm9ybWF0aW9uIGZyb20g
c29tZXdoZXJlLiBDdXJyZW50bHkgdGhleSByZWx5IG9uCj4+IHBhcnNpbmcgL3Byb2MvY3B1aW5m
byAibW11PXN2eHgiIHN0cmluZyB0byBvYnRhaW4gdGhlIGN1cnJlbnQgdmFsdWUgb2YKPj4gdmly
dHVhbCBhZGRyZXNzIHVzZWQgYml0cyBbMV0uIFNpbmNlIHRoaXMgcmVmbGVjdCB0aGUgcmF3IE1N
VSBtb2RlCj4+IHN1cHBvcnRlZCwgaXQgbWlnaHQgZGlmZmVyIGZyb20gdGhlIGxvZ2ljYWwgb25l
IHVzZWQgaW50ZXJuYWxseS4KPj4gRXhwb3J0aW5nIHRoZSBtYXhpbXVtIG1tYXBwYWJsZSBhZGRy
ZXNzIHRocm91Z2ggaHdwcm9iZSB3aWxsIGFsbG93IGEKPj4gbW9yZSBzdGFibGUgaW50ZXJmYWNl
IHRvIGJlIHVzZWQuIEZvciB0aGF0IHB1cnBvc2UsIGFkZCBhIG5ldyBod3Byb2JlCj4+IGtleSBu
YW1lZCBSSVNDVl9IV1BST0JFX01BWF9LRVkgd2hpY2ggd2lsbCBleHBvcnQgdGhlIG1heGltdW0g
bW1hcHBhYmxlCj4+IHVzZXJzcGFjZSBhZGRyZXNzLgo+Pgo+PiBMaW5rOiAKPj4gaHR0cHM6Ly9n
aXRodWIuY29tL29wZW5qZGsvamRrL2Jsb2IvbWFzdGVyL3NyYy9ob3RzcG90L29zX2NwdS9saW51
eF9yaXNjdi92bV92ZXJzaW9uX2xpbnV4X3Jpc2N2LmNwcCNMMTcxIAo+PiBbMV0KPj4gU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IAo+IFJldmll
d2VkLWJ5OiBTdGVmYW4gTydSZWFyIDxzb3JlYXJAZmFzdG1haWwuY29tPgo+IAo+IElkZWFsbHks
IHdlJ2QgaGF2ZSBzb21ldGhpbmcgYXJjaC1pbmRlcGVuZGVudCwgYnV0IHRoaXMgaXMgYSBnb29k
IGludGVyZmFjZQo+IGFuZCBzaW1wbGUgZW5vdWdoIHRvIHN1cHBvcnQgaW4gcGVycGV0dWl0eS4K
CkhpIFN0ZWZhbiwKCkluZGVlZCB3aGlsZSBub3QgYXJjaGl0ZWN0dXJlIHNwZWNpZmljLCBJIGRp
ZCBub3QgZm91bmQgYW55dGhpbmcKcmVsZXZhbnQgaW4gd2hpY2ggdGhpcyBpbmZvcm1hdGlvbiBj
b3VsZCBlYXNpbHkgZml0LiBzeXNjb25mIGlzIGFjdHVhbGx5Cm1haW5seSBjb21waWxlIHRpbWUg
Y29uc3RhbnRzIHJldHVybmVkIGJ5IHRoZSBsaWJjLiBBbmQgdGhlIGZldyBub24KUE9TSVggc3lz
Y29uZiBkZWZpbmVzIChfU0NfeHgpIGFyZSBhY3R1YWxseSB1c2luZyBlaXRoZXIgL3Byb2MgcGFy
c2luZwpvciB0aGUgc3lzaW5mbyBzeXNjYWxsIHdoaWNoIGRpZCBub3QgY2hhbmdlZCBzaW5jZSBr
ZXJuZWwgMi4zLiBCdXQgbWF5YmUKc29tZW9uZSBvdXQgdGhlcmUga25vd3Mgc29tZXRoaW5nIGJl
dHRlciBzdWl0ZWQgdG8gZXhwb3J0IHRoaXMgaW5mb3JtYXRpb24uCgpUaGFua3MsCgpDbMOpbWVu
dAoKPiAKPiAtcwo+IAo+PiAtLS0KPj4gdjI6Cj4+ICAtIE5vdGU6IHRyaWVkIHN5c2NvbmYgdG8g
ZXhwb3J0IGl0IGJ1dCB0aGlzIGlzIG5vdCBiYWNrZWQgYnkgc3lzY2FsbAo+PiAgICBhbmQgdGh1
cyBkb2VzIG5vdCBhbGxvdyBleHBvcnRpbmcgc3VjaCBpbmZvcm1hdGlvbiBlYXNpbHkuCj4+ICAt
IFVzZSBhcmNoX2dldF9tbWFwX2VuZCgpIGluc3RlYWQgb2YgVkFfQklUUyBzaW5jZSBpdCByZWZs
ZWN0cyB0aGUKPj4gICAgbWF4aW11bSBsb2dpY2FsIGFkZHJlc3MgdXNlZCBieSB0aGUgcmlzY3Yg
cG9ydAo+PiAgLSBDaGFuZ2UgaHdwcm9iZSBrZXkgbmFtZSBmcm9tIFJJU0NWX0hXUFJPQkVfS0VZ
X1ZBX0JJVFMgdG8KPj4gICAgUklTQ1ZfSFdQUk9CRV9LRVlfTUFYX0FERFJFU1MKPj4gIC0gTGlu
ayB0byB2MTogCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDAyMDExNDAzMTku
MzYwMDg4LTEtY2xlZ2VyQHJpdm9zaW5jLmNvbS8KPj4gLS0tCj4+ICBEb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgMyArKysKPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdwcm9iZS5oICAgICAgfCAyICstCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdw
cm9iZS5oIHwgMSArCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgIHwg
NCArKysrCj4+ICA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0
IAo+PiBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAo+PiBpbmRleCBiMmJj
YzllZWQ5YWEuLmE2MjZhYTIxYWM3NCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNo
L3Jpc2N2L2h3cHJvYmUucnN0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3By
b2JlLnJzdAo+PiBAQCAtMjEwLDMgKzIxMCw2IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUgZGVm
aW5lZDoKPj4KPj4gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPWl9CTE9DS19T
SVpFYDogQW4gdW5zaWduZWQgaW50IHdoaWNoCj4+ICAgIHJlcHJlc2VudHMgdGhlIHNpemUgb2Yg
dGhlIFppY2JveiBibG9jayBpbiBieXRlcy4KPj4gKwo+PiArKiA6YzptYWNybzpgUklTQ1ZfSFdQ
Uk9CRV9LRVlfTUFYX1VTRVJfQUREUkVTU2A6IEFuIHVuc2lnbmVkIGxvbmcgd2hpY2gKPj4gKyAg
cmVwcmVzZW50IHRoZSBtYXhpbXVtIHVzZXJzcGFjZSBtbWFwcGFibGUgYWRkcmVzcy4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od3Byb2JlLmgKPj4gaW5kZXggNjMwNTA3ZGZmNWVhLi4xNTBhOTg3N2IwYWYg
MTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4+IEBAIC04LDcgKzgsNyBAQAo+Pgo+
PiAgI2luY2x1ZGUgPHVhcGkvYXNtL2h3cHJvYmUuaD4KPj4KPj4gLSNkZWZpbmUgUklTQ1ZfSFdQ
Uk9CRV9NQVhfS0VZIDYKPj4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDcKPj4KPj4g
IHN0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl9od3Byb2JlX2tleV9pc192YWxpZChfX3M2NCBrZXkp
Cj4+ICB7Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9i
ZS5oIAo+PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPj4gaW5kZXgg
OWYyYThlM2ZmMjA0Li5hNmRhNDM0YmU5ZGEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9od3Byb2JlLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaAo+PiBAQCAtNjcsNiArNjcsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7
Cj4+ICAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5TVVBQT1JURUQJKDQgPDwg
MCkKPj4gICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9NQVNLCQkoNyA8PCAwKQo+
PiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT1pfQkxPQ0tfU0laRQk2Cj4+ICsjZGVm
aW5lIFJJU0NWX0hXUFJPQkVfS0VZX01BWF9VU0VSX0FERFJFU1MJNwo+PiAgLyogSW5jcmVhc2Ug
UklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4gYWRkaW5nIGl0ZW1zLiAqLwo+Pgo+PiAgLyogRmxh
Z3MgKi8KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4+IGluZGV4IGE3YzU2YjQxZWZkMi4uMTlh
NDc1NDBiNGEyIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5j
Cj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPj4gQEAgLTgsNiArOCw3
IEBACj4+ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPj4gICNpbmNsdWRlIDxhc20vY3B1
ZmVhdHVyZS5oPgo+PiAgI2luY2x1ZGUgPGFzbS9od3Byb2JlLmg+Cj4+ICsjaW5jbHVkZSA8YXNt
L3Byb2Nlc3Nvci5oPgo+PiAgI2luY2x1ZGUgPGFzbS9zYmkuaD4KPj4gICNpbmNsdWRlIDxhc20v
c3dpdGNoX3RvLmg+Cj4+ICAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KPj4gQEAgLTIwMiw2ICsy
MDMsOSBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3Byb2Jl
ICpwYWlyLAo+PiAgCQlpZiAoaHdwcm9iZV9leHQwX2hhcyhjcHVzLCBSSVNDVl9IV1BST0JFX0VY
VF9aSUNCT1opKQo+PiAgCQkJcGFpci0+dmFsdWUgPSByaXNjdl9jYm96X2Jsb2NrX3NpemU7Cj4+
ICAJCWJyZWFrOwo+PiArCWNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfTUFYX1VTRVJfQUREUkVTUzoK
Pj4gKwkJcGFpci0+dmFsdWUgPSBhcmNoX2dldF9tbWFwX2VuZChVTE9OR19NQVgsIDAsIDApOwo+
PiArCQlicmVhazsKPj4KPj4gIAkvKgo+PiAgCSAqIEZvciBmb3J3YXJkIGNvbXBhdGliaWxpdHks
IHVua25vd24ga2V5cyBkb24ndCBmYWlsIHRoZSB3aG9sZQo+PiAtLSAKPj4gMi40My4wCj4+Cj4+
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
