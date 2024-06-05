Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFC8C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 11:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+GGZurKWnGwERCzVOd3pbWraCZ8BAjtRwGaIbUASh0Y=; b=XHWy6GPUeR5aEz
	T3eJ/hxKnKOjXdvVMjvEohNvFLXarljGAttqw0DPc+QArCwMLKUUgesY2uO4fzT8ObqupI1q/doST
	M1IJEiCSKQvxv1qoSYdqf2+ckFWkxk3IFw8ntqsw9tlC43WaqkjoHyaGw3BIdU5fZpZ5Vd/53LSxM
	b/lxBZw+tjJrhUWHMch78kvCxezpcP6Q4ExIGZNIuvLbTcWMzR7IW8jPv2XMYusT/5lvHjtxItybc
	oUydiVsXJM8pLjT3xLT58iZ0x11fwQPp6C+yXgBnAV/jg+dWDeL6kQ/6Byh4BTQpxpmsb69x0auK0
	b/ve3ZkXAcWjGorD2EuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1x-00000005kRE-3MLp;
	Wed, 05 Jun 2024 11:42:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEp1u-00000005kMY-0Xw8
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 11:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E518CE0EB2;
	Wed,  5 Jun 2024 11:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C49EC3277B;
	Wed,  5 Jun 2024 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587727;
	bh=cXaL8X5xkqjru4qZvhtnJBNQd1jrCsGud/RraJezK+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P49tYTr8ENggo5fZvyKqZ4PxM1peSbHLq3cEfJefvxO26qq3VgrbD44w7SPHT1HkT
	 yLZk4KJTmkXb4xi7nmVa9vtoQcspd+KSp86VRVE/N0ToZjrv8UmR3sqged4GllPn5h
	 5GvPvVSfGAeMGH24F5yZwuJ5PcsphzNqUIcASKCOtwEetL+b7w0teYBp/8DvVDy4KI
	 evrzh5rO0PqNeq9Kf+oHWL+Lp3xUwlwdEzkfvR/QO6nuFAWCLeW2D2MUCFok7kI/s0
	 /y+gLAedifYQI5N+imnHHGNoDFCQrHDR/jrIIAKKecSFW6RBDuu4j+4/Tyl4w1ABwV
	 fsHibJ697J1KA==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v4 11/11] riscv: Enable DAX VMEMMAP optimization
Date: Wed,  5 Jun 2024 13:40:54 +0200
Message-ID: <20240605114100.315918-12-bjorn@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605114100.315918-1-bjorn@kernel.org>
References: <20240605114100.315918-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_044210_433033_38DE8E5E 
X-CRM114-Status: UNSURE (   6.63  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKTm93IHRoYXQgREFYIGlz
IHVzYWJsZSwgZW5hYmxlIHRoZSBEQVggVk1FTU1BUCBvcHRpbWl6YXRpb24gYXMgd2VsbC4KClNp
Z25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNo
L3Jpc2N2L0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRleCA4
YTQ5YjVmNGMwMTcuLjE2MzFiZjU2ODE1OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29uZmln
CisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtNzMsNiArNzMsNyBAQCBjb25maWcgUklTQ1YK
IAlzZWxlY3QgQVJDSF9XQU5UX0dFTkVSQUxfSFVHRVRMQiBpZiAhUklTQ1ZfSVNBX1NWTkFQT1QK
IAlzZWxlY3QgQVJDSF9XQU5UX0hVR0VfUE1EX1NIQVJFIGlmIDY0QklUCiAJc2VsZWN0IEFSQ0hf
V0FOVF9MRF9PUlBIQU5fV0FSTiBpZiAhWElQX0tFUk5FTAorCXNlbGVjdCBBUkNIX1dBTlRfT1BU
SU1JWkVfREFYX1ZNRU1NQVAKIAlzZWxlY3QgQVJDSF9XQU5UX09QVElNSVpFX0hVR0VUTEJfVk1F
TU1BUAogCXNlbGVjdCBBUkNIX1dBTlRTX05PX0lOU1RSCiAJc2VsZWN0IEFSQ0hfV0FOVFNfVEhQ
X1NXQVAgaWYgSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFCi0tIAoyLjQzLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
