Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642B0C4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fn47QmKsS6gTO3wNV6r0Sq9DAxLLLBU7cHm/Rm4Hduk=; b=pK/DiqRR3F/7kS
	xEE/7IaiUn4MwNPFRe+gR43G2UH5Ly4LSMV2/czmX9EpZLNseQzld6NouHWtcg94WADKCew86xfT5
	BFVlLgDUW3UXZvWfY+X8qwDneVkgtSASjSwwJA2YDDoDjulw7TGSIo9CYrbjhe4VOaR82IHW8/u29
	9Gu0T67xCqBELkhBb2lMxwxgv9E8owCC2D1mSm7t+9lNAQcb77rM70Ed/FLHVI0IOgqttJf/sGVDR
	ldXCocHZ9pFqUiPaFPzi+CD7fzRB7esxn1bWCQGRyeOXWO4s6sS+EiNwf7Vu6Xzn630zk3uMYUcYN
	sB9SSBzJVCZ8HuN9lQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZL-0000000GFkH-3RU5;
	Fri, 09 Feb 2024 06:41:03 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZI-0000000GFhg-1uOS
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 06:41:02 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a3810e975aaso66933966b.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 22:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1707460859; x=1708065659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ka0BwVIa89CrbsNMJkPh2Vgcr3mcWFHipPKQFS87pYA=;
        b=lAA5IacUoXP4BPgOemetpFYLjuNP7yzXv7GazoGaSZIm9p2doJI3bZLig/iV72lTmf
         jAtaBqHaJzlZ6S7Ovor6uWW67PQLbH9OCDgOOtrC8+biC8/YHoOfGqQDGnPP6OHq2NvN
         pPJFbaZl4/vsRXmqRsVLVPt0mzHLiH/+ZX6UJo664Q+6BOXUvKmvgf1mCa8F88SyhdB9
         q3M7aOFR5czeYQoMVusapeYsf3ALoWKURm6C4QpsZAkzAbQjDYbN/2BAcYh2SofTNOtm
         yfvnx7l598RrnGcFboQAFzm+HksH2F/Dm2OU1nMkZyJN4/TptfSqcal423iqBHT0EJc8
         /3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707460859; x=1708065659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ka0BwVIa89CrbsNMJkPh2Vgcr3mcWFHipPKQFS87pYA=;
        b=CaVH4qZOv0orDLh5+aBBxPRNz23A7fynCgj5BBwFrUeY8RU9q6hiEcF1Htl8s0C+Ho
         JpHn4vlE8DPkvPXFvVnZ7NXV4dqs80SpQG0j7JoMo6HI3okeDk3B61nuLHUJPQgEY30v
         BgBYHyHSeHuqPTtmAxXrBi/BK2FiYXYrTxAoj7m+qG4DJHf7JPZjag70Ks6J4a9KblE8
         TOi4iqYezHYVQZ0TeYUQvd00jBh0k/75VrgK1Wxpya35V4cHqeRqBh0Wb41NtNuTjPB5
         6JdkFNnY2Q9inuX2lUVWLEieapmQ7QUCbV/+Ja2gRCu6qM5D92YQ52AUC1XRu1vMyPsw
         o+Gg==
X-Gm-Message-State: AOJu0YxfefIRw66+8ZFYuW85gJDIDehR9YVZqUyPWjfeHigp3kj4YqwQ
	WduYyYd3UcryyYTrdIsmaWpubiO3nnT8kYA16tQWhPma7z3/fzTXw9y851nkoJGXMtIzajCRfWe
	uDSQ=
X-Google-Smtp-Source: AGHT+IFEN03if+6niuHDJ7y6KQ3qH470BeXh3gKz+Sb465eM/2K3LAMO8sCRGXg+1jKiB4FL7oHnjw==
X-Received: by 2002:a17:906:2e91:b0:a37:7b4:9538 with SMTP id o17-20020a1709062e9100b00a3707b49538mr530857eji.33.1707460858580;
        Thu, 08 Feb 2024 22:40:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGzRsAZwmfQ3VpSld4acgsFVB8Z2BpFxm5NYoupbUP/wDHZUcHWD0xshhR8SzfywjNN/6uiHCGHWB3luBB7eAro95MsHdnxJbi/UsaoOWSi/QX7Yt3BGzNKdp5rZMZI4ZCaJrcG3SSADnGciJhN51oKuauuTPK+/oaFDQEq9fFxnkTdCcgWwxBRc2/qEVCRnTSSXWdN9Dhwxos973APpZ8ybYob1XLGih9Ej/b67MnvWZBSQzE/otQIR76P/XvNjg/eVczYytDfWZXVLUrGDTLltumZbxt+67DG9vbcnDKew0X/chAbTQfYrTYpkLRlj0kwsodyv04SaDJ1gad2bOJTPEQtGLPKz2/YsnmOLREsvkoageVxwSbJhiDF30C7qkgV++HU2WIkmb+wOIuU3Ck3GzZIMla0sFstAz8dXyRNm+yDeUoEflVK0q1lKALfz8tkUBEGc6omFxBsljE/KqQwVHtBdygQ8fNqUfMEWoT03c74tkohgGFw1IsWg7MdAVF9WedboaLk5CYiTXW9RAWxMEBDsDVChXyTdHCz2NF7PPk1QYS+zBnkZyypbUI02tKIE7oorhJtzbg0Vkuslqhe7u5XzLFZLe8WE7GD35XxR1jGkVb1zdSYPBxCzO/3LmeKOWXN12YDTlnDMFgGmKCvKNAs5IipyIg22VgBDA/GW0iNeAax58E0aap/Swu9mxIkfNzrAZOSnJRYq6ZR6wASlI8grPksL2Sabilobn98XkAJ1WuIQ5fOHUl+iRQMsuItpiI724RZwSPd/uKOZnbK/M+PBA+0pYuXqXUK9gz+7NrViKr8a+JhLSAFif+ZnT4CZaNekMrga7Hjfyh9xRRxpJzHHYAXrXnPSDDbJWFZw==
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id vb9-20020a170907d04900b00a370a76d3a0sm441180ejc.123.2024.02.08.22.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:40:58 -0800 (PST)
From: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Brendan Sweeney <turtwig@utexas.edu>,
	Andrew Waterman <andrew@sifive.com>,
	Brendan Sweeney <brs@berkeley.edu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Hans Boehm <hboehm@google.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH v2 2/6] uapi: prctl: Add new prctl call to set/get the memory consistency model
Date: Fri,  9 Feb 2024 07:40:46 +0100
Message-ID: <20240209064050.2746540-3-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
References: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_224100_559820_194B34E5 
X-CRM114-Status: GOOD (  17.69  )
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

VGhpcyBwYXRjaCBkZWZpbmVzIGEgcHJjdGwgdUFQSSBmb3Igc3dpdGNoaW5nIHRoZSBhY3RpdmUg
bWVtb3J5CmNvbnNpc3RlbmN5IG1vZGVsIG9mIHVzZXItc3BhY2UgcHJvY2Vzc2VzLgoKVGhlIGlt
cGxlbWVudGF0aW9uIGZvbGxvd3MgdGhlIHdheSBvdGhlciBwcmN0bCBjYWxscyBhcmUgaW1wbGVt
ZW50ZWQgYnkKZGlzYWJsaW5nIHRoZW0gdW5sZXNzIGFyY2gtc3BlY2lmaWMgY29kZSBwcm92aWRl
cyB0aGUgcmVsZXZhbnQgbWFjcm9zLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIE3DvGxsbmVy
IDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Ci0tLQogLi4uL21tL2R5bmFtaWMtbWVtb3J5
LWNvbnNpc3RlbmN5LW1vZGVsLnJzdCAgIHwgMjcgKysrKysrKysrKysrKysrKysrKwogaW5jbHVk
ZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICAgICAgICAgICAgIHwgIDMgKysrCiBrZXJuZWwv
c3lzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMiArKysrKysrKysKIDMg
ZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vbW0vZHluYW1pYy1tZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0IGIvRG9jdW1lbnRhdGlv
bi9tbS9keW5hbWljLW1lbW9yeS1jb25zaXN0ZW5jeS1tb2RlbC5yc3QKaW5kZXggMzExN2MzZDgy
YjJiLi4xZmNlODU1YTFmYWQgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vbW0vZHluYW1pYy1t
ZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0CisrKyBiL0RvY3VtZW50YXRpb24vbW0vZHluYW1p
Yy1tZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0CkBAIC00NywzICs0NywzMCBAQCBhdCBydW4t
dGltZToKICogT25seSBzd2l0Y2hpbmcgZnJvbSBhIHdlYWtlciB0byBhIHN0cm9uZ2VyIG1vZGVs
IGlzIHNhZmUuCiAqIFRoZSBzdHJvbmdlciBtZW1vcnkgbW9kZWwgYWZmZWN0cyBhbGwgdGhyZWFk
cyBvZiBhIHByb2Nlc3MsIHdoZW4gcnVubmluZyBpbiB1c2VyIG1vZGUuCiAqIEZvcmtlZCBwcm9j
ZXNzZXMgZGVyaXZlIHRoZWlyIGFjdGl2ZSBtZW1vcnkgbW9kZWwgZnJvbSB0aGVpciBwYXJlbnRz
LgorCitVc2VyIEFQSSB2aWEgcHJjdGwKKz09PT09PT09PT09PT09PT09PQorCitUd28gcHJjdGwg
Y2FsbHMgYXJlIGRlZmluZWQgdG8gZ2V0L3NldCB0aGUgYWN0aXZlIG1lbW9yeSBjb25zaXN0ZW5j
eSBtb2RlbDoKKworKiBwcmN0bChQUl9HRVRfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMKQorCisg
ICAgUmV0dXJucyB0aGUgYWN0aXZlIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbCBmb3IgdGhlIGNh
bGxpbmcgcHJvY2Vzcy90aHJlYWQuCisgICAgSWYgdGhlIGFyY2hpdGVjdHVyZSBkb2VzIG5vdCBz
dXBwb3J0IGR5bmFtaWMgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVscywKKyAgICB0aGVuIC0xIGlz
IHJldHVybmVkLCBhbmQgZXJybm8gaXMgc2V0IHRvIEVJTlZBTC4KKworKiBwcmN0bChQUl9TRVRf
TUVNT1JZX0NPTlNJU1RFTkNZX01PREVMLCB1bnNpZ25lZCBsb25nIG5ld19tb2RlbCkKKworICAg
IFN3aXRjaGVzIHRoZSBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWwgZm9yIHRoZSBjYWxsaW5nIHBy
b2Nlc3MvdGhyZWFkCisgICAgdG8gdGhlIGdpdmVuIG1vZGVsLiBJZiB0aGUgYXJjaGl0ZWN0dXJl
IGRvZXMgbm90IHN1cHBvcnQgZHluYW1pYworICAgIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbHMs
IG9yIGRvZXMgbm90IHN1cHBvcnQgdGhlIHByb3ZpZGVkIG1vZGVsLCBvcgorICAgIGRvZXMgbm90
IGFsbG93IHRvIHN3aXRjaCB0byB0aGUgcHJvdmVpZGVkIG1vZGVsIHRoZW4gLTEgaXMgcmV0dXJu
ZWQsCisgICAgYW5kIGVycm5vIGlzIHNldCB0byBFSU5WQUwuCisKK1N1cHBvcnRlZCBtZW1vcnkg
Y29uc2lzdGVuY3kgbW9kZWxzCis9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQor
CitUaGlzIHNlY3Rpb24gZGVmaW5lcyB0aGUgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVscyB3aGlj
aCBhcmUgc3VwcG9ydGVkCitieSB0aGUgcHJjdGwgaW50ZXJmYWNlLgorCis8bm9uZT4KZGlmZiAt
LWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3By
Y3RsLmgKaW5kZXggMzcwZWQxNGIxYWUwLi41Nzk2NjI3MzFlYWEgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvdWFwaS9saW51eC9wcmN0bC5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oCkBA
IC0zMDYsNCArMzA2LDcgQEAgc3RydWN0IHByY3RsX21tX21hcCB7CiAjIGRlZmluZSBQUl9SSVND
Vl9WX1ZTVEFURV9DVFJMX05FWFRfTUFTSwkweGMKICMgZGVmaW5lIFBSX1JJU0NWX1ZfVlNUQVRF
X0NUUkxfTUFTSwkJMHgxZgogCisjZGVmaW5lIFBSX1NFVF9NRU1PUllfQ09OU0lTVEVOQ1lfTU9E
RUwJCTcxCisjZGVmaW5lIFBSX0dFVF9NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUwJCTcyCisKICNl
bmRpZiAvKiBfTElOVVhfUFJDVExfSCAqLwpkaWZmIC0tZ2l0IGEva2VybmVsL3N5cy5jIGIva2Vy
bmVsL3N5cy5jCmluZGV4IGUyMTlmY2ZhMTEyZC4uYTFiOTJhMzhmODg5IDEwMDY0NAotLS0gYS9r
ZXJuZWwvc3lzLmMKKysrIGIva2VybmVsL3N5cy5jCkBAIC0xNDYsNiArMTQ2LDEyIEBACiAjaWZu
ZGVmIFJJU0NWX1ZfR0VUX0NPTlRST0wKICMgZGVmaW5lIFJJU0NWX1ZfR0VUX0NPTlRST0woKQkJ
KC1FSU5WQUwpCiAjZW5kaWYKKyNpZm5kZWYgU0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTAor
IyBkZWZpbmUgU0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTChhKQkoLUVJTlZBTCkKKyNlbmRp
ZgorI2lmbmRlZiBHRVRfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMCisjIGRlZmluZSBHRVRfTUVN
T1JZX0NPTlNJU1RFTkNZX01PREVMKCkJCSgtRUlOVkFMKQorI2VuZGlmCiAKIC8qCiAgKiB0aGlz
IGlzIHdoZXJlIHRoZSBzeXN0ZW0td2lkZSBvdmVyZmxvdyBVSUQgYW5kIEdJRCBhcmUgZGVmaW5l
ZCwgZm9yCkBAIC0yNzQzLDYgKzI3NDksMTIgQEAgU1lTQ0FMTF9ERUZJTkU1KHByY3RsLCBpbnQs
IG9wdGlvbiwgdW5zaWduZWQgbG9uZywgYXJnMiwgdW5zaWduZWQgbG9uZywgYXJnMywKIAljYXNl
IFBSX1JJU0NWX1ZfR0VUX0NPTlRST0w6CiAJCWVycm9yID0gUklTQ1ZfVl9HRVRfQ09OVFJPTCgp
OwogCQlicmVhazsKKwljYXNlIFBSX1NFVF9NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUw6CisJCWVy
cm9yID0gU0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTChhcmcyKTsKKwkJYnJlYWs7CisJY2Fz
ZSBQUl9HRVRfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMOgorCQllcnJvciA9IEdFVF9NRU1PUllf
Q09OU0lTVEVOQ1lfTU9ERUwoKTsKKwkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJZXJyb3IgPSAtRUlO
VkFMOwogCQlicmVhazsKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
