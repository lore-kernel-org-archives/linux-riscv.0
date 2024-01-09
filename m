Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EF4C47079
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 18:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RzTaMJ4DtKdibK+yTIVLao2OCpphKp5kRYbLQxNcrPk=; b=G5Jybd4PakxPcV
	LNTvf2p9NHDYZRobx48A3U8mcjV1Pb+HUue3mfIpkYZ+QUyvbyuSQ2UV/1sxbZyq5dfVG4GNhk21l
	E9BEIX0LcqRNfXmeX8WxOaQ45zmixXarPAx/GedUmh0Xls3Ow4ADCtwoOzUWWKrfwipTkJXnSA+dy
	pG3Bzz9BIWTN61muSQo08oiUOcz8rvmpbNpPwwyzGzvyfzJIwEQNU+FtiDKzL8JdeD5UcUIfAdp3s
	lM/S94aw6DD8lkJSqlt+iE2sL42DUuBfNCBu2JaAxdfq833q3KVz+i/Xf1yNwPfWIYOjZ6o2QiNas
	jhmIYDayTA5cWplv9Yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNH4Z-009CFa-0H;
	Tue, 09 Jan 2024 18:43:35 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNH4V-009CDI-0n
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 18:43:33 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-206689895bfso218824fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 10:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704825808; x=1705430608; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8tIh5/SJkOUUlCOBe2SBZ/CeVYcs+QLRLt1HCIE+Zg=;
        b=dMLp2gU/ybLCuQum+k4cmyjWH7ML2UjS7Y2WO7S48cWtpf9nuUD21ZWvnrEu57x7WE
         Wn9MWtvG3NmHr11UE0C6zJjsOfAHIKxQDMYAl3WvcjkgjPBywplgQqE8E01HvuN0cpFB
         yw6pGW3UJF8gTs/23iHMHutpycyLnsMx93xe90iEOm9AjXem9NQM0hb3OR1Ek3IjmxjJ
         ZXBWVo2xDqtGG5jKhW+afVOOfaeo3jRqm27sfFutkTVZqObpaR5s/JCamHk67jq2xwsv
         Hgb9UjchLWSICsa/GHskh+IXsVJSepFEPQcAHUMW4dv8uZ+D2r8GtkF3bnq2abv6HTZR
         3A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704825808; x=1705430608;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8tIh5/SJkOUUlCOBe2SBZ/CeVYcs+QLRLt1HCIE+Zg=;
        b=VDDyDgw8od0p0+tUONBhSb7bJpvYT/y7/8/65GYPoa8sZI+EVN8gjtmVQ8RtcDr1Su
         k9pprUrZ9P/gAtDXculjplYimcUCzOhEHyaSh1zDDq1vJ800u/Bakl0y6OmOKE2RvSVs
         gYgq9xp0nuRi/Kn8yLjF9jk1QKjKRCvRd/ntqMJPWF3Wv5DLuLxujGYVZRq85BT1DBQg
         o8kg7dtwXiJU+/5b+Yg6b+KG/DQ5RoDI+sosGTQg0SM+sEDr3i3LuSLlrQfKb1+mDLkW
         Xcs93pG6MO7CW+TpAxTwKqUnnH8234csZ4mF0uRUsIj4fcOhIpOKbgZc9VrkQwzdmQED
         jPSA==
X-Gm-Message-State: AOJu0YzKUOOgkiInB30XXF3r5NKvLM9hU8G+pA1nut4TVyDJ2AaPqNxi
	QvCUxA3Nh3bOWtDMCmFi3ynGaAu3/s6T2w==
X-Google-Smtp-Source: AGHT+IFcxswKi7F7pE1xwoT7t0vdbShn5ks82furi63XCAnlNWziga0jcShQ7a72MoVw6ae19zgnhA==
X-Received: by 2002:a05:6870:d14b:b0:206:d54:7b2a with SMTP id f11-20020a056870d14b00b002060d547b2amr4357731oac.116.1704825807883;
        Tue, 09 Jan 2024 10:43:27 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j2-20020a9d7682000000b006ce2c31dd9bsm450423otl.20.2024.01.09.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:43:27 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Tue, 09 Jan 2024 10:43:24 -0800
Message-Id: <20240109-fencei-v6-0-04116e51445c@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMyTnWUC/23PTW7DIBAF4KtErEvEDGBIV7lH1AU/Q8OidgURS
 hX57sVR40SVl2/E94a5sUolU2Xvuxsr1HLN09jD8LZj4ezGT+I59sxQoAQAwxONgTJPhzSIaKx
 KTrD++LtQytd70emj53Oul6n83HsbLNO/CsRHRQMuuKcgLEDwCHgsuU01j2Efpi+2tDR8kVKsE
 rvE4AeUzoOHtCHlUyLIVcplp9GgLUpL3mxI9ZBKgFgPbqrLqELC5A9CR7kh9au0q9RdOgekIRp
 E/P/beZ5/AdWDF6iHAQAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704825806; l=1943;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=fXFUftloV5jzL0u4aeVUYxoLDAW2ZraqE9n+Yoo2iUk=;
 b=NAtn7SuloNiPreSBIIN21r9pJE15rERzjhOZSODLLXEdLhVRFRC8siAHMji5UtZHKbUt+hl9p
 Ho5wmA+uqyvCZcZ+W2SeQp3SK39CsEpKGvR1kOj5ba0MSK+R4hNMYAb
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_104331_491723_7CCB6752 
X-CRM114-Status: UNSURE (   8.82  )
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
cyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQpDaGFuZ2VzIGluIHY2OgotIEZpeHVwIGRvY3Vt
ZW50YXRpb24gZm9ybWF0dGluZwotIExpbmsgdG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNDAxMDgtZmVuY2VpLXY1LTAtYWExZTUxZDcyMjJmQHJpdm9zaW5jLmNvbQoKQ2hhbmdl
cyBpbiB2NToKLSBNaW5vciBkb2N1bWVudGF0aW9uIGNoYW5nZXMgKFJhbmR5KQotIExpbmsgdG8g
djQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMDctZmVuY2VpLXY0LTAtZDRjZjJm
YjkwNWQzQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NDoKLSBBZGQgT0ZGIGZsYWcgdG8gZGlz
YWxsb3cgZmVuY2UuaSBpbiB1c2Vyc3BhY2UgKEF0aXNoKQotIEZpeCBkb2N1bWVudGF0aW9uIGlz
c3VlcyAoQXRpc2gpCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIz
MTIxMy1mZW5jZWktdjMtMC1iNzUxNTgyMzhlYjdAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHYz
OgotIENoZWNrIGlmIHZhbHVlIGZvcmNlX2ljYWNoZV9mbHVzaCBzZXQgb24gdGhyZWFkLCByYXRo
ZXIgdGhhbiBpbiBtbQogIHR3aWNlIChDbMOpbWVudCkKLSBMaW5rIHRvIHYyOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjMxMTMwLWZlbmNlaS12Mi0wLTJjYjYyM2FiMWIxZkByaXZvc2lu
Yy5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gRml4IGtlcm5lbC1kb2MgY29tbWVudCAoQ29ub3IpCi0g
TGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEyMi1mZW5jZWktdjEt
MC1iZWMwODExY2IyMTJAcml2b3NpbmMuY29tCgotLS0KQ2hhcmxpZSBKZW5raW5zICgyKToKICAg
ICAgcmlzY3Y6IEluY2x1ZGUgcmlzY3Zfc2V0X2ljYWNoZV9mbHVzaF9jdHggcHJjdGwKICAgICAg
ZG9jdW1lbnRhdGlvbjogRG9jdW1lbnQgUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFggcHJj
dGwKCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvY21vZHgucnN0IHwgODggKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9pbmRl
eC5yc3QgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tdS5oICAgICAgIHwgIDIgKwog
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICA2ICsrKwogYXJjaC9yaXNjdi9t
bS9jYWNoZWZsdXNoLmMgICAgICAgICB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysKIGFy
Y2gvcmlzY3YvbW0vY29udGV4dC5jICAgICAgICAgICAgfCAgOCArKy0tCiBpbmNsdWRlL3VhcGkv
bGludXgvcHJjdGwuaCAgICAgICAgIHwgIDQgKysKIGtlcm5lbC9zeXMuYyAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNiArKysKIDggZmlsZXMgY2hhbmdlZCwgMTcwIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogYjg1ZWE5NWQwODY0NzFhZmI0YWQwNjIwMTJh
NGQ3M2NkMzI4ZmE4NgpjaGFuZ2UtaWQ6IDIwMjMxMTE3LWZlbmNlaS1mOWY2MGQ3ODRmYTAKLS0g
Ci0gQ2hhcmxpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
