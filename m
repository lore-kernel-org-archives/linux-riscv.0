Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09ABC001DF
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Oct 2023 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WN1EjkhRX0+nA+pVcN8RXYEYK0pGom/AOiCe2yJyfCw=; b=Q3G7rPkeaZINKd
	/MRJPvrfwzAoMNKCv5ZCx0RVoPJs2GKQf+jYGq8zjeqINONDw/KjRJM23PQQdgQyoGnHKcp/l3Aiv
	ZlGjTzb/pgQ/zO1B9D5cNdp0vNU0YzIFdH4GzOAnvKpF3iRLQiznhVkvUIVN/z5mEeyBQkzmvWJBu
	nMw0paz/Jaz/GdsA4cUvuDG1PY7tve3rQJitNIkylkPbco3LkaKlhQ3hC85E7bOFF0tchhyOZHBh8
	C9zy/5WxuAmUZkjajzyeEUJRC958s/snw1bxUH71AWbzvYXqS6ybVa/mXG/ihGEhUhqu2CJEoBSSn
	mXQWJR5Q3KlftY2djI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quZf1-005ZDG-0U;
	Sun, 22 Oct 2023 14:42:35 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quZex-005ZCV-34
	for linux-riscv@lists.infradead.org;
	Sun, 22 Oct 2023 14:42:33 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so31962651fa.3
        for <linux-riscv@lists.infradead.org>; Sun, 22 Oct 2023 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697985748; x=1698590548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2jxN58Rd50B5qNlzzl+HgDNo1YZPDCqE37ZPo/QrR8=;
        b=W2NQFze/0Ey5zUwPSiBuQyyJvNirJ0HZCWg8Hhpz35qI5MTnMllqRTPGc/tek7IY+L
         QzzDJvoCs53qoQV+Rm5C05osn7/s2sg4xybR8RUgs3Nr7tg/DaTVMrmbpa1TkkGfsbvK
         zHKusX+Ov1siicmEtQAwZ8HJKzUQB6f1DK/056pl352oX0AhZiQ9VWB60HGtlu3GnsKJ
         5TxrMI5Fy+CUu7jJgdff1k+BsWSs6UlJ297eZUQF011BSnGD13Z32ApLmvoUo0GBnPmr
         bxwqkSO59EErB39OzPZ7byLNN2NDg1dtKVw3sdoINXDkYhHQHQHHOm/4gb9NYKEm34JB
         +2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697985748; x=1698590548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2jxN58Rd50B5qNlzzl+HgDNo1YZPDCqE37ZPo/QrR8=;
        b=dIBpnxEcT6hgep+Y+5QWQA7/mY1aV05QNIr4D3ju5DP/6mruPcO1VhrEnb4yhR5nj3
         MBJXkoQk2kg22OMSOIXxrCImTDMIB+0j7GsGNNMGCqnBmE8Qd1LICk9gdOVlH/xnoj+y
         hNzlES+4KQMOjmavHxEyVuiiKxKwoiamOBcUicUdVfuPfl2JPPgP2vNYZBspqkUOXvOr
         AmHvHXYm8I5ZAof9fo2YXp/ZhbEe2jkCFVoMAVjpPLjiHhQBKhQD85fuHBM+0RdkMlMo
         nR6+i+x3p0vH9B3eiWobr8G1gMFBaX4dj7r62X2LC3ikuZnwOIgWiRQHNvjWgCjvPeFS
         cuEQ==
X-Gm-Message-State: AOJu0YyzEx5wxjPEGY9vs2r74VXMQOBOMFm90SK2xcjSydlTsB93urNG
	63jXUNHeyg+nVzS029JIpiwYYA==
X-Google-Smtp-Source: AGHT+IF4DjTi8VI5kLF6HbYNHbRd4ens1x/g/+IRCor29hYZcgSeulBALYpy478UxCsdxjTinUPj5w==
X-Received: by 2002:a05:651c:1025:b0:2c0:1bf9:3c94 with SMTP id w5-20020a05651c102500b002c01bf93c94mr4262023ljm.50.1697985748380;
        Sun, 22 Oct 2023 07:42:28 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id iv15-20020a05600c548f00b00405c7591b09sm7115935wmb.35.2023.10.22.07.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 07:42:27 -0700 (PDT)
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH -fixes] drivers: perf: Do not broadcast to other cpus when starting a counter
Date: Sun, 22 Oct 2023 16:42:20 +0200
Message-Id: <20231022144220.109469-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_074231_987220_5519B83C 
X-CRM114-Status: GOOD (  10.67  )
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
dm9zaW5jLmNvbT4KLS0tCiBkcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jIHwgNiArKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9w
bXVfc2JpLmMKaW5kZXggOTZjN2Y2NzBjOGYwLi40MzlkYTQ5ZGQwYTkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYwpAQCAtNTQzLDggKzU0Myw3IEBAIHN0YXRpYyB2b2lkIHBtdV9zYmlfY3RyX3N0YXJ0KHN0
cnVjdCBwZXJmX2V2ZW50ICpldmVudCwgdTY0IGl2YWwpCiAKIAlpZiAoKGh3Yy0+ZmxhZ3MgJiBQ
RVJGX0VWRU5UX0ZMQUdfVVNFUl9BQ0NFU1MpICYmCiAJICAgIChod2MtPmZsYWdzICYgUEVSRl9F
VkVOVF9GTEFHX1VTRVJfUkVBRF9DTlQpKQotCQlvbl9lYWNoX2NwdV9tYXNrKG1tX2NwdW1hc2so
ZXZlbnQtPm93bmVyLT5tbSksCi0JCQkJIHBtdV9zYmlfc2V0X3Njb3VudGVyZW4sICh2b2lkICop
ZXZlbnQsIDEpOworCQlwbXVfc2JpX3NldF9zY291bnRlcmVuKCh2b2lkICopZXZlbnQpOwogfQog
CiBzdGF0aWMgdm9pZCBwbXVfc2JpX2N0cl9zdG9wKHN0cnVjdCBwZXJmX2V2ZW50ICpldmVudCwg
dW5zaWduZWQgbG9uZyBmbGFnKQpAQCAtNTU0LDggKzU1Myw3IEBAIHN0YXRpYyB2b2lkIHBtdV9z
YmlfY3RyX3N0b3Aoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50LCB1bnNpZ25lZCBsb25nIGZsYWcp
CiAKIAlpZiAoKGh3Yy0+ZmxhZ3MgJiBQRVJGX0VWRU5UX0ZMQUdfVVNFUl9BQ0NFU1MpICYmCiAJ
ICAgIChod2MtPmZsYWdzICYgUEVSRl9FVkVOVF9GTEFHX1VTRVJfUkVBRF9DTlQpKQotCQlvbl9l
YWNoX2NwdV9tYXNrKG1tX2NwdW1hc2soZXZlbnQtPm93bmVyLT5tbSksCi0JCQkJIHBtdV9zYmlf
cmVzZXRfc2NvdW50ZXJlbiwgKHZvaWQgKilldmVudCwgMSk7CisJCXBtdV9zYmlfc2V0X3Njb3Vu
dGVyZW4oKHZvaWQgKilldmVudCk7CiAKIAlyZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9QTVUsIFNC
SV9FWFRfUE1VX0NPVU5URVJfU1RPUCwgaHdjLT5pZHgsIDEsIGZsYWcsIDAsIDAsIDApOwogCWlm
IChyZXQuZXJyb3IgJiYgKHJldC5lcnJvciAhPSBTQklfRVJSX0FMUkVBRFlfU1RPUFBFRCkgJiYK
LS0gCjIuMzkuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
