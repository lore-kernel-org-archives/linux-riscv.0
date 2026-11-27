Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E044C606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 16:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UodCUC9u;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YvAf9nkQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=az9OLoroq10hTbzqaZjiM2rGBbIN//E6AAaezF2OyCQ=; b=UodCUC9uQpbwrsSChJjERO4Gni
	RGyq1LRy2+FVY6OOhF+743kttO5iNMEQ9AfnmaMzmFGV1yJZIchNukK8Tm/h1W6M/pAzSvE5VDwTL
	1FcKKp8iHXdr6ARDqYeRE+KN8yetP7klw5J7TA9MotwpLzf1d7Fmr4I6w1p7qVhNQ3oil1cOhYmno
	n8ql5QBZuXzmBoQ7csEGGcP0E9QSBIjX39rXxIcZl8ZkHldr7GrNZFwJt+qlGmVfJUkLktNbczsA3
	WvdqgtQBmgUoGvnLwt+9Xr0RgSCihZOzn+6yMDN6wRg/5436eu27+S9VcZ+zBMtfpUOdh2Gu6MMJ3
	JwA28LNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzF4-0000000HAgG-0TRH;
	Fri, 27 Nov 2026 16:56:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzEz-0000000HAfd-2X3Q
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 16:56:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so68274995e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798563; x=1796403363; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Qk+C52F/WT5bFnsjK29OcxfCcFJJ39L41GGvCZ8GDo=;
        b=YvAf9nkQbsTFzrTRP5+2j05Ai5mICyvKHWWP/qR/kkwQ4NFiQuxVnN2KtUFmmTR5h2
         bpLTqyF0rA66IwafsaAK42MMhNmjSMYFFtmIcUa43hjBcXbTRp1AakobofNVbtEnnBlr
         37NSKV8Z36OLwEBR58WvD7Gh/NTLAyYu9hX8FjjCeu1k5v+BukOLhBlYn9RIgvvXNnqX
         2w/xbw7PQx/bAVhwTGITsT+NnrxW68i5EKg9MJDTSAyUSCWrCYKhgyP0DGI1vfcmxARj
         NnUzwYSkKcXcNVmfTJbmKZqE76rXM08qZQiqN6i6xAOCG9U2ALDjVzWBCYSP7spmHlvM
         rtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798563; x=1796403363;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Qk+C52F/WT5bFnsjK29OcxfCcFJJ39L41GGvCZ8GDo=;
        b=lOGX13gVARjWn/LJCeI0aP+bfsevZvRMYeOQNSwCfTYWF4AMkP7rqgK79sUTQVqt3e
         tastvaSuNGHg9tBEnIPmPWd2quPJm+t2m4dKji+z8evBLnGJl9oYODLP9amwn1SGbYdz
         HGK7fSXqTeUWJRvJOcVAsA4hPS3tXCXC5znI7JBQ/kayrzR47TSBgn7AE8GmW+klGXFc
         wJ0ZkL4Q8psU4YyLO14rJgqxiK3yB/jwR6x5AdhoTGwNxPrElTLxsuAKUap04t/a8CMQ
         NIMwwWUipJkJ4U9UjcIuu0MoiA4OtClmEEZZUpb7jrhv0ZRc40f6B7oVcQWBUyLv+3jC
         z6pw==
X-Forwarded-Encrypted: i=1; AL+hErFLV47LAyL5utmGdL/utZjiRug8RiOQjAI1l4aicmDu+7x77vJYJ1xVCEb/fqMYkpZ2ONM5ERg6KYkO9g==@lists.infradead.org
X-Gm-Message-State: APuU4Z9/TrRLd2nFGDj+ZulCGZqvuxZep2nP+ex86JtAWTudHKMDoyY+
	R5qFRt/E/6wjmIo+63GLzAduA24GUVJ4wYNgdgw+GPkLT3V9ccO9uD1n
X-Gm-Gg: AZFdTZeN7e+IB5V5oivQbzxLOiE387EGKYOHEJ+xZfhTU9Casm+oZ83ivrfU7zHaWfd
	CIxJRRJiM2FqXp1h3+M5uBes6+rEaCbyRkZcMBRuGNKFPssDTwM4weNv3eUeZQLjckXH7I3coac
	O663qPVzpiHXxUZ3Ruc+ZzdyE7YzEzac7tZAU/8EsqFFJ7j620RcRrm8ejzjbP9gWL1ODbqCZx5
	WKix8Hjy61diddYkLzc0u6WlpaWUnztdYM6xnaHX3cOZb7C76jX6bawOv5omMyNgv2enoE6R1w9
	qhhjulE8kguD0DgAXGckPPch3F9C59b+ND2bJXHhFAnrN4uubM3oPqifLLTTitfyfOWSMg71Z8Y
	MGKBMaFJ3xwkcNSub8pIGH8JlvgXxfj6gzSJlsmq7IsJ+smm+S2ZyeoIcv6EIg+GVjORL4kXdGN
	N60Au+bbZQlXV5onTiIAYQv67i+zVAuOYiSMEfjd1CJ/y8WArISrm4ir24SzSXj7B4k/UgQBv6x
	J6N1WVEX2Fi0XU0OQOdJ+YJB7rNXXz7shKmMSrAc3Kvm4T5ViJBp78rS3tYZddqv7kU9fms13T8
	RZ5j5QaksfS/v9oXiEFEPOPct9BWxdAAbdLRPJNk6ibaPMXD9U4yoWlg/NTAeRP7pFrtnf8u8ZT
	YjHdR7S0+ciQVkAigz0Hk17wumJcB
X-Received: by 2002:a05:600c:a55:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4bb889234a7mr473209425e9.16.1795798563314;
        Fri, 27 Nov 2026 08:56:03 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm733858735e9.3.2026.11.27.08.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:56:03 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 1/4] serial: esp32: Validate the baud rate before programming the UART
Date: Fri, 27 Nov 2026 16:55:49 +0000
Message-ID: <20261127165552.133713-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-11-vitorhg20080@gmail.com>
References: <20261125233020.1380594-11-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_085605_653760_1E25189D 
X-CRM114-Status: GOOD (  10.77  )
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

RWFybHkgY29uc29sZSBzZXR1cCBjYW4gcmVhY2ggZXNwMzJfdWFydF9zZXRfYmF1ZCgpIHdpdGgg
bm8gYmF1ZCByYXRlCm9yIGNsb2NrIHJhdGUuIFJlamVjdCByYXRlcyB0aGF0IGNhbm5vdCBwcm9k
dWNlIGEgdmFsaWQgZGl2aWRlcgpiZWZvcmUgZGl2aWRpbmcgb3Igd3JpdGluZyB0aGUgVUFSVCBy
ZWdpc3RlcnMuIEVhcmx5IGNvbnNvbGUgb3V0cHV0CmNhbiBjb250aW51ZSB3aXRoIHRoZSBmaXJt
d2FyZSBjb25maWd1cmF0aW9uIGluIHRoaXMgY2FzZS4KCkEgbW9ja2VkIHJlZ2lzdGVyIHRlc3Qg
dmVyaWZpZWQgdGhhdCBhIHplcm8gYmF1ZCBvciBjbG9jayByYXRlIGxlYXZlcwp0aGUgcmVnaXN0
ZXJzIHVudG91Y2hlZC4KClNpZ25lZC1vZmYtYnk6IFbDrXRvciBIdWdvIFNpbHZhIDx2aXRvcmhn
MjAwODBAZ21haWwuY29tPgotLS0KVGhpcyBzZXJpZXMgYWRkcmVzc2VzIGZpdmUgZmluZGluZ3Mg
ZnJvbSB0aGUgcmV2aWV3IG9mIHBhdGNoIDEwLzE5CmFuZCBhcHBsaWVzIGFmdGVyIHBhdGNoIDEx
LzE5IG9mIHRoZSBFU1AzMi1QNCBSRkMuCgogZHJpdmVycy90dHkvc2VyaWFsL2VzcDMyX3VhcnQu
YyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMgYi9kcml2
ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jCmluZGV4IDMwNGUxMzQuLjg5NWQwZWMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMKKysrIGIvZHJpdmVycy90dHkv
c2VyaWFsL2VzcDMyX3VhcnQuYwpAQCAtNDQ4LDcgKzQ0OCwxMiBAQCBzdGF0aWMgdm9pZCBlc3Az
Ml91YXJ0X3NodXRkb3duKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCiBzdGF0aWMgYm9vbCBlc3Az
Ml91YXJ0X3NldF9iYXVkKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsIHUzMiBiYXVkKQogewogCXUz
MiBzY2xrID0gcG9ydC0+dWFydGNsazsKLQl1MzIgZGl2ID0gc2NsayAvIGJhdWQ7CisJdTMyIGRp
djsKKworCWlmICghYmF1ZCB8fCBiYXVkID4gc2NsaykKKwkJcmV0dXJuIGZhbHNlOworCisJZGl2
ID0gc2NsayAvIGJhdWQ7CiAKIAlpZiAocG9ydF92YXJpYW50KHBvcnQpLT5oYXNfY2xrY29uZikg
ewogCQl1MzIgc2Nsa19kaXYgPSBkaXYgLyBwb3J0X3ZhcmlhbnQocG9ydCktPmNsa2Rpdl9tYXNr
OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
