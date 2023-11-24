Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9BBC61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZRgSc64T81lVu5ZIfu7EbaXyeUZfxvdqD/YW81wnaU=; b=TwTZABZPQZp9Bk
	P9Byg7mOIVD9FX1XovTfj6OToEhPhRsPI+JFjQHoj8lFLM+t/8QLJzLMYm5z88Hmkv5S6k5AxId32
	gTmf4cTYSZK91/ODLKhN8fJmczBVMYArWO9lhBO45KoL0mHaQlsDOqmR7cMxjPrkwG/TMES8wResy
	EfhSnKgKaE9dIOaEs/Wna1FC2iSQmEZlbSX+P0WV5QGw1YvTs8AKd3j01uAt5YJj7qJsMlk5L6AKa
	MA0eDY+G+SQMKHyIsW0EcMSmtcApnP+Yv3cOP98WkKmwDMv6p30Z29yLyF/r0J5tKvJUS/pkmVZ8u
	3RLQjPyxjrDDci+aspuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QW5-006NR6-06;
	Fri, 24 Nov 2023 07:22:21 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QVz-006NL3-2t
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:22:17 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00a9c6f283so221573966b.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1700810532; x=1701415332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyHjshVZY4a+CzgGKu86RdRFHE9Gyk/gNKjRroh1RbA=;
        b=ilp8i+a8Rg8OmKuIS2CU/blRZ/7Y5ycD8qVVLJdnzi7xMU4gwE0e2FfZlTOa3Zuwb/
         PfWyjUSPkkiQ1xfOzOFD110oOU23N6DA46SJiAeetCQ7dWviQUKWUsvXtGiO9LWmLZBG
         kCKO23yF2PnbanC/AHPqLEuhNUpJsryxVblS99zVBxqjJR6p80ro5M6NfxzjJXZDo8f4
         g52UDto57POtt8SmOQ/jN9hjpa9SAqYuenlycy6E5fiJYSMTsS9lGHUX8812Ku4ZCXrz
         vRRgH/+LVA1+F3qbRdaWk0KzXrou9Civ2vDBOioiIvmanQRV4XFA2ZwnlalRI7HHnif0
         ivBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700810532; x=1701415332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyHjshVZY4a+CzgGKu86RdRFHE9Gyk/gNKjRroh1RbA=;
        b=InA/XFP51TrYpPGB7uPyhxW0Hx7mkfkO2shO1IKW1cAEVJH79gc+PQJYZ1ErIun7lp
         jgCgTQVubcjdPkCsJcPtwnFj0caG4LqKy0l5cvMxfiOa6p+XeQt0n9/BWQaf/TJ+QvnH
         CrsHo5DCtAxKGonYzk5IVSkKtxhwj4dGmyQSUsG6AaumBt59ZExUBpPG+NynseW0gL1A
         Gg1NQZO/0pbvG8gC9bE9rvrE707te2ifIXr4FzgccZBqgnMAwdwhD673ZgvM+rYmVvv3
         k9ZM9DG8OVh0h3Tk6gl/9DUy3jC+D7yaCIbKTnuCNXBCy+tjwdw2q0pJvI/ScwTfX/5p
         dCsg==
X-Gm-Message-State: AOJu0Yzj1kvOseaJEyU+BYt7HdkqIp62xmPKAb8bQQT6NSwyTPH2zsVz
	fii+d4Q358Q75TUO05z1OoM6RIC5SKHrtqVh3LRtQo62
X-Google-Smtp-Source: AGHT+IEeR8RiraoHcQMfKVQPMc/bI/tKyEPjsNFqwM2sa2syPi4of5FlqT3IwZAKP2ce7aPUm/rHLQ==
X-Received: by 2002:a17:906:651:b0:9fe:81a:c258 with SMTP id t17-20020a170906065100b009fe081ac258mr1199022ejb.26.1700810532654;
        Thu, 23 Nov 2023 23:22:12 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id q18-20020a1709060e5200b00992f2befcbcsm1709930eji.180.2023.11.23.23.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:22:12 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
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
	Andrea Parri <parri.andrea@gmail.com>,
	Will Deacon <will@kernel.org>,
	Daniel Lustig <dlustig@nvidia.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [RFC PATCH 4/5] RISC-V: Implement prctl call to set/get the memory consistency model
Date: Fri, 24 Nov 2023 08:21:41 +0100
Message-ID: <20231124072142.2786653-5-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_232215_960521_11DCE8BF 
X-CRM114-Status: GOOD (  21.48  )
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

RnJvbTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+CgpX
ZSBjYW4gdXNlIHRoZSBQUl97UyxHfUVUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTCBwcmN0bCBj
YWxscyB0byBjaGFuZ2UKdGhlIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbCBhdCBydW4tdGltZSBp
ZiB3ZSBoYXZlIFNzZHRzby4KVGhpcyBwYXRjaCByZWdpc3RlcnMgUklTQ1ZfV01PIGFuZCBSSVND
Vl9UU08gYXMgdmFsaWQgYXJndW1lbnRzCmZvciB0aGVzZSBwcmN0bCBjYWxscyBhbmQgaW1wbGVt
ZW50cyB0aGUgZ2x1ZSBjb2RlIHRvIHN3aXRjaApiZXR3ZWVuIHRoZXNlLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIE3DvGxsbmVyIDxjaHJpc3RvcGgubXVlbGxuZXJAdnJ1bGwuZXU+Ci0tLQog
Li4uL21tL2R5bmFtaWMtbWVtb3J5LWNvbnNpc3RlbmN5LW1vZGVsLnJzdCAgIHwgMTggKysrKysr
KysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgICAgICAgICAgIHwgIDcg
KysrKwogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDEg
KwogYXJjaC9yaXNjdi9rZXJuZWwvZHRzby5jICAgICAgICAgICAgICAgICAgICAgIHwgMzMgKysr
KysrKysrKysrKysrKysrKwogaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICAgICAg
ICAgICAgIHwgIDIgKysKIDUgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2R0c28uYwoKZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vbW0vZHluYW1pYy1tZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0IGIvRG9jdW1l
bnRhdGlvbi9tbS9keW5hbWljLW1lbW9yeS1jb25zaXN0ZW5jeS1tb2RlbC5yc3QKaW5kZXggMjE2
NzViNDFlYzg0Li40YTYxMDdhNGI3MWYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vbW0vZHlu
YW1pYy1tZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0CisrKyBiL0RvY3VtZW50YXRpb24vbW0v
ZHluYW1pYy1tZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0CkBAIC01NiwzICs1NiwyMSBAQCBU
d28gcHJjdGwgY2FsbHMgYXJlIGRlZmluZWQgdG8gZ2V0L3NldCB0aGUgYWN0aXZlIG1lbW9yeSBj
b25zaXN0ZW5jeSBtb2RlbDoKICAgICB0byB0aGUgZ2l2ZW4gbW9kZWwuIElmIHRoZSBhcmNoaXRl
Y3R1cmUgZG9lcyBub3Qgc3VwcG9ydCBkeW5hbWljCiAgICAgbWVtb3J5IGNvbnNpc3RlbmN5IG1v
ZGVscyBvciBkb2VzIG5vdCBzdXBwb3J0IHRoZSBwcm92aWRlZCBtb2RlbCwgdGhlbgogICAgIC0x
IGlzIHJldHVybmVkLCBhbmQgZXJybm8gaXMgc2V0IHRvIEVJTlZBTC4KKworU3VwcG9ydGVkIG1l
bW9yeSBjb25zaXN0ZW5jeSBtb2RlbHMKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09CisKK1RoaXMgc2VjdGlvbiBkZWZpbmVzIHRoZSBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWxz
IHdoaWNoIGFyZSBzdXBwb3J0ZWQKK2J5IHRoZSBwcmN0bCBpbnRlcmZhY2UuCisKK1JJU0MtVgor
LS0tLS0tCisKK1JJU0MtViB1c2VzIFJWV01PIChSSVNDLVYgd2VhayBtZW1vcnkgb3JkZXJpbmcp
IGFzIGRlZmF1bHQgbWVtb3J5IGNvbnNpc3RlbmN5Cittb2RlbC4gVFNPICh0b3RhbCBzdG9yZSBv
cmRlcmluZykgaXMgYW5vdGhlciBzcGVjaWZpZWQgbW9kZWwgYW5kIHByb3ZpZGVzCithZGRpdGlv
bmFsIG9yZGVyaW5nIGd1YXJhbnRlZXMuIFN3aXRjaGluZyBmcm9tIFJWV01PIHRvIFRTTyAoYW5k
IGJhY2spIGlzCitwb3NzaWJsZSB3aGVuIHRoZSBTc2R0c28gZXh0ZW5zaW9uIGlzIGF2YWlsYWJs
ZS4KKworKiA6YzptYWNybzpgUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NWX1dNT2A6
IFJJU0MtViB3ZWFrIG1lbW9yeSBvcmRlcmluZyAoZGVmYXVsdCkuCisKKyogOmM6bWFjcm86YFBS
X01FTU9SWV9DT05TSVNURU5DWV9NT0RFTF9SSVNDVl9UU09gOiBSSVNDLVYgdG90YWwgc3RvcmUg
b3JkZXJpbmcuCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAppbmRleCA3OWNjNWU2Mzc3Yjgu
LmIwYzE5ZGRiMmNmYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNz
b3IuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCkBAIC0xNDYsNiAr
MTQ2LDEzIEBAIGV4dGVybiBpbnQgc2V0X3VuYWxpZ25fY3RsKHN0cnVjdCB0YXNrX3N0cnVjdCAq
dHNrLCB1bnNpZ25lZCBpbnQgdmFsKTsKICNkZWZpbmUgR0VUX1VOQUxJR05fQ1RMKHRzaywgYWRk
cikJZ2V0X3VuYWxpZ25fY3RsKCh0c2spLCAoYWRkcikpCiAjZGVmaW5lIFNFVF9VTkFMSUdOX0NU
TCh0c2ssIHZhbCkJc2V0X3VuYWxpZ25fY3RsKCh0c2spLCAodmFsKSkKIAorI2lmZGVmIENPTkZJ
R19SSVNDVl9JU0FfU1NEVFNPCisjZGVmaW5lIFNFVF9NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUwo
YXJnKQlkdHNvX3NldF9tZW1vcnlfb3JkZXJpbmcoYXJnKQorI2RlZmluZSBHRVRfTUVNT1JZX0NP
TlNJU1RFTkNZX01PREVMKCkJCWR0c29fZ2V0X21lbW9yeV9vcmRlcmluZygpCitleHRlcm4gaW50
IGR0c29fc2V0X21lbW9yeV9jb25zaXN0ZW5jeV9tb2RlbCh1bnNpZ25lZCBsb25nIGFyZyk7Citl
eHRlcm4gaW50IGR0c29fZ2V0X21lbW9yeV9jb25zaXN0ZW5jeV9tb2RlbCh2b2lkKTsKKyNlbmRp
ZiAvKiBDT05JR19SSVNDVl9JU0FfU1NEVFNPICovCisKICNlbmRpZiAvKiBfX0FTU0VNQkxZX18g
Ki8KIAogI2VuZGlmIC8qIF9BU01fUklTQ1ZfUFJPQ0VTU09SX0ggKi8KZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKaW5k
ZXggZmVlMjJhM2QxYjUzLi4xN2NmNzRhYzhlMjEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCkBAIC02Myw2ICs2
Myw3IEBAIG9iai0kKENPTkZJR19NTVUpICs9IHZkc28ubyB2ZHNvLwogb2JqLSQoQ09ORklHX1JJ
U0NWX01JU0FMSUdORUQpCSs9IHRyYXBzX21pc2FsaWduZWQubwogb2JqLSQoQ09ORklHX0ZQVSkJ
CSs9IGZwdS5vCiBvYmotJChDT05GSUdfUklTQ1ZfSVNBX1YpCSs9IHZlY3Rvci5vCitvYmotJChD
T05GSUdfUklTQ1ZfSVNBX1NTRFRTTykJKz0gZHRzby5vCiBvYmotJChDT05GSUdfU01QKQkJKz0g
c21wYm9vdC5vCiBvYmotJChDT05GSUdfU01QKQkJKz0gc21wLm8KIG9iai0kKENPTkZJR19TTVAp
CQkrPSBjcHVfb3BzLm8KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2R0c28uYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2R0c28uYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwMDAuLmZjZjdlMmU4MDM2MgotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L2R0c28uYwpAQCAtMCwwICsxLDMzIEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlciAqLworLyoKKyAqIENvcHlyaWdodCAoYykgMjAyMyBDaHJpc3RvcGggTXVl
bGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2cnVsbC5ldT4KKyAqLworCisjaW5jbHVkZSA8bGlu
dXgvZXhwb3J0Lmg+CisjaW5jbHVkZSA8bGludXgvcHJjdGwuaD4KKyNpbmNsdWRlIDxhc20vZHRz
by5oPgorCitpbnQgcmlzY3Zfc2V0X21lbW9yeV9jb25zaXN0ZW5jeV9tb2RlbCh1bnNpZ25lZCBs
b25nIGFyZykKK3sKKwlzd2l0Y2ggKGFyZykgeworCWNhc2UgUFJfTUVNT1JZX0NPTlNJU1RFTkNZ
X01PREVMX1JJU0NWX1dNTzoKKwkJZHRzb19kaXNhYmxlKCk7CisJCWJyZWFrOworCWNhc2UgUFJf
TUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NWX1RTTzoKKwkJaWYgKCFoYXNfZHRzbygpKQor
CQkJcmV0dXJuIC1FSU5WQUw7CisJCWR0c29fZW5hYmxlKCk7CisJCWJyZWFrOworCWRlZmF1bHQ6
CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCXJldHVybiAwOworfQorCitpbnQgcmlzY3ZfZ2V0
X21lbW9yeV9jb25zaXN0ZW5jeV9tb2RlbCh2b2lkKQoreworCWlmIChoYXNfZHRzbygpICYmIGR0
c29faXNfZW5hYmxlZCgpKQorCQlyZXR1cm4gUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJ
U0NWX1RTTzsKKwlyZXR1cm4gUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NWX1dNTzsK
K30KZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oIGIvaW5jbHVkZS91YXBp
L2xpbnV4L3ByY3RsLmgKaW5kZXggNTc5NjYyNzMxZWFhLi4yMDI2NGJkYzMwOTIgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9w
cmN0bC5oCkBAIC0zMDgsNSArMzA4LDcgQEAgc3RydWN0IHByY3RsX21tX21hcCB7CiAKICNkZWZp
bmUgUFJfU0VUX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTAkJNzEKICNkZWZpbmUgUFJfR0VUX01F
TU9SWV9DT05TSVNURU5DWV9NT0RFTAkJNzIKKyMgZGVmaW5lIFBSX01FTU9SWV9DT05TSVNURU5D
WV9NT0RFTF9SSVNDVl9XTU8JMQorIyBkZWZpbmUgUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVM
X1JJU0NWX1RTTwkyCiAKICNlbmRpZiAvKiBfTElOVVhfUFJDVExfSCAqLwotLSAKMi40MS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
