Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94851EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 07:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvDy6Kd22P96AG4bnz0cESIC0ZmLopzXZSvmax06J0E=; b=ZLN0K5AewzS3qe
	3NNCfP9Ly9iSS9TkV4eaQ8q32g3DArj5Qm/DOfIXnxLikanoV82HufoSsORt7r+3aJejo4SVvbTgm
	Nclmg6H0+zFD/V7i6qqiNV1bOIQzckr2NEJlfBxG89Ovb/X4bCh0fwozZVohcz9fVdyVkTkSP2lJ6
	euhxMR2PDWxULWt+RfEaNyrnXIQ+0D3lbn7+OaCjYu/YfGVYCqPCh57iw1ODn/qYFDQEtMsCdx08r
	UNZ9+MNylfvTkzFs2q29ztpZhrYzIJE8Dv8R0uJL2xrfbzOL84fIPV99Rq12UQH6dH8cwUSgwIjrP
	LQf+sRyyL3FZHMa5oSUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNet-00A2KI-0g;
	Thu, 20 Jul 2023 07:01:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNeo-00A2Hj-1N
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 07:01:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3141fa31c2bso303896f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 00:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689836458; x=1690441258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZEjFz7LOZdmaaeUrHv50TFnsXpX5R1v3ht7TZZ808M=;
        b=1MfTo46HP0GNpJ9cJoyU1w/4UKVOAFz6QpJ4q70QXZNvjfL/YVfMgjHYqRYUSAxHDc
         jTtWwxIaJkGms8cWTugFcMm3Mz/kMh171waQTUmVGUrnhWRdSZZAnopxNT52sGyk4Vhr
         JccuRh1ReQQymlnZdjxbyC4YAll5dWm92TQo+/lCGQexj5cQvGKHZ8hgObMHOvGcBNKc
         O5YUKLp3tsmyVHte9MmjUkozGnbFeFs6ggXSUOdv86CnBPa+ITw35RBr4dJ9ncycHteI
         yoBB4mBa6g7bQWRNx+/Wq4Kah+D6A8vPku4/YRJO5RvDvi7ldgcJ20Ijhjk2fCg6Vb/c
         pjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689836458; x=1690441258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ZEjFz7LOZdmaaeUrHv50TFnsXpX5R1v3ht7TZZ808M=;
        b=DDydi0eanoueqC+Pl9cG6GEXPos4CGKI8mt6BV2CWR6+Ehr8ab4gnVW9dRkTStgNR7
         w5KJ5BWxOo17rtSxWgF6EwiIIxTyMZ9lMggw/n1u+1RIor1R9JZd7mbxZxCEmcEWky9n
         5FUjpydmwjroDk5UzEYl9dyhCpE6rwsbRzwliGDf2Qj5bXiTOLux/EF3cIYBwOLHl7Xy
         vK4qHJaJTLk+4loJ4NvPQpmdreX98rX2aMxnhR2Lam8Ymfpj9aSkCYWaRamEEhEYSA10
         fqZYVtJX1HXx1LGIkWGyPLQhCa+0G2ErqOe2WdQqUbSoZJjUrWY65gMONF2dex/ut+C+
         y+jA==
X-Gm-Message-State: ABy/qLbvmIwUFI1PCGhO1cgPJprp3vPRiav4b9LFgGBXAcp/088/sxmA
	CZRxSVeM8eFT1coVYe773fCgsECNhp+onboSVcYX5w==
X-Google-Smtp-Source: APBJJlFTDTlY08cieS+z3W0RyAq1pip8zIDcg55w3AOM8lXoEXjLTyl+gVgmTMjFP8mz/ktC3zk5jdu+9sPkK0WnKYA=
X-Received: by 2002:adf:e903:0:b0:30e:3da5:46e5 with SMTP id
 f3-20020adfe903000000b0030e3da546e5mr1830181wrm.59.1689836457755; Thu, 20 Jul
 2023 00:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230714165508.94561-1-charlie@rivosinc.com> <20230714165508.94561-4-charlie@rivosinc.com>
In-Reply-To: <20230714165508.94561-4-charlie@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 20 Jul 2023 09:00:46 +0200
Message-ID: <CAHVXubhUdtiP_G4PwsmQTkKbsQ0PuL-Xjtyowz9iXDeDPeiHFA@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] RISC-V: mm: Update pgtable comment documentation
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com, 
	aou@eecs.berkeley.edu, anup@brainfault.org, konstantin@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, mick@ics.forth.gr, jrtc27@jrtc27.com, 
	rdunlap@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_000105_235116_17B9CC40 
X-CRM114-Status: GOOD (  14.38  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNjo1NuKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gc3Y1NyBpcyBzdXBwb3J0ZWQgaW4gdGhlIGtlcm5l
bCBzbyBwZ3RhYmxlLmggc2hvdWxkIHJlZmxlY3QgdGhhdC4KPgo+IFNpZ25lZC1vZmYtYnk6IENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgOCArKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgK
PiBpbmRleCBlMTNmNTg3MmJmZTkuLjI4NjYwYmFiNzU0YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCj4gQEAgLTg0MCwxNCArODQwLDE2IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRl
X3N3cF9jbGVhcl9leGNsdXNpdmUocHRlX3QgcHRlKQo+ICAgKiBUYXNrIHNpemUgaXMgMHg0MDAw
MDAwMDAwIGZvciBSVjY0IG9yIDB4OWZjMDAwMDAgZm9yIFJWMzIuCj4gICAqIE5vdGUgdGhhdCBQ
R0RJUl9TSVpFIG11c3QgZXZlbmx5IGRpdmlkZSBUQVNLX1NJWkUuCj4gICAqIFRhc2sgc2l6ZSBp
czoKPiAtICogLSAgICAgMHg5ZmMwMDAwMCAofjIuNUdCKSBmb3IgUlYzMi4KPiAtICogLSAgIDB4
NDAwMDAwMDAwMCAoIDI1NkdCKSBmb3IgUlY2NCB1c2luZyBTVjM5IG1tdQo+IC0gKiAtIDB4ODAw
MDAwMDAwMDAwICggMTI4VEIpIGZvciBSVjY0IHVzaW5nIFNWNDggbW11Cj4gKyAqIC0gICAgICAg
IDB4OWZjMDAwMDAgKH4yLjVHQikgZm9yIFJWMzIuCj4gKyAqIC0gICAgICAweDQwMDAwMDAwMDAg
KCAyNTZHQikgZm9yIFJWNjQgdXNpbmcgU1YzOSBtbXUKPiArICogLSAgICAweDgwMDAwMDAwMDAw
MCAoIDEyOFRCKSBmb3IgUlY2NCB1c2luZyBTVjQ4IG1tdQo+ICsgKiAtIDB4MTAwMDAwMDAwMDAw
MDAwICggIDY0UEIpIGZvciBSVjY0IHVzaW5nIFNWNTcgbW11Cj4gICAqCj4gICAqIE5vdGUgdGhh
dCBQR0RJUl9TSVpFIG11c3QgZXZlbmx5IGRpdmlkZSBUQVNLX1NJWkUgc2luY2UgIlJJU0MtVgo+
ICAgKiBJbnN0cnVjdGlvbiBTZXQgTWFudWFsIFZvbHVtZSBJSTogUHJpdmlsZWdlZCBBcmNoaXRl
Y3R1cmUiIHN0YXRlcyB0aGF0Cj4gICAqICJsb2FkIGFuZCBzdG9yZSBlZmZlY3RpdmUgYWRkcmVz
c2VzLCB3aGljaCBhcmUgNjRiaXRzLCBtdXN0IGhhdmUgYml0cwo+ICAgKiA2M+KAkzQ4IGFsbCBl
cXVhbCB0byBiaXQgNDcsIG9yIGVsc2UgYSBwYWdlLWZhdWx0IGV4Y2VwdGlvbiB3aWxsIG9jY3Vy
LiIKPiArICogU2ltaWxhcmx5IGZvciBTVjU3LCBiaXRzIDYz4oCTNTcgbXVzdCBiZSBlcXVhbCB0
byBiaXQgNTYuCj4gICAqLwo+ICAjaWZkZWYgQ09ORklHXzY0QklUCj4gICNkZWZpbmUgVEFTS19T
SVpFXzY0ICAgKFBHRElSX1NJWkUgKiBQVFJTX1BFUl9QR0QgLyAyKQo+IC0tCj4gMi40MS4wCj4K
CllvdSBjYW4gYWRkOgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
