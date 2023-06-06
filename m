Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB96C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 03:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EI5pQiyriEqmIhIBvY+H4Zw68cpb5hsbaZ06ZAaKR0o=; b=OpoSISAGwRP5uE
	QMMzHIIC/iUk5IwRjcv5S08SQQARg6SBTfS03UBa2xWoJc9FTEl3P83TRGZbZDA9/XlCVrR6/qkBg
	GWDOQiTSnrzDCA6V+UnAYvP0XOjjH6m2gSQlH4RsTnc0LjyWUuTLKacfoUpPKlHwFllh0xQKwksIr
	d5xhglNBLpMCD5O15rivtWFw/MxEVLN0JxENjFYfMi3HVofGeGXkbK+E7zNLuX9wGbzGn5Za0UOON
	j/VM13boP/JVdnutiY1JRvJ5KFOiI/tBkkDTl9sEpaLvJmtEnXv9CiqXn1+kaVtVEBumD4WkAnTct
	/dIftpSxAvzJvuQ8mFWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NUO-00Haui-2H;
	Tue, 06 Jun 2023 03:36:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NUM-00HatT-0i
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 03:36:07 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-977ed383b8aso158180866b.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 20:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1686022564; x=1688614564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUqX+2D4UADNAnE5VNi8IzDCC2+p85PEOTxe1Lq/hFU=;
        b=KeCTaUaqyvYUgcGh9Zm0Hm3vuyjwteBFSzc8aIBwTCTdoQSK04Ly+jmYankF2BOZot
         Qb0gPYFa8cQIxLpFAefSHAW1sLi0hW6LLWjBnjLMXm7kDVFNb/MA8BZ9Gl+sTuWis6+O
         Satqe7rRHKU7cAP1EFJdrJVkRk5yZgPUAcJ7kHZZAqCJa2tznpdlq696xo8tMKyI0iby
         pQpYEeW3AvjOjizZ3GKQAPzj4OQl1EvqNOtfwb6efQ+K0EsIfj/DVhzqgnR/SIiybjt9
         CMjWoxfizEYsNGxQy4mv3gJmnUezliQLHcpPPhtzPl/BVpXvP6pG9H/LCyw9xs8AA6Zq
         cczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686022564; x=1688614564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUqX+2D4UADNAnE5VNi8IzDCC2+p85PEOTxe1Lq/hFU=;
        b=PauAuRRDY0pqF9i7pq+ygeBEg9oFAe1UEYiqXniI9XhGCXqbRXxCbvVEh6tpmeWWE8
         FLlPtKDtspXTttjVl5kx2zfkV35pMUb/h0iV8rf/9w5/OyRG45tig6vJI+s/d0aOScAf
         PwNM7Wv5cP+JVTEW9cLrI8QQBzzzYIqVo0qgvlm6x85PX5LZpZD7RYKlMkwT9lQ4Z+WS
         25XndtWMJsLuOBKdc5Cx7WJOzOZK2hgxiGE9Ex4JjnkE3D5o/287KnGLp/tGciacuuwa
         gRaPuT4OhIbpZge4mTzCwMKFzuy7Uf6qmICPAsXwSEYSYLnHe4QpVIgjasemvEkSWCyc
         Btgg==
X-Gm-Message-State: AC+VfDx+ulTjnc91DRgZ31ggcJKs5oGYXO/g6R3qLAjBvrGq1w1L3JTd
	q3f55NgefImmdOOZzg/egxuZB6GxkUC1KGYfmovK8E91I+eGYrKw
X-Google-Smtp-Source: ACHHUZ7TIEuHBGm5angfypxdJbD4jmGVMdTZAY/Haceb/BUnC4lLnOQ4gKuBq3EcGpS4bRQVFHPBAfZrv5JJxSHXzLI=
X-Received: by 2002:a17:907:9404:b0:977:cdd6:6a5c with SMTP id
 dk4-20020a170907940400b00977cdd66a5cmr651234ejc.10.1686022564445; Mon, 05 Jun
 2023 20:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230520150116.7451-1-waylingII@gmail.com>
In-Reply-To: <20230520150116.7451-1-waylingII@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jun 2023 09:05:53 +0530
Message-ID: <CAAhSdy1H7MWLRCct=Q_Sa=g+MfcFCU7OVAFaL0tQyMDp6GT8DQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Redirect AMO load/store misaligned traps to guest
To: wchen <waylingii@gmail.com>
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_203606_257540_4DE575AA 
X-CRM114-Status: GOOD (  16.70  )
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

T24gU2F0LCBNYXkgMjAsIDIwMjMgYXQgODozMeKAr1BNIHdjaGVuIDx3YXlsaW5naWlAZ21haWwu
Y29tPiB3cm90ZToKPgo+IFRoZSBNLW1vZGUgcmVkaXJlY3RzIGFuIHVuaGFuZGxlZCBtaXNhbGln
bmVkIHRyYXAgYmFjawo+IHRvIFMtbW9kZSB3aGVuIG5vdCBkZWxlZ2F0aW5nIGl0IHRvIFZTLW1v
ZGUoaGVkZWxlZykuCj4gSG93ZXZlciwgS1ZNIHJ1bm5pbmcgaW4gSFMtbW9kZSB0ZXJtaW5hdGVz
IHRoZSBWUy1tb2RlCj4gc29mdHdhcmUgd2hlbiBiYWNrIGZyb20gTS1tb2RlLgo+IFRoZSBLVk0g
c2hvdWxkIHJlZGlyZWN0IHRoZSB0cmFwIGJhY2sgdG8gVlMtbW9kZSwgYW5kCj4gbGV0IFZTLW1v
ZGUgdHJhcCBoYW5kbGVyIGRlY2lkZSB0aGUgbmV4dCBzdGVwLgo+IEhlcmUgaXMgYSB3YXkgdG8g
aGFuZGxlIG1pc2FsaWduZWQgdHJhcHMgaW4gS1ZNLAo+IG5vdCBvbmx5IGRpcmVjdGluZyB0aGVt
IHRvIFZTLW1vZGUgb3IgdGVybWluYXRlIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogd2NoZW4gPHdh
eWxpbmdJSUBnbWFpbC5jb20+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgNi41CgpUaGFua3MsCkFu
dXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggfCAyICsrCj4gIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfZXhpdC5jICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiBpbmRleCBiNmFjYjdlZDEuLjkxNzgxNGEw
ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+IEBAIC04Miw3ICs4Miw5IEBACj4gICNkZWZpbmUg
RVhDX0lOU1RfQUNDRVNTICAgICAgICAgICAgICAgIDEKPiAgI2RlZmluZSBFWENfSU5TVF9JTExF
R0FMICAgICAgIDIKPiAgI2RlZmluZSBFWENfQlJFQUtQT0lOVCAgICAgICAgIDMKPiArI2RlZmlu
ZSBFWENfTE9BRF9NSVNBTElHTkVEICAgIDQKPiAgI2RlZmluZSBFWENfTE9BRF9BQ0NFU1MgICAg
ICAgICAgICAgICAgNQo+ICsjZGVmaW5lIEVYQ19TVE9SRV9NSVNBTElHTkVEICAgNgo+ICAjZGVm
aW5lIEVYQ19TVE9SRV9BQ0NFU1MgICAgICAgNwo+ICAjZGVmaW5lIEVYQ19TWVNDQUxMICAgICAg
ICAgICAgOAo+ICAjZGVmaW5lIEVYQ19IWVBFUlZJU09SX1NZU0NBTEwgOQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5j
Cj4gaW5kZXggNGVhMTAxYTczLi4yNDE1NzIyYzAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV9leGl0LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IEBAIC0x
ODMsNiArMTgzLDggQEAgaW50IGt2bV9yaXNjdl92Y3B1X2V4aXQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ICAgICAgICAgcnVuLT5leGl0X3JlYXNvbiA9IEtW
TV9FWElUX1VOS05PV047Cj4gICAgICAgICBzd2l0Y2ggKHRyYXAtPnNjYXVzZSkgewo+ICAgICAg
ICAgY2FzZSBFWENfSU5TVF9JTExFR0FMOgo+ICsgICAgICAgY2FzZSBFWENfTE9BRF9NSVNBTElH
TkVEOgo+ICsgICAgICAgY2FzZSBFWENfU1RPUkVfTUlTQUxJR05FRDoKPiAgICAgICAgICAgICAg
ICAgaWYgKHZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dC5oc3RhdHVzICYgSFNUQVRVU19TUFYpIHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV90cmFwX3JlZGlyZWN0KHZj
cHUsIHRyYXApOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IDE7Cj4gLS0KPiAyLjM0
LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
