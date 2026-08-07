Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30244C5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muhYcgJB8MJJ9BDprfN4W5dfk+i8M6vJ9GApzhjg4Lw=; b=2GtdHofuVSQw9G
	0G0wOXrf98gR+8BeE543oFPsHaw8SyByeq/tpIpmIVsRe9TxVBPBeQKlqCsMu27VKY+etIe0IMLiD
	a3irGx77TuikuZWPFHbTvizmkQWx0CgmQHBnWg502v0qasTF1fiuDI9+elJWM7U4Tv+n9kpstofqm
	/KzCot78zxwwWrfz5p9GeG905PnvuaF+7aatazWus99ID5hpZwltKK6LJbINWAXKSKG9sw+ezd/SS
	Wmywu+B4AapVJFB7mXUoqmShTUNG1698+1DCIBkxfZnsTOBrAphRCBo8pa3nh8Iaipv8wk2UkSbp1
	56SW34HtWTvRACEqVc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCd-00000007GBa-0mxV;
	Fri, 07 Aug 2026 07:41:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCZ-00000007G78-3pm0
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 07:41:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-47fde295992so1464473f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 00:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088470; x=1786693270; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSYQ6Hen3CMyNgjH1etqMkMNKiGDMJrXBqBRp7LU9i4=;
        b=SxZ2POX1yVtHg+yZAYkD7ZsQl2+zqycJ/3gL5S7irii0HAN1MFXXe+sHh6Wo4EDE7g
         B5D17zRmx0jnwqxBetWXfMua/PFptR920qbQtmmemNHPkj6zcBqYsWVcveBBQzMVuWxO
         MIdtUakuvr2/8q3/6IyBput5bAtIIawoNJbiPaKHgHtZpoSY5y5hVtOXC6/wBQisJXoD
         f3WLuTj1msCa3IpCWSdGSqLmiCvSr3gbXjPsAGTYvE50c9KvkmUz2auerQGS0Gorpi52
         x5izb6R95QB5omwjM8DMK3YAi6xsKYlDvFUNPa5EI343yixm3dgvgXNcBH60Gx77jBNk
         RiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088470; x=1786693270;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSYQ6Hen3CMyNgjH1etqMkMNKiGDMJrXBqBRp7LU9i4=;
        b=kpw3XLq6d373luXwPdPCI/GPkSmeFsUDBb/QkMxnXF8tl+FfLkBtVaRPjQxxekoeWO
         oAElUqqW+SdwPoHxF+mUqGbUWyGQc0Z3X1BE2fSTuIbvbTJyuGGebRanxirbJTh4S4Dv
         HVLEoQ4dggtJa/sR1ta+4MYn5hufuPeSXLPKHpFFdgfpeHzTZhx4AI3RgpBEvqPz/Rcc
         KPhBcgTEdZfPDBII1SWlkC6asgsl5utmbBROQj9o92Vy2L1GhuAwa/bz+P+sZB6OPCRm
         V8WuO7g3sg/sU6u6WG8+fz4lp+Zl40HFQC1va2IadTzZFPdglTsW6eXV6LoFqLQc98pE
         vhJA==
X-Forwarded-Encrypted: i=1; AHgh+RoW9n0KpRtqy05WNln//Ko9LwKKjaO56mtytTCklTcQntNAERR/G0fWrcSfrroOR+II2kLg1IZUcJGG1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAxblKWEG1MPGBB1DvRUWSvlTGlO1F0dH4f2FN1bqnK6Pebunp
	j3qDGoaaM0OIEEatN42mvtFbwPKwm4ikKgpB1q8taL8ozVQLu/1XlXaFPzBIcSWYQ/l2
X-Gm-Gg: AR+sD13WSRkxhsEiiS4HVeOV8AMFPIlM2vUzZQmBrM8vJtrCkyqEroda04FqWDpAbte
	mS8qxiu0JWnn1z0vT0kx53V5Z2IeYNgCkoixOBdhMh6WckTE98HfchONkDl62QK7xeB09LJvMjB
	Lf+7j9yHZZBORB2K7gDOfxwsiXw9+u70/hGBGhW7BO6V4GEQ1wE+Qn0F3PQDbBqpWuhNzKAftpF
	JJqd778eMRY83neQbkqZZyCJa0KcFcOE8zFlqrJ+Qf7UGpnTfOJj91BJVpcRfGurjZzQombuSvN
	fDJ0Bpqr4id3B0nzr2SdPKyno/ucbGdzquyubnBEo945poe5WJUqBsscCU0wAY1Zpg8ayZP6HHE
	U6PwjvnauOGhVMqDSeKE44h3pPUcbAcXdzY5utqSIKPvACZQ1TwuXzN4jvNfGIc2zElO1T7SMuw
	/7K0K1mNmDIzl+bxg8FMoRERfRVXv6IepFxcB481YQo2dG0m26KHyDipEK1tnG8mw=
X-Received: by 2002:a05:6000:388:b0:47f:8cd3:4bed with SMTP id ffacd0b85a97d-47ff8694ef6mr16251068f8f.5.1786088470034;
        Fri, 07 Aug 2026 00:41:10 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:09 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 6/6] MAINTAINERS: add Bao hypervisor entry
Date: Fri,  7 Aug 2026 08:39:33 +0100
Message-ID: <08c7768ee758e2b65ae50dc9b801355f378106b8.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004112_009874_35AE235A 
X-CRM114-Status: UNSURE (   8.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWRkIGEgTUFJTlRBSU5FUlMgZW50cnkgY292ZXJpbmcgdGhlIEJhbyBoeXBlcnZpc29yIGRyaXZl
cnMsIHRoZQphcmNoaXRlY3R1cmUgaGVhZGVycywgdGhlIGluLWtlcm5lbCBhbmQgVUFQSSBoZWFk
ZXJzLCBhbmQgdGhlCmRldmljZS10cmVlIGJpbmRpbmdzLgoKU2lnbmVkLW9mZi1ieTogSm/Do28g
UGVpeG90byA8anBlaXhvdG9Ab3N5eC50ZWNoPgotLS0KdjM6Ci0gQ29uY2lzZSBjb21taXQgbWVz
c2FnZSAoS3J6eXN6dG9mIEtvemxvd3NraSkuCgogTUFJTlRBSU5FUlMgfCAxMyArKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5U
QUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggMTUwMTFmNTc1MmE5Li42YTgxYThkYTU4ZjEgMTAw
NjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC00NTE5LDYgKzQ1MTks
MTkgQEAgRjoJZHJpdmVycy92aWRlby9iYWNrbGlnaHQvCiBGOglpbmNsdWRlL2xpbnV4L2JhY2ts
aWdodC5oCiBGOglpbmNsdWRlL2xpbnV4L3B3bV9iYWNrbGlnaHQuaAogCitCQU8gSFlQRVJWSVNP
UgorTToJSm9zw6kgTWFydGlucyA8am9zZUBvc3l4LnRlY2g+CitNOglEYXZpZCBDZXJkZWlyYSA8
ZGF2aWRtY2VyZGVpcmFAb3N5eC50ZWNoPgorTToJSm/Do28gUGVpeG90byA8anBlaXhvdG9Ab3N5
eC50ZWNoPgorUzoJTWFpbnRhaW5lZAorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Jhby8KK0Y6CWFyY2gvYXJtL2luY2x1ZGUvYXNtL2Jhby5oCitGOglhcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL2Jhby5oCitGOglhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Jhby5oCitGOglkcml2
ZXJzL3ZpcnQvYmFvCitGOglpbmNsdWRlL2xpbnV4L2Jhby5oCitGOglpbmNsdWRlL3VhcGkvbGlu
dXgvYmFvLmgKKwogQkFSQ08gUDUwIEdQSU8gRFJJVkVSCiBNOglTYW50b3NoIEt1bWFyIFlhZGF2
IDxzYW50b3Noa3VtYXIueWFkYXZAYmFyY28uY29tPgogTToJUGV0ZXIgS29yc2dhYXJkIDxwZXRl
ci5rb3JzZ2FhcmRAYmFyY28uY29tPgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
