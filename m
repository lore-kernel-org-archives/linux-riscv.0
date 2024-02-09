Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A52C4829F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OO/K+OtDVrhh2zjDQCbEOFQz62fx1Jh2IehE26PF1zk=; b=EhhvRKDoscJEip
	AvuA1wi/fPQNnuoM49pFNDKjfRYFYWOBWQA640/v9eWkwq4+fNuilKXRP/51+0lphWvy/HNtHBKWT
	sycwUsXwMrWEuaLToKOGKTmGojf6nQdjKIACb22vMg12Y53SyTbjfbPZnkX9Hrf//zEpgooT59BL0
	aJIzsba2rvRgxLndeGd2KfvbQrXFZBEr/PeIwdzod9oLMB/58l9QZFnvwhO4c70Dd/lsx9g+LYM8A
	aymmxyzH8cqEC05fNQZRWEROhV9G0t1/BiQfwMqSkaTjdR33W29/YRfEGXm28eFznrvbbNa9UDvMv
	mayTfYH5ddm19vHtYQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZQ-0000000GFoo-3MGp;
	Fri, 09 Feb 2024 06:41:08 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYKZN-0000000GFjs-1NyX
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 06:41:06 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a370e7e1e02so63018466b.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 22:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1707460862; x=1708065662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ST8e7AXP20QlvDbKLGY7HjIR6vrJd80LvNJ9Brmy7H4=;
        b=GN1C7feUg2GirHaPkrN0DvyM++tL/5aCijCh9DTx6E9dHr1Ud0o1dm+vFyvJfhopvw
         xbUSp9OQo+uuwOGf2H8vG5gq1rfpaLDfkKaLHf2vjqzMI/pMTXugidSwevcjhAxSkKJ/
         5ss+rAro6ptNwhklT4PDov2FwfKMwt7iaUWXNbIs0RjuyDrkIR70c0ugtixKprPmC3uY
         n8NJ/fdj/ZYG5kINBSTzc3x8awEr7K7H3SguP3CrWiNSG7SKfk4YziF/FkrxHsTh5k6C
         ed265u53qen6wy3+IddiE783KJDX7V02QireYEEH48uRsW/RX/v2Q5MY69kXMvzWKxXK
         2LRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707460862; x=1708065662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ST8e7AXP20QlvDbKLGY7HjIR6vrJd80LvNJ9Brmy7H4=;
        b=sT9RmafNdsK99zx0HTpk8cRd50lDTsPnEhP64ofpszJ/b/3NIZ7gpkwCvlFzXf5Bbo
         extzJjfkkY5Tmvns/f4/81PuBioXXyXhCyVcjKD0CkTjOIFlY0WVxRAhGkf2ZKk4QIZZ
         hmnlEeXZtHCDzVRS2hrgSVSayjLYu+xH9WMnWCKREaY8as+JpGetQensDagxhSQR8hIj
         jjL29f4XylllAltYGFOoQ9WaDbFmZS73bvqFa2j+gBIv9M82bQgcGVoGXF8SfpGFF98I
         QJ/HB/HKvPcfTQCOx6oFl58WOMfDj7X3zA1LwFjQ/1s5dOac9QHcTZFbhz5toUizaCsq
         53aA==
X-Gm-Message-State: AOJu0Yw0yujW1VSBfTE49i0snYLlevHbyCgc1GrJnxll5SYqYWoG8ZXy
	z/vMq4BGhCg+A2jUPkCjhzfGs1rX9a2DGkjsMlNMSd13m3AEEBlagnHh6u5GOaJg+Rdvbq99JsW
	CWO4=
X-Google-Smtp-Source: AGHT+IHJxpP7wNCT0XP54IBN7nE37NyEnMgUpbvOnsyakzsvJGztY1XpZVbrFW4xhEKC6uRrNdPefA==
X-Received: by 2002:a17:906:22cf:b0:a3b:bf5d:1089 with SMTP id q15-20020a17090622cf00b00a3bbf5d1089mr512293eja.20.1707460862356;
        Thu, 08 Feb 2024 22:41:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5OzmNE8LiMqHmaGw/QPWfvFxV8RhGPBp+rnFG+Na0Q3cHsxEhfqQL2QspBYEjTxncL+jeqmpc6BHhKbUGQZLQZewRKoXY1iAMbJcBSUMim5GOBuHcYcmKRDq5LzkFF6pZijFFDjIK8pAotOIwKg4LdT0fZ+tybBjyb2deghtcEZIiJYGnnjQpRS2cdoLe1GXXpm0bIub3MmnoQfwMvOhFsJ+xC4expH1Xe/5YbvIap8/82wHazrs6ceuEcXYYrVo2IIOEYrUaQ5886DYbYfgRhdO4MVOiVA5XGUcekIznv+7nUHELZh4ciUWoHnNCTVyrY2LtrZJfrq2HFEmD+J25f95+AowlS8ktKhqRDUa3jSiC+GGBlx8KqnuugRTdlEIKFP9UBFx+lCkhTIRI+oo15JlyrlMgkMPkJVmGprlVWHKV8DBzuecYZF1dHRVXC0En4/fvC5F2Lg/LTEoTWh3Bg/sTR8Ody5b/Fk8beJnWo3NKZGIj3O+LrSJCrw6UCUvaLdkwn3ijLipnwx6VJn2gYbJBXsvgsoDCgF6d8C8TDj7YVwANKq3wuS+EAwwIwrOVpXo3AoynYhcchjB1OcU44v5hBT9B8ltomg+oHTA+Aw3TmTg7vsQAdohx2ELbWvwoirRoXWCFh2fAHNKNZCRxTPT8j0p9CAz4YOF/3u7ioq5R9mOoYpRc1oJBrCWWay3i4/NF2QF0I9Ud+Pa8ZrP9d+YZhffxiopRD2lR/p+rQwmx6bpWQTFFlaZfIcQp4EcVo1wrzjEu9pQRlh0XH0Y/fV6vlIV/bDTEUDkm2hoNVaZwOXC7V1JSvdIVLW4Lpi81Oj+Bv3c4InNxAnMWrhiz4N6nwyqjeu5ta/UeHehdMQ==
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at. [62.178.148.172])
        by smtp.gmail.com with ESMTPSA id vb9-20020a170907d04900b00a370a76d3a0sm441180ejc.123.2024.02.08.22.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 22:41:01 -0800 (PST)
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
Subject: [RFC PATCH v2 4/6] RISC-V: Implement prctl call to set/get the memory consistency model
Date: Fri,  9 Feb 2024 07:40:48 +0100
Message-ID: <20240209064050.2746540-5-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
References: <20240209064050.2746540-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_224105_403638_B952F954 
X-CRM114-Status: GOOD (  24.64  )
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

V2UgY2FuIHVzZSB0aGUgUFJfe1MsR31FVF9NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUwgcHJjdGwg
Y2FsbHMgdG8gY2hhbmdlCnRoZSBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWwgYXQgcnVuLXRpbWUg
aWYgd2UgaGF2ZSBTc2R0c28uClRoaXMgcGF0Y2ggcmVnaXN0ZXJzIFJJU0NWX1dNTyBhbmQgUklT
Q1ZfVFNPIGFzIHZhbGlkIGFyZ3VtZW50cwpmb3IgdGhlc2UgcHJjdGwgY2FsbHMgYW5kIGltcGxl
bWVudHMgdGhlIGdsdWUgY29kZSB0byBzd2l0Y2gKYmV0d2VlbiB0aGVzZS4KClNpZ25lZC1vZmYt
Ynk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PgotLS0K
IC4uLi9tbS9keW5hbWljLW1lbW9yeS1jb25zaXN0ZW5jeS1tb2RlbC5yc3QgICB8IDEyICsrKy0K
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggICAgICAgICAgICB8ICA3ICsrCiBh
cmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBhcmNo
L3Jpc2N2L2tlcm5lbC9kdHNvLmMgICAgICAgICAgICAgICAgICAgICAgfCA2NyArKysrKysrKysr
KysrKysrKysrCiBpbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaCAgICAgICAgICAgICAgICAgICAg
fCAgMiArCiA1IGZpbGVzIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tlcm5lbC9kdHNvLmMKCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL21tL2R5bmFtaWMtbWVtb3J5LWNvbnNpc3RlbmN5LW1vZGVsLnJzdCBi
L0RvY3VtZW50YXRpb24vbW0vZHluYW1pYy1tZW1vcnktY29uc2lzdGVuY3ktbW9kZWwucnN0Cmlu
ZGV4IDFmY2U4NTVhMWZhZC4uYzgxODhjMTc0ZTI3IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L21tL2R5bmFtaWMtbWVtb3J5LWNvbnNpc3RlbmN5LW1vZGVsLnJzdAorKysgYi9Eb2N1bWVudGF0
aW9uL21tL2R5bmFtaWMtbWVtb3J5LWNvbnNpc3RlbmN5LW1vZGVsLnJzdApAQCAtNzMsNCArNzMs
MTQgQEAgU3VwcG9ydGVkIG1lbW9yeSBjb25zaXN0ZW5jeSBtb2RlbHMKIFRoaXMgc2VjdGlvbiBk
ZWZpbmVzIHRoZSBtZW1vcnkgY29uc2lzdGVuY3kgbW9kZWxzIHdoaWNoIGFyZSBzdXBwb3J0ZWQK
IGJ5IHRoZSBwcmN0bCBpbnRlcmZhY2UuCiAKLTxub25lPgorUklTQy1WCistLS0tLS0KKworUklT
Qy1WIHVzZXMgUlZXTU8gKFJJU0MtViB3ZWFrIG1lbW9yeSBvcmRlcmluZykgYXMgZGVmYXVsdCBt
ZW1vcnkgY29uc2lzdGVuY3kKK21vZGVsLiBUU08gKHRvdGFsIHN0b3JlIG9yZGVyaW5nKSBpcyBh
bm90aGVyIHNwZWNpZmllZCBtb2RlbCBhbmQgcHJvdmlkZXMKK2FkZGl0aW9uYWwgb3JkZXJpbmcg
Z3VhcmFudGVlcy4gU3dpdGNoaW5nIHVzZXItbW9kZSBwcm9jZXNzZXMgZnJvbSBSVldNTyB0byBU
U08KK2lzIHBvc3NpYmxlIHdoZW4gdGhlIFNzZHRzbyBleHRlbnNpb24gaXMgYXZhaWxhYmxlLgor
CisqIDpjOm1hY3JvOmBQUl9NRU1PUllfQ09OU0lTVEVOQ1lfTU9ERUxfUklTQ1ZfV01PYDogUklT
Qy1WIHdlYWsgbWVtb3J5IG9yZGVyaW5nIChkZWZhdWx0KS4KKworKiA6YzptYWNybzpgUFJfTUVN
T1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NWX1RTT2A6IFJJU0MtViB0b3RhbCBzdG9yZSBvcmRl
cmluZy4KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCmluZGV4IGE4NTA5Y2MzMWFiMi4uMDVl
MDVmZGRjOTRkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5o
CisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKQEAgLTE4NCw2ICsxODQs
MTMgQEAgZXh0ZXJuIGludCBzZXRfdW5hbGlnbl9jdGwoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ss
IHVuc2lnbmVkIGludCB2YWwpOwogI2RlZmluZSBHRVRfVU5BTElHTl9DVEwodHNrLCBhZGRyKQln
ZXRfdW5hbGlnbl9jdGwoKHRzayksIChhZGRyKSkKICNkZWZpbmUgU0VUX1VOQUxJR05fQ1RMKHRz
aywgdmFsKQlzZXRfdW5hbGlnbl9jdGwoKHRzayksICh2YWwpKQogCisjaWZkZWYgQ09ORklHX1JJ
U0NWX0lTQV9TU0RUU08KK2V4dGVybiBpbnQgZHRzb19zZXRfbWVtb3J5X2NvbnNpc3RlbmN5X21v
ZGVsKHVuc2lnbmVkIGxvbmcgYXJnKTsKK2V4dGVybiBpbnQgZHRzb19nZXRfbWVtb3J5X2NvbnNp
c3RlbmN5X21vZGVsKHZvaWQpOworI2RlZmluZSBTRVRfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVM
KGFyZykJZHRzb19zZXRfbWVtb3J5X2NvbnNpc3RlbmN5X21vZGVsKGFyZykKKyNkZWZpbmUgR0VU
X01FTU9SWV9DT05TSVNURU5DWV9NT0RFTCgpCQlkdHNvX2dldF9tZW1vcnlfY29uc2lzdGVuY3lf
bW9kZWwoKQorI2VuZGlmIC8qIENPTklHX1JJU0NWX0lTQV9TU0RUU08gKi8KKwogI2VuZGlmIC8q
IF9fQVNTRU1CTFlfXyAqLwogCiAjZW5kaWYgLyogX0FTTV9SSVNDVl9QUk9DRVNTT1JfSCAqLwpk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9NYWtlZmlsZQppbmRleCBmNzE5MTA3MTgwNTMuLjg1ZjcyOTFkYTQ5OCAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZp
bGUKQEAgLTY1LDYgKzY1LDcgQEAgb2JqLSQoQ09ORklHX1JJU0NWX01JU0FMSUdORUQpCSs9IHRy
YXBzX21pc2FsaWduZWQubwogb2JqLSQoQ09ORklHX0ZQVSkJCSs9IGZwdS5vCiBvYmotJChDT05G
SUdfUklTQ1ZfSVNBX1YpCSs9IHZlY3Rvci5vCiBvYmotJChDT05GSUdfUklTQ1ZfSVNBX1YpCSs9
IGtlcm5lbF9tb2RlX3ZlY3Rvci5vCitvYmotJChDT05GSUdfUklTQ1ZfSVNBX1NTRFRTTykJKz0g
ZHRzby5vCiBvYmotJChDT05GSUdfU01QKQkJKz0gc21wYm9vdC5vCiBvYmotJChDT05GSUdfU01Q
KQkJKz0gc21wLm8KIG9iai0kKENPTkZJR19TTVApCQkrPSBjcHVfb3BzLm8KZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL2R0c28uYyBiL2FyY2gvcmlzY3Yva2VybmVsL2R0c28uYwpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjU5MWQ1ZjlkZTBmNQotLS0gL2Rl
di9udWxsCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2R0c28uYwpAQCAtMCwwICsxLDY3IEBACisv
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlciAqLworLyoKKyAqIENv
cHlyaWdodCAoYykgMjAyNCBDaHJpc3RvcGggTXVlbGxuZXIgPGNocmlzdG9waC5tdWVsbG5lckB2
cnVsbC5ldT4KKyAqLworCisjaW5jbHVkZSA8bGludXgvY3B1Lmg+CisjaW5jbHVkZSA8bGludXgv
c21wLmg+CisjaW5jbHVkZSA8bGludXgvcHJjdGwuaD4KKworI2luY2x1ZGUgPGFzbS9jcHUuaD4K
KyNpbmNsdWRlIDxhc20vZHRzby5oPgorCisjaW5jbHVkZSA8dHJhY2UvZXZlbnRzL2lwaS5oPgor
CitpbnQgZHRzb19zZXRfbWVtb3J5X2NvbnNpc3RlbmN5X21vZGVsKHVuc2lnbmVkIGxvbmcgYXJn
KQoreworCWludCBjcHU7CisJdW5zaWduZWQgbG9uZyBjdXJfbW9kZWwgPSBnZXRfbWVtb3J5X2Nv
bnNpc3RlbmN5X21vZGVsKGN1cnJlbnQpOworCXVuc2lnbmVkIGxvbmcgbmV3X21vZGVsOworCisJ
c3dpdGNoIChhcmcpIHsKKwljYXNlIFBSX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTF9SSVNDVl9X
TU86CisJCW5ld19tb2RlbCA9IFJJU0NWX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTF9XTU87CisJ
CWJyZWFrOworCWNhc2UgUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NWX1RTTzoKKwkJ
bmV3X21vZGVsID0gUklTQ1ZfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1RTTzsKKwkJYnJlYWs7
CisJZGVmYXVsdDoKKwkJcmV0dXJuIC1FSU5WQUw7CisJfQorCisJLyogTm8gY2hhbmdlIHJlcXVl
c3RlZC4gKi8KKwlpZiAoY3VyX21vZGVsID09IG5ld19tb2RlbCkKKwkJcmV0dXJuIDA7CisKKwkv
KiBFbmFibGluZyBUU08gb25seSB3b3JrcyBpZiBEVFNPIGlzIGF2YWlsYWJsZS4gKi8KKwlpZiAo
bmV3X21vZGVsID09IFBSX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTF9SSVNDVl9UU08gJiYgIWhh
c19kdHNvKCkpCisJCXJldHVybiAtRUlOVkFMOworCisJLyogU3dpdGNoaW5nIFRTTy0+V01PIGlz
IG5vdCBhbGxvd2VkLiAqLworCWlmIChuZXdfbW9kZWwgPT0gUklTQ1ZfTUVNT1JZX0NPTlNJU1RF
TkNZX01PREVMX1dNTykKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwkvKiBTZXQgdGhlIG5ldyBtb2Rl
bCBpbiB0aGUgdGFzayBzdHJ1Y3QuICovCisJc2V0X21lbW9yeV9jb25zaXRlbmN5X21vZGVsKGN1
cnJlbnQsIG5ld19tb2RlbCk7CisKKwkvKgorCSAqIFdlIG5lZWQgdG8gcmVzY2hlZHVsZSBhbGwg
dGhyZWFkcyBvZiB0aGUgY3VycmVudCBwcm9jZXNzLgorCSAqIExldCdzIGRvIHRoaXMgYnkgcmVz
Y2hlZHVsaW5nIGFsbCBDUFVzLgorCSAqIFRoaXMgaXMgc3RyaWN0ZXIgdGhhbiBuZWNlc3Nhcnks
IGJ1dCBzaW5jZSB0aGlzIGNhbGwgaXMKKwkgKiBub3QgZXhwZWN0ZWQgdG8gaGFwcGVuIGZyZXF1
ZW50bHkgdGhlIGltcGFjdCBpcyBsb3cuCisJICovCisJZm9yX2VhY2hfY3B1KGNwdSwgY3B1X29u
bGluZV9tYXNrKQorCQlzbXBfc2VuZF9yZXNjaGVkdWxlKGNwdSk7CisKKwlyZXR1cm4gMDsKK30K
KworaW50IGR0c29fZ2V0X21lbW9yeV9jb25zaXN0ZW5jeV9tb2RlbCh2b2lkKQoreworCXVuc2ln
bmVkIGxvbmcgY3VyX21vZGVsID0gZ2V0X21lbW9yeV9jb25zaXN0ZW5jeV9tb2RlbChjdXJyZW50
KTsKKworCWlmIChjdXJfbW9kZWwgPT0gUklTQ1ZfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1RT
TykKKwkJcmV0dXJuIFBSX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTF9SSVNDVl9UU087CisKKwly
ZXR1cm4gUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NWX1dNTzsKK30KZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3ByY3Rs
LmgKaW5kZXggNTc5NjYyNzMxZWFhLi4yMDI2NGJkYzMwOTIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
dWFwaS9saW51eC9wcmN0bC5oCisrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9wcmN0bC5oCkBAIC0z
MDgsNSArMzA4LDcgQEAgc3RydWN0IHByY3RsX21tX21hcCB7CiAKICNkZWZpbmUgUFJfU0VUX01F
TU9SWV9DT05TSVNURU5DWV9NT0RFTAkJNzEKICNkZWZpbmUgUFJfR0VUX01FTU9SWV9DT05TSVNU
RU5DWV9NT0RFTAkJNzIKKyMgZGVmaW5lIFBSX01FTU9SWV9DT05TSVNURU5DWV9NT0RFTF9SSVND
Vl9XTU8JMQorIyBkZWZpbmUgUFJfTUVNT1JZX0NPTlNJU1RFTkNZX01PREVMX1JJU0NWX1RTTwky
CiAKICNlbmRpZiAvKiBfTElOVVhfUFJDVExfSCAqLwotLSAKMi40My4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
