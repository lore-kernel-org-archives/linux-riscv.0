Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E09C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:10:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CCB8206DD
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 12:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nE0cjJZB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ZVP5o8ty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CCB8206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jXEd9AWwuh/7kM140buTYS82JiX7Yi+qETePlTAPlG0=; b=nE0cjJZBgtBzlstD2x8sEzGuX
	D+0uART2/xURR77boOBTu900X21uDEMzNMdU1EoMegjxXTl1vGWrnJ6zhJUB+y4gz/zUq1NhE0QrW
	TaX2u5MroeEuZ0r2AX0KV1fSVvChobLmd4Sq04YZ7mfa2V204YguItoN7VvXwXdd4Rm3sZgJzSYUr
	rNV2Ev5t//BfITck+nzLAPKfE9d0ioEpEYjOX3FzW+642kQqdmROvbIQzy3gLg1Sw3bj1+kaD9Kxl
	xVNHRsgtfSV4Rj9XpnuTrDyMiCjra3wUGn0E4E4FQBbIoYBH2SLmBiJNygkt/3gfxo865fyEKGPXl
	s78jelj0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jonBl-0006Ez-Ee; Fri, 26 Jun 2020 12:10:37 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomfb-0007Nz-SR
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 11:37:31 +0000
Received: by mail-qk1-x743.google.com with SMTP id e13so8407438qkg.5
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 04:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KhNwrVhpKGh/MU1ER7V9qrP+gwq9LmtfnjqWGjQuJSQ=;
 b=ZVP5o8tybngICFKLO34PvRaD3tE4qYZFzTeWRO/wF7YCM4Kg/qCZFxvxMv1qPOhlVN
 Hzt2KVPFnazJJYJCv/yQ7fxJrFXl0lSefw0glRt29LHRxQKSd2HGfkLqmhxOIgs7W6ua
 +Ivn2FrhOSqy6TkqBVv0Ai9unGlTKAS040eiruD7YduB7qFKVg5I+8RQhVSdbJdoR8Ha
 D4qGSvkbr4d63dKSGVXnLZs2VzbU1aF1VGWpZhwhGEQ2QAp9j8UgFbSIE3HBcpVwrN5h
 FRLLB6kdwbdArPsrGQdwfgNVnbX2iR3kte41nwzvr7/CVyjX3tqSxGtpdDswHOSJzd31
 /tTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KhNwrVhpKGh/MU1ER7V9qrP+gwq9LmtfnjqWGjQuJSQ=;
 b=Wi855aW3/A46Rm9LYY1ZsHpmvlzzWtWBHnsezR9bRnycn+FcJl1bZj9/9UJKFjfZUz
 5/MPMd99jixkKXQ1teTWorEQd6RiJ/cqliDckJ0+EOobd3//k/cq+iuYsmELgvKWWbgQ
 xxjduEb5dnMEgCKseBowjWsourLqOBIS386WNVUtHBYH0nv/PaYXuOfvfD/+Oa1JjnUx
 DBDavmVZ8xI8OxuNzMMe3uMW4sA/Y+7oMGqJpizw0F4rj/zLeCI/A6HivxUz0KCwKjZr
 KoSw51IUloQBQPbUcW5iCg2HXjMGvyyTv8bKJhUJEcs6+cTNJGCfmZflPhoFpd33pdCB
 XeAg==
X-Gm-Message-State: AOAM533UZcySexOJrJJrhsMpa19LOL8TkX3QUxZRktrEOGjYisAHqEUA
 0/YZJtu1GiMhjiLPrYGEGQ08LoXat2hD/3bNaPTJBLCBcLY=
X-Google-Smtp-Source: ABdhPJwq/MU2SYSaHgX6iItvrPyHfWaHV9GNsoBbpC4zoDf0XS6QwYjQLE/09iI+WM9QzsEtWsaqbUCjKXM3RmKxss0=
X-Received: by 2002:a05:620a:4ca:: with SMTP id
 10mr2234798qks.250.1593110767374; 
 Thu, 25 Jun 2020 11:46:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200625183941.23093-1-tklauser@distanz.ch>
In-Reply-To: <20200625183941.23093-1-tklauser@distanz.ch>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 25 Jun 2020 20:45:55 +0200
Message-ID: <CACT4Y+azxRtnEQO9tH8nqM_o8VJaTRAiQmQAYhTsrWmVWWhLGw@mail.gmail.com>
Subject: Re: [PATCH] riscv: enable kcov
To: Tobias Klauser <tklauser@distanz.ch>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjUsIDIwMjAgYXQgODozOSBQTSBUb2JpYXMgS2xhdXNlciA8dGtsYXVzZXJA
ZGlzdGFuei5jaD4gd3JvdGU6Cj4KPiBBZGQgQVJDSF9IQVNfS0NPViBhbmQgSEFWRV9HQ0NfUExV
R0lOUyB0byB0aGUgcmlzY3YgS2NvbmZpZy4KPiBBbHNvIGRpc2FibGUgaW5zdHJ1bWVudGF0aW9u
IG9mIHZkc28uCj4KPiBDYzogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgo+
IENjOiBEbWl0cnkgVnl1a292IDxkdnl1a292QGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
VG9iaWFzIEtsYXVzZXIgPHRrbGF1c2VyQGRpc3RhbnouY2g+CgoKSWYgaXQgYm9vdHM6CgpBY2tl
ZC1ieTogRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBnb29nbGUuY29tPgoKRldJVyBmb3IgeDg2IHdl
IG5lZWRlZCB0byBkbyBtdWNoIG1vcmUgb2YgdGhpczoKCiQgZmluZCBhcmNoL3g4Ni8gLW5hbWUg
TWFrZWZpbGUgLWV4ZWMgZ3JlcCBLQ09WX0lOU1RSVU1FTlQge30gXDsgLXByaW50CktDT1ZfSU5T
VFJVTUVOVCA6PSBuCmFyY2gveDg2L2tlcm5lbC9NYWtlZmlsZQpLQ09WX0lOU1RSVU1FTlQgOj0g
bgphcmNoL3g4Ni9rZXJuZWwvYXBpYy9NYWtlZmlsZQpLQ09WX0lOU1RSVU1FTlRfY29tbW9uLm8g
Oj0gbgpLQ09WX0lOU1RSVU1FTlRfcGVyZl9ldmVudC5vIDo9IG4KYXJjaC94ODYva2VybmVsL2Nw
dS9NYWtlZmlsZQpLQ09WX0lOU1RSVU1FTlQgOj0gbgphcmNoL3g4Ni9yZWFsbW9kZS9ybS9NYWtl
ZmlsZQpLQ09WX0lOU1RSVU1FTlQgOj0gbgphcmNoL3g4Ni9ib290L01ha2VmaWxlCktDT1ZfSU5T
VFJVTUVOVCA6PSBuCmFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9NYWtlZmlsZQpLQ09WX0lOU1RS
VU1FTlQgOj0gbgphcmNoL3g4Ni9lbnRyeS9NYWtlZmlsZQpLQ09WX0lOU1RSVU1FTlQgOj0gbgph
cmNoL3g4Ni9lbnRyeS92ZHNvL01ha2VmaWxlCktDT1ZfSU5TVFJVTUVOVCAgICAgICAgICAgICAg
ICA6PSBuCmFyY2gveDg2L3VtL3Zkc28vTWFrZWZpbGUKS0NPVl9JTlNUUlVNRU5UX2RlbGF5Lm8g
Oj0gbgpLQ09WX0lOU1RSVU1FTlRfY21kbGluZS5vIDo9IG4KYXJjaC94ODYvbGliL01ha2VmaWxl
CktDT1ZfSU5TVFJVTUVOVF90bGIubyA6PSBuCktDT1ZfSU5TVFJVTUVOVF9tZW1fZW5jcnlwdC5v
IDo9IG4KS0NPVl9JTlNUUlVNRU5UX21lbV9lbmNyeXB0X2lkZW50aXR5Lm8gOj0gbgphcmNoL3g4
Ni9tbS9NYWtlZmlsZQpLQ09WX0lOU1RSVU1FTlQgOj0gbgphcmNoL3g4Ni9wdXJnYXRvcnkvTWFr
ZWZpbGUKCgoKCj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAyICsr
Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgfCAxICsKPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcg
Yi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCAwODkyOTNlNGFkNDYuLmE3ZDdmODE4NGYxNSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25m
aWcKPiBAQCAtMTksNiArMTksNyBAQCBjb25maWcgUklTQ1YKPiAgICAgICAgIHNlbGVjdCBBUkNI
X0hBU19ERUJVR19XWAo+ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEwK
PiAgICAgICAgIHNlbGVjdCBBUkNIX0hBU19HSUdBTlRJQ19QQUdFCj4gKyAgICAgICBzZWxlY3Qg
QVJDSF9IQVNfS0NPVgo+ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX01NSU9XQgo+ICAgICAgICAg
c2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFMCj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfU0VU
X0RJUkVDVF9NQVAKPiBAQCAtNTcsNiArNTgsNyBAQCBjb25maWcgUklTQ1YKPiAgICAgICAgIHNl
bGVjdCBIQVZFX0RNQV9DT05USUdVT1VTIGlmIE1NVQo+ICAgICAgICAgc2VsZWN0IEhBVkVfRUJQ
Rl9KSVQgaWYgTU1VCj4gICAgICAgICBzZWxlY3QgSEFWRV9GVVRFWF9DTVBYQ0hHIGlmIEZVVEVY
Cj4gKyAgICAgICBzZWxlY3QgSEFWRV9HQ0NfUExVR0lOUwo+ICAgICAgICAgc2VsZWN0IEhBVkVf
R0VORVJJQ19WRFNPIGlmIE1NVSAmJiA2NEJJVAo+ICAgICAgICAgc2VsZWN0IEhBVkVfUENJCj4g
ICAgICAgICBzZWxlY3QgSEFWRV9QRVJGX0VWRU5UUwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZQo+
IGluZGV4IDM4YmE1NWIwZWI5ZC4uOWRlYmJhYWIzOTNkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01h
a2VmaWxlCj4gQEAgLTI5LDYgKzI5LDcgQEAgQ1BQRkxBR1NfdmRzby5sZHMgKz0gLVAgLUMgLVUk
KEFSQ0gpCj4KPiAgIyBEaXNhYmxlIGdjb3YgcHJvZmlsaW5nIGZvciBWRFNPIGNvZGUKPiAgR0NP
Vl9QUk9GSUxFIDo9IG4KPiArS0NPVl9JTlNUUlVNRU5UIDo9IG4KPgo+ICAjIEZvcmNlIGRlcGVu
ZGVuY3kKPiAgJChvYmopL3Zkc28ubzogJChvYmopL3Zkc28uc28KPiAtLQo+IDIuMjcuMAo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
