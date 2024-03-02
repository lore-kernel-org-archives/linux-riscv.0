Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7627C54E55
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 01:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x1VOdJdUvmL7aI8QL0VztT39uito+/7yMpGWXMS2i0o=; b=byYCRNo6TZ/oHL
	TOPIUHdek/oEGTdWgku70AVyEQtJrawPVU1ebD7Y6eB6UjAe+LmE1xBNDiffXgX5yvlI1FB0RLhrP
	bpOCzHqrkBewNBpDs/hFKZyt3GS9hL3UM4+4DglaoNqiBL5l1MNR8s7sJpQ0mFiWKoobjB4aLOW1q
	mSq5xqGDvIAeaKoAlUkMXGd7Gz2dW0yir1pe8eO7COpmbH03A7cJXjaqV2OFQ29t00LkNWah1aiZ3
	ZjlKQxrRq70Fm4XTt/rDwpyRBPZsh7DUI2KyILkMLoBGMu5enevPZXbvKrap+tQmliGS5pyllA0rS
	bvJRK1i83j8td2cJSrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgERd-00000002Vuw-3Idm;
	Sat, 02 Mar 2024 01:45:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgERZ-00000002VtI-3fTE
	for linux-riscv@lists.infradead.org;
	Sat, 02 Mar 2024 01:45:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dc49afb495so26920315ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 17:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709343939; x=1709948739; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5mFoFuFbcNJOPQmIAO2L9Vn4st8gXt84zb/i3w3TkE=;
        b=Z9dcWhRAaa6Lfna+s+g91boo2W8fimSxLU+KpV/yhJgOu1fWpiAttgEMtRjuvPSvKM
         OuEMSaYikRD/5zIL0XkvOIk4uPiN5fJQSHT4pG6fUZ2lWeyfBcQ18RhUMfEPoJVVMxvQ
         7QHYkDbERqPaqC37MmrdAImIILFsa2MgwDw7kz7/AzEHzYDAk7wz19e9A1tjw+RtS6Ww
         1KBfSrPw/zE8sVbzA8L+ueiL24pifUad7gAQ2xDq/+dVsoVEZCdnc+cjU2v1ROqKwDeV
         J+WPKOpiSfs9DJCVdAhzGQnpSie/HFKbHRkoEZHkFFWTq8SLZdqP2FDhoSPA/OZkK1fs
         vbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709343939; x=1709948739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5mFoFuFbcNJOPQmIAO2L9Vn4st8gXt84zb/i3w3TkE=;
        b=lRDYjaEyj81Sw5uStNoTi9z6H4DOHEhVMsG0ZLx+CPEQFAVhWfZwEGcFzsAlFdNUIr
         bAf0W6kKG0DywOyoMSFKHkY2Ia9Oo/Db/MgvHslr7TJayMcaQuBhQUoTUeZEGF5ugMBV
         vmiOy0vQhsZOQbo4K2ZTe59fOe2FolAexIDb6h60eCtM2KflO2rFd1c5OHrQJt19ceK+
         Q/tlKv+JqOcJr78KttsV11rxKOCK1VKVBAUxCif/wH2XmLmjme7RRXyos/Cajog7Ypvo
         H+x/gjZh5bdMee1xXQSuoX3BY7kri+d531y/qxqeSqy2DoIM9O846cxcNfqDnoXCKhrA
         8R/w==
X-Gm-Message-State: AOJu0Ywpx4SYxXhP6YN+XqTpShl7DubCnPupqxXs2bQKITClVIrfB52i
	s2080hl09/VDr7nnoFuFuQp9uXesP9wOgbJ5LWCnxvcwCASUQt3pWH1NH1/Zlrg=
X-Google-Smtp-Source: AGHT+IE0pm1Ved8FSNSap/X5JQA5ih5TOaWSZiqZ2l0wNiPwXcQnN865flvrlFZVHf68Fg+S+qfvwg==
X-Received: by 2002:a17:903:2312:b0:1db:f03b:6f5b with SMTP id d18-20020a170903231200b001dbf03b6f5bmr4480786plh.56.1709343939487;
        Fri, 01 Mar 2024 17:45:39 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b001d71729ec9csm4129039plj.188.2024.03.01.17.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 17:45:38 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 0/4] riscv: Use Kconfig to set unaligned access speed
Date: Fri, 01 Mar 2024 17:45:31 -0800
Message-Id: <20240301-disable_misaligned_probe_config-v6-0-612ebd69f430@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALuE4mUC/43Ny2rDMBCF4VcJWtdFd8ld9T1KMLqMnYFEClIxK
 cHvXiWbmmJwVsM/i+/cSYWCUMnH4U4KzFgxpxb67UDCyaUJOoytCadcUiZYF7E6f4bh0u4ZpwR
 xuJbsYQg5jTh1VAoHThg19oI05VpgxNtz4evY+oT1O5ef5+DMHt/X7Zl1tOttZEpBH6KznwXnX
 DGF95Av5MHP/I/k9AWSN9KYILT1EI3nG6RYk3yfFI0MUo49G6nwXm+QckUyvU/KRsZAGSjLAnV
 hg1Qrkpt9UjXSa6uElRq4cf/IZVl+AUKHzL4dAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709343937; l=2745;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=AF/qtPzIolOaxe9/FTqC+uBJizpQ6vi9O7Mq+l5S1Qo=;
 b=DxHWkIvZOJ4jwk8nWNt+XaA2f9CDv4zvoJntx/UIADDVjk1h/1Ra18dSlDBspY6sPMiWm4gKN
 lx4qP5yDMTzDvgP4Kgl/o42OQCvqNlgNMHUhis9MVSm2fNoeiobTJxM
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_174541_959571_1746E3C8 
X-CRM114-Status: GOOD (  12.78  )
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
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjY6Ci0g
Q29uc29saWRhdGUgS2NvbmZpZyBpbnRvIDQgb3B0aW9ucyAocHJvYmUsIGVtdWxhdGVkLCBzbG93
LAogIGVmZmljaWVudCkKLSBDaGFuZ2UgdGhlIGJlaGF2aW9yIG9mICJlbXVsYXRlZCIgdG8gYWxs
b3cgaHdwcm9iZSB0byByZXR1cm4gInNsb3ciIGlmCiAgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBu
b3QgZW11bGF0ZWQgYnkgdGhlIGtlcm5lbAotIFdpdGggdGhpcyBjb25zb2xpZGF0aW9uLCBjaGVj
a191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkIGlzIGFibGUgdG8gYmUKICBtb3ZlZCBiYWNrIGlu
dG8gdGhlIG9yaWdpbmFsIGZpbGUgKHRyYXBzX21pc2FsaWduZWQuYykKLSBMaW5rIHRvIHY1OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMjI3LWRpc2FibGVfbWlzYWxpZ25lZF9wcm9i
ZV9jb25maWctdjUtMC1iNjg1Mzg0NmUyN2FAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY1Ogot
IENsYXJpZnkgS2NvbmZpZyBvcHRpb25zIGZyb20gQ29ub3IncyBmZWVkYmFjawotIFVzZSAidW5h
bGlnbmVkIiBpbnN0ZWFkIG9mICJtaXNhbGlnbmVkIiBpbiBpbnRyb2R1Y2VkIGZpbGUvZnVuY3Rp
b24uCiAgVGhpcyBpcyBhIGJpdCBoYXJkIHRvIHN0YW5kYXJkaXplIGJlY2F1c2UgdGhlIHJpc2N2
IG1hbnVhbCBzYXlzCiAgIm1pc2FsaWduZWQiIGJ1dCB0aGUgZXhpc3RpbmcgTGludXggY29uZmln
cyBzYXkgInVuYWxpZ25lZCIuCi0gTGluayB0byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDI0MDIxNi1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLXY0LTAtZGMwMWU1ODFj
MGFjQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NDoKLSBBZGQgYWRkaXRpb25hbCBLY29uZmln
IG9wdGlvbnMgZm9yIHRoZSBvdGhlciB1bmFsaWduZWQgYWNjZXNzIHNwZWVkcwotIExpbmsgdG8g
djM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAyMDItZGlzYWJsZV9taXNhbGlnbmVk
X3Byb2JlX2NvbmZpZy12My0wLWM0NGY5MWYwM2JiNkByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4g
djM6Ci0gUmV2ZXJ0IGNoYW5nZSB0byBjc3VtIChFcmljKQotIENoYW5nZSBpZm5kZWZzIGZvciBp
ZmRlZnMgKEVyaWMpCi0gQ2hhbmdlIGNvbmZpZyBpbiBNYWtlZmlsZSAoRWxsaW90L0VyaWMpCi0g
TGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDIwMS1kaXNhYmxlX21p
c2FsaWduZWRfcHJvYmVfY29uZmlnLXYyLTAtNzdjMzY4YmVkN2IyQHJpdm9zaW5jLmNvbQoKQ2hh
bmdlcyBpbiB2MjoKLSBNb3ZlIGFyb3VuZCBkZWZpbml0aW9ucyB0byByZWR1Y2UgaWZkZWZzIChD
bMOpbWVudCkKLSBNYWtlIFJJU0NWX01JU0FMSUdORUQgZGVwZW5kIG9uICFIQVZFX0VGRklDSUVO
VF9VTkFMSUdORURfQUNDRVNTCiAgKENsw6ltZW50KQotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNDAxMzEtZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12
MS0wLTk4ZDE1NWU5Y2RhOEByaXZvc2luYy5jb20KCi0tLQpDaGFybGllIEplbmtpbnMgKDQpOgog
ICAgICByaXNjdjogbGliOiBJbnRyb2R1Y2UgaGFzX2Zhc3RfdW5hbGlnbmVkX2FjY2VzcyBmdW5j
dGlvbgogICAgICByaXNjdjogT25seSBjaGVjayBvbmxpbmUgY3B1cyBmb3IgZW11bGF0ZWQgYWNj
ZXNzZXMKICAgICAgcmlzY3Y6IERlY291cGxlIGVtdWxhdGVkIHVuYWxpZ25lZCBhY2Nlc3NlcyBm
cm9tIGFjY2VzcyBzcGVlZAogICAgICByaXNjdjogU2V0IHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQg
YXQgY29tcGlsZSB0aW1lCgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDU4ICsrKystLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICAg
ICAgIHwgIDMxICsrLS0KIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAg
ICB8ICAgNCArLQogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgIHwg
MjU1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jICAgICAgICAgICAgfCAgMjEgKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMgICAgICAgfCAgMjIgKy0tCiBhcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRfYWNj
ZXNzX3NwZWVkLmMgfCAyODIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlz
Y3YvbGliL2NzdW0uYyAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogOCBmaWxlcyBjaGFu
Z2VkLCAzODMgaW5zZXJ0aW9ucygrKSwgMjk3IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6
IDY2MTM0NzZlMjI1ZTA5MGNjOWFhZDQ5YmU3ZmE1MDRlMjkwZGQzM2QKY2hhbmdlLWlkOiAyMDI0
MDEzMS1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLTA0M2FlYTM3NWY5MwotLSAKLSBD
aGFybGllCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
