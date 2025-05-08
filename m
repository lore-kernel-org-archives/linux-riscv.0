Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687F7C3ABC6
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 20:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnpxZrkGebK9JqV3ai2w/m02IND70HoZJyMQNpUMNSo=; b=Vw3dlsDAN2K3Fu
	5yLzF06eYQAwr+umLlDcmiPJyI0t4o+YR1Bevd6w0w2610jJp1Eef2K5g3kXx9zYb2c3xthKsD2gq
	Ia6EvdfNLaAUgHZBcePYv6o3tW/uhFP9S/01mqJc+R8ijogmD2lXlpbqwGnJiq9V9Dk6d3/AmJPXd
	OMbZpLg+faq8RFG9h4VofbvX+x+qtJoS6qTJtSXmrLDpfg3vxDmyYXAkqq6bEEO2ks91seKMoZZ+p
	NQV/V7TfV5rP/m8Yfix/LNa8G0LsQx12tvNvhI6i6ZWZN2Y46Z7pgrLgQfI/56bIwLtBXu4ZcnOt2
	QE+ArokRTjV7sc6m9RrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7hw-00000001kIA-3Fl0;
	Thu, 08 May 2025 20:19:04 +0000
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7hu-00000001kHK-1pYT
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 20:19:03 +0000
Message-ID: <edd8751d-dd5e-48f9-8c08-853d89c90130@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746735540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8ZPULVhkBmOhXVI9D50gyESuyxY/qERnIvpj+8HrdQ=;
	b=U4gXf7Luz4uxvOHjIGxizGSXyq5/BbkbqhZlxMzHw7xLH6MKTN21LM14oIanbJ3iuryHJ2
	gQUupmCPVGHvaNnUYCxN617JcFqj0wb4bA/VR6YLF1kfwJE8mjMfyvB90Y5+AZaZXYRUFT
	KOjZqKc/7Vf7S/rabeeTXe1Ja5Q9o34=
Date: Thu, 8 May 2025 13:18:55 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 03/14] riscv: sbi: add new SBI error mappings
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
 <20250424173204.1948385-4-cleger@rivosinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250424173204.1948385-4-cleger@rivosinc.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_131902_613268_EDA63A22 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

T24gNC8yNC8yNSAxMDozMSBBTSwgQ2zDg8KpbWVudCBMw4PCqWdlciB3cm90ZToKPiBBIGZldyBu
ZXcgZXJyb3JzIGhhdmUgYmVlbiBhZGRlZCB3aXRoIFNCSSBWMy4wLCBtYXBzIHRoZW0gYXMgY2xv
c2UgYXMKPiBwb3NzaWJsZSB0byBlcnJubyB2YWx1ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcg
Sm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaCB8IDEwICsrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gaW5kZXggYmIwNzdkMGM5MTJmLi43ZWMy
NDlmZWE4ODAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiBAQCAtNTM2LDExICs1MzYsMjEgQEAg
c3RhdGljIGlubGluZSBpbnQgc2JpX2Vycl9tYXBfbGludXhfZXJybm8oaW50IGVycikKPiAgIAlj
YXNlIFNCSV9TVUNDRVNTOgo+ICAgCQlyZXR1cm4gMDsKPiAgIAljYXNlIFNCSV9FUlJfREVOSUVE
Ogo+ICsJY2FzZSBTQklfRVJSX0RFTklFRF9MT0NLRUQ6Cj4gICAJCXJldHVybiAtRVBFUk07Cj4g
ICAJY2FzZSBTQklfRVJSX0lOVkFMSURfUEFSQU06Cj4gKwljYXNlIFNCSV9FUlJfSU5WQUxJRF9T
VEFURToKPiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4gKwljYXNlIFNCSV9FUlJfQkFEX1JBTkdFOgo+
ICsJCXJldHVybiAtRVJBTkdFOwo+ICAgCWNhc2UgU0JJX0VSUl9JTlZBTElEX0FERFJFU1M6Cj4g
ICAJCXJldHVybiAtRUZBVUxUOwo+ICsJY2FzZSBTQklfRVJSX05PX1NITUVNOgo+ICsJCXJldHVy
biAtRU5PTUVNOwo+ICsJY2FzZSBTQklfRVJSX1RJTUVPVVQ6Cj4gKwkJcmV0dXJuIC1FVElNRTsK
PiArCWNhc2UgU0JJX0VSUl9JTzoKPiArCQlyZXR1cm4gLUVJTzsKPiAgIAljYXNlIFNCSV9FUlJf
Tk9UX1NVUFBPUlRFRDoKPiAgIAljYXNlIFNCSV9FUlJfRkFJTFVSRToKPiAgIAlkZWZhdWx0OgoK
UmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
