Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE55C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFCh5evdBapWRjZ7ohbgsegY3z3w7u2tBcrrssbsp+g=; b=SaYCc8z5VdEj9C
	ptk8iuXy1EhkIAKtG+ua3kFUHgh6IdDZ/ctacNbrwxk3+GHddW3EvDdclFLi8Zf0X7hZLvIvIU25L
	OzczHNRXcRAPFou7XUVVMBLpAbLK3zUxeXOlaeh7dZ53pLPKxXIcc6zmd6HgN81mNR4aPb5RZ/TLz
	U3nYsjFbaltkfSphhdkk1xdtc49NKkWH13+06BfycW7DyTc2ePVJRDUuOCcjTd3fGljL+3ZJEZPdQ
	/+z0dBtDXwbMNBOjRr0DD6iDP0HwZ6PsuzCdIYGzxkdLP1RqwBpVMltejsqXJF6Zr/14a+fu4W/JN
	sIpfk6eKzCNxKmy4E5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jYX-00BI2V-1Z;
	Thu, 30 Nov 2023 16:06:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jYU-00BI1m-2o
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 16:06:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40b35199f94so81565e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 08:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701360378; x=1701965178; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6Wu9BYoPOgzOTrfzG/UoYHqri4WRctrB3D+iqT3Lb8=;
        b=N4BWTgfBxuvWURzcBNdxGsJmaFluIRZGtxozPZGf5DV124holja5O1RjoaCZ/ED4A7
         7zhvFymxwDuGXBEOJqBibRo9uOe9TnZM1cQfsaCKvRZ5Wi/NadtmYHBGFVMZ7ssuOANO
         rhnBytpQawEflUng3RD0DuZH/pDbvwE2SQTFEH7alnm1ryaUgLM4f/M0G4qD35xvYRAo
         7c+z9SyqNexNJCLGgIuuUb2oJvcq4nGeu31o3ff30IT9ORfbfQIMrSHWeV2+ZKCTx77q
         glCd/40o6NfSmEiA2lCmnqJZ110zVsaATQCRCsbCRNG7/kZ5fzuf0o2qLvWXVqQQAuJ7
         83mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701360378; x=1701965178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6Wu9BYoPOgzOTrfzG/UoYHqri4WRctrB3D+iqT3Lb8=;
        b=fLDI6JlT1UBpdxJz+yhAsO9ba8soGOdW2hwWZ34kwoz1QlbAOT3kGB8Dg5GNl4aFWi
         vLvUiBpe5mfDUGZ+b1l0/BVR+W4N9x2FgMOLcXO74nbpbAeT4Yge4Jz3qvTMcNRqN/LF
         TXY65iILb/Q3NStAITgpnkyAQxOMQQ/nl6piG1ZmfI7uLnOhJQE6G7/tylybsMJYviBb
         XsIrc2WIQamzEDGylBhmkNTNctRzSM0yQUMaxkk6Ya6HooICwRfnhs/OS0KcGnODciEd
         Dtc6BS5B8K8pZAkT1qFH/oDD+gsebcPyD18RG6xgd96zu/+BeJ3IbfbKbtBI0bHSFG1R
         1cVQ==
X-Gm-Message-State: AOJu0YyqJL9p7Z0pUhoPxB6Ca7mB//IYPNPFKt3mAS2P47lKXcTQrkWl
	VXPoIomxQvHHjCgJpXTbN/6+WBoASPv+/hXRxEix3A==
X-Google-Smtp-Source: AGHT+IFCeuDKxzqLbWkqyo4oZIA5ZPre+Z7BPi/It9wdY5IGOQ7jgdPnEFeelRaufUJIJAQBvu7D/RkZCQb4LKJexsA=
X-Received: by 2002:a05:600c:1e15:b0:40b:3483:8488 with SMTP id
 ay21-20020a05600c1e1500b0040b34838488mr133007wmb.3.1701360378046; Thu, 30 Nov
 2023 08:06:18 -0800 (PST)
MIME-Version: 1.0
References: <20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org> <20231129-riscv-restrict-dwarf5-llvm-v1-1-ec0d368fb538@kernel.org>
In-Reply-To: <20231129-riscv-restrict-dwarf5-llvm-v1-1-ec0d368fb538@kernel.org>
From: Fangrui Song <maskray@google.com>
Date: Thu, 30 Nov 2023 08:06:04 -0800
Message-ID: <CAFP8O3LNUFREj4er4Ateq2-6hyHyeJLLg71bE7bLjFZ23E1xgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Hoist linker relaxation disabling logic into Kconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, ndesaulniers@google.com, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_080622_913179_C5FDC030 
X-CRM114-Status: GOOD (  15.53  )
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

T24gV2VkLCBOb3YgMjksIDIwMjMgYXQgMzozMOKAr1BNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBDZXJ0YWluIGNvbmZpZ3VyYXRpb25zIG1heSBuZWVk
IHRvIGJlIGRpc2FibGVkIGlmIGxpbmtlciByZWxheGF0aW9uIGlzCj4gaW4gdXNlLCBzdWNoIGFz
IERXQVJGNSB3aXRoIGxkLmxsZCA8IDE4LiBIb2lzdCB0aGUgbG9naWMgb2Ygd2hldGhlciBvcgo+
IG5vdCBsaW5rZXIgcmVsYXhhdGlvbiBpcyBpbiB1c2UgaW50byBLY29uZmlnIHNvIGRlY2lzaW9u
cyBjYW4gYmUgbWFkZSBhdAo+IGNvbmZpZ3VyYXRpb24gdGltZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJjaC9yaXNj
di9LY29uZmlnICB8IDUgKysrKysKPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSB8IDQgKy0tLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCA5
NWEyYTA2YWNjNmEuLjcyYmUxZDgxMjJhMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25m
aWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtMTgxLDYgKzE4MSwxMSBAQCBjb25m
aWcgSEFWRV9TSEFET1dfQ0FMTF9TVEFDSwo+ICAgICAgICAgIyBodHRwczovL2dpdGh1Yi5jb20v
cmlzY3Ytbm9uLWlzYS9yaXNjdi1lbGYtcHNhYmktZG9jL2NvbW1pdC9hNDg0ZTg0M2U2ZWViNTFm
MGNiN2I4ODE5ZTUwZGE2ZDI0NDRkNzY5Cj4gICAgICAgICBkZXBlbmRzIG9uICQobGQtb3B0aW9u
LC0tbm8tcmVsYXgtZ3ApCj4KPiArY29uZmlnIFJJU0NWX1VTRV9MSU5LRVJfUkVMQVhBVElPTgo+
ICsgICAgICAgZGVmX2Jvb2wgeQo+ICsgICAgICAgIyBodHRwczovL2dpdGh1Yi5jb20vbGx2bS9s
bHZtLXByb2plY3QvY29tbWl0LzY2MTFkNThmNWJiY2JlYzc3MjYyZDM5MmUyOTIzZTFkNjgwZjY5
ODUKPiArICAgICAgIGRlcGVuZHMgb24gIUxEX0lTX0xMRCB8fCBMTERfVkVSU0lPTiA+PSAxNTAw
MDAKPiArCj4gIGNvbmZpZyBBUkNIX01NQVBfUk5EX0JJVFNfTUlOCj4gICAgICAgICBkZWZhdWx0
IDE4IGlmIDY0QklUCj4gICAgICAgICBkZWZhdWx0IDgKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiBpbmRleCBhNzRiZTc4Njc4ZWIuLmUz
ODNhYTllMjc1NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gKysrIGIvYXJj
aC9yaXNjdi9NYWtlZmlsZQo+IEBAIC00Myw4ICs0Myw3IEBAIGVsc2UKPiAgICAgICAgIEtCVUlM
RF9MREZMQUdTICs9IC1tZWxmMzJscmlzY3YKPiAgZW5kaWYKPgo+IC1pZmVxICgkKENPTkZJR19M
RF9JU19MTEQpLHkpCj4gLWlmZXEgKCQoY2FsbCB0ZXN0LWx0LCAkKENPTkZJR19MTERfVkVSU0lP
TiksIDE1MDAwMCkseSkKPiAraWZuZGVmIENPTkZJR19SSVNDVl9VU0VfTElOS0VSX1JFTEFYQVRJ
T04KPiAgICAgICAgIEtCVUlMRF9DRkxBR1MgKz0gLW1uby1yZWxheAo+ICAgICAgICAgS0JVSUxE
X0FGTEFHUyArPSAtbW5vLXJlbGF4Cj4gIGlmbmRlZiBDT05GSUdfQVNfSVNfTExWTQo+IEBAIC01
Miw3ICs1MSw2IEBAIGlmbmRlZiBDT05GSUdfQVNfSVNfTExWTQo+ICAgICAgICAgS0JVSUxEX0FG
TEFHUyArPSAtV2EsLW1uby1yZWxheAo+ICBlbmRpZgo+ICBlbmRpZgo+IC1lbmRpZgo+Cj4gIGlm
ZXEgKCQoQ09ORklHX1NIQURPV19DQUxMX1NUQUNLKSx5KQo+ICAgICAgICAgS0JVSUxEX0xERkxB
R1MgKz0gLS1uby1yZWxheC1ncAo+Cj4gLS0KPiAyLjQzLjAKCgpSZXZpZXdlZC1ieTogRmFuZ3J1
aSBTb25nIDxtYXNrcmF5QGdvb2dsZS5jb20+CgoKLS0gCuWui+aWueedvwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
