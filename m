Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F972C6FA8F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 05:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iUep97XqrU01nJylVJ16IU9M2BHVKbflsibtTTkZf8=; b=nUiPV2WrBF6kkE
	lVqsVGIp72ocOlYRoWrE21J1CbmIMi3JF5na1ILINiUgtKpa5QJStCb77hBetz9YxgmOJllBoSrmz
	LFL078ArpthCqjw5E4BAjmJz2D8iwYpf3mpiLueax8rPBkYyYXCWNxsFZtt2O/rjKrlC7e/J3GuKk
	HAJM/+ae7K9ASqE+2gmjUD9LUF5N/FjVy/Ncc/mMypmxTdxuvYOSbZFmGtee57kY0RjEqL7nQQp6K
	nKHFDhUJz2TTfrx/1Wwo1wXmxMoVGA8+glQzDSXUY6hswQhqiPVXpcDR5SlAcin1E3QV76yxxNmZE
	xXm9gbks9eXUoxkNLNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qarid-00Aq6k-2d;
	Tue, 29 Aug 2023 05:56:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaria-00Aq6P-2A
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 05:56:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 085836328C
	for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 05:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E96C433CD
	for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 05:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693288607;
	bh=GHHkPR35toSxzOfxlddnnJ703WBXHEWeFZs2AlRYTcY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ItiyHdGa5vJTY81r4sMWGGJGrcXn7GIRxjMZ/wQDd02NCME/plVcQXhrY/s0f2wuD
	 pilpjxljACTzSaYIm8hzY2gFIprgOoOOOKhZqMzuiKZWiEPH/how8RKnr9Oz9Li9E3
	 ScBlvma2MITIXPiBvGDm4+1sLaX5pU3nZVQVl3n4xsegP70nQA1djK1OBJ4DCeyRzj
	 PG8VSKURBodV/LAP47R9hQ9QwOaNLobGEAMYBAHMK1vOlAoobCp5tin+m+FC0XYsC4
	 4HJdg0RquZ/g5GmRflODwgPyIZzeUYcjsWifExWrmPRy4HqU6Af7vCrsR7Dd/PnoIF
	 VEtzoVpERlnIg==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4c0so1110781a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 22:56:47 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx0/BIQzta90lEogepseXzd+V3p5cXijKR8I4osqcP9U+2itVmS
	rurE8DD35InBk2N26pqu0MpEjkCal8tengnqbZQ=
X-Google-Smtp-Source: AGHT+IEhuS/SYYom6A9cFYHQOUWJI/C4KpeyQx3moGfAV70g1L72S35b6Vfbvo5SPks92ju6HiVUV3Po9s/Uj7hxgLk=
X-Received: by 2002:a05:6402:42c5:b0:51d:cf7b:c9f0 with SMTP id
 i5-20020a05640242c500b0051dcf7bc9f0mr2143427edc.12.1693288605619; Mon, 28 Aug
 2023 22:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230827205641.46836-1-namcaov@gmail.com>
In-Reply-To: <20230827205641.46836-1-namcaov@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 29 Aug 2023 13:56:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQysBBSbtFcx1uY_ztTnzN5jRWpG2OD4O3aJ0u9Ekwsag@mail.gmail.com>
Message-ID: <CAJF2gTQysBBSbtFcx1uY_ztTnzN5jRWpG2OD4O3aJ0u9Ekwsag@mail.gmail.com>
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bjorn@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_225648_816153_EF39A19B 
X-CRM114-Status: GOOD (  20.96  )
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

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgNDo1NuKAr0FNIE5hbSBDYW8gPG5hbWNhb3ZAZ21haWwu
Y29tPiB3cm90ZToKPgo+IHVwcm9iZXMgZXhwZWN0cyBpc190cmFwX2luc24oKSB0byByZXR1cm4g
dHJ1ZSBmb3IgYW55IHRyYXAgaW5zdHJ1Y3Rpb25zLAo+IG5vdCBqdXN0IHRoZSBvbmUgdXNlZCBm
b3IgaW5zdGFsbGluZyB1cHJvYmUuIFRoZSBjdXJyZW50IGRlZmF1bHQKPiBpbXBsZW1lbnRhdGlv
biBvbmx5IHJldHVybnMgdHJ1ZSBmb3IgMTYtYml0IGMuZWJyZWFrIGlmIEMgZXh0ZW5zaW9uIGlz
Cj4gZW5hYmxlZC4gVGhpcyBjYW4gY29uZnVzZSB1cHJvYmVzIGlmIGEgMzItYml0IGVicmVhayBn
ZW5lcmF0ZXMgYSB0cmFwCj4gZXhjZXB0aW9uIGZyb20gdXNlcnNwYWNlOiB1cHJvYmVzIGFza3Mg
aXNfdHJhcF9pbnNuKCkgd2hvIHNheXMgdGhlcmUgaXMgbm8KPiB0cmFwLCBzbyB1cHJvYmVzIGFz
c3VtZSBhIHByb2JlIHdhcyB0aGVyZSBiZWZvcmUgYnV0IGhhcyBiZWVuIHJlbW92ZWQsIGFuZAo+
IHJldHVybiB0byB0aGUgdHJhcCBpbnN0cnVjdGlvbi4gVGhpcyBjYXVzZSBhbiBpbmZpbml0ZSBs
b29wIG9mIGVudGVyaW5nCj4gYW5kIGV4aXRpbmcgdHJhcCBoYW5kbGVyLgo+Cj4gSW5zdGVhZCBv
ZiB1c2luZyB0aGUgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiwgaW1wbGVtZW50IHRoaXMgZnVuY3Rp
b24KPiBzcGVmaWNpYWxseSBmb3IgcmlzY3Ygd2hpY2ggY2hlY2tzIGZvciBib3RoIGVicmVhayBh
bmQgYy5lYnJlYWsuCj4KPiBGaXhlczogNzQ3ODQwODFhYWM4ICgicmlzY3Y6IEFkZCB1cHJvYmVz
IHN1cHBvcnRlZCIpCj4gU2lnbmVkLW9mZi1ieTogTmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVzLmMgfCAxMCArKysrKysr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3By
b2Jlcy91cHJvYmVzLmMKPiBpbmRleCAxOTRmMTY2YjJjYzQuLjkxZjRjZTEwMWNkMSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYwo+IEBAIC0zLDYgKzMsNyBAQAo+ICAjaW5jbHVk
ZSA8bGludXgvaGlnaG1lbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvcHRyYWNlLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC91cHJvYmVzLmg+Cj4gKyNpbmNsdWRlIDxhc20vaW5zbi5oPgo+Cj4gICNpbmNs
dWRlICJkZWNvZGUtaW5zbi5oIgo+Cj4gQEAgLTE3LDYgKzE4LDE1IEBAIGJvb2wgaXNfc3dicF9p
bnNuKHVwcm9iZV9vcGNvZGVfdCAqaW5zbikKPiAgI2VuZGlmCj4gIH0KID4KPiArYm9vbCBpc190
cmFwX2luc24odXByb2JlX29wY29kZV90ICppbnNuKQo+ICt7Cj4gKyNpZmRlZiBDT05GSUdfUklT
Q1ZfSVNBX0MKQ2FuIHdlIHJlbW92ZSB0aGUgQ09ORklHX1JJU0NWX0lTQV9DPyBBcyB5b3Ugc2Fp
ZCwgInVwcm9iZXMgZXhwZWN0cwppc190cmFwX2luc24oKSB0byByZXR1cm4gdHJ1ZSBmb3IgYW55
IHRyYXAgaW5zdHJ1Y3Rpb25zIi4gU28gdXNlcnNwYWNlCndvdWxkbid0IGJlIGxpbWl0ZWQgYnkg
Q09ORklHX1JJU0NWX0lTQV9DLgoKPiArICAgICAgIGlmIChyaXNjdl9pbnNuX2lzX2NfZWJyZWFr
KCppbnNuKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gKyNlbmRpZgo+ICsgICAg
ICAgcmV0dXJuIHJpc2N2X2luc25faXNfZWJyZWFrKCppbnNuKTsKPiArfQo+ICsKPiAgdW5zaWdu
ZWQgbG9uZyB1cHJvYmVfZ2V0X3N3YnBfYWRkcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgewo+
ICAgICAgICAgcmV0dXJuIGluc3RydWN0aW9uX3BvaW50ZXIocmVncyk7Cj4gLS0KPiAyLjM0LjEK
PgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
