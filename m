Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C2AC7115C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChDynUGIzL56LmrlJWUxdX1FXO4Fnt+P+J4cmF6Zpzw=; b=jmbe8ufm59A5Ui
	vmVvTXf6FyzdDCc2QVOou3qgjFMHrKsPLVo9ePKDpVadm8tq1/fdOKvoGNfQkBBV0NcmbCTdTkSi7
	h75Uu0wKojFUuXlonM4qV2APae93877OGEhNZsEjT4hG6WwjliYp6h/YQjDNDG9diq04h6UrKFTL3
	IraoYfmyaCEdTTum6VdgRuKxyZ30u8TeLArc/G2DeTi+lQ+M2oieYYtC2UIzIUE7aptOU56nlewXi
	Rn2UCvl2DCK8Aet/P290O5pQdKTBXeb4UR+lJu5+7rrfx8pAKIAfyrL/yWErMqBnPNv3Hb9v//FqM
	Uq/VTfcMhrXiD2KnZE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULhg-00000007zn7-2Jyv;
	Wed, 25 Jun 2025 08:42:00 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKv7-00000007s4I-12AT
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 07:51:50 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a524caf77eso933997f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 00:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750837907; x=1751442707; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/1kqXJPNv0gRjI46k/A/EmGeeHWQcmxjkHDa0w7+p0=;
        b=WgTMEy7odgvvfw/u3TUlMha3qBAs+foXDqJN5Wv4orhB4qNGwZBxjXkcRvZr+vgLmI
         /HjtOani/57K4Ill/tf0sNXM2/rfOX317MeWjCCOnGpYN+6krE5MJLyIWCXAvmhxGucV
         FkgV/BlYz7nGJU4W2uj4BS52uP86SsxB/n/G1Yfo8Rfbq5kNFBPzZ8t2OPle6Z3cx2JX
         6Xad2YtKZLK1BM+GCWYhcoatGk6rOntdfH9mypcYTiHeuRt0uKh0Zyu11XQ4ClkOWrbB
         o9+FIQcaRFVadW1uvSOGs7fXqCW8jrMyHvb9hLPO0XMIsHIbiZ9PZCCzSGX3RnK3C0Ra
         JYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750837907; x=1751442707;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0/1kqXJPNv0gRjI46k/A/EmGeeHWQcmxjkHDa0w7+p0=;
        b=toFrJhyym4Qf6VVlFq7RSvmttpqA2omcQvszzmHozDxH1tGhONm7hwTTpLi57jJDwz
         cJQXXa6rzcPdjf/6om2HtwVwcz4GDcrbz7SZa9+BcXafWUyikS1EZ+ZD/hv4TJgypRqO
         FDux90DeZVCC9swjMIRSTQLRGsjfaMUNAuuQ/JUgOhcGp8NXIgGdJK3EwJsRG7K3OtIn
         /3hy76LhPN2Vtiy2xPoOllGjGJWmCExa6yWr8FClaUei+vu5uELB87VoWxwPPx7qZaG0
         53EtuDsMO9tt7aSBkACbYcclmG/g+lYc4pz9L9xLU89pi9wwnNGj8u2wxAAPQEOEWhpB
         X4cA==
X-Gm-Message-State: AOJu0Yy5QWOiDGPcnXqoBDGykiky78uadWZYVqZatJ2wSlc/zbChEMbd
	lSP/DZVGKZi4ArQl3DqQ3SWvWxqZFmr+EGxDDFW86DH7AeP1NY5eGXgBtibPgfsRW7g=
X-Gm-Gg: ASbGncuqklE/l77ttQXU6EPrBM5P2uQy8Ru4x8YHXRWnE/KBppxGhNkDDoxqY8ms/ZX
	rE/j7gcq9tFN2CjN9GHL7WjuPGvJ8MSSmcQqq40tSxArLa/R6gyAr/WhvluRNqDTAUNbob+OYEJ
	NFr095jIHZu5fVIkUFryHqP12RXB7tRE5Tj3+3by522RxH3xymf8iX9FxKizh9LnwizCXUD1pGE
	I6VievBQgX0LpCMBWbp2EHy7HeCp946lmDiBwem4lbMqPofskhpseHkYogFAGyIK7S2ho7iH+9z
	MhMfXTP/QSLbkL/ruWWuf1BiyZ30VcGqfng2+FfzvGP3KEJS2p4fiewv6MWM0xF0IeoKEkZaZFB
	q1MYB6jOG6xqSAyj263U4Cg==
X-Google-Smtp-Source: AGHT+IF/TkpC3NlD/HMifpack2QrokmF522u7Xr5D13/dT5pwOLN83NtG9UoEcLzCyYMeIfkeQYZhg==
X-Received: by 2002:a05:6000:410d:b0:3a5:7875:576 with SMTP id ffacd0b85a97d-3a6ed60db76mr384507f8f.1.1750837907380;
        Wed, 25 Jun 2025 00:51:47 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f27a8sm3859432f8f.56.2025.06.25.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:51:46 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 25 Jun 2025 09:51:45 +0200
Message-Id: <DAVG8M70SJ4Q.ZSTC5VSJWGSK@ventanamicro.com>
Subject: Re: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>,
 <david.laight.linux@gmail.com>, "Jeff Law" <jlaw@ventanamicro.com>
To: "Palmer Dabbelt" <palmer@dabbelt.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
 <mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
 <DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>
In-Reply-To: <DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_005149_287479_DD0842F2 
X-CRM114-Status: GOOD (  11.53  )
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

MjAyNS0wNi0yNFQxNTowOTowOSswMjowMCwgUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRh
bmFtaWNyby5jb20+Ogo+IEZvciBhbm90aGVyIGV4YW1wbGUsIGxldCdzIGhhdmUgdGhlIGZvbGxv
d2luZyBmdW5jdGlvbjoKPgo+ICAgc3RydWN0IHNiaXJldCBzb21lX3NiaV9lY2FsbCh1aW50cHRy
X3QgYTAsIHVpbnRwdHJfdCBhMSkKPiAgIHsKPiAgICAgcmV0dXJuIHNiaV9lY2FsbCgxMjMsIDQ1
NiwgYTAsIGExKTsKPiAgIH0KPgo+IFRoZSBkaXNhc3NlbWJseSB3aXRob3V0IHRyYWNlcG9pbnRz
ICh3aXRoIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyKToKPiAoSXQgY291bGQgaGF2ZSBiZWVuIGp1
c3QgImxpO2xpO2VjYWxsO3JldCIgd2l0aG91dCBmcmFtZSBwb2ludGVyLikKPgo+ICAgIDB4ZmZm
ZmZmZmY4MDAxNmQ0OCA8KzA+OglhZGRpCXNwLHNwLC0xNgo+ICAgIDB4ZmZmZmZmZmY4MDAxNmQ0
YSA8KzI+OglzZAlyYSw4KHNwKQo+ICAgIDB4ZmZmZmZmZmY4MDAxNmQ0YyA8KzQ+OglzZAlzMCww
KHNwKQo+ICAgIDB4ZmZmZmZmZmY4MDAxNmQ0ZSA8KzY+OglhZGRpCXMwLHNwLDE2Cj4gICAgMHhm
ZmZmZmZmZjgwMDE2ZDUwIDwrOD46CWxpCWE3LDEyMwo+ICAgIDB4ZmZmZmZmZmY4MDAxNmQ1NCA8
KzEyPjoJbGkJYTYsNDU2Cj4gICAgMHhmZmZmZmZmZjgwMDE2ZDU4IDwrMTY+OgllY2FsbAo+ICAg
IDB4ZmZmZmZmZmY4MDAxNmQ1YyA8KzIwPjoJbGQJcmEsOChzcCkKPiAgICAweGZmZmZmZmZmODAw
MTZkNWUgPCsyMj46CWxkCXMwLDAoc3ApCj4gICAgMHhmZmZmZmZmZjgwMDE2ZDYwIDwrMjQ+Oglh
ZGRpCXNwLHNwLDE2Cj4gICAgMHhmZmZmZmZmZjgwMDE2ZDYyIDwrMjY+OglyZXQKPgo+IFsgUmVt
b3ZlZCBwcmV2aW91cyBkaXNhc3NlbWJseSB3aXRoIHRyYWNlcG9pbnRzLiBdCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSSds
bCB0cnkKPiBhZ2FpbiB3aXRoIEdDQyAxNS4xLCBhbmQgZ2V0IGJhY2sgaWYgaXQgYWN0dWFsbHkg
aW1wcm92ZXMgdGhlIHNpdHVhdGlvbi4KCkdDQyAxNS4xIHN0aWxsIGxlYXZlcyAibXYiIG91dHNp
ZGUgdGhlIGJyYW5jaCwgYnV0IGF0IGxlYXN0IHNlZW1zIHRvIGJlCm9uIHRoZSByaWdodCB0cmFj
ayAodW5kZXNpcmVkIG92ZXJoZWFkIGlzIG1hcmtlZCB3aXRoIGxlYWRpbmcgc3RhcnMpOgoKICAg
MHhmZmZmZmZmZjgwMDIzNmU4IDwrMD46CWFkZGkJc3Asc3AsLTQ4CiAgIDB4ZmZmZmZmZmY4MDAy
MzZlYSA8KzI+OglzZAlzMCwzMihzcCkKICAgMHhmZmZmZmZmZjgwMDIzNmVjIDwrND46CXNkCXJh
LDQwKHNwKQogICAweGZmZmZmZmZmODAwMjM2ZWUgPCs2PjoJYWRkaQlzMCxzcCw0OAoqICAweGZm
ZmZmZmZmODAwMjM2ZjAgPCs4PjoJbXYJYTQsYTAKKiAgMHhmZmZmZmZmZjgwMDIzNmYyIDwrMTA+
OgltdglhNSxhMQogICAweGZmZmZmZmZmODAwMjM2ZjQgPCsxMj46CW5vcAoqICAweGZmZmZmZmZm
ODAwMjM2ZjggPCsxNj46CW12CWEwLGE0CiogIDB4ZmZmZmZmZmY4MDAyMzZmYSA8KzE4PjoJbXYJ
YTEsYTUKICAgMHhmZmZmZmZmZjgwMDIzNmZjIDwrMjA+OglsaQlhNywxMjMKICAgMHhmZmZmZmZm
ZjgwMDIzNzAwIDwrMjQ+OglsaQlhNiw0NTYKICAgMHhmZmZmZmZmZjgwMDIzNzA0IDwrMjg+Ogll
Y2FsbAoqICAweGZmZmZmZmZmODAwMjM3MDggPCszMj46CW12CWE1LGEwCiogIDB4ZmZmZmZmZmY4
MDAyMzcwYSA8KzM0PjoJbXYJYTIsYTEKICAgMHhmZmZmZmZmZjgwMDIzNzBjIDwrMzY+Oglub3AK
ICAgMHhmZmZmZmZmZjgwMDIzNzEwIDwrNDA+OglsZAlyYSw0MChzcCkKICAgMHhmZmZmZmZmZjgw
MDIzNzEyIDwrNDI+OglsZAlzMCwzMihzcCkKKiAgMHhmZmZmZmZmZjgwMDIzNzE0IDwrNDQ+Oglt
dglhMCxhNQoqICAweGZmZmZmZmZmODAwMjM3MTYgPCs0Nj46CW12CWExLGEyCiAgIDB4ZmZmZmZm
ZmY4MDAyMzcxOCA8KzQ4PjoJYWRkaQlzcCxzcCw0OAogICAweGZmZmZmZmZmODAwMjM3MWEgPCs1
MD46CXJldAogICBbVHJhY2luZyBnb2VzIHRvICsxMjZdCgpJIHJlYWxpemVkIEkgaGFkIHRoZSBl
bnZpcm9ubWVudCBjb25maWd1cmVkIGZvciBjbGFuZyBpbiB0aGUgbGFzdCBtYWlsLApzbyBoZXJl
IGlzIGFjdHVhbCBHQ0MgMTQuMywgd2hpY2ggYWxzbyBzcGlsbHMgaW4gdGhlIHByb2xvZ3VlOgoK
ICAgMHhmZmZmZmZmZjgwMDIzMzYwIDwrMD46CWFkZGkJc3Asc3AsLTQ4CiAgIDB4ZmZmZmZmZmY4
MDAyMzM2MiA8KzI+OglzZAlzMCwzMihzcCkKKiAgMHhmZmZmZmZmZjgwMDIzMzY0IDwrND46CXNk
CXMxLDI0KHNwKQoqICAweGZmZmZmZmZmODAwMjMzNjYgPCs2PjoJc2QJczIsMTYoc3ApCiAgIDB4
ZmZmZmZmZmY4MDAyMzM2OCA8Kzg+OglzZAlyYSw0MChzcCkKICAgMHhmZmZmZmZmZjgwMDIzMzZh
IDwrMTA+OglhZGRpCXMwLHNwLDQ4CiogIDB4ZmZmZmZmZmY4MDAyMzM2YyA8KzEyPjoJbXYJczIs
YTAKKiAgMHhmZmZmZmZmZjgwMDIzMzZlIDwrMTQ+OgltdglzMSxhMQogICAweGZmZmZmZmZmODAw
MjMzNzAgPCsxNj46CW5vcAoqICAweGZmZmZmZmZmODAwMjMzNzQgPCsyMD46CW12CWEwLHMyCiog
IDB4ZmZmZmZmZmY4MDAyMzM3NiA8KzIyPjoJbXYJYTEsczEKICAgMHhmZmZmZmZmZjgwMDIzMzc4
IDwrMjQ+OglsaQlhNywxMjMKICAgMHhmZmZmZmZmZjgwMDIzMzdjIDwrMjg+OglsaQlhNiw0NTYK
ICAgMHhmZmZmZmZmZjgwMDIzMzgwIDwrMzI+OgllY2FsbAoqICAweGZmZmZmZmZmODAwMjMzODQg
PCszNj46CW12CXMyLGEwCiogIDB4ZmZmZmZmZmY4MDAyMzM4NiA8KzM4PjoJbXYJczEsYTEKICAg
MHhmZmZmZmZmZjgwMDIzMzg4IDwrNDA+Oglub3AKICAgMHhmZmZmZmZmZjgwMDIzMzhjIDwrNDQ+
OglsZAlyYSw0MChzcCkKICAgMHhmZmZmZmZmZjgwMDIzMzhlIDwrNDY+OglsZAlzMCwzMihzcCkK
KiAgMHhmZmZmZmZmZjgwMDIzMzkwIDwrNDg+OgltdglhMCxzMgoqICAweGZmZmZmZmZmODAwMjMz
OTIgPCs1MD46CW12CWExLHMxCiogIDB4ZmZmZmZmZmY4MDAyMzM5NCA8KzUyPjoJbGQJczIsMTYo
c3ApCiogIDB4ZmZmZmZmZmY4MDAyMzM5NiA8KzU0PjoJbGQJczEsMjQoc3ApCiAgIDB4ZmZmZmZm
ZmY4MDAyMzM5OCA8KzU2PjoJYWRkaQlzcCxzcCw0OAogICAweGZmZmZmZmZmODAwMjMzOWEgPCs1
OD46CXJldAogICBbVHJhY2luZyBnb2VzIHRvICsxMDhdCgpBbmQgY2xhbmcgaW4gdGhlIGxhc3Qg
bWFpbCBpbmxpbmVkIHRoZSB0cmFjZXBvaW50cywgYmVjYXVzZSBJIHB1dCB0aGUKZXhhbXBsZSBm
dW5jdGlvbiBpbiBzYmlfZWNhbGwuYywgd2hpY2ggYmxvYXRlZCB0aGUgdHJhY2luZyBzbG93cGF0
aCwgYW5kCnNwaWxsZWQgb25lIG1vcmUgcmVnaXN0ZXIgdGhhbiBuZWVkZWQuCldpdGggdGhlIGZ1
bmN0aW9uIGluIHNiaS5jLCB0byBiZXR0ZXIgc2ltdWxhdGUgYWN0dWFsIHVzZSAoZ2NjIGV4YW1w
bGVzCmFyZSBhbHJlYWR5IGRvaW5nIHRoaXMpLCBjbGFuZyAyMC4xLjYgYW5kIDE5LjEuNyBkbzoK
CiAgIDB4ZmZmZmZmZmY4MDAxNmYwOCA8KzA+OglhZGRpCXNwLHNwLC0zMgogICAweGZmZmZmZmZm
ODAwMTZmMGEgPCsyPjoJc2QJcmEsMjQoc3ApCiAgIDB4ZmZmZmZmZmY4MDAxNmYwYyA8KzQ+Oglz
ZAlzMCwxNihzcCkKKiAgMHhmZmZmZmZmZjgwMDE2ZjBlIDwrNj46CXNkCXMxLDgoc3ApCiogIDB4
ZmZmZmZmZmY4MDAxNmYxMCA8Kzg+OglzZAlzMiwwKHNwKQogICAweGZmZmZmZmZmODAwMTZmMTIg
PCsxMD46CWFkZGkJczAsc3AsMzIKICAgMHhmZmZmZmZmZjgwMDE2ZjE0IDwrMTI+Oglub3AKICAg
MHhmZmZmZmZmZjgwMDE2ZjE4IDwrMTY+OglsaQlhNywxMjMKICAgMHhmZmZmZmZmZjgwMDE2ZjFj
IDwrMjA+OglsaQlhNiw0NTYKICAgMHhmZmZmZmZmZjgwMDE2ZjIwIDwrMjQ+OgllY2FsbAogICAw
eGZmZmZmZmZmODAwMTZmMjQgPCsyOD46CW5vcAogICAweGZmZmZmZmZmODAwMTZmMjggPCszMj46
CWxkCXJhLDI0KHNwKQogICAweGZmZmZmZmZmODAwMTZmMmEgPCszND46CWxkCXMwLDE2KHNwKQoq
ICAweGZmZmZmZmZmODAwMTZmMmMgPCszNj46CWxkCXMxLDgoc3ApCiogIDB4ZmZmZmZmZmY4MDAx
NmYyZSA8KzM4PjoJbGQJczIsMChzcCkKICAgMHhmZmZmZmZmZjgwMDE2ZjMwIDwrNDA+OglhZGRp
CXNwLHNwLDMyCiAgIDB4ZmZmZmZmZmY4MDAxNmYzMiA8KzQyPjoJcmV0CiAgIFtUcmFjaW5nIGdv
ZXMgdG8gKzk0XQoKV2hlbiBjb21wYXJlZCB0byBHQ0MgMTUuMSwgY2xhbmcgc3BpbGxzIGluIHRo
ZSBwcm9sb2d1ZSwgYnV0IGRvZXNuJ3QKc3RvcmUgYXJvdW5kIHRoZSBzdGF0aWMgYnJhbmNoIHNp
dGVzLiAgVGhlIG9wdGltYWwgcmVzdWx0IHdvdWxkIGJlIGEKY29tYmluYXRpb24gb2Ygd2hhdCBj
bGFuZyBhbmQgR0NDIDE1LjEgZG8gKGNvZGUgd2l0aG91dCBhbnkgc3RhcnMpLgoKV2hlbiBJIGxv
b2tlZCBhdCByZWFsIGNvZGUgc2FtcGxlcywgdGhlIGJlaGF2aW9yIHdhcyByb3VnaGx5IHNpbWls
YXIuCkdDQyBqdXN0IHdhc24ndCBhbHdheXMgcGxhY2luZyB0aGUgIm12InMgYXMgb2J2aW91c2x5
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
