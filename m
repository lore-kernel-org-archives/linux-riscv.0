Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6C5EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1UwCv/nDlTrSfAf8oL4W0LlwXGqZgEaj9k2tE8EOL8=; b=pEM58mZCh6Wot4
	qMkJyxaXT3zozpHOKLdvXxRuDhMqoQbdtrjqWzZUs78vCU0I8U2kP/sllXTvJJq6KaHdWs5Lkux/p
	RxWZHmqYPwItqQ2H8C47uskDSW8LntXSjWgPAZ3L24tfDigUvZpdUB3jGHbIoRKvqICww1TGwKtEi
	IH7LVpSoPKL4zMkrO3zVoFf5jPqTj2CdMwFEUkq4tqZSGAxxsW1fPVVRa2V+WTNd55aJki1iNVuZX
	ntI/qZBU+6a32SD8XSD10JbRzHtBltiGDTpn6OfYGV8TTiEVOCFcq6nbXJrFs0nScdRXkvmbj9YX7
	GFV0mh58edawPySfy+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6gt-00D2NI-2S;
	Tue, 27 Jun 2023 11:16:59 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6gj-00D2IY-1g
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 11:16:58 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6b74e2d8c98so1682700a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687864599; x=1690456599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2K0OuQGxCrdsKt9Q57JYfi5owLHsSbU96G7U8K7Wyc=;
        b=CLCvM5Ht93QC4AHE/cHmirC2W6l/TIb1ObX5XhXGP8SHTXzvEs2lCRw+Oeri1hVkQC
         HBmppRBNLP+85jU+6Prb0ahTKN+wZFA5T912jwD8hLJE1CHl6nSV86KRVapsPkxtpxB9
         MGRWGHhT81tjm6G+Tgrec5vxJtGBtncLmbh9QefCTGC1KWQ0cepAUTejlZYJf08Jxrd5
         7bjth7uO4z8JVkSr11qDSFlldY3tfWAYoNy2aHgNxqvRfWjSnAC2tztXuRGciow1vhK+
         h/syJOQewa9LCZ+u/qNZpH4JTGKfxuTOMRIoW5kB1H3Rx6/a1h7OX2Mhar9Rm7tN7v1z
         nWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864599; x=1690456599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2K0OuQGxCrdsKt9Q57JYfi5owLHsSbU96G7U8K7Wyc=;
        b=WFys2eiTBVRCibdUbdCGMOGxT1826j+nxB/fMtsMhJS9L/JEKv1cKrJNCQJPWempyT
         RlE1ucQ6xqt2n4FaOJFh242uWIYUlm75p4dHLHUs4DHosyvbA+SJq/fk8YDNGvMIw/Nt
         HftaqPoGGJ22DXkVJjLYfmEC4xE+2VSI7DA7w+Y0Ux3crtzEI4cv5h+by/T7uhKaD0qr
         Y7IdV00W/QuklMoV5QLxNXiIgI1wVnbxtOnBSolSjHEbOOJ1r0A44SJ60riQydWfgUk0
         KYxzzZLmM+Ra/trmil2Fj9ARukFaB3zaoDdPs5V4RsTPN9XGGFo5HlzTDE6Dz8OKLwT4
         U6Pg==
X-Gm-Message-State: AC+VfDxbFW1MRe3CX37mDvdDcJJX96Yaqw4vYRBZvJ57GamwXjHUYVRZ
	oP0SgHAloS3Da3HTK59zHNKnV2e/H/KPeg==
X-Google-Smtp-Source: ACHHUZ6mnka0WW9MVoMGh7/o2+bdi8ZgTA17NxscHP0+9UmQ8Asw92nbo6Zj8qGPGWMQpIW9ln/+GA==
X-Received: by 2002:a05:6808:2202:b0:3a1:aa90:d486 with SMTP id bd2-20020a056808220200b003a1aa90d486mr17879039oib.26.1687864598842;
        Tue, 27 Jun 2023 04:16:38 -0700 (PDT)
Received: from localhost.localdomain ([58.240.82.166])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a004800b00262d6ac0140sm5438658pjb.9.2023.06.27.04.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 04:16:38 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	suagrfillet@gmail.com,
	bjorn@rivosinc.com,
	jszhang@kernel.org,
	conor.dooley@microchip.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	songshuaishuai@tinylab.org
Subject: [PATCH V11 3/5] riscv: ftrace: Add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
Date: Tue, 27 Jun 2023 19:16:10 +0800
Message-Id: <20230627111612.761164-4-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230627111612.761164-1-suagrfillet@gmail.com>
References: <20230627111612.761164-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_041649_568660_7CD2934D 
X-CRM114-Status: GOOD (  13.43  )
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

VGhpcyBwYXRjaCBhZGRzIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHN1cHBvcnQg
Zm9yIFJJU0MtVi4KCnNlbGVjdCB0aGUgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMg
dG8gcHJvdmlkZSB0aGUKcmVnaXN0ZXJfZnRyYWNlX2RpcmVjdFtfbXVsdGldIGludGVyZmFjZXMg
YWxsb3dpbmcgdXNlcnMgdG8gcmVnaXN0ZXIKdGhlIGN1c3RvbWVkIHRyYW1wb2xpbmUgKGRpcmVj
dF9jYWxsZXIpIGFzIHRoZSBtY291bnQgZm9yIG9uZSBvcgptb3JlIHRhcmdldCBmdW5jdGlvbnMu
IEFuZCBtb2RpZnlfZnRyYWNlX2RpcmVjdFtfbXVsdGldIGFyZSBhbHNvCnByb3ZpZGVkIGZvciBt
b2RpZnlpbmcgZGlyZWN0X2NhbGxlci4KClRvIG1ha2UgdGhlIGRpcmVjdF9jYWxsZXIgYW5kIHRo
ZSBvdGhlciBmdHJhY2UgaG9va3MgKGVnLiBmdW5jdGlvbi9mZ3JhcGgKdHJhY2VyLCBrW3JldF1w
cm9iZXMpIGNvLWV4aXN0LCBhIHRlbXBvcmFyeSByZWdpc3RlciBpcyBub21pbmF0ZWQgdG8Kc3Rv
cmUgdGhlIGFkZHJlc3Mgb2YgZGlyZWN0X2NhbGxlciBpbiBmdHJhY2VfcmVnc19jYWxsZXIuIEFm
dGVyIHRoZQpzZXR0aW5nIG9mIHRoZSBhZGRyZXNzIGRpcmVjdF9jYWxsZXIgYnkgZGlyZWN0X29w
cy0+ZnVuYyBhbmQgdGhlClJFU1RPUkVfUkVHUyBpbiBmdHJhY2VfcmVnc19jYWxsZXIsIGRpcmVj
dF9jYWxsZXIgd2lsbCBiZSBqdW1wZWQgdG8KYnkgdGhlIGBqcmAgaW5zdC4KClNpZ25lZC1vZmYt
Ynk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KVGVzdGVkLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Ci0tLQog
YXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZnRyYWNlLmggfCAgOCArKysrKysrKwogYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5
bi5TICB8IDEwICsrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwppbmRl
eCA3NTZkODU0ZTZjZGQuLmMzZTY3ODQ1MGFjZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9LY29u
ZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMTQ1LDYgKzE0NSw3IEBAIGNvbmZpZyBS
SVNDVgogCXNlbGVjdCBVQUNDRVNTX01FTUNQWSBpZiAhTU1VCiAJc2VsZWN0IFpPTkVfRE1BMzIg
aWYgNjRCSVQKIAlzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRSBpZiAhWElQX0tFUk5FTCAmJiBN
TVUgJiYgKENMQU5HX1NVUFBPUlRTX0RZTkFNSUNfRlRSQUNFIHx8IEdDQ19TVVBQT1JUU19EWU5B
TUlDX0ZUUkFDRSkKKwlzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxM
UwogCXNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyBpZiBIQVZFX0RZTkFNSUNf
RlRSQUNFCiAJc2VsZWN0IEhBVkVfRlRSQUNFX01DT1VOVF9SRUNPUkQgaWYgIVhJUF9LRVJORUwK
IAlzZWxlY3QgSEFWRV9GVU5DVElPTl9HUkFQSF9UUkFDRVIKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZnRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5o
CmluZGV4IDg0Zjg1NmEzMjg2ZS4uODQ5MDRjMWU0MzY5IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNl
LmgKQEAgLTExNCw2ICsxMTQsMTQgQEAgc3RydWN0IGZ0cmFjZV9yZWdzOwogdm9pZCBmdHJhY2Vf
Z3JhcGhfZnVuYyh1bnNpZ25lZCBsb25nIGlwLCB1bnNpZ25lZCBsb25nIHBhcmVudF9pcCwKIAkJ
ICAgICAgIHN0cnVjdCBmdHJhY2Vfb3BzICpvcCwgc3RydWN0IGZ0cmFjZV9yZWdzICpmcmVncyk7
CiAjZGVmaW5lIGZ0cmFjZV9ncmFwaF9mdW5jIGZ0cmFjZV9ncmFwaF9mdW5jCisKK3N0YXRpYyBp
bmxpbmUgdm9pZAorX19hcmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxlcihzdHJ1Y3QgcHRfcmVn
cyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRyKQoreworCQlyZWdzLT50MSA9IGFkZHI7Cit9Cisj
ZGVmaW5lIGFyY2hfZnRyYWNlX3NldF9kaXJlY3RfY2FsbGVyKGZyZWdzLCBhZGRyKSBcCisJX19h
cmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxlcigmKGZyZWdzKS0+cmVncywgYWRkcikKICNlbmRp
ZiAvKiBDT05GSUdfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTICovCiAKICNlbmRpZiAvKiBfX0FT
U0VNQkxZX18gKi8KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUyBi
L2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUwppbmRleCBmYjgyODZiODBjZmMuLmI2ZjRl
MTg0N2Q2MSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUwpAQCAtMjMxLDYgKzIzMSw3IEBAIEVORFBS
T0MoZnRyYWNlX2NhbGxlcikKIAogI2Vsc2UgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhf
UkVHUyAqLwogRU5UUlkoZnRyYWNlX3JlZ3NfY2FsbGVyKQorCW12CXQxLCB6ZXJvCiAJU0FWRV9B
QklfUkVHUyAxCiAJUFJFUEFSRV9BUkdTCiAKQEAgLTIzOSw3ICsyNDAsMTAgQEAgZnRyYWNlX3Jl
Z3NfY2FsbDoKIAljYWxsCWZ0cmFjZV9zdHViCiAKIAlSRVNUT1JFX0FCSV9SRUdTIDEKKwlibmV6
CXQxLC5MZGlyZWN0CiAJanIJdDAKKy5MZGlyZWN0OgorCWpyCXQxCiBFTkRQUk9DKGZ0cmFjZV9y
ZWdzX2NhbGxlcikKIAogRU5UUlkoZnRyYWNlX2NhbGxlcikKQEAgLTI1NCwzICsyNTgsOSBAQCBm
dHJhY2VfY2FsbDoKIAlqcgl0MAogRU5EUFJPQyhmdHJhY2VfY2FsbGVyKQogI2VuZGlmIC8qIENP
TkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKi8KKworI2lmZGVmIENPTkZJR19EWU5BTUlD
X0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUworU1lNX0NPREVfU1RBUlQoZnRyYWNlX3N0dWJfZGly
ZWN0X3RyYW1wKQorCWpyCXQwCitTWU1fQ09ERV9FTkQoZnRyYWNlX3N0dWJfZGlyZWN0X3RyYW1w
KQorI2VuZGlmIC8qIENPTkZJR19EWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUyAqLwot
LSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
