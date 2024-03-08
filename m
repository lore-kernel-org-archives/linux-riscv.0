Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B259C54E4A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3iNv8GtCCvFyxrDW5tU36nsHWv/VO4F19zd/OzAReRM=; b=cSzEtzTsvN6vdB
	XO24PvWIxJnoutFtxi1GW1ofq4OdXk39ndGQwJbKTc0K+y/V38HNz6Mlf5y/XA2ZS31GdTfanPJZw
	ccAiwLQ4cRdtffwy6m5587jwh5sxjkm+QjVTBjvPIU2NMjRBDy7MJ73p6hRFxTxDD0nYrscBoE+K+
	LCi7icfZP0cE7ffag3jhAN9dcs2UWbji/sOI5hI01dpjNT+M/qQMkiC5hnIh5Rv3S4qWLTR6Ngbkr
	f6DbHiAdjVZhExLVCqDu7pEC8iKnwNTCnQOaUm9018TOSN5GNH0hYwNXvzHnzfj8Fygo7GOx3yAfp
	kXURbcqz9tk8Zj0Lz6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riev2-0000000AmoR-3pYF;
	Fri, 08 Mar 2024 18:26:08 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rieuw-0000000AmlT-2FZf
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 18:26:07 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5c66b093b86so2622985a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 10:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709922360; x=1710527160; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hoSjgbEckKxxEroEjUzvoD7N56Z9lulxyyOlHDmHt9o=;
        b=fFHK/seDlflVWVcE3M9/r6FREVUTE8RHsaFKEyp1c9AV8RteY0z1qcc4dx3hXHeRgN
         jG6t5sRQdoAzcKGrIkL/VtT9HUchM9cJjoiHJnIarwGIAo+1FGG6z2hajtLG1IWE3UbX
         s1ftnLM7HTG8upG3lWggO3uPRs/MGBavmDIbV7K+QDwpKcjApb6ul434EZKn8PuYP5Jp
         e+1orJZFo/wwXlwUsuYguu/G71VuRPwR3f8MWCpJ+CIA0xkqu59ljwkISDBrOUrTdE6I
         TI+dApeb08wNdfmnxl58MkXCULOQWTdIzm8DbkbUuUg3HCsZE37IxbapFXIAqfc6pG/e
         1X9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709922360; x=1710527160;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoSjgbEckKxxEroEjUzvoD7N56Z9lulxyyOlHDmHt9o=;
        b=VutpunUmlwHeiY5vXZ8GN7ObDsDJYufNZqKJsOT5Gs2GyZur3uulsDu5ekB1C64MYH
         NZGqJgfRHc9OJC4MUiz9GaSNw9yfPyY/zbulFS/YvoGbkkDNKhAWeBxWFEbKQzCJGpMI
         72R/wMjBG6rls7DmYNZMpxReMQ0rSioEo67dO9f9/DR33KZKk43obV9UqVrAw+OeJ+Yf
         YeY0xA7l117erCQH00G9be3T2TEeT+U2+J/4HaEKkMs8ZvQtFnH8TWMfciWVeIrpITv2
         5XskVlxnZV7tRswD7iRKjo8hE1HcUO4dHLyNl+e8zvAh/ZW/CLXqwRZPxFuc6+mO3yyW
         TF9w==
X-Gm-Message-State: AOJu0YwQj+/yI97vmkf1tJAkPj+VugA6S99C/Kj7hUgEMfSFxfk2IWrH
	96VI28MevmN2wIhIwLYhseb+67unJuRoqGNV3CcNK4K+7Sx4APYwRr+rvNlCxu1XR/FzvCDgduF
	I
X-Google-Smtp-Source: AGHT+IFSkIT+TXIPw4/bXmAyNxdGsROJwo28zL5x77kShll5vQLukvADn1/0mZJpHVwpHsmR+jFDVQ==
X-Received: by 2002:a17:90a:df86:b0:29b:c432:c1bb with SMTP id p6-20020a17090adf8600b0029bc432c1bbmr257530pjv.24.1709922360133;
        Fri, 08 Mar 2024 10:26:00 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e13-20020a17090ac20d00b0029bb1bb298dsm44821pjt.35.2024.03.08.10.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 10:25:59 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v9 0/4] riscv: Use Kconfig to set unaligned access speed
Date: Fri, 08 Mar 2024 10:25:54 -0800
Message-Id: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADJY62UC/43QyWrDMBAG4FcJOtdF+5JT36MUo2XsCBIrSMW0B
 L975VxiisA+Df8cvlkeqECOUND59EAZ5lhimmowbyfkL3YaoYuhZkQx5Zgw0oVYrLtCf6v1Gsc
 JQn/PyUHv0zTEscOcWbBMicEwVJV7hiH+PCd8ftV8ieU75d/nwJms3eP2TDrcGR2IEGB8sPojx
 zmVOPl3n25o5Wf6Iik+QNJKKuWZ1A6CcrRBsi1J90lWSc/5YMiAmXOyQfINSeQ+ySsZPCYgNPH
 Y+gYpNiRV+6SopJNaMM0lUGUbpHyR7MgvZSUloeCCNANnuEGqLXngcLWS3mBODChrWr/UW/LA4
 bqSQtQVpXfMaPePXJblD0PDG6kWAwAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Eric Biggers <ebiggers@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Charles Lohr <lohr85@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709922358; l=3401;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=mhSJPSDAQcTli1q8D3Nd6CYHlA7Z7/7MIiS4fHVZ1pM=;
 b=9nd3CN2A2kFLFI1Z1TTqF/VXEKKQTjlAt9ZnI6vd03L2nOq15g+9nnrrcshi6CpFEerdBVIEC
 8i49edyJt3XBKpYQyftb+jc88oWQZWh3zRpgB731qopvdzKlje8w8xT
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_102602_670202_3DD6A417 
X-CRM114-Status: GOOD (  12.90  )
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

SWYgdGhlIGhhcmR3YXJlIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgaXMga25vd24gYXQgY29tcGls
ZSB0aW1lLCBpdCBpcwpwb3NzaWJsZSB0byBhdm9pZCBydW5uaW5nIHRoZSB1bmFsaWduZWQgYWNj
ZXNzIHNwZWVkIHByb2JlIHRvIHNwZWVkdXAKYm9vdC10aW1lLgoKU2lnbmVkLW9mZi1ieTogQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjk6Ci0g
Q2xhcmlmeSB3b3JkaW5nIGZvciBSSVNDVl9NSVNBTElHTkVEIEtjb25maWcgb3B0aW9uCi0gTGlu
ayB0byB2ODogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDMwNy1kaXNhYmxlX21pc2Fs
aWduZWRfcHJvYmVfY29uZmlnLXY4LTAtNTVkNjk2Y2IzOThiQHJpdm9zaW5jLmNvbQoKQ2hhbmdl
cyBpbiB2ODoKLSBNaW5vciBjb21taXQgbWVzc2FnZSBjaGFuZ2VzIChDb25vcikKLSBDbGVhbiB1
cCBod3Byb2JlX21pc2FsaWduZWQoKSAoQ29ub3IpCi0gTGluayB0byB2NzogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI0MDMwNi1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLXY3
LTAtNmM5MDQxOWU3YTk2QHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NzoKLSBGaXggY2hlY2tf
dW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyB0byByZXR1cm4gZmFsc2Ugd2hlbiBh
bnkKICBjcHUgaGFzIGVtdWxhdGVkIGFjY2Vzc2VzCi0gRml4IHdvcmRpbmcgaW4gS2NvbmZpZyAo
Q29ub3IpCi0gTGluayB0byB2NjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDMwMS1k
aXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLXY2LTAtNjEyZWJkNjlmNDMwQHJpdm9zaW5j
LmNvbQoKQ2hhbmdlcyBpbiB2NjoKLSBDb25zb2xpZGF0ZSBLY29uZmlnIGludG8gNCBvcHRpb25z
IChwcm9iZSwgZW11bGF0ZWQsIHNsb3csCiAgZWZmaWNpZW50KQotIENoYW5nZSB0aGUgYmVoYXZp
b3Igb2YgImVtdWxhdGVkIiB0byBhbGxvdyBod3Byb2JlIHRvIHJldHVybiAic2xvdyIgaWYKICB1
bmFsaWduZWQgYWNjZXNzZXMgYXJlIG5vdCBlbXVsYXRlZCBieSB0aGUga2VybmVsCi0gV2l0aCB0
aGlzIGNvbnNvbGlkYXRpb24sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQgaXMgYWJs
ZSB0byBiZQogIG1vdmVkIGJhY2sgaW50byB0aGUgb3JpZ2luYWwgZmlsZSAodHJhcHNfbWlzYWxp
Z25lZC5jKQotIExpbmsgdG8gdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAyMjct
ZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12NS0wLWI2ODUzODQ2ZTI3YUByaXZvc2lu
Yy5jb20KCkNoYW5nZXMgaW4gdjU6Ci0gQ2xhcmlmeSBLY29uZmlnIG9wdGlvbnMgZnJvbSBDb25v
cidzIGZlZWRiYWNrCi0gVXNlICJ1bmFsaWduZWQiIGluc3RlYWQgb2YgIm1pc2FsaWduZWQiIGlu
IGludHJvZHVjZWQgZmlsZS9mdW5jdGlvbi4KICBUaGlzIGlzIGEgYml0IGhhcmQgdG8gc3RhbmRh
cmRpemUgYmVjYXVzZSB0aGUgcmlzY3YgbWFudWFsIHNheXMKICAibWlzYWxpZ25lZCIgYnV0IHRo
ZSBleGlzdGluZyBMaW51eCBjb25maWdzIHNheSAidW5hbGlnbmVkIi4KLSBMaW5rIHRvIHY0OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMjE2LWRpc2FibGVfbWlzYWxpZ25lZF9wcm9i
ZV9jb25maWctdjQtMC1kYzAxZTU4MWMwYWNAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY0Ogot
IEFkZCBhZGRpdGlvbmFsIEtjb25maWcgb3B0aW9ucyBmb3IgdGhlIG90aGVyIHVuYWxpZ25lZCBh
Y2Nlc3Mgc3BlZWRzCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0
MDIwMi1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLXYzLTAtYzQ0ZjkxZjAzYmI2QHJp
dm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBSZXZlcnQgY2hhbmdlIHRvIGNzdW0gKEVyaWMp
Ci0gQ2hhbmdlIGlmbmRlZnMgZm9yIGlmZGVmcyAoRXJpYykKLSBDaGFuZ2UgY29uZmlnIGluIE1h
a2VmaWxlIChFbGxpb3QvRXJpYykKLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjQwMjAxLWRpc2FibGVfbWlzYWxpZ25lZF9wcm9iZV9jb25maWctdjItMC03N2MzNjhi
ZWQ3YjJAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHYyOgotIE1vdmUgYXJvdW5kIGRlZmluaXRp
b25zIHRvIHJlZHVjZSBpZmRlZnMgKENsw6ltZW50KQotIE1ha2UgUklTQ1ZfTUlTQUxJR05FRCBk
ZXBlbmQgb24gIUhBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKICAoQ2zDqW1lbnQpCi0g
TGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDEzMS1kaXNhYmxlX21p
c2FsaWduZWRfcHJvYmVfY29uZmlnLXYxLTAtOThkMTU1ZTljZGE4QHJpdm9zaW5jLmNvbQoKLS0t
CkNoYXJsaWUgSmVua2lucyAoNCk6CiAgICAgIHJpc2N2OiBsaWI6IEludHJvZHVjZSBoYXNfZmFz
dF91bmFsaWduZWRfYWNjZXNzKCkKICAgICAgcmlzY3Y6IE9ubHkgY2hlY2sgb25saW5lIGNwdXMg
Zm9yIGVtdWxhdGVkIGFjY2Vzc2VzCiAgICAgIHJpc2N2OiBEZWNvdXBsZSBlbXVsYXRlZCB1bmFs
aWduZWQgYWNjZXNzZXMgZnJvbSBhY2Nlc3Mgc3BlZWQKICAgICAgcmlzY3Y6IFNldCB1bmFsaWdu
ZWQgYWNjZXNzIHNwZWVkIGF0IGNvbXBpbGUgdGltZQoKIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA1OCArKysrLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
Y3B1ZmVhdHVyZS5oICAgICAgICB8ICAzMSArKy0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmls
ZSAgICAgICAgICAgICAgICAgfCAgIDQgKy0KIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
YyAgICAgICAgICAgICB8IDI1NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAgICAgICAgIHwgIDEzICsrCiBhcmNoL3Jpc2N2L2tl
cm5lbC90cmFwc19taXNhbGlnbmVkLmMgICAgICAgfCAgMTcgKy0KIGFyY2gvcmlzY3Yva2VybmVs
L3VuYWxpZ25lZF9hY2Nlc3Nfc3BlZWQuYyB8IDI4MiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogYXJjaC9yaXNjdi9saWIvY3N1bS5jICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICst
CiA4IGZpbGVzIGNoYW5nZWQsIDM3NCBpbnNlcnRpb25zKCspLCAyOTMgZGVsZXRpb25zKC0pCi0t
LQpiYXNlLWNvbW1pdDogNjYxMzQ3NmUyMjVlMDkwY2M5YWFkNDliZTdmYTUwNGUyOTBkZDMzZApj
aGFuZ2UtaWQ6IDIwMjQwMTMxLWRpc2FibGVfbWlzYWxpZ25lZF9wcm9iZV9jb25maWctMDQzYWVh
Mzc1ZjkzCi0tIAotIENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
