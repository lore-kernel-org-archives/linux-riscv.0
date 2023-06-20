Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEF0EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2aoi3NKw3zpZWZIsbe/IsyQMbynICTkzonvw95rs1bQ=; b=ClzozwUt88OsIcVvwyuukncZV6
	HM/4ObKKLe//64UrQSYBvBKUMB81xCSz9H+FXWu7Cf1yEp39jNJlMzrxTYHya1hwmXpQc9iV1qyac
	HEDN0q/TwIa9Vv2z49+5Xxsr3yUrm5sfNoivxBwh+VJMWvJYijjgOgKOyxPx1NOzRCTTNpt9lGA8C
	sl4tvjy1qCB6WKB+5MK2yms8YbKx/46fHIf+SP9pf3bjfzpz8qna3ieozzsgBmUmWFXbFYG/BaBs2
	bWdtFHPL57JC6l5NhKtabRIRJyyZm11siVgoTAp16JcnoaKx2q6jannYFw7gW/iZVUE8u0tF29225
	J65OR3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBh49-00CBI9-2t;
	Tue, 20 Jun 2023 19:31:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBh43-00CBFm-02
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:30:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b539d2f969so29439745ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 12:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687289454; x=1689881454;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxbAB6x8wYPpV1ZKtdNP9xJrU3nLdB1/iIS73PBEfC8=;
        b=YScjX+HVPsTW42Q9iNRZVlLdte3SLQ1VHNdCDPsHAn/jerdshUD8c8yQ9zHQd7wcED
         t5p+PkI5uYBj5xd9ErM77/Eo0xKTLwtrRE7TjoVWXWJx3uO84Tzwi8APG8yXW7+yRY3A
         CsgYlza9FCWtcCkBepcbtbjGH0mCKr3w8rVwsvDeIGWUWjP8RcnxS0Rdi/oC/QwGVU59
         RT6JCk67Ms7umsS2I/0RzFmWLj+epGzTUL06GyAjEn7tp+KUan1rFXziaiSIXMkhoSv9
         Fq4R90lXHLZ/BjXcXmYcT4QuYq9AjFjit7SU8rHhLfdAHl8bNFYGV0aoTW3iNi1qZw/C
         Cw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687289454; x=1689881454;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxbAB6x8wYPpV1ZKtdNP9xJrU3nLdB1/iIS73PBEfC8=;
        b=BQOrGMDFkzgnqZNqUaZrp+t1zyEMNDn6YwWEQ2jNvCyrvPHDHW4P1fr61v9kexfIlI
         FO3U1mIsRSJ+Z8T2ye+Lw6c+zvvy+MPVu67FfDDGI1Asu+aSLMIx8ywjjjWrKN8mAk1t
         9eYujjobVBbz08HB5gekKEuIrO0fCTC/1CVq0sezzQ3BcxkSeyXa6tiX5KGDNO+9Hl2r
         pJdMS/hyUMbPVyjWOEfSURWb+kb5ne2l/ODm2EoUHndia3Ma1ZF3sTDO/SNa6sIdryY4
         dNIEDnSd+0Nq3WC0X+REvdhOoMSXWG445SfpD1v+/NUdXRXqKaNOaC+AN4yMfF0qRV6a
         pakA==
X-Gm-Message-State: AC+VfDzCfCQpicuuz6dmAz3VT8UR+fNkSFRrzPy2FdYS7DL1HA/5Ydn9
	PFKD/txIMT+Uria5DrdcWoxLk+oC6wOYXckHjq4=
X-Google-Smtp-Source: ACHHUZ5KirkJsChd1Dvw7/Wi3JSVnuoM7ljNp5I/iZ9TFT4X8h/6ceaPQvjv3ku2MbqEvjObKj6sJw==
X-Received: by 2002:a17:902:c40d:b0:1ac:6fc3:6beb with SMTP id k13-20020a170902c40d00b001ac6fc36bebmr22331826plk.9.1687289454320;
        Tue, 20 Jun 2023 12:30:54 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y10-20020a17090322ca00b001a6dc4f4a8csm1983321plg.73.2023.06.20.12.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:30:53 -0700 (PDT)
Date: Tue, 20 Jun 2023 12:30:53 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 12:28:45 PDT (-0700)
Subject: Re: [PATCH] riscv: replace deprecated scall with ecall
In-Reply-To: <CAFP8O3JSaZ6D=nGoVu+-_t2HZBLX7M8wggALWKNWH=PnubY8yA@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maskray@google.com
Message-ID: <mhng-246452e8-2536-41b6-b143-f28779445a38@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_123055_045430_F59DB7EF 
X-CRM114-Status: GOOD (  19.59  )
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

T24gVHVlLCAxMyBKdW4gMjAyMyAxNDo1MTo1NiBQRFQgKC0wNzAwKSwgbWFza3JheUBnb29nbGUu
Y29tIHdyb3RlOgo+IE9uIFRodSwgTWF5IDExLCAyMDIzIGF0IDM6NDHigK9QTSBGYW5ncnVpIFNv
bmcgPG1hc2tyYXlAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFN1biwgQXByIDIzLCAyMDIz
IGF0IDM6MzLigK9QTSBGYW5ncnVpIFNvbmcgPG1hc2tyYXlAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4+
ID4KPj4gPiBzY2FsbCBpcyBhIGRlcHJlY2F0ZWQgYWxpYXMgZm9yIGVjYWxsLiBlY2FsbCBpcyB1
c2VkIGluIHNldmVyYWwgcGxhY2VzLAo+PiA+IHNvIHRoZXJlIGlzIG5vIGFzc2VtYmxlciBjb21w
YXRpYmlsaXR5IGNvbmNlcm4uCj4+ID4KPj4gPiBTaWduZWQtb2ZmLWJ5OiBGYW5ncnVpIFNvbmcg
PG1hc2tyYXlAZ29vZ2xlLmNvbT4KPj4gPiAtLS0KPj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvZW50
cnkuUyAgICAgICAgICAgICB8IDQgKystLQo+PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3J0
X3NpZ3JldHVybi5TIHwgMiArLQo+PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+PiA+IGluZGV4IDk5ZDM4ZmRm
OGIxOC4uMmY1MTkzNTYxMmQxIDEwMDY0NAo+PiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Vu
dHJ5LlMKPj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4+ID4gQEAgLTE5MSw3
ICsxOTEsNyBAQCBoYW5kbGVfc3lzY2FsbDoKPj4gPiAgICAgICAgIFJFR19TIGEwLCBQVF9PUklH
X0EwKHNwKQo+PiA+ICAgICAgICAgLyoKPj4gPiAgICAgICAgICAqIEFkdmFuY2UgU0VQQyB0byBh
dm9pZCBleGVjdXRpbmcgdGhlIG9yaWdpbmFsCj4+ID4gLSAgICAgICAgKiBzY2FsbCBpbnN0cnVj
dGlvbiBvbiBzcmV0Cj4+ID4gKyAgICAgICAgKiBlY2FsbCBpbnN0cnVjdGlvbiBvbiBzcmV0Cj4+
ID4gICAgICAgICAgKi8KPj4gPiAgICAgICAgIGFkZGkgczIsIHMyLCAweDQKPj4gPiAgICAgICAg
IFJFR19TIHMyLCBQVF9FUEMoc3ApCj4+ID4gQEAgLTYwMyw2ICs2MDMsNiBAQCBFTkQoZXhjcF92
ZWN0X3RhYmxlKQo+PiA+ICAjaWZuZGVmIENPTkZJR19NTVUKPj4gPiAgRU5UUlkoX191c2VyX3J0
X3NpZ3JldHVybikKPj4gPiAgICAgICAgIGxpIGE3LCBfX05SX3J0X3NpZ3JldHVybgo+PiA+IC0g
ICAgICAgc2NhbGwKPj4gPiArICAgICAgIGVjYWxsCj4+ID4gIEVORChfX3VzZXJfcnRfc2lncmV0
dXJuKQo+PiA+ICAjZW5kaWYKPj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by9ydF9zaWdyZXR1cm4uUyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vcnRfc2lncmV0dXJuLlMK
Pj4gPiBpbmRleCAwNTczNzA1ZWFjNzYuLjEwNDM4YzdjNjI2YSAxMDA2NDQKPj4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3J0X3NpZ3JldHVybi5TCj4+ID4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvdmRzby9ydF9zaWdyZXR1cm4uUwo+PiA+IEBAIC0xMSw2ICsxMSw2IEBAIEVOVFJZ
KF9fdmRzb19ydF9zaWdyZXR1cm4pCj4+ID4gICAgICAgICAuY2ZpX3N0YXJ0cHJvYwo+PiA+ICAg
ICAgICAgLmNmaV9zaWduYWxfZnJhbWUKPj4gPiAgICAgICAgIGxpIGE3LCBfX05SX3J0X3NpZ3Jl
dHVybgo+PiA+IC0gICAgICAgc2NhbGwKPj4gPiArICAgICAgIGVjYWxsCj4+ID4gICAgICAgICAu
Y2ZpX2VuZHByb2MKPj4gPiAgRU5EUFJPQyhfX3Zkc29fcnRfc2lncmV0dXJuKQo+PiA+IC0tCj4+
ID4gMi40MC4wLjYzNC5nNGNhM2VmMzIxMS1nb29nCj4+ID4KPj4KPj4gUGluZzopCj4+Cj4+Cj4+
IC0tCj4+IOWui+aWueedvwo+Cj4gUGluZ14yIDopCgpTb3JyeSB0aGlzIHRvb2sgYSB3aGlsZSwg
SSBoYWQgdG8gZml4IHVwIHNvbWUgbWVyZ2UgaXNzdWVzIGJ1dCBJIHRoaW5rIAppdCdzIE9LLiAg
U2hvdWxkIGJlIG9uIGZvci1uZXh0IG5vdy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
