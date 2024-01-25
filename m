Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13474C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 04:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gOS8amINxkFNjWxgfT5+De0GGA/bkDcg9smlRWfytSY=; b=nCAqj/hwA4Qe+U
	6rAHhrn1PUX1HlMEoyQJLxTBkJ3MdCpFacQMCYoo73OaLiEydZ/k2+Hkh42HnGNoGbsFfQ/i1a/Z9
	L1KgjBNuhCVn1DPk3MMMcPLgtXsE7JBml6QqR3TmfnS61dEHnF9OdDz1/PAsx5phHgd5T3hGS6DTg
	WG3KZPwk8pOKalMzF8co+Qy4vEhR7/bXDhAhK0AMM6vuefhaiwHB5fZ+NlD6swa1IKB9MNYDQ2PUm
	7IBQr77Rn8OOnQYbnws9O69rhAzRj7/K+q9hHPM0MK04F1bkWkyh1OTHzWfOwHsnVJuVLxzEUXbQz
	9XZblLDmmEQaXMGPImQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSrGn-006FQx-2g;
	Thu, 25 Jan 2024 04:23:17 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSrGh-006FOr-1A
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 04:23:16 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5ce74ea4bf2so251399a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 20:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706156590; x=1706761390; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdsnxFeLDc7O+tsMX6XHeSkZFgA7YsQDvmpx17WI4kI=;
        b=eLDVQ3EnLyLHKVWN0YO17CmlHSMApaEBc2eaIU54Y1Wb+QqjEWf4RECADUbK/xc0hx
         fOArLsQ6myZpUWix5QAu/hfaqXrtt9sxqyhOg0U7nW6BjbKn7h37/pgG5You+lMO25yt
         SBP7EdZbfSJov0Pq3xyLfe84pRwjDrs8QCxw/VzMCfpcZ45WXyog8hAuVf3Ivo3am9Gw
         XJS2n0f/a/2XPfej1Up1OuVQ5tbhZjQO1efjbmmKqBTnB7G9mKyzRj6XA8FsfvvDEs7Z
         3DI1UHWVri5xLcQ3yy1WZFabR2NcEFZPpMdBrDe3Qj3q29ibdV4fm4Yzwe5SnhFROQUT
         q5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706156590; x=1706761390;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdsnxFeLDc7O+tsMX6XHeSkZFgA7YsQDvmpx17WI4kI=;
        b=oEA74A04SMBJgfEa07Ll3xiTMVq1pC/rfUqN7g+PR//kSVmTkBvnxw9aDjRkJwGcR7
         C4flZsY22mesHIz3PNSJcbgn8OiLT0FqFLjBZs1O2yj82xR/BLCDDRNQFiYKnMH1xERq
         6Xcaco03KGcof6g5OyQxRPIVsm5SVh8xB6XL6RD5TOgPoNyo2Hb2wGylc4nKj6i6axve
         Tgdz33vsfWZu6D9xRnH4E7rnX0JBQqkE6rPRnGEvF5uzJm0iY3Ds4tQ2Z8ZTGUhr0bJ2
         2vY0admZlrfgSQSfDgI/kmzxvc5hQbbGuksL0u6JDqn7Es1ALMdLWlOdC9dbrpSnn2Bx
         V19A==
X-Gm-Message-State: AOJu0YwEdVMgdTGou/ErEXw270Ecn6lInNGGQjnKMXVFczCGN4v+qGve
	d40sAhfBv3RuQHEFbjEeQ2mW3zSqjIZl3hAF9VOBwMhIOxk3giM7ANaq7tCUE4g=
X-Google-Smtp-Source: AGHT+IG0c3KHNOYvKXWZKGA877PW8294s0ljZp87IKGqkduZuQ+JPtDg7C2fQbUVQ11GAN+QWsDGOA==
X-Received: by 2002:a05:6a20:9f03:b0:19a:fbfa:b16a with SMTP id mk3-20020a056a209f0300b0019afbfab16amr468801pzb.30.1706156590009;
        Wed, 24 Jan 2024 20:23:10 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ko9-20020a056a00460900b006dab36287bfsm14549743pfb.207.2024.01.24.20.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 20:23:09 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v10 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Wed, 24 Jan 2024 20:23:07 -0800
Message-Id: <20240124-fencei-v10-0-a25971f4301d@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACvisWUC/23QS07EMAwG4KuMsqbIdp5lxT0Qi+bFZEE7alEEG
 vXuuCOmU6EsbeX77fgqljSXtIiX01XMqZalTCMXCE8nEc7D+JG6ErkhCEgiou1yGkMqXe6zgWi
 dygMIfnyZUy7ft6S3d67PZfma5p9bcMWt+xdBdI+o2EHnUwCHGDwhvc6lTksZw3OYPsWWUukgJ
 eySWFLwhuTg0WNuSPmQhHKXcptpNWpH0iVvG1LdpQKE/cNVsYwqZMq+Bx1lQ+qjdLvULIcBk8Z
 oiai1rTnKfpeGJShEw1YpHRrSHiQ+bmtZWpfBoEoYPTSkO0qzS8dSyUHx1VQGwobsD5Iet+23m
 cjr+pxctP/luq6/EfVc/3ACAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706156588; l=2933;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Fp/Nsdcth0hMGV4QFLJyIHW6clYIcFNJ6WEMI/uUbQg=;
 b=SvtUbRzRCSPcDsyKUxxcadxQoBxxmIhU4504F5DxcJ1phzCTxqjQPG4L5ty+vMNgQswrEoK5x
 HlIebRpycAvDGysjIrrNQ3pIhmMKVTQ3CdAEmLCsQkAYHOsQyG0xTtr
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_202311_653369_DE193534 
X-CRM114-Status: GOOD (  10.04  )
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
dm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjEwOgotIEZpeCBmZW5jZS5pIGNvbmRpdGlvbiB0
byBwcm9wZXJseSBvbmx5IGZsdXNoIG9uIG1pZ3JhdGlvbiAoQWxleCkKLSBGaXggZG9jdW1lbnRh
dGlvbiB3b3JkaW5nIChBbGV4KQotIExpbmsgdG8gdjk6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNDAxMjMtZmVuY2VpLXY5LTAtNzE0MTFiZmU4ZDcxQHJpdm9zaW5jLmNvbQoKQ2hhbmdl
cyBpbiB2OToKLSBSZW1vdmUgcHJldl9jcHUgZnJvbSBtbSAoQWxleCkKLSBMaW5rIHRvIHY4OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMTE2LWZlbmNlaS12OC0wLTQzYTQyMTM0ZjAy
MUByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjg6Ci0gT25seSBmbHVzaCBpY2FjaGUgaWYgbWln
cmF0ZWQgdG8gZGlmZmVyZW50IGNwdSAoQWxleCkKLSBNb3ZlIGZsdXNoaW5nIHRvIHN3aXRjaF90
byB0byBjYXRjaCBwZXItdGhyZWFkIGZsdXNoaW5nIHByb3Blcmx5Ci0gTGluayB0byB2NzogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDExMi1mZW5jZWktdjctMC03OGYwNjE0ZTFkYjBA
cml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY3OgotIENoYW5nZSAicGVyX3RocmVhZCIgcGFyYW1l
dGVyIHRvICJzY29wZSIgYW5kIHByb3ZpZGUgY29uc3RhbnRzIGZvciB0aGUKICBwYXJhbWV0ZXIu
Ci0gTGluayB0byB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDEwOS1mZW5jZWkt
djYtMC0wNDExNmU1MTQ0NWNAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY2OgotIEZpeHVwIGRv
Y3VtZW50YXRpb24gZm9ybWF0dGluZwotIExpbmsgdG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNDAxMDgtZmVuY2VpLXY1LTAtYWExZTUxZDcyMjJmQHJpdm9zaW5jLmNvbQoKQ2hh
bmdlcyBpbiB2NToKLSBNaW5vciBkb2N1bWVudGF0aW9uIGNoYW5nZXMgKFJhbmR5KQotIExpbmsg
dG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMDctZmVuY2VpLXY0LTAtZDRj
ZjJmYjkwNWQzQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NDoKLSBBZGQgT0ZGIGZsYWcgdG8g
ZGlzYWxsb3cgZmVuY2UuaSBpbiB1c2Vyc3BhY2UgKEF0aXNoKQotIEZpeCBkb2N1bWVudGF0aW9u
IGlzc3VlcyAoQXRpc2gpCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDIzMTIxMy1mZW5jZWktdjMtMC1iNzUxNTgyMzhlYjdAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGlu
IHYzOgotIENoZWNrIGlmIHZhbHVlIGZvcmNlX2ljYWNoZV9mbHVzaCBzZXQgb24gdGhyZWFkLCBy
YXRoZXIgdGhhbiBpbiBtbQogIHR3aWNlIChDbMOpbWVudCkKLSBMaW5rIHRvIHYyOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMTMwLWZlbmNlaS12Mi0wLTJjYjYyM2FiMWIxZkByaXZv
c2luYy5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gRml4IGtlcm5lbC1kb2MgY29tbWVudCAoQ29ub3Ip
Ci0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIzMTEyMi1mZW5jZWkt
djEtMC1iZWMwODExY2IyMTJAcml2b3NpbmMuY29tCgotLS0KQ2hhcmxpZSBKZW5raW5zICgyKToK
ICAgICAgcmlzY3Y6IEluY2x1ZGUgcmlzY3Zfc2V0X2ljYWNoZV9mbHVzaF9jdHggcHJjdGwKICAg
ICAgZG9jdW1lbnRhdGlvbjogRG9jdW1lbnQgUFJfUklTQ1ZfU0VUX0lDQUNIRV9GTFVTSF9DVFgg
cHJjdGwKCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvY21vZHgucnN0IHwgOTYgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9p
bmRleC5yc3QgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tdS5oICAgICAgIHwgIDIg
KwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICA3ICsrKwogYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8uaCB8IDEzICsrKysrKwogYXJjaC9yaXNjdi9tbS9jYWNo
ZWZsdXNoLmMgICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jp
c2N2L21tL2NvbnRleHQuYyAgICAgICAgICAgIHwgMTMgKysrKy0tCiBpbmNsdWRlL3VhcGkvbGlu
dXgvcHJjdGwuaCAgICAgICAgIHwgIDYgKysrCiBrZXJuZWwvc3lzLmMgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDYgKysrCiA5IGZpbGVzIGNoYW5nZWQsIDIwOCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDY2MTM0NzZlMjI1ZTA5MGNjOWFhZDQ5YmU3ZmE1
MDRlMjkwZGQzM2QKY2hhbmdlLWlkOiAyMDIzMTExNy1mZW5jZWktZjlmNjBkNzg0ZmEwCi0tIAot
IENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
