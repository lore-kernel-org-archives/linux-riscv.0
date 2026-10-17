Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9EFCCF2C7
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 14:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SAk1s3ewJhNWxaRjQ88HPEhgzC+bobpJP5fxdMsgObk=; b=saTpgvKHnCc/k9
	LuzxbQQQTlw7vAhSAfScUGq50RwgF55hMkvtHZZ/Gy+yEWpgc8+j1A08KwD6sbMvoaEQ37lpQG/cc
	GSYzvdwelrVEcUuehRCQLN312nMv1vQF4WVF17Ub/lXbJCYLH2q+shHXBXBsbZ27CgV+vsbbxLl3+
	UG14J6FqXzlzp5NQy8w8rOKjWu8Gp5sWROUFf5kbp7FDUur4BEvDTO1pOOIDtTf47odcpiTUoMvv9
	llr8+GYocJF4zW/0qQCHEb4SH7o+h47UqXXDUeYJxLsWN0jVbqoUetM+XNC0FH0cL2vZ0Saj/PPeq
	OrQgBpWu18qp0FEkVhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI50w-00000004oMh-0mM9;
	Sat, 17 Oct 2026 14:03:58 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI50t-00000004oMH-1HRX
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 14:03:56 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5be3ea5a7adso687345e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 07:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792245833; cv=none;
        d=google.com; s=arc-20260327;
        b=NL3QtSRC3aCEZpoLbp/uBh6O8TBKZztR1pZd5CJNml2m03fPSzLpPTcupyj9Fbug5/
         LA/kBmnlwznfSjecvtLzBtq/zuY6g0E4QQ1EskDg5zrU6Vuhh3Z7Ic8Qs4OOyWpDXoX/
         unltvKc6VpT75RR8AYMn7glg+E40kQl1MCGU8vJf12qNXI5plp8fCcmwnk1PXTe8NWNU
         GlCwphNu8H/1YpldgMmVzPhIO3xHy9ulEMDrN5AYPNfKf9Y/wkGf2d2rlEFuifzVl1FS
         CuWnI10B4tjxI1auhyR/RyFRfZ52qxJWTD+ykiCFdWJF5KTxOXQG2vQU3blm+YXwsJ9w
         +zwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+OsE2x5Pqitm8v/Z0qp1dkwtBd3ch11zvLF7iHqatxI=;
        fh=Ui8DTZlwNgaOJnoSSzOYTYKnYVXai8ELTqmgkPuM9ak=;
        b=FfPVgoliE09Bfk1f9oEEfoBi25nIVpkS0xlomW93j2bX9wvy0SI1gmKw9JZLjurC9f
         NmO6smsFamcviOVeqG1vI1E/BCDsyn++NiDfM4xaJkPboUh/fhSk3IeXg9VnmNyf5dsY
         sdmluUiE8aZA+gPHbMqdqWbBd36hIb8xAsTLpvllqBJdIQHfCswhQavW4OFmbU0e/OWp
         vyOkqJy9daIwfffpbnUYueciEWaIn/xFvyYJLbxmqSxYGoNfvn+VZm8Zr+oYmXappkDw
         gwNTv8znU5B/FKjnDuv9skFkggDXW0C7sf9JH2pMSlRYaD6/bOchrs4+BQqkwLdTw9yy
         Akbg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792245833; x=1792850633; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+OsE2x5Pqitm8v/Z0qp1dkwtBd3ch11zvLF7iHqatxI=;
        b=fG0NCvBOnB++H1YOmdbeWhQ8FoK3cBJ0umRrYroLEqYdPD89Rx9ReRjzuHKAIsLlPF
         bcQzNe0os+T0y2aUqMZMw41clUptW3IOa/Jy62nPJ8SrlNZCepDcSOV8laipNe6rUJDU
         2scCflA1vDWYaxsQO1O6xDNsjl76QqxAcso6iBHtfr8yTJpG7fTVz7+iHdDkb7YdnLfd
         nQgl1xxRVgkw2DsivZSQHe8EaWI8E5s5wc6C2me2lbNmDGf0EmUNOJJf0IJd00pWGB+T
         vlxKqIdz/FARza9Vu0gX/YKhrAto5O/k2WKIpWgYE0mW5fGJYB3nfRbneK4CmC3yObvs
         Rc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792245833; x=1792850633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OsE2x5Pqitm8v/Z0qp1dkwtBd3ch11zvLF7iHqatxI=;
        b=D/7jntpY5IhduaR2MVu/+nEaF3zpHwXnxNlV90+1PAvrj2nFY9U3JFpsPm8Gw1KPHg
         hCXmy/5BJ1sRj/FoKTS+l82VvUuBo1H5LVa5MgdTYQNy5nOR8ECbj8e31tLTaGSsZ5JM
         3blju89PQJ48gQNeeWP/wsZiHq4XfqZpd8fIsrQEDCTd+kle3XJGppkz73b2CZzoFz0c
         oeJBKzhVG2cqvnB8iU1zXc/nmBbnJZ5PZYrTmIsu1x7PdtMtLfiElGWStIg4s5g2P8JP
         oOqUKTvPQxzJUpIz9ynpYoJd3BjmgKCaL1yVpF+r53AcxN77bmckfe98B2jWPogUWAfu
         O5tg==
X-Forwarded-Encrypted: i=1; AKwUvBxNrazcvRKCM68iY9dc33fJ2Ut2AgmcXrKw92tlG6AP32lrJLWpI6sox1zPRoblp/ArAXkQKONdgyRKKA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJQTtABSyXHGqMIol4yS93uacOdk+Y8VsoY0ES8LliLtf/dNV24
	Q9ELeKP3uv1maHS0SEO/7ocRHy5NlyrOsF9uQ6NMStoKN33Rxk5Zn0eezR4LUh/RwMBZxpD3yaF
	tKyVWnaqTboK2SxGBBTAHLuFn92fWPYU=
X-Gm-Gg: AYBFou3gC+qQucJAIvMqNiAXdViiXj3Jotfook7NlVfKavYj0/CoWtPNo8i10DiOOcJ
	yLKTomlcYhqO2vdgbpnQQR4e4WAPrZ8L6QYfI+SjLVDIDcH0eE2pLiEV+CH+8CnwaRqxRxl6QJh
	zPpNgGZ/qzexAJkf3B6dYet10aWfnN9wsYs00PKN82I4HuwBirqXFBPkOQ7C3xe+/0OXccODCXq
	6wfGj9Onw3PU4vzLpysKldL9Sd1wuTqVO+5dDEk2Mn77tjhQc0AEr7A5i16l2BHrBp38YJpxftj
	0UB9Z50jdlMb0od1G6DHSyAT/zemkx+DS7aWQbwSvKk7ZY7L9YDxJxgDmGQntB9avw==
X-Received: by 2002:a05:6512:3c89:b0:5bb:42a2:31fa with SMTP id
 2adb3069b0e04-5be50a7efcdmr899502e87.60.1792245832854; Sat, 17 Oct 2026
 07:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail.com> <20261016103846.73ff2980@gandalf.local.home>
In-Reply-To: <20261016103846.73ff2980@gandalf.local.home>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sat, 17 Oct 2026 16:03:39 +0200
X-Gm-Features: AclHuK-r_eYg3gupJbYI7DWak9c5eTY2IipHa3Ysz4nKK_X5lXKKwE8MhWngSzk
Message-ID: <CALsPMBMeXHd1TN89bHCtS3G0M8MFiimf8w=qKayxuYCad8v_Gw@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: mm: Trace TLB flush requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_070355_715806_F819E6B1 
X-CRM114-Status: GOOD (  13.41  )
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

T24gRnJpLCBPY3QgMTYsIDIwMjYgYXQgNDozOOKAr1BNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+Cj4gWwo+ICAgSSByZWFsaXplZCBJIHJlcGxpZWQgdG8g
djIgYW5kIG5vdCB2NCBhcyB0aGUgdGhyZWFkIG9mIHYyIHB1c2hlZCB0aGF0IHRvCj4gICB0aGUg
dG9wLiBJJ2xsIHJlcGVhdCBteSBzdGF0ZW1lbnQgaGVyZSB0b28uCj4gXQo+Cj4gT24gVGh1LCAx
NSBPY3QgMjAyNiAxOTozMjozNCArMDIwMAo+IFJvbWFuICdIZWRpbicgU3Rvcm96aGVua28gPHJv
bWV1c21laXN0ZXJAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
dHJhY2UvZXZlbnRzL3Jpc2N2X3RsYi5oIGIvaW5jbHVkZS90cmFjZS9ldmVudHMvcmlzY3ZfdGxi
LmgKPgo+IFBsZWFzZSBkbyBub3QgcHV0IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBldmVudHMgaW4g
aW5jbHVkZS90cmFjZS4KPgo+IFRoZXkgYmVsb25nIGluIHRoZSBhcmNoaXRlY3R1cmUuCj4KPiBT
ZWUgdGhlIGV4YW1wbGUgY29kZSBpbiBzYW1wbGVzL3RyYWNlX2V2ZW50cy90cmFjZS1ldmVudHMt
c2FtcGxlLltjaF0KPiBhcyB3ZWxsIGFzIHRoZSBNYWtlZmlsZSB0aGVyZSBvbiBob3cgdG8gcHV0
IHRyYWNlIGV2ZW50cyBpbiBkaXJlY3Rvcmllcwo+IG91dHNpZGUgb2YgaW5jbHVkZS90cmFjZS8K
Pgo+IFRoYW5rcywKPgo+IC0tIFN0ZXZlCj4KCkhpIFN0ZXZlLAoKVGhhbmtzIGZvciB0aGUgcmV2
aWV3LgoKSSd2ZSBtb3ZlZCB0aGUgdHJhY2UgZXZlbnQgZGVmaW5pdGlvbiB0bwphcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Jpc2N2X3RsYi5oIGluIHY1LCBmb2xsb3dpbmcgdGhlIGV4aXN0aW5nClJJ
U0MtViB0cmFjZXBvaW50IGNvbnZlbnRpb24uCgpUaGUgdXBkYXRlZCBwYXRjaCBpcyBhdmFpbGFi
bGUgaGVyZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjEwMTctdGxi
X3RyYWNlcG9pbnQtdjUtMS0yNTZmYjUzOTNhN2ZAZ21haWwuY29tLwoKVGhhbmtzIGZvciBwb2lu
dGluZyB0aGlzIG91dC4KLS0gCktpbmQgcmVnYXJkcywKUm9tYW4gJ0hlZGluJyBTdG9yb3poZW5r
bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
