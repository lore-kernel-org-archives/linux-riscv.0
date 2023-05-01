Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4A6C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 21:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pw3VvzeblZT1Upe2uBy6It7Px0Bj71Sd94Y/AnlLFEY=; b=BeTz/TbPb+tixA
	jMDkFM9Xd2ft+9YwswD3NFeFD568njWT4u7mKECR/+hG9feT5iBXRgU/oFsw0hW4ds+kpr/uvF/m1
	OkVPt4qGzEGZ0i/XQEHcqwmdzZdFjm9FGvvkuVlvdCD1Z87JMecOjVv8PS/3PCoWPZ7LezzFCEINk
	z3MuSn+3bO8r0MhxadaZVeGYtOES4vPB5pqpX2LyZfxQrUehaxxAGWUdlkTOYUOs+6h93OoXABYWw
	rO3CmzqdHAaAvC3O37K+P5dQhFcjrDYH5tW8G8htc4quY3tEmQVYbGNuxTQchm7tOaIDvJgb3Hb8g
	uI2+BuyJ1Wer2FbK2NOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptafd-00Gy8k-2a;
	Mon, 01 May 2023 21:02:53 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptafZ-00Gy6w-1P
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 21:02:52 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63b4bf2d74aso2087968b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682974966; x=1685566966;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+f9STYpQ3MiLUuobcxB6NiQeu6oLquBuiEqTgiW7nU=;
        b=lBy1tIKVEJ2LC26woBFWq3aTbWu9kIByjssXjub4uONA5jL6a1YtTrEE7NjSLAMyWX
         MWamHpoRE3PUugO94uw7+1taB6gcVdcMcsQF/OHsuVU++5D7D/K+LrQeC0yXlNC38Kwr
         n0qRMYU9ccB4TSr3C+23XpODCmc3FSBgoXmiv+cDx6XG1CX1xqIZAuxHyWsVzGz4Jj84
         CMxaxxXWanxT+4Hs5UbwRF3TWfVKXCOVELJHMQFEogn4RuWLal8y/6UsS7sFrzyaW5jz
         djmjyfP09RL71AwOkUp3xQaAe92cuAnctDgB2F9/QIGcHy9CTQ1syZjVMCgtyqvkIPi0
         5xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682974966; x=1685566966;
        h=to:content-transfer-encoding:mime-version:message-id:date:subject
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+f9STYpQ3MiLUuobcxB6NiQeu6oLquBuiEqTgiW7nU=;
        b=aRthPmp4PWE52X5Q4ATtWiOTaAVnOFkK+GKkvktHaH2uyFmSM8pHg5OYZSM4ZUL1F1
         2R55q5F+ThBZz/NcQxotO7JoD57HAdTAEYJ/spWrpuZEtNFCp5hqY2K9wKnuhP9wCcT9
         gD++1h4hIG2TdHZ2ECbdWEDalzs2/Cnatvf9IWgQORzxpjTaKw7qjZYh922LApF5GY0L
         Q1DTrWzOmOHzhxF8nJIHY+NZua+xxDT6rgZWyi6mybmDz+S4NJDFGKtkcE1BljOHQ6L/
         igiBLeVg+qFLoaTtJp3JeQjbvMnSzu4lvoPbsCC1Di4UyHkX0a239zPq9xWRVi56gOmF
         gBWA==
X-Gm-Message-State: AC+VfDx9xU+ZaAs5VDRfyj9fJ4sdMEKLzvR2smOKOCNqT0PilgCtBUW5
	dFDMNW3s7gyy8ZHEuWlMz7wXiA==
X-Google-Smtp-Source: ACHHUZ59aSXoviFEB4FBnsHZun5uq6o104ZpmpZfLLV1mJcHU3VtnRTP2MBcZKMAvXC6UNuXFZGI0Q==
X-Received: by 2002:a05:6a00:1ac9:b0:641:558:8e2e with SMTP id f9-20020a056a001ac900b0064105588e2emr20397668pfv.15.1682974965937;
        Mon, 01 May 2023 14:02:45 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:1f1:1360:eb9b:387])
        by smtp.gmail.com with ESMTPSA id i12-20020a056a00224c00b0063d670ad850sm20899151pfu.92.2023.05.01.14.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 14:02:45 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH RFC v2 0/2] RISC-V: Detect Ssqosid extension and handle
 sqoscfg CSR
Date: Mon, 01 May 2023 14:05:20 -0700
Message-Id: <20230430-riscv-cbqri-rfc-v2-v2-0-8e3725c4a473@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJApUGQC/2XNQQrCQAyF4auUrA3EaUXqVvAAbsXFTJqx2Yyaw
 CCU3t2pW5c/vI+3gIupOJy6BUyquj5Li7DrgOdYHoI6tYZAoaehJzR1rsjpbYqWGWvARHTMPO3
 HwzBCgym6YLJYeN7ov9hGL5Osn9/zDa6XM9zX9QvLganljgAAAA==
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1682975186; l=3338;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=WhoQqsgjJdsQj4ZRrkR5sEIpHcYxbO2QvzNxfqfpBDE=;
 b=V29DkhiYqj3tZMXMXV+LYuslsnRGNqE3QVtYjOow8qhlZo6SXlDkOy59pN1/OFwDeCnBwQJVC
 2aY2/Vwj6TzB6yADUhDwOdvof3XwUuQMEcIWhSQ7t/Dg++RQlhct9Fq
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_140249_664938_9E0CCD8F 
X-CRM114-Status: GOOD (  14.13  )
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

VGhpcyBSRkMgc2VyaWVzIGFkZHMgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgU3Nxb3NpZCBleHRl
bnNpb24gYW5kIHRoZQpzcW9zY2ZnIENTUiBhcyBzcGVjaWZpZWQgaW4gQ2hhcHRlciAyIG9mIHRo
ZSBSSVNDLVYgQ2FwYWNpdHkgYW5kCkJhbmR3aWR0aCBDb250cm9sbGVyIFFvUyBSZWdpc3RlciBJ
bnRlcmZhY2UgKENCUVJJKSBzcGVjaWZpY2F0aW9uIFsxXS4KClFvUyAoUXVhbGl0eSBvZiBTZXJ2
aWNlKSBpbiB0aGlzIGNvbnRleHQgaXMgY29uY2VybmVkIHdpdGggc2hhcmVkCnJlc291cmNlcyBv
biBhbiBTb0Mgc3VjaCBhcyBjYWNoZSBjYXBhY2l0eSBhbmQgbWVtb3J5IGJhbmR3aWR0aC4gSW50
ZWwKYW5kIEFNRCBhbHJlYWR5IGhhdmUgUW9TIGZlYXR1cmVzIG9uIHg4NiwgYW5kIHRoZXJlIGlz
IGFuIGV4aXN0aW5nIHVzZXIKaW50ZXJmYWNlIGluIExpbnV4OiB0aGUgcmVzY3RybCB2aXJ0dWFs
IGZpbGVzeXN0ZW0gWzJdLgoKVGhlIHNxb3NjZmcgQ1NSIHByb3ZpZGVzIGEgbWVjaGFuaXNtIGJ5
IHdoaWNoIGEgc29mdHdhcmUgd29ya2xvYWQgKGUuZy4KYSBwcm9jZXNzIG9yIGEgc2V0IG9mIHBy
b2Nlc3NlcykgY2FuIGJlIGFzc29jaWF0ZWQgd2l0aCBhIHJlc291cmNlCmNvbnRyb2wgSUQgKFJD
SUQpIGFuZCBhIG1vbml0b3JpbmcgY291bnRlciBJRCAoTUNJRCkgdGhhdCBhY2NvbXBhbmllcwpl
YWNoIHJlcXVlc3QgbWFkZSBieSB0aGUgaGFydCB0byBzaGFyZWQgcmVzb3VyY2VzIGxpa2UgY2Fj
aGUuIENCUVJJCmRlZmluZXMgb3BlcmF0aW9ucyB0byBjb25maWd1cmUgcmVzb3VyY2UgdXNhZ2Ug
bGltaXRzLCBpbiB0aGUgZm9ybSBvZgpjYXBhY2l0eSBvciBiYW5kd2lkdGgsIGZvciBhbiBSQ0lE
LiBDQlFSSSBhbHNvIGRlZmluZXMgb3BlcmF0aW9ucyB0bwpjb25maWd1cmUgY291bnRlcnMgdG8g
dHJhY2sgdGhlIHJlc291cmNlIHV0aWxpemF0aW9uIG9mIGFuIE1DSUQuCgpUaGUgQ0JRUkkgc3Bl
YyBpcyBzdGlsbCBpbiBkcmFmdCBzdGF0ZSBhbmQgaXMgdW5kZXJnb2luZyByZXZpZXcgWzNdLiBJ
dAppcyBwb3NzaWJsZSB0aGVyZSB3aWxsIGJlIGNoYW5nZXMgdG8gdGhlIFNzcW9zaWQgZXh0ZW5z
aW9uIGFuZCB0aGUgQ0JRUkkKc3BlYy4gRm9yIGV4YW1wbGUsIHRoZSBDU1IgYWRkcmVzcyBmb3Ig
c3Fvc2NmZyBpcyBub3QgeWV0IGZpbmFsaXplZC4KCk15IGdvYWwgZm9yIHRoaXMgUkZDIGlzIHRv
IGRldGVybWluZSBpZiB0aGUgMm5kIHBhdGNoIGlzIGFuIGFjY2VwdGFibGUKYXBwcm9hY2ggdG8g
aGFuZGxpbmcgc3Fvc2NmZyB3aGVuIHN3aXRjaGluZyB0YXNrcy4gVGhpcyBSRkMgd2FzIHRlc3Rl
ZAphZ2FpbnN0IGEgUUVNVSBicmFuY2ggdGhhdCBpbXBsZW1lbnRzIHRoZSBTc3Fvc2lkIGV4dGVu
c2lvbiBbNF0uIEEgdGVzdApkcml2ZXIgWzVdIHdhcyB1c2VkIHRvIHNldCBzcW9zY2ZnIGZvciB0
aGUgY3VycmVudCBwcm9jZXNzLiBUaGlzIGFsbG93cwpfX3N3aXRjaF90b19zcW9zY2ZnKCkgdG8g
YmUgdGVzdGVkIHdpdGhvdXQgcmVzY3RybC4KClRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIHJpc2N2
L2Zvci1uZXh0IGF0OgoKIGIwOTMxM2RkMmU3MiAoIlJJU0MtVjogaHdwcm9iZTogRXhwbGljaXR5
IGNoZWNrIGZvciAtMSBpbiB2ZHNvIGluaXQiKQoKQ2hhbmdlcyBmcm9tIHYxOgogLSBjaGFuZ2Ug
REVGSU5FX1BFUl9DUFUgdG8gREVDTEFSRV9QRVJfQ1BVIGZvciBjcHVfc3Fvc2NmZyBpbiBxb3Mu
aCB0bwogICBwcmV2ZW50IGxpbmtpbmcgZXJyb3IgYWJvdXQgbXVsdGlwbGUgZGVmaW5pdGlvbi4g
TW92ZSBERUZJTkVfUEVSX0NQVQogICBmb3IgY3B1X3Nxb3NjZmcgaW50byBxb3MuYwogLSByZW5h
bWVkIHFvcyBwcmVmaXggaW4gZnVuY3Rpb24gbmFtZXMgdG8gc3Fvc2NmZyB0byBiZSBsZXNzIGdl
bmVyaWMKIC0gaGFuZGxlIHNxb3NjZmcgdGhlIHNhbWUgd2F5IGhhc192ZWN0b3IgYW5kIGhhc19m
cHUgYXJlIGhhbmRsZWQgaW4gdGhlCiAgIHZlY3RvciBwYXRjaCBzZXJpZXMgWzZdCgpbMV0gaHR0
cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtY21xcmkvYmxvYi9tYWluL3Jpc2N2
LWNicXJpLnBkZgpbMl0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcveDg2L3Jlc2N0cmwuaHRtbApb
M10gaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNoLWNicXJpL21lc3NhZ2UvMzgKWzRdIGh0
dHBzOi8vZ2l0bGFiLmJheWxpYnJlLmNvbS9iYXlsaWJyZS9xZW11Ly0vdHJlZS9yaXNjdi1jYnFy
aS1yZmMtdjIKWzVdIGh0dHBzOi8vZ2l0bGFiLmJheWxpYnJlLmNvbS9iYXlsaWJyZS9saW51eC8t
L3RyZWUvcmlzY3Ytc3Fvc2NmZy1yZmMtdjIKWzZdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjMwNDE0MTU1ODQzLjEyOTYzLTEtYW5keS5jaGl1QHNpZml2ZS5jb20vCgot
LS0KRHJldyBGdXN0aW5pICgxKToKICAgICAgUklTQy1WOiBBZGQgc3VwcG9ydCBmb3Igc3Fvc2Nm
ZyBDU1IKCktvcm5lbCBEdWzEmWJhICgxKToKICAgICAgUklTQy1WOiBEZXRlY3QgdGhlIFNzcW9z
aWQgZXh0ZW5zaW9uCgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICB8IDE5ICsr
KysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgICAgIHwgIDgg
KysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICB8ICAyICsrCiBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgIDMgKysrCiBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3Fvcy5oICAgICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmggfCAgMyArKysKIGFyY2gv
cmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgfCAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9j
cHUuYyAgICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAg
ICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL3Fvcy9NYWtlZmlsZSAgICAgfCAgMiArKwogYXJj
aC9yaXNjdi9rZXJuZWwvcW9zL3Fvcy5jICAgICAgICB8ICA1ICsrKysrCiAxMSBmaWxlcyBjaGFu
Z2VkLCA4OCBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogYjA5MzEzZGQyZTcyNmZlNWUx
ZmE1NzRjZDczZjVlMzI2YzYwMzBhNApjaGFuZ2UtaWQ6IDIwMjMwNDMwLXJpc2N2LWNicXJpLXJm
Yy12Mi1iMDA3ZmNkMTk1NDkKCkJlc3QgcmVnYXJkcywKLS0gCkRyZXcgRnVzdGluaSA8ZGZ1c3Rp
bmlAYmF5bGlicmUuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
