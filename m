Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA73606A31F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PA90+DCM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KXJvhnr0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RAwcN20vZRdhwUnXb3BsAQLIE1cAYqaCjGDtxHtqyK4=; b=PA90+DCMsgWJYoPvXRKwrxbtI2
	gy0hLNrHyupefo/IVV14ijYEYHzJyz7sO1NrFJZxGq+KSM4iV2ApOTS6rC2gcXuKA5bWr5ZlfBCE7
	KpQC9wAWDFz+UXTGfNYocqRHNzYWF2PZ928ntbxysI9rX0f3d5W7Gll2lAZW6WqjTuledZ6Y7Q13v
	i5KXy3OyVWcQ6qbo81BHBBzukggmLMOujEH8Lu0qorSeqt0YXuDx1kBTyyZgycRO3P15J1JTzb8UE
	zEhosKualgpccCVWjF+AaYphdSzu7Yxyszdd8q3qUK9FNniBBtbmS1ikD11mP82YhS16KREQg1dp0
	6aqJvxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyJN-0000000GvyO-1wnS;
	Fri, 27 Nov 2026 15:56:33 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyJL-0000000Gvxd-3UTD
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 15:56:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-491846221ffso7288187f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 07:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795794989; x=1796399789; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Va7mmJMRyV8C2mf4qXe8YFNGI85O0e3HsmDcruX7rYs=;
        b=KXJvhnr0ZChFkWODS190aKKyb5f8WX6Sj7Ga8u5kETwW5hxpj232I4Fz563nCH9St9
         oyxwRcLQ+25FYDUTccp2h2mkqjGBnzTLc3O6JbnWn7eC7V6ziz7AJoCUIji5UwSkN9k2
         rB5gScfktMwOqNVihnZniQn4GcYZQRZ98IGCFHUaU9/FDzIxifqmSsHqTiC+QrNhJ8tv
         syuyEDqyojSGabzCOF1O7BPqLgxwMdwPidhaayy88iUyQAuvK9CWz64xGUS5XikbuswD
         ptTizsMxW78ia/gLZutO1TGoIi/j5mi/nffisGDdEOS3N0JbUMCJ64pQ48WJXDyfiUiV
         N7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794989; x=1796399789;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Va7mmJMRyV8C2mf4qXe8YFNGI85O0e3HsmDcruX7rYs=;
        b=s26ZTfNY16lOGBxNmaP9h7Hzr1qszqU/VXDUZ4PNOubRdAxXHMcsyjcU0MYzgX8snB
         WOXNQP3F1ga17IyRJgbOg7Nf5SSvrQK6FoGXi8jPCkp9HNg7Bn/WyHewgrIRCuI3KzVz
         vu5aCsTP0hcJZ7ipf5zDHqcqLMKT8cwXRIOnkvSnYbUysqXjgFJxm+PnV8r6yHw9OWxC
         yJMWBMw80aAbbaU2BpyRAjdJsH1/d5IMYsyU7YXIYL/kQfASLE+Ygp7MUvji0EFIxApW
         IHx1WRn7Z1jvwXtjRzuZNI7WAtW3eQEEDHIT3BN3bEByVmOLEl1UII3XvAqpio2XW5DV
         WiAQ==
X-Forwarded-Encrypted: i=1; AL+hErHiSD/KL0Q8V2EpVONoPO7yZZIHp+SDBcGYOpqIo5yLiiXM7Mp4A8ZuTTCCnmQWoGIph9BFBYBKCfdZlQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/ifWfpezZYJe7YaxhAkReeIfmpAa8/jjUro6KY4BrCTZEJNTD5
	7PwKSXAQPjMbE5zxWTCwD0JGuO9RDXW9FjnUXAvEP5VcsZWZRPMib0VgidxBBR6D2J0=
X-Gm-Gg: AZFdTZf91mQRdHpPpUiU+EMHTZxMBZlGoVrklel/cnYaI9RpIfQLWUEwCwyOmejz7Cf
	Nru1DqNc7VBVt5+aaSuM1PzhY8bW8fRaEGmkm89t3fsMmitk7GX25PBxJFHCeET0aozABlIm1fm
	WYagztWmwseZLPTxBd3JT6jehudewiNsckGh9NCBKjOEh1Bud0fYCHNCBCJx/oMRg9mUGAR2Xmb
	fg3FUd6Kyr5U/OPMuPflarph3+77YRSR9n3vC5L1pOeR73dZfMiuEvj52r/Lwr/X/m94N9LnxLS
	+I3A1BVXk/mpARzQ8lPuposbfeQssAU62ahV8a+rnxouK1zVmV2f2Bd4hvC8sntYXCgKBfn3NOW
	0jP2y54QYCLgsyEwjvnxLSttJcKDJRaGiFVGQb2FYNLT/bo52mUrMF/mO/3fpJ6I9QYJgHxf2/T
	f9VUSbzHUUV9UFnRCzX9L3+I8G9LU5vUgMaK7zNHxqfu74cwHiyzmKIuzBqU+wb9YIVO8QkLPjG
	t9dp+3ukMRElmCJOEr2fSNXP7pkhGiZlrA7+ifi6mavaqe8MX52vrFbptqnTPfPyBvwWHYmhslz
	Ci8kCWZCQ3Y4tM0R8ZJwL7HMw2XK61mmjoQQ9PrmRkWx6QL2VBWvFVmHMLY8SqOvVYURBZtFjI+
	Ki8xba58=
X-Received: by 2002:a5d:64e5:0:b0:4a4:f208:6a37 with SMTP id ffacd0b85a97d-4abb4e642fdmr49567529f8f.42.1795794989438;
        Fri, 27 Nov 2026 07:56:29 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm39382661f8f.35.2026.11.27.07.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:56:29 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC v2] serial: esp32: Rearm TX interrupts when the FIFO is full
Date: Fri, 27 Nov 2026 15:56:23 +0000
Message-ID: <20261127155623.129706-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-13-vitorhg20080@gmail.com>
References: <20261125233020.1380594-13-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_075631_914512_8A633866 
X-CRM114-Status: GOOD (  15.24  )
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

V2hlbiB0cmFuc21pc3Npb24gc3RhcnRzIHdpdGggYSBmdWxsIEZJRk8sIHF1ZXVlZCBkYXRhIGNh
biBiZSBsZWZ0CndhaXRpbmcgd2l0aCB0aGUgVFggaW50ZXJydXB0IGRpc2FibGVkLiBLZWVwIHRo
ZSBUWCBGSUZPIGVtcHR5CmludGVycnVwdCBlbmFibGVkIHdoaWxlIGEgaGlnaC1wcmlvcml0eSBj
aGFyYWN0ZXIgaXMgcGVuZGluZyBvciB3aGlsZQp0cmFuc21pc3Npb24gY2FuIHByb2dyZXNzIG9u
IHF1ZXVlZCBkYXRhLgoKVXNlIFVBUlRfVFhfTk9TVE9QIHNvIHRoZSBkcml2ZXIgY29udHJvbHMg
VFggaW50ZXJydXB0IG1hc2tpbmcuIElmIGEKZGVmZXJyZWQgeF9jaGFyIGlzIHNlbnQgd2hpbGUg
bm9ybWFsIHRyYW5zbWlzc2lvbiBpcyBzdG9wcGVkLCBtYXNrIHRoZQpUWCBpbnRlcnJ1cHQgYW5k
IGxlYXZlIHRoZSBxdWV1ZWQgZGF0YSBmb3IgdGhlIG5leHQgc3RhcnRfdHgoKSBjYWxsLgpUaGlz
IHByZXZlbnRzIHJlcGVhdGVkIFRYIGludGVycnVwdHMgd2hpbGUgdGhlIHF1ZXVlIGlzIHN0b3Bw
ZWQuCgpIb2xkIHRoZSBwb3J0IGxvY2sgaW4gdGhlIFRYIGludGVycnVwdCBoYW5kbGVyIGFzIHJl
cXVpcmVkIGJ5IHRoZQpzZXJpYWwgY29yZSBUWCBoZWxwZXJzLgoKQSBtb2NrZWQgRklGTyB0ZXN0
IHZlcmlmaWVkIHRoZSBkZWZlcnJlZCB4X2NoYXIgY2FzZSwgSVJRIG1hc2tpbmcgYW5kClRYIHJl
c3RhcnQuIE5vcm1hbCBzZXJpYWwgY29uc29sZSBvcGVyYXRpb24gd2FzIHRlc3RlZCBvbiB0aGUK
V2F2ZXNoYXJlIEVTUDMyLVA0LU1vZHVsZS1ERVYtS0lULgoKQUkgYXNzaXN0ZWQgd2l0aCBkcml2
ZXIgZGV2ZWxvcG1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBWw610b3IgSHVnbyBTaWx2YSA8dml0b3Jo
ZzIwMDgwQGdtYWlsLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gS2VlcCBUWCBJUlEgbWFza2lu
ZyBpbiB0aGUgZHJpdmVyIGFuZCBtYXNrIHRoZSBJUlEgYWZ0ZXIgc2VuZGluZyBhCiAgZGVmZXJy
ZWQgeF9jaGFyIHdoaWxlIFRYIGlzIHN0b3BwZWQuCi0gVmVyaWZ5IHRoZSBzdG9wcGVkLVRYIHNl
cXVlbmNlIHdpdGggYSBtb2NrZWQgRklGTyBhbmQgcnVuIGEgc2VyaWFsCiAgY29uc29sZSByZWdy
ZXNzaW9uIHRlc3Qgb24gdGhlIEVTUDMyLVA0LgoKVGhpcyByZXBsYWNlcyBwYXRjaCAxMi8xOSBh
bmQgYXBwbGllcyBhZnRlciBwYXRjaGVzIDEwIGFuZCAxMSBmcm9tIHYxLgp2MTogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtc2VyaWFsLzIwMjYxMTI1MjMzMDIwLjEzODA1OTQtMTMtdml0
b3JoZzIwMDgwQGdtYWlsLmNvbS8KCiBkcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jIHwg
MjIgKysrKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL2VzcDMy
X3VhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMKaW5kZXggMzA0ZTEzNC4u
MjA1OGJkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL2VzcDMyX3VhcnQuYworKysg
Yi9kcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jCkBAIC0zNTQsMjUgKzM1NCwzMSBAQCBz
dGF0aWMgdm9pZCBlc3AzMl91YXJ0X3RyYW5zbWl0X2J1ZmZlcihzdHJ1Y3QgdWFydF9wb3J0ICpw
b3J0KQogCXVuc2lnbmVkIGludCBwZW5kaW5nOwogCXU4IGNoOwogCi0JaWYgKHR4X2ZpZm9fdXNl
ZCA+PSBFU1AzMl9VQVJUX1RYX0ZJRk9fU0laRSkKLQkJcmV0dXJuOwotCi0JcGVuZGluZyA9IHVh
cnRfcG9ydF90eF9saW1pdGVkKHBvcnQsIGNoLAotCQkJCSAgICAgICBFU1AzMl9VQVJUX1RYX0ZJ
Rk9fU0laRSAtIHR4X2ZpZm9fdXNlZCwKLQkJCQkgICAgICAgdHJ1ZSwgZXNwMzJfdWFydF9wdXRf
Y2hhcihwb3J0LCBjaCksCi0JCQkJICAgICAgICh7fSkpOwotCWlmIChwZW5kaW5nKSB7CisJdHhf
Zmlmb191c2VkID0gbWluX3QodTMyLCB0eF9maWZvX3VzZWQsIEVTUDMyX1VBUlRfVFhfRklGT19T
SVpFKTsKKwlwZW5kaW5nID0gdWFydF9wb3J0X3R4X2xpbWl0ZWRfZmxhZ3MocG9ydCwgY2gsIFVB
UlRfVFhfTk9TVE9QLAorCQkJCQkgICAgRVNQMzJfVUFSVF9UWF9GSUZPX1NJWkUgLSB0eF9maWZv
X3VzZWQsCisJCQkJCSAgICB0cnVlLCBlc3AzMl91YXJ0X3B1dF9jaGFyKHBvcnQsIGNoKSwKKwkJ
CQkJICAgICh7fSkpOworCisJLyogS2VlcCBUWCBJUlFzIGVuYWJsZWQgd2hpbGUgdGhlcmUgaXMg
c2VuZGFibGUgZGF0YS4gKi8KKwlpZiAocG9ydC0+eF9jaGFyIHx8IChwZW5kaW5nICYmICF1YXJ0
X3R4X3N0b3BwZWQocG9ydCkpKSB7CiAJCXUzMiBpbnRfZW5hOwogCiAJCWludF9lbmEgPSBlc3Az
Ml91YXJ0X3JlYWQocG9ydCwgVUFSVF9JTlRfRU5BX1JFRyk7CiAJCWludF9lbmEgfD0gVUFSVF9U
WEZJRk9fRU1QVFlfSU5UOwogCQllc3AzMl91YXJ0X3dyaXRlKHBvcnQsIFVBUlRfSU5UX0VOQV9S
RUcsIGludF9lbmEpOworCX0gZWxzZSB7CisJCWVzcDMyX3VhcnRfc3RvcF90eChwb3J0KTsKIAl9
CiB9CiAKIHN0YXRpYyB2b2lkIGVzcDMyX3VhcnRfdHhpbnQoc3RydWN0IHVhcnRfcG9ydCAqcG9y
dCkKIHsKKwl1bnNpZ25lZCBsb25nIGZsYWdzOworCisJdWFydF9wb3J0X2xvY2tfaXJxc2F2ZShw
b3J0LCAmZmxhZ3MpOwogCWVzcDMyX3VhcnRfdHJhbnNtaXRfYnVmZmVyKHBvcnQpOworCXVhcnRf
cG9ydF91bmxvY2tfaXJxcmVzdG9yZShwb3J0LCBmbGFncyk7CiB9CiAKIHN0YXRpYyBpcnFyZXR1
cm5fdCBlc3AzMl91YXJ0X2ludChpbnQgaXJxLCB2b2lkICpkZXZfaWQpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
