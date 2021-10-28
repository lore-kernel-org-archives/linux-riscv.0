Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FDDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1EBE60E8C
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1EBE60E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7FBofelty/qq32cKF6CssX/tKN6DC1VMVL1Xr1PWcE=; b=TX2mx2idBTW6lQ
	SC/L9Lfz42dolAADxvLpc3A/9cNupB8e9ThBHtyLNL/58Xm84+OXYjw0Jz/V2u76LQLSMNx3rKGpK
	/pc0PLaDtmltd7GmzUktpFQUDR5+nONS01pESjdHotwbNpbSSQyiCXUfmicgpCblRHDc2dFK+GF4m
	9vKRRBOeXjip/fz/BaAI8uew0wiZCJaJ5tRH3GVwGmCCW8oTZv2/Z4b5jCPJ9h+NIdihoFjoxmbw9
	kIr+mLPTsQ4eIJAoJ8vIMMlNjqT8q0wOfOATRTFW9OLM2ig1KV5aSBySkxMlaegbRR81qiwjH04l4
	vlY+5x+4/7ptCVb//3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7zi-008Wmt-Py; Thu, 28 Oct 2021 16:11:10 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7zf-008Wjn-DC
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 16:11:08 +0000
Received: by mail-lj1-f175.google.com with SMTP id h11so11670490ljk.1
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 09:11:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O/AJBEW3vyVrTUMTRP/ONhgseLgot5lKkfZZ3GS+nfA=;
 b=VL4dM1/DUM//b6LpYqYlFsQsbuCUp07Ez2eVyDtniyFLnGjSJt/gJ/eDxtbWjwbHZW
 4Zp9q4iSdQsJg6ksfJRs5SC/TaQUrlirofxNgfdhJSp4DH/NLgGxjv2xKhJ6csEoZ+TJ
 iUW2KgWHieoongPOAEw7rMF6i4nWFq56Ly2N97+EC9CheWar0+v1wX1XrT0Lbq/4edOO
 votnwbIvalir9rHKoVRxLhCxUvKcQLFvq8dmd7RG6TeIXacOO/fQPZU+WKdfpFAc4Y6v
 xU0MsjSxAN590acnIx0xB8m/+qgaR2yerUwmWmEjpKF7OV1ldlMwXaWsvPdtoIeifc7x
 Q4xA==
X-Gm-Message-State: AOAM532NI9zRECnSONoNCI/e9gFUIdeL2HiI6QGHq6JfNC/cMKMoLAgz
 OJ9rTI+L90czj5ndPe4qNac=
X-Google-Smtp-Source: ABdhPJwOcY43NhUimT65dqUn5i4ibaVElLDvmVmk/6S/JSjYT0ktZxz3YwxE28cPmSRryVx3sGI3mw==
X-Received: by 2002:a2e:a7c7:: with SMTP id x7mr5647795ljp.8.1635437465726;
 Thu, 28 Oct 2021 09:11:05 -0700 (PDT)
Received: from kladdkakan.. ([193.138.218.162])
 by smtp.gmail.com with ESMTPSA id o17sm49680lfo.176.2021.10.28.09.11.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:11:04 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 luke.r.nels@gmail.com, xi.wang@gmail.com, linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next v2 1/4] riscv,
 bpf: Increase the maximum number of iterations
Date: Thu, 28 Oct 2021 18:10:54 +0200
Message-Id: <20211028161057.520552-2-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028161057.520552-1-bjorn@kernel.org>
References: <20211028161057.520552-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_091107_470987_49688CEF 
X-CRM114-Status: GOOD (  10.38  )
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

Tm93IHRoYXQgQlBGIHByb2dyYW1zIGNhbiBiZSB1cCB0byAxTSBpbnN0cnVjdGlvbnMsIGl0IGlz
IG5vdCB1bmNvbW1vbgp0aGF0IGEgcHJvZ3JhbSByZXF1aXJlcyBtb3JlIHRoYW4gdGhlIGN1cnJl
bnQgMTYgaXRlcmF0aW9ucyB0bwpjb252ZXJnZS4KCkJ1bXAgaXQgdG8gMzIsIHdoaWNoIGlzIGVu
b3VnaCBmb3Igc2VsZnRlc3RzL2JwZiwgYW5kIHRlc3RfYnBmLmtvLgoKU2lnbmVkLW9mZi1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KLS0tCiBhcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvcmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jIGIvYXJj
aC9yaXNjdi9uZXQvYnBmX2ppdF9jb3JlLmMKaW5kZXggN2NjYzgwOWYyYzE5Li5lZjlmY2Y2ZWE3
NDkgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jCisrKyBiL2FyY2gv
cmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jCkBAIC0xMSw3ICsxMSw3IEBACiAjaW5jbHVkZSAiYnBm
X2ppdC5oIgogCiAvKiBOdW1iZXIgb2YgaXRlcmF0aW9ucyB0byB0cnkgdW50aWwgb2Zmc2V0cyBj
b252ZXJnZS4gKi8KLSNkZWZpbmUgTlJfSklUX0lURVJBVElPTlMJMTYKKyNkZWZpbmUgTlJfSklU
X0lURVJBVElPTlMJMzIKIAogc3RhdGljIGludCBidWlsZF9ib2R5KHN0cnVjdCBydl9qaXRfY29u
dGV4dCAqY3R4LCBib29sIGV4dHJhX3Bhc3MsIGludCAqb2Zmc2V0KQogewotLSAKMi4zMi4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
