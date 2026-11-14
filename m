Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9281F606A32D
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 10:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nhp4z7fq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fFtuKV3U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YlxXu/U9HkvF8dsZITCjU7rwMc9GxRVDmurnAAij6BA=; b=nhp4z7fqCA1niF11qi4dMaeOEF
	s17PHmGeLHGO74nksICKFqiYjrA06o6k2atPTx4I5xAq4yjruuA8YBprGFswCh6TImbVFuC1lVDHV
	UgJMSWaZfWDBZACNEsG9SywXFhtk+aCSDS5dSEZeYdErCIyJ4Vbj3d7haaXm/7nyUbechjJq0sPrX
	zQViQ5aQqafDRn+T+dVFxVZRN50Q3+cTXXpJTlLlxKhaE7L6pJiZ/Id5JcH7T/3cmfaikUMjE4zm1
	5QHX5tNeVWB52ArJZYDhKotuprBOB+2qQw5TXmt09MW8SQku+tJYb3Hf3C512yaa6yTbgZFfvK5jC
	bM9u+osQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAZY-0000000FiS9-2HaM;
	Sat, 14 Nov 2026 10:01:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAZG-0000000FiGZ-0Vc1
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 10:01:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-49412eb1474so843938f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 02:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794650464; x=1795255264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=fFtuKV3UpbTmsQAN+xHLesX9SFool5NPW41dFreCXGNFb/dX5a1AoGsEb9PKTWtYN8
         3CPBx2CySWicDsmVhygKhoeD4g2Ez9T533kNzh6m4kYavXSqvT638dNLHvlL65AnFVeU
         XA4+Mc0Ma8dgTOGDdV78N0E1zAdMqhhmJ03JKb5Uur+rZG8UlksbB01W6/OQEuY9eURE
         klIsgLQzS7gBtagZhSmZwW4hsmC+ZQ3+2vGReKS2Oovbq7rpyEcVSDHEKUF5nfo0N3tG
         QkqiHD3VXJs7KBcgKZ/lTpZYcp3ZacTN4vZCcWOOqDJYqwLNX7BeZ2ef7OdAQcPMfgwm
         FK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650464; x=1795255264;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eC04+x1Aj5L0dZDAOuUn9+6Z9aX/XkxoD9/WXm06rNo=;
        b=Ot2hPJRxppShr++WysB2qSS1GmLBILko/+xO6rAAfbVWgY3YSb5RZjqmoS/4qssXRG
         p/4AlOUpRKEw1uOaiWFQxgzWVTrIRbg6xaCXA4R9rBQsbcvu9ReC0zBm4AP6DHF0cbIa
         rzW0bj6H9t5duqcpyI3foF8J4TADGPYpTVZz5igGlt3RdDslraxxXKlGuIWAWBDQT7pF
         f2GE7D8xIJcaKZSF5Me1vZpIykXClYih7515E43ry+Oo3eTntviLEZ1Mih9h4NBTrcwe
         LmO36W2io5dzvtlhLyIaGT5lBCxN7VXHkD+pjLUUIX5QGYWW03flDL9SvzW8PB5uJcQe
         aTeA==
X-Forwarded-Encrypted: i=1; AL+hErGhwKJrAjfxsgf8uFD+cAnUFpyamGQmSxWK77IyQpFfoqBptoADcXKfS/r4riCIJT4NPVOVcejAL9UaUw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+RmbYjjCFJOBR7h9jRjdd0Eyhx4UnZYBTzJMmNizmSO0BeZXrD
	B3tKRTU8bHJTfJ2wh+V/+oNMkTX/gJCymjyMjn6giLumXCHAWAST8bGGXN1VJfw0pQrF
X-Gm-Gg: AYBFou0YHsUKTvFHMT9RxjWiCg/Zdnax1NwwppmW5M38zLpusm8dl/sFCSlo2n56Eo6
	KIp9v/p8kWq3IK+okVY3vyFQyP1SCHYABCXJBFXdYE5/N265QuG9pn8VzeLJGNLh76RMifDtMN+
	BFJhK4h2xYDgyoJ/jwXF1CJkhQhQlyauz63w6y4vvZuyx8d5u9uoDoV+pd+n64al7sVbkeGYISK
	HJEEFP0EfXKasqgf1QpWE3I89tnVz+eS55in99J5qrbLWoOgKfp3JKFo+Q0EOviW0lt+eKxaAge
	6+DKgcB8ns2aOfhsx8hcpZbmAJ8L7iGx6onj9zokfkX/A7+g77Rv6KVnWumlfj9dlHEdfYwm8OR
	EnD2vEhHFCwedRdikCBYoxJKhD4gUOJyUOwiM3JylmdIttdLRCtd9EgSeJ29V1LtWC9NinKlIaZ
	PntrQu3Y5fPbb04efr+pvZEXG07/8tPzItls6dr2KuGBUT6tlcljnRSzuD0KfWsL5H0WGJJKHVz
	NnuCbPMG+X350cA8R/Kka9qrpxJLJLUBghhAtqf4q4CheCKEQlNZoFmYYhHM1iLFr3mcbndauyt
	U2DXoh1HO8OhB2cl8zV9L1AsI+3uCNSBwQ==
X-Received: by 2002:a05:6000:4918:b0:492:b1c5:6db4 with SMTP id ffacd0b85a97d-49c723fc793mr10335695f8f.26.1794650464192;
        Sat, 14 Nov 2026 02:01:04 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:a084:d599:46a5:5c31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm16920053f8f.44.2026.11.14.02.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:01:03 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat, 14 Nov 2026 10:00:49 +0000
Message-ID: <ab06a2173b01f4e18dd24c68e03ef846ea933098.1794649714.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794649714.git.jpeixoto@osyx.tech>
References: <cover.1794649714.git.jpeixoto@osyx.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_020106_649530_38F07797 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIGEgTUFJTlRBSU5FUlMgZW50cnkgY292ZXJpbmcgdGhlIEJhbyBoeXBlcnZpc29yIGRyaXZl
cnMgYW5kIHRoZWlyClVBUEkgaGVhZGVyLgoKU2lnbmVkLW9mZi1ieTogSm/Do28gUGVpeG90byA8
anBlaXhvdG9Ab3N5eC50ZWNoPgotLS0Kdjc6Ci0gTm8gY2hhbmdlLgp2NjoKLSBObyBjaGFuZ2Uu
CnY1OgotIE5vIGNoYW5nZS4KdjQ6Ci0gRHJvcCB0aGUgYXJjaC8qL2luY2x1ZGUvYXNtL2Jhby5o
IGFuZCBpbmNsdWRlL2xpbnV4L2Jhby5oIGVudHJpZXMgKHRoZQogIGZpbGVzIGFyZSBnb25lKTsg
dXNlIHRoZSBkaXJlY3RvcnkgZm9ybSBmb3IgZHJpdmVycy92aXJ0L2Jhby8uCgogTUFJTlRBSU5F
UlMgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA5M2FiYmIzMTUwNjUuLmRiZWEw
ODE0NDdlMiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTQ3
MTIsNiArNDcxMiwxNCBAQCBGOglkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC8KIEY6CWluY2x1ZGUv
bGludXgvYmFja2xpZ2h0LmgKIEY6CWluY2x1ZGUvbGludXgvcHdtX2JhY2tsaWdodC5oCiAKK0JB
TyBIWVBFUlZJU09SCitNOglKb3PDqSBNYXJ0aW5zIDxqb3NlQG9zeXgudGVjaD4KK006CURhdmlk
IENlcmRlaXJhIDxkYXZpZG1jZXJkZWlyYUBvc3l4LnRlY2g+CitNOglKb8OjbyBQZWl4b3RvIDxq
cGVpeG90b0Bvc3l4LnRlY2g+CitTOglNYWludGFpbmVkCitGOglkcml2ZXJzL3ZpcnQvYmFvLwor
RjoJaW5jbHVkZS91YXBpL2xpbnV4L2Jhby5oCisKIEJBUkNPIFA1MCBHUElPIERSSVZFUgogTToJ
U2FudG9zaCBLdW1hciBZYWRhdiA8c2FudG9zaGt1bWFyLnlhZGF2QGJhcmNvLmNvbT4KIE06CVBl
dGVyIEtvcnNnYWFyZCA8cGV0ZXIua29yc2dhYXJkQGJhcmNvLmNvbT4KLS0gCjIuNTMuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
