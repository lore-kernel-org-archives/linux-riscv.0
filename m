Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BBEC47422
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 23:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kzv1bl+MnhFbc7J3Ypr05ekuBPqWGez6xUMKokV9vSM=; b=LCmkRg8zuvXICQ
	r6+/7VYTGebfSCtaHAU1oVEW26FoOEkFoAkKqwzOAr3tdNqWmb2zdYNY+gfuDKlzFHJz9TADeOIJq
	rFIvM4n1ksvaghaKSbC3r9MCEFmcT+7T+YMWFy5VRw/kfJbRqW1MxBJhpX42U3q9XqbesIXbURA6I
	iYgEw71OicHG+B3+OpH6UYCentxaJPGaBJV7YnRxNP+OcijXJscexiKSh565lJVTMIl4c/99AJzYt
	ZKf9Xm/gDvjAHDsmADBVN/gpZuD5El+LfK/pQbfTdjMEg5zdFrkmxBBEEvmNtAbSr+pY6m4FFnSom
	a8jrIRvDGBdrx+ezKa9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rORO1-004HxT-2S;
	Fri, 12 Jan 2024 23:56:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rORNy-004Hvw-0A
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 23:56:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d50d0c98c3so50468915ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jan 2024 15:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705103782; x=1705708582; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSP2/M0KF32uiW9ftv4gIz5p6qLp/uAAFpBRC32J+TI=;
        b=gI3C7fH7IX8OSlzj472/QiGzNyFEEqPy4RI7sae4CNUwzF+9Ji5w1S5g53d3i239m+
         jjPZrN/FpYL7Payhs75jvJVbVne5DR7AoJKpGqikoqKmxzltCCoHdBNKDgiCi4GoAYvU
         fkWNcxWMPz0ojwdVOSBmy0HzDECYhd2zfs7wcBVZzn7+9L7oE+pqhJl5W2kqwGdIPFP5
         /ofBB27KW3r+hALebYYqx/Z7DaFYbMrwF3VP25W4NDfo9glP2cWkIWr9GFc5pHGSB0dE
         2mUzU7Zm7hGuqxJmntzSm1T8/nJBJHAZFyTj/2KG7AbGm/9KFEpN4kaT81h3YQBOQhTX
         IR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705103782; x=1705708582;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSP2/M0KF32uiW9ftv4gIz5p6qLp/uAAFpBRC32J+TI=;
        b=QmOTNG5McHat9CYPzBtXjDCb5Lvd7f9wJUzKpS7Q0RbOri5fMgQImHb9Cfp1ZOWYbU
         sGHK6yTzKcm0T2hk/ghg8qzPOvak5oDaJUSxLvLWHFcDUB+mNfb5EYgRluvM5R/EnTzR
         xtMKBjvnx/gznaf9rEQ5VZzZdVeL+NGW1Nv0zzWS6tkJZFqjMD9UFmHQkSqBr/iK3W4Q
         yYWy/+h/Mgl5/WFAjRmMNO6x+TlZDPQJm29pofRG6LtjEG7Uatf3Afpfp7YZ4vdlXFBP
         sgBs8uh+ic8zAM9w5PtKJ4pj+hKdSwHZ71dvNZaaGJ8Jw7qTuSJF23KAaA4T7leaXMmE
         xfQg==
X-Gm-Message-State: AOJu0YzHtcDVtkpXOm7o/tHfjNbWlqv7TEQlTZ+gi5BRi8i+2e5jeIrF
	aHwG3YbjJyl+sbtRlXcl39pN/zuAKkE+IDw/oHdlrEQN/do=
X-Google-Smtp-Source: AGHT+IG4gBtsgyIEpgs86D5iPR6zSD6ZpRdErJUi2IQ159YkrAb7SJNIwIw42d3KQh/fXO2CV9ZaQg==
X-Received: by 2002:a17:902:8e88:b0:1d5:6600:3d96 with SMTP id bg8-20020a1709028e8800b001d566003d96mr2406125plb.0.1705103782367;
        Fri, 12 Jan 2024 15:56:22 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id jc14-20020a17090325ce00b001d3b3ac2d7bsm3725537plb.245.2024.01.12.15.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 15:56:21 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Fri, 12 Jan 2024 15:56:19 -0800
Message-Id: <20240112-fencei-v7-0-78f0614e1db0@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKPRoWUC/23Py07DMBAF0F+pvMbIM36GFf9RsfCTekGCbGQVV
 fl3nIqaCGV5Rz53PDdSY8mxkpfTjZTYcs3L3IN+OhF/sfN7pDn0TJAhBwBNU5x9zDRNSbGgjUi
 Wkf74s8SUr/ei81vPl1y/lvJ9722wTX8rEB8VDSijLnpmALxDwNeS21Lz7J/98kG2loY7ydmQ2
 CV6p5BbBw7SgeR/EoEPybedWoI0yE10+kCKhxQM2Di4iS6D8AmTm5gM/EDKvTRDyi6thSghaEQ
 8+q3ay2lI1SUTAKpbIaT/J9d1/QFjEzRawQEAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705103781; l=2142;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=7NrtzZUolbE1vnII9PeZvgH9s80f0X/yu6SBfBeEopk=;
 b=HXQxAQ9NQYkhFje02cXtnO0r4RIu8BhoepGEzSabovWAoFxMm370RSGcwi/8QMIe504Z/ZWoz
 UGWzld43/vFAHaiwNSNwGs5jUDbS0KCsFlDVMvBVtVXbSYr2TihEDos
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_155626_090202_DA1A4F81 
X-CRM114-Status: UNSURE (   8.43  )
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
cyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Ci0tLQpDaGFuZ2VzIGluIHY3OgotIENoYW5nZSAicGVy
X3RocmVhZCIgcGFyYW1ldGVyIHRvICJzY29wZSIgYW5kIHByb3ZpZGUgY29uc3RhbnRzIGZvciB0
aGUKICBwYXJhbWV0ZXIuCi0gTGluayB0byB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI0MDEwOS1mZW5jZWktdjYtMC0wNDExNmU1MTQ0NWNAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGlu
IHY2OgotIEZpeHVwIGRvY3VtZW50YXRpb24gZm9ybWF0dGluZwotIExpbmsgdG8gdjU6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMDgtZmVuY2VpLXY1LTAtYWExZTUxZDcyMjJmQHJp
dm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NToKLSBNaW5vciBkb2N1bWVudGF0aW9uIGNoYW5nZXMg
KFJhbmR5KQotIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMDct
ZmVuY2VpLXY0LTAtZDRjZjJmYjkwNWQzQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NDoKLSBB
ZGQgT0ZGIGZsYWcgdG8gZGlzYWxsb3cgZmVuY2UuaSBpbiB1c2Vyc3BhY2UgKEF0aXNoKQotIEZp
eCBkb2N1bWVudGF0aW9uIGlzc3VlcyAoQXRpc2gpCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDIzMTIxMy1mZW5jZWktdjMtMC1iNzUxNTgyMzhlYjdAcml2b3NpbmMu
Y29tCgpDaGFuZ2VzIGluIHYzOgotIENoZWNrIGlmIHZhbHVlIGZvcmNlX2ljYWNoZV9mbHVzaCBz
ZXQgb24gdGhyZWFkLCByYXRoZXIgdGhhbiBpbiBtbQogIHR3aWNlIChDbMOpbWVudCkKLSBMaW5r
IHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjMxMTMwLWZlbmNlaS12Mi0wLTJj
YjYyM2FiMWIxZkByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gRml4IGtlcm5lbC1kb2Mg
Y29tbWVudCAoQ29ub3IpCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDIzMTEyMi1mZW5jZWktdjEtMC1iZWMwODExY2IyMTJAcml2b3NpbmMuY29tCgotLS0KQ2hhcmxp
ZSBKZW5raW5zICgyKToKICAgICAgcmlzY3Y6IEluY2x1ZGUgcmlzY3Zfc2V0X2ljYWNoZV9mbHVz
aF9jdHggcHJjdGwKICAgICAgZG9jdW1lbnRhdGlvbjogRG9jdW1lbnQgUFJfUklTQ1ZfU0VUX0lD
QUNIRV9GTFVTSF9DVFggcHJjdGwKCiBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvY21vZHgucnN0
IHwgODggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIERvY3VtZW50YXRp
b24vYXJjaC9yaXNjdi9pbmRleC5yc3QgfCAgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21t
dS5oICAgICAgIHwgIDIgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCB8ICA2
ICsrKwogYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMgICAgICAgICB8IDY3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L21tL2NvbnRleHQuYyAgICAgICAgICAgIHwg
IDggKystLQogaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICB8ICA2ICsrKwoga2Vy
bmVsL3N5cy5jICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrKwogOCBmaWxlcyBjaGFuZ2Vk
LCAxODEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiBiODVl
YTk1ZDA4NjQ3MWFmYjRhZDA2MjAxMmE0ZDczY2QzMjhmYTg2CmNoYW5nZS1pZDogMjAyMzExMTct
ZmVuY2VpLWY5ZjYwZDc4NGZhMAotLSAKLSBDaGFybGllCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
