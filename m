Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32684C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 07:18:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2C1720854
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 07:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qlw557dk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nNZXw9A2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2C1720854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzhVLQewdVSTnnxJlHflYy9xL6IbgQOHZxUnS/tz3qc=; b=qlw557dk8roeqL
	aWyFuHbowX5AerrR2a5aaP1e3p92SesJi6k8lV4QGWymm0UnNMt3p828frhegK08UpaJ/gjqnk0tw
	rsvyVnQ0Ztu2O9NwrjgO+FUgcaFYYrqN/QCxOb0WfGuIzCgKhhZS94GSTqyFJnc6SwUtjo6qD9tCs
	cbMQ9juvjiKs31a5S6tJ3CraDFeX22QGZSJKJKv1N6+28KwlUao4G9w4vlUbTZBLqlXee3s+8lQfG
	iFRC4/bxQUMjpdWssFolfbakimSgXNgCv7yurlR/BLISTAvCS/Xlj+UoVxf2rOnzmZcQCQeJ5a+K4
	A3XleK5ftb05jwV2M+IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h29lj-00042p-0Y; Fri, 08 Mar 2019 07:18:11 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h29lf-00042P-O8
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 07:18:09 +0000
Received: by mail-qk1-x729.google.com with SMTP id u22so1759339qkj.11
 for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2019 23:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kNH/9i7JxIH57bsJ9sA3crwWAaopOrSYPfFh15920oY=;
 b=nNZXw9A2/KavzhM6aw+q/oljY3aeq5b9yUFdjifYkgUc8s8y63sti29lcH0hLOlHu5
 o64Ahxu2fjNd3iaOGTrRvRV0UnmHoIdBqjlqhMUq+acOATECMR88dPiWJDB7pw03QH2a
 4SmbZ62ELP6GnJ84CdVbEKmdmFiX7U4rEAgFwQywRa7YGxrNrK3LyAiiuxDU91leTj6S
 1Lyvr6GD+nMwpdGBF6kA8e2oNOt3qnMi2/Gqt/NRIFVd4J2a3yyC4K6eyw2C7oX7GBlw
 lMWw2IQgaperAIGQkAO21hnEol2Rfb22gp0H2T26gG2kg+mb6mFYmDEk/GbY/vtT9L1J
 6o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kNH/9i7JxIH57bsJ9sA3crwWAaopOrSYPfFh15920oY=;
 b=p/BwKTlI/G5jkRRVsvmJcg3FaKwPjF7NNsqRV17ZVflqaH8wpz3oqDZbRySb6S4kxj
 jAff8DbpJnUR9GgiETd+S7JNIOqtdwD+9VDS8VNwtBOqUaIPiVmPTDv0XfwCnD9wPEYx
 o8awk+aD0S/gJ6a6pMiqwjuHO+vigBUEHBfDTdALhhxsPIyctTz9+emOqXcP6KWvOkv7
 yyxeKbNgMkZpnj6MhGeMIVNHMVWYqsTyi76kKXGYleclai9cuXP+EnZdbLwVB2v1Ghax
 UzH+Ke7mUAw32XzOH9gGJS5ifbHl+VLUm3c7V3U/LrpqthL9QwWZJ4kN3bl3Y4f+P5ve
 U2kQ==
X-Gm-Message-State: APjAAAWCLwiBaIFJlqf1c+amHaKfy8B46c9guC6MQBi/WU+DMSG1bzZq
 0+TaHXVUtitrdwqau7mkPClYgU1Lz8nDK5hC6BE=
X-Google-Smtp-Source: APXvYqxarBE86cMetgTH/Uh7yQezwnNljW4Md/MekPZ9jJdD3mrFED4ZL7gOlGgYYwgYduY6OTJgPrl80BBnompYViU=
X-Received: by 2002:a37:98c7:: with SMTP id
 a190mr12906197qke.308.1552029483427; 
 Thu, 07 Mar 2019 23:18:03 -0800 (PST)
MIME-Version: 1.0
References: <mhng-840b0a81-50e1-4783-a784-638195b9305b@palmer-si-x1c4>
 <0100016915bc54e5-22f89b41-21e8-4133-9550-e85f4223ea32-000000@email.amazonses.com>
 <2acd8a4393d4e9c526bcfa4aca63e4cf@mailhost.ics.forth.gr>
 <0100016915ec5184-5c0a50db-1b61-428f-ae2c-d23ce8d465d5-000000@email.amazonses.com>
 <CAJ+HfNidsF3Lnx4s4sG+=Zmt95JYScg+BKB5=u6wMUoSkHo5FA@mail.gmail.com>
 <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
In-Reply-To: <0100016916c7cda0-9622bc7c-b8db-4967-83e6-43692aa58ec8-000000@email.amazonses.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Fri, 8 Mar 2019 08:17:52 +0100
Message-ID: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
Subject: Re: per-cpu thoughts
To: Christopher Lameter <cl@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_231807_785822_937ED272 
X-CRM114-Status: GOOD (  10.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Paul Walmsley <paul@pwsan.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMiBGZWIgMjAxOSBhdCAyMDo1NiwgQ2hyaXN0b3BoZXIgTGFtZXRlciA8Y2xAbGlu
dXguY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgMjIgRmViIDIwMTksIEJqw7ZybiBUw7ZwZWwgd3Jv
dGU6Cj4KPiA+ID4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgcmVnaXN0ZXIgbmVlZHMgdG8gYmUg
cmVmZXJlbmNlZCBieSB0aGUgYW1vCj4gPiA+IGluc3RydWN0aW9uLiBDYW4gYW1vYWRkIGluY3Jl
bWVudCBhbiBhZGRyZXNzIHJlbGF0aXZlIHRvIGEgc2NyYXRjaAo+ID4gPiByZWdpc3Rlcj8KPiA+
ID4KPiA+Cj4gPiBJdCBjYW5ub3QuIFNvLCB3ZSdsbCBlbmQgdXAgd2l0aCAoYXQgbGVhc3QpIGEg
cHJlZW1wdCBkaXNhYmxlZCByZWdpb24uLi4KPgo+IElmIHdlIG5lZWQgdG8gZG8gdGhhdCB0aGVu
IHdlIGFscmVhZHkgaGF2ZSBzbyBtdWNoIG92ZXJoZWFkIGR1ZSB0byB0aGF0Cj4gcHJvY2Vzc2lu
ZyB0aGF0IGl0IG1heSBub3QgYmUgd29ydGh3aGlsZS4gbGMvc2Mgb3ZlcmhlYWQgaXMgbWlub3Ig
Y29tcGFyZWQKPiB0byBzd2l0Y2hpbmcgcHJlZW1wdCBvbiBhbmQgb2ZmIEkgdGhpbmsuCj4KCkkn
bGwgZG8gc29tZSBtZWFzdXJlbWVudHMuIFRoZSBnZW5lcmljIG9uZSBkaXNhYmxlcyBpbnRlcnJ1
cHRzLCBzbyBhCnByZWVtcHRfe2Rpcyxlbn1hYmxlIGFuZCBBTU8gZGFuY2UgbWlnaHQgKHdlbGws
IHdlJ2xsIHNlZSA6LSkpIGJlCmJldHRlciBzdGlsbC4gSSBkZWZpbml0ZWx5IHNlZSB5b3VyIHBv
aW50cyBmcm9tIHRoZSBwcmVzZW50YXRpb24gbm93LgoKU2ltaWxhciB0byBBUk0sIFJJU0MtViBj
YW5ub3QgdXNlIHByZWVtcHRfZW5hYmxlX25vX3Jlc2NoZWQgOi0oLCBzbwp3ZSdsbCBoYXZlIHRv
IHNlZSB3aGVyZSB3ZSBlbmQgdXAgcGVyZm9ybWFuY2Utd2lzZS4uLgoKClRoYW5rcyBmb3IgdGhl
IGlucHV0IQpCasO2cm4KCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
