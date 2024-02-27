Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD47C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 23:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ay6kF+7gvsFWQvfF1FOpgjGFt844Z5PWwrTYIF7x/AY=; b=Ja87sTHQT2AYrL
	3QYmxwtcHKV7jWncwEgwrsJQ/6rPk2QzbfLVTRTjcK8r+6kAqYm6CkUpBlXCzftdtFFlvxvKu6KBX
	NumZU2Wt0aLxIhpMBn0XGghIZeEnGp18rjebAIcV6PXgBPBMYYclmrJqLIGaOvvp3emUeNcSOPg5A
	w/IB/OX5UC10+qHoFbJ92t09svsbBUf978D+EXu+azw2cPZNlLPTzPtUxyht0dO0zqBVOeCfkqlSB
	9nT4bYVszRMELBOYivZySA046HStRfUUppsmbC7hDj3mOjwsPSi6mXRXybVMO3aGOzvfdtplZYXO/
	bzXGY2sVQWzW2bSRcZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf6eu-00000007CVZ-3Erm;
	Tue, 27 Feb 2024 23:14:48 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf6er-00000007CSy-1AUP
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 23:14:47 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5d8b276979aso3773137a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 15:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709075683; x=1709680483; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOwhG/07dg+gcX9xrTrFROvlLzGJhL4J2NDKYOWOnRM=;
        b=L92ljBgfGlmx+Ujo8h9LU5VT0Wad00ha9ic5COcHtluHxhQwfr2CrT3uOa4tD9/mMX
         /QnRDXC27KZOLfZ7H8X/nFkWuGBFxEhCuvVyehNaPy1aCgsGAdn2m++Vwx+N3y88kSbE
         iV0rjP2mEG2EMa594LpCHFndBclEaVXXm9aa2nMlXyRMeEVURaaotf1PYxlin/pO1n+N
         qR2GvYDJ/QhWTGbWCQK2oYPk2WcxmTgONDQkjjDhU9YtSNOLGJTbPbsrzj4VGJcsqxcR
         WJ4gQarc1rGd6KqnAA01OhjlMw6+kzwufSBuTbuBUzrVFhlrI0ouLJu/EcqSMR0B2xM7
         bjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709075683; x=1709680483;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOwhG/07dg+gcX9xrTrFROvlLzGJhL4J2NDKYOWOnRM=;
        b=gY8RFEQGtBNvvnU9Cd/c9MdLn7ENS29vgT7AjxvNLKI4oTEaf1AOhrjq+VoxL3Gjgp
         exl4g2Kos8ErstwliEpFmK7GRqgLG77yHd8xtCznh5TyvcqkYYD5QbHCVh8+xoVW3pNf
         IezS93CAyUeVcSFZWXgc+dBDPsiK3YHUktlJekCy3Ba4wEJ6ZJto9IhvahhJm/FvV7zp
         BvaI4XaxEDAHziZWwHKkSatD1fEgzGSCWJZgHaX+FJ6Bqgv68QET4+qqM0pmlO/e8Oyu
         buMHGvSTKbOOKEEhcHC1Z/qV6+IGC/FTvbaLEV3cMpeI2hrHW/E+QDQ2KUdS6x9G17TR
         1KLg==
X-Gm-Message-State: AOJu0Yw4XBcFEPImSYt7WOSWSdxkVEpFAV7XxRFSdT2r6S10OcjMwAKt
	CCcKNz/2vSxZJ0pEaDbqb1qD23IB2abXdJhsdeVdKUjZGg58qoxJwMlhKz0g5dM=
X-Google-Smtp-Source: AGHT+IHssyVg1DjomAETOfWcmMnS8hOYo64YOhc2SMJJP7+Aa1K8+N+lOeeJNPKYw2+Y917lPIUQGw==
X-Received: by 2002:a05:6a20:c68e:b0:1a0:df5f:99cb with SMTP id gq14-20020a056a20c68e00b001a0df5f99cbmr3609699pzb.27.1709075682714;
        Tue, 27 Feb 2024 15:14:42 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id l9-20020a635709000000b005ce998b9391sm5455645pgb.67.2024.02.27.15.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 15:14:41 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v5 0/2] riscv: Use Kconfig to set unaligned access speed
Date: Tue, 27 Feb 2024 15:13:12 -0800
Message-Id: <20240227-disable_misaligned_probe_config-v5-0-b6853846e27a@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIhs3mUC/43NzWpDIRCG4VsJrmvx9/x01fso5aDjeDKQaNAiL
 eHce002DSWQrIZ3Fs93ZhULYWVvuzMr2KhSTj3sy47B3qUVOYXeTAllhNSSB6rOH3A59nugNWF
 YTiV7XCCnSCsXRjt0erRx1qwrp4KRvq8LH5+991S/cvm5DjZ5+T5vN8kFn6cgrcUZgpveC7VcK
 cEr5CO78E39kUo8QapOjiPoYfIYRq/ukPqWVI9J3UkwJs4yCu39cIc0N6QcHpOmkwGERDtJEA7
 +kdu2/QJF4sz9ygEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709075681; l=2131;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=V19HUq/JemRqcELPHFwcZliVz8Klrd9nqh2ouMM+iVQ=;
 b=voRMT+T4E4Amqngh/Ts1I/w5hpMDAjgLL2GVHpkeTAn1nZRTQZ+YySoYOa3gUGKJ8BeDXxAAc
 c8IpIXzHWJ3CglX0o3xFRdHHGMAZrzC5AKHY2vPZBx7ByVdiyiiAyqa
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_151445_605856_C2CA2069 
X-CRM114-Status: GOOD (  10.46  )
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
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjU6Ci0g
Q2xhcmlmeSBLY29uZmlnIG9wdGlvbnMgZnJvbSBDb25vcidzIGZlZWRiYWNrCi0gVXNlICJ1bmFs
aWduZWQiIGluc3RlYWQgb2YgIm1pc2FsaWduZWQiIGluIGludHJvZHVjZWQgZmlsZS9mdW5jdGlv
bi4KICBUaGlzIGlzIGEgYml0IGhhcmQgdG8gc3RhbmRhcmRpemUgYmVjYXVzZSB0aGUgcmlzY3Yg
bWFudWFsIHNheXMKICAibWlzYWxpZ25lZCIgYnV0IHRoZSBleGlzdGluZyBMaW51eCBjb25maWdz
IHNheSAidW5hbGlnbmVkIi4KLSBMaW5rIHRvIHY0OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjQwMjE2LWRpc2FibGVfbWlzYWxpZ25lZF9wcm9iZV9jb25maWctdjQtMC1kYzAxZTU4MWMw
YWNAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY0OgotIEFkZCBhZGRpdGlvbmFsIEtjb25maWcg
b3B0aW9ucyBmb3IgdGhlIG90aGVyIHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWRzCi0gTGluayB0byB2
MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDIwMi1kaXNhYmxlX21pc2FsaWduZWRf
cHJvYmVfY29uZmlnLXYzLTAtYzQ0ZjkxZjAzYmI2QHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2
MzoKLSBSZXZlcnQgY2hhbmdlIHRvIGNzdW0gKEVyaWMpCi0gQ2hhbmdlIGlmbmRlZnMgZm9yIGlm
ZGVmcyAoRXJpYykKLSBDaGFuZ2UgY29uZmlnIGluIE1ha2VmaWxlIChFbGxpb3QvRXJpYykKLSBM
aW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMjAxLWRpc2FibGVfbWlz
YWxpZ25lZF9wcm9iZV9jb25maWctdjItMC03N2MzNjhiZWQ3YjJAcml2b3NpbmMuY29tCgpDaGFu
Z2VzIGluIHYyOgotIE1vdmUgYXJvdW5kIGRlZmluaXRpb25zIHRvIHJlZHVjZSBpZmRlZnMgKENs
w6ltZW50KQotIE1ha2UgUklTQ1ZfTUlTQUxJR05FRCBkZXBlbmQgb24gIUhBVkVfRUZGSUNJRU5U
X1VOQUxJR05FRF9BQ0NFU1MKICAoQ2zDqW1lbnQpCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI0MDEzMS1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLXYx
LTAtOThkMTU1ZTljZGE4QHJpdm9zaW5jLmNvbQoKLS0tCkNoYXJsaWUgSmVua2lucyAoMik6CiAg
ICAgIHJpc2N2OiBsaWI6IEludHJvZHVjZSBoYXNfZmFzdF91bmFsaWduZWRfYWNjZXNzIGZ1bmN0
aW9uCiAgICAgIHJpc2N2OiBTZXQgdW5hbGlnbmVkIGFjY2VzcyBzcGVlZCBhdCBjb21waWxlIHRp
bWUKCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICA0NyArKysr
Ky0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oICAgICAgIHwgIDQzICsrKyst
CiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgNiArLQogYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgfCAyNTUgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZV9lbXVsYXRlZF9hY2Nl
c3MuYyB8ICA2NCArKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyAgICAg
ICAgICAgfCAgMjMgKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgICAg
ICB8ICA1NCArLS0tLS0tCiBhcmNoL3Jpc2N2L2xpYi9jc3VtLmMgICAgICAgICAgICAgICAgICAg
ICB8ICAgNyArLQogOCBmaWxlcyBjaGFuZ2VkLCAxNzMgaW5zZXJ0aW9ucygrKSwgMzI2IGRlbGV0
aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDY2MTM0NzZlMjI1ZTA5MGNjOWFhZDQ5YmU3ZmE1MDRl
MjkwZGQzM2QKY2hhbmdlLWlkOiAyMDI0MDEzMS1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29u
ZmlnLTA0M2FlYTM3NWY5MwotLSAKLSBDaGFybGllCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
