Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12426C5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 04:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDHVgO6OyJe/s7mYOB/+TOUJJRPqSaaQFyLB8Uazvgk=; b=Qd5yhFAkRHZPoO
	tvIkMzJQijDlSV5eQ7VYY6HIvkfPCOoeIBymHbNNN0/n7kUQMD7iBfQc5uM+UZWppKp88t6IJtqTi
	/GHC/64CFtmqmOmmSYq7dBBU51gW1kBUfe3y1mPiVuCfNy9C4xAZ0Ajjz85+/K7lw8fynxNQ8r14D
	nCqfypPWnj/lmt6SGYHksR3xFe6YLrU+gO4ZqNLdWI30XBNM9M/FXC9qsD4IWtnHdk316V0pZQMND
	YMKMQr++MCySc1O4UaTi7roZNe3GdfRt/jfWrn/NQUWZ9N48eG4ZwaHAcUZXaM0oe+c1oWK5Pbru0
	w1jE/0StDuqCqSas3iVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOULt-00000003QP4-3Egf;
	Mon, 09 Jun 2025 04:43:17 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOULr-00000003QOL-2CHa
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 04:43:16 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-86cf3a3d4ccso366389939f.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 21:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749444194; x=1750048994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLPCYr5e6u6vsBLYdaChBsgJrVajuCmHnbhRzhd1SBo=;
        b=PKtV0OxLHxY4YVH3Ibyc772dI3ssejb8u/VaJpgNlvAEwbu84CK+7EMvkocKBVNi41
         Z9M3Z3hasWCno9X+agLpdeTjS2bPe/amvZfGaTKLtsQGBhm7T3BQCjtcHXDD+AXqt2HK
         wkLV/ffaDsD19FrIBpDghhcfw1EY8XKyXSn+vPO3v4JXUK1x3M9e/N3OWMwZ23bds05J
         xyBFmIIyeNbcauX/WoSiuvEksM0IiIfUrAw8TkFDKC5iIiNZgwf8C+Ze21+CtVZKQ6V8
         /Ocs0gCF/5whoDXLfgldVoN+Sbrc3SOtl6Gk89SHo2fcAkoOfYzWELK5Rht2Vuvowsnu
         Gizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749444194; x=1750048994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLPCYr5e6u6vsBLYdaChBsgJrVajuCmHnbhRzhd1SBo=;
        b=nkBWE3dxfx9uaUjuYTcBp2V8+3G/zbPN13cL0gjGwqU6PLoQRwAHZ1GQiOeSTm2OFe
         evVPmRAUfIzNDbgxXi7iaVX/aXWK9/ubrUXt9o2//JK1xf2zRW/gnMnljyZBpP7VYAgS
         lgkr3sEprMDxwOYTu+8IB368jiHRW0u3qJ6u/o5oFGtIfrbuW6XYQeUuOO8i5z65ggN3
         jCdAblpeqxLqbVsM5C+2RJyWBz1sMaG4F78ih2bbCM5ITZff/ZI8oSm75rZ4LQh+JVqr
         HStvfesiWw+TdRBVm/SL5a2CQxvDbH/AvfU0FlHnzO4jJm5g5jJzClSctZoLNR3uBhma
         P5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCX4n1joFfgoznaEHYnhsyHUSb2fIid9HzWIX/mLoO5FFqv2vtQF0lfG6YNOLZiteoxtjzP+Bb23leYU1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSQCehKXswlVQfEmSd5Y8MB2EXHGiPrHUkGHBC9YT7t7l2LGK3
	ohEaPj7MAZ2ZlwJdj7ZFGl4Ce/LKwttgh//VyYlJNE5On+NW+8yjIsgy43peMFZOGMZQMUNH/lA
	T2lDOCL692DQGShSViP7XFZWA2rF0GxnQ6mzU6Fv+tg==
X-Gm-Gg: ASbGncsDl762YvzsmBJj+457PYXb4I+KMtPpsBWgMI0IzOgNCWLmuaoISiQUVHu3xkz
	wWIpic6bPXrEQlM3S+dDxSHJt+Sthrq+t4oE2EJ800GbHCYbQ2uHRhA2/zlxntp40+TxTQI4p/z
	rqGMIuMcltgXMfRCsAX3egQzIZgJr3w9x/5w+Alf05iQesC+bhrvNIXDTNPigZXKrCmdU5nFpqA
	E6XzMDCmoi+usY=
X-Google-Smtp-Source: AGHT+IFFQRtEtS/hG2Tw2Y3tZ7JBIHK8O7AtEvWbVFh3c/WKDcNmXYTLq1lKt0Z4JpmLj9iCX/JRFdqRRAtWqZiaZsc=
X-Received: by 2002:a05:6e02:148e:b0:3dc:8075:ccde with SMTP id
 e9e14a558f8ab-3ddce3ed62emr126702145ab.4.1749444194076; Sun, 08 Jun 2025
 21:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250605061458.196003-1-apatel@ventanamicro.com> <20250605061458.196003-2-apatel@ventanamicro.com>
In-Reply-To: <20250605061458.196003-2-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Jun 2025 10:13:02 +0530
X-Gm-Features: AX0GCFtusVCpQiVS1V0qV1zXXOQlncy-D3d7CPodLU4fm3d-HJJqnbKjeEFLTPI
Message-ID: <CAAhSdy1O+MvJ6nr0D2+8_9cQ=hT+zW0f-rcg7sw8uP_kuzd25g@mail.gmail.com>
Subject: Re: [PATCH 01/13] RISC-V: KVM: Fix the size parameter check in SBI
 SFENCE calls
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_214315_797464_DEDDFDF2 
X-CRM114-Status: GOOD (  16.51  )
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

T24gVGh1LCBKdW4gNSwgMjAyNSBhdCAxMTo0NeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEFzLXBlciB0aGUgU0JJIHNwZWNpZmljYXRpb24sIGFu
IFNCSSByZW1vdGUgZmVuY2Ugb3BlcmF0aW9uIGFwcGxpZXMKPiB0byB0aGUgZW50aXJlIGFkZHJl
c3Mgc3BhY2UgaWYgZWl0aGVyOgo+IDEpIHN0YXJ0X2FkZHIgYW5kIHNpemUgYXJlIGJvdGggMAo+
IDIpIHNpemUgaXMgZXF1YWwgdG8gMl5YTEVOLTEKPgo+IEZyb20gdGhlIGFib3ZlLCBvbmx5ICMx
IGlzIGNoZWNrZWQgYnkgU0JJIFNGRU5DRSBjYWxscyBzbyBmaXggdGhlCj4gc2l6ZSBwYXJhbWV0
ZXIgY2hlY2sgaW4gU0JJIFNGRU5DRSBjYWxscyB0byBjb3ZlciAjMiBhcyB3ZWxsLgo+Cj4gRml4
ZXM6IDEzYWNmZWMyZGJjYyAoIlJJU0MtVjogS1ZNOiBBZGQgcmVtb3RlIEhGRU5DRSBmdW5jdGlv
bnMgYmFzZWQgb24gVkNQVSByZXF1ZXN0cyIpCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgYXMgYSBmaXggZm9yIExpbnV4LTYuMTYK
ClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2Uu
YyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYwo+IGluZGV4IDVmYmYzZjk0ZjFlOC4u
OTc1MmQyZmZmZjY4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxh
Y2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYwo+IEBAIC0xMDMs
NyArMTAzLDcgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9yZmVuY2VfaGFuZGxlcihzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4KPiAgICAgICAgICAgICAgICAga3Zt
X3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19GRU5DRV9JX1NFTlQpOwo+
ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgU0JJX0VYVF9SRkVOQ0VfUkVN
T1RFX1NGRU5DRV9WTUE6Cj4gLSAgICAgICAgICAgICAgIGlmIChjcC0+YTIgPT0gMCAmJiBjcC0+
YTMgPT0gMCkKPiArICAgICAgICAgICAgICAgaWYgKChjcC0+YTIgPT0gMCAmJiBjcC0+YTMgPT0g
MCkgfHwgY3AtPmEzID09IC0xVUwpCj4gICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2
X2hmZW5jZV92dm1hX2FsbCh2Y3B1LT5rdm0sIGhiYXNlLCBobWFzayk7Cj4gICAgICAgICAgICAg
ICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfaGZlbmNlX3Z2bWFf
Z3ZhKHZjcHUtPmt2bSwgaGJhc2UsIGhtYXNrLAo+IEBAIC0xMTEsNyArMTExLDcgQEAgc3RhdGlj
IGludCBrdm1fc2JpX2V4dF9yZmVuY2VfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0
cnVjdCBrdm1fcnVuICpydW4KPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2lu
Y3JfZncodmNwdSwgU0JJX1BNVV9GV19IRkVOQ0VfVlZNQV9TRU5UKTsKPiAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIFNCSV9FWFRfUkZFTkNFX1JFTU9URV9TRkVOQ0VfVk1B
X0FTSUQ6Cj4gLSAgICAgICAgICAgICAgIGlmIChjcC0+YTIgPT0gMCAmJiBjcC0+YTMgPT0gMCkK
PiArICAgICAgICAgICAgICAgaWYgKChjcC0+YTIgPT0gMCAmJiBjcC0+YTMgPT0gMCkgfHwgY3At
PmEzID09IC0xVUwpCj4gICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2hmZW5jZV92
dm1hX2FzaWRfYWxsKHZjcHUtPmt2bSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaGJhc2UsIGhtYXNrLCBjcC0+YTQpOwo+ICAgICAgICAg
ICAgICAgICBlbHNlCj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
