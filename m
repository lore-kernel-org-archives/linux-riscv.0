Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6DDC54E66
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zXg+MyWaeYMapKuyVYP3vW9vgfLhOtbCh9rp5iFoAKo=; b=PpTZlVVxBCqhaj
	jtWu9hum9qDBEQsm0dZEye40IvnWrXjaobiwoYg/zJiFZP9g5rS3QnoTEwM+JfzZ+3fz8rrViBRLf
	KKSlH1mk4cQ/sPUHMw9lD0JVKwO7o0Jy6lv99Ix61fPGs6bi8nVs7AlZakbYJfIB9L3Hmuh6IPzqB
	RlzvDNsVRyAJpWrfk6lxRoszWXGgmt3cylFliHxBlSlASfQTvkRph58Dn7BDkPEtOCBmWofPDQt3M
	IJbLFeukxtcyVXf8gryTpP106j7glS/HoGB61mm/MIDlB0KsOqWpjuUVwYNDuFQaJpdWFnArIpwQu
	hUOcul+qS+00/IBuEA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk86f-00000007LZt-2m5l;
	Tue, 12 Mar 2024 19:48:13 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk86N-00000007LTp-38dh
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 19:47:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6da202aa138so3890445b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710272874; x=1710877674; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zXPeuy0/BW9yxNC4xB8sCNAgbx5dW6dIXCmDi0B+vZE=;
        b=jQ/WZpGnC1mvrUp0o8MIF+jydfzHqS1rHRNzmwI5ox7NHUmVFFpdwbjyEFmckdMldo
         gALs1vBfSXADbf4QvNrhDB2rskxCrd4+wRXuHP7lcaojY8FnLNOxCDHd8CusVFYcjWk8
         xWIxMaKtbSxpNnzBe2IG5CPm5KUgRF2zlEZvlQsltQZ5rpecccbwXDuoQqBmHqwxeumv
         TbaaQP9A6R+AeevdMbFpaZ6UPInJScNnDLaBRD3JrztpCaIlCiN2UTUmnEQTgU+iPKGI
         zV786pBBniTZUTn5azBC7a3n4WdNT0ljijtjmecateksWwzEqw+nu1EHpaTdmPWmb6XU
         R6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710272874; x=1710877674;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXPeuy0/BW9yxNC4xB8sCNAgbx5dW6dIXCmDi0B+vZE=;
        b=kO8XXkQ/HobsUWrZkjWWZd+tMUpwKKnXXPQHs20Oy0MynrrYU9I3LEfOXK44Jb7mZ9
         PVOCg4yF0fMVV7Sx7G8GrsCItBPuISBO/o+XIMwiohzjor/spLwTBGP7fTPYwCorYUGN
         P4BhYEakfGENkK7Jnw8Qt2vDzTINDDEu6iqrRUe8QgecjSuL+W6HWsxOwEVgAZc5L/d8
         cs4/OenNB/OGG20VOQ0jy0UN6IrER2rYmNH6WLvtrqmp2PUHdKOGhIVnv72mgIWoJ/sO
         +uHzOrZSvMnPHvNvA+8pvRq9p0Cfa+7GzJeki5fI6/Y5215n5qgDg4gGoXUZ+M03erQZ
         bc7A==
X-Gm-Message-State: AOJu0Yzd+wqTisXKTer2SWTeuiwofvYOidoLSFOvIeB5re2PJNk4ENsE
	LkUlNbmJYDSoVaTIjX+84l+PAgr9fCKCm0pLIQ+FvfkLj4vkugmstnlr9QuIHXs=
X-Google-Smtp-Source: AGHT+IGX+D68w3x0dx2Z04bccP2/LvAA03/ZVesfCrUprbQXweWUXCgMYw858hcbQuhpxX/TUksKjg==
X-Received: by 2002:a05:6a00:4fcb:b0:6e6:98c2:aa5f with SMTP id le11-20020a056a004fcb00b006e698c2aa5fmr521086pfb.10.1710272872891;
        Tue, 12 Mar 2024 12:47:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z69-20020a633348000000b005dc884e9f5bsm6433495pgz.38.2024.03.12.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 12:47:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v12 0/4] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Tue, 12 Mar 2024 12:47:50 -0700
Message-Id: <20240312-fencei-v12-0-0f340f004ce7@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGax8GUC/23Sy07EIBQG4FeZdG3N+Q9QqCvfw7goN4eF7aQ1j
 WYy7y6dOC0xLCF8/7mEa7OEOYWleTldmzmsaUnTmA/gp1PjzsP4Edrk80XDxAKAbmMYXUht7GN
 HXhsZB2ry48scYvq+J7295/M5LV/T/HMPXrHd/kUwPyJWtNTa4MgAzjL4dU7rtKTRPbvps9lSV
 i6koF1yluxsx2KwsIgVKQ7JELsUW02toAwLE6yuSPmQkkD7wKvM0ksXOdqelBcVqUppdqmyHAY
 EBa+ZudZtV8p+l12WJIEuWymVq0hdSBy71VlqE6mDDPCWKtKUstulyVKKQeatyUiMiuwLycdu+
 60mcrs2BuN1TYJKKo+vQNuOWPUaUQqCr1kclotRsf2jAME6sooB/2e93W6/1CkogegCAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710272871; l=3671;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=293duvTiTO7AmusJrssuEGh1xmveyH0tjDRqNUMHyLo=;
 b=xtuAngWCeGAUg9P52pp2yKzuuAbwPl3UJib33NKZU/1Dxerz2QYNQ7V4pB0PfDVTXyJyWLZcr
 JdYKO22UIY/BwTV0UJIuKkwFOrt/GGw9lXiuE63FO7OGqMH57tfX1XX
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_124755_894670_66408E72 
X-CRM114-Status: GOOD (  10.79  )
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

SW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgaWNhY2hlIGZsdXNoaW5nIGJ5IGNyZWF0aW5nIGEg
bmV3IHByY3RsIGZsYWcKUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFguIFRoZSBpbnRlcmZh
Y2UgaXMgbGVmdCBnZW5lcmljIHRvIGFsbG93CmZvciBmdXR1cmUgZXhwYW5zaW9ucyBzdWNoIGFz
IHdpdGggdGhlIHByb3Bvc2VkIEogZXh0ZW5zaW9uIFsxXS4KCkRvY3VtZW50YXRpb24gaXMgYWxz
byBwcm92aWRlZCB0byBleHBsYWluIHRoZSB1c2UgY2FzZS4KClBhdGNoIHNlbnQgdG8gYWRkIFBS
X1JJU0NWX1NFVF9JQ0FDSEVfRkxVU0hfQ1RYIHRvIG1hbi1wYWdlcyBbMl0uCgpbMV0gaHR0cHM6
Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWotZXh0ZW5zaW9uClsyXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tYW4vMjAyNDAxMjQtZmVuY2VpX3ByY3RsLXYxLTEtMGJkZGFmY2VmMzMx
QHJpdm9zaW5jLmNvbQoKU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjEyOgotIFVzZSBjb250ZXh0LmljYWNoZV9zdGFs
ZV9tYXNrIGluc3RlYWQgb2YgdGhyZWFkLmljYWNoZV9zdGFsZV9tYXNrIGluCiAgUFJfUklTQ1Zf
Q1RYX1NXX0ZFTkNFSV9PRkYgKFNhbXVlbCkKLSBMaW5rIHRvIHYxMTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI0MDIxMi1mZW5jZWktdjExLTAtZTEzMjdmMjVmZTEwQHJpdm9zaW5jLmNv
bQoKQ2hhbmdlcyBpbiB2MTE6Ci0gQWRkIGJhY2sgUFJfUklTQ1ZfQ1RYX1NXX0ZFTkNFSV9PRkYg
KFNhbXVlbCkKLSBGaXggdW5kZXIgbm9zbXAgKFNhbXVlbCkKLSBDaGFuZ2Ugc2V0X3ByZXZfY3B1
IChTYW11ZWwpCi0gRml4dXAgZXhhbXBsZSB0ZXN0Y2FzZSBpbiBkb2NzCi0gQ2hhbmdlIHdvcmRp
bmcgb2YgZG9jdW1lbnRhdGlvbiBzbGlnaHRseSAoQWxlamFuZG9yIENvbG9tYXIpCi0gTGluayB0
byB2MTA6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMjQtZmVuY2VpLXYxMC0wLWEy
NTk3MWY0MzAxZEByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjEwOgotIEZpeCBmZW5jZS5pIGNv
bmRpdGlvbiB0byBwcm9wZXJseSBvbmx5IGZsdXNoIG9uIG1pZ3JhdGlvbiAoQWxleCkKLSBGaXgg
ZG9jdW1lbnRhdGlvbiB3b3JkaW5nIChBbGV4KQotIExpbmsgdG8gdjk6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNDAxMjMtZmVuY2VpLXY5LTAtNzE0MTFiZmU4ZDcxQHJpdm9zaW5jLmNv
bQoKQ2hhbmdlcyBpbiB2OToKLSBSZW1vdmUgcHJldl9jcHUgZnJvbSBtbSAoQWxleCkKLSBMaW5r
IHRvIHY4OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTE2LWZlbmNlaS12OC0wLTQz
YTQyMTM0ZjAyMUByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjg6Ci0gT25seSBmbHVzaCBpY2Fj
aGUgaWYgbWlncmF0ZWQgdG8gZGlmZmVyZW50IGNwdSAoQWxleCkKLSBNb3ZlIGZsdXNoaW5nIHRv
IHN3aXRjaF90byB0byBjYXRjaCBwZXItdGhyZWFkIGZsdXNoaW5nIHByb3Blcmx5Ci0gTGluayB0
byB2NzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDExMi1mZW5jZWktdjctMC03OGYw
NjE0ZTFkYjBAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY3OgotIENoYW5nZSAicGVyX3RocmVh
ZCIgcGFyYW1ldGVyIHRvICJzY29wZSIgYW5kIHByb3ZpZGUgY29uc3RhbnRzIGZvciB0aGUKICBw
YXJhbWV0ZXIuCi0gTGluayB0byB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDEw
OS1mZW5jZWktdjYtMC0wNDExNmU1MTQ0NWNAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY2Ogot
IEZpeHVwIGRvY3VtZW50YXRpb24gZm9ybWF0dGluZwotIExpbmsgdG8gdjU6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNDAxMDgtZmVuY2VpLXY1LTAtYWExZTUxZDcyMjJmQHJpdm9zaW5j
LmNvbQoKQ2hhbmdlcyBpbiB2NToKLSBNaW5vciBkb2N1bWVudGF0aW9uIGNoYW5nZXMgKFJhbmR5
KQotIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMDctZmVuY2Vp
LXY0LTAtZDRjZjJmYjkwNWQzQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NDoKLSBBZGQgT0ZG
IGZsYWcgdG8gZGlzYWxsb3cgZmVuY2UuaSBpbiB1c2Vyc3BhY2UgKEF0aXNoKQotIEZpeCBkb2N1
bWVudGF0aW9uIGlzc3VlcyAoQXRpc2gpCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDIzMTIxMy1mZW5jZWktdjMtMC1iNzUxNTgyMzhlYjdAcml2b3NpbmMuY29tCgpD
aGFuZ2VzIGluIHYzOgotIENoZWNrIGlmIHZhbHVlIGZvcmNlX2ljYWNoZV9mbHVzaCBzZXQgb24g
dGhyZWFkLCByYXRoZXIgdGhhbiBpbiBtbQogIHR3aWNlIChDbMOpbWVudCkKLSBMaW5rIHRvIHYy
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMTMwLWZlbmNlaS12Mi0wLTJjYjYyM2Fi
MWIxZkByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gRml4IGtlcm5lbC1kb2MgY29tbWVu
dCAoQ29ub3IpCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEy
Mi1mZW5jZWktdjEtMC1iZWMwODExY2IyMTJAcml2b3NpbmMuY29tCgotLS0KQ2hhcmxpZSBKZW5r
aW5zICg0KToKICAgICAgcmlzY3Y6IFJlbW92ZSB1bm5lY2Vzc2FyeSBpcnFmbGFncyBwcm9jZXNz
b3IuaCBpbmNsdWRlCiAgICAgIHJpc2N2OiBJbmNsdWRlIHJpc2N2X3NldF9pY2FjaGVfZmx1c2hf
Y3R4IHByY3RsCiAgICAgIGRvY3VtZW50YXRpb246IERvY3VtZW50IFBSX1JJU0NWX1NFVF9JQ0FD
SEVfRkxVU0hfQ1RYIHByY3RsCiAgICAgIGNwdW1hc2s6IEFkZCBhc3NpZ24gY3B1CgogRG9jdW1l
bnRhdGlvbi9hcmNoL3Jpc2N2L2Ntb2R4LnJzdCB8IDk4ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaW5kZXgucnN0IHwgIDEg
KwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9pcnFmbGFncy5oICB8ICAxIC0KIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vbW11LmggICAgICAgfCAgMiArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oIHwgMTAgKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCB8
IDIzICsrKysrKysrKwogYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMgICAgICAgICB8IDk0ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9tbS9jb250ZXh0
LmMgICAgICAgICAgICB8IDE3ICsrKysrLS0KIGluY2x1ZGUvbGludXgvY3B1bWFzay5oICAgICAg
ICAgICAgfCAxNiArKysrKysrCiBpbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaCAgICAgICAgIHwg
IDYgKysrCiBrZXJuZWwvc3lzLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrCiAxMSBm
aWxlcyBjaGFuZ2VkLCAyNjggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKLS0tCmJhc2Ut
Y29tbWl0OiA2NjEzNDc2ZTIyNWUwOTBjYzlhYWQ0OWJlN2ZhNTA0ZTI5MGRkMzNkCmNoYW5nZS1p
ZDogMjAyMzExMTctZmVuY2VpLWY5ZjYwZDc4NGZhMAotLSAKLSBDaGFybGllCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
