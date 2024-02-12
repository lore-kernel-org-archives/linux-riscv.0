Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2FDC4829D
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zNIiTW8MFMqCJOXoHrvglx7VFakpLi+WZHdE0TxFiMk=; b=MvEd3PdYNsIv5z
	GgrX0eZ+uIYrypQrQDpDckKuYmuMmITqv/Wb73TvSRy5MKUKusLK35sjXejeWFFbdMvO5r/X8s+Tn
	Fq4/ZdG6y1vnd98fW9FUqkYI9cPu+srnMzO0GkpufCUUluhVPNP6qpOVfNXlbXXIBU0JVEkOXaeEP
	HvM8FSrvnm673WKd2cCeaDAWZNfRRPsDThHjp1n3Zb47o0oVfxs5cD4K/4RMe0QM4O3lcNiRsid/I
	zH+9UPqhur3tc7m300+qsfZKDmdi3SiAi7SH/cbfJIZozw8r4qgKrFQIkC8CQg4Da30Hbl4NQgXtg
	GY3JNgd5D926hqtGgy7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfqo-00000007Ia6-2TCj;
	Mon, 12 Feb 2024 23:36:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZfqi-00000007IVO-4AVi
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 23:36:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d953fa3286so29277225ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 15:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707780991; x=1708385791; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oNioNdguCz5tyqf3w8SAJg3WWFu/ZpF1hV12mYbLuZw=;
        b=DDE60NKdPhS4TAnWKXfDT4Hwt6CfulwGKrd5NXVXvP+wmb3+YE5sLqREZr/VEHtcl/
         stsVcFc9F34EHRHz9gpQEGrzUP9UqbLLriXjP6Gvzd0BB/jfbNRWKG8RFYmlH4RT1MUj
         g5nNGUG7BIqao5i4K4HF2kvV7LTGMh0IdN8a4bu7t6gWEjSoSlcDxsaA6qWgDRPSbInc
         zig6VzKBNzl+7Xl6kWihRSJEXJdSjtrkqcg/LPieLhKfEyGIHq8JTDM9NpWPfrBZpfIh
         T/cDQx+T1iALs6ZUKvcLerj668ek1q3trwZsMJyh9umJX9yFZxRC9FBmSns02oyBN1Da
         oMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707780991; x=1708385791;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNioNdguCz5tyqf3w8SAJg3WWFu/ZpF1hV12mYbLuZw=;
        b=LoyCEjQHqvLh8ikWZkQLJNe06BydRNPCpsISikIPL8aBTDx8l8Vi0G2sxRFhvvlKru
         NgpSizNHIX4tZj8k9DgLFDoMuPF++uDykj5UpJylSfKs007R3djXREfEhntvn5kvZ/YF
         K3zWodnSNYNO0guT+76kFZZxS2jpfVrlHNxQAd8zauhk9+TSqvCGvaTzjTBjJtDFWzUb
         Kmwtm2n/0m+v6VzkNbuFWxXXIPgAzew1I4j3yOBr9wi/c2nyG0tVwoVie8GAHOn5bfPn
         bb8PP5p7Xboi5oRR1ATvcM17XecCJrFD4+6O/7N+udmDOaFbI+83pFldyICA0fnJXHRy
         XI+Q==
X-Gm-Message-State: AOJu0Yz5/Bp2F0SE0OhvlOPb5cIQG8YA2Lu4ohO6tB8KGlhyXsgkkbnJ
	xgCgjeQPYUiPzvisGxt1ilUlIg/AKpkgIC2mZMnuCLz7iyakO4vFSm7tLF7pVKE=
X-Google-Smtp-Source: AGHT+IGlzxazBjxv9RA941+ZHFC2kAe0rM4VKTlBx4LwX5kenDzB6/KnJLHG3CbaBKLMEuWgOEr4pg==
X-Received: by 2002:a17:902:e5ca:b0:1d9:a5ec:30d2 with SMTP id u10-20020a170902e5ca00b001d9a5ec30d2mr11052876plf.12.1707780991294;
        Mon, 12 Feb 2024 15:36:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpvQ/bifwy33zc0j7hfXTIrBarDTDQRSnG6jYoRxhctuzyMpZB6R4vMI76zxbUXHW0cs3V8WLKORH+/uwFPaweDLNxZ7qbduxPCHHp0g7FFkebRIRxtn2bizXbAPcSXa8QVUUu97cm7VTqO4JHVM283X7nKupleVBuXX3tbwbUi8IlEBnYoLbiSp+JhOnGD8VzLBXHn3gVtZ98YrtIhUVagP8HgaUEES4xH8F+9CuDEpfjLP+N/q2901jsLZ9+4IZmDRonnYLIENZ54LTACnJQ9/BheuZoViYtxjyRimNQJyM4fxmdG+920Nh0ZHC0kiYnoZPYtLsiKBcKkrRgH39F49cjZ9FbEyrWwykOK+ncNr596z6qNw24o1R3+Yuu80MZg+QWKMUcCTADenpd1O/lte6A4HetVbCQKl2Byf3z4eDJhGCHuVB6E/Dt08bDCsftsF0=
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902650500b001da153682c5sm888693plk.261.2024.02.12.15.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 15:36:30 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v11 0/4] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Mon, 12 Feb 2024 15:36:25 -0800
Message-Id: <20240212-fencei-v11-0-e1327f25fe10@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHmrymUC/23SS07EMAwG4KuMsqbIdpxHWXEPxKJ5MVnQjlpUg
 UZzd9IR00Yoy1j5fjtWrmKJc46LeDldxRzXvORpLAfEp5Pw52H8iF0OpSAISCKi6VIcfcxd6pO
 GYCynAUS5fJljyt/3pLf3cj7n5Wuaf+7BK27VvwiiR8SKHXQuerCI3hHS65zXacmjf/bTp9hSV
 qqkhF1SkeSdJjk4dJgaUh6SUO5Sbj2NQmVJ2uhMQ/JDMiDsD165yMA+UXI9qCAbUtXS7lIVOQw
 YFQZDRK1pdS37XeoigRF1sczKN6SpJB67NUUam0AjRwwOGtLWUu/SFsly4LI1TkDYkH0l6dhtv
 /XEMq5L0QbTkgg15eMrwLYjUr3BxBIw/LO32+0XwJEEjKwCAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707780989; l=3458;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=pUkJcJN2rctCyQ0hK/qiJS411FCsdKiJii0pjIPLWbg=;
 b=MPwj9l2ctTE9U5PMrkcabg29HVx1LnyHJJ9FmdT2NRt6a6jiZmF+27/ABOvnKjANPSgri2Nzk
 yny/fD+G20bBSrkLd6AMgL81mkbhViWypSaZGxhLbhPl1JRHJHuVKKM
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_153633_244291_4A104B0C 
X-CRM114-Status: GOOD (  10.44  )
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
dm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjExOgotIEFkZCBiYWNrIFBSX1JJU0NWX0NUWF9T
V19GRU5DRUlfT0ZGIChTYW11ZWwpCi0gRml4IHVuZGVyIG5vc21wIChTYW11ZWwpCi0gQ2hhbmdl
IHNldF9wcmV2X2NwdSAoU2FtdWVsKQotIEZpeHVwIGV4YW1wbGUgdGVzdGNhc2UgaW4gZG9jcwot
IENoYW5nZSB3b3JkaW5nIG9mIGRvY3VtZW50YXRpb24gc2xpZ2h0bHkgKEFsZWphbmRvciBDb2xv
bWFyKQotIExpbmsgdG8gdjEwOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTI0LWZl
bmNlaS12MTAtMC1hMjU5NzFmNDMwMWRAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHYxMDoKLSBG
aXggZmVuY2UuaSBjb25kaXRpb24gdG8gcHJvcGVybHkgb25seSBmbHVzaCBvbiBtaWdyYXRpb24g
KEFsZXgpCi0gRml4IGRvY3VtZW50YXRpb24gd29yZGluZyAoQWxleCkKLSBMaW5rIHRvIHY5OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTIzLWZlbmNlaS12OS0wLTcxNDExYmZlOGQ3
MUByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjk6Ci0gUmVtb3ZlIHByZXZfY3B1IGZyb20gbW0g
KEFsZXgpCi0gTGluayB0byB2ODogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDExNi1m
ZW5jZWktdjgtMC00M2E0MjEzNGYwMjFAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY4OgotIE9u
bHkgZmx1c2ggaWNhY2hlIGlmIG1pZ3JhdGVkIHRvIGRpZmZlcmVudCBjcHUgKEFsZXgpCi0gTW92
ZSBmbHVzaGluZyB0byBzd2l0Y2hfdG8gdG8gY2F0Y2ggcGVyLXRocmVhZCBmbHVzaGluZyBwcm9w
ZXJseQotIExpbmsgdG8gdjc6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMTItZmVu
Y2VpLXY3LTAtNzhmMDYxNGUxZGIwQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NzoKLSBDaGFu
Z2UgInBlcl90aHJlYWQiIHBhcmFtZXRlciB0byAic2NvcGUiIGFuZCBwcm92aWRlIGNvbnN0YW50
cyBmb3IgdGhlCiAgcGFyYW1ldGVyLgotIExpbmsgdG8gdjY6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNDAxMDktZmVuY2VpLXY2LTAtMDQxMTZlNTE0NDVjQHJpdm9zaW5jLmNvbQoKQ2hh
bmdlcyBpbiB2NjoKLSBGaXh1cCBkb2N1bWVudGF0aW9uIGZvcm1hdHRpbmcKLSBMaW5rIHRvIHY1
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTA4LWZlbmNlaS12NS0wLWFhMWU1MWQ3
MjIyZkByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjU6Ci0gTWlub3IgZG9jdW1lbnRhdGlvbiBj
aGFuZ2VzIChSYW5keSkKLSBMaW5rIHRvIHY0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjQwMTA3LWZlbmNlaS12NC0wLWQ0Y2YyZmI5MDVkM0ByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4g
djQ6Ci0gQWRkIE9GRiBmbGFnIHRvIGRpc2FsbG93IGZlbmNlLmkgaW4gdXNlcnNwYWNlIChBdGlz
aCkKLSBGaXggZG9jdW1lbnRhdGlvbiBpc3N1ZXMgKEF0aXNoKQotIExpbmsgdG8gdjM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzEyMTMtZmVuY2VpLXYzLTAtYjc1MTU4MjM4ZWI3QHJp
dm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBDaGVjayBpZiB2YWx1ZSBmb3JjZV9pY2FjaGVf
Zmx1c2ggc2V0IG9uIHRocmVhZCwgcmF0aGVyIHRoYW4gaW4gbW0KICB0d2ljZSAoQ2zDqW1lbnQp
Ci0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEzMC1mZW5jZWkt
djItMC0yY2I2MjNhYjFiMWZAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHYyOgotIEZpeCBrZXJu
ZWwtZG9jIGNvbW1lbnQgKENvbm9yKQotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyMzExMjItZmVuY2VpLXYxLTAtYmVjMDgxMWNiMjEyQHJpdm9zaW5jLmNvbQoKLS0t
CkNoYXJsaWUgSmVua2lucyAoNCk6CiAgICAgIHJpc2N2OiBSZW1vdmUgdW5uZWNlc3NhcnkgaXJx
ZmxhZ3MgcHJvY2Vzc29yLmggaW5jbHVkZQogICAgICByaXNjdjogSW5jbHVkZSByaXNjdl9zZXRf
aWNhY2hlX2ZsdXNoX2N0eCBwcmN0bAogICAgICBkb2N1bWVudGF0aW9uOiBEb2N1bWVudCBQUl9S
SVNDVl9TRVRfSUNBQ0hFX0ZMVVNIX0NUWCBwcmN0bAogICAgICBjcHVtYXNrOiBBZGQgYXNzaWdu
IGNwdQoKIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9jbW9keC5yc3QgfCAgOTggKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2luZGV4
LnJzdCB8ICAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmggIHwgICAxIC0K
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vbW11LmggICAgICAgfCAgIDIgKwogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICAxMiArKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zd2l0Y2hfdG8uaCB8ICAyMyArKysrKysrKwogYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMg
ICAgICAgICB8IDEwNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNo
L3Jpc2N2L21tL2NvbnRleHQuYyAgICAgICAgICAgIHwgIDE4ICsrKysrLS0KIGluY2x1ZGUvbGlu
dXgvY3B1bWFzay5oICAgICAgICAgICAgfCAgMTYgKysrKysrCiBpbmNsdWRlL3VhcGkvbGludXgv
cHJjdGwuaCAgICAgICAgIHwgICA2ICsrKwoga2VybmVsL3N5cy5jICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgNiArKysKIDExIGZpbGVzIGNoYW5nZWQsIDI4MiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDY2MTM0NzZlMjI1ZTA5MGNjOWFhZDQ5YmU3ZmE1
MDRlMjkwZGQzM2QKY2hhbmdlLWlkOiAyMDIzMTExNy1mZW5jZWktZjlmNjBkNzg0ZmEwCi0tIAot
IENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
