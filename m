Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325E606A31F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2026 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TSA6r6HR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gh2wLeDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R9uuGc912IwcuOD+B0iVZ2oTYKSE6Ojyj9ch3oUyMEI=; b=TSA6r6HRZfiygwECZsYCOP0UQJ
	mds4mQBEpMABkB6f0tgSv/cV4DnnPKmcyV1w9tOjf4zVmKaJ/3A8XG77idCWDoqdUYAGMYArbwkAg
	ikCnBvDTBefQ6Kg8JGW2l4nVgTuUZ/AH/b3r/J7/SbkNv6Brfyzpr8OPAnSZzvQ5pYt1HRZI8C/H/
	NBrfH+PyfOUSzzPk8UmlfjU00dFUWJC842Wi3iwmDf6QKn9ax2DhPOUOI5IlyfiMLqtUFzsehyHS+
	s0MUoeUb4RuqpoWGWo+PqybJ3piv9+EWDMdX1AsAQKT+TzHBg85AxsADT/1vJHqc/W4pFXVuw9t5P
	rMnzGe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzF8-0000000HAiL-0pjL;
	Fri, 27 Nov 2026 16:56:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzF4-0000000HAg7-1s3k
	for linux-riscv@lists.infradead.org;
	Fri, 27 Nov 2026 16:56:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so67908435e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Nov 2026 08:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798568; x=1796403368; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBQuv6Lhdi7fEtiV2oM4BKslPIEAViTQUedU+aiaIxU=;
        b=gh2wLeDNT9o0Is9KB8d/9PvXXYI52rm4uw/BtZm793BTkYM5nEnMx/nhHjjM5Ua8+u
         e4Y3FLC2YEk+ljqwSd+FcQCn5xNJE8YjOekJ8T6ZCyXGJ3n6Wl2V+XFB7wjdEn19sPiH
         Ar6VVuG6vGqoCHMjRTB61Yhcs1zOkazNZ/Sqq7/nZvE5frWu48u08Dwj9DBX8HGaEHpG
         dLIuwfPiVdZ9d08QORd8M6XQ1wtZIbfGubnrIpnYV/PSXr8bTN3ay02nMajtGB9dZSKt
         8aoSm1HssaeW3V7O/csTgLYIF+WtSQR86hvrUxdQemn3LzpcLMRubNAOjQyqBzIoMPMT
         Pafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798568; x=1796403368;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBQuv6Lhdi7fEtiV2oM4BKslPIEAViTQUedU+aiaIxU=;
        b=rBY79fjI1Zbocz8t6kfUilDhbUX9XLexc4fBuULcLLfFxRNtjS/N/fvZ6shhxEroum
         Kmm0x+aRYBd/meypQZYK53KD3P7fdYCQ39cOL2kNjXuC8eQa1XopleB5UNIHWmmJpmeJ
         /nTBv7pxNSUcPc/fn4J5OwwPcYJjCihyQWUxZguBS1pYfTWF4UJXoM26thfovx1W7dUD
         zw4crE1CZW4Nf6DscShVgvUemtvJgrBJ/5Vc1uJXT/7RNrCyuu6wDH++1x1yarXVqoQG
         uAKqNVN08BWGi27uqRgV2AYUfUXwYpfMbCHkgP+0Cvp0hYmy6uYAnBvgE//JIflGFgve
         s2yg==
X-Forwarded-Encrypted: i=1; AL+hErFQODXgHbLiOop4an6mswyn+7t5KyIeW5St8nEWYax+ivVuI9XDecSVbjiD91q0yH672SFFMWN9HmpBJw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9AicrhdRWNH/Mf9ErN5sdlRyd2X5MMPVD1MJlnNL4yfOSqGZkw
	CIpKOR0Z5VDnAvWlgQGhIx5scKBIv1XFKQ9x49NwdznlrMoR8i4AqPKd
X-Gm-Gg: AZFdTZf++nNfZVn+hsq/FTsj4P05q8m1gndYuNUhWDZPrUsFwH5ViDMz1TfERXEZRyG
	ZoZTrQAZsnlKGnD+J1EDf/RoyI9M66qzjKeuCVetMDiBR4VdvfOdsc9jATqRyz2x8CnSsdAjNEa
	YyepEMmZVopCg/YH2vA3gaUYRsdTRsS4WIETAL6GiVBWX8FO1r+9Iv1acUS3HGz8ZtcwDleettl
	ilBKu4uhBUqQo8Vjq7/e39y4lmTo8Zz653WutOEOv+E/GV2b/+K+DWgggV9I5nXepaPWxhNq0X9
	S4+QJK7UYN3qt1CUkxmhysyNzXyR3pWAxsdwt3T63MZmGloi5W/r/KeBuVLmoFsUWUB0mMDBqB3
	i4ntsRm3caHxa3Up+Q/4a3bl2atEJ0QItwFngij+1jg/H3fu+7aNiga6lKnUYONCokdrx89yHU4
	kG1u03MHjcYhjFs0bw43Jw9RH6s6h2n0GqnKrGUDWUdPLPuhgdgKeXRIkFxG+v0dzJNjGadb+8p
	zU5UOmOPE/h1evPKUcx4dk7ttMt2CStl9wB3Lqf8HpgqosgqweZ90Nu1DveL/zucTaR60CsHHTI
	a8C5FBmp7A1Rww9lHsrl4MBBKCBRgXg1WOfbKgfGV0mgsqq4w+NHYRQCKw6TwySqJBdJ6YYehbE
	p6SYm0ik=
X-Received: by 2002:a05:600c:1d86:b0:4bb:6a5a:7824 with SMTP id 5b1f17b1804b1-4bb8892099amr546093415e9.30.1795798568353;
        Fri, 27 Nov 2026 08:56:08 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm677062805e9.6.2026.11.27.08.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:56:08 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-riscv@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH RFC 2/4] serial: esp32: Fix ESP32-S3 baud rate prescaler calculation
Date: Fri, 27 Nov 2026 16:55:50 +0000
Message-ID: <20261127165552.133713-2-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127165552.133713-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-11-vitorhg20080@gmail.com>
 <20261127165552.133713-1-vitorhg20080@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_085610_506852_2137ABFC 
X-CRM114-Status: GOOD (  13.17  )
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

VGhlIEVTUDMyLVMzIGVuY29kZXMgdGhlIFNDTEsgcHJlc2NhbGVyIGFzIGRpdmlzb3IgbWludXMg
b25lLiBBdCB0aGUKbWF4aW11bSB1bnNjYWxlZCBpbnRlZ2VyIFVBUlQgZGl2aWRlciwgdGhlIGRy
aXZlciBjYW4gcHJvZ3JhbSBhCnByZXNjYWxlciBpdCBkaWQgbm90IHVzZSBpbiB0aGUgYmF1ZCBj
YWxjdWxhdGlvbi4gQXQgbG93ZXIgcmF0ZXMgdGhlCnByZXNjYWxlciBjYW4gYWxzbyBleGNlZWQg
aXRzIHJlZ2lzdGVyIGZpZWxkLgoKU2VsZWN0IHRoZSBzbWFsbGVzdCBwcmVzY2FsZXIgdGhhdCBm
aXRzIHRoZSBVQVJUIGRpdmlkZXIsIGluY2x1ZGluZwppdHMgZnJhY3Rpb25hbCBwYXJ0LCBhbmQg
cmVqZWN0IGFuIG91dC1vZi1yYW5nZSBwcmVzY2FsZXIgYmVmb3JlCnByb2dyYW1taW5nIHRoZSBy
ZWdpc3RlcnMuIFJvdW5kIHVwIHRoZSBtaW5pbXVtIGJhdWQgcmF0ZSB0byBhdm9pZAphZHZlcnRp
c2luZyBhIHJhdGUgdGhlIGhhcmR3YXJlIGNhbm5vdCBnZW5lcmF0ZS4KCkEgbW9ja2VkIHJlZ2lz
dGVyIHRlc3QgY292ZXJlZCB0aGUgZGl2aWRlciBib3VuZGFyeSBhbmQgcmVqZWN0ZWQKMzggYmF1
ZCB3aGlsZSBhY2NlcHRpbmcgMzkgYmF1ZCB3aXRoIGEgNDAgTUh6IHJlZmVyZW5jZSBjbG9jay4K
ClNpZ25lZC1vZmYtYnk6IFbDrXRvciBIdWdvIFNpbHZhIDx2aXRvcmhnMjAwODBAZ21haWwuY29t
PgotLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMgfCA0MCArKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAx
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFy
dC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL2VzcDMyX3VhcnQuYwppbmRleCA4OTVkMGVjLi4wZTcx
MjhhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJfdWFydC5jCisrKyBiL2Ry
aXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91YXJ0LmMKQEAgLTgsNiArOCw3IEBACiAjaW5jbHVkZSA8
bGludXgvaW8uaD4KICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KICNpbmNsdWRlIDxsaW51eC9p
cnEuaD4KKyNpbmNsdWRlIDxsaW51eC9tYXRoLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
CiAjaW5jbHVkZSA8bGludXgvbXV0ZXguaD4KICNpbmNsdWRlIDxsaW51eC9vZi5oPgpAQCAtNDQ3
LDM1ICs0NDgsMzUgQEAgc3RhdGljIHZvaWQgZXNwMzJfdWFydF9zaHV0ZG93bihzdHJ1Y3QgdWFy
dF9wb3J0ICpwb3J0KQogCiBzdGF0aWMgYm9vbCBlc3AzMl91YXJ0X3NldF9iYXVkKHN0cnVjdCB1
YXJ0X3BvcnQgKnBvcnQsIHUzMiBiYXVkKQogeworCXUzMiBkaXZfbWFzayA9IHBvcnRfdmFyaWFu
dChwb3J0KS0+Y2xrZGl2X21hc2s7CiAJdTMyIHNjbGsgPSBwb3J0LT51YXJ0Y2xrOwotCXUzMiBk
aXY7CisJdTMyIGRpdiwgZnJhZzsKIAogCWlmICghYmF1ZCB8fCBiYXVkID4gc2NsaykKIAkJcmV0
dXJuIGZhbHNlOwogCiAJZGl2ID0gc2NsayAvIGJhdWQ7Ci0KIAlpZiAocG9ydF92YXJpYW50KHBv
cnQpLT5oYXNfY2xrY29uZikgewotCQl1MzIgc2Nsa19kaXYgPSBkaXYgLyBwb3J0X3ZhcmlhbnQo
cG9ydCktPmNsa2Rpdl9tYXNrOworCQkvKiBUaGUgU0NMSyBmaWVsZCBlbmNvZGVzIHRoZSBkaXZp
c29yIG1pbnVzIG9uZS4gKi8KKwkJdTMyIHNjbGtfZGl2ID0gZGl2IC8gKGRpdl9tYXNrICsgMSk7
CiAKLQkJaWYgKGRpdiA+IHBvcnRfdmFyaWFudChwb3J0KS0+Y2xrZGl2X21hc2spIHsKLQkJCXNj
bGsgLz0gKHNjbGtfZGl2ICsgMSk7Ci0JCQlkaXYgPSBzY2xrIC8gYmF1ZDsKLQkJfQorCQlpZiAo
c2Nsa19kaXYgPiBGSUVMRF9NQVgoRVNQMzJTM19VQVJUX1NDTEtfRElWX05VTSkpCisJCQlyZXR1
cm4gZmFsc2U7CisKKwkJc2NsayAvPSBzY2xrX2RpdiArIDE7CisJCWRpdiA9IHNjbGsgLyBiYXVk
OwogCQllc3AzMl91YXJ0X3dyaXRlKHBvcnQsIEVTUDMyUzNfVUFSVF9DTEtfQ09ORl9SRUcsCiAJ
CQkJIEZJRUxEX1BSRVAoRVNQMzJTM19VQVJUX1NDTEtfRElWX05VTSwgc2Nsa19kaXYpIHwKIAkJ
CQkgRVNQMzJTM19VQVJUX0NMS19DT05GX0RFRkFVTFQpOwogCX0KIAotCWlmIChkaXYgPD0gcG9y
dF92YXJpYW50KHBvcnQpLT5jbGtkaXZfbWFzaykgewotCQl1MzIgZnJhZyA9IChzY2xrICogMTYp
IC8gYmF1ZCAtIGRpdiAqIDE2OwotCi0JCWVzcDMyX3VhcnRfd3JpdGUocG9ydCwgVUFSVF9DTEtE
SVZfUkVHLAotCQkJCSBkaXYgfCBGSUVMRF9QUkVQKFVBUlRfQ0xLRElWX0ZSQUcsIGZyYWcpKTsK
LQkJcmV0dXJuIHRydWU7Ci0JfQorCWlmIChkaXYgPiBkaXZfbWFzaykKKwkJcmV0dXJuIGZhbHNl
OwogCi0JcmV0dXJuIGZhbHNlOworCWZyYWcgPSAoc2NsayAqIDE2KSAvIGJhdWQgLSBkaXYgKiAx
NjsKKwllc3AzMl91YXJ0X3dyaXRlKHBvcnQsIFVBUlRfQ0xLRElWX1JFRywKKwkJCSBkaXYgfCBG
SUVMRF9QUkVQKFVBUlRfQ0xLRElWX0ZSQUcsIGZyYWcpKTsKKwlyZXR1cm4gdHJ1ZTsKIH0KIAog
c3RhdGljIHZvaWQgZXNwMzJwNF91YXJ0X2xpbWl0X2JhdWRfcmF0ZShzdHJ1Y3Qga3Rlcm1pb3Mg
KnRlcm1pb3MsCkBAIC01MTQsMTAgKzUxNSwxMyBAQCBzdGF0aWMgdm9pZCBlc3AzMl91YXJ0X3Nl
dF90ZXJtaW9zKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQsCiAKIAl0ZXJtaW9zLT5jX2NmbGFnICY9
IH5DTVNQQVI7CiAKLQlpZiAocG9ydF92YXJpYW50KHBvcnQpLT5oYXNfY2xrY29uZikKLQkJbWF4
X2RpdiAqPSBGSUVMRF9NQVgoRVNQMzJTM19VQVJUX1NDTEtfRElWX05VTSk7CisJaWYgKHBvcnRf
dmFyaWFudChwb3J0KS0+aGFzX2Nsa2NvbmYpIHsKKwkJbWF4X2RpdiAqPSBGSUVMRF9NQVgoRVNQ
MzJTM19VQVJUX1NDTEtfRElWX05VTSkgKyAxOworCQltaW5fYmF1ZCA9IERJVl9ST1VORF9VUChw
b3J0LT51YXJ0Y2xrLCBtYXhfZGl2KTsKKwl9IGVsc2UgeworCQltaW5fYmF1ZCA9IHBvcnQtPnVh
cnRjbGsgLyBtYXhfZGl2OworCX0KIAotCW1pbl9iYXVkID0gcG9ydC0+dWFydGNsayAvIG1heF9k
aXY7CiAJbWF4X2JhdWQgPSBwb3J0LT51YXJ0Y2xrIC8gMTY7CiAJaWYgKHBvcnRfdmFyaWFudChw
b3J0KSA9PSAmZXNwMzJwNF92YXJpYW50KQogCQllc3AzMnA0X3VhcnRfbGltaXRfYmF1ZF9yYXRl
KHRlcm1pb3MsIG9sZCwgbWluX2JhdWQsIG1heF9iYXVkKTsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
