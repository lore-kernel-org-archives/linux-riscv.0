Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBF8606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 16:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JChCXuiv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q0opXkU9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BbfhcXpVXsXl4r2O1KvObWZTEhZQa6Y1ruwWR6VqtzM=; b=JChCXuivx3+2PqQ/2qut8J6H3D
	jfskrgQAbbAeRDRxiUjRIMO/WKX7FK65v878tbImI8IP2NMKy9Yv7jUYpfR8HSNoSiVtzvJe5dNU7
	kXMBi+Cj+neF98dYGaRSlBJqhVctJjh8DzadiEBHamtgsXytBfVfZbDaKBoXzS7P3S0NKTEKYfBrA
	p2j/OrODwvqnn5qhL14vGReGg16/Mb78R17KK+mT/Zh7pqwact9hTFrQxf9Vn+Jvk1cfOnEMZ3Tls
	R3fkaP4cBXf0AOJKG6MIFm5G50ycU62ywT8S75AinbCX9kbs3hOvmTCaKIp+CrkKLUbVTGJ5/7wO8
	7pFg1x1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzFB-0000000HAkB-1loL;
	Fri, 27 Nov 2026 16:56:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzF8-0000000HAi2-12K9
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 16:56:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso81305385e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 08:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798573; x=1796403373; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDQdal3wNitMcunk+R+QXDq5g9roUTKZhJO2aGBztU8=;
        b=Q0opXkU98O+9XqgKSazf3Mh8g8siLbp8c3Lg9f6mP5kdscGd/fAQJX6MMaAz33csjP
         OdVQET5yz7iUB3T2BiXHqR71RINJYnOI3/iKKUpHkh3q5KSguqUizcKksgUL7Y7jLb0S
         242/DqvROZNF2fb2yAvDLEvSqWDOvuD9n1KQCkqkslcJpJrmU1xzO176J3qlPKk4oO5H
         bPrFAOos0aJHI108d/X4WxH4LNJrahTT0UZWg38MNhv2VbvKD7DH8ZYqe09BEM891qwz
         l23CN54aXPZrzRupP/w9bcxjyejoC6nKBDqrnyKcDvmTnYH0cPokIpXgck9ysRV4eGwQ
         FHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798573; x=1796403373;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDQdal3wNitMcunk+R+QXDq5g9roUTKZhJO2aGBztU8=;
        b=wCgPZ7mdtgGbJQJzozN+qvlNuKyCcp9B5ixFu7IVZxegA+oynoyM9BkhO1EAC7APWJ
         HZdkdxXIjY3GsGotqiBeFt1tOpL5Y/7LDRHT416Bc3QSvOJ3HnX1wYCiKKOK0doPJj+G
         JBm633ajfytsqHDIom/eGhaWI5HmXBCotCLjuvR+jouh3EVq7+TEUzU3/3wwJ4nJhunJ
         2/PpxIsaZ3xD/R51fR1q8769eEGmVvB2We++W+wZx4NBdSiwg753Rf8Biy2acdmIoaiU
         6MDVySHUUS87tO7iYexRQOP3QgBn8HiWZDq9SkJ9FTA6BgENLZ7JOC1H0JhwB+WKQVRj
         ONWA==
X-Forwarded-Encrypted: i=1; AL+hErG6gEKiAfl0T0k5bdHuK2w1kuvnw4SgkO1gD7szUQ1W7KOG4+Y4+9I8XLwaMTAJXsUAXMx/IQTFBaTK4Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+0EmWwRJXqVR0F2NEwRvQpWPJ8UK9V3/xeCPrsjbkIqZuoPRD7
	YeIeJO4AK4aK8u1Ik5CYOO1jitSA+PgsmwqIH8rHgAhzpHbiSxGqjynP
X-Gm-Gg: AZFdTZdY84q4euwCtmA/kJ9fSLLWqwcbX7e655HkwBUCKr+Vbhk+TKPMCLky7hiM5nX
	Jz4XbMsRaNJSi/kwj9O/qEoSN0aLFX45dc8u0P9lzoPL1gd+mKqM1CCNTWGLWYC508VvDBXvXDs
	nRWvUIbQr4x7g6l0PktBwAKZxLcrW+qQsxofOgm5qlHQ7ErsLA2LjWBz1Y0GrLgMIycRyL33QuM
	QGYbce7+kQLdMh3DWYQOFnhrK2I7yFa7ABueWVS3DohfsoeHitLG48/KzWQltSxF1dA3sq0MVaq
	lQQoaoQ1mG09kp9742lRjvAUTChzleXKk8Mpj8h2BcIUlI+YDE3iqj760pfTk897wNozC/CZvy2
	ADZzD9twj4eDduK2YQBofotewo+2aRf9tTKlLNjjSmHXnmAKjCZd7z2vaz9dmC9dgMB0U2L2H6K
	hR1o6TN9kyjFeSpE8ja+pKRV9GAhE9sUFeoZwEjPq3RbschDg6UgBpUIo0yozis+e4qCRamsV7g
	CZr7UVsH1+EJNUTv9Oi0pVVkk/JdeFXPMS5XCyjL00Ss6OVTtgpkwZ3AnFG2SHUjwye1qLAwi7d
	Rh7w1h25EuBJ0uuO0SNh/e04NKNvNr+qBClv0VYqiszlD97E31V7fGkzw3+CPQw5QEKlBBrE+AX
	3wQjTAxM=
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr539373665e9.14.1795798572537;
        Fri, 27 Nov 2026 08:56:12 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm721676685e9.7.2026.11.27.08.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:56:12 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 4/4] serial: esp32: Enable the UART clock during port registration
Date: Fri, 27 Nov 2026 16:55:52 +0000
Message-ID: <20261127165552.133713-4-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127165552.133713-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-11-vitorhg20080@gmail.com>
 <20261127165552.133713-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_085614_306253_0DA7DF34 
X-CRM114-Status: GOOD (  10.16  )
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

dWFydF9hZGRfb25lX3BvcnQoKSBjYW4gaW52b2tlIHRoZSBtb2RlbSBjb250cm9sIGNhbGxiYWNr
cyBiZWZvcmUKdGhlIGNvbnNvbGUgc2V0dXAgb3Igc3RhcnR1cCBjYWxsYmFjayBlbmFibGVzIHRo
ZSBVQVJUIGNsb2NrLiBLZWVwCnRoZSBjbG9jayBlbmFibGVkIGFjcm9zcyByZWdpc3RyYXRpb24g
c28gdGhvc2UgY2FsbGJhY2tzIGNhbgphY2Nlc3MgdGhlIHJlZ2lzdGVycy4gUmVsZWFzZSB0aGUg
cHJvYmUncyBjbG9jayByZWZlcmVuY2UgYWZ0ZXIKcmVnaXN0cmF0aW9uLCBpbmNsdWRpbmcgd2hl
biBpdCBmYWlscy4KClNlcmlhbCBjb25zb2xlIHJlZ2lzdHJhdGlvbiBhbmQgb3BlcmF0aW9uIHdl
cmUgdGVzdGVkIG9uIHRoZQpXYXZlc2hhcmUgRVNQMzItUDQtTW9kdWxlLURFVi1LSVQuCgpTaWdu
ZWQtb2ZmLWJ5OiBWw610b3IgSHVnbyBTaWx2YSA8dml0b3JoZzIwMDgwQGdtYWlsLmNvbT4KLS0t
CiBkcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvZXNw
MzJfdWFydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL2VzcDMyX3VhcnQuYwppbmRleCA0MGFjZmY3
Li5jZDY4NDc4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jCisr
KyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMKQEAgLTg1Niw5ICs4NTYsMTUgQEAg
c3RhdGljIGludCBlc3AzMl91YXJ0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJaWYgKGVzcDMyX3VhcnRfcG9ydHNbcG9ydC0+bGluZV0pCiAJCXJldHVybiAtRUJVU1k7CiAK
KwkvKiBTZXJpYWwgY29yZSBhY2Nlc3NlcyBtb2RlbSBjb250cm9sIHJlZ2lzdGVycyBkdXJpbmcg
cmVnaXN0cmF0aW9uLiAqLworCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShzcG9ydC0+Y2xrKTsK
KwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OworCiAJLyogQ29uc29sZSBzZXR1cCBjYW4gbG9vayB1
cCB0aGUgcG9ydCBkdXJpbmcgcmVnaXN0cmF0aW9uLiAqLwogCWVzcDMyX3VhcnRfcG9ydHNbcG9y
dC0+bGluZV0gPSBzcG9ydDsKIAlyZXQgPSB1YXJ0X2FkZF9vbmVfcG9ydCgmZXNwMzJfdWFydF9y
ZWcsIHBvcnQpOworCWNsa19kaXNhYmxlX3VucHJlcGFyZShzcG9ydC0+Y2xrKTsKIAlpZiAocmV0
KSB7CiAJCWVzcDMyX3VhcnRfcG9ydHNbcG9ydC0+bGluZV0gPSBOVUxMOwogCQlyZXR1cm4gcmV0
OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
