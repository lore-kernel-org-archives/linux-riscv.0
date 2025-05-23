Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DC8C54ED0
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcMOsj/OM9jNSFkIe5LENXvCewKemMs6Em88uJC6Kg4=; b=hciMoiCtdb2dpu
	uReue33PzLVijwPrtB2cVltBbGQiMju2gjeiCd9HmuvRnlxq2N/bBzBoCyEecGTHdKh/KrrVZVbSH
	4ET7QTcXfbhw00q/+9b+NwT7qGsG3f2m0y6yCHYq1Bynf0X2AEycmkyRbbLsVv47JKjfZ8yeXh4+j
	Z+UhqghnNpHgaZAJhF58eQ3NczFB5HHKhKehtmSrzh3hjFF2o73j8Qe1I0oGqenJ56jIFh6m2HVjK
	CNfq9VM9XtJkd6fM2BbzlmKqsQwEZxL8Bb/ScqFLUN+BBfzOnjoifs0DSXK8eUz+buTC6rEc5GxeB
	WAAHIweTvrjJX0ABnBVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPXd-00000003ZuD-2ydI;
	Fri, 23 May 2025 10:22:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPXb-00000003Zs9-1Ew8
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:22:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-742c9907967so5698721b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995735; x=1748600535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A009lvvwohkyOAIzgl/V0VoElDX7rOXpEDLGhgR7o3M=;
        b=CKwpvJ6pXYEwxOJVj4uhVbM7X7u8UUADNVu+UwU9I1i30iIgq1Ep0k0Nyxcq0IsOMv
         SlOVmE4C4Vt8qNKqEZCPrtcZGyQ5RVURt/r6ZsPUGJG+sc3RObTjV6ZlhhcdPPcb7EDP
         bKJE/h4SUrcdjnn/i5Qi22e+D7owcmAX012ESyJOfrM+KzrAvvwLs3RC5RTiSS2WodEc
         HMH1gasQTxVJBBrWpKK4HivpOrXTfBEw5xGx6FXXnd0+Bq2CnyqpXzSmtNjz0bAM5/MD
         lTy6JeMShc+MvJ2JCLhCt5iPBNoYz6xWSZpsOJyOhlaI8t63wj7AkxPCtHp7SkUGh9bm
         0FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995735; x=1748600535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A009lvvwohkyOAIzgl/V0VoElDX7rOXpEDLGhgR7o3M=;
        b=WSApCfOp5XEi3BlfKN6N+yDsx5Mr1wcJrfKNKwtX5ymitMehutM+DlY+GZrkJ3pjVH
         4SFo00bgBfCtriJvkKuHusmI0ik+H1/LBXMDgVtUBZhGIJIc/WU4ZL8h8hPM6mv8X/C0
         pt4z7Ho0fDWA9q1KpgK5Vxg0gDYlOZrrLpvacqB4SpYweOd2jJGPh8n7bji/NCy5Vmsi
         /V4wLhDYVRQF7nTY15Ize5i4vf2gUNW8adFb8T+XlZm0/5E6vFMctq78ECnWTn62uHDs
         RpfbWRZMXbeYsYc07Q2sYzE1v3nga/LW3G/UNrj7iKKbD/a/UL2RQjCRNba/2WLMaRWV
         WwEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbZ6wFb5j0uqO+/F5B+6iuqqRR70p6qpyAJVRw5/5gztZJmC7Xae4QRK2RFo51wJ1tid1ZxryNmJUL0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOGHrlSgKHwPcI26fa5LXTIvHRgbR7fpXWrLgSKzjTGGS4OSeP
	HDZOXorQ5bPCL8Q4p3uAGoE3SmoOAzteDKB70W1qhYaCP0QbxtKZJzOXgaq34AQKUn4=
X-Gm-Gg: ASbGncsPWMA2uWsmavSZxz248fA9DwwH/CZyBy9jZ7ej3p1w5bOmpXRB5McIqq8Yc0a
	XbR3oWzM69b5OLWKNQji6TiPpHoXrvjBBSUCpI4zHMa29YpoSqJZdrK9e2FY0BJv8522Pe+Jr0h
	f7jltuD52/i8cndoGB9VlfwpV5DPHkiw9iqX6VRb0JMl4IUtgJqDBx+2iMlejaLZ6LoEb323QY7
	VMdLrWlRQxm2H04vdG2Z7ErvHF1UnZc0+BwgQcQuHuS2zqvIZXDue52Qgqwh9IzEkmWjzkb0tGz
	pyOVrIRsEtad3oAVUQA2Ha4CHHCuzbaPg/Yt6Hhzz0UDUkgZ8Z5J
X-Google-Smtp-Source: AGHT+IE9N3X9KDPTPZdG9Av1L22LlFJdp3yaREd+YMGOtZmaxWxoGKAttvYet6X1ORsuI88C9cibGw==
X-Received: by 2002:a05:6a00:2350:b0:73e:5aa:4f64 with SMTP id d2e1a72fcca58-745ed865535mr3448091b3a.10.1747995734706;
        Fri, 23 May 2025 03:22:14 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:22:14 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 09/14] riscv: misaligned: move emulated access uniformity check in a function
Date: Fri, 23 May 2025 12:19:26 +0200
Message-ID: <20250523101932.1594077-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032215_340006_E92A4C5A 
X-CRM114-Status: GOOD (  11.76  )
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

U3BsaXQgdGhlIGNvZGUgdGhhdCBjaGVjayBmb3IgdGhlIHVuaWZvcm1pdHkgb2YgbWlzYWxpZ25l
ZCBhY2Nlc3NlcwpwZXJmb3JtYW5jZSBvbiBhbGwgY3B1cyBmcm9tIGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKQp0byBpdHMgb3duIGZ1bmN0aW9uIHdoaWNoIHdpbGwg
YmUgdXNlZCBmb3IgZGVsZWdhdGlvbiBjaGVjay4gTm8KZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVu
ZGVkLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
PgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyMCArKysrKysrKysrKysr
Ky0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCmluZGV4IGYxYjJhZjUxNTU5Mi4uN2Vj
YWE4MTAzZmU3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVk
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCkBAIC02NDUsNiAr
NjQ1LDE4IEBAIGJvb2wgX19pbml0IGNoZWNrX3ZlY3Rvcl91bmFsaWduZWRfYWNjZXNzX2VtdWxh
dGVkX2FsbF9jcHVzKHZvaWQpCiB9CiAjZW5kaWYKIAorc3RhdGljIGJvb2wgYWxsX2NwdXNfdW5h
bGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQodm9pZCkKK3sKKwlpbnQgY3B1OworCisJZm9y
X2VhY2hfb25saW5lX2NwdShjcHUpCisJCWlmIChwZXJfY3B1KG1pc2FsaWduZWRfYWNjZXNzX3Nw
ZWVkLCBjcHUpICE9CisJCSAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxB
VEVEKQorCQkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHRydWU7Cit9CisKICNpZmRlZiBDT05G
SUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQKIAogc3RhdGljIGJvb2wgdW5hbGlnbmVkX2N0bCBf
X3JlYWRfbW9zdGx5OwpAQCAtNjgzLDggKzY5NSw2IEBAIHN0YXRpYyBpbnQgY3B1X29ubGluZV9j
aGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKHVuc2lnbmVkIGludCBjcHUpCiAKIGJvb2wg
X19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9pZCkKIHsK
LQlpbnQgY3B1OwotCiAJLyoKIAkgKiBXZSBjYW4gb25seSBzdXBwb3J0IFBSX1VOQUxJR04gY29u
dHJvbHMgaWYgYWxsIENQVXMgaGF2ZSBtaXNhbGlnbmVkCiAJICogYWNjZXNzZXMgZW11bGF0ZWQg
c2luY2UgdGFza3MgcmVxdWVzdGluZyBzdWNoIGNvbnRyb2wgY2FuIHJ1biBvbiBhbnkKQEAgLTY5
MiwxMCArNzAyLDggQEAgYm9vbCBfX2luaXQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRl
ZF9hbGxfY3B1cyh2b2lkKQogCSAqLwogCW9uX2VhY2hfY3B1KGNoZWNrX3VuYWxpZ25lZF9hY2Nl
c3NfZW11bGF0ZWQsIE5VTEwsIDEpOwogCi0JZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCi0JCWlm
IChwZXJfY3B1KG1pc2FsaWduZWRfYWNjZXNzX3NwZWVkLCBjcHUpCi0JCSAgICAhPSBSSVNDVl9I
V1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVEKQotCQkJcmV0dXJuIGZhbHNlOworCWlm
ICghYWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQoKSkKKwkJcmV0dXJu
IGZhbHNlOwogCiAJdW5hbGlnbmVkX2N0bCA9IHRydWU7CiAJcmV0dXJuIHRydWU7Ci0tIAoyLjQ5
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
