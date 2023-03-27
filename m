Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BC8C74A5B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 02:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w53IVoHL2cypORXhL1GxZthRjrrm1G0uwm1c1vKujRY=; b=p6WACQE+Wcma+6
	oa0pwdgITGqCQne/+6cTk4mC/rrSxdWYQ+Tp1fi6/kD+A4+MpepK8UrEti1S33CT2fDzaHJof4cjk
	IcscoODHZtH/S5/azrD5FUCJdTIz8kaid3otNe51W0uVdq+u7kDNiXJTIcE2Za6sSx7VKHodOa7R8
	IkZx0R3kcawfaezajnfYvuCh3jWHhaMhFf4l9iSStHVNNq6MKWL+uwEjJnmPL7WAbCM3DApFHuIDR
	OPMdI1ZsJktmWkbTEKgDZjPzAXgeEkESII51Esu3CMULzXPDPe4LRAWBptAVpuTU6cQkMpvhimKQK
	QYXcUzrZ7FweaxMuvfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgcoR-009YSJ-1J;
	Mon, 27 Mar 2023 02:42:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgcoN-009YRY-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 02:42:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D839B80B9E
	for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 02:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3B3C433A1
	for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 02:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679884930;
	bh=6VzDqX48Vl38IiLh2rkurFRzDn0V2PY1IZwfkVKLHBs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=le+wVaujnmigkIxLcC+BBlb+L/EMpxeO7Na5IaemZUVhnFs3HUxmNZHz7oPcctthu
	 xKbTOv+VAm17PPXvskg+agwZs0QJhMklxMh7wf3BOpHkVrbgbEILQgzGLzYvOqQGUv
	 e/poab9zYziebClPUO3ZyGyUhe8NMoonf9lc+0uyfnLM7t9JVXmEnuizf4bL/8xGdR
	 2OxDPf0urRfD7akRCN+pa3di3mvIwCrXCnhr3DvnDUOx004YT6uAL7fifIWYlgoKVP
	 Xj+euO8CwKwp5AMM/ca5VYm5y1nAOTrHQEQ4ZnqFpYT701MxbojYvK6BN3G8CgmxFs
	 qK3ALWFQo7jAA==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-17aa62d0a4aso7820205fac.4
        for <linux-riscv@lists.infradead.org>; Sun, 26 Mar 2023 19:42:10 -0700 (PDT)
X-Gm-Message-State: AAQBX9cjp690jBVY+R45pi6gSJaRn5aI7jx+tr6wvVt3qX5e3qMRLwOc
	z07U44il4VuwV+uIqYIuOqmmZ8bD3lkG1I2+Wsw=
X-Google-Smtp-Source: AKy350bMxmeywLQZtcIhcbwfTUAlICv85a5HdlyEXx820LhBAGY0y4TcQppgHU2tLzA5NynqOEARjQGH1XU2iOfJIuY=
X-Received: by 2002:a05:6871:e86:b0:17e:d9e2:a55c with SMTP id
 vl6-20020a0568710e8600b0017ed9e2a55cmr3302021oab.11.1679884929854; Sun, 26
 Mar 2023 19:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230326182120.194541-1-hi@alyssa.is>
In-Reply-To: <20230326182120.194541-1-hi@alyssa.is>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 27 Mar 2023 11:41:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR6W9=dOwV8E=biPQ_KGF7LXcb2-6PdSevej7H0xs7EUA@mail.gmail.com>
Message-ID: <CAK7LNAR6W9=dOwV8E=biPQ_KGF7LXcb2-6PdSevej7H0xs7EUA@mail.gmail.com>
Subject: Re: [PATCH v2] purgatory: fix disabling debug info
To: Alyssa Ross <hi@alyssa.is>
Cc: Nick Cao <nickcao@nichi.co>, linux-kbuild@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Tom Rix <trix@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_194220_133514_AC9C3A65 
X-CRM114-Status: GOOD (  17.86  )
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

T24gTW9uLCBNYXIgMjcsIDIwMjMgYXQgMzoyM+KAr0FNIEFseXNzYSBSb3NzIDxoaUBhbHlzc2Eu
aXM+IHdyb3RlOgo+Cj4gU2luY2UgMzJlZjllNTA1NGVjLCAtV2EsLWdkd2FyZi0yIGlzIG5vIGxv
bmdlciB1c2VkIGluIEtCVUlMRF9BRkxBR1MuCj4gSW5zdGVhZCwgaXQgaW5jbHVkZXMgLWcsIHRo
ZSBhcHByb3ByaWF0ZSAtZ2R3YXJmLSogZmxhZywgYW5kIGFsc28gdGhlCj4gLVdhIHZlcnNpb25z
IG9mIGJvdGggb2YgdGhvc2UgaWYgYnVpbGRpbmcgd2l0aCBDbGFuZyBhbmQgR05VIGFzLiAgQXMg
YQo+IHJlc3VsdCwgZGVidWcgaW5mbyB3YXMgYmVpbmcgZ2VuZXJhdGVkIGZvciB0aGUgcHVyZ2F0
b3J5IG9iamVjdHMsIGV2ZW4KPiB0aG91Z2ggdGhlIGludGVudGlvbiB3YXMgdGhhdCBpdCBub3Qg
YmUuCj4KPiBGaXhlczogMzJlZjllNTA1NGVjICgiTWFrZWZpbGUuZGVidWc6IHJlLWVuYWJsZSBk
ZWJ1ZyBpbmZvIGZvciAuUyBmaWxlcyIpCj4gU2lnbmVkLW9mZi1ieTogQWx5c3NhIFJvc3MgPGhp
QGFseXNzYS5pcz4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwoKCgpUaGFua3MsIGxvb2tz
IGdvb2QgdG8gbWUuCgpJIGNhbiBvZmZlciB0byBwaWNrIHRoaXMgdXAgdG8gbXkgdHJlZSBsYXRl
ciwKYnV0IEkgd2lsbCB3YWl0IGZvciBBY2sgZnJvbSB0aGUgYXJjaCBtYWludGFpbmVycwphbmQg
b3RoZXIgY29tbWVudHMuCgoKCgoKCgo+IC0tLQo+Cj4gRGlmZmVyZW5jZSBmcm9tIHYyOiByZXBs
YWNlIGVhY2ggQUZMQUdTX1JFTU9WRV8qIGFzc2lnbm1lbnQgd2l0aCBhCj4gc2luZ2xlIGFmbGFn
cy1yZW1vdmUteSBsaW5lLCBhbmQgdXNlIGZvcmVhY2ggdG8gYWRkIHRoZSAtV2EgdmVyc2lvbnMs
Cj4gYXMgc3VnZ2VzdGVkIGJ5IE1hc2FoaXJvIFlhbWFkYS4KPgo+ICBhcmNoL3Jpc2N2L3B1cmdh
dG9yeS9NYWtlZmlsZSB8IDcgKy0tLS0tLQo+ICBhcmNoL3g4Ni9wdXJnYXRvcnkvTWFrZWZpbGUg
ICB8IDMgKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvcHVyZ2F0b3J5L01ha2VmaWxlIGIvYXJj
aC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUKPiBpbmRleCBkMTZiZjcxNWE1ODYuLjU3MzA3OTdh
NmI0MCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9NYWtlZmlsZQo+ICsrKyBi
L2FyY2gvcmlzY3YvcHVyZ2F0b3J5L01ha2VmaWxlCj4gQEAgLTg0LDEyICs4NCw3IEBAIENGTEFH
U19zdHJpbmcubyAgICAgICAgICAgICAgICAgICAgICArPSAkKFBVUkdBVE9SWV9DRkxBR1MpCj4g
IENGTEFHU19SRU1PVkVfY3R5cGUubyAgICAgICAgICArPSAkKFBVUkdBVE9SWV9DRkxBR1NfUkVN
T1ZFKQo+ICBDRkxBR1NfY3R5cGUubyAgICAgICAgICAgICAgICAgKz0gJChQVVJHQVRPUllfQ0ZM
QUdTKQo+Cj4gLUFGTEFHU19SRU1PVkVfZW50cnkubyAgICAgICAgICArPSAtV2EsLWdkd2FyZi0y
Cj4gLUFGTEFHU19SRU1PVkVfbWVtY3B5Lm8gICAgICAgICArPSAtV2EsLWdkd2FyZi0yCj4gLUFG
TEFHU19SRU1PVkVfbWVtc2V0Lm8gICAgICAgICArPSAtV2EsLWdkd2FyZi0yCj4gLUFGTEFHU19S
RU1PVkVfc3RyY21wLm8gICAgICAgICArPSAtV2EsLWdkd2FyZi0yCj4gLUFGTEFHU19SRU1PVkVf
c3RybGVuLm8gICAgICAgICArPSAtV2EsLWdkd2FyZi0yCj4gLUFGTEFHU19SRU1PVkVfc3RybmNt
cC5vICAgICAgICAgICAgICAgICs9IC1XYSwtZ2R3YXJmLTIKPiArYXNmbGFncy1yZW1vdmUteSAg
ICAgICAgICAgICAgICs9ICQoZm9yZWFjaCB4LCAtZyAtZ2R3YXJmLTQgLWdkd2FyZi01LCAkKHgp
IC1XYSwkKHgpKQo+Cj4gICQob2JqKS9wdXJnYXRvcnkucm86ICQoUFVSR0FUT1JZX09CSlMpIEZP
UkNFCj4gICAgICAgICAgICAgICAgICQoY2FsbCBpZl9jaGFuZ2VkLGxkKQo+IGRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9wdXJnYXRvcnkvTWFrZWZpbGUgYi9hcmNoL3g4Ni9wdXJnYXRvcnkvTWFrZWZp
bGUKPiBpbmRleCAxN2YwOWRjMjYzODEuLjgyZmVjNjZkNDZkMiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3g4Ni9wdXJnYXRvcnkvTWFrZWZpbGUKPiArKysgYi9hcmNoL3g4Ni9wdXJnYXRvcnkvTWFrZWZp
bGUKPiBAQCAtNjksOCArNjksNyBAQCBDRkxBR1Nfc2hhMjU2Lm8gICAgICAgICAgICAgICAgICAg
ICAgICs9ICQoUFVSR0FUT1JZX0NGTEFHUykKPiAgQ0ZMQUdTX1JFTU9WRV9zdHJpbmcubyAgICAg
ICAgICs9ICQoUFVSR0FUT1JZX0NGTEFHU19SRU1PVkUpCj4gIENGTEFHU19zdHJpbmcubyAgICAg
ICAgICAgICAgICAgICAgICAgICs9ICQoUFVSR0FUT1JZX0NGTEFHUykKPgo+IC1BRkxBR1NfUkVN
T1ZFX3NldHVwLXg4Nl8kKEJJVFMpLm8gICAgICArPSAtV2EsLWdkd2FyZi0yCj4gLUFGTEFHU19S
RU1PVkVfZW50cnk2NC5vICAgICAgICAgICAgICAgICAgICAgICAgKz0gLVdhLC1nZHdhcmYtMgo+
ICthc2ZsYWdzLXJlbW92ZS15ICAgICAgICAgICAgICAgKz0gJChmb3JlYWNoIHgsIC1nIC1nZHdh
cmYtNCAtZ2R3YXJmLTUsICQoeCkgLVdhLCQoeCkpCj4KPiAgJChvYmopL3B1cmdhdG9yeS5ybzog
JChQVVJHQVRPUllfT0JKUykgRk9SQ0UKPiAgICAgICAgICAgICAgICAgJChjYWxsIGlmX2NoYW5n
ZWQsbGQpCj4KPiBiYXNlLWNvbW1pdDogZGE4ZTdkYTExZTRiYTc1OGNhZjRjMTQ5Y2M4ZDhjZDU1
NWFlZmU1Zgo+IC0tCj4gMi4zNy4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFk
YQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
