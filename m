Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D36960A380F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l+roG8WA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=feQDu8a/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SvQzAbRds9OcdHpv7Ct06v3nVy6fFWU09iyUfLx4Oq0=; b=l+roG8WArwoolqgKeagllhFpvM
	s03boNUmeMtZCq9Rjai9Pnx4x8XEX9zTflLX2qu/OmkPFyEEsLPP3ugHL2V2Vc/S1rBMSE6JJEklD
	eonTlVFYwGTxBot46ls4WwpeWbNqxo8ejoUIdrC0GAyLyhFTAkCtMiug4PwEBPY35H6fDe5KzHHfb
	LtX0tbBgCJVx8txfVUISZaT+IJ4UjJtWE7ZRlYDP5BEL5QxcFctNHLdz2Ib79IKhQ26rr0xR7ieY0
	6m8Q+M2kqJGz3ydlJ8veUptJw0V87E12bFa5/I+kiv32+YMy24XJqqcyK7OJle1hiYhaizd04EStS
	9LcxC+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRewu-0000000BI9v-42im;
	Fri, 13 Nov 2026 00:15:24 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRewt-0000000BI8x-03Xw
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 00:15:24 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3ae25c846edso3737621fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 16:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528921; x=1795133721; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2LkBRUVTRexRTSqdlSVNAYuG65U41LgIRZGkSwqN8Y=;
        b=feQDu8a/YgDQvmasZR0RBJhRYkZFDAhV1IjdFbMOOT1OHnEx95w0ecPfoI31LTOrlk
         b7LQkEHdFS3o4zoijMTdpZtYGw2Q+oPiwr6VqhPPJCe7QiaofIdVIN+8kCqL/woXMvzh
         iqnbGe8lpliM/p2x0tWHGrH9QCqJhZqHzTsTJvpVrpmdrXmkerzY5TDBQifyMsCqgE9b
         laLYoD3HaKYAkhAgp48ovCj/xbhUT8jRWSIXxSvb6D+YEOybYvdjneNgH5w5I2+aZTZ0
         tPxfJOwwMMrpQzW29cguDdLvx8f+t1UfkJvlW3T/yefF9C6mdQmHhYuW4g7Qh+yCgmrp
         +loA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528921; x=1795133721;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2LkBRUVTRexRTSqdlSVNAYuG65U41LgIRZGkSwqN8Y=;
        b=qHO7oKd4Bvd2ktxtyP9cv43QvMuHYo4PFwkvXvtlb1oPHC7fgnI4lUIUye8XIZuhzF
         vNWjS721M3Jq3+MdrvD18ZOnpcEt8LGYpJ0PE2TPtb66E7/VNjAHE26Cw+ehksHncMO/
         qF/YObVWL4T6Vv7PCVXxzHijQXSKwJfMjrTj5EF2gqEib8E4i4BEbbQdrIlBk0mq4pYT
         FPq9R6y2fRu8MkBlcHaRWmp973JQArBvesAO7fhWkwq65Ub7zDaxE8A/Ub5mce6IEk45
         WtthtYuGBva88anU1jE/TsYrwCdEkjTynv+C+fQoSQcMQq1NjHK88WDhcHLfWgzLzlbt
         x78g==
X-Forwarded-Encrypted: i=1; AL+hErEx5k6/ifyzz4J+PyYeROTRNaRH2G2S/1B8saBrSTX/ffSoIzB0jAqys2ZSydFPT8MlQpEMPoqeGOayig==@lists.infradead.org
X-Gm-Message-State: APuU4Z+DMdGMudpWFKCKIq9hMWYs8OVzdWYIh0vpVcfH9p64o9gKd1FY
	2ixudPyyjafbk+XgzzNp1Dp/KOeAVy01BbX9bl/TZ8D60I5dcYQyq1j4
X-Gm-Gg: AYBFou0MeNqkBv0WgEz+1nXo9DTWpAoG++CxbYTPiD9KvjipXjz5FSLg2TMmc2IrR9I
	Wi2c2k5pJ3mdkF20Rb4GWkVlrIqz8N78dxLSrkjw6rW3fdUNXJ/E3NM6LLVNUwkH4eX036sQzXn
	U8Ho3aJfee9HrKMynAwDlUDaf3Gasy5Ru95Alw58V0OuS8dZSNTP3uSAfgX/OhE5DX1Rwpe154g
	HPaiv9HOh00+Fm+wDt+doLg5mT09PGkU4r74X6XdcvD6pZIFvDDKMAorYfNnFuLA8FKSnr34Fw+
	9BgqFd0x2iRPqlA2qxmPSY6W84rXhKxeiC5sCND80mEfA2vxgzXbukoaDz8QPql5QiD2R4i94m/
	4hFmfUhBCzM6gDK8U/kpfgnQgOHNJ2D2ZLlOVO9CpIot8erDdnU/nB9NVrG3IEWduHC8ebfd5aQ
	/MVkJYzsSINHzA0WaBS8/ClIC2OtGGKQ/lSqUmmmdM9DEe5337MLaSiv09i/U1mhuKavfn+qP29
	0TJk1ZFaFSRMIBnx6sxF9Ky28EeFcBHtgylvwe/9W1ogIBeiby5tLTk9weG6olXKdh0egdnp0HS
	tJCMuJbCAgAdCR9aQ7Afbn4Z60KdL0jb4+8mxr4nVDvgBhdVpvGaU3AvfaoWtajbHFIVcpR4m1L
	o2zYPJp/XAg==
X-Received: by 2002:a05:6512:32d6:b0:5bc:ddf0:d96 with SMTP id 2adb3069b0e04-5c170a0dcc9mr397802e87.59.1794528920769;
        Thu, 12 Nov 2026 16:15:20 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:20 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 06/10] riscv: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:12 +0400
Message-ID: <20261113001432.128201-7-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_161523_087519_311866AD 
X-CRM114-Status: GOOD (  11.25  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Q29tcGlsaW5nIGEga2VybmVsIG1vZHVsZSB3aXRoIGEgQysrIGNvbXBpbGVyIHJlc3VsdHMgaW4g
YSBkdXBsaWNhdGUKZWNobyDigJhleHRlcm7igJkgc3BlY2lmaWVyIGVycm9yLgpUaGlzIG9jY3Vy
cyBiZWNhdXNlIHRoZSBjb2RlIGNvbnRhaW5zICwgYW5kCmV4cGFuZHMgdG8gIHdoZW4gcHJvY2Vz
c2VkIGJ5IGEgQysrIGNvbXBpbGVyLgpUaGUgIHNwZWNpZmllciBtdXN0IGJlIHJlbW92ZWQuCmh0
dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjIyMjU3CgpTaWduZWQt
b2ZmLWJ5OiBTYWZvY2wgU3RvbGxtYW5ub3ZpYyA8c2Fmb2NsODhAZ21haWwuY29tPgotLS0KIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc3RyaW5nLmggfCAyNCArKysrKysrKysrKystLS0tLS0tLS0t
LS0KIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAgICAgfCAgNCArKy0tCiBhcmNoL3Jpc2N2
L2tlcm5lbC9zdGFja3RyYWNlLmMgIHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9zdHJpbmcuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RyaW5nLmgKaW5kZXggNzY0
ZmZlOGY2Li5hYzg5NTM1OGMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3Ry
aW5nLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdHJpbmcuaApAQCAtMTAsMzMgKzEw
LDMzIEBACiAjaW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgogCiAjZGVmaW5lIF9fSEFWRV9BUkNI
X01FTVNFVAotZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCAqbWVtc2V0KHZvaWQgKiwgaW50LCBzaXpl
X3QpOwotZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCAqX19tZW1zZXQodm9pZCAqLCBpbnQsIHNpemVf
dCk7Cithc21saW5rYWdlIHZvaWQgKm1lbXNldCh2b2lkICosIGludCwgc2l6ZV90KTsKK2FzbWxp
bmthZ2Ugdm9pZCAqX19tZW1zZXQodm9pZCAqLCBpbnQsIHNpemVfdCk7CiAjZGVmaW5lIF9fSEFW
RV9BUkNIX01FTUNQWQotZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCAqbWVtY3B5KHZvaWQgKiwgY29u
c3Qgdm9pZCAqLCBzaXplX3QpOwotZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCAqX19tZW1jcHkodm9p
ZCAqLCBjb25zdCB2b2lkICosIHNpemVfdCk7Cithc21saW5rYWdlIHZvaWQgKm1lbWNweSh2b2lk
ICosIGNvbnN0IHZvaWQgKiwgc2l6ZV90KTsKK2FzbWxpbmthZ2Ugdm9pZCAqX19tZW1jcHkodm9p
ZCAqLCBjb25zdCB2b2lkICosIHNpemVfdCk7CiAjZGVmaW5lIF9fSEFWRV9BUkNIX01FTU1PVkUK
LWV4dGVybiBhc21saW5rYWdlIHZvaWQgKm1lbW1vdmUodm9pZCAqLCBjb25zdCB2b2lkICosIHNp
emVfdCk7Ci1leHRlcm4gYXNtbGlua2FnZSB2b2lkICpfX21lbW1vdmUodm9pZCAqLCBjb25zdCB2
b2lkICosIHNpemVfdCk7Cithc21saW5rYWdlIHZvaWQgKm1lbW1vdmUodm9pZCAqLCBjb25zdCB2
b2lkICosIHNpemVfdCk7Cithc21saW5rYWdlIHZvaWQgKl9fbWVtbW92ZSh2b2lkICosIGNvbnN0
IHZvaWQgKiwgc2l6ZV90KTsKIAogI2lmICEoZGVmaW5lZChDT05GSUdfS0FTQU5fR0VORVJJQykg
fHwgZGVmaW5lZChDT05GSUdfS0FTQU5fU1dfVEFHUykpCiAjZGVmaW5lIF9fSEFWRV9BUkNIX1NU
UkNNUAotZXh0ZXJuIGFzbWxpbmthZ2UgaW50IHN0cmNtcChjb25zdCBjaGFyICpjcywgY29uc3Qg
Y2hhciAqY3QpOworYXNtbGlua2FnZSBpbnQgc3RyY21wKGNvbnN0IGNoYXIgKmNzLCBjb25zdCBj
aGFyICpjdCk7CiAKICNkZWZpbmUgX19IQVZFX0FSQ0hfU1RSTEVOCi1leHRlcm4gYXNtbGlua2Fn
ZSBfX2tlcm5lbF9zaXplX3Qgc3RybGVuKGNvbnN0IGNoYXIgKik7Cithc21saW5rYWdlIF9fa2Vy
bmVsX3NpemVfdCBzdHJsZW4oY29uc3QgY2hhciAqKTsKIAogI2RlZmluZSBfX0hBVkVfQVJDSF9T
VFJOQ01QCi1leHRlcm4gYXNtbGlua2FnZSBpbnQgc3RybmNtcChjb25zdCBjaGFyICpjcywgY29u
c3QgY2hhciAqY3QsIHNpemVfdCBjb3VudCk7Cithc21saW5rYWdlIGludCBzdHJuY21wKGNvbnN0
IGNoYXIgKmNzLCBjb25zdCBjaGFyICpjdCwgc2l6ZV90IGNvdW50KTsKIAogI2RlZmluZSBfX0hB
VkVfQVJDSF9TVFJOTEVOCi1leHRlcm4gYXNtbGlua2FnZSBfX2tlcm5lbF9zaXplX3Qgc3Rybmxl
bihjb25zdCBjaGFyICosIHNpemVfdCk7Cithc21saW5rYWdlIF9fa2VybmVsX3NpemVfdCBzdHJu
bGVuKGNvbnN0IGNoYXIgKiwgc2l6ZV90KTsKIAogI2RlZmluZSBfX0hBVkVfQVJDSF9TVFJDSFIK
LWV4dGVybiBhc21saW5rYWdlIGNoYXIgKnN0cmNocihjb25zdCBjaGFyICosIGludCk7Cithc21s
aW5rYWdlIGNoYXIgKnN0cmNocihjb25zdCBjaGFyICosIGludCk7CiAKICNkZWZpbmUgX19IQVZF
X0FSQ0hfU1RSUkNIUgotZXh0ZXJuIGFzbWxpbmthZ2UgY2hhciAqc3RycmNocihjb25zdCBjaGFy
ICosIGludCk7Cithc21saW5rYWdlIGNoYXIgKnN0cnJjaHIoY29uc3QgY2hhciAqLCBpbnQpOwog
I2VuZGlmCiAKIC8qIEZvciB0aG9zZSBmaWxlcyB3aGljaCBkb24ndCB3YW50IHRvIGNoZWNrIGJ5
IGthc2FuLiAqLwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCmluZGV4IDM0YzFkNDk4ZC4uM2U1MzFiNmQwIDEwMDY0
NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvcHJvY2Vzcy5jCkBAIC0zOSw4ICszOSw4IEBAIHVuc2lnbmVkIGxvbmcgX19zdGFja19jaGtf
Z3VhcmQgX19yZWFkX21vc3RseTsKIEVYUE9SVF9TWU1CT0woX19zdGFja19jaGtfZ3VhcmQpOwog
I2VuZGlmCiAKLWV4dGVybiBhc21saW5rYWdlIHZvaWQgcmV0X2Zyb21fZm9ya19rZXJuZWxfYXNt
KHZvaWQpOwotZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrX3VzZXJfYXNtKHZv
aWQpOworYXNtbGlua2FnZSB2b2lkIHJldF9mcm9tX2Zvcmtfa2VybmVsX2FzbSh2b2lkKTsKK2Fz
bWxpbmthZ2Ugdm9pZCByZXRfZnJvbV9mb3JrX3VzZXJfYXNtKHZvaWQpOwogCiB2b2lkIG5vaW5z
dHIgYXJjaF9jcHVfaWRsZSh2b2lkKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
c3RhY2t0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jCmluZGV4IGM3NTU1
NDQ3MS4uNmNhNjBjZDNkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zdGFja3RyYWNl
LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jCkBAIC0zMiw3ICszMiw3IEBA
CiAJdmFsOwkJCQkJCVwKIH0pCiAKLWV4dGVybiBhc21saW5rYWdlIHZvaWQgaGFuZGxlX2V4Y2Vw
dGlvbih2b2lkKTsKK2FzbWxpbmthZ2Ugdm9pZCBoYW5kbGVfZXhjZXB0aW9uKHZvaWQpOwogZXh0
ZXJuIHVuc2lnbmVkIGxvbmcgcmV0X2Zyb21fZXhjZXB0aW9uX2VuZDsKIAogc3RhdGljIGlubGlu
ZSBpbnQgZnBfaXNfdmFsaWQodW5zaWduZWQgbG9uZyBmcCwgdW5zaWduZWQgbG9uZyBzcCkKLS0g
CjIuNTYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
