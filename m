Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F28C433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 11:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C35C82073A
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 11:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DWgKZSAR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q3PTt388"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C35C82073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YF8Tk6kGXHgxwzkslEloOsyqE1FOlJ0nNmTBqa0XMgc=; b=DWgKZSARyanZ4hiK/Ux3k4UlO
	TAWTjj2DEONYWLoepZTJPuGLQiQwLMmk3bjObWdogUtTKhYXE5vPvuPRQfw0kjrKgL9UbIcB20mbH
	CdXT+v5/47hHHV5qB5LpKmgyE/z+iQdSjE5HjEYGFySjuP4Ary9lsIhAie6iWP6iQuUiBLWJvvCza
	hdWVTGcQEO4sk4H6+o/tEx/uZUrqTUoVw/RKpEq8DDgi1/wOOv72jEPXgeUKj9Uge3Rn6m1WErt7/
	ge6ki1shpaiuZX3KT2nON0LgwGakni6lgH7HZdYp/VIlQFxKHU4230rY3q6I17WlvP8X0n0owG8NC
	M0XxVGoCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxq2u-0006LB-HY; Tue, 21 Jul 2020 11:02:52 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxq2r-0006KR-Jc
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 11:02:50 +0000
Received: by mail-wm1-x341.google.com with SMTP id q15so2388195wmj.2
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CPqRjmeULxuLVoEjy9aA3UQhI9sTfnd10elbtAQrDro=;
 b=q3PTt388dGTnzDpVwzvX6J60ZQKkYn/bYlCxdn54F6eINTC2t/AidA+9Em79HiEZRt
 lavrMoQiz13W5VNdzEGkAZDZOy4WCxvC2LGYETtYQrLBrSesCPem+2KnQZNDvq9REXRL
 oOrUs7OF4A3Yr9oKdXRBigpkeKEb46CLGy2q+phezgBG+EEhywNBZqsa1oFPDlVszg8e
 iPeyiyu4ytWfy6HBiQU+IIjba9r0/2MaZ1ShQUSedgi+eIHyTVeXGn5Hc+bg+mM7MwYq
 EWe02FiTsvsrcAgW9M2u4viKWhX+d0dp4COZjIhCwTvTxY++9dLalWkh0XmV95/70I/Q
 b9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CPqRjmeULxuLVoEjy9aA3UQhI9sTfnd10elbtAQrDro=;
 b=fJ6I6OsLbLGfV8nfaTc3pCtLcUtdklipvWv5oZHs7n+izkjBs3kHTZxrVZ4XHB/7ok
 GPnOuEwy55o2LDHkBh2vP5+N4ufGrmw8HpW6nmOxU96nrTmOtPgLZChhjSwjj0xaWthQ
 62OczCTJxITpTr/oRnpYBMxOyG1Buj0xaOLq87jtMy8OzHpkXEm+kgEwOCy3VBHcbLI4
 5yRiYrv5J4/FpivXn6S7esiXI7DDbvdhhYHEeTzorf556fUaZ8bneK49S9XlW9l2J1/z
 9lNEilVuT9xI01noJ9Gl3yKTNI7nIkB/sIvQ4wL3b6aBg7TzTL+YzxFpoefwcFOP2aA0
 n15g==
X-Gm-Message-State: AOAM533qqLdPanXM5cTwGjBBdGobczwietVmXuE6CmUovE/Ss/VfIJAd
 cHERdwVgZ7Q6X5GDrt7QM5zPwA==
X-Google-Smtp-Source: ABdhPJw4oqzUpsLRaO3E4F0cyKC6CtdtVtcGI3tpABklcSHKMh0/ZWva0LboU9nfH9I2yu3x4fbG/A==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr3481693wmj.5.1595329366936;
 Tue, 21 Jul 2020 04:02:46 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:3590:b402:869a:11fc?
 ([2a01:e34:ed2f:f020:3590:b402:869a:11fc])
 by smtp.googlemail.com with ESMTPSA id d14sm4547519wre.44.2020.07.21.04.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 04:02:46 -0700 (PDT)
Subject: Re: [PATCH v4 2/4] clocksource/drivers: Add CLINT timer driver
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20200717075101.263332-1-anup.patel@wdc.com>
 <20200717075101.263332-3-anup.patel@wdc.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <63f65ddd-b7c4-b8fd-151c-a77e8c87efed@linaro.org>
Date: Tue, 21 Jul 2020 13:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717075101.263332-3-anup.patel@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_070249_759752_DBF22265 
X-CRM114-Status: GOOD (  23.96  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Emil Renner Berhing <kernel@esmil.dk>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTcvMDcvMjAyMCAwOTo1MCwgQW51cCBQYXRlbCB3cm90ZToKPiBXZSBhZGQgYSBzZXBhcmF0
ZSBDTElOVCB0aW1lciBkcml2ZXIgZm9yIExpbnV4IFJJU0MtViBNLW1vZGUgKGkuZS4KPiBSSVND
LVYgTm9NTVUga2VybmVsKS4KPiAKPiBUaGUgQ0xJTlQgTU1JTyBkZXZpY2UgcHJvdmlkZXMgdGhy
ZWUgdGhpbmdzOgo+IDEuIDY0Yml0IGZyZWUgcnVubmluZyBjb3VudGVyIHJlZ2lzdGVyCj4gMi4g
NjRiaXQgcGVyLUNQVSB0aW1lIGNvbXBhcmUgcmVnaXN0ZXJzCj4gMy4gMzJiaXQgcGVyLUNQVSBp
bnRlci1wcm9jZXNzb3IgaW50ZXJydXB0IHJlZ2lzdGVycwo+IAo+IFVubGlrZSBvdGhlciB0aW1l
ciBkZXZpY2VzLCBDTElOVCBwcm92aWRlcyBJUEkgcmVnaXN0ZXJzIGFsb25nIHdpdGgKPiB0aW1l
ciByZWdpc3RlcnMuIFRvIHVzZSBDTElOVCBJUEkgcmVnaXN0ZXJzLCB0aGUgQ0xJTlQgdGltZXIg
ZHJpdmVyCj4gcHJvdmlkZXMgSVBJIHJlbGF0ZWQgY2FsbGJhY2tzIHRvIGFyY2gvcmlzY3YuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEB3ZGMuY29tPgo+IFRlc3Rl
ZC1ieTogRW1pbCBSZW5uZXIgQmVyaGluZyA8a2VybmVsQGVzbWlsLmRrPgo+IC0tLQo+ICBkcml2
ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcgICAgICAgfCAgIDkgKysKPiAgZHJpdmVycy9jbG9ja3Nv
dXJjZS9NYWtlZmlsZSAgICAgIHwgICAxICsKPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1j
bGludC5jIHwgMjMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xp
bnV4L2NwdWhvdHBsdWcuaCAgICAgICAgfCAgIDEgKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDI0MiBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLWNsaW50LmMKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmln
IGIvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnCj4gaW5kZXggOTE0MTgzODFmY2Q0Li5lMWNl
MGQ1MTBhMDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnCj4gKysr
IGIvZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnCj4gQEAgLTY1OCw2ICs2NTgsMTUgQEAgY29u
ZmlnIFJJU0NWX1RJTUVSCj4gIAkgIGlzIGFjY2Vzc2VkIHZpYSBib3RoIHRoZSBTQkkgYW5kIHRo
ZSByZGN5Y2xlIGluc3RydWN0aW9uLiAgVGhpcyBpcwo+ICAJICByZXF1aXJlZCBmb3IgYWxsIFJJ
U0MtViBzeXN0ZW1zLgo+ICAKPiArY29uZmlnIENMSU5UX1RJTUVSCj4gKwlib29sICJUaW1lciBm
b3IgdGhlIFJJU0MtViBwbGF0Zm9ybSIKPiArCWRlcGVuZHMgb24gR0VORVJJQ19TQ0hFRF9DTE9D
SyAmJiBSSVNDVl9NX01PREUKPiArCXNlbGVjdCBUSU1FUl9QUk9CRQo+ICsJc2VsZWN0IFRJTUVS
X09GCj4gKwloZWxwCj4gKwkgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIENMSU5UIHRpbWVyIGZv
ciBSSVNDLVYgc3lzdGVtcy4gVGhlIENMSU5UCj4gKwkgIGRyaXZlciBpcyB1c3VhbGx5IHVzZWQg
Zm9yIE5vTU1VIFJJU0MtViBzeXN0ZW1zLgoKVjMgaGFzIGEgY29tbWVudCBhYm91dCBmaXhpbmcg
dGhlIEtjb25maWcgb3B0aW9uLgoKWyAuLi4gXQoKPiArewo+ICsJYm9vbCAqcmVnaXN0ZXJlZCA9
IHBlcl9jcHVfcHRyKCZjbGludF9jbG9ja19ldmVudF9yZWdpc3RlcmVkLCBjcHUpOwo+ICsJc3Ry
dWN0IGNsb2NrX2V2ZW50X2RldmljZSAqY2UgPSBwZXJfY3B1X3B0cigmY2xpbnRfY2xvY2tfZXZl
bnQsIGNwdSk7Cj4gKwo+ICsJaWYgKCEoKnJlZ2lzdGVyZWQpKSB7Cj4gKwkJY2UtPmNwdW1hc2sg
PSBjcHVtYXNrX29mKGNwdSk7Cj4gKwkJY2xvY2tldmVudHNfY29uZmlnX2FuZF9yZWdpc3Rlcihj
ZSwgY2xpbnRfdGltZXJfZnJlcSwgMjAwLAo+ICsJCQkJCQkgVUxPTkdfTUFYKTsKPiArCQkqcmVn
aXN0ZXJlZCA9IHRydWU7Cj4gKwl9CgoKSSB3YXMgdW5zdXJlIGFib3V0IHRoZSBjbG9ja2V2ZW50
c19jb25maWdfYW5kX3JlZ2lzdGVyKCkgbXVsdGlwbGUgY2FsbHMKd2hlbiBkb2luZyB0aGUgY29t
bWVudC4gSXQgc2VlbXMgbGlrZSBpdCBpcyBmaW5lIHRvIGNhbGwgaXQgc2V2ZXJhbAp0aW1lcyBh
bmQgdGhhdCBpcyBkb25lIGluIHNldmVyYWwgcGxhY2VzIGxpa2UgcmlzY3Ygb3IgYXJjaF9hcm1f
dGltZXIuCgpJdCBpcyBwcm9iYWJseSBzYWZlIHRvIGRyb3AgdGhlICdyZWdpc3RlcmVkJyBjb2Rl
IGhlcmUsIHNvcnJ5IGZvciB0aGUKY29uZnVzaW9uLgoKPiArCWVuYWJsZV9wZXJjcHVfaXJxKGNs
aW50X3RpbWVyX2lycSwKPiArCQkJICBpcnFfZ2V0X3RyaWdnZXJfdHlwZShjbGludF90aW1lcl9p
cnEpKTsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwoKWyAuLi4gXQoKCi0tIAo8aHR0cDovL3d3dy5s
aW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFy
bz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8
CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
