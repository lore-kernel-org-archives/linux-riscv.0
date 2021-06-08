Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05C2C47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 15:15:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9044061285
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 15:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9044061285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G458sd+1+BhgUIHSfpYjMwRj+kqS9m0aIv0zbOt/tiE=; b=LiAvsDWKHllyzv
	RzGtd9IsVadbaNCruFI+bxKiKsuUMV0ZExdSOHb80Zk6enBXSGDHxg+VgycPBzlND87zbTlhPfaZu
	SDshiiRH4hI2thY+FaXdUJxEKwh+BY0lq6E5daMF6HCWJwtYzze2XbP5o7OQlEMJiwVPddNUDm94/
	Z3Ct2LcBBFu9femlG5UBdjhRYrrSnb4HEDK4catYVj4GtATC0J9gSkTzBjHEn1JsBN1BccXbo/99h
	JMIKV0/yEN5TvxHWKScue8a76ZcQXlWNXhoE8/FZQlFWAYxTqXf2OdEg5Odwz5KSv+PsW80atB8RZ
	n5LBEf9U+iCnyhsEP6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqdRs-0098NC-Pb; Tue, 08 Jun 2021 15:15:24 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqdRq-0098Kr-3d; Tue, 08 Jun 2021 15:15:23 +0000
Received: by mail-vk1-f182.google.com with SMTP id l7so235008vkk.2;
 Tue, 08 Jun 2021 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O1gHl02oivo3RqMJKlwA/A5dzOE7PgpnMHshZI9Ylrs=;
 b=q/pGziiOz9jkwf1xpb1EEOjAPz/8OP9lR8P5rwugXRCKdIw+1wS1ArDWbo56DTgYcO
 2xIIfHxWOdAkxjck+U0UFvbyJXLOxqC0e39gdVGuoyznrtl6Kqsbm0vXEM9F9Ph6UxlB
 rR5msRf1tYIkQmYvAoVpDNmbWTNV7I44HNDPmtNDKlNk0+jSHN0zTfRpSQal7ClgWNKL
 nt58hzE/ILIPgRy01To/yIbhd4Nn1FvYEU+6H+m4XZ6Yl5ZdcJKv99WcwWeAt69su8a1
 jHh7JWQyepBhzoAemaPXbFi97EGcaWlnBbUsAZgHFnVI4KURGRzpgTzD9HaiwUKNr0lJ
 8aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O1gHl02oivo3RqMJKlwA/A5dzOE7PgpnMHshZI9Ylrs=;
 b=GdDXmzIqU53l3wle7ttlJ2vobrRw4NfdXFnWXq8hACJzvlEr4tadXTiLZNMONYIGFd
 px92kHDNxazegE+iuCFVLdDMmTZPJygsW79HuntVkQH446kF7uJNArLStWZeMEe9clTm
 DmxNuzbwNPs6bPyvl2brS3W0OBZ5u5HJqFqDgJCPgFynWnGkMLjaIbazqxgRgUueFyn0
 xo98D5XjSQmVTFpyaBQ55IRzuWtmztAMPU5NIc6EEhniGcL/jWoQIlAItoObBukfjTE/
 WVtLBYS54Zc2Ls8h9v7JWZ3BIux3FPvLF3yFZjop9tbSWKR+Bhp/S6w6ixiSrWcCoXgm
 uxfA==
X-Gm-Message-State: AOAM532QtcdK37iNBr+LLofT0YIH0P/ESAA4ZBk7Xti0QxyutMxcHfCS
 bM0aqJGWyaxljcsx+rF/2gDvsXKnqMwdUUZhsvs=
X-Google-Smtp-Source: ABdhPJzvEmzWuahJjCnq+ZMJixhpkm3KNp6kok+q20Al/eAGM2mP9WokEC+P56s7XJVWAW/iqzmnjaTihV1wlYq26Ug=
X-Received: by 2002:a05:6122:a1b:: with SMTP id 27mr387134vkn.23.1623165260736; 
 Tue, 08 Jun 2021 08:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210608083418.137226-1-wangkefeng.wang@huawei.com>
 <20210608083418.137226-2-wangkefeng.wang@huawei.com>
 <CAFqt6zYmCQ=wxEjnOJ6fgJWYQyFajBuxWD=UT_D-WjWUS_4pcw@mail.gmail.com>
 <34f88fdc-1842-7954-bccc-0142a8d66eea@csgroup.eu>
In-Reply-To: <34f88fdc-1842-7954-bccc-0142a8d66eea@csgroup.eu>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 8 Jun 2021 20:44:08 +0530
Message-ID: <CAFqt6zbV32+FsEFywqb6vk90tQ442S63CO+bh=2h8OxxutYQEQ@mail.gmail.com>
Subject: Re: [PATCH v3 resend 01/15] mm: add setup_initial_init_mm() helper
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 uclinux-h8-devel@lists.sourceforge.jp, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, X86 ML <x86@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
 Linux-MM <linux-mm@kvack.org>, linux-m68k@lists.linux-m68k.org, 
 openrisc@lists.librecores.org, Andrew Morton <akpm@linux-foundation.org>, 
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_081522_161780_7F3506FA 
X-CRM114-Status: GOOD (  14.48  )
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

T24gVHVlLCBKdW4gOCwgMjAyMSBhdCA4OjI3IFBNIENocmlzdG9waGUgTGVyb3kKPGNocmlzdG9w
aGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4KPgo+Cj4gTGUgMDgvMDYvMjAyMSDDoCAxNjo1
MywgU291cHRpY2sgSm9hcmRlciBhIMOpY3JpdCA6Cj4gPiBPbiBUdWUsIEp1biA4LCAyMDIxIGF0
IDE6NTYgUE0gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cm90ZToK
PiA+Pgo+ID4+IEFkZCBzZXR1cF9pbml0aWFsX2luaXRfbW0oKSBoZWxwZXIgdG8gc2V0dXAga2Vy
bmVsIHRleHQsCj4gPj4gZGF0YSBhbmQgYnJrLgo+ID4+Cj4gPj4gQ2M6IGxpbnV4LXNucHMtYXJj
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gPj4gQ2M6IGxpbnV4LWNza3lAdmdlci5rZXJuZWwub3JnCj4gPj4gQ2M6IHVj
bGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UuanAKPiA+PiBDYzogbGludXgtbTY4a0Bs
aXN0cy5saW51eC1tNjhrLm9yZwo+ID4+IENjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9y
Zwo+ID4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+ID4+IENjOiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPj4gQ2M6IGxpbnV4LXNoQHZnZXIua2VybmVsLm9y
Zwo+ID4+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+ID4+IENjOiB4ODZAa2VybmVs
Lm9yZwo+ID4+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVh
d2VpLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGluY2x1ZGUvbGludXgvbW0uaCB8IDMgKysrCj4gPj4g
ICBtbS9pbml0LW1tLmMgICAgICAgfCA5ICsrKysrKysrKwo+ID4+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9t
bS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gPj4gaW5kZXggYzI3NGY3NWVmY2Y5Li4wMmFhMDU3
NTQwYjcgMTAwNjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4gPj4gKysrIGIvaW5j
bHVkZS9saW51eC9tbS5oCj4gPj4gQEAgLTI0NCw2ICsyNDQsOSBAQCBpbnQgX19hZGRfdG9fcGFn
ZV9jYWNoZV9sb2NrZWQoc3RydWN0IHBhZ2UgKnBhZ2UsIHN0cnVjdCBhZGRyZXNzX3NwYWNlICpt
YXBwaW5nLAo+ID4+Cj4gPj4gICAjZGVmaW5lIGxydV90b19wYWdlKGhlYWQpIChsaXN0X2VudHJ5
KChoZWFkKS0+cHJldiwgc3RydWN0IHBhZ2UsIGxydSkpCj4gPj4KPiA+PiArdm9pZCBzZXR1cF9p
bml0aWFsX2luaXRfbW0odm9pZCAqc3RhcnRfY29kZSwgdm9pZCAqZW5kX2NvZGUsCj4gPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZW5kX2RhdGEsIHZvaWQgKmJyayk7Cj4gPj4g
Kwo+ID4KPiA+IEdlbnRsZSBxdWVyeSAtPiBpcyB0aGVyZSBhbnkgbGltaXRhdGlvbiB0byBhZGQg
aW5saW5lIGZ1bmN0aW9ucyBpbgo+ID4gc2V0dXBfYXJjaCgpIGZ1bmN0aW9ucyA/Cj4KPiBLZWZl
bmcganVzdCBmb2xsb3dlZCBjb21tZW50IGZyb20gTWlrZSBJIGd1ZXNzLCBzZWUKPiBodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMjEwNjA0
MDcwNjMzLjMyMzYzLTItd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20vIzI2OTYyNTMKCk9rLgo+
Cj4gQ2hyaXN0b3BoZQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
