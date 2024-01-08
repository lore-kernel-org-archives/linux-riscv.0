Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C0CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 18:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A+gm9Dd5nwcOZq7gTzgalEUO3nil8lpOpzE0/LXgKKk=; b=T1IXQyKVwYtLvg
	BXWdlYS8ZlNzrXDaI2P12msPybR9MWfyjCTl6QezZ+o6zIvhOSiV14VhRymNCN39Mkv+JJTtUN1iY
	VDGEiOOyjOLQDDYGGirA5uiGwmkWVR4CT36w+XcOMK6WgDEl9impwgfisXoNjbfFcuclOG3ZNqhb0
	LvoXNoOPETI+62o+GBtMUClmSk9MU9ilwwKCibhn+jZ+ghwef0WbHdVm6JvCBtvT9ShFOmyE+KJOA
	RvRcojdGoW5Epo9CidhonJtnbStRAKWmjxnrE6k/kOBjpPGQuqkRt7VTPnJSLD9/dOPHxcTwGZC+r
	kopClwEU8vxSOmybrhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuaK-005wEa-2V;
	Mon, 08 Jan 2024 18:42:52 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMuaG-005w9s-0e
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 18:42:50 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-204a16df055so1767358fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jan 2024 10:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704739359; x=1705344159; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7nOCifhuDAF11Xb1y36KLhAB8txEl19e9KXFbeS4gyw=;
        b=UHs3va+eJ1bitO7bCpaPXxMbK7lLKy8j84VQ4x8IbG5dmm/jCVaxROiymlaRSS9TDy
         jSZZgwRP5PSp829yhkAD7NDjiHwZaFJX5qmeE6DaCYdIok7+J8ruESzTWjuWmU0SLewO
         0q4z1q4TFcYy266uqwxmbZvw6sd7lp8NwGgEFdu4PSF6SvqLIy7MAfAnfk1gnV+I8Dm1
         qL78NC/EY4SMaCb0W/IX1PqWdY1M67zNcXUlyVUfDQ4MAxjEG2qU1k4PNcMjRWJV1Dxf
         OtrQHgRkC10nEBDAJxL5dSRUxUV9Un5062a6dTIYJyaRiD2cHPOT1sf+BLsO4b762smO
         y2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704739359; x=1705344159;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nOCifhuDAF11Xb1y36KLhAB8txEl19e9KXFbeS4gyw=;
        b=wU2gip8a+JFAA0hsEXGPQlZHxeA8Dmp8xBYVfW0ro7IG0F3EkOiyTHwxAbcixHw8Ex
         t9Yf6ZZeMbXoaWBHQOzDushNMP2SrciEIdQfTT+VsjikO2M6L+muixBL0LxJz+QD/8Jr
         wJXuEswvw570+3CafmM+lz2LjWgLqOKoUwkWQfRhWWPC1IJClrzRYmB+xZhMg9MrH0WJ
         Z2py1Zmjn0jqn2TdT/kMmpn0YJ/20oxSsoapuJDeLX2Am/H5iHKR3eO/tdEuDgW2tdhP
         iLEmESMzCDO7VEkgo2VehdB+3dzEqJAjv6BmfuMnR3Fv63Gqdqkh2WRHdQvC2m94hyfO
         CLzw==
X-Gm-Message-State: AOJu0Yw5hL30RVGt5Yl8TVI5N++1BwG/IAKwQtIzDr1GSXuiNNWw5lQ2
	7mparnbMtFDojDFz7GCw+IPIlBV+RoWsBg==
X-Google-Smtp-Source: AGHT+IFBhwdGEizekSKi4JNYjZjHKzpIt3Wz/KrnO04cinNIvQ+drTPWlQ+A/SCeEXr4sswGa/DJsQ==
X-Received: by 2002:a05:6870:91cd:b0:204:302f:74cb with SMTP id c13-20020a05687091cd00b00204302f74cbmr5618403oaf.24.1704739359134;
        Mon, 08 Jan 2024 10:42:39 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id pp24-20020a0568709d1800b002044a0677adsm97860oab.8.2024.01.08.10.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 10:42:38 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v5 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Mon, 08 Jan 2024 10:42:28 -0800
Message-Id: <20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABRCnGUC/23PTW7DIBCG4atErEs1M+CfdNV7RFkYPCSzqB1Bh
 RpZvntw1DhR5OWHeF7EpBJH4aS+dpOKnCXJOJRRfeyUP3fDibX0ZSsCMojY6MCDZ9FhH2rom9a
 GDlS5fIkc5O8eOhzLPkv6HeP13s24nP4niB6JjBq0Yw8toneE9B0lj0kG/+nHH7VUMr1IA6ukI
 sm7mkzn0GHYkOYpCc0qzfJmU2HVkmnZNRvSPqQFhPXD2RbZWx8ouD1UvXmT8zzfAOamo+VNAQA
 A
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704739355; l=1802;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=6KNeJtSft3TzqK/eFueLjOMt0bd1sLwSYJMWIyfbYI0=;
 b=vMikdA7TGJkoeVdq0Tn488ZeRydrutnxr/h5WWzxF168I0ofq4f+j+tnBgjLzA/QnKYhZjICD
 Jyvi8cks/1TAsDtEcNbyiyigWNNKiqvbIjmsdAUhBCF/ufU605rgoo3
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_104248_237186_63481FAC 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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
byBwcm92aWRlZCB0byBleHBsYWluIHRoZSB1c2UgY2FzZS4KClsxXSBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3Ytai1leHRlbnNpb24KClNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lu
cyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQpDaGFuZ2VzIGluIHY1OgotIE1pbm9yIGRvY3Vt
ZW50YXRpb24gY2hhbmdlcyAoUmFuZHkpCi0gTGluayB0byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI0MDEwNy1mZW5jZWktdjQtMC1kNGNmMmZiOTA1ZDNAcml2b3NpbmMuY29tCgpD
aGFuZ2VzIGluIHY0OgotIEFkZCBPRkYgZmxhZyB0byBkaXNhbGxvdyBmZW5jZS5pIGluIHVzZXJz
cGFjZSAoQXRpc2gpCi0gRml4IGRvY3VtZW50YXRpb24gaXNzdWVzIChBdGlzaCkKLSBMaW5rIHRv
IHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMjEzLWZlbmNlaS12My0wLWI3NTE1
ODIzOGViN0ByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gQ2hlY2sgaWYgdmFsdWUgZm9y
Y2VfaWNhY2hlX2ZsdXNoIHNldCBvbiB0aHJlYWQsIHJhdGhlciB0aGFuIGluIG1tCiAgdHdpY2Ug
KENsw6ltZW50KQotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzEx
MzAtZmVuY2VpLXYyLTAtMmNiNjIzYWIxYjFmQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MjoK
LSBGaXgga2VybmVsLWRvYyBjb21tZW50IChDb25vcikKLSBMaW5rIHRvIHYxOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjMxMTIyLWZlbmNlaS12MS0wLWJlYzA4MTFjYjIxMkByaXZvc2lu
Yy5jb20KCi0tLQpDaGFybGllIEplbmtpbnMgKDIpOgogICAgICByaXNjdjogSW5jbHVkZSByaXNj
dl9zZXRfaWNhY2hlX2ZsdXNoX2N0eCBwcmN0bAogICAgICBkb2N1bWVudGF0aW9uOiBEb2N1bWVu
dCBQUl9SSVNDVl9TRVRfSUNBQ0hFX0ZMVVNIX0NUWCBwcmN0bAoKIERvY3VtZW50YXRpb24vYXJj
aC9yaXNjdi9jbW9keC5yc3QgfCA4OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2luZGV4LnJzdCB8ICAxICsKIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vbW11LmggICAgICAgfCAgMiArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3Byb2Nlc3Nvci5oIHwgIDYgKysrCiBhcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYyAgICAgICAg
IHwgNTYgKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L21tL2NvbnRleHQuYyAg
ICAgICAgICAgIHwgIDggKystLQogaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICB8
ICA0ICsrCiBrZXJuZWwvc3lzLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrCiA4IGZp
bGVzIGNoYW5nZWQsIDE2OCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQotLS0KYmFzZS1j
b21taXQ6IGI4NWVhOTVkMDg2NDcxYWZiNGFkMDYyMDEyYTRkNzNjZDMyOGZhODYKY2hhbmdlLWlk
OiAyMDIzMTExNy1mZW5jZWktZjlmNjBkNzg0ZmEwCi0tIAotIENoYXJsaWUKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
