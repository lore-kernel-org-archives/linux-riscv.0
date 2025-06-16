Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB77AC71155
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 15:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKoVkvrznN6HWk4IEN5UmD7g5MGY9vas95RUg9krBtE=; b=DUZXHdqklaV3HU
	u+XOmi7t2fNF/p8dz64WcCgkvIKEWwAC0LVud6ZDt4rEfeV6thxd/KRLb9bHx2VBrVvM4xpXY1Dhj
	QisBKwIz0Aj9/ZqQXJhK1TnI+lqYmFn9S/19YUuSMuRWSMDDYSiXTLmLEwS78sA77DxqOBhyd8KP/
	V/EpR0U+WJnyGdWhk/1o3wfDDw/hXV/Hm/+E+MslC72tltbN889n1dfwwS4xMlFFUDO7dgvO47gBn
	OdHsmr8jOZxC2zpJGgRDpxO8j/chIZ+XhihB9hPjNcc1Gbd9nMvFDgw9N9LblV/wH85BgCnj+MKjH
	gUTiam7sGT2x+Q9qfbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBkd-00000004rkd-07wM;
	Mon, 16 Jun 2025 15:27:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBAC-00000004l4N-2lN8
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 14:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C0CFF614E0
	for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 14:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36680C4CEF8
	for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 14:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750085419;
	bh=CJbgTCTx8qarV17MPocFFxuPdcwMpLk3HX0Ll4s7Os8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ViByxyLm8vI8JkFEr2IkJH2wr/QHKmSez9OI7m1J42BqvP6fFcyeQkTYdGa/XM+7v
	 7+h34Fayfsqa8RWGCjGoFW8tXZb9byrVXB39gLB1oJFYbCGbeDcs8O7F/+RUuvMEKZ
	 yFkcLBBQAO037JtspQIqyIhEnGZiRU+f1nZPIbCRJkqJ3OPCSrhQnmpUIprm6HDaRs
	 /iobmUlkxpRXJBYgVMoBfWZqPcrz/K9M7QwXBLxwdaAKEKrMweSlkuiMRBfDfZ+4uY
	 /kR4oc2GJaBC6emS+JZp3vAeXDIEkm2JtoW+cvu0v9AkveLcWzE5ZTJxE5tjGo5VC2
	 DAkkRdmJx8xoQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553a4f3ae42so4047113e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jun 2025 07:50:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlYdy2vIKsWhaOMRJEFKTY9EM5fMhK+t1bHbJZHlDHhBmaZL8WlV7LlG9Oi/biR0ZSW3qoKu4NV7hLEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxta0svoB8Gz1J21TxpdZu/9UrkPE0A6ICSLpDOY52MIfW/eKjf
	ZdtI384YHR5C/xQSDq0X0mFTwkwtHDmSbX802z2gYdvNph92d/Fq6cU/b6stCxMAP54EvmZps0O
	AOcxIpkwcCbb1KboHyy0mK3yEV4ZeMv4=
X-Google-Smtp-Source: AGHT+IH4/5g9uzTm/KdVR9mD4Ksdt/b1gVZr6h0kIW5h/9MLI04ytE0/bOqcr7hXY+TIcHvDH+Pq4AOgGxSOJSvWxBs=
X-Received: by 2002:a05:6512:39ca:b0:549:8f10:ec25 with SMTP id
 2adb3069b0e04-553b6f1a0d6mr2694465e87.31.1750085417817; Mon, 16 Jun 2025
 07:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de> <20250611-kunit-kselftests-v3-2-55e3d148cbc6@linutronix.de>
In-Reply-To: <20250611-kunit-kselftests-v3-2-55e3d148cbc6@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 16 Jun 2025 23:49:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNATuk_tpDAq07e5oSU4FptRO_88Oxh2=W=3YmBotbGuU5g@mail.gmail.com>
X-Gm-Features: AX0GCFudTxJzfYzvyir9-nqwoqXgGH13IYC-ZyKhFKJ-XhxgZlrofwO8PDGWIb8
Message-ID: <CAK7LNATuk_tpDAq07e5oSU4FptRO_88Oxh2=W=3YmBotbGuU5g@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] kbuild: userprogs: also inherit byte order and
 ABI from kernel
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Willy Tarreau <w@1wt.eu>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	workflows@vger.kernel.org
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgNDozOOKAr1BNIFRob21hcyBXZWnDn3NjaHVoCjx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE1ha2Ugc3VyZSB0aGUgYnl0
ZSBvcmRlciBhbmQgQUJJIG9mIHRoZSB1c2VycHJvZ3MgbWF0Y2hlcyB0aGUgb25lIG9mIHRoZQo+
IGtlcm5lbCwgc2ltaWxhciB0byBob3cgdGhlIGJpdCBzaXplIGlzIGhhbmRsZWQuCj4gT3RoZXJ3
aXNlIHRoZSB1c2VycHJvZ3MgbWF5IG5vdCBiZSBleGVjdXRhYmxlLgo+IFRoaXMgaGFwcGVucyBm
b3IgZXhhbXBsZSBvbiBwb3dlcnBjIGxpdHRsZSBlbmRpYW4sIG9yIHJpc2N2MzIuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2NodWhAbGludXRyb25p
eC5kZT4KPiAtLS0KPiAgTWFrZWZpbGUgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01h
a2VmaWxlCj4gaW5kZXggYzQyOTNjZjkxZTk2OGNhOGVlNjQ0NTI4NDFmYjI2NmUyNGRmNjNmNi4u
YjlhYTEwNTgzMjFkYWJkM2IzZGQ1NjEwZTQ1YTI4MDdkZmEyNTdmNCAxMDA2NDQKPiAtLS0gYS9N
YWtlZmlsZQo+ICsrKyBiL01ha2VmaWxlCj4gQEAgLTExMjksOCArMTEyOSw4IEBAIGlmbmVxICgk
KENPTkZJR19BUkNIX1ZNTElOVVhfTkVFRFNfUkVMT0NTKSwpCj4gIExERkxBR1Nfdm1saW51eCAg
ICAgICAgKz0gLS1lbWl0LXJlbG9jcyAtLWRpc2NhcmQtbm9uZQo+ICBlbmRpZgo+Cj4gLSMgQWxp
Z24gdGhlIGJpdCBzaXplIG9mIHVzZXJzcGFjZSBwcm9ncmFtcyB3aXRoIHRoZSBrZXJuZWwKPiAt
VVNFUkZMQUdTX0ZST01fS0VSTkVMIDo9IC1tMzIgLW02NCAtLXRhcmdldD0lCj4gKyMgQWxpZ24g
dGhlIGJpdCBzaXplLCBieXRlIG9yZGVyIGFuZCBhcmNoaXRlY3R1cmUgb2YgdXNlcnNwYWNlIHBy
b2dyYW1zIHdpdGggdGhlIGtlcm5lbAo+ICtVU0VSRkxBR1NfRlJPTV9LRVJORUwgOj0gLW0zMiAt
bTY0IC1tbGl0dGxlLWVuZGlhbiAtbWJpZy1lbmRpYW4gLS10YXJnZXQ9JSAtbWFyY2g9JSAtbWFi
aT0lCj4gIEtCVUlMRF9VU0VSQ0ZMQUdTICArPSAkKGZpbHRlciAkKFVTRVJGTEFHU19GUk9NX0tF
Uk5FTCksICQoS0JVSUxEX0NQUEZMQUdTKSAkKEtCVUlMRF9DRkxBR1MpKQo+ICBLQlVJTERfVVNF
UkxERkxBR1MgKz0gJChmaWx0ZXIgJChVU0VSRkxBR1NfRlJPTV9LRVJORUwpLCAkKEtCVUlMRF9D
UFBGTEFHUykgJChLQlVJTERfQ0ZMQUdTKSkKCgpXaHkgZGlkbid0IHlvdSBkbyBsaWtlIHRoaXM/
CgpVU0VSRkxBR1NfRlJPTV9LRVJORUwgOj0gJChmaWx0ZXIgLW0zMiAtbTY0IC1tbGl0dGxlLWVu
ZGlhbgotbWJpZy1lbmRpYW4gLS10YXJnZXQ9JSAtbWFyY2g9JSAtbWFiaT0lLCAkKEtCVUlMRF9D
UFBGTEFHUykKJChLQlVJTERfQ0ZMQUdTKSkKS0JVSUxEX1VTRVJDRkxBR1MgICs9ICQoVVNFUkZM
QUdTX0ZST01fS0VSTkVMKQpLQlVJTERfVVNFUkxERkxBR1MgKz0gJChVU0VSRkxBR1NfRlJPTV9L
RVJORUwpCgoKCi0tCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
