Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14A3C54E41
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 20:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FiQpQ6lOPrRHuPDsWjbOTDgMwdcIvI5Cfdoy0wAOQp0=; b=E9HUUPXRDF2GVn
	5qJFwWLP/5ksPdjdbXoRBKmgQDpVyY4UDmyxzY7cgt4wdYtz400/8yWYxZTZ6/PREhnk1lcmwIlFt
	ONv2KP0HXMcbUmJA5p9Smc5o/xRK6LBe5HVGaiIC2ozHr71phL+6D2RioufT6dccJnW378DPmDZxN
	ZNkkTfvk7yszrHKnsdRboISJDEL1DHMqgugW3vAxproHueWMGlDRpqOe61EKM/eV6rvkDdx0krHMt
	hdpEVcSqHatvRA9+WgW99vxYomjfopsPt+ycpaQuImWJFuEGGud5yZJVMiDtLvni8+n2XFyOxUU1P
	DK/3ni8UYCv4wjyH48iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxVB-00000001jpd-1WGT;
	Wed, 06 Mar 2024 20:04:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxV8-00000001jnn-245a
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 20:04:32 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1dba177c596so1223615ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 12:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709755469; x=1710360269; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qKUay/eboC7v6g8jePCucowgEylXLTR6sMxM4Bv1SF8=;
        b=2WYTfuZ/5FgQljGY1SPVP5zp2KqtZATUepml1I0BAwezVhxsSt1nyAJrmuSo0VbSOm
         xSwKCjQeaQcm/Erpzmq/Vqhtedp0WCSe8sq1LmhHCR0P51nBD8kUD8c85blpHg6Qwsya
         aSiiwIeVCeLiXEdp9Y45wWBexD5ExIqgHLU5lEnGqE/fm5bnyx9jwid7uK5qUqAck8iN
         izizJB4GhY403efuPY4cw9IQGYHjZskbXJi5/98RdYciK2qOvRYcRtW5er5pq6/MfjNM
         nJz9mT3ulV1OwnDnFLkMpbl58JobWdShIFjbgux4xoqzOAqk6vkYp4eMK4G1+6fFcIHO
         z8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709755469; x=1710360269;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKUay/eboC7v6g8jePCucowgEylXLTR6sMxM4Bv1SF8=;
        b=dTkOhhWBx6VXcyGN+6RMAS1H80f7QIq/xVw5mWQbCWgRWd8luxQFN2iDHRNV99bt3r
         VmAQWn5985KSOTLELib+bYyXy5avxVFEx2nUHiLdPqTMuRIZsK+rhl7anGfu9bzoQNiG
         1bUFBqFJNg+xuwsF04ZqQ1SKdbridgPvepGz1Je6Qr4lWAEi1GMU0P5oWZxfL6NcWQBa
         9OWFoVELmzsRmPErQX8nRm0ItmjGkCQBELypW9sOXFvv6lT0bhUOTajJp+O+DT+iPrBU
         nhhzZoGaA8N0xm9H+O8c4NQd5rB7Zs33nA4tPGUxdeZxbQyoF2lpyxYHZAzTqUPUvrYn
         QcCw==
X-Gm-Message-State: AOJu0YyoOtb1JrXo9OvoYQI/GhJL6OfMfkxLwWJkAox0gcEuIHOR0msd
	yz0WnWem2lKs3aQluEAhtjNrwzQ+vTt5jAaQmkGwiZ0kmuspsKdb3t9PIgFpYaM=
X-Google-Smtp-Source: AGHT+IFcRftRFdHRA7STML/iSxC0fVuC2YX2iC0np1Vii+/hyKYKXEUuZ+g+4TvJ8a4sfCUIx1o79g==
X-Received: by 2002:a17:902:f68b:b0:1db:b96f:4a50 with SMTP id l11-20020a170902f68b00b001dbb96f4a50mr1469650plg.14.1709755469033;
        Wed, 06 Mar 2024 12:04:29 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001dd42bbb08asm874913plx.253.2024.03.06.12.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 12:04:28 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v7 0/4] riscv: Use Kconfig to set unaligned access speed
Date: Wed, 06 Mar 2024 12:00:00 -0800
Message-Id: <20240306-disable_misaligned_probe_config-v7-0-6c90419e7a96@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEDL6GUC/43Qy2rDMBAF0F8JWtdFb8lZ9T9KMXqMkoHEClIxL
 cH/XiWbmGKwV8O9i3Nh7qRCQajkeLiTAhNWzGML5u1AwtmNJ+gwtkw45ZIywbqI1fkLDNd2L3g
 aIQ63kj0MIY8JTx2VwoETRqVekKbcCiT8eS58frV8xvqdy+9zcGKPdr89sY52vY1MKehDdPaj4
 JQrjuE95Ct58BN/kZzuIHkjjQlCWw/ReL5CiiXJt0nRyCBl6lmiwnu9QsoFyfQ2KRsZA2WgLAv
 UhRVSLUhutknVSK+tElZq4MatkPpFij2/1I3UjIOPuk9S0H/kPM9/03iv8HACAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709755467; l=3010;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lTFn9I0Y3b7Ejl8OaTTiYWgoS6zNgQwuVEQYPtx30SE=;
 b=8MyknLAmGtODfurxjwQVAiKmK3GpXVKDJV0yFZpoxyv/K1imsgOekLb25lWMFMgTfg5vAl5WN
 a1og6lbKqyAAyjG2R1kLCR4dQauYz6Wnh2mmOCNxauABgjHrh1e+Zyz
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_120430_956132_0A26E79F 
X-CRM114-Status: GOOD (  12.33  )
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
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjc6Ci0g
Rml4IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMgdG8gcmV0dXJuIGZh
bHNlIHdoZW4gYW55CiAgY3B1IGhhcyBlbXVsYXRlZCBhY2Nlc3NlcwotIEZpeCB3b3JkaW5nIGlu
IEtjb25maWcgKENvbm9yKQotIExpbmsgdG8gdjY6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNDAzMDEtZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12Ni0wLTYxMmViZDY5ZjQz
MEByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjY6Ci0gQ29uc29saWRhdGUgS2NvbmZpZyBpbnRv
IDQgb3B0aW9ucyAocHJvYmUsIGVtdWxhdGVkLCBzbG93LAogIGVmZmljaWVudCkKLSBDaGFuZ2Ug
dGhlIGJlaGF2aW9yIG9mICJlbXVsYXRlZCIgdG8gYWxsb3cgaHdwcm9iZSB0byByZXR1cm4gInNs
b3ciIGlmCiAgdW5hbGlnbmVkIGFjY2Vzc2VzIGFyZSBub3QgZW11bGF0ZWQgYnkgdGhlIGtlcm5l
bAotIFdpdGggdGhpcyBjb25zb2xpZGF0aW9uLCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkIGlzIGFibGUgdG8gYmUKICBtb3ZlZCBiYWNrIGludG8gdGhlIG9yaWdpbmFsIGZpbGUgKHRy
YXBzX21pc2FsaWduZWQuYykKLSBMaW5rIHRvIHY1OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjQwMjI3LWRpc2FibGVfbWlzYWxpZ25lZF9wcm9iZV9jb25maWctdjUtMC1iNjg1Mzg0NmUy
N2FAcml2b3NpbmMuY29tCgpDaGFuZ2VzIGluIHY1OgotIENsYXJpZnkgS2NvbmZpZyBvcHRpb25z
IGZyb20gQ29ub3IncyBmZWVkYmFjawotIFVzZSAidW5hbGlnbmVkIiBpbnN0ZWFkIG9mICJtaXNh
bGlnbmVkIiBpbiBpbnRyb2R1Y2VkIGZpbGUvZnVuY3Rpb24uCiAgVGhpcyBpcyBhIGJpdCBoYXJk
IHRvIHN0YW5kYXJkaXplIGJlY2F1c2UgdGhlIHJpc2N2IG1hbnVhbCBzYXlzCiAgIm1pc2FsaWdu
ZWQiIGJ1dCB0aGUgZXhpc3RpbmcgTGludXggY29uZmlncyBzYXkgInVuYWxpZ25lZCIuCi0gTGlu
ayB0byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDIxNi1kaXNhYmxlX21pc2Fs
aWduZWRfcHJvYmVfY29uZmlnLXY0LTAtZGMwMWU1ODFjMGFjQHJpdm9zaW5jLmNvbQoKQ2hhbmdl
cyBpbiB2NDoKLSBBZGQgYWRkaXRpb25hbCBLY29uZmlnIG9wdGlvbnMgZm9yIHRoZSBvdGhlciB1
bmFsaWduZWQgYWNjZXNzIHNwZWVkcwotIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNDAyMDItZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12My0wLWM0NGY5
MWYwM2JiNkByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gUmV2ZXJ0IGNoYW5nZSB0byBj
c3VtIChFcmljKQotIENoYW5nZSBpZm5kZWZzIGZvciBpZmRlZnMgKEVyaWMpCi0gQ2hhbmdlIGNv
bmZpZyBpbiBNYWtlZmlsZSAoRWxsaW90L0VyaWMpCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI0MDIwMS1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLXYy
LTAtNzdjMzY4YmVkN2IyQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2MjoKLSBNb3ZlIGFyb3Vu
ZCBkZWZpbml0aW9ucyB0byByZWR1Y2UgaWZkZWZzIChDbMOpbWVudCkKLSBNYWtlIFJJU0NWX01J
U0FMSUdORUQgZGVwZW5kIG9uICFIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCiAgKENs
w6ltZW50KQotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMzEt
ZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12MS0wLTk4ZDE1NWU5Y2RhOEByaXZvc2lu
Yy5jb20KCi0tLQpDaGFybGllIEplbmtpbnMgKDQpOgogICAgICByaXNjdjogbGliOiBJbnRyb2R1
Y2UgaGFzX2Zhc3RfdW5hbGlnbmVkX2FjY2VzcyBmdW5jdGlvbgogICAgICByaXNjdjogT25seSBj
aGVjayBvbmxpbmUgY3B1cyBmb3IgZW11bGF0ZWQgYWNjZXNzZXMKICAgICAgcmlzY3Y6IERlY291
cGxlIGVtdWxhdGVkIHVuYWxpZ25lZCBhY2Nlc3NlcyBmcm9tIGFjY2VzcyBzcGVlZAogICAgICBy
aXNjdjogU2V0IHVuYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgYXQgY29tcGlsZSB0aW1lCgogYXJjaC9y
aXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYwICsrKystLQogYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggICAgICAgIHwgIDMxICsrLS0KIGFyY2gvcmlz
Y3Yva2VybmVsL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgNCArLQogYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgIHwgMjU1IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgICAgICAgfCAgMTUg
KysKIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyAgICAgICB8ICAxNyArLQog
YXJjaC9yaXNjdi9rZXJuZWwvdW5hbGlnbmVkX2FjY2Vzc19zcGVlZC5jIHwgMjgyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2xpYi9jc3VtLmMgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDcgKy0KIDggZmlsZXMgY2hhbmdlZCwgMzc4IGluc2VydGlvbnMoKyksIDI5
MyBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA2NjEzNDc2ZTIyNWUwOTBjYzlhYWQ0OWJl
N2ZhNTA0ZTI5MGRkMzNkCmNoYW5nZS1pZDogMjAyNDAxMzEtZGlzYWJsZV9taXNhbGlnbmVkX3By
b2JlX2NvbmZpZy0wNDNhZWEzNzVmOTMKLS0gCi0gQ2hhcmxpZQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
