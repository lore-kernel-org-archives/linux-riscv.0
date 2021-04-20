Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC58C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:21:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 771A06135F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 15:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 771A06135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KEVcupsTMLRmj1vy0aWJJzk432aaGpyhDmOfDXU9C4A=; b=AD9O8j3Lk7Xtl8gOghHEacjkM
	QZ7+QM9bsg92UCX1RXEURtmZ0KMFFNxik7xN9aFpVNcw95ENtQh1Z9vJbEXdCFKwPrRSX7nIsEX5r
	Y39THImOCFoYuNHcveC36tIuhNjj5G+LZB0725nBsLUOgq8RG4ETm8j9NriMymebC5G158dTF1EAq
	U3ImVU0LGcw3kkykoYnl7JZP3nukL+ue7E8KAIPRlwX4wk7tAkD8OqFas37IHvqWzCUn1Rjxh/fc4
	QNfOvVI0Il1/YVvTQBq6f4lWbbEHrRVeEIs2nuyekva/vG7HPOOm7kjv8/FWpsiLh8Lp7h8ab09Qi
	PJfkwRxbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYsBq-00CSmu-1O; Tue, 20 Apr 2021 15:21:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsBl-00CSmT-Sj
 for linux-riscv@desiato.infradead.org; Tue, 20 Apr 2021 15:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=IubIvA+FZc+EgYaLla1wNxM0Nrtj3DHof/IpDLSwAko=; b=RJm40ZWQ3w1sM338hUZxkw63at
 ZY9ffd7B1F+yXAzyjULIF8uFBC8EESa0Y7AADH4Ok1mKlQdfXoLrLv5vY/APGoFS0ArXrkvKt2wnz
 BTRvC7bkFcPlv/M5HfNESmS+gU8wdTaiI1Xe9NAnF+TgBQOPICOpB8Me5ZSIzL4NL2ydn9gFgcpyD
 fH4YC9/yg9QQ30Bj1J1QrzZ/jYdcBb7ORW54BDr2BnNBnPiHFGxrwufGGF+LmtBGxNdNZmg2M+jI4
 6NWzDYW2bdOiavoAzizAuVHWy5WGdPvPBXFtXxAhqS6sXIqQ+lUpC4CrqKq+MyJqxcB1ftcaI9Qru
 NKa7tkGg==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYsBg-00CELW-4D
 for linux-riscv@lists.infradead.org; Tue, 20 Apr 2021 15:21:20 +0000
Received: by mail-pg1-x534.google.com with SMTP id y32so26846889pga.11
 for <linux-riscv@lists.infradead.org>; Tue, 20 Apr 2021 08:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IubIvA+FZc+EgYaLla1wNxM0Nrtj3DHof/IpDLSwAko=;
 b=I4yP89FRP5i2uxVxl6i5lyAw3mredKc46Hjeoi7O9yUplQ1n0j3Y0o1SaATIVNfyq4
 teur2VlRjebXnJrXtmJM5UKcyINF7y9nt7eJ4h2Nj9VKcW4SDr7ASpYqevicADvLjSpZ
 BcdUWRI28kdfl/QTUrSbHWrX4bxcKg5kigsvPFmraKk01TgCjRpIdrWz8rCxHFi/mdal
 s4BKA5FrT8bg+QmBXI5iysCGKPMPo2xeM4LNJb3Mzab1E/x16D7j6SnHvvknf4k5KLD+
 UqDskbF3E4p7if1FPMyCFMP8IPbcI/hh0NmL9fW95RDqIIZlVko2His34l8P33AB9Kyv
 EjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IubIvA+FZc+EgYaLla1wNxM0Nrtj3DHof/IpDLSwAko=;
 b=dTBcau4nULJWS47z7cQYBW+lkBFY1ZW0RSqrXnaj+KBqgnufIuW4sN8kCJs094a0nt
 UlFlGGgWy8AWsGlBYSFq6doFoqeA5FM3zhyCs9WV2e1vZYAsze4jOhDp1RGDLVWKnP9e
 LLSFZegaArig/3HwexRhJHe3TddRlIJPYChcPwYPOOpr/DbYr+Bnhcy3l3s01TsvSJ5S
 mqrQf/plPB2b0KFj6+0oaAvyNok1hc0q5CAw4e4/Xo5KTR9+3SmB0SSFvlZ2KxUddPcM
 rWWTYBx0agrxO5o9l0pPIb/egn3ynKlB/YluYbCGovbOFzwzEBG2aiLGPGINcmzIEuEU
 5k2g==
X-Gm-Message-State: AOAM531e/BaXXxYOns3n6PXY9eOtUhR64eb8TGlLoE5ijyGaAmaYCzzk
 j0shphJL9NPJPp1bUj4EY3JY8zJehFtOM+huSkg=
X-Google-Smtp-Source: ABdhPJzGghpoDCwO9kK2QCglkrPkmiAPcjJ3yQECzehAQ/Rh2Lt07/rbOaMl18l4ndllh1JWFu8ageLFbFdjGhXx2wQ=
X-Received: by 2002:a62:ed0f:0:b029:257:7278:e72b with SMTP id
 u15-20020a62ed0f0000b02902577278e72bmr24791289pfh.17.1618932074554; Tue, 20
 Apr 2021 08:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <1618925829-90071-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1618925829-90071-1-git-send-email-guoren@kernel.org>
From: Greentime Hu <green.hu@gmail.com>
Date: Tue, 20 Apr 2021 23:20:37 +0800
Message-ID: <CAEbi=3fdKep_szy3jNYZrDr847avKYTHOQyNoUm5vy5ijv7Z0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] nds32: Cleanup deprecated function strlen_user
To: Guo Ren <guoren@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_082116_209498_795D4CFA 
X-CRM114-Status: GOOD (  14.56  )
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

PGd1b3JlbkBrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDTmnIgyMOaXpSDpgLHkuowg5LiL5Y2IOToz
OOWvq+mBk++8mgo+Cj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
Cj4gJCBncmVwIHN0cmxlbl91c2VyICogLXIKPiBhcmNoL2Nza3kvaW5jbHVkZS9hc20vdWFjY2Vz
cy5oOiNkZWZpbmUgc3RybGVuX3VzZXIoc3RyKSBzdHJubGVuX3VzZXIoc3RyLCAzMjc2NykKPiBh
cmNoL2Nza3kvbGliL3VzZXJjb3B5LmM6ICogc3RybGVuX3VzZXI6IC0gR2V0IHRoZSBzaXplIG9m
IGEgc3RyaW5nIGluIHVzZXIgc3BhY2UuCj4gYXJjaC9pYTY0L2xpYi9zdHJsZW4uUzogLy8gUGxl
YXNlIG5vdGUgdGhhdCBpbiB0aGUgY2FzZSBvZiBzdHJsZW4oKSBhcyBvcHBvc2VkIHRvIHN0cmxl
bl91c2VyKCkKPiBhcmNoL21pcHMvbGliL3N0cm5sZW5fdXNlci5TOiAqICBtYWtlIHN0cmxlbl91
c2VyIGFuZCBzdHJubGVuX3VzZXIgYWNjZXNzIHRoZSBmaXJzdCBmZXcgS1NFRzAKPiBhcmNoL25k
czMyL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaDpleHRlcm4gX19tdXN0X2NoZWNrIGxvbmcgc3RybGVu
X3VzZXIoY29uc3QgY2hhciBfX3VzZXIgKiBzdHIpOwo+IGFyY2gvbmlvczIvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oOmV4dGVybiBfX211c3RfY2hlY2sgbG9uZyBzdHJsZW5fdXNlcihjb25zdCBjaGFy
IF9fdXNlciAqc3RyKTsKPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaDpleHRlcm4g
bG9uZyBfX211c3RfY2hlY2sgc3RybGVuX3VzZXIoY29uc3QgY2hhciBfX3VzZXIgKnN0cik7Cj4g
a2VybmVsL3RyYWNlL3RyYWNlX3Byb2JlX3RtcGwuaDpzdGF0aWMgbm9rcHJvYmVfaW5saW5lIGlu
dCBmZXRjaF9zdG9yZV9zdHJsZW5fdXNlcih1bnNpZ25lZCBsb25nIGFkZHIpOwo+IGtlcm5lbC90
cmFjZS90cmFjZV9wcm9iZV90bXBsLmg6ICAgICAgICAgICAgICAgICAgICAgICAgcmV0ICs9IGZl
dGNoX3N0b3JlX3N0cmxlbl91c2VyKHZhbCArIGNvZGUtPm9mZnNldCk7Cj4ga2VybmVsL3RyYWNl
L3RyYWNlX3Vwcm9iZS5jOmZldGNoX3N0b3JlX3N0cmxlbl91c2VyKHVuc2lnbmVkIGxvbmcgYWRk
cikKPiBrZXJuZWwvdHJhY2UvdHJhY2Vfa3Byb2JlLmM6ZmV0Y2hfc3RvcmVfc3RybGVuX3VzZXIo
dW5zaWduZWQgbG9uZyBhZGRyKQo+IGtlcm5lbC90cmFjZS90cmFjZV9rcHJvYmUuYzogICAgICAg
ICAgICByZXR1cm4gZmV0Y2hfc3RvcmVfc3RybGVuX3VzZXIoYWRkcik7Cj4KPiBTZWUgZ3JlcCBy
ZXN1bHQsIG5vYm9keSB1c2VzIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgo+IENjOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+
IC0tLQo+ICBhcmNoL25kczMyL2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDEgLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvbmRzMzIvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oIGIvYXJjaC9uZHMzMi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRl
eCAwMTBiYTVmLi5kNGNiZjA2IDEwMDY0NAo+IC0tLSBhL2FyY2gvbmRzMzIvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oCj4gKysrIGIvYXJjaC9uZHMzMi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBAQCAt
MjYwLDcgKzI2MCw2IEBAIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4KPiAgZXh0ZXJuIHVuc2lnbmVk
IGxvbmcgX19hcmNoX2NsZWFyX3VzZXIodm9pZCBfX3VzZXIgKiBhZGRyLCB1bnNpZ25lZCBsb25n
IG4pOwo+ICBleHRlcm4gbG9uZyBzdHJuY3B5X2Zyb21fdXNlcihjaGFyICpkZXN0LCBjb25zdCBj
aGFyIF9fdXNlciAqIHNyYywgbG9uZyBjb3VudCk7Cj4gLWV4dGVybiBfX211c3RfY2hlY2sgbG9u
ZyBzdHJsZW5fdXNlcihjb25zdCBjaGFyIF9fdXNlciAqIHN0cik7Cj4gIGV4dGVybiBfX211c3Rf
Y2hlY2sgbG9uZyBzdHJubGVuX3VzZXIoY29uc3QgY2hhciBfX3VzZXIgKiBzdHIsIGxvbmcgbik7
Cj4gIGV4dGVybiB1bnNpZ25lZCBsb25nIF9fYXJjaF9jb3B5X2Zyb21fdXNlcih2b2lkICp0bywg
Y29uc3Qgdm9pZCBfX3VzZXIgKiBmcm9tLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBuKTsKClRoYW5rIHlvdSwgR3VvLgpBY2tlZC1i
eTogR3JlZW50aW1lIEh1IDxncmVlbi5odUBnbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
