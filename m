Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B003C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3jl9zjtfgzwqyViHJETFgGMsqnB7KJXJELwnJO+9EaM=; b=JczVPQnnZ6653g7jYlWe3VFpLG
	acKye8UJ17k3Gob0OurTvR3/ssjEfjWfP4Vsfd+VrhUTq66ZsilHgmZ2EDf/hr86VrWmop1gOyMFK
	vL3RB3MZ4uxkAnVInfiC0SfLyW6xd3s4p6r98JBmZ/PYsDR0Ywmnp/Dc/g8lDmIjbh1SF8JccHNCt
	MNTun8AT8e26gpKzQY1lCkub9CZgG28cZYZ7t8zDwSyGRBFd1PaEI7K5RsXi7YwnQ5lMuezHI/QX8
	O+Kq6PMt5YzT3mBUR64S1g/ZA90T7xXhbUoPX5iE0lnfAjnpcjp/gC/p+JH1Wr54Ej+RsIhU0CmCQ
	FnWmVuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTrp-00000007FoU-1Tkz;
	Wed, 26 Jun 2024 14:43:25 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTrl-00000007FmP-26Z6
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:43:23 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-70df213542bso4831671a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1719413000; x=1720017800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qqVGSiK52qpEYkBFYQqtg/MLmm7mG/Sdz2MT9nXZJE=;
        b=CfukFo8E6ONscix5RpEh70Vk4wYAkN8UlrFwbTo+2A+GLL7E3bQxoLMe3vJo901Mc7
         NGXRUMl3xhWHBUuftoHYxOAIukkM9QjXXcINQ4tXSXDhIFMYBliD63BA5v9523TSvSJ/
         T7I2hbUJdrbBtVD78obxb2fWu/xLaRtH6oxy6OtYOuFb6opJb55NaJIQHzuLkHO11HQ4
         d4aam4BqByMzgn0kkd/3bTowXg9kzAxnMm28vp7VEfHeOfKObKcRt1iL+8biXIR/BQuu
         JP/J8KR1ojN6xm2YydPtqJSZW913lbCY76Oiw3EVPdPsbJYFut6C4t2zFVpvFgcD4OwI
         C1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719413000; x=1720017800;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qqVGSiK52qpEYkBFYQqtg/MLmm7mG/Sdz2MT9nXZJE=;
        b=KOV+B9dMJpT5DdV2DJnF72aKk9jmVUNJK/UkVWWwrVcy3yceMZvyFOGyTNitxYSdXr
         1QGGCDRpW4B/KtAtLwYEEQq7td5Ql+6kWiY5AhWEBihKfqRDLbDoiFbZy3Z3Cn0Zxhjj
         7bARV7MPl1WF8XIqJoi0TfdMIgjBZu2A6xlkURR6rYy69aQs/jOMgB7Y1ldYeXzXNWun
         Y1OpvjyCn9cYsv2u6SQJKbgfd2W7l1Jn49RVGl9Fh20ai/Cj12w/t40h9gzwvNfW6dHV
         Xo/3VnEGyIAGprEcPeqtl04fuIs0tM/KiSFNe/5GpWXJx8GBZHFBIZwbmzgCjMkd4xyv
         WmSw==
X-Forwarded-Encrypted: i=1; AJvYcCW5FB5kJNebmxyw2k6Vl+EU4wQgOegfA8Q5Ve5/xlEjSWRdT5dT3TxnixXHt8XJ8Z+I54cUnXxzeg+MbQqDFCwEmOv8xGNsNqjV1gLW5rSU
X-Gm-Message-State: AOJu0Yxq1n2/Q66IlLKIgaOzqFJg0TTXJBZeBFaFGrvUEZGjRrprMApa
	6Hcn9F6zrolCOmbVWSbmaVQvbwBvqJVtPCrsNvWAoAXYFLcpDyVaYQzotCLjTps=
X-Google-Smtp-Source: AGHT+IH2/0OvXTCfvNRbeybdAi6Y6rc880H+FiHzFEwDjrLLdcNGpDiCXi7MY3ygYaSDhgJ3SraPqA==
X-Received: by 2002:a05:6a20:1203:b0:1bd:28cf:7645 with SMTP id adf61e73a8af0-1bd28cf76cfmr3000669637.42.1719413000436;
        Wed, 26 Jun 2024 07:43:20 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3d5576sm100665315ad.201.2024.06.26.07.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:43:19 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:43:19 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2024 07:43:18 PDT (-0700)
Subject: Re: [PATCH v2 3/3] RISC-V: hwprobe: not treat KEY_CPUPERF_0 as bitmask
In-Reply-To: <CALs-Hst_TpjuQw0t-p9GbcCY4FAwXSjWziHJJuToi3rWXo7mJw@mail.gmail.com>
CC: cyy@cyyself.name, linux-riscv@lists.infradead.org, enh@google.com,
  Charlie Jenkins <charlie@rivosinc.com>, corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, cleger@rivosinc.com,
  Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com, linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Evan Green <evan@rivosinc.com>
Message-ID: <mhng-7da30215-9cfb-4670-a33d-17d9464d60d0@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_074321_598277_DDADBAE2 
X-CRM114-Status: GOOD (  20.97  )
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

T24gV2VkLCAyOSBNYXkgMjAyNCAxMTozMzo0MiBQRFQgKC0wNzAwKSwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBUaHUsIE1heSAyMywgMjAyNCBhdCA4OjM24oCvUE0gWWFuZ3l1IENoZW4gPGN5eUBj
eXlzZWxmLm5hbWU+IHdyb3RlOgo+Pgo+PiBTaW5jZSB0aGUgdmFsdWUgaW4gS0VZX0NQVVBFUkZf
MCBpcyBub3QgYml0bWFzaywgcmVtb3ZlIHRoZSB3cm9uZyBjb2RlCj4+IGluIGh3cHJvYmUuaC4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+Cj4KPiBJ
J2QgZXhwZWN0IGEgRml4ZXMgdGFnLCBhbmQgaWRlYWxseSBzb21lIGRpc2N1c3Npb24gb24gdGhl
IHJlYXNvbmluZwo+IGFuZCByYW1pZmljYXRpb25zIG9mIHRoaXMgY2hhbmdlLgo+Cj4gSSBwb3N0
ZWQgdGhlIG90aGVyIHBvc3NpYmxlIGZpeCwgZGVjbGFyaW5nIGEgbmV3IGtleSwgYXQgWzFdLCBt
b3N0bHkKPiBzbyB3ZSBjb3VsZCBzZWUgdGhlIHR3byBvcHRpb25zIGFuZCBkaXNjdXNzLiBJJ20g
b2theSB3aXRoIGVpdGhlcgo+IHBhdGNoLgoKSnVzdCB0byBjbG9zZSB0aGUgbG9vcCBoZXJlIGFz
IHRoZSBkaXNjdXNzaW9ucyBhcmUgb24gb3RoZXIgdGhyZWFkczogCmFmdGVyIGEgYnVuY2ggb2Yg
ZGlzY3Vzc2lvbnMgd2UncmUgZ29pbmcgd2l0aCB0aGUgbmV3IGtleSB2ZXJzaW9uLiAgCk1heWJl
IGl0J3MgYSBiaXQgcGVkYW50aWMsIGJ1dCBzaW5jZSBod3Byb2JlIGlzIHN1Y2ggYSBmdW5kYW1l
bnRhbCAKY29tcGF0aWJpbGl0eSBpbnRlcmZhY2Ugd2UncmUganVzdCBnb2luZyB0byBiZSBzdXBl
ciBjYXJlZnVsLgoKPiAtRXZhbgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyNDA1MjkxODI2NDkuMjYzNTEyMy0xLWV2YW5Acml2b3NpbmMuY29tL1QvI3UKPgo+PiAtLS0K
Pj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oIHwgMSAtCj4+ICAxIGZpbGUgY2hh
bmdlZCwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+PiBpbmRl
eCA2MzA1MDdkZmY1ZWEuLmYyNGNhZDIyYmJlMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od3Byb2JlLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3By
b2JlLmgKPj4gQEAgLTIwLDcgKzIwLDYgQEAgc3RhdGljIGlubGluZSBib29sIGh3cHJvYmVfa2V5
X2lzX2JpdG1hc2soX19zNjQga2V5KQo+PiAgICAgICAgIHN3aXRjaCAoa2V5KSB7Cj4+ICAgICAg
ICAgY2FzZSBSSVNDVl9IV1BST0JFX0tFWV9CQVNFX0JFSEFWSU9SOgo+PiAgICAgICAgIGNhc2Ug
UklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wOgo+PiAtICAgICAgIGNhc2UgUklTQ1ZfSFdQUk9C
RV9LRVlfQ1BVUEVSRl8wOgo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4+ICAgICAg
ICAgfQo+Pgo+PiAtLQo+PiAyLjQ1LjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
