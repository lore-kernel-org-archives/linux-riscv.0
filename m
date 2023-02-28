Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB52C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 21:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JA3f7WDdeLHUQBmVEqOPBE0rlqbMhrSgWT/h2e0GtRA=; b=LDm6XjpRN2L1H2PWxu+EIOz94Y
	Z+W5l153S2saazfnGZVX7e+XWahbHQzoM8K2FtmB7M9yUtlLSeLACQucoJJFAVUMHtIQQ+xliTUrE
	7wdgqF54e00H4phupRKCmP/6VcwDUljX6fK2AXcTMjX/DrEtu6pCIfseSIhn8pUfufG94AX2vx30L
	qnWxRDgqFR622HNdilh8/5A/ovpNAznOBBRUz6n8Pk+QVl+rPEBkKzLLzzalcS6XXuqqLGXd4/vLh
	0gVAUNPLzuPEZ7ZlX1JpvCnsgZ24J8bC1mwvMW7Q6D2Gkre0viOCIZuiGrInULam+E2/Lpj1nGWn+
	HkV+G7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7wO-00EOn0-1Z; Tue, 28 Feb 2023 21:55:20 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7wL-00EOlh-GD
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 21:55:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso9937740pjs.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 13:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677621317;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egxOAyTjlALDkyGqDWeipczUp4/JR/aRKX23OhYduwM=;
        b=ZUmrqRYiVdsy4CiwXe7AwOJA7mtHKKGv0wF9xRnmNRkOdj1hnnUM/tFArLPe8Svlpc
         e+UMV7cYx+ofGTFnnhUvOhkjsAq4om8jBBQUH+n9BXLARTRDlg0CZqM4059kRMxtXBxd
         fNEiFYUQohi8aHRGjcXQ9zQCVkwTJ3V3eLz5khm1lX6XBwDmPgNcQI5pEdyHAthN8a5F
         06xXGx+xZrpVR+a3Fg2KOVP8ojj6jTF/HW9xVt7wehGqRVwawg1cMmXjNpdmbMIycqmF
         XU2VXRe1KpyuZXyB9/Eyhf/z61tq7L9tFYq2H+FYNtDO1xvPPkO6+7/HBG/aMyjg803K
         QNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677621317;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egxOAyTjlALDkyGqDWeipczUp4/JR/aRKX23OhYduwM=;
        b=3HHB0N+e6La1MF9KWn27qAiX0+ceeUSgGtLN3QtkjwexHyj095bep/wzYQPBCCeabw
         2YL8grDUh4YjoIq7kXcoz9Ep3bAqnxEX9b4ekZwjAA0X6INR9m4v5YEo16ElqD8+AR9T
         NDjIRETZaxPObWJmPkqRmKEFdETNVLyuNA5ll9NdRZAkKfqSYhUN1AWA5C5pmwiXJHjc
         vujHxkuwVfeOk2euz/Ffb/N6VUu4kya8iIfTXlvTqYMxAEOlkGFgR05ZJYefMbKtzzGY
         3NN9SZ+lQKJ621KHFoIjjEoVjOoKh6QlZjM3wRVXDltz8wng9aPg5W8ZAuuM7x8D3eZd
         xU2w==
X-Gm-Message-State: AO0yUKWXrlSAdXIANcZcO5/RE3MF6ZCZYSm0ZJ3qnAb2TJLz9y11EIHg
	bf0LcmfyMot2nCLB1DpMXJCb+A==
X-Google-Smtp-Source: AK7set9fPojl9AgEDaXiqhwUp14zeUsp9J423e5TycuH2s+njJIdpAAP9ooUWkLh7P4lDmiyNC3ggA==
X-Received: by 2002:a17:902:d2c5:b0:19a:a9d8:e48a with SMTP id n5-20020a170902d2c500b0019aa9d8e48amr5025958plc.22.1677621316699;
        Tue, 28 Feb 2023 13:55:16 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902704500b0019a7c890c5asm6948527plt.263.2023.02.28.13.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 13:55:16 -0800 (PST)
Date: Tue, 28 Feb 2023 13:55:16 -0800 (PST)
X-Google-Original-Date: Tue, 28 Feb 2023 13:54:29 PST (-0800)
Subject: Re: [PATCH] riscv, lib: Fix Zbb strncmp
In-Reply-To: <010e1a24-83dc-8ef7-5c6e-6ab06d669f8a@roeck-us.net>
CC: bjorn@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
  heiko.stuebner@vrull.eu, Bjorn Topel <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
  ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux@roeck-us.net
Message-ID: <mhng-4ebff434-203f-4317-a4be-ea5e6709de5e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_135517_573987_56B9E2B6 
X-CRM114-Status: GOOD (  18.91  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyOCBGZWIgMjAyMyAxMzoxODoxMiBQU1QgKC0wODAwKSwgbGludXhAcm9lY2stdXMu
bmV0IHdyb3RlOgo+IE9uIDIvMjgvMjMgMTA6NDIsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IEZy
b206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4KPj4gVGhlIFpiYiBvcHRp
bWl6ZWQgc3RybmNtcCBoYXMgdHdvIHBhcnRzOyBhIGZhc3QgcGF0aCB0aGF0IGRvZXMgWExFTi84
Qgo+PiBwZXIgaXRlcmF0aW9uLCBhbmQgYSBzbG93IHRoYXQgZG9lcyBvbmUgYnl0ZSBwZXIgaXRl
cmF0aW9uLgo+Pgo+PiBUaGUgaWRlYSBpcyB0byBjb21wYXJlIGFsaWduZWQgWExFTiBjaHVua3Mg
Zm9yIG1vc3Qgb2Ygc3RyaW5ncywgYW5kIGRvCj4+IHRoZSByZW1haW5kZXIgdGFpbCBpbiB0aGUg
c2xvdyBwYXRoLgo+Pgo+PiBUaGUgWmJiIHN0cm5jbXAgaGFzIHR3byBpc3N1ZXMgaW4gdGhlIGZh
c3QgcGF0aDoKPj4KPj4gSW5jb3JyZWN0IHJlbWFpbmRlciBoYW5kbGluZyAod3JvbmcgY29tcGFy
ZSk6IEFzc3VtZSB0aGF0IHRoZSBzdHJpbmcKPj4gbGVuZ3RoIGlzIDkuIE9uIDY0YiBzeXN0ZW1z
LCB0aGUgZmFzdCBwYXRoIHNob3VsZCBkbyBvbmUgaXRlcmF0aW9uLAo+PiBhbmQgb25lIGl0ZXJh
dGlvbiBpbiB0aGUgc2xvdyBwYXRoLiBJbnN0ZWFkLCBib3RoIHdlcmUgZG9uZSBpbiB0aGUKPj4g
ZmFzdCBwYXRoLCB3aGljaCBsZWFkIHRvIGluY29ycmVjdCByZXN1bHRzLiBBbiBleGFtcGxlOgo+
Pgo+PiAgICBzdHJuY21wKCIvZGV2L3ZkYSIsICIvZGV2LyIsIDUpOwo+Pgo+PiBDb3JyZWN0IGJ5
IGNoYW5naW5nICJiZ3QiIHRvICJiZ2UiLgo+Pgo+PiBNaXNzaW5nIE5VTEwgY2hlY2tzIGluIHRo
ZSBzZWNvbmQgc3RyaW5nOiBUaGlzIGNvdWxkIGxlYWQgdG8gaW5jb3JyZWN0Cj4+IHJlc3VsdHMg
Zm9yOgo+Pgo+PiAgICBzdHJuY21wKCIvZGV2L3ZkYSIsICIvZGV2L3ZkYVwwIiwgOCk7Cj4+Cj4+
IENvcnJlY3QgYnkgYWRkaW5nIGFuIGFkZGl0aW9uYWwgY2hlY2suCj4+Cj4+IEZpeGVzOiBiNmZj
ZGIxOTFlMzYgKCJSSVNDLVY6IGFkZCB6YmIgc3VwcG9ydCB0byBzdHJpbmcgZnVuY3Rpb25zIikK
Pj4gU3VnZ2VzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJAdnJ1bGwuZXU+
Cj4+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPgo+
IFRlc3RlZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PgoKVGhhbmtzIGd1
eXMsIEknbSBnb2luZyB0byBhcHBseSB0aGlzIEFTQVAgYXMgaXQncyBhIHByZXR0eSBjb25jcmV0
ZSAKYnJlYWthZ2UgaW4gbmV3IGNvZGUgZnJvbSB0aGlzIG1lcmdlIHdpbmRvdy4gIEkganVzdCBz
dHVjayBpdCBpbiBteSAKc3RhZ2luZyBicmFuY2gsIGl0IHNob3VsZCBzaG93IHVwIG9uIGZvci1u
ZXh0IGFmdGVyIHRoZSBuZXh0IGJhdGNoIG9mIAp0ZXN0cy4KCj4KPj4gLS0tCj4+ICAgYXJjaC9y
aXNjdi9saWIvc3RybmNtcC5TIHwgNCArKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIv
c3RybmNtcC5TIGIvYXJjaC9yaXNjdi9saWIvc3RybmNtcC5TCj4+IGluZGV4IGVlNDk1OTUwNzVi
ZS4uZWZkM2YzMTUwYTU0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2xpYi9zdHJuY21wLlMK
Pj4gKysrIGIvYXJjaC9yaXNjdi9saWIvc3RybmNtcC5TCj4+IEBAIC03OCwxMSArNzgsMTMgQEAg
c3RybmNtcF96YmI6Cj4+ICAgCS8qIE1haW4gbG9vcCBmb3IgYWxpZ25lZCBzdHJpbmcuICAqLwo+
PiAgIAkucDJhbGlnbiAzCj4+ICAgMToKPj4gLQliZ3QJYTAsIHQ2LCAzZgo+PiArCWJnZQlhMCwg
dDYsIDNmCj4+ICAgCVJFR19MCXQwLCAwKGEwKQo+PiAgIAlSRUdfTAl0MSwgMChhMSkKPj4gICAJ
b3JjLmIJdDMsIHQwCj4+ICAgCWJuZQl0MywgdDUsIDJmCj4+ICsJb3JjLmIJdDMsIHQxCj4+ICsJ
Ym5lCXQzLCB0NSwgMmYKPj4gICAJYWRkaQlhMCwgYTAsIFNaUkVHCj4+ICAgCWFkZGkJYTEsIGEx
LCBTWlJFRwo+PiAgIAliZXEJdDAsIHQxLCAxYgo+Pgo+PiBiYXNlLWNvbW1pdDogZWI5YmU4MzEw
YzU4YzE2NmY5ZmFlM2I3MWMwYWQ5ZDY3NDFiNDg5NwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
