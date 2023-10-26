Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526C5C25B6F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 08:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cQmAj/SM7HX/FJl+/U6JCitrchvo+2QnAVfEdg1sMms=; b=BuABPRD7An47RV
	BsETMhmhUnxt0OuCElmE2R/17m0TxFZBNB7QefWwtv0MPzhD5FTIizfhNuQTZ7PQJMDrCKEHM7A9z
	eIUeJq21JCjwhKKAmnooMyMq+wXi40L1l5qoFfQY8kJbbSUaGi1RQWH4C0FKKo8NnCzs/MrdFbaRq
	bZXO/veSjrz2iQjagcfT5NCnBEnCwnF5YCRLi6qkL2HWBqumNclHnfOkcW/dVDk0Ki65htZDDQhnj
	PESdpluGvR6HchSYDLEHQYRTnl7rUBV/0/UgdjR2O1BYBm9QC0MRvet76zcHywHd0x1y6eI9Act/n
	7gKa7CpYjBPIxhDiZ0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvud-00DyOK-2C;
	Thu, 26 Oct 2023 08:40:19 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvua-00DyNE-1N
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 08:40:18 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso10507741fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 01:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698309612; x=1698914412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P4TscohSUMsguzpw2lOVFXhOAHSLy0dY/Ok/2lGq6Tg=;
        b=qqTuYHdXsofze40Jap7m/1gBwhTTbapEkEh/fQ0y8geG7rbY7TnA83P/F5/BamoQxF
         Di7qnD5f4Ty4xRtRHjApOfUpiEvNocbBvB3jqLc07jlBKCNHvO3lEpp9Keml5cTjuhPY
         rIOfnWL0yoUMM9Yg0fyuy1osN+YTg96+wK8SC+z+vlTmCwfglGSjHR5A8MyTjgel77j+
         cCBSGG6C3vvKGK8V4pnJxK3UxKSFjG4H2DHzhnNW5D68rttN/5oMzhhU1pK6mPpMRol2
         vmxB2fs86fsDYTkS2oUYp3UDX6x+/5v0sZDmHt3Ix1rLd5TA9aIG4noccQ0x4hK4wj7G
         fS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698309612; x=1698914412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4TscohSUMsguzpw2lOVFXhOAHSLy0dY/Ok/2lGq6Tg=;
        b=T0HSa3TDTXe088gSn4jdusWKu8i3/h3IDnq2QBO5nJNC+6jy7PlnzhL+u8fG4FTUKd
         epiUkkq2lLQdusIKvp7lNvEGobKtl8iEjj33kOWZz2HBgGh/93w/sxnXES9SfcIWoWNW
         bvS0muwKSUHn/QTfbn+GTMKLi21fxKbF6wHY3it0nQRKmVF1DZgUs3e3k3iw1wgj2dXe
         JEJslXjatn540eOf2NFmDbCP8+/uJ6yLlVru0E7lFHO0gr7WxutVHPJWu221a/zi2FI0
         L5CuDspd2eA4yOcHNaM2Nxn8N4xv1Bhu710CjDldXubKj/5T8xR00PMIzqpYtWxsUGHi
         L5sA==
X-Gm-Message-State: AOJu0Yw6119M8yotS7HqoIq0YmwZ1W7kXssnXthvkEBs/g7N2/kPdmeY
	6EbqQtHiVMZTkCjdOwhVf3VGXQ==
X-Google-Smtp-Source: AGHT+IGPzS4QwaJ48KsMa5vMztfn1B9sXTdqP4Ko1neTizBj0F3LXJeqyfJI6fwXGsGtb77TwMCBQg==
X-Received: by 2002:a05:6512:69:b0:503:3808:389a with SMTP id i9-20020a056512006900b005033808389amr12687011lfo.11.1698309612058;
        Thu, 26 Oct 2023 01:40:12 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c350100b003fe1fe56202sm1927140wmq.33.2023.10.26.01.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 01:40:11 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [PATCH -fixes v2] drivers: perf: Do not broadcast to other cpus when starting a counter
Date: Thu, 26 Oct 2023 10:40:10 +0200
Message-Id: <20231026084010.11888-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_014016_715520_E1909D74 
X-CRM114-Status: GOOD (  11.98  )
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

VGhpcyBjb21tYW5kOgoKJCBwZXJmIHJlY29yZCAtZSBjeWNsZXM6ayAtZSBpbnN0cnVjdGlvbnM6
ayAtYyAxMDAwMCAtbSA2NE0gZGQgaWY9L2Rldi96ZXJvIG9mPS9kZXYvbnVsbCBjb3VudD0xMDAw
CgpnaXZlcyByaXNlIHRvIHRoaXMga2VybmVsIHdhcm5pbmc6CgpbICA0NDQuMzY0Mzk1XSBXQVJO
SU5HOiBDUFU6IDAgUElEOiAxMDQgYXQga2VybmVsL3NtcC5jOjc3NSBzbXBfY2FsbF9mdW5jdGlv
bl9tYW55X2NvbmQrMHg0MmMvMHg0MzYKWyAgNDQ0LjM2NDUxNV0gTW9kdWxlcyBsaW5rZWQgaW46
ClsgIDQ0NC4zNjQ2NTddIENQVTogMCBQSUQ6IDEwNCBDb21tOiBwZXJmLWV4ZWMgTm90IHRhaW50
ZWQgNi42LjAtcmM2LTAwMDUxLWczOTFkZjgyZThlYzMtZGlydHkgIzczClsgIDQ0NC4zNjQ3NzFd
IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKWyAgNDQ0LjM2NDg2OF0gZXBj
IDogc21wX2NhbGxfZnVuY3Rpb25fbWFueV9jb25kKzB4NDJjLzB4NDM2ClsgIDQ0NC4zNjQ5MTdd
ICByYSA6IG9uX2VhY2hfY3B1X2NvbmRfbWFzaysweDIwLzB4MzIKWyAgNDQ0LjM2NDk0OF0gZXBj
IDogZmZmZmZmZmY4MDA5ZjllMCByYSA6IGZmZmZmZmZmODAwOWZhNWEgc3AgOiBmZjIwMDAwMDAw
MDAzODAwClsgIDQ0NC4zNjQ5NjZdICBncCA6IGZmZmZmZmZmODE1MDBhYTAgdHAgOiBmZjYwMDAw
MDAyYjgzMDAwIHQwIDogZmYyMDAwMDAwMDAwMzhjMApbICA0NDQuMzY0OTgyXSAgdDEgOiBmZmZm
ZmZmZjgxNTAyMWYwIHQyIDogMDAwMDAwMDAwMDAwMDAxZiBzMCA6IGZmMjAwMDAwMDAwMDM4YjAK
WyAgNDQ0LjM2NDk5OF0gIHMxIDogZmY2MDAwMDAwMmM1NGQ5OCBhMCA6IGZmNjAwMDAwMDJhNzM5
NDAgYTEgOiAwMDAwMDAwMDAwMDAwMDAwClsgIDQ0NC4zNjUwMTNdICBhMiA6IDAwMDAwMDAwMDAw
MDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAzIGE0IDogMDAwMDAwMDAwMDAwMDEwMApbICA0NDQu
MzY1MDI5XSAgYTUgOiAwMDAwMDAwMDAwMDEwMTAwIGE2IDogMDAwMDAwMDAwMGYwMDAwMCBhNyA6
IDAwMDAwMDAwMDAwMDAwMDAKWyAgNDQ0LjM2NTA0NF0gIHMyIDogMDAwMDAwMDAwMDAwMDAwMCBz
MyA6IGZmZmZmZmZmZmZmZmZmZmYgczQgOiBmZjYwMDAwMDAyYzU0ZDk4ClsgIDQ0NC4zNjUwNjBd
ICBzNSA6IGZmZmZmZmZmODE1Mzk2MTAgczYgOiBmZmZmZmZmZjgwYzIwYzQ4IHM3IDogMDAwMDAw
MDAwMDAwMDAwMApbICA0NDQuMzY1MDc1XSAgczggOiAwMDAwMDAwMDAwMDAwMDAwIHM5IDogMDAw
MDAwMDAwMDAwMDAwMSBzMTA6IDAwMDAwMDAwMDAwMDAwMDEKWyAgNDQ0LjM2NTA5MF0gIHMxMTog
ZmZmZmZmZmY4MDA5OTM5NCB0MyA6IDAwMDAwMDAwMDAwMDAwMDMgdDQgOiAwMDAwMDAwMGVhYzBj
NmU2ClsgIDQ0NC4zNjUxMDRdICB0NSA6IDAwMDAwMDA0MDAwMDAwMDAgdDYgOiBmZjYwMDAwMDAy
ZTAxMGQwClsgIDQ0NC4zNjUxMjBdIHN0YXR1czogMDAwMDAwMDIwMDAwMDEwMCBiYWRhZGRyOiAw
MDAwMDAwMDAwMDAwMDAwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDAzClsgIDQ0NC4zNjUyMjZdIFs8
ZmZmZmZmZmY4MDA5ZjllMD5dIHNtcF9jYWxsX2Z1bmN0aW9uX21hbnlfY29uZCsweDQyYy8weDQz
NgpbICA0NDQuMzY1Mjk1XSBbPGZmZmZmZmZmODAwOWZhNWE+XSBvbl9lYWNoX2NwdV9jb25kX21h
c2srMHgyMC8weDMyClsgIDQ0NC4zNjUzMTFdIFs8ZmZmZmZmZmY4MDZlOTBkYz5dIHBtdV9zYmlf
Y3RyX3N0YXJ0KzB4N2EvMHhhYQpbICA0NDQuMzY1MzI3XSBbPGZmZmZmZmZmODA2ZTg4MGM+XSBy
aXNjdl9wbXVfc3RhcnQrMHg0OC8weDY2ClsgIDQ0NC4zNjUzMzldIFs8ZmZmZmZmZmY4MDEyMTEx
YT5dIHBlcmZfYWRqdXN0X2ZyZXFfdW50aHJfY29udGV4dCsweDE5Ni8weDFhYwpbICA0NDQuMzY1
MzU2XSBbPGZmZmZmZmZmODAxMjM3YWE+XSBwZXJmX2V2ZW50X3Rhc2tfdGljaysweDc4LzB4OGMK
WyAgNDQ0LjM2NTM2OF0gWzxmZmZmZmZmZjgwMDNmYWY0Pl0gc2NoZWR1bGVyX3RpY2srMHhlNi8w
eDI1ZQpbICA0NDQuMzY1MzgzXSBbPGZmZmZmZmZmODAwOGEwNDI+XSB1cGRhdGVfcHJvY2Vzc190
aW1lcysweDgwLzB4OTYKWyAgNDQ0LjM2NTM5OF0gWzxmZmZmZmZmZjgwMDk5MWVjPl0gdGlja19z
Y2hlZF9oYW5kbGUrMHgyNi8weDUyClsgIDQ0NC4zNjU0MTBdIFs8ZmZmZmZmZmY4MDA5OTNlND5d
IHRpY2tfc2NoZWRfdGltZXIrMHg1MC8weDk4ClsgIDQ0NC4zNjU0MjJdIFs8ZmZmZmZmZmY4MDA4
YTZhYT5dIF9faHJ0aW1lcl9ydW5fcXVldWVzKzB4MTI2LzB4MThhClsgIDQ0NC4zNjU0MzNdIFs8
ZmZmZmZmZmY4MDA4YjM1MD5dIGhydGltZXJfaW50ZXJydXB0KzB4Y2UvMHgxZGEKWyAgNDQ0LjM2
NTQ0NF0gWzxmZmZmZmZmZjgwNmNkYzYwPl0gcmlzY3ZfdGltZXJfaW50ZXJydXB0KzB4MzAvMHgz
YQpbICA0NDQuMzY1NDU3XSBbPGZmZmZmZmZmODAwNmFmYTY+XSBoYW5kbGVfcGVyY3B1X2Rldmlk
X2lycSsweDgwLzB4MTE0ClsgIDQ0NC4zNjU0NzBdIFs8ZmZmZmZmZmY4MDA2NWI4Mj5dIGdlbmVy
aWNfaGFuZGxlX2RvbWFpbl9pcnErMHgxYy8weDJhClsgIDQ0NC4zNjU0ODNdIFs8ZmZmZmZmZmY4
MDQ1ZmFlYz5dIHJpc2N2X2ludGNfaXJxKzB4MmUvMHg0NgpbICA0NDQuMzY1NDk3XSBbPGZmZmZm
ZmZmODA4YTljNjI+XSBoYW5kbGVfcmlzY3ZfaXJxKzB4NGEvMHg3NApbICA0NDQuMzY1NTIxXSBb
PGZmZmZmZmZmODA4YWE3NjA+XSBkb19pcnErMHg3Yy8weDdlClsgIDQ0NC4zNjU3OTZdIC0tLVsg
ZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQoKVGhhdCdzIGJlY2F1c2UgdGhlIGZpeCBp
biBjb21taXQgM2ZlYzMyMzMzOWE0ICgiZHJpdmVyczogcGVyZjogRml4IHBhbmljCmluIHJpc2N2
IFNCSSBtbWFwIHN1cHBvcnQiKSB3YXMgd3Jvbmcgc2luY2UgdGhlcmUgaXMgbm8gbmVlZCB0byBi
cm9hZGNhc3QKdG8gb3RoZXIgY3B1cyB3aGVuIHN0YXJ0aW5nIGEgY291bnRlciwgdGhhdCdzIG9u
bHkgbmVlZGVkIGluIG1tYXAgd2hlbgp0aGUgY291bnRlcnMgY291bGQgaGF2ZSBhbHJlYWR5IGJl
ZW4gc3RhcnRlZCBvbiBvdGhlciBjcHVzLCBzbyBzaW1wbHkKcmVtb3ZlIHRoaXMgYnJvYWRjYXN0
LgoKRml4ZXM6IDNmZWMzMjMzMzlhNCAoImRyaXZlcnM6IHBlcmY6IEZpeCBwYW5pYyBpbiByaXNj
diBTQkkgbW1hcCBzdXBwb3J0IikKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4
Z2hpdGlAcml2b3NpbmMuY29tPgpUZXN0ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KVGVzdGVkLWJ5OiBZdSBDaGllbiBQZXRlciBMaW4gPHBldGVybGluQGFuZGVz
dGVjaC5jb20+Ci0tLQoKQ2hhbmdlcyBpbiB2MjoKLSBGaXggd3JvbmcgdXNhZ2Ugb2YgcG11X3Ni
aV9zZXRfc2NvdW50ZXJlbiBpbiBwbXVfc2JpX2N0cl9zdG9wLCBhcwogIG5vdGljZWQgYnkgUGV0
ZXIgTGluCi0gQWRkIFRCIGZyb20gUGV0ZXIgTGluCgogZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2
ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCmluZGV4IDk2YzdmNjcwYzhmMC4uZmNiMGM3MGNhMjIy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCisrKyBiL2RyaXZlcnMv
cGVyZi9yaXNjdl9wbXVfc2JpLmMKQEAgLTU0Myw4ICs1NDMsNyBAQCBzdGF0aWMgdm9pZCBwbXVf
c2JpX2N0cl9zdGFydChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQsIHU2NCBpdmFsKQogCiAJaWYg
KChod2MtPmZsYWdzICYgUEVSRl9FVkVOVF9GTEFHX1VTRVJfQUNDRVNTKSAmJgogCSAgICAoaHdj
LT5mbGFncyAmIFBFUkZfRVZFTlRfRkxBR19VU0VSX1JFQURfQ05UKSkKLQkJb25fZWFjaF9jcHVf
bWFzayhtbV9jcHVtYXNrKGV2ZW50LT5vd25lci0+bW0pLAotCQkJCSBwbXVfc2JpX3NldF9zY291
bnRlcmVuLCAodm9pZCAqKWV2ZW50LCAxKTsKKwkJcG11X3NiaV9zZXRfc2NvdW50ZXJlbigodm9p
ZCAqKWV2ZW50KTsKIH0KIAogc3RhdGljIHZvaWQgcG11X3NiaV9jdHJfc3RvcChzdHJ1Y3QgcGVy
Zl9ldmVudCAqZXZlbnQsIHVuc2lnbmVkIGxvbmcgZmxhZykKQEAgLTU1NCw4ICs1NTMsNyBAQCBz
dGF0aWMgdm9pZCBwbXVfc2JpX2N0cl9zdG9wKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwgdW5z
aWduZWQgbG9uZyBmbGFnKQogCiAJaWYgKChod2MtPmZsYWdzICYgUEVSRl9FVkVOVF9GTEFHX1VT
RVJfQUNDRVNTKSAmJgogCSAgICAoaHdjLT5mbGFncyAmIFBFUkZfRVZFTlRfRkxBR19VU0VSX1JF
QURfQ05UKSkKLQkJb25fZWFjaF9jcHVfbWFzayhtbV9jcHVtYXNrKGV2ZW50LT5vd25lci0+bW0p
LAotCQkJCSBwbXVfc2JpX3Jlc2V0X3Njb3VudGVyZW4sICh2b2lkICopZXZlbnQsIDEpOworCQlw
bXVfc2JpX3Jlc2V0X3Njb3VudGVyZW4oKHZvaWQgKilldmVudCk7CiAKIAlyZXQgPSBzYmlfZWNh
bGwoU0JJX0VYVF9QTVUsIFNCSV9FWFRfUE1VX0NPVU5URVJfU1RPUCwgaHdjLT5pZHgsIDEsIGZs
YWcsIDAsIDAsIDApOwogCWlmIChyZXQuZXJyb3IgJiYgKHJldC5lcnJvciAhPSBTQklfRVJSX0FM
UkVBRFlfU1RPUFBFRCkgJiYKLS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
