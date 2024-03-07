Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFD6C54E58
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 20:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RH6iYl/P2/6H/X1FUwyaQgrD9gyYyBZEgG1i3ySc1Nk=; b=awsNxAm1lQpehi
	H/2krmrrgRa3Es+S6oWJqe18gl1OulJKJUPCjiRMXMbpZs7QjsxPxsKOVrRhlQ2+VHtTWmiWbRiMJ
	u36IEvARprwl41ERYZheTSkaSsFOsYApaH+jh5fJhV7sDmz/l5zt6qbdrzRASH7/VAy0C/mmI3pCe
	girMEptKjgKQlLsMeQmGzeHaeCLYnZN19RTCzSJRCtG22XrhMv8OtG4bQlZGLQTDjF58yyiMJTzYr
	unmqopY8UtzJBIDImnNov+/Ol9LfuzdFwWk6rz4xA9ZmorKm81poG85kubxbljuS10zFjZkwjQCdk
	x+/jsDFzfhvUJi+V7kbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riK0q-00000006CxP-0IUy;
	Thu, 07 Mar 2024 20:06:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJ3y-00000005yP5-0J0e
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 19:05:55 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1dcad814986so10426675ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 11:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709838353; x=1710443153; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CjtJhyRDCpI19Ewh14cBKwZVOZbV4kYbTUkGrdqq6Zk=;
        b=T143V/TPL+QmxAemhR8K+lnUZUEIown/CHRqlklvmEEQD8/qQ6M0iBIq7LFQGXgD/e
         +xmjGC7KWl7i0TNioNrv5doqup+TPFHLalwRCOwB9Wv6dbaaEEvNhNr1ZCo6MPOvrcF9
         xxWu3+qLOnhwTUX2VeX0K758Vhv3NQBmP7Kh1zVFS8OJoRh+Quip+Gxu2u7bYnkwGTpO
         rX8AscUq7r73IVUZvcX2PjRWMr3dcafx/IC+e5tvuPtRYV7/a7sCLnbw++3ibc9gVO2o
         nA6l89bQedpQm9g5oaiiAdXogz1ubtqYa86GG6GxQgcJuoLqP84QEqLBGaA4Q77QTv4e
         8YhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709838353; x=1710443153;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CjtJhyRDCpI19Ewh14cBKwZVOZbV4kYbTUkGrdqq6Zk=;
        b=HCT5hFKKcAR9JWVg+82E8/iFFIRdNP5kAKfBPtbZuBeZTpZXkQM1PbXk1EEPZyh/t0
         wALPI4v/c38XO5Oet0XuzQEXwMpDCV2AmG0CBi8Jm/FgX053lbFIQek9gE1ezjB2KASs
         Hu+/RQa8UcIo2miFP98nGqhAu6rWirjfqJBdDxWurkI4la+uDi1tLHfTAq6UaHwW5sau
         Zk3CYIOEGd61HQE691tBt8Fr6yw1fBHZlyhjsyieM6zfqypgHsKcwmCgihXXCAlsaDI1
         PHUMKBL4IiqECFQfxIcQn5gmXRTMyQNK9TOiSYWIq/YsC1CY0rxYq2gbTAIxLjWbJvpo
         jajA==
X-Gm-Message-State: AOJu0YyiVmuH6544A8U4ImDEM0Hu7zRt68CQZb03fE654UE6c9DvfHa+
	PPdxwAeBMjuhg53id1BCw64OEDy7vJTI64IJwFmM1fqYr+jpN+PMMYfpWtsMLgk=
X-Google-Smtp-Source: AGHT+IE5B0hugsWDTp99p7N7xEvh7wJEMxFLgTSlvpzLfPeOAcoxplC7fkr6cxVl+tPmkAbvsbASVw==
X-Received: by 2002:a17:903:41d0:b0:1dc:a837:7e1b with SMTP id u16-20020a17090341d000b001dca8377e1bmr10394525ple.63.1709838352986;
        Thu, 07 Mar 2024 11:05:52 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902680300b001dd526af36csm1747338plk.295.2024.03.07.11.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:05:52 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 0/4] riscv: Use Kconfig to set unaligned access speed
Date: Thu, 07 Mar 2024 11:05:44 -0800
Message-Id: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAkQ6mUC/43Qy2rDMBAF0F8JWtdF70dW/Y9SjB4jR5BYQSqmJ
 fjfK2cTUwz2arizOJeZB6pQElR0Pj1QgSnVlMcW9NsJ+YsdB+hSaBlRTDkmjHQhVeuu0N/avKZ
 hhNDfS3bQ+zzGNHSYMwuWKRENQ025F4jp59nw+dXyJdXvXH6fhRNZtsftiXS4MzoQIcD4YPVHS
 VOuafTvPt/Qwk/0RVJ8gKSNVMozqR0E5egGydYk3SdZIz3n0ZCImXNyg+Qrksh9kjcyeExAaOK
 x9RukWJFU7ZOikU5qwTSXQJXdIOWLZEd+KRspCQUXpImc4Q1SrckDh6uF9AZzYkBZ8/+X8zz/A
 XP2u9vDAgAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709838351; l=3215;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0lxp9fgkMSqXRqet6QDcLrjZVWsznGOp1aCABxqMD9Y=;
 b=ljet3jnYOUaIeYRX4kKRcuKAcFbCR+qmASHc8JBY/3sVQhg+/D60OJTG4tT8zR6/GM3X2ycqJ
 cpnoVXVWNDaCOX8QArrIwQCTUsSTsixQc0rdIuiAJgBeuLDO3pIBxMR
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_110554_360741_E17DB461 
X-CRM114-Status: GOOD (  13.12  )
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
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjg6Ci0g
TWlub3IgY29tbWl0IG1lc3NhZ2UgY2hhbmdlcyAoQ29ub3IpCi0gQ2xlYW4gdXAgaHdwcm9iZV9t
aXNhbGlnbmVkKCkgKENvbm9yKQotIExpbmsgdG8gdjc6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAyNDAzMDYtZGlzYWJsZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12Ny0wLTZjOTA0MTll
N2E5NkByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4gdjc6Ci0gRml4IGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMgdG8gcmV0dXJuIGZhbHNlIHdoZW4gYW55CiAgY3B1IGhh
cyBlbXVsYXRlZCBhY2Nlc3NlcwotIEZpeCB3b3JkaW5nIGluIEtjb25maWcgKENvbm9yKQotIExp
bmsgdG8gdjY6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAzMDEtZGlzYWJsZV9taXNh
bGlnbmVkX3Byb2JlX2NvbmZpZy12Ni0wLTYxMmViZDY5ZjQzMEByaXZvc2luYy5jb20KCkNoYW5n
ZXMgaW4gdjY6Ci0gQ29uc29saWRhdGUgS2NvbmZpZyBpbnRvIDQgb3B0aW9ucyAocHJvYmUsIGVt
dWxhdGVkLCBzbG93LAogIGVmZmljaWVudCkKLSBDaGFuZ2UgdGhlIGJlaGF2aW9yIG9mICJlbXVs
YXRlZCIgdG8gYWxsb3cgaHdwcm9iZSB0byByZXR1cm4gInNsb3ciIGlmCiAgdW5hbGlnbmVkIGFj
Y2Vzc2VzIGFyZSBub3QgZW11bGF0ZWQgYnkgdGhlIGtlcm5lbAotIFdpdGggdGhpcyBjb25zb2xp
ZGF0aW9uLCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkIGlzIGFibGUgdG8gYmUKICBt
b3ZlZCBiYWNrIGludG8gdGhlIG9yaWdpbmFsIGZpbGUgKHRyYXBzX21pc2FsaWduZWQuYykKLSBM
aW5rIHRvIHY1OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwMjI3LWRpc2FibGVfbWlz
YWxpZ25lZF9wcm9iZV9jb25maWctdjUtMC1iNjg1Mzg0NmUyN2FAcml2b3NpbmMuY29tCgpDaGFu
Z2VzIGluIHY1OgotIENsYXJpZnkgS2NvbmZpZyBvcHRpb25zIGZyb20gQ29ub3IncyBmZWVkYmFj
awotIFVzZSAidW5hbGlnbmVkIiBpbnN0ZWFkIG9mICJtaXNhbGlnbmVkIiBpbiBpbnRyb2R1Y2Vk
IGZpbGUvZnVuY3Rpb24uCiAgVGhpcyBpcyBhIGJpdCBoYXJkIHRvIHN0YW5kYXJkaXplIGJlY2F1
c2UgdGhlIHJpc2N2IG1hbnVhbCBzYXlzCiAgIm1pc2FsaWduZWQiIGJ1dCB0aGUgZXhpc3Rpbmcg
TGludXggY29uZmlncyBzYXkgInVuYWxpZ25lZCIuCi0gTGluayB0byB2NDogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI0MDIxNi1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLXY0
LTAtZGMwMWU1ODFjMGFjQHJpdm9zaW5jLmNvbQoKQ2hhbmdlcyBpbiB2NDoKLSBBZGQgYWRkaXRp
b25hbCBLY29uZmlnIG9wdGlvbnMgZm9yIHRoZSBvdGhlciB1bmFsaWduZWQgYWNjZXNzIHNwZWVk
cwotIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAyMDItZGlzYWJs
ZV9taXNhbGlnbmVkX3Byb2JlX2NvbmZpZy12My0wLWM0NGY5MWYwM2JiNkByaXZvc2luYy5jb20K
CkNoYW5nZXMgaW4gdjM6Ci0gUmV2ZXJ0IGNoYW5nZSB0byBjc3VtIChFcmljKQotIENoYW5nZSBp
Zm5kZWZzIGZvciBpZmRlZnMgKEVyaWMpCi0gQ2hhbmdlIGNvbmZpZyBpbiBNYWtlZmlsZSAoRWxs
aW90L0VyaWMpCi0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDIw
MS1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLXYyLTAtNzdjMzY4YmVkN2IyQHJpdm9z
aW5jLmNvbQoKQ2hhbmdlcyBpbiB2MjoKLSBNb3ZlIGFyb3VuZCBkZWZpbml0aW9ucyB0byByZWR1
Y2UgaWZkZWZzIChDbMOpbWVudCkKLSBNYWtlIFJJU0NWX01JU0FMSUdORUQgZGVwZW5kIG9uICFI
QVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCiAgKENsw6ltZW50KQotIExpbmsgdG8gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAxMzEtZGlzYWJsZV9taXNhbGlnbmVkX3By
b2JlX2NvbmZpZy12MS0wLTk4ZDE1NWU5Y2RhOEByaXZvc2luYy5jb20KCi0tLQpDaGFybGllIEpl
bmtpbnMgKDQpOgogICAgICByaXNjdjogbGliOiBJbnRyb2R1Y2UgaGFzX2Zhc3RfdW5hbGlnbmVk
X2FjY2VzcygpCiAgICAgIHJpc2N2OiBPbmx5IGNoZWNrIG9ubGluZSBjcHVzIGZvciBlbXVsYXRl
ZCBhY2Nlc3NlcwogICAgICByaXNjdjogRGVjb3VwbGUgZW11bGF0ZWQgdW5hbGlnbmVkIGFjY2Vz
c2VzIGZyb20gYWNjZXNzIHNwZWVkCiAgICAgIHJpc2N2OiBTZXQgdW5hbGlnbmVkIGFjY2VzcyBz
cGVlZCBhdCBjb21waWxlIHRpbWUKCiBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNjAgKysrKy0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUu
aCAgICAgICAgfCAgMzEgKystLQogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgIHwgICA0ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAg
ICAgfCAyNTUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGFyY2gvcmlzY3Yva2VybmVsL3N5
c19od3Byb2JlLmMgICAgICAgICAgICB8ICAxMyArKwogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNf
bWlzYWxpZ25lZC5jICAgICAgIHwgIDE3ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC91bmFsaWduZWRf
YWNjZXNzX3NwZWVkLmMgfCAyODIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gv
cmlzY3YvbGliL2NzdW0uYyAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArLQogOCBmaWxlcyBj
aGFuZ2VkLCAzNzYgaW5zZXJ0aW9ucygrKSwgMjkzIGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21t
aXQ6IDY2MTM0NzZlMjI1ZTA5MGNjOWFhZDQ5YmU3ZmE1MDRlMjkwZGQzM2QKY2hhbmdlLWlkOiAy
MDI0MDEzMS1kaXNhYmxlX21pc2FsaWduZWRfcHJvYmVfY29uZmlnLTA0M2FlYTM3NWY5MwotLSAK
LSBDaGFybGllCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
